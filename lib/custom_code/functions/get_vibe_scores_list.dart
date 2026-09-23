
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';

List<double> getVibeScoresList(List<VibeHistoryStruct>? history) {
  if (history == null || history.isEmpty) return [];
  return history.map((e) => (e.score).toDouble()).toList();
}
