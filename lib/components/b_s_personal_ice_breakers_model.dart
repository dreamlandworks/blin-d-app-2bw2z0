import '/flutter_flow/flutter_flow_util.dart';
import 'b_s_personal_ice_breakers_widget.dart' show BSPersonalIceBreakersWidget;
import 'package:flutter/material.dart';

class BSPersonalIceBreakersModel
    extends FlutterFlowModel<BSPersonalIceBreakersWidget> {
  ///  Local state fields for this component.

  bool feelingMore = false;

  bool iceBreakersMore = false;

  List<String> iceBreakersList = [
    'What\'s the first thing you notice about someone?',
    'Love marriage or arranged marriage?',
    'What\'s your idea of a perfect date?',
    'Morning person or night owl?',
    'What\'s the cutest compliment you\'ve received?',
    'Do you believe in love at first sight?',
    'Tea date or dinner date?',
    'What makes someone instantly attractive to you?',
    'What\'s your love language: talking, gifts, time, hugs, or food?',
    'If we met today, where would you take me?',
    'Who usually texts first—you or the other person?',
    'If I steal your fries, what happens next?',
    'Rate your flirting skills from 1 to 10.',
    'What\'s one thing that can make you blush instantly?',
    'Are you good at giving compliments?',
    'If we were stuck in a lift for 30 minutes, what would we talk about?',
    'What\'s the most romantic thing someone can do for you?',
    'Coffee ☕ or Ice Cream 🍦?',
    'Movie 🎬 or Long Drive 🚗?',
    'Sunrise 🌅 or Sunset 🌇?',
    'Romance ❤️ or Comedy 😂?',
    'Slow Love 💕 or Love at First Sight ⚡?',
    'Introvert 🙈 or Extrovert 🎉?'
  ];
  void addToIceBreakersList(String item) => iceBreakersList.add(item);
  void removeFromIceBreakersList(String item) => iceBreakersList.remove(item);
  void removeAtIndexFromIceBreakersList(int index) =>
      iceBreakersList.removeAt(index);
  void insertAtIndexInIceBreakersList(int index, String item) =>
      iceBreakersList.insert(index, item);
  void updateIceBreakersListAtIndex(int index, Function(String) updateFn) =>
      iceBreakersList[index] = updateFn(iceBreakersList[index]);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
