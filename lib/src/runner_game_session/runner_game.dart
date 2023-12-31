import 'dart:ui';

import 'package:endless_runner/src/runner_game_session/runner_game_persistence.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/parallax.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';

const double groundHeight = 32;
const double dinoTopBottomSpacing = 10;
const int numberOfTilesAlongWidth = 10;

class RunnerGame extends FlameGame {
  final log = Logger("RunnerGameController");
  late final RunnerGamePersistence _persistence;
  SpriteAnimationComponent? _dino;
  late final ParallaxComponent _parallaxBackground;

  ValueNotifier<int> distance = ValueNotifier(0);

  RunnerGame({required RunnerGamePersistence persistence}) {
    _persistence = persistence;
    log.log(Level.INFO, "Runner game controller has been initialized!");
  }

  @override
  Future<void> onLoad() async {
    var sprite = await Sprite.load('DinoSprites_tard.gif');
    var size = Vector2.all(64);

    var dinoIdleAnimation = await createDinoIdleAnimation();
    var dinoRunAnimation = _dino = SpriteAnimationComponent(
      animation: dinoIdleAnimation,
      size: size,
    );

    var background = await createParallaxBackground();
    add(background);
    add(_dino!);
  }

  @override
  void onGameResize(Vector2 size) {
    super.onGameResize(size);

    //TODO - somthing wrong with this method!!!
    var gameSize = size.toSize();

    debugPrint(size.toString());

    if (_dino != null) {
      _dino!.height = _dino!.width = gameSize.width / numberOfTilesAlongWidth;
      _dino!.x = _dino!.width;
      _dino!.y = gameSize.height - groundHeight + dinoTopBottomSpacing;
    }
  }

  Future<SpriteAnimation> createDinoIdleAnimation() async {
    final Image image = await Flame.images.load('DinoSprites - tard.png');
    final spriteSheet =
        SpriteSheet.fromColumnsAndRows(image: image, columns: 24, rows: 1);
    final idleAnimation =
        spriteSheet.createAnimation(row: 0, from: 0, to: 3, stepTime: 0.1);

    return idleAnimation;
  }

  Future<SpriteAnimation> createDinoRunAnimation() async {
    final Image image = await Flame.images.load('DinoSprites - tard.png');
    final spriteSheet =
        SpriteSheet.fromColumnsAndRows(image: image, columns: 24, rows: 1);
    final idleAnimation =
        spriteSheet.createAnimation(row: 0, from: 4, to: 10, stepTime: 0.1);

    return idleAnimation;
  }

  Future<ParallaxComponent> createParallaxBackground() async {
    final parallax = await loadParallaxComponent(
      [1, 2, 3, 4, 5, 6].map(
        (i) => ParallaxImageData('parallax/plx-$i.png'),
      ),
      baseVelocity: Vector2(20, 0),
      velocityMultiplierDelta: Vector2(1.8, 1.0),
    );

    return parallax;
  }
}
