import 'package:endless_runner/src/runner_game_session/runner_game.dart';
import 'package:endless_runner/src/style/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/palette.dart';

class RunnerGameScreen extends StatelessWidget {
  RunnerGameScreen({super.key});

  late RunnerGame game;

  Palette? palette;

  @override
  Widget build(BuildContext context) {
    game = context.watch<RunnerGame>();
    palette = context.watch<Palette>();

    return GameWidget<FlameGame>(game: game);
  }
}
