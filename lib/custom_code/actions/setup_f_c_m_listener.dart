// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
// Imports other custom actions
// Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter/foundation.dart';

// Imports other custom actions
// Imports custom functions

// Imports other custom actions
// Imports custom functions

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/custom_code/actions/mirror_matching_data_to_r_t_d_b.dart';
import '/custom_code/actions/call_handshake_action.dart';
import '/custom_code/actions/rtdb_now_ms.dart';
import '/components/success_extend_sheet_widget.dart';
import '/components/accept_reveal_sheet_widget.dart';
import '/components/reject_reveal_sheet_widget.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'dart:ui' as ui;

bool fcmListenerStarted = false;
final List<StreamSubscription<dynamic>> fcmSubscriptions = [];

Future persistFcmToken(String token) async {
  final userDoc = currentUserReference;
  if (userDoc == null || token.isEmpty) return;
  await upsertRotatedFcmToken(userDoc, token);
}

Future<NotificationSettings>? _fcmPermissionInFlight;

Future<void> _ensureFcmPermission() async {
  if (kIsWeb) return;
  final messaging = FirebaseMessaging.instance;
  try {
    final current = await messaging.getNotificationSettings();
    if (current.authorizationStatus != AuthorizationStatus.notDetermined) {
      return;
    }
  } catch (_) {}

  if (_fcmPermissionInFlight != null) {
    await _fcmPermissionInFlight;
    return;
  }

  final pending = messaging.requestPermission(
    alert: true,
    badge: true,
    sound: true,
    announcement: true,
  );
  _fcmPermissionInFlight = pending;
  try {
    await pending;
  } catch (e) {
    if (kDebugMode) {
      print('FCM requestPermission skipped: $e');
    }
  } finally {
    _fcmPermissionInFlight = null;
  }
}

Future<String?> _getFcmTokenWithRetry() async {
  final messaging = FirebaseMessaging.instance;
  if (defaultTargetPlatform == TargetPlatform.iOS) {
    try {
      await messaging.getAPNSToken();
    } catch (_) {}
  }
  String? token;
  for (var i = 0; i < 5; i++) {
    try {
      token = await messaging.getToken();
    } catch (e) {
      if (kDebugMode) {
        print('FCM getToken try ${i + 1}: $e');
      }
    }
    if (token != null && token.isNotEmpty) return token;
    await Future.delayed(Duration(milliseconds: 700 * (i + 1)));
  }
  return token;
}

Future<void> _persistCurrentFcmToken() async {
  if (kIsWeb) return;
  try {
    await _ensureFcmPermission();
    final token = await _getFcmTokenWithRetry();
    if (token != null && token.isNotEmpty) {
      await persistFcmToken(token);
    } else if (kDebugMode) {
      print('FCM persist skipped: no token after retries');
    }
  } catch (e) {
    if (kDebugMode) {
      print('FCM persist current token error: $e');
    }
  }
}

/// ── CLOSE ANY OPEN BOTTOM SHEET ──────────────────────────────────────────
/// Heuristic: bottom sheets have no route name, pages do. Only pops if the
/// current top route is unnamed, so it won't accidentally pop a real page.
void _closeExistingSheets(BuildContext context) {
  try {
    final navigator = Navigator.of(context, rootNavigator: true);
    final currentRoute = ModalRoute.of(context);
    if (navigator.canPop() && currentRoute?.settings.name == null) {
      navigator.pop();
    }
  } catch (e) {
    if (kDebugMode) {
      print("FCM: _closeExistingSheets error: $e");
    }
  }
}

void _playIncomingAlert() {
  try {
    SystemSound.play(SystemSoundType.alert);
    HapticFeedback.mediumImpact();
  } catch (_) {}
}

String? _openedHandshakeId;

List<String> _asStringList(dynamic value) {
  if (value == null) return [];
  if (value is List) {
    return value.map((e) => e.toString()).where((e) => e.isNotEmpty).toList();
  }
  if (value is String && value.isNotEmpty) {
    try {
      final decoded = jsonDecode(value);
      if (decoded is List) {
        return decoded
            .map((e) => e.toString())
            .where((e) => e.isNotEmpty)
            .toList();
      }
    } catch (_) {}
    return value == '[]' ? [] : [value];
  }
  return [];
}

