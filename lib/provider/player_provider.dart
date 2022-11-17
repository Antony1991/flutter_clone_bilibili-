/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-11-15 18:55:50
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-11-15 19:00:09
 * @FilePath: /flutter_clone_bilibili/lib/provider/player_provider.dart
 * @Description: player
 */
import 'package:flutter/material.dart';

class PlayerProvider extends ChangeNotifier {
  PlayerProvider._(
    bool hideStuff,
  ) : _hideStuff = hideStuff;
  late bool _hideStuff;

  bool get hideStuff => _hideStuff;

  set hideStuff(bool value) {
    _hideStuff = value;
    notifyListeners();
  }

  static PlayerProvider init() {
    return PlayerProvider._(true);
  }
}
