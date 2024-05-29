import 'dart:js_interop';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jupiter_game_core/src/utils/const.dart';

class JupiterJoystickArrowKey extends StatelessWidget {
  static JupiterJoystickArrowKey fromDirection(
      JupiterJoystickDirection prDirection,
      JupiterOnChangeDirection prOnChangeDirection) {
    IconData vrIcon = Icons.abc_sharp;

    if (prDirection == JupiterJoystickDirection.up)
      vrIcon = Icons.keyboard_arrow_up;

    if (prDirection == JupiterJoystickDirection.down)
      vrIcon = Icons.keyboard_arrow_down;

    if (prDirection == JupiterJoystickDirection.left)
      vrIcon = Icons.keyboard_arrow_left;

    if (prDirection == JupiterJoystickDirection.right)
      vrIcon = Icons.keyboard_arrow_right;

    return JupiterJoystickArrowKey(
        icon: vrIcon,
        onTapDown: (p0) => prOnChangeDirection(prDirection),
        onTapUp: (p0) => prOnChangeDirection(JupiterJoystickDirection.idle),
        onLongPressDown: () => prOnChangeDirection(prDirection),
        onLongPressEnd: (p0) =>
            prOnChangeDirection(JupiterJoystickDirection.idle));
  }

  final IconData icon;
  final Function(TapDownDetails) onTapDown;
  final Function(TapUpDetails) onTapUp;
  final Function() onLongPressDown;
  final Function(LongPressEndDetails) onLongPressEnd;

  const JupiterJoystickArrowKey({
    super.key,
    required this.icon,
    required this.onTapDown,
    required this.onTapUp,
    required this.onLongPressDown,
    required this.onLongPressEnd,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: onTapDown,
      onTapUp: onTapUp,
      onLongPress: onLongPressDown,
      onLongPressEnd: onLongPressEnd,
      child: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: const Color(0x88ffffff),
          borderRadius: BorderRadius.circular(60),
        ),
        child: Icon(
          icon,
          size: 42,
        ),
      ),
    );
  }
}