BuildContext? _navContext() {
  final ctx = appNavigatorKey.currentContext;
  if (ctx != null && ctx.mounted) return ctx;
  return null;
}

BuildContext? _liveContext(BuildContext fallback) {
  if (fallback.mounted) return fallback;
  return _navContext();
}

void _openHandshakePage(String handshakeID, String slotFolder) {
  final id = handshakeID.trim();
  final folder = slotFolder.trim();
  if (id.isEmpty || folder.isEmpty) {
    if (kDebugMode) {
      print('FCM: HandshakePage skipped, handshakeID or slotFolder empty');
    }
    return;
  }
  if (_openedHandshakeId == id) return;
  _openedHandshakeId = id;
  Future.delayed(const Duration(seconds: 3), () {
    if (_openedHandshakeId == id) {
      _openedHandshakeId = null;
    }
  });

  void go() {
    final ctx = _navContext();
    if (ctx == null) {
      _openedHandshakeId = null;
      if (kDebugMode) {
        print('FCM: navigator not ready, HandshakePage skipped');
      }
      return;
    }
    ctx.goNamed(
      'HandshakePage',
      queryParameters: {
        'handshakeID': id,
        'slotFolder': folder,
      },
      extra: {
        'handshakeID': id,
        'slotFolder': folder,
      },
    );
  }

  final ctx = _navContext();
  if (ctx != null) {
    go();
    return;
  }
  WidgetsBinding.instance.addPostFrameCallback((_) => go());
}

