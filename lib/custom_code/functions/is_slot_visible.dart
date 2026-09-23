

bool isSlotVisible(
  List<dynamic>? slots,
  int slotIndex,
) {
  if (slots == null || slots.isEmpty) return false;

  try {
    // 1. Manually decode the string into a list
    //  List<dynamic> slots = json.decode(activeSlotsString);

    // 2. Check if the index exists in any slot_id
    for (var slot in slots) {
      String slotId = slot['slot_id'].toString();
      // Logic: If slot_id is "2026_3_21_1", it ends with "_1"
      if (slotId.endsWith('_$slotIndex')) {
        return true;
      }
    }
  } catch (e) {
    return false;
  }

  return false;
}
