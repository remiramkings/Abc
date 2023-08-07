
import 'dart:io';
import 'package:just_audio/just_audio.dart';

class AudioPlayerService {
  static final String playerid = "myplayerid";
 AudioPlayer? player;

  static AudioPlayerService createInstance() {
    return AudioPlayerService();
  }

  AudioPlayer _getPlayer(){
    player ??= AudioPlayer();
    return player!;
  }

  Future<Duration?> setAudioUrl(String audioUrl) async {
    return await _getPlayer()
      .setUrl(audioUrl, preload: false);
  }

  Future<void> play() async {
    return await _getPlayer()
      .play();
  }

  Stream<Duration?> getProgressStream(){
    return _getPlayer()
      .positionStream;
  }

  // seek(Duration position){
  //   _getPlayer()
  //     .seek(position);
  // }

  
}