/// ── MASTER DATA ROUTING ENGINE ───────────────────────────────────────────
void _handleIncomingPayload(
    BuildContext context, Map<String, dynamic>? data, String lifecycleState) {
  if (data == null || data['type'] == null) {
    if (kDebugMode) {
      print(
          "FCM Gateway [$lifecycleState]: Payload dropped due to missing 'type' key.");
    }
    return;
  }

  final String type = data['type'].toString();
  final String action = data['action']?.toString() ?? '';
  if (kDebugMode) {
    print(
        "FCM Gateway [$lifecycleState]: Intercepted Intent: $type | Action: $action");
  }

  final nav = _liveContext(context);
  if (nav == null && type != 'match_found' && type != 'handshake_accepted') {
    if (kDebugMode) {
      print("FCM Gateway [$lifecycleState]: Context not mounted, aborting.");
    }
    return;
  }

  switch (type) {
    // 1. MATCH FOUND
    case 'match_found':
      _storeInAppState(data);
      _openHandshakePage(
        data['handshakeID']?.toString() ?? FFAppState().fcmHandShake,
        data['slotFolder']?.toString() ?? FFAppState().fcmSlotID,
      );
      break;

    // 2. HANDSHAKE CANCELLED
    case 'handshake_cancelled':
      nav?.pushNamed('ChatRejectPage');
      break;
    // 2b. HANDSHAKE ACCEPTED — waiting partner only; second clicker already
    // navigates from HandshakePage. Never use a stale WaitPage context.
    case 'handshake_accepted':
      final String chatID = data['chatID']?.toString() ?? '';
      if (chatID.isEmpty || chatID == 'null') {
        if (kDebugMode) {
          print("FCM handshake_accepted: chatID missing. Aborting.");
        }
        break;
      }

      final int endTimeVal = data['endTime'] is int
          ? data['endTime'] as int
          : int.tryParse(data['endTime']?.toString() ?? '') ?? 0;
      final int durationMs = data['durationMs'] is int
          ? data['durationMs'] as int
          : int.tryParse(data['durationMs']?.toString() ?? '') ?? 0;
      final iceBreakers = data['iceBreakers']?.toString();

      applyHandshakeChatState(data);

      final dynamic historyData = data['history'];
      String? latestSummary;
      String? lastMatchedTimeAgo;
      bool isRematch = false;

      if (historyData != null) {
        try {
          final decoded = historyData is String
              ? jsonDecode(historyData)
              : historyData;
          if (decoded is Map) {
            final historyMap = <String, dynamic>{};
            decoded.forEach((key, val) {
              historyMap[key.toString()] = val;
            });
            final bool hasHistory = historyMap['hasHistory'] == true ||
                historyMap['hasHistory']?.toString() == 'true';
            if (hasHistory) {
              isRematch = true;
              latestSummary = historyMap['latestSummary']?.toString();
              lastMatchedTimeAgo = historyMap['lastMatchedTimeAgo']?.toString();
            }
          }
        } catch (e) {
          if (kDebugMode) {
            print(
                "FCM handshake_accepted: Failed to parse history payload — $e");
          }
        }
      }

      final chatNav = nav ?? _navContext();
      if (chatNav == null) {
        break;
      }
      _closeExistingSheets(chatNav);

      try {
        if (isRematch && latestSummary != null && latestSummary.isNotEmpty) {
          chatNav.goNamed(
            'HistoryExist',
            queryParameters: {
              'chatID': serializeParam(chatID, ParamType.String),
              'endTime': serializeParam(
                endTimeVal > 1000000000000
                    ? endTimeVal
                    : (durationMs > 0
                        ? durationMs
                        : FFAppState().endTime),
                ParamType.int,
              ),
              'latestSummary': serializeParam(latestSummary, ParamType.String),
              'lastMatchedTime':
                  serializeParam(lastMatchedTimeAgo, ParamType.String)
            }.withoutNulls,
          );
        } else {
          chatNav.goNamed(
            'ActiveChatPage',
            queryParameters: {
              'chatID': serializeParam(chatID, ParamType.String),
              if (endTimeVal > 0)
                'endTime': serializeParam(endTimeVal, ParamType.int),
              if (iceBreakers != null &&
                  iceBreakers.isNotEmpty &&
                  iceBreakers != 'null')
                'iceBreakers': serializeParam(iceBreakers, ParamType.String),
            }.withoutNulls,
          );
        }
      } catch (e) {
        if (kDebugMode) {
          print("FCM handshake_accepted nav error: $e");
        }
      }
      break;

    // 3. CHAT EXTENSION
    case 'extend_request':
    case 'chat_extended':
      final int newEndTime = data['newEndTime'] is int
          ? data['newEndTime'] as int
          : int.tryParse(data['newEndTime']?.toString() ?? '') ?? 0;
      applyChatEndTime(newEndTime);
      if (kDebugMode) {
        print(
            '🔔 Extension applied. chatEndTime=${FFAppState().chatEndTime} remaining=${FFAppState().endTime}');
      }

      if (action == 'success_payer' || action == 'success_partner') {
        _closeExistingSheets(context);
        showModalBottomSheet(
          context: context,
          backgroundColor: Colors.transparent,
          isScrollControlled: true,
          builder: (context) => const SuccessExtendSheetWidget(),
        );
      }
      break;

    // 4. REVEAL REQUEST
    case 'reveal_request':
      if (action == 'waiting') {
        final String chatId =
            (data['chatId'] ?? data['chatID'])?.toString() ?? '';
        final String? requestId = data['requestId']?.toString();
        final String? incomingDocId = data['incomingDocId']?.toString();
        final String? senderUid = data['senderUid']?.toString();
        final chatNav = nav ?? _navContext();
        if (chatNav == null) {
          break;
        }
        _closeExistingSheets(chatNav);
        chatNav.pushNamed(
          'RevealOption',
          queryParameters: {
            'chatID': serializeParam(chatId, ParamType.String),
            'requestId': serializeParam(requestId, ParamType.String),
            'incomingDocId': serializeParam(incomingDocId, ParamType.String),
            'senderUid': serializeParam(senderUid, ParamType.String)
          }.withoutNulls,
        );
      } else if (action == 'accepted') {
        final chatNav = nav ?? _navContext();
        if (chatNav == null) {
          break;
        }
        _closeExistingSheets(chatNav);
        showModalBottomSheet(
          context: chatNav,
          backgroundColor: Colors.transparent,
          isScrollControlled: true,
          isDismissible: false,
          builder: (ctx) => AcceptRevealSheetWidget(
              partnerUid: data['senderUid']?.toString() ?? '',
              chatId: (data['chatId'] ?? data['chatID'])?.toString() ?? '',
              fields: _asStringList(data['fields'])),
        );
      } else if (action == 'rejected') {
        final chatNav = nav ?? _navContext();
        if (chatNav == null) {
          break;
        }
        _closeExistingSheets(chatNav);
        showModalBottomSheet(
          context: chatNav,
          backgroundColor: Colors.transparent,
          isScrollControlled: true,
          builder: (ctx) => const RejectRevealSheetWidget(),
        );
      }
      break;

    // 5. CHAT SUMMARY
    case 'chat_summary':
      _storeInAppState(data);
      FFAppState().update(() {
        FFAppState().chatStats = ChatStatsStruct(
          matchScore: int.tryParse(data['matchScore'] ?? '') ?? 0,
          msgCountMe: int.tryParse(data['myMessages'] ?? '') ?? 0,
          msgCountPartner: int.tryParse(data['partnerMessages'] ?? '') ?? 0,
          msgCountAll: int.tryParse(data['totalMessages'] ?? '') ?? 0,
          isRevealed: (data['isRevealed'] ?? 'false') == 'true',
        );
      });

      break;
    // 1. REPORT SUBMITTED (Reporter Confirmation)
    case 'report_submitted':
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
              "Your report has been sent. Our moderators will review soon."),
          duration: Duration(seconds: 3),
        ),
      );

      // Close any active dialogs/bottomsheets and navigate away from ActiveChatPage
      _closeExistingSheets(context);
      if (context.mounted) {
        context.pushNamed('waitPage');
      }
      break;

    // 2. CHAT FORCE CLOSED (Reported Partner Disconnection)
    case 'chat_force_closed':
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Due to a technical issue, your chat has been closed."),
          duration: Duration(seconds: 3),
        ),
      );
      FFAppState().update(() {
        FFAppState().updateOnReadyStruct((s) {
          s.readyStatus = 'cooldown';
          s.cooldownUntil = DateTime.now().millisecondsSinceEpoch +
              (FFAppState().isPremium ? 10800000 : 72000000);
        });
      });

      // Force navigate partner away from chat page cleanly
      _closeExistingSheets(context);
      if (context.mounted) {
        context.pushNamed('waitPage');
      }
      break;

    case 'perm_request':
      final String? chatId = data['chatId']?.toString();
      final String? partnerUid = data['partnerUid']?.toString();
      final String? senderName = data['senderName']?.toString();

      // Safely parse age string into an int
      final int? senderAge = data['senderAge'] != null
          ? int.tryParse(data['senderAge'].toString())
          : null;

      final String? senderGender = data['senderGender']?.toString();

      context.pushNamed(
        'PermRequestSheet',
        queryParameters: {
          'partnerName': serializeParam(senderName, ParamType.String),
          'partnerAge': serializeParam(senderAge, ParamType.int),
          'partnerGender': serializeParam(senderGender, ParamType.String),
          'chatId': serializeParam(chatId, ParamType.String),
          'partnerUid': serializeParam(partnerUid, ParamType.String),
        }.withoutNulls,
      );
      break; // Added missing break statement

    case 'perm_match':
      final String? chatId = data['chatId']?.toString();
      final String? partnerUid = data['partnerUid']?.toString();
      final String? senderName = data['senderName']?.toString();

      // Safely parse age string into an int
      final int? senderAge = data['senderAge'] != null
          ? int.tryParse(data['senderAge'].toString())
          : null;

      final String? senderGender = data['senderGender']?.toString();
      final String? senderPhoto = data['senderPhoto']?.toString();

      context.pushNamed(
        'permChatPage',
        queryParameters: {
          'partnerName': serializeParam(senderName, ParamType.String),
          'partnerAge': serializeParam(senderAge, ParamType.int),
          'partnerGender': serializeParam(senderGender, ParamType.String),
          'chatID': serializeParam(chatId, ParamType.String),
          'partnerUid': serializeParam(partnerUid, ParamType.String),
          'partnerPhoto': serializeParam(senderPhoto, ParamType.String)
        }.withoutNulls,
      );
      break; // Added missing break statement

    default:
      if (kDebugMode) {
        print(
            "FCM Gateway Warning: Dropped unsupported incoming payload type.");
      }
  }
}

