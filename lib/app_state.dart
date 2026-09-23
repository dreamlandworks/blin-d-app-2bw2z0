import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/api_requests/api_manager.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance._resetFields();
    _instance.notifyListeners();
  }

  void _resetFields() {
    _mobile = '';
    _terms = true;
    _aiVibe = true;
    _confirm = false;
    _dialCode = '+91';
    _Interests = [
      InterestTypeStruct.fromSerializableMap(
          jsonDecode('{\"label\":\"Arts & Crafts\",\"icon\":\"🎨\"}')),
      InterestTypeStruct.fromSerializableMap(
          jsonDecode('{\"label\":\"Adventure\",\"icon\":\"🧗\"}')),
      InterestTypeStruct.fromSerializableMap(
          jsonDecode('{\"label\":\"Gaming\",\"icon\":\"🎮\"}')),
      InterestTypeStruct.fromSerializableMap(
          jsonDecode('{\"label\":\"Cooking\",\"icon\":\"🍳\"}')),
      InterestTypeStruct.fromSerializableMap(
          jsonDecode('{\"label\":\"Fitness\",\"icon\":\"🏋️\"}')),
      InterestTypeStruct.fromSerializableMap(
          jsonDecode('{\"label\":\"Music\",\"icon\":\"🎵\"}')),
      InterestTypeStruct.fromSerializableMap(
          jsonDecode('{\"label\":\"Literature\",\"icon\":\"📚\"}')),
      InterestTypeStruct.fromSerializableMap(
          jsonDecode('{\"label\":\"Photography\",\"icon\":\"📸\"}')),
      InterestTypeStruct.fromSerializableMap(
          jsonDecode('{\"label\":\"Tech\",\"icon\":\"💻\"}')),
      InterestTypeStruct.fromSerializableMap(
          jsonDecode('{\"label\":\"Nature\",\"icon\":\"🌱\"}')),
      InterestTypeStruct.fromSerializableMap(
          jsonDecode('{\"label\":\"Movies\",\"icon\":\"📽️\"}')),
      InterestTypeStruct.fromSerializableMap(
          jsonDecode('{\"label\":\"Sports\",\"icon\":\"⚽\"}'))
    ];
    _onboard =
        OnboardStruct.fromSerializableMap(jsonDecode('{\"interests\":\"[]\"}'));
    _counter = 0;
    _userLocation = '';
    _adCountDaily = 0;
    _referralID = '';
    _isSearching = false;
    _onReady =
        OnReadyStruct.fromSerializableMap(jsonDecode('{\"slot_id\":\"[]\"}'));
    _currentPulse = '';
    _photoFilePaths =
        FilePathsStruct.fromSerializableMap(jsonDecode('{\"localPath\":\"\"}'));
    _appStatsRtdb = AppStatsRtdbStruct.fromSerializableMap(
        jsonDecode('{\"ready_status\":\"active\"}'));
    _partnerData = PartnerDataStruct.fromSerializableMap(
        jsonDecode('{\"p_interests\":\"[]\"}'));
    _lastViolationMsg = '';
    _fcmHandShake = '';
    _fcmSlotID = '';
    _fcmNavigated = false;
    _fcmForeground = false;
    _endTime = 0;
    _iceBreaker = '';
    _personalIceBreakers = [];
    _feeling = '';
    _revealList = [];
    _chatStats = ChatStatsStruct.fromSerializableMap(
        jsonDecode('{\"is_revealed\":\"false\"}'));
    _isPremium = false;
    _expiryDate = '';
    _coins = 0;
    _startTime = 0;
    _chatEndTime = 0;
    _lastMessage = '';
    _lastPartnerMessage = '';
    _incognito = false;
    _chatId = '';
    _digiSession = '';
    _permMessage = PermLastMessageStruct.fromSerializableMap(
        jsonDecode('{\"text\":\"\"}'));
    _exportedUserDataJson = '';
  }

  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage();
    await _safeInitAsync(() async {
      _mobile = await secureStorage.getString('ff_mobile') ?? _mobile;
    });
    await _safeInitAsync(() async {
      _currentPulse =
          await secureStorage.getString('ff_currentPulse') ?? _currentPulse;
    });
    await _safeInitAsync(() async {
      if (await secureStorage.read(key: 'ff_photoFilePaths') != null) {
        try {
          final serializedData =
              await secureStorage.getString('ff_photoFilePaths') ?? '{}';
          _photoFilePaths =
              FilePathsStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    await _safeInitAsync(() async {
      if (await secureStorage.read(key: 'ff_appStatsRtdb') != null) {
        try {
          final serializedData =
              await secureStorage.getString('ff_appStatsRtdb') ?? '{}';
          _appStatsRtdb = AppStatsRtdbStruct.fromSerializableMap(
              jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    await _safeInitAsync(() async {
      if (await secureStorage.read(key: 'ff_onReady') != null) {
        try {
          final serializedData =
              await secureStorage.getString('ff_onReady') ?? '{}';
          _onReady = _decodePersistedOnReady(serializedData);
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    await _safeInitAsync(() async {
      if (await secureStorage.read(key: 'ff_partnerData') != null) {
        try {
          final serializedData =
              await secureStorage.getString('ff_partnerData') ?? '{}';
          _partnerData =
              PartnerDataStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  String _mobile = '';
  String get mobile => _mobile;
  set mobile(String value) {
    _mobile = value;
    secureStorage.setString('ff_mobile', value);
  }

  void deleteMobile() {
    secureStorage.delete(key: 'ff_mobile');
  }

  bool _terms = true;
  bool get terms => _terms;
  set terms(bool value) {
    _terms = value;
  }

  bool _aiVibe = true;
  bool get aiVibe => _aiVibe;
  set aiVibe(bool value) {
    _aiVibe = value;
  }

  bool _confirm = false;
  bool get confirm => _confirm;
  set confirm(bool value) {
    _confirm = value;
  }

  String _dialCode = '+91';
  String get dialCode => _dialCode;
  set dialCode(String value) {
    _dialCode = value;
  }

  List<InterestTypeStruct> _Interests = [
    InterestTypeStruct.fromSerializableMap(
        jsonDecode('{\"label\":\"Arts & Crafts\",\"icon\":\"🎨\"}')),
    InterestTypeStruct.fromSerializableMap(
        jsonDecode('{\"label\":\"Adventure\",\"icon\":\"🧗\"}')),
    InterestTypeStruct.fromSerializableMap(
        jsonDecode('{\"label\":\"Gaming\",\"icon\":\"🎮\"}')),
    InterestTypeStruct.fromSerializableMap(
        jsonDecode('{\"label\":\"Cooking\",\"icon\":\"🍳\"}')),
    InterestTypeStruct.fromSerializableMap(
        jsonDecode('{\"label\":\"Fitness\",\"icon\":\"🏋️\"}')),
    InterestTypeStruct.fromSerializableMap(
        jsonDecode('{\"label\":\"Music\",\"icon\":\"🎵\"}')),
    InterestTypeStruct.fromSerializableMap(
        jsonDecode('{\"label\":\"Literature\",\"icon\":\"📚\"}')),
    InterestTypeStruct.fromSerializableMap(
        jsonDecode('{\"label\":\"Photography\",\"icon\":\"📸\"}')),
    InterestTypeStruct.fromSerializableMap(
        jsonDecode('{\"label\":\"Tech\",\"icon\":\"💻\"}')),
    InterestTypeStruct.fromSerializableMap(
        jsonDecode('{\"label\":\"Nature\",\"icon\":\"🌱\"}')),
    InterestTypeStruct.fromSerializableMap(
        jsonDecode('{\"label\":\"Movies\",\"icon\":\"📽️\"}')),
    InterestTypeStruct.fromSerializableMap(
        jsonDecode('{\"label\":\"Sports\",\"icon\":\"⚽\"}'))
  ];
  List<InterestTypeStruct> get Interests => _Interests;
  set Interests(List<InterestTypeStruct> value) {
    _Interests = value;
  }

  void addToInterests(InterestTypeStruct value) {
    Interests.add(value);
  }

  void removeFromInterests(InterestTypeStruct value) {
    Interests.remove(value);
  }

  void removeAtIndexFromInterests(int index) {
    Interests.removeAt(index);
  }

  void updateInterestsAtIndex(
    int index,
    InterestTypeStruct Function(InterestTypeStruct) updateFn,
  ) {
    Interests[index] = updateFn(_Interests[index]);
  }

  void insertAtIndexInInterests(int index, InterestTypeStruct value) {
    Interests.insert(index, value);
  }

  OnboardStruct _onboard =
      OnboardStruct.fromSerializableMap(jsonDecode('{\"interests\":\"[]\"}'));
  OnboardStruct get onboard => _onboard;
  set onboard(OnboardStruct value) {
    _onboard = value;
  }

  void updateOnboardStruct(Function(OnboardStruct) updateFn) {
    updateFn(_onboard);
  }

  int _counter = 0;
  int get counter => _counter;
  set counter(int value) {
    _counter = value;
  }

  String _userLocation = '';
  String get userLocation => _userLocation;
  set userLocation(String value) {
    _userLocation = value;
  }

  int _adCountDaily = 0;
  int get adCountDaily => _adCountDaily;
  set adCountDaily(int value) {
    _adCountDaily = value;
  }

  String _referralID = '';
  String get referralID => _referralID;
  set referralID(String value) {
    _referralID = value;
  }

  bool _isSearching = false;
  bool get isSearching => _isSearching;
  set isSearching(bool value) {
    _isSearching = value;
  }

  OnReadyStruct _onReady =
      OnReadyStruct.fromSerializableMap(jsonDecode('{\"slot_id\":\"[]\"}'));
  OnReadyStruct get onReady => _onReady;
  bool get isSlotLocked {
    final status = _onReady.readyStatus;
    return _onReady.slotId.isNotEmpty ||
        status == 'active' ||
        status == 'chatting' ||
        status == 'cooldown';
  }

  set onReady(OnReadyStruct value) {
    _onReady = value;
    notifyListeners();
    persistOnReady();
    _mirrorOnReadyToRtdb(value);
  }

  void deleteOnReady() {
    secureStorage.delete(key: 'ff_onReady');
  }

  void updateOnReadyStruct(Function(OnReadyStruct) updateFn) {
    updateFn(_onReady);
    notifyListeners();
    persistOnReady();
    _mirrorOnReadyToRtdb(_onReady);
  }

  Future<void> persistOnReady() async {
    try {
      await secureStorage.setString('ff_onReady', _onReady.serialize());
    } catch (e) {
      print('persistOnReady error: $e');
    }
  }

  void _mirrorOnReadyToRtdb(OnReadyStruct value) {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null || uid.isEmpty) return;
    try {
      FirebaseDatabase.instanceFor(
        app: Firebase.app(),
        databaseURL:
            'https://blindapp-489217-default-rtdb.asia-southeast1.firebasedatabase.app/',
      ).ref('appStats/$uid').update({
        if (value.readyStatus.isNotEmpty) 'st': value.readyStatus,
        if (value.readyTime > 0) 'la': value.readyTime,
        if (value.cooldownUntil > 0) 'ct': value.cooldownUntil,
        if (value.slotId.isNotEmpty) 'sid': value.slotId,
        if (value.slotTitle.isNotEmpty) 'stt': value.slotTitle,
        if (value.slotDesc.isNotEmpty) 'sds': value.slotDesc,
        if (value.slotStartTimer.isNotEmpty) 'sst': value.slotStartTimer,
      });
    } catch (_) {}
  }

  String _currentPulse = '';
  String get currentPulse => _currentPulse;
  set currentPulse(String value) {
    _currentPulse = value;
    secureStorage.setString('ff_currentPulse', value);
  }

  void deleteCurrentPulse() {
    secureStorage.delete(key: 'ff_currentPulse');
  }

  FilePathsStruct _photoFilePaths =
      FilePathsStruct.fromSerializableMap(jsonDecode('{\"localPath\":\"\"}'));
  FilePathsStruct get photoFilePaths => _photoFilePaths;
  set photoFilePaths(FilePathsStruct value) {
    _photoFilePaths = value;
    secureStorage.setString('ff_photoFilePaths', value.serialize());
  }

  void deletePhotoFilePaths() {
    secureStorage.delete(key: 'ff_photoFilePaths');
  }

  void updatePhotoFilePathsStruct(Function(FilePathsStruct) updateFn) {
    updateFn(_photoFilePaths);
    secureStorage.setString('ff_photoFilePaths', _photoFilePaths.serialize());
  }

  AppStatsRtdbStruct _appStatsRtdb = AppStatsRtdbStruct.fromSerializableMap(
      jsonDecode('{\"ready_status\":\"active\"}'));
  AppStatsRtdbStruct get appStatsRtdb => _appStatsRtdb;
  set appStatsRtdb(AppStatsRtdbStruct value) {
    _appStatsRtdb = value;
    secureStorage.setString('ff_appStatsRtdb', value.serialize());
  }

  void deleteAppStatsRtdb() {
    secureStorage.delete(key: 'ff_appStatsRtdb');
  }

  void updateAppStatsRtdbStruct(Function(AppStatsRtdbStruct) updateFn) {
    updateFn(_appStatsRtdb);
    secureStorage.setString('ff_appStatsRtdb', _appStatsRtdb.serialize());
  }

  PartnerDataStruct _partnerData = PartnerDataStruct.fromSerializableMap(
      jsonDecode('{\"p_interests\":\"[]\"}'));
  PartnerDataStruct get partnerData => _partnerData;
  set partnerData(PartnerDataStruct value) {
    _partnerData = value;
    secureStorage.setString('ff_partnerData', value.serialize());
  }

  void deletePartnerData() {
    secureStorage.delete(key: 'ff_partnerData');
  }

  void updatePartnerDataStruct(Function(PartnerDataStruct) updateFn) {
    updateFn(_partnerData);
    secureStorage.setString('ff_partnerData', _partnerData.serialize());
  }

  String _lastViolationMsg = '';
  String get lastViolationMsg => _lastViolationMsg;
  set lastViolationMsg(String value) {
    _lastViolationMsg = value;
  }

  String _fcmHandShake = '';
  String get fcmHandShake => _fcmHandShake;
  set fcmHandShake(String value) {
    _fcmHandShake = value;
  }

  String _fcmSlotID = '';
  String get fcmSlotID => _fcmSlotID;
  set fcmSlotID(String value) {
    _fcmSlotID = value;
  }

  bool _fcmNavigated = false;
  bool get fcmNavigated => _fcmNavigated;
  set fcmNavigated(bool value) {
    _fcmNavigated = value;
  }

  bool _fcmForeground = false;
  bool get fcmForeground => _fcmForeground;
  set fcmForeground(bool value) {
    _fcmForeground = value;
  }

  int _endTime = 0;
  int get endTime => _endTime;
  set endTime(int value) {
    _endTime = value;
  }

  String _iceBreaker = '';
  String get iceBreaker => _iceBreaker;
  set iceBreaker(String value) {
    _iceBreaker = value;
  }

  List<String> _personalIceBreakers = [];
  List<String> get personalIceBreakers => _personalIceBreakers;
  set personalIceBreakers(List<String> value) {
    _personalIceBreakers = value;
  }

  void addToPersonalIceBreakers(String value) {
    personalIceBreakers.add(value);
  }

  void removeFromPersonalIceBreakers(String value) {
    personalIceBreakers.remove(value);
  }

  void removeAtIndexFromPersonalIceBreakers(int index) {
    personalIceBreakers.removeAt(index);
  }

  void updatePersonalIceBreakersAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    personalIceBreakers[index] = updateFn(_personalIceBreakers[index]);
  }

  void insertAtIndexInPersonalIceBreakers(int index, String value) {
    personalIceBreakers.insert(index, value);
  }

  String _feeling = '';
  String get feeling => _feeling;
  set feeling(String value) {
    _feeling = value;
  }

  List<String> _revealList = [];
  List<String> get revealList => _revealList;
  set revealList(List<String> value) {
    _revealList = value;
  }

  void addToRevealList(String value) {
    revealList.add(value);
  }

  void removeFromRevealList(String value) {
    revealList.remove(value);
  }

  void removeAtIndexFromRevealList(int index) {
    revealList.removeAt(index);
  }

  void updateRevealListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    revealList[index] = updateFn(_revealList[index]);
  }

  void insertAtIndexInRevealList(int index, String value) {
    revealList.insert(index, value);
  }

  ChatStatsStruct _chatStats = ChatStatsStruct.fromSerializableMap(
      jsonDecode('{\"is_revealed\":\"false\"}'));
  ChatStatsStruct get chatStats => _chatStats;
  set chatStats(ChatStatsStruct value) {
    _chatStats = value;
  }

  void updateChatStatsStruct(Function(ChatStatsStruct) updateFn) {
    updateFn(_chatStats);
  }

  bool _isPremium = false;
  bool get isPremium => _isPremium;
  set isPremium(bool value) {
    _isPremium = value;
  }

  String _expiryDate = '';
  String get expiryDate => _expiryDate;
  set expiryDate(String value) {
    _expiryDate = value;
  }

  int _coins = 0;
  int get coins => _coins;
  set coins(int value) {
    _coins = value;
  }

  int _startTime = 0;
  int get startTime => _startTime;
  set startTime(int value) {
    _startTime = value;
  }

  int _chatEndTime = 0;
  int get chatEndTime => _chatEndTime;
  set chatEndTime(int value) {
    _chatEndTime = value;
  }

  String _lastMessage = '';
  String get lastMessage => _lastMessage;
  set lastMessage(String value) {
    _lastMessage = value;
  }

  String _lastPartnerMessage = '';
  String get lastPartnerMessage => _lastPartnerMessage;
  set lastPartnerMessage(String value) {
    _lastPartnerMessage = value;
  }

  bool _incognito = false;
  bool get incognito => _incognito;
  set incognito(bool value) {
    _incognito = value;
  }

  String _chatId = '';
  String get chatId => _chatId;
  set chatId(String value) {
    _chatId = value;
  }

  String _digiSession = '';
  String get digiSession => _digiSession;
  set digiSession(String value) {
    _digiSession = value;
  }

  PermLastMessageStruct _permMessage =
      PermLastMessageStruct.fromSerializableMap(jsonDecode('{\"text\":\"\"}'));
  PermLastMessageStruct get permMessage => _permMessage;
  set permMessage(PermLastMessageStruct value) {
    _permMessage = value;
  }

  void updatePermMessageStruct(Function(PermLastMessageStruct) updateFn) {
    updateFn(_permMessage);
  }

  String _exportedUserDataJson = '';
  String get exportedUserDataJson => _exportedUserDataJson;
  set exportedUserDataJson(String value) {
    _exportedUserDataJson = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

OnReadyStruct _decodePersistedOnReady(String serializedData) {
  final decoded = jsonDecode(serializedData);
  if (decoded is! Map) {
    return OnReadyStruct();
  }
  final map = Map<String, dynamic>.from(decoded);
  var restored = OnReadyStruct.fromSerializableMap(map);
  if (restored.readyStatus.isEmpty && restored.slotId.isEmpty) {
    final slotId = map['slot_id'];
    if (slotId is List && slotId.isNotEmpty) {
      restored = OnReadyStruct.fromMap(map);
    }
  }
  final status = restored.readyStatus == 'null' ? '' : restored.readyStatus;
  if (status.isEmpty && restored.slotId.isNotEmpty) {
    return OnReadyStruct(
      readyStatus: 'active',
      readyTime: restored.readyTime,
      cooldownUntil: restored.cooldownUntil,
      isPremium: restored.isPremium,
      slotId: restored.slotId,
      slotTitle: restored.slotTitle,
      slotDesc: restored.slotDesc,
      slotStartTimer: restored.slotStartTimer,
    );
  }
  if (status != restored.readyStatus) {
    return OnReadyStruct(
      readyStatus: status,
      readyTime: restored.readyTime,
      cooldownUntil: restored.cooldownUntil,
      isPremium: restored.isPremium,
      slotId: restored.slotId,
      slotTitle: restored.slotTitle,
      slotDesc: restored.slotDesc,
      slotStartTimer: restored.slotStartTimer,
    );
  }
  return restored;
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: ListToCsvConverter().convert([value]));
}
