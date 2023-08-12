import 'package:endless_runner/src/runner_game_session/runner_game_controller.dart';
import 'package:endless_runner/src/style/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class RunnerGameScreen extends StatefulWidget {
  const RunnerGameScreen({super.key});

  @override
  State<RunnerGameScreen> createState() => _RunnerGameScreenState();
}

class _RunnerGameScreenState extends State<RunnerGameScreen> {
  @override
  Widget build(BuildContext context) {
    final gameController = context.watch<RunnerGameController>();
    final palette = context.watch<Palette>();

    return Scaffold(
      backgroundColor: palette.backgroundPlaySession,
      body: Text("Hello in endless runner game!"),
    );
  }
}
