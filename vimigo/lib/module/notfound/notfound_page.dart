import 'package:get/get.dart';
import 'package:flutter/material.dart';
import './notfound_controller.dart';

class NotfoundPage extends GetView<NotfoundController> {
    
    const NotfoundPage({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(title: const Text('NotfoundPage'),),
            body: Container(),
        );
    }
}