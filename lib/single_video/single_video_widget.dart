import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'single_video_model.dart';
export 'single_video_model.dart';

class SingleVideoWidget extends StatefulWidget {
  const SingleVideoWidget({
    Key? key,
    this.videoId,
    this.title,
    this.channelThumbnail,
    required this.channelTitle,
    required this.channelId,
    required this.channelBanner,
    this.allVideos,
  }) : super(key: key);

  final String? videoId;
  final String? title;
  final String? channelThumbnail;
  final String? channelTitle;
  final String? channelId;
  final String? channelBanner;
  final List<dynamic>? allVideos;

  @override
  _SingleVideoWidgetState createState() => _SingleVideoWidgetState();
}

class _SingleVideoWidgetState extends State<SingleVideoWidget> {
  late SingleVideoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SingleVideoModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'SingleVideo'});
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).secondaryText,
              size: 30.0,
            ),
            onPressed: () async {
              logFirebaseEvent('SINGLE_VIDEO_arrow_back_rounded_ICN_ON_T');
              logFirebaseEvent('IconButton_navigate_back');
              context.safePop();
              logFirebaseEvent('IconButton_custom_action');
              await actions.lockOrientation();
            },
          ),
          title: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                logFirebaseEvent('SINGLE_VIDEO_PAGE_Text_3ni1pfg4_ON_TAP');
                logFirebaseEvent('Text_navigate_to');

                context.pushNamed(
                  'SingleChannel',
                  queryParameters: {
                    'channelThumbnail': serializeParam(
                      '',
                      ParamType.String,
                    ),
                    'channelId': serializeParam(
                      '',
                      ParamType.String,
                    ),
                    'channelTitle': serializeParam(
                      '',
                      ParamType.String,
                    ),
                    'channelBanner': serializeParam(
                      widget.channelBanner,
                      ParamType.String,
                    ),
                  }.withoutNulls,
                  extra: <String, dynamic>{
                    kTransitionInfoKey: TransitionInfo(
                      hasTransition: true,
                      transitionType: PageTransitionType.fade,
                      duration: Duration(milliseconds: 0),
                    ),
                  },
                );

                logFirebaseEvent('Text_custom_action');
                await actions.lockOrientation();
              },
              child: Text(
                widget.channelTitle!,
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).titleMedium,
              ),
            ),
          ),
          actions: [
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                logFirebaseEvent('SINGLE_VIDEO_PAGE_Image_tk4cs6xt_ON_TAP');
                logFirebaseEvent('Image_navigate_to');

                context.pushNamed(
                  'SingleChannel',
                  queryParameters: {
                    'channelThumbnail': serializeParam(
                      widget.channelThumbnail,
                      ParamType.String,
                    ),
                    'channelId': serializeParam(
                      widget.channelId,
                      ParamType.String,
                    ),
                    'channelTitle': serializeParam(
                      widget.channelTitle,
                      ParamType.String,
                    ),
                    'channelBanner': serializeParam(
                      widget.channelBanner,
                      ParamType.String,
                    ),
                  }.withoutNulls,
                  extra: <String, dynamic>{
                    kTransitionInfoKey: TransitionInfo(
                      hasTransition: true,
                      transitionType: PageTransitionType.fade,
                      duration: Duration(milliseconds: 0),
                    ),
                  },
                );

                logFirebaseEvent('Image_custom_action');
                await actions.lockOrientation();
              },
              child: Image.network(
                widget.channelThumbnail!,
                width: 60.0,
                height: 100.0,
                fit: BoxFit.cover,
              ),
            ),
          ],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Align(
            alignment: AlignmentDirectional(0.0, -1.0),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: custom_widgets.YouTubePlayerPlus(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: MediaQuery.sizeOf(context).height * 1.0,
                        videoId: widget.videoId!,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
