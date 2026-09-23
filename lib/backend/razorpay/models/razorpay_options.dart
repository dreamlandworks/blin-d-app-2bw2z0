import 'dart:convert';

Map<String, dynamic> _omitNulls(Map<String, dynamic> input) {
  final out = <String, dynamic>{};
  input.forEach((key, value) {
    if (value == null) return;
    if (value is Map<String, dynamic>) {
      final nested = _omitNulls(value);
      if (nested.isNotEmpty) out[key] = nested;
      return;
    }
    if (value is String && value.trim().isEmpty) return;
    out[key] = value;
  });
  return out;
}

String? razorpayThemeColor(String? color) {
  if (color == null) return null;
  var hex = color.trim();
  if (hex.startsWith('#')) hex = hex.substring(1);
  // FlutterFlow sometimes passes ARGB (#00000000). Razorpay wants #RRGGBB.
  if (hex.length == 8) hex = hex.substring(2);
  if (RegExp(r'^[0-9A-Fa-f]{6}$').hasMatch(hex)) return '#$hex';
  return null;
}

class RazorpayOptions {
  RazorpayOptions({
    required this.key,
    required this.amount,
    required this.businessName,
    required this.orderId,
    this.currency = 'INR',
    this.description,
    this.notes,
    this.timeout,
    this.prefill,
    this.retry,
    this.theme,
  });

  final String key;
  final int amount;
  final String businessName;
  final String orderId;
  final String currency;
  final String? description;
  final Map<String, dynamic>? notes;
  final int? timeout;
  final Prefill? prefill;
  final Retry? retry;
  final RazorpayTheme? theme;

  factory RazorpayOptions.fromJson(String str) =>
      RazorpayOptions.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RazorpayOptions.fromMap(Map<String, dynamic> json) => RazorpayOptions(
        key: json['key'],
        amount: json['amount'],
        businessName: json['name'],
        orderId: json['order_id'],
        currency: json['currency'] ?? 'INR',
        description: json['description'],
        notes: json['notes'],
        timeout: json['timeout'],
        prefill: Prefill.fromMap(json['prefill']),
        retry: Retry.fromMap(json['retry']),
        theme: RazorpayTheme.fromMap(json['theme']),
      );

  Map<String, dynamic> toMap() => _omitNulls({
        'key': key,
        'amount': amount,
        'currency': currency,
        'name': businessName,
        'order_id': orderId,
        'description': description,
        'notes': notes,
        'timeout': timeout,
        'prefill': prefill?.toMap(),
        'retry': retry?.toMap(),
        'theme': theme?.toMap(),
        'config': {
          'display': {
            'blocks': {
              'upi_intent': {
                'name': 'UPI',
                'instruments': [
                  {'method': 'upi'},
                ],
              },
            },
            'sequence': ['block.upi_intent'],
            'preferences': {
              'show_default_blocks': true,
            },
          },
        },
      });
}

class Prefill {
  Prefill({
    this.userName,
    this.userEmail,
    this.userContact,
  });

  final String? userName;
  final String? userEmail;
  final String? userContact;

  factory Prefill.fromJson(String str) => Prefill.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Prefill.fromMap(Map<String, dynamic> json) => Prefill(
        userName: json['name'],
        userEmail: json['email'],
        userContact: json['contact'],
      );

  Map<String, dynamic> toMap() => _omitNulls({
        'name': userName,
        'email': userEmail,
        'contact': _sanitizeContact(userContact),
        'method': 'upi',
      });
}

String? _sanitizeContact(String? raw) {
  if (raw == null) return null;
  final digits = raw.replaceAll(RegExp(r'\D'), '');
  if (digits.isEmpty) return null;
  var national = digits;
  if (national.startsWith('91') && national.length >= 12) {
    national = national.substring(national.length - 10);
  } else if (national.length > 10) {
    national = national.substring(national.length - 10);
  }
  if (national.length != 10) return null;
  return '+91$national';
}

class Retry {
  Retry({
    required this.enabled,
  });

  final bool enabled;

  factory Retry.fromJson(String str) => Retry.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Retry.fromMap(Map<String, dynamic> json) => Retry(
        enabled: json['enabled'],
      );

  Map<String, dynamic> toMap() => {
        'enabled': enabled,
      };
}

class RazorpayTheme {
  RazorpayTheme({
    this.hideTopbar,
    this.color,
    this.backdropColor,
  });

  final bool? hideTopbar;
  final String? color;
  final String? backdropColor;

  factory RazorpayTheme.fromJson(String str) =>
      RazorpayTheme.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RazorpayTheme.fromMap(Map<String, dynamic> json) => RazorpayTheme(
        hideTopbar: json['hide_topbar'],
        color: json['color'],
        backdropColor: json['backdrop_color'],
      );

  Map<String, dynamic> toMap() => _omitNulls({
        'hide_topbar': hideTopbar,
        'color': razorpayThemeColor(color),
        'backdrop_color': razorpayThemeColor(backdropColor),
      });
}
