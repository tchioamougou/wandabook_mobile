import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wandabook/app/routes/app_routes.dart';
import '../../layouts/main/main_layout.dart';

import '../../../controllers/profile_controller.dart';

class ProfilePage extends GetView<ProfileController> {
      const ProfilePage ({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
     final actionColor = Colors.orange.withOpacity(0.5);
    return  MainLayout(
        child: Scaffold(
          backgroundColor: Theme.of(context).primaryColor,
          body: SingleChildScrollView(
            child: Container(
              color:  Theme.of(context).primaryColor,
              child: Column(
                children: [
                  SizedBox(
                    height: 100.h,
                  ),
                  Stack(
                    children: [
                      InkWell(
                        onTap: () {
                          Get.toNamed(AppRoutes.PROFILE);
                        },
                        child: SizedBox(
                          height: 120.h,
                          child: CircleAvatar(
                            radius: 60,
                            backgroundImage: NetworkImage("imageUrl"),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Divider(height: 0.1, color: Colors.orange.withOpacity(0.1)),
                  SizedBox(
                    height: 5.h,
                  ),
                  ListTile(
                    title: Text('Account info'.tr),
                    enabled: false,
                  ),
                  ListTile(
                      leading: Container(
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                            color: actionColor,
                            borderRadius:
                            const BorderRadius.all(Radius.circular(6))),
                        child: Icon(
                          Icons.account_circle_rounded,
                          size: 25.sp,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      title: Text('Account information'.tr),
                      tileColor: Colors.white,
                      trailing: const Icon(
                        Icons.navigate_next,
                        size: 25,
                      ),
                      onTap: () {
                        Get.toNamed(AppRoutes.PROFILE);
                      }),
                  ListTile(
                      leading: Container(
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                            color: actionColor,
                            borderRadius:
                            const BorderRadius.all(Radius.circular(6))),
                        child: Icon(
                          Icons.credit_card_rounded,
                          size: 25.sp,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      title: Text('Subscription'.tr),
                      subtitle: Text('No subscription plan'),
                      tileColor: Colors.white,
                      trailing: const Icon(
                        Icons.navigate_next,
                        size: 25,
                      ),
                      onTap: () {
                        Get.toNamed(AppRoutes.SUBSCRIPTION);
                      }),
                  //Account info
                  ListTile(
                    title: Text('Security setting'.tr),
                    enabled: false,
                  ),
                  ListTile(
                    leading: Container(
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                          color: actionColor,
                          borderRadius: const BorderRadius.all(Radius.circular(6))),
                      child: Icon(
                        Icons.account_circle_outlined,
                        size: 25.sp,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    title: Text('Change Pin'.tr),
                    trailing: const Icon(
                      Icons.navigate_next,
                      size: 25,
                    ),
                    onTap: () {
                      Get.toNamed(AppRoutes.PROFILE);
                    },
                  ),
                  ListTile(
                    leading: Container(
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                          color: actionColor,
                          borderRadius: const BorderRadius.all(Radius.circular(6))),
                      child: Icon(
                        Icons.lock_person_outlined,
                        size: 25.sp,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    title: Text('Change Phone Number'.tr),
                    trailing: const Icon(
                      Icons.navigate_next,
                      size: 25,
                    ),
                    onTap: () {
                      // Handle advanced settings logic
                      //AppSettings.openAppSettings(type: AppSettingsType.location);
                    },
                  ),
                  // Preferences section
                  ListTile(
                    title: Text('Preferences'.tr),
                    enabled: false,
                    // tileColor: Get.isDarkMode ? Theme.of(context).primaryColor : Colors.grey,
                  ),
                  ListTile(
                    leading: Container(
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                          color: actionColor,
                          borderRadius: const BorderRadius.all(Radius.circular(6))),
                      child: Icon(
                        Icons.wb_sunny_outlined,
                        size: 25.sp,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    title: Text('Theme'.tr),
                    onTap: () {
                       Get.toNamed(AppRoutes.THEME);
                    },
                    trailing: const Icon(
                      Icons.navigate_next,
                      size: 25,
                    ),
                  ),
                  ListTile(
                    leading: Container(
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                          color: actionColor,
                          borderRadius: const BorderRadius.all(Radius.circular(6))),
                      child: Icon(
                        Icons.language_outlined,
                        size: 25.sp,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    title: Text('Language'.tr),
                    onTap: () {
                      // Handle advanced settings logic
                      Get.toNamed(AppRoutes.PROFILE);
                    },
                    trailing: const Icon(
                      Icons.navigate_next,
                      size: 25,
                    ),
                  ),
                  ListTile(
                    leading: Container(
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                          color: actionColor,
                          borderRadius: const BorderRadius.all(Radius.circular(6))),
                      child: Icon(
                        Icons.lock_person_outlined,
                        size: 25.sp,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    title: Text('Authorization'.tr),
                    onTap: () {
                      // Handle advanced settings logic
                      //AppSettings.openAppSettings(type: AppSettingsType.location);
                    },
                    trailing: const Icon(
                      Icons.navigate_next,
                      size: 25,
                    ),
                  ),
                  ListTile(
                    leading: Container(
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                          color: actionColor,
                          borderRadius: const BorderRadius.all(Radius.circular(6))),
                      child: Icon(
                        Icons.security_outlined,
                        size: 25.sp,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    title: Text('Privacy'.tr),
                    onTap: () {
                      // Handle advanced settings logic
                    },
                    trailing: const Icon(
                      Icons.navigate_next,
                      size: 25,
                    ),
                  ),
                  ListTile(
                    title: Text('Sharing'.tr),
                    enabled: false,
                    // tileColor: Get.isDarkMode ? Theme.of(context).primaryColor : Colors.grey,
                  ),
                  ListTile(
                      leading: Container(
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                            color: actionColor,
                            borderRadius:
                            const BorderRadius.all(Radius.circular(6))),
                        child: Icon(
                          Icons.diamond,
                          size: 25.sp,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      title: Text('Invite Friends'.tr),
                      tileColor: Colors.white,
                      onTap: () {

                      }),
                  // Business information
                  ListTile(
                    title: Text('Connection'.tr),
                    enabled: false,
                    // tileColor: Get.isDarkMode ? Theme.of(context).primaryColor : Colors.grey,
                  ),
                  ListTile(
                      leading: Container(
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                            color: actionColor,
                            borderRadius:
                            const BorderRadius.all(Radius.circular(6))),
                        child: Icon(Icons.logout,
                            size: 25.sp, color: Colors.redAccent),
                      ),
                      title: Text('Logout'.tr),
                      tileColor: Colors.white,
                      onTap: () async {
                      }),
                ],
              ),
            ),
          ),
        ),
      );
  }
}
