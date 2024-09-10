import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wandabook/app/ui/pages/bucket_page/bucket_page.dart';
import 'package:wandabook/app/ui/pages/init_page/init_page.dart';
import 'package:wandabook/app/ui/pages/profile_page/profile_page.dart';
import 'package:wandabook/app/ui/pages/search_page/search_page.dart';
import '../../layouts/main/main_layout.dart';

import '../../../controllers/home_controller.dart';

class HomePage extends GetView<HomeController> {
  HomePage({Key? key}) : super(key: key);

  final List<Widget> _widgetOptions = <Widget>[
    const InitPage(),
    const SearchPage(),
    const BucketPage(),
    const ProfilePage(),
  ];

  Widget getBody() {
    return IndexedStack(
      index: controller.selectedIndex.value,
      children:_widgetOptions,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MainLayout(
        child:
        Scaffold(
          backgroundColor: Theme.of(context).primaryColor,
            body: Obx(()=>getBody()),
            bottomNavigationBar: Obx(()=>BottomNavigationBar(
                backgroundColor: Theme.of(context).primaryColor,
              elevation: 10,
              showUnselectedLabels: true,

              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  label: 'Search',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart),
                  label: 'Bucket',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle),
                  label: 'Account',
                ),
              ],
              currentIndex: controller.selectedIndex.value,
              selectedItemColor: Colors.orange,
              unselectedItemColor: Colors.grey,
              onTap: controller.onItemTapped,
            )),
            ));
  }
}
