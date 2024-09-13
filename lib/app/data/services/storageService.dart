import 'package:shared_preferences/shared_preferences.dart';
import 'package:wandabook/app/ui/utils/app_constants.dart';

class StorageService{
  late final SharedPreferences _preferences;
  Future<StorageService> init() async {
    _preferences = await SharedPreferences.getInstance();
    return this;
  }
  Future<bool> setBool(String key, bool value) async{
    return await _preferences.setBool(key, value);
  }
  Future<bool> setString(String key,String value) async {
    return await _preferences.setString(key, value);
  }

  Future<bool> remove(String key) async{
    return await _preferences.remove(key);
  }

  bool getDeviceFirstOpen(){
    return _preferences.getBool(AppConstant.STORAGE_DEVICE_OPEN_FIRST_TIME)??false;
  }


  String? getRedirectRoute(){
    var route = _preferences.getString("redirectRoute")??"";
    if(route.isNotEmpty){
      return route;
    }
    return null;
  }
  bool getIsLoggedIn(){
    return _preferences.getString(AppConstant.STORAGE_USER)==null?false:true;
  }

  /*UserInfos? getUserProfile(){
    var profile = _preferences.getString(AppConstant.STORAGE_USER)??"";
    if(profile.isNotEmpty){
      return UserInfos.fromJson(jsonDecode(profile));
    }
    return null;
  }*/

  Future<void> cleanStorage () async {
    await remove(AppConstant.STORAGE_USER);
  }

}