import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

class RiveService {
  RiveFile? _feedEmotionRiveFile;

  RiveService._();
  static final RiveService instance = RiveService._();

  init() async {
    await RiveFile.initialize();
    await _initFeedEmotionRiveFile();
  }

  _initFeedEmotionRiveFile() async {
    try {
      final data = await rootBundle.load("assets/rive-emotions.riv");
      _feedEmotionRiveFile = RiveFile.import(data);
      log("_initFeedEmotionRiveFile success");
    } catch (e, s) {
      log("_initFeedEmotionRiveFile error $e $s");
    }
  }

  RiveFile? get feedEmotionRiveFile => _feedEmotionRiveFile;
}
