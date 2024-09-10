import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../layouts/main/main_layout.dart';

import '../../../controllers/sigin_controller.dart';

class SiginPage extends GetView<SiginController> {
      const SiginPage ({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MainLayout(
        child: Text('Sigin'),
      );
  }
}
