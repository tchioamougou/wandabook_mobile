

import 'package:get_storage/get_storage.dart';
import 'package:wandabook/app/data/services/storageService.dart';

class Global {
  static late StorageService
  storageService;
  static Future init() async {
    await GetStorage.init();
    storageService = await StorageService().init();

    // await LanguageService.instance.initLanguage();
  }
}
