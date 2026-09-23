import 'dart:async';
import 'dart:convert';

import 'serialization_util.dart';

import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../index.dart';
import '../../main.dart';

final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    await _handlePushNotificationData(message.data);
  }

  Future _handlePushNotificationData(Map<String, dynamic> messageData) async {
    safeSetState(() => _loading = true);
    try {
      final type = messageData['type']?.toString() ?? '';
      if (type == 'match_found') {
        final handshakeID = messageData['handshakeID']?.toString() ?? '';
        final slotFolder = messageData['slotFolder']?.toString() ?? '';
        final pUid = messageData['p_uid']?.toString() ?? '';
        FFAppState().update(() {
          FFAppState().fcmHandShake = handshakeID;
          FFAppState().fcmSlotID = slotFolder;
          FFAppState().fcmNavigated = true;
          FFAppState().partnerData = PartnerDataStruct(
            pUid: pUid.isNotEmpty
                ? FirebaseFirestore.instance.doc('users/$pUid')
                : null,
            pName: messageData['p_name']?.toString() ?? '',
            pPhoto: messageData['p_photo']?.toString() ?? '',
            pAge: messageData['p_age']?.toString() ?? '',
            pScore: messageData['p_score']?.toString() ?? '',
            pStat: messageData['stat']?.toString() ?? '',
          );
        });
        if (handshakeID.isNotEmpty) {
          final navContext =
              mounted ? context : appNavigatorKey.currentContext;
          navContext?.pushNamed(
            HandshakePageWidget.routeName,
            queryParameters: {
              'handshakeID': handshakeID,
              'slotFolder': slotFolder,
            },
            extra: {
              'handshakeID': handshakeID,
              'slotFolder': slotFolder,
            },
          );
        }
        return;
      }
      final initialPageName = messageData['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(messageData);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        if (mounted) {
          context.pushNamed(
            initialPageName,
            pathParameters: parameterData.pathParameters,
            extra: parameterData.extra,
          );
        } else {
          appNavigatorKey.currentContext?.pushNamed(
            initialPageName,
            pathParameters: parameterData.pathParameters,
            extra: parameterData.extra,
          );
        }
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      safeSetState(() => _loading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      handleOpenedPushNotification();
    });
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: Colors.transparent,
          child: Center(
            child: Image.asset(
              'assets/images/ic_launcher_foreground.png',
              width: 150.0,
              height: 150.0,
              fit: BoxFit.contain,
            ),
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'splash': ParameterData.none(),
  'Billing': ParameterData.none(),
  'Security': ParameterData.none(),
  'Settings': ParameterData.none(),
  'Vibes': ParameterData.none(),
  'RevealOption': (data) async => ParameterData(
        allParams: {
          'chatID': getParameter<String>(data, 'chatID'),
          'requestId': getParameter<String>(data, 'requestId'),
          'incomingDocId': getParameter<String>(data, 'incomingDocId'),
          'senderUid': getParameter<String>(data, 'senderUid'),
        },
      ),
  'UserPersona': ParameterData.none(),
  'Report': (data) async => ParameterData(
        allParams: {
          'chatId': getParameter<String>(data, 'chatId'),
        },
      ),
  'CoinShop': ParameterData.none(),
  'ActiveChat': (data) async => ParameterData(
        allParams: {
          'chatID': getParameter<String>(data, 'chatID'),
          'iceBreakers': getParameter<String>(data, 'iceBreakers'),
          'endTime': getParameter<int>(data, 'endTime'),
        },
      ),
  'mobile_entry': ParameterData.none(),
  'country_selectionOld': ParameterData.none(),
  'OTPScreen': ParameterData.none(),
  'dashboard': ParameterData.none(),
  'onboarding': (data) async => ParameterData(
        allParams: {
          'userLocation': getParameter<String>(data, 'userLocation'),
        },
      ),
  'IcebreakersOld': (data) async => ParameterData(
        allParams: {
          'chatID': getParameter<String>(data, 'chatID'),
        },
      ),
  'ExtendScreenOld': ParameterData.none(),
  'discoverySettingsOld': ParameterData.none(),
  'mapPage': ParameterData.none(),
  'AdMobPage': ParameterData.none(),
  'SlotSelection': ParameterData.none(),
  'HandshakePage': (data) async => ParameterData(
        allParams: {
          'handshakeID': getParameter<String>(data, 'handshakeID'),
          'slotFolder': getParameter<String>(data, 'slotFolder'),
        },
      ),
  'ChatWaitPage': (data) async => ParameterData(
        allParams: {
          'handShakeID': getParameter<String>(data, 'handShakeID'),
          'slotFolder': getParameter<String>(data, 'slotFolder'),
        },
      ),
  'ChatRejectPageOld': ParameterData.none(),
  'PersonaUpdatePage': (data) async => ParameterData(
        allParams: {
          'handShakeID': getParameter<String>(data, 'handShakeID'),
          'slotFolder': getParameter<String>(data, 'slotFolder'),
        },
      ),
  'waitPage': ParameterData.none(),
  'ActiveChatPage': (data) async => ParameterData(
        allParams: {
          'chatID': getParameter<String>(data, 'chatID'),
          'iceBreakers': getParameter<String>(data, 'iceBreakers'),
          'endTime': getParameter<int>(data, 'endTime'),
        },
      ),
  'PublicPersona': (data) async => ParameterData(
        allParams: {
          'partnerId': getParameter<String>(data, 'partnerId'),
        },
      ),
  'postChatScreen': (data) async => ParameterData(
        allParams: {
          'survey': getParameter<bool>(data, 'survey'),
          'chatID': getParameter<String>(data, 'chatID'),
        },
      ),
  'updateProfile': (data) async => ParameterData(
        allParams: {
          'userLocation': getParameter<String>(data, 'userLocation'),
        },
      ),
  'socialPage': (data) async => ParameterData(
        allParams: {
          'userLocation': getParameter<String>(data, 'userLocation'),
        },
      ),
  'updateSocialPage': (data) async => ParameterData(
        allParams: {
          'userLocation': getParameter<String>(data, 'userLocation'),
        },
      ),
  'VerifyIntro': ParameterData.none(),
  'VerifyConfirm': ParameterData.none(),
  'VerificationSuccessful': ParameterData.none(),
  'changeMobileOTP': (data) async => ParameterData(
        allParams: {
          'verificationId': getParameter<String>(data, 'verificationId'),
        },
      ),
  'changeMobile': ParameterData.none(),
  'PermChatPage': (data) async => ParameterData(
        allParams: {
          'chatID': getParameter<String>(data, 'chatID'),
          'partnerName': getParameter<String>(data, 'partnerName'),
          'partnerAge': getParameter<int>(data, 'partnerAge'),
          'partnerGender': getParameter<String>(data, 'partnerGender'),
          'partnerPhoto': getParameter<String>(data, 'partnerPhoto'),
        },
      ),
  'waitPageCopy': ParameterData.none(),
  'waitPageCopy2': ParameterData.none(),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
