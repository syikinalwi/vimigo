import 'package:get/get.dart';
import 'package:vimigo/model/list_model.dart';

class DashboardController extends GetxController {
  Rx<bool> isShowDropdown = false.obs;
  RxList<ListModel> modelList = <ListModel>[].obs;
  var selectedIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    getlist;
  }

  get getlist {
    for (var i = 1; i < 6; i++) {
      (modelList.add(ListModel(name: "Level $i", code: '', imageURL: '')));
    }
    return modelList;
  }
}
