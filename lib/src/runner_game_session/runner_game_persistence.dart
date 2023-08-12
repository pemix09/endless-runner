abstract class RunnerGamePersistence {
  Future<void> saveHighestScore();
  Future<int> getHighestScore();
}
