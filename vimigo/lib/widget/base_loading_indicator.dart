import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class BaseLoadingIndicator extends StatelessWidget {
  const BaseLoadingIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white, //context.colorWhite,
          borderRadius: BorderRadius.circular(5),
        ),
        height: 60,
        width: 60,
        child: const SpinKitFadingCube(
          color: Colors.purple, //context.colorPrimary,
          size: 20.0,
        ),
      ),
    );
  }
}
