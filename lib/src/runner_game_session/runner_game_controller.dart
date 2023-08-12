import 'package:endless_runner/src/runner_game_session/runner_game_persistence.dart';
import 'package:flutter/foundation.dart';

class RunnerGameController {
  final RunnerGamePersistence _persistence;

  ValueNotifier<int> distance = ValueNotifier(0);

  RunnerGameController({required RunnerGamePersistence persistence})
      : _persistence = persistence;
}
