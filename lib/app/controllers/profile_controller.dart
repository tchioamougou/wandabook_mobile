
import 'package:get/get.dart';
import 'package:wandabook/global.dart';
class ProfileController extends GetxController {
  bool isLoggedIn = Global.storageService.getIsLoggedIn();

}