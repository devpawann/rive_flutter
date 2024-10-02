import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:rive/rive.dart' as rive;
import 'package:rive_anim/rive_service.dart';

class FeedEmotionRive extends StatefulWidget {
  const FeedEmotionRive({super.key});

  @override
  State<FeedEmotionRive> createState() => _FeedEmotionRiveState();
}

class _FeedEmotionRiveState extends State<FeedEmotionRive> {
  rive.StateMachineController? _riveController;
  rive.RiveAnimation? _riveAnimationWidget;
  rive.RiveFile? riveDirect;

  @override
  void initState() {
    super.initState();
    riveDirect = RiveService.instance.feedEmotionRiveFile;
    _createRiveAnimationWidget();
  }

  @override
  Widget build(BuildContext context) {
    if (riveDirect != null) {
      return rive.RiveAnimation.direct(
        key: widget.key,
        riveDirect!,
        behavior: rive.RiveHitTestBehavior.translucent,
        artboard: "dreemz_ui_main_screen",
        onInit: _onRiveInit,
        alignment: Alignment.bottomRight,
      );
    } else {
      return rive.RiveAnimation.asset(
        "assets/rive-emotions.riv",
        behavior: rive.RiveHitTestBehavior.translucent,
        artboard: "dreemz_ui_main_screen",
        onInit: _onRiveInit,
        alignment: Alignment.bottomRight,
      );
    }
  }

  void _createRiveAnimationWidget() {
    if (_riveAnimationWidget != null) {
      return;
    }
  }

  void _onRiveInit(rive.Artboard artBoard) {
    _riveController = rive.StateMachineController.fromArtboard(
      artBoard,
      'State Machine 1',
    );

    if (_riveController != null) {
      artBoard.addController(_riveController!);
    } else {
      log('State Machine Controller not found or failed to initialize');
    }
  }

  void _toggleEmotions(bool showEmotions) {
    final res = _riveController?.getBoolInput("close_open");
    log("_toggleEmotions $showEmotions $res $showEmotions");

    res?.value = showEmotions;
    log("_toggleEmotions after  ${res?.value}");
  }
}
