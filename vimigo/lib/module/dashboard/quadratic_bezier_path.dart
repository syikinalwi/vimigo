import 'package:flutter/material.dart';

class QuadraticBezierPath extends CustomPainter {
  var value;

  QuadraticBezierPath({required this.value});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint10 = Paint()
      ..color = value == 0 || value < 5 ? Colors.yellow : Colors.grey
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8;

    Path path10 = Path();
    path10.moveTo(size.width / 2, 0);
    path10.quadraticBezierTo(
        size.width, size.height / 8, size.width / 2, size.height / 5);
    canvas.drawPath(path10, paint10);

    Paint paint20 = Paint()
      ..color = value > 0 && value < 5 ? Colors.yellow : Colors.grey
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8;

    Path path20 = Path();
    path20.moveTo(size.width / 2, size.height / 5);
    path20.quadraticBezierTo(
        size.width / 8, size.height / 4, size.width / 2, size.height / 5 * 2);
    canvas.drawPath(path20, paint20);

    Paint paint30 = Paint()
      ..color = value > 1 && value < 5 ? Colors.yellow : Colors.grey
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8;
    Path path30 = Path();
    path30.moveTo(size.width / 2, size.height / 5 * 2);
    path30.quadraticBezierTo(
        size.width, size.height / 1.8, size.width / 2, size.height / 5 * 3);
    canvas.drawPath(path30, paint30);

    Paint paint40 = Paint()
      ..color = value > 2 && value < 5 ? Colors.yellow : Colors.grey
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8;
    Path path40 = Path();
    path40.moveTo(size.width / 2, size.height / 5 * 3);
    path40.quadraticBezierTo(
        size.width / 8, size.height / 1.5, size.width / 2, size.height / 5 * 4);
    canvas.drawPath(path40, paint40);

    Paint paint50 = Paint()
      ..color = value > 3 && value < 5 ? Colors.yellow : Colors.grey
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8;
    Path path50 = Path();
    path50.moveTo(size.width / 2, size.height / 5 * 4);
    path50.quadraticBezierTo(
        size.width, size.height, size.width / 3, size.height / 5 * 5);
    canvas.drawPath(path50, paint50);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
