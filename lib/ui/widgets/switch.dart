import 'package:flutter/material.dart';

class SwitchControl extends StatefulWidget {
  SwitchControl(
      {this.value = false,
      this.height,
      this.width,
      required this.onChanged,
      this.activeColor,
      this.toggleColor});

  bool value;
  final ValueChanged<bool> onChanged;
  final double? width;
  final double? height;
  final Color? activeColor;
  final Color? toggleColor;

  @override
  _SwitchControlState createState() => _SwitchControlState();
}

class _SwitchControlState extends State<SwitchControl> {
  Alignment switchControlAlignment = Alignment.centerLeft;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.decelerate,
        width: widget.width ?? 45,
        height: widget.height ?? 25,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0),
          color: widget.value
              ? widget.activeColor ?? Color(0xFF4F77F1)
              : Color(0xFFDCDCDC),
        ),
        child: AnimatedAlign(
          duration: const Duration(milliseconds: 300),
          alignment:
              widget.value ? Alignment.centerRight : Alignment.centerLeft,
          curve: Curves.decelerate,
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Container(
              width: (widget.width ?? 45) / 2.5,
              height: (widget.height ?? 25) / 0.5,
              decoration: BoxDecoration(
                color: widget.toggleColor ?? Color(0xFFFFFFFF),
                borderRadius: BorderRadius.circular(100.0),
              ),
            ),
          ),
        ),
      ),
      onTap: () {
        setState(() {
          widget.value = !widget.value;
          widget.onChanged(widget.value);
        });
      },
    );
  }
}
