import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vimigo/helpers/text_style_helper.dart';
import 'package:vimigo/helpers/theme_helper.dart';
import 'package:vimigo/module/dashboard/dashboard_controller.dart';
import '../../app/app_constant.dart';

class Item extends GetWidget<DashboardController> {
  const Item({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.colorWhite,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: controller.modelList.length,
        itemBuilder: ((context, index) {
          return InkWell(
            onTap: () {
              controller.selectedIndex.value = index;
              controller.isShowDropdown.value = false;
            },
            child: Column(
              children: [
                Obx(() {
                  return Padding(
                    padding: const EdgeInsets.all(gap),
                    child: Text(
                      controller.modelList[index].name,
                      style: controller.selectedIndex.value == index
                          ? TextStyleHelper.h5SemiBold(Colors.blue)
                          : TextStyleHelper.bodyRegular(context.colorBlack),
                    ),
                  );
                }),
                Divider(
                  height: 1,
                  color: context.colorDivider,
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
