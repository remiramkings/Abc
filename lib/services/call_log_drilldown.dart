import 'package:flutter/material.dart';
import 'package:local_notification_project/custom_audio_player.dart';
import 'package:local_notification_project/model/call_data.dart';

class CallLogDrillDown extends StatefulWidget {
  CallData callData;
  CallLogDrillDown({
    super.key,
    required this.callData
  });

  @override
  State<CallLogDrillDown> createState() => _CallLogDrillDownState();
}

class _CallLogDrillDownState extends State<CallLogDrillDown> {

  bool canPlayAudio = false;

  @override
  Widget build(BuildContext context) {
    const audioUrl =  "https://www.learningcontainer.com/wp-content/uploads/2020/02/Kalimba.mp3";// widget.callData.recordingUrl;
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200]
      ),
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.all(12.0),
      child: widget.callData.recordingUrl.isEmpty ? const Icon(Icons.warning)
      : canPlayAudio ? CustomAudioPlayer(audioUrl: audioUrl)
        : InkWell(
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.play_arrow_outlined, size: 45,),
          ),
          onTap: () {
            setState(() {
              canPlayAudio = true;
            });
          },
        ),
    );
  }
}