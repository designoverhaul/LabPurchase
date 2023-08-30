// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_youtube_view_plus/flutter_youtube_view_plus.dart';

class YouTubePlayerPlus extends StatefulWidget {
  const YouTubePlayerPlus({
    Key? key,
    this.width,
    this.height,
    required this.videoId,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String videoId;

  @override
  _YouTubePlayerPlusState createState() => _YouTubePlayerPlusState();
}

class _YouTubePlayerPlusState extends State<YouTubePlayerPlus> {
  late FlutterYoutubeViewController _controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? double.infinity,
      height: widget.height ?? 300,
      child: FlutterYoutubeViewPlus(
        onViewCreated: (controller) => _controller = controller,
        params: YoutubeParam(
          videoId: widget.videoId,
          showUI: true,
          startSeconds: 0,
          autoPlay: true,
        ),
      ),
    );
  }
}