/// ── PARTNER OBJECT STRUCT COMPILING ──────────────────────────────────────
void _storeInAppState(Map<String, dynamic> data) {
  if (data.isEmpty || data['type'] != 'match_found') return;

  final handshakeID = data['handshakeID']?.toString().trim() ?? '';
  final slotFolder = data['slotFolder']?.toString().trim() ?? '';
  FFAppState().fcmHandShake = handshakeID;
  FFAppState().fcmSlotID = slotFolder;
  FFAppState().fcmNavigated = true;
  FFAppState().fcmForeground = false;

  try {
    final pUid = data['p_uid']?.toString().trim() ?? '';
    DocumentReference? pUidRef;
    if (pUid.isNotEmpty) {
      pUidRef = FirebaseFirestore.instance.doc('users/$pUid');
    }

    FFAppState().update(() {
      FFAppState().partnerData = PartnerDataStruct(
        pUid: pUidRef,
        pName: data['p_name']?.toString() ?? '',
        pPhoto: data['p_photo']?.toString() ?? '',
        pAge: data['p_age']?.toString() ?? '',
        pGender: data['p_gender']?.toString() ?? '',
        pDesc: data['p_desc']?.toString() ?? '',
        pBio: data['p_bio']?.toString() ?? '',
        pInterests: _asStringList(data['p_interests']),
        pScore: data['p_score']?.toString() ?? '',
        pStat: data['stat']?.toString() ?? '',
        pIce: _asStringList(data['p_ice']),
      );
      FFAppState().fcmHandShake = handshakeID;
      FFAppState().fcmSlotID = slotFolder;
    });

    if (kDebugMode) {
      print("FCM: AppState updated. handshakeID=$handshakeID");
    }
  } catch (e) {
    if (kDebugMode) {
      print("FCM _storeInAppState error: $e");
    }
  }
}

