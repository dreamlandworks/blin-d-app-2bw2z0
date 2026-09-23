// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_util.dart';
// Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
// Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '/components/chat_bubble_widget.dart';
import '/components/chat_bubble_me_widget.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HiveChatList extends StatefulWidget {
  const HiveChatList({
    super.key,
    this.width,
    this.height,
    required this.chatID,
    required this.isScrubbedView,
  });

  final double? width;
  final double? height;
  final String chatID;
  final bool isScrubbedView;

  @override
  HiveChatListState createState() => HiveChatListState();
}

class HiveChatListState extends State<HiveChatList>
    with WidgetsBindingObserver {
  late final String boxName;
  late final Future<Box> _boxFuture;
  int _lastSyncedTs = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    boxName = widget.isScrubbedView
        ? 'userChats_${widget.chatID}_scrubbed'
        : 'userChats_${widget.chatID}_original';
    _boxFuture = Hive.openBox(boxName);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      final partnerUid = FFAppState().partnerData.pUid?.id ?? '';
      if (partnerUid.isNotEmpty) {
        setupFeelingListener(widget.chatID, partnerUid);
      }
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  void _syncLatestPartnerMessage(List<Map> messages, String myUid) {
    Map? partnerLatestMsg;
    for (final msg in messages) {
      final String senderId = msg['senderId']?.toString() ?? '';
      if (senderId.isNotEmpty && senderId != myUid) {
        partnerLatestMsg = msg;
        break;
      }
    }

    if (partnerLatestMsg == null) return;

    final int ts = partnerLatestMsg['ts'] is int ? partnerLatestMsg['ts'] : 0;
    final String msgText = partnerLatestMsg['msg']?.toString() ?? '';

    if (ts > 0 && ts != _lastSyncedTs && msgText != FFAppState().lastPartnerMessage) {
      _lastSyncedTs = ts;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        if (FFAppState().lastPartnerMessage == msgText) return;
        FFAppState().update(() {
          FFAppState().lastPartnerMessage = msgText;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final String myUid = FirebaseAuth.instance.currentUser?.uid ?? '';

    return FutureBuilder<Box>(
      future: _boxFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError || !snapshot.hasData) {
          return Center(child: Text("Error: ${snapshot.error}"));
        }

        final box = snapshot.data!;

        return ValueListenableBuilder(
          valueListenable: box.listenable(),
          builder: (context, Box liveBox, _) {
            final messages = liveBox.values
                .whereType<Map>()
                .map((m) => Map<String, dynamic>.from(m))
                .toList();
            messages.sort((a, b) {
              final int tsA = int.tryParse(a['ts']?.toString() ?? '') ?? 0;
              final int tsB = int.tryParse(b['ts']?.toString() ?? '') ?? 0;
              return tsB.compareTo(tsA);
            });

            if (messages.isNotEmpty) {
              _syncLatestPartnerMessage(messages, myUid);
            }

            if (messages.isEmpty) {
              return const Center(child: Text("No messages yet. Say hi!"));
            }

            return ListView.builder(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
              reverse: true,
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final Map<String, dynamic> msgData = messages[index];
                final String senderId = msgData['senderId']?.toString() ?? '';
                final bool isMe = senderId == myUid;
                final int ts = int.tryParse(msgData['ts']?.toString() ?? '') ?? 0;
                final String formattedTime = ts > 1000000000000
                    ? DateFormat('hh:mm a').format(
                        DateTime.fromMillisecondsSinceEpoch(ts),
                      )
                    : '';
                return Align(
                  alignment:
                      isMe ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    constraints: BoxConstraints(
                      maxWidth: screenWidth * 0.75,
                    ),
                    margin: const EdgeInsets.symmetric(vertical: 5.0),
                    child: isMe
                        ? ChatBubbleMeWidget(
                            message: msgData['msg']?.toString() ?? '',
                            time: formattedTime,
                          )
                        : ChatBubbleWidget(
                            message: msgData['msg']?.toString() ?? '',
                            time: formattedTime,
                          ),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
