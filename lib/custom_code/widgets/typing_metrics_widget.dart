// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_util.dart';
// Imports other custom widgets
// Imports custom actions
// Imports custom functions
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';

// Imports other custom widgets
// Imports custom actions
// Imports custom functions

class TypingMetricsWidget extends StatefulWidget {
  const TypingMetricsWidget({
    super.key,
    this.width,
    this.height,
    this.hintText,
    this.iceBreaker,
    required this.onSendMessage,
    this.gradientColor1,
    this.gradientColor2,
    this.iconColor,
    this.fontSize,
    this.leftIcon,
    this.chatID,
  });

  final double? width;
  final double? height;
  final String? hintText;
  final String? iceBreaker;
  final String? chatID;
  final Future Function(String text, dynamic metricsJson) onSendMessage;
  final String? gradientColor1;
  final String? gradientColor2;
  final Color? iconColor;
  final double? fontSize;
  final Widget? leftIcon; // ✅ new

  @override
  State<TypingMetricsWidget> createState() => _TypingMetricsWidgetState();
}

class _TypingMetricsWidgetState extends State<TypingMetricsWidget> {
  late TextEditingController _controller;
  final FocusNode _focusNode = FocusNode();

  DateTime? _focusTime;
  DateTime? _lastChangeTime;
  int _initLatency = 0;
  int _midLatency = 0;
  int _hesitationCount = 0;
  int _backspaceCount = 0;
  int _lastLength = 0;
  bool _isFirstChar = true;
  bool _isSecondChar = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(
      text: widget.iceBreaker ?? '',
    );
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void didUpdateWidget(TypingMetricsWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    final ice = widget.iceBreaker ?? '';
    final oldIce = oldWidget.iceBreaker ?? '';
    if (ice.isNotEmpty && ice != oldIce && ice != _controller.text) {
      _controller.text = ice;
      _controller.selection = TextSelection.collapsed(offset: ice.length);
    } else if (ice.isEmpty && oldIce.isNotEmpty) {
      _controller.clear();
    }
  }

  Color _colorFromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  void _onFocusChange() {
    if (_focusNode.hasFocus && _focusTime == null) {
      _focusTime = DateTime.now();
    }
  }

  void _handleOnChange(String val) {
    DateTime now = DateTime.now();
    _focusTime ??= now;

    if (_isFirstChar && val.isNotEmpty) {
      _initLatency = now.difference(_focusTime!).inMilliseconds;
      _isFirstChar = false;
      _isSecondChar = true;
    } else if (_isSecondChar && val.length > _lastLength) {
      _midLatency = now.difference(_lastChangeTime ?? now).inMilliseconds;
      _isSecondChar = false;
    }

    if (_lastChangeTime != null &&
        now.difference(_lastChangeTime!).inMilliseconds > 1500) {
      _hesitationCount++;
    }

    if (val.length < _lastLength) {
      _backspaceCount += (_lastLength - val.length);
    }

    _lastLength = val.length;
    _lastChangeTime = now;
  }

  Future<void> _submit() async {
    String finalRead = _controller.text.trim();
    if (finalRead.isEmpty) return;

    DateTime now = DateTime.now();
    int totalTimeMs = now.difference(_focusTime ?? now).inMilliseconds;
    double speed = totalTimeMs > 0
        ? (finalRead.length / (totalTimeMs / 1000)).toPrecision(2)
        : 0.0;

    var metrics = {
      'init_l': _initLatency,
      'mid_l': _midLatency,
      'hes': _hesitationCount,
      'bk': _backspaceCount,
      'len': finalRead.length,
      'spd': speed,
    };

    // ✅ Convert to JSON string
    final metricsJson = jsonEncode(metrics);

    FFAppState().update(() {
      FFAppState().iceBreaker = '';
    });
    await widget.onSendMessage(finalRead, metricsJson);

    if (!mounted) return;
    _controller.clear();
    _lastLength = 0;
    _isFirstChar = true;
    _isSecondChar = false;
    _initLatency = 0;
    _midLatency = 0;
    _hesitationCount = 0;
    _backspaceCount = 0;
    _focusTime = null;
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    final ice = FFAppState().iceBreaker;
    if (ice.isNotEmpty && ice != _controller.text && ice != widget.hintText) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        final latest = FFAppState().iceBreaker.trim();
        if (latest.isEmpty || latest == _controller.text) return;
        _controller.text = latest;
        _controller.selection = TextSelection.collapsed(offset: latest.length);
        FFAppState().update(() {
          FFAppState().iceBreaker = '';
        });
      });
    }
    return Container(
      width: widget.width,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.grey.shade200, // background bar color
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Left icon (optional)
          if (widget.leftIcon != null)
            Padding(
              padding: const EdgeInsets.only(right: 10), // ✅ 10px spacing
              child: GestureDetector(
                onTap: () {
                  // Leave empty — FlutterFlow will inject the action here
                  // // Navigate to Icebreakers screen
                  context.pushNamed(
                    'Icebreakers',
                    queryParameters: {
                      'chatID': widget.chatID, // ✅ pass it here
                    },
                  );
                },
                child: widget.leftIcon!, // ✅ wrapped correctly
              ),
            ),

          // Text field
          Expanded(
            child: TextField(
              controller: _controller,
              focusNode: _focusNode,
              onChanged: _handleOnChange,
              minLines: 1,
              maxLines: 5,
              keyboardType: TextInputType.multiline,
              style: TextStyle(
                fontSize: widget.fontSize ?? 16,
                color: Colors.black87,
              ),
              decoration: InputDecoration(
                hintText: widget.hintText ?? 'Type message..',
                hintStyle: const TextStyle(color: Colors.grey),
                border: InputBorder.none,
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 0,
                ),
              ),
            ),
          ),

          // Send button
          InkWell(
            onTap: _submit,
            borderRadius: BorderRadius.circular(30),
            child: Container(
              margin:
                  const EdgeInsets.only(left: 8), // ✅ spacing from text field
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    _colorFromHex(widget.gradientColor1 ?? '#6B429F'),
                    _colorFromHex(widget.gradientColor2 ?? '#8D367F'),
                  ],
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Icon(
                Icons.send_rounded,
                color: widget.iconColor ?? Colors.white,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

extension DoubleExtension on double {
  double toPrecision(int n) => double.parse(toStringAsFixed(n));
}
