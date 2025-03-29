import 'package:realm/realm.dart';

class DbManager {
  static final DbManager _instance = DbManager._internal();

  factory DbManager() => _instance;

  DbManager._internal();

  late final Realm favoriteWineRealm;

  static Future<void> initialize() async {
    final config = Configuration.local([]);
    _instance.favoriteWineRealm = await Realm.open(config);
  }
}
