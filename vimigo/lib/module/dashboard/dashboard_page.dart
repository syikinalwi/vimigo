import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:vimigo/app/app_constant.dart';
import 'package:vimigo/helpers/text_style_helper.dart';
import 'package:vimigo/helpers/theme_helper.dart';
import 'package:vimigo/module/dashboard/item.dart';
import 'package:vimigo/module/dashboard/quadratic_bezier_path.dart';
import 'package:vimigo/widget/base_screen.dart';
import 'package:vimigo/widget/dropdown_animated_container.dart';
import './dashboard_controller.dart';

class DashboardPage extends GetView<DashboardController> {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
        appBar: AppBar(
          backgroundColor: context.colorWhite,
          toolbarHeight: 55,
          leading: const Icon(
            Icons.arrow_back,
            color: Colors.blue,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipOval(
                  child: SizedBox(
                height: 25,
                width: 40,
                child: Image.network(
                  "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/640px-Image_created_with_a_mobile_phone.png",
                  fit: BoxFit.cover,
                ),
              )),
            ),
            const SizedBox(
              width: gap,
            )
          ],
        ),
        body: Column(
          children: [
            Container(
              color: Colors.blueGrey,
              child: InkWell(
                onTap: () {
                  controller.isShowDropdown.toggle();
                },
                child: Container(
                  height: 40,
                  width: Get.width,
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.all(gap),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.grey,
                          width: 1,
                          style: BorderStyle.solid),
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(
                            1,
                            1,
                          ),
                          blurRadius: 1,
                          spreadRadius: .9,
                        ),
                        BoxShadow(
                          color: Colors.white,
                          offset: Offset(0.0, 0.0),
                          blurRadius: 0.0,
                          spreadRadius: 0.0,
                        ),
                      ]),
                  child: Row(
                    children: [
                      Expanded(
                        child: Obx(() {
                          return Text(
                            controller
                                .modelList[controller.selectedIndex.value].name,
                            style: TextStyleHelper.bodyRegular(
                                context.colorPrimary),
                          );
                        }),
                      ),
                      const Icon(
                        Icons.arrow_drop_down_rounded,
                        color: Colors.black,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  CustomScrollView(
                    physics: const ClampingScrollPhysics(),
                    slivers: [
                      SliverList(
                        delegate: SliverChildListDelegate([
                          drawingBezierCurve(context),
                        ]),
                      ),
                    ],
                  ),
                  customDropdown()
                ],
              ),
            )
          ],
        ));
  }

  customDropdown() {
    return Obx(() {
      return DropdownAnimatedContainer(
          visible: controller.isShowDropdown.value,
          onBackgroundTap: () {
            controller.isShowDropdown.value = false;
          },
          child: const Item());
    });
  }

  drawingBezierCurve(BuildContext context) {
    return Stack(
      children: [
        Container(
            padding: const EdgeInsets.all(gap),
            height: 1000,
            color: Colors.blueGrey.shade100,
            child: Obx(
              () {
                return CustomPaint(
                  size: Size(MediaQuery.of(context).size.width, 300),
                  painter: QuadraticBezierPath(
                      value: controller.selectedIndex.value),
                );
              },
            )),
        // level 1
        // icon
        Positioned(
          right: MediaQuery.of(context).size.width / 5,
          top: MediaQuery.of(context).size.height / 8,
          child: InkWell(onTap: () {
            bottomSheet(context, 0);
          }, child: Obx(
            () {
              return Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: controller.selectedIndex.value == 0 ||
                              controller.selectedIndex.value < 5
                          ? Colors.yellow
                          : Colors.grey),
                  child: controller.selectedIndex.value == 0 ||
                          controller.selectedIndex.value < 5
                      ? Image.asset('assets/images/unlock.png')
                      : Image.asset('assets/images/lock.png'));
            },
          )),
        ),
        // content
        Positioned(
            right: MediaQuery.of(context).size.width / 2,
            top: MediaQuery.of(context).size.height / 8,
            child: Container(
              decoration: BoxDecoration(
                  color: context.colorBgPrimary,
                  borderRadius: BorderRadius.circular(20)),
              padding: const EdgeInsets.all(gap),
              child: Text(
                "Level 1 content",
                style: TextStyleHelper.bodySemiBold(context.colorBlack),
              ),
            )),

        // level 2
        // icon
        Positioned(
          right: MediaQuery.of(context).size.width / 4 * 2.2,
          top: MediaQuery.of(context).size.height / 8 * 2.5,
          child: InkWell(onTap: () {
            bottomSheet(context, 1);
          }, child: Obx(
            () {
              return Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: controller.selectedIndex.value > 0 &&
                            controller.selectedIndex.value < 5
                        ? Colors.yellow
                        : Colors.grey),
                child: controller.selectedIndex.value > 0 &&
                        controller.selectedIndex.value < 5
                    ? Image.asset('assets/images/unlock.png')
                    : Image.asset('assets/images/lock.png'),
              );
            },
          )),
        ),
        // content
        Positioned(
            right: MediaQuery.of(context).size.width / 5,
            top: MediaQuery.of(context).size.height / 8 * 3,
            child: Container(
              decoration: BoxDecoration(
                  color: context.colorBgPrimary,
                  borderRadius: BorderRadius.circular(20)),
              padding: const EdgeInsets.all(gap),
              child: Text(
                "Level 2 content",
                style: TextStyleHelper.bodySemiBold(context.colorBlack),
              ),
            )),

        // level 3
        // icon
        Positioned(
          right: MediaQuery.of(context).size.width / 5,
          top: MediaQuery.of(context).size.height / 8 * 5.5,
          child: InkWell(onTap: () {
            bottomSheet(context, 2);
          }, child: Obx(
            () {
              return Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: controller.selectedIndex.value > 1 &&
                            controller.selectedIndex.value < 5
                        ? Colors.yellow
                        : Colors.grey),
                child: controller.selectedIndex.value > 1 &&
                        controller.selectedIndex.value < 5
                    ? Image.asset('assets/images/unlock.png')
                    : Image.asset('assets/images/lock.png'),
              );
            },
          )),
        ),
        // content
        Positioned(
            right: MediaQuery.of(context).size.width / 2,
            top: MediaQuery.of(context).size.height / 8 * 5.5,
            child: Container(
              decoration: BoxDecoration(
                  color: context.colorBgPrimary,
                  borderRadius: BorderRadius.circular(20)),
              padding: const EdgeInsets.all(gap),
              child: Text(
                "Level 3 content",
                style: TextStyleHelper.bodySemiBold(context.colorBlack),
              ),
            )),

        // level 4
        // icon
        Positioned(
          right: MediaQuery.of(context).size.width / 4 * 2.2,
          bottom: MediaQuery.of(context).size.height / 8 * 3,
          child: InkWell(onTap: () {
            bottomSheet(context, 3);
          }, child: Obx(
            () {
              return Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: controller.selectedIndex.value > 2 &&
                            controller.selectedIndex.value < 5
                        ? Colors.yellow
                        : Colors.grey),
                child: controller.selectedIndex.value > 2 &&
                        controller.selectedIndex.value < 5
                    ? Image.asset('assets/images/unlock.png')
                    : Image.asset('assets/images/lock.png'),
              );
            },
          )),
        ),
        // content
        Positioned(
            right: MediaQuery.of(context).size.width / 5,
            bottom: MediaQuery.of(context).size.height / 8 * 3,
            child: Container(
              decoration: BoxDecoration(
                  color: context.colorBgPrimary,
                  borderRadius: BorderRadius.circular(20)),
              padding: const EdgeInsets.all(gap),
              child: Text(
                "Level 4 content",
                style: TextStyleHelper.bodySemiBold(context.colorBlack),
              ),
            )),

        // level 5
        // icon
        Positioned(
          right: MediaQuery.of(context).size.width / 5,
          bottom: MediaQuery.of(context).size.height / 8,
          child: InkWell(onTap: () {
            bottomSheet(context, 4);
          }, child: Obx(
            () {
              return Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: controller.selectedIndex.value > 3 &&
                            controller.selectedIndex.value < 5
                        ? Colors.yellow
                        : Colors.grey),
                child: controller.selectedIndex.value > 3 &&
                        controller.selectedIndex.value < 5
                    ? Image.asset('assets/images/unlock.png')
                    : Image.asset('assets/images/lock.png'),
              );
            },
          )),
        ),
        // content
        Positioned(
            right: MediaQuery.of(context).size.width / 2,
            bottom: MediaQuery.of(context).size.height / 8,
            child: Container(
              decoration: BoxDecoration(
                  color: context.colorBgPrimary,
                  borderRadius: BorderRadius.circular(20)),
              padding: const EdgeInsets.all(gap),
              child: Text(
                "Level 5 content",
                style: TextStyleHelper.bodySemiBold(context.colorBlack),
              ),
            )),
      ],
    );
  }

  bottomSheet(BuildContext context, int index) {
    showMaterialModalBottomSheet(
      context: context,
      builder: (context) => SingleChildScrollView(
        controller: ModalScrollController.of(context),
        child: Container(
          padding: const EdgeInsets.all(gap),
          color: Colors.orange,
          child: Column(
            children: [
              Text(
                controller.modelList[index].name,
                style: TextStyleHelper.h5SemiBold(context.colorBlack),
              ),
              Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of  (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum,  comes from a line in section 1.10.32.",
                style: TextStyleHelper.bodyRegular(context.colorBlack),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
