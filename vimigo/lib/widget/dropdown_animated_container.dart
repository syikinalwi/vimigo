import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DropdownAnimatedContainer extends StatefulWidget {
  final bool visible;
  final Widget child;
  final VoidCallback? onBackgroundTap;
  final Duration? duration;

  const DropdownAnimatedContainer({
    Key? key,
    required this.visible,
    required this.child,
    this.onBackgroundTap,
    this.duration,
  }) : super(key: key);

  @override
  State<DropdownAnimatedContainer> createState() =>
      _DropdownAnimatedContainerState();
}

class _DropdownAnimatedContainerState extends State<DropdownAnimatedContainer>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Visibility(
          visible: widget.visible,
          child: InkWell(
            onTap: widget.onBackgroundTap,
            child: Container(
              color: Colors.grey.withOpacity(0.3),
            ),
          ),
        ),
        AnimatedSize(
          duration: widget.duration ?? const Duration(milliseconds: 100),
          child: SizedBox(
            height: widget.visible ? null : 0,
            child: Container(
              padding: const EdgeInsets.only(bottom: 100),
              child: widget.child,
            ),
          ),
        ),
      ],
    );
  }
}
