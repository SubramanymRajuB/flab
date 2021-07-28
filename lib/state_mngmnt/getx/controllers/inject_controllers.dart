import 'package:get/get.dart';

import 'prodcut_controller.dart';

class InjectController extends Bindings{
  @override
  void dependencies() {
    Get.put(ProductController());
  }}