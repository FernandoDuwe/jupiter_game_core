import "package:flutter/material.dart";
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:jupiter_game_core/src/components/jupiter_joystick_arrow_key.dart';
import 'package:jupiter_game_core/src/utils/const.dart';

class JoystickDirectional extends StatefulWidget {
  final ValueChanged<JupiterJoystickDirection>? onDirectionChanged;

  const JoystickDirectional({super.key, this.onDirectionChanged});

  @override
  State<JoystickDirectional> createState() => _JoystickDirectionalState();
}

class _JoystickDirectionalState extends State<JoystickDirectional> {
  JupiterJoystickDirection _direction = JupiterJoystickDirection.idle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 120,
      child: Column(
        children: [
          JupiterJoystickArrowKey.fromDirection(
              JupiterJoystickDirection.up, updateDirection),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              JupiterJoystickArrowKey.fromDirection(
                  JupiterJoystickDirection.left, updateDirection),
              JupiterJoystickArrowKey.fromDirection(
                  JupiterJoystickDirection.right, updateDirection),
            ],
          ),
          JupiterJoystickArrowKey.fromDirection(
              JupiterJoystickDirection.down, updateDirection),
        ],
      ),
    );
  }

  void updateDirection(JupiterJoystickDirection prNewDirection) {
    this._direction = prNewDirection;

    widget.onDirectionChanged!(this._direction);
  }
}
