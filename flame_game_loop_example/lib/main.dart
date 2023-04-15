import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Flame.device.fullScreen();
  runApp(
    GameWidget(
      game: MyFirstGame(),
    ),
  );
}

class MyFirstGame extends FlameGame with TapDetector {
  // static final fpsTextPaint = TextPaint(
  //   style: const TextStyle(
  //     color: Colors.black,
  //     fontSize: 12,
  //   ),
  // );
  @override
  FutureOr<void> onLoad() {
    print('<game loop> onLoad() called');
    add(FpsTextComponent(position: Vector2(0, size.y - 40)));

    return super.onLoad();
  }

  @override
  void update(double dt) {
    print('<game loop> update called at delta time $dt');

    super.update(dt);
  }

  @override
  void render(Canvas canvas) {
    canvas.drawPaint(Paint()..color = Colors.red);

    // format and show the FPS for the game loop
    // var stringFormatterFPS = NumberFormat('##', 'en_US');
    // String fpsString = 'fps: ${stringFormatterFPS.format(fpsTex)}';
    // fpsTextPaint.render(canvas, fpsString, Vector2(10, 10));
    print('<game loop> render called');
    super.render(canvas);
  }

  @override
  void onTapUp(TapUpInfo info) {
    print(
        '<game loop> onTap Location: (${info.eventPosition.game.x}, ${info.eventPosition.game.y})');
  }
}
