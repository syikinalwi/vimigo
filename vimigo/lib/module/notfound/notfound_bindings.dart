import 'package:get/get.dart';
import './notfound_controller.dart';

class NotfoundBindings implements Bindings {
    @override
    void dependencies() {
        Get.put(NotfoundController());
    }
}