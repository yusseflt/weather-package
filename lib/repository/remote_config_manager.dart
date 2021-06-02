import 'package:firebase_remote_config/firebase_remote_config.dart';

class RemoteConfigManager {
  static RemoteConfig remoteConfigInstance = RemoteConfig.instance;

  void init() async {
    await remoteConfigInstance.fetchAndActivate();
  }
}
