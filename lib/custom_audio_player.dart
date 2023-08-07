import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:local_notification_project/services/audio_player_service.dart';


class CustomAudioPlayer extends StatefulWidget {
  String audioUrl;

  CustomAudioPlayer({super.key, required this.audioUrl});

  @override
  State<StatefulWidget> createState() {
    return CustomAudioPlayerState();
  }
}

class CustomAudioPlayerState extends State<CustomAudioPlayer> {
  AudioPlayerService audioService = AudioPlayerService.createInstance();

  Future<Duration?>? filePathFuture;
  Stream<Duration?>? progressStream;
  Stream<PlayerState>? playerStateStream;

  @override
  void initState() {
    super.initState();
    initializePlayer();
  }

  initializePlayer() {
    progressStream = audioService.getProgressStream();
    filePathFuture = audioService.setAudioUrl(widget.audioUrl);
    playerStateStream = audioService.player?.playerStateStream;
  }

  getFileNameFromPath() {
    return widget.audioUrl.split("/").last;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: FutureBuilder<Duration?>(
        future: filePathFuture,
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(
              child: SizedBox(
                height: 40,
                width: 40,
                child: CircularProgressIndicator.adaptive()
              ),
            );
          }
          return Row(
            children: [
              StreamBuilder<PlayerState>(
                stream: playerStateStream,
                builder: (context, playerStateSnapshot) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      (playerStateSnapshot.data != null
                        && playerStateSnapshot.data!.playing
                        && (playerStateSnapshot.data!.processingState == ProcessingState.loading
                          || playerStateSnapshot.data!.processingState == ProcessingState.ready))
                          ? InkWell(
                              child: const Icon(
                                Icons.pause_outlined,
                                size: 45,
                              ),
                              onTap: () {
                                audioService
                                  .player!
                                  .pause()
                                  .then((value) => {

                                  });
                              },
                            )
                          : InkWell(
                              child: const Icon(Icons.play_arrow_outlined, size: 45),
                              onTap: () {
                                if(!playerStateSnapshot.data!.playing
                                  && playerStateSnapshot.data!.processingState == ProcessingState.ready)
                                {
                                  audioService
                                    .play();
                                    return;
                                }
                                audioService
                                      .player!
                                      .seek(const Duration(seconds: 0))
                                      .then((value) => {
                                        audioService
                                          .play()
                                      });
                                
                              },
                            )
                    ],
                  );
                }
              ),
              SizedBox(width: 10,),
              Expanded(
                child: StreamBuilder<Duration?>(
                  stream: progressStream,
                  builder: (context, streamSnap) {
                    Duration current = (streamSnap.data != null) ? streamSnap.data! : const Duration(seconds: 0);
                    Duration total = audioService
                      .player!
                      .duration ?? const Duration(seconds: 0);
                    return ProgressBar(
                      progress: current,
                      total: total,
                      onSeek: (duration) {
                        audioService
                          .player!
                          .seek(duration);
                      },
                    );
                  },
                ),
              )
            ],
          );
        },
      ),
    );
  }
  @override
  void dispose() {
    if(
      audioService.player != null
      && audioService.player!.playing){
        audioService
          .player!
          .dispose();
    }
    super.dispose();
  }
}