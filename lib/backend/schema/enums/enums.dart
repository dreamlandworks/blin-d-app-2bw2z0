import 'package:collection/collection.dart';

enum ReadyStatus {
  active,
  cooldown,
  chatting,
  inactive,
  banned,
}

enum ChatStatus {
  expired,
  reported,
  permanent,
}

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (ReadyStatus):
      return ReadyStatus.values.deserialize(value) as T?;
    case (ChatStatus):
      return ChatStatus.values.deserialize(value) as T?;
    default:
      return null;
  }
}
