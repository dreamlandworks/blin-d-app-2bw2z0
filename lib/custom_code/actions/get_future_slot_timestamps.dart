// Automatic FlutterFlow imports
// Imports other custom actions
// Imports custom functions
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Imports other custom actions
// Imports custom functions

// Imports other custom actions
// Imports custom functions

List<dynamic> getFutureSlotTimestamps() {
  List<Map<String, dynamic>> finalSlots = [];
  DateTime nowUtc = DateTime.now().toUtc();
  DateTime nowIst = nowUtc.add(const Duration(hours: 5, minutes: 30));

// Create a "Today" string for easy comparison (e.g., "2026-03-22")
  String todayString = "${nowIst.year}-${nowIst.month}-${nowIst.day}";

// Define the Slot Metadata with HEX Colors
  List<Map<String, dynamic>> slotConfigs = [
    {
      'index': 1,
      'hour': 7,
      'title': 'Dawn Pulse',
      'tag': 'Hot',
      'desc': 'Early Birds & Coffee Chats',
      'time': '7:00 AM - 9:00 AM',
      'icon': 'wb_sunny',
      'color': '#FF9800',
      'tag_color': '#FFE0B2'
    },
    {
      'index': 2,
      'hour': 12,
      'title': 'Midday Break',
      'tag': 'Lively',
      'desc': 'Quick Lunch Sparks',
      'time': '12:00 PM - 2:00 PM',
      'icon': 'restaurant',
      'color': '#4CAF50',
      'tag_color': '#C8E6C9'
    },
    {
      'index': 3,
      'hour': 18,
      'title': 'Sunset Vibes',
      'tag': 'Vibing',
      'desc': 'Golden Hour Aesthetics',
      'time': '6:00 PM - 8:00 PM',
      'icon': 'nights_stay',
      'color': '#9C27B0',
      'tag_color': '#E1BEE7'
    },
    {
      'index': 4,
      'hour': 21,
      'title': 'Mystery Night',
      'tag': 'Chill',
      'desc': 'Late Night Mysteries',
      'time': '9:00 PM - 11:00 PM',
      'icon': 'auto_awesome',
      'color': '#F44336',
      'tag_color': '#FFCDD2'
    },
  ];

// 3. Helper to generate slots for a specific date
  void addSlotsForDate(DateTime targetDate) {
    for (var config in slotConfigs) {
      // Calculate the start time in UTC for accurate comparison
      DateTime sUtc = DateTime.utc(targetDate.year, targetDate.month,
              targetDate.day, config['hour'], 0)
          .subtract(const Duration(hours: 5, minutes: 30));

      // Only add if it's tomorrow OR if the slot hasn't started yet today
      if (nowUtc.isBefore(sUtc)) {
        // Check if the target date is today or tomorrow
        String slotDateString =
            "${targetDate.year}-${targetDate.month}-${targetDate.day}";
        bool isTomorrowVal = slotDateString != todayString;

        finalSlots.add({
          'slot_id':
              "${targetDate.year}_${targetDate.month}_${targetDate.day}_${config['index']}",
          'title': config['title'],
          'desc': config['desc'],
          'tag': config['tag'],
          'time_label': config['time'],
          'icon_name': config['icon'],
          'primary_color': config['color'],
          'tag_bg_color': config['tag_color'],
          'start_ms': sUtc.millisecondsSinceEpoch, // RESTORED
          'end_ms': sUtc
              .add(const Duration(hours: 2))
              .millisecondsSinceEpoch, // RESTORED
          'is_tomorrow': isTomorrowVal,
        });
      }
    }
  }

  // 4. Try Today, then roll to Tomorrow if empty
  addSlotsForDate(nowIst);
  if (finalSlots.isEmpty) {
    addSlotsForDate(nowIst.add(const Duration(days: 1)));
  }

  return finalSlots;
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
