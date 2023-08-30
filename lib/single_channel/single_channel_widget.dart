import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'single_channel_model.dart';
export 'single_channel_model.dart';

class SingleChannelWidget extends StatefulWidget {
  const SingleChannelWidget({
    Key? key,
    this.channelThumbnail,
    required this.channelId,
    required this.channelTitle,
    this.channelBanner,
  }) : super(key: key);

  final String? channelThumbnail;
  final String? channelId;
  final String? channelTitle;
  final String? channelBanner;

  @override
  _SingleChannelWidgetState createState() => _SingleChannelWidgetState();
}

class _SingleChannelWidgetState extends State<SingleChannelWidget> {
  late SingleChannelModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SingleChannelModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'SingleChannel'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('SINGLE_CHANNEL_SingleChannel_ON_INIT_STA');
      logFirebaseEvent('SingleChannel_custom_action');
      await actions.lockOrientation();
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ApiCallResponse>(
      future: _model.channelVideosCache(
        requestFn: () => GetVideosByChannelCall.call(
          channelId: widget.channelId,
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: SpinKitRipple(
                  color: Color(0xFFFF0000),
                  size: 50.0,
                ),
              ),
            ),
          );
        }
        final singleChannelGetVideosByChannelResponse = snapshot.data!;
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
                  logFirebaseEvent('SINGLE_CHANNEL_arrow_back_rounded_ICN_ON');
                  logFirebaseEvent('IconButton_navigate_back');
                  context.safePop();
                },
              ),
              title: Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Text(
                  widget.channelTitle!,
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Rock Salt',
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).bodyMediumFamily),
                      ),
                ),
              ),
              actions: [
                Hero(
                  tag: widget.channelThumbnail!,
                  transitionOnUserGestures: true,
                  child: Image.network(
                    widget.channelThumbnail!,
                    width: 58.0,
                    height: 100.0,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
              centerTitle: false,
              elevation: 0.0,
            ),
            body: SafeArea(
              top: true,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: 140.0,
                      constraints: BoxConstraints(
                        maxWidth: 1350.0,
                      ),
                      decoration: BoxDecoration(),
                      child: Hero(
                        tag: widget.channelBanner!,
                        transitionOnUserGestures: true,
                        child: Image.network(
                          widget.channelBanner!,
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 130.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 24.0, 0.0, 0.0),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(),
                                child: Builder(
                                  builder: (context) {
                                    final allVideosFromChannelVariable =
                                        GetVideosByChannelCall
                                                .allVideosFromChannel(
                                              singleChannelGetVideosByChannelResponse
                                                  .jsonBody,
                                            )?.toList() ??
                                            [];
                                    return Wrap(
                                      spacing: 18.0,
                                      runSpacing: 18.0,
                                      alignment: WrapAlignment.center,
                                      crossAxisAlignment:
                                          WrapCrossAlignment.center,
                                      direction: Axis.horizontal,
                                      runAlignment: WrapAlignment.center,
                                      verticalDirection: VerticalDirection.down,
                                      clipBehavior: Clip.none,
                                      children: List.generate(
                                          allVideosFromChannelVariable.length,
                                          (allVideosFromChannelVariableIndex) {
                                        final allVideosFromChannelVariableItem =
                                            allVideosFromChannelVariable[
                                                allVideosFromChannelVariableIndex];
                                        return Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          constraints: BoxConstraints(
                                            maxWidth: 450.0,
                                          ),
                                          decoration: BoxDecoration(),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  logFirebaseEvent(
                                                      'SINGLE_CHANNEL_Image_kjlm7nvl_ON_TAP');
                                                  logFirebaseEvent(
                                                      'Image_navigate_to');

                                                  context.pushNamed(
                                                    'SingleVideo',
                                                    queryParameters: {
                                                      'videoId': serializeParam(
                                                        valueOrDefault<String>(
                                                          getJsonField(
                                                            allVideosFromChannelVariableItem,
                                                            r'''$.videoId''',
                                                          ).toString(),
                                                          'gbqg5SStl9U',
                                                        ),
                                                        ParamType.String,
                                                      ),
                                                      'title': serializeParam(
                                                        valueOrDefault<String>(
                                                          getJsonField(
                                                            allVideosFromChannelVariableItem,
                                                            r'''$.title''',
                                                          ).toString(),
                                                          'defa',
                                                        ),
                                                        ParamType.String,
                                                      ),
                                                      'channelThumbnail':
                                                          serializeParam(
                                                        widget.channelThumbnail,
                                                        ParamType.String,
                                                      ),
                                                      'channelTitle':
                                                          serializeParam(
                                                        widget.channelTitle,
                                                        ParamType.String,
                                                      ),
                                                      'channelId':
                                                          serializeParam(
                                                        widget.channelId,
                                                        ParamType.String,
                                                      ),
                                                      'channelBanner':
                                                          serializeParam(
                                                        widget.channelBanner,
                                                        ParamType.String,
                                                      ),
                                                      'allVideos':
                                                          serializeParam(
                                                        allVideosFromChannelVariableItem,
                                                        ParamType.JSON,
                                                        true,
                                                      ),
                                                    }.withoutNulls,
                                                    extra: <String, dynamic>{
                                                      kTransitionInfoKey:
                                                          TransitionInfo(
                                                        hasTransition: true,
                                                        transitionType:
                                                            PageTransitionType
                                                                .fade,
                                                        duration: Duration(
                                                            milliseconds: 0),
                                                      ),
                                                    },
                                                  );
                                                },
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          4.0),
                                                  child: Image.network(
                                                    getJsonField(
                                                      allVideosFromChannelVariableItem,
                                                      r'''$.standardThumbnail''',
                                                    ),
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        1.0,
                                                    height: 220.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 4.0, 0.0, 6.0),
                                                child: Text(
                                                  getJsonField(
                                                    allVideosFromChannelVariableItem,
                                                    r'''$.title''',
                                                  ).toString(),
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyLargeFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLargeFamily),
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      }),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
