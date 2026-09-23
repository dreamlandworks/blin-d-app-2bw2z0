dynamic internalCleanMessage(String message) {
  // Define PII patterns to detect and replace
  final Map<String, RegExp> piiPatterns = {
    'email': RegExp(r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b'),
    'phone': RegExp(
        r'(\+?1?[-.\s]?)?\(?([0-9]{3})\)?[-.\s]?([0-9]{3})[-.\s]?([0-9]{4})'),
    'ssn': RegExp(r'\b\d{3}-?\d{2}-?\d{4}\b'),
    'creditCard': RegExp(r'\b(?:\d{4}[-\s]?){3}\d{4}\b'),
    'ipAddress': RegExp(r'\b(?:[0-9]{1,3}\.){3}[0-9]{1,3}\b'),
    'url': RegExp(
        r'https?://(?:[-\w.])+(?:[:\d]+)?(?:/(?:[\w/_.])*(?:\?(?:[\w&=%.])*)?(?:#(?:[\w.])*)?)?'),
    'address': RegExp(
        r'\b\d+\s+[A-Za-z\s]+(?:Street|St|Avenue|Ave|Road|Rd|Boulevard|Blvd|Lane|Ln|Drive|Dr|Court|Ct|Place|Pl)\b',
        caseSensitive: false),
  };
  String preprocess(String message) {
    final numberWords = {
      "zero": "0",
      "one": "1",
      "two": "2",
      "three": "3",
      "four": "4",
      "five": "5",
      "six": "6",
      "seven": "7",
      "eight": "8",
      "nine": "9"
    };
    String normalized = message.toLowerCase();
    // Replace spelled-out numbers
    numberWords.forEach((word, digit) {
      normalized = normalized.replaceAll(RegExp("\\b$word\\b"), digit);
    });
    // Remove spaces
    normalized = normalized.replaceAll(RegExp(r'(?<=\d)\s+(?=\d)'), '');
    return normalized;
  }

  String cleanedMessage = preprocess(message);
  bool flagged = false;

  // Replace PII patterns
  piiPatterns.forEach((type, pattern) {
    if (pattern.hasMatch(cleanedMessage)) {
      cleanedMessage =
          cleanedMessage.replaceAll(pattern, '[Hidden for Safety]');
      flagged = true;
    }
  });

  // [Include your keyword replacement loop here]

  return {
    'inputMessage': cleanedMessage.trim(),
    'isFlagged': flagged,
  };
}