/// ── SYSTEM STREAM LISTENER REGISTRATION ──────────────────────────────────
Future<bool> setupFCMListener(BuildContext context) async {
  try {
    if (fcmListenerStarted) {
      await _persistCurrentFcmToken();
      return true;
    }

    fcmListenerStarted = true;

    try {
      ui.channelBuffers.resize('flutter/lifecycle', 10);
    } catch (_) {}

    try {
      await ensureRtdbClock(FirebaseDatabase.instanceFor(
        app: Firebase.app(),
        databaseURL:
            'https://blindapp-489217-default-rtdb.asia-southeast1.firebasedatabase.app/',
      ));
    } catch (_) {}

    final messaging = FirebaseMessaging.instance;

    if (!kIsWeb) {
      await _ensureFcmPermission();
      try {
        await messaging.setForegroundNotificationPresentationOptions(
          alert: true,
          badge: true,
          sound: true,
        );
      } catch (_) {}
      await _persistCurrentFcmToken();
    }

    fcmSubscriptions.add(
      messaging.onTokenRefresh.listen((token) {
        persistFcmToken(token);
      }),
    );

    if (!kIsWeb) {
      await WidgetsBinding.instance.endOfFrame;
      try {
        final initialMessage = await messaging.getInitialMessage();
        if (initialMessage != null) {
          if (kDebugMode) {
            print("FCM: Terminated state message received");
          }
          await Future.delayed(const Duration(milliseconds: 400));
          _handleIncomingPayload(
            _navContext() ?? context,
            initialMessage.data,
            "TERMINATED",
          );
        }
      } catch (e) {
        if (kDebugMode) {
          print("FCM getInitialMessage error: $e");
        }
      }
    }

    fcmSubscriptions.add(
      FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
        if (kDebugMode) {
          print("FCM: Background state message received");
        }
        _handleIncomingPayload(
          _navContext() ?? context,
          message.data,
          "BACKGROUND",
        );
      }),
    );

    fcmSubscriptions.add(
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        if (kDebugMode) {
          print("FCM: Foreground message received: ${message.data['type']}");
        }

        final String type = message.data['type']?.toString() ?? '';
        final bool hasTrayNotification = message.notification != null;
        if (type.isNotEmpty &&
            (!kIsWeb &&
                (defaultTargetPlatform == TargetPlatform.android ||
                    !hasTrayNotification))) {
          _playIncomingAlert();
        }

        _handleIncomingPayload(
          _navContext() ?? context,
          message.data,
          "FOREGROUND",
        );
      }),
    );
  } catch (e) {
    if (kDebugMode) {
      print('setupFCMListener error: $e');
    }
  }
  return true;
}
