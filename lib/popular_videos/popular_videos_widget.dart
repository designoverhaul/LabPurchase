import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'popular_videos_model.dart';
export 'popular_videos_model.dart';

class PopularVideosWidget extends StatefulWidget {
  const PopularVideosWidget({
    Key? key,
    this.data,
    this.videoTitleParam,
    String? channelTitle,
  })  : this.channelTitle = channelTitle ?? 'channelTitle',
        super(key: key);

  final String? data;
  final dynamic videoTitleParam;
  final String channelTitle;

  @override
  _PopularVideosWidgetState createState() => _PopularVideosWidgetState();
}

class _PopularVideosWidgetState extends State<PopularVideosWidget>
    with TickerProviderStateMixin {
  late PopularVideosModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PopularVideosModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'PopularVideos'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('POPULAR_VIDEOS_PopularVideos_ON_INIT_STA');
      logFirebaseEvent('PopularVideos_custom_action');
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
      future: GetRandomCuratedContentCall.call(
        uid: currentUserUid,
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
        final popularVideosGetRandomCuratedContentResponse = snapshot.data!;
        return GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: NestedScrollView(
              floatHeaderSlivers: true,
              headerSliverBuilder: (context, _) => [
                SliverAppBar(
                  expandedHeight: 250.0,
                  pinned: false,
                  floating: false,
                  backgroundColor:
                      FlutterFlowTheme.of(context).primaryBackground,
                  automaticallyImplyLeading: false,
                  actions: [],
                  flexibleSpace: FlexibleSpaceBar(
                    title: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: Text(
                          'POPULAR',
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .headlineMediumFamily,
                                color: Colors.white,
                                fontSize: 42.0,
                                letterSpacing: 3.0,
                                fontWeight: FontWeight.w900,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .headlineMediumFamily),
                              ),
                        ),
                      ),
                    ),
                    background: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/channel-lab-v4-12jyvp/assets/v0rcxjiiepti/aaron5000_backyard_science_inspired_by_Yanjun_Cheng_style_rhad_a9601dc2-06de-43e3-be9f-b31d3ddc99ca.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    centerTitle: true,
                    expandedTitleScale: 1.0,
                  ),
                  elevation: 2.0,
                )
              ],
              body: Builder(
                builder: (context) {
                  return SafeArea(
                    top: false,
                    child: Builder(
                      builder: (context) {
                        final allCuratedVideosListVariable =
                            GetRandomCuratedContentCall.allCuratedVideos(
                                  popularVideosGetRandomCuratedContentResponse
                                      .jsonBody,
                                )?.toList() ??
                                [];
                        return SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: List.generate(
                                allCuratedVideosListVariable.length,
                                (allCuratedVideosListVariableIndex) {
                              final allCuratedVideosListVariableItem =
                                  allCuratedVideosListVariable[
                                      allCuratedVideosListVariableIndex];
                              return Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 12.0, 0.0, 8.0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(),
                                  child: Align(
                                    alignment: AlignmentDirectional(-0.2, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 12.0, 0.0, 0.0),
                                      child: Wrap(
                                        spacing: 18.0,
                                        runSpacing: 18.0,
                                        alignment: WrapAlignment.start,
                                        crossAxisAlignment:
                                            WrapCrossAlignment.center,
                                        direction: Axis.horizontal,
                                        runAlignment: WrapAlignment.center,
                                        verticalDirection:
                                            VerticalDirection.down,
                                        clipBehavior: Clip.none,
                                        children: [
                                          Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.93,
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
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    logFirebaseEvent(
                                                        'POPULAR_VIDEOS_Image_0pjtjtvv_ON_TAP');
                                                    logFirebaseEvent(
                                                        'Image_navigate_to');

                                                    context.pushNamed(
                                                      'SingleVideo',
                                                      queryParameters: {
                                                        'videoId':
                                                            serializeParam(
                                                          getJsonField(
                                                            allCuratedVideosListVariableItem,
                                                            r'''$.videoId''',
                                                          ).toString(),
                                                          ParamType.String,
                                                        ),
                                                        'title': serializeParam(
                                                          getJsonField(
                                                            allCuratedVideosListVariableItem,
                                                            r'''$.title''',
                                                          ).toString(),
                                                          ParamType.String,
                                                        ),
                                                        'channelThumbnail':
                                                            serializeParam(
                                                          getJsonField(
                                                            allCuratedVideosListVariableItem,
                                                            r'''$.channelInfo.channelThumbnail''',
                                                          ),
                                                          ParamType.String,
                                                        ),
                                                        'channelTitle':
                                                            serializeParam(
                                                          getJsonField(
                                                            allCuratedVideosListVariableItem,
                                                            r'''$.channelInfo.channelTitle''',
                                                          ).toString(),
                                                          ParamType.String,
                                                        ),
                                                        'channelId':
                                                            serializeParam(
                                                          getJsonField(
                                                            allCuratedVideosListVariableItem,
                                                            r'''$.channelInfo.channelId''',
                                                          ).toString(),
                                                          ParamType.String,
                                                        ),
                                                        'channelBanner':
                                                            serializeParam(
                                                          getJsonField(
                                                            allCuratedVideosListVariableItem,
                                                            r'''$.channelInfo.channelBanner''',
                                                          ),
                                                          ParamType.String,
                                                        ),
                                                        'allVideos':
                                                            serializeParam(
                                                          allCuratedVideosListVariableItem,
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
                                                                  .rightToLeft,
                                                        ),
                                                      },
                                                    );
                                                  },
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                    child: Image.network(
                                                      getJsonField(
                                                        allCuratedVideosListVariableItem,
                                                        r'''$.standardThumbnail''',
                                                      ),
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          1.0,
                                                      fit: BoxFit.contain,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 8.0, 0.0, 8.0),
                                                  child: Text(
                                                    getJsonField(
                                                      allCuratedVideosListVariableItem,
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
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 15.0,
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
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 8.0),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      logFirebaseEvent(
                                                          'POPULAR_VIDEOS_PAGE_Row_2ql2ypll_ON_TAP');
                                                      logFirebaseEvent(
                                                          'Row_navigate_to');

                                                      context.pushNamed(
                                                        'SingleChannel',
                                                        queryParameters: {
                                                          'channelThumbnail':
                                                              serializeParam(
                                                            getJsonField(
                                                              allCuratedVideosListVariableItem,
                                                              r'''$.channelInfo.channelThumbnail''',
                                                            ),
                                                            ParamType.String,
                                                          ),
                                                          'channelId':
                                                              serializeParam(
                                                            getJsonField(
                                                              allCuratedVideosListVariableItem,
                                                              r'''$.channelInfo.channelId''',
                                                            ).toString(),
                                                            ParamType.String,
                                                          ),
                                                          'channelTitle':
                                                              serializeParam(
                                                            getJsonField(
                                                              allCuratedVideosListVariableItem,
                                                              r'''$.channelInfo.channelTitle''',
                                                            ).toString(),
                                                            ParamType.String,
                                                          ),
                                                          'channelBanner':
                                                              serializeParam(
                                                            getJsonField(
                                                              allCuratedVideosListVariableItem,
                                                              r'''$.channelInfo.channelBanner''',
                                                            ),
                                                            ParamType.String,
                                                          ),
                                                        }.withoutNulls,
                                                      );
                                                    },
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      8.0,
                                                                      0.0),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                            child:
                                                                Image.network(
                                                              getJsonField(
                                                                allCuratedVideosListVariableItem,
                                                                r'''$.channelInfo.channelThumbnail''',
                                                              ),
                                                              width: 40.0,
                                                              height: 40.0,
                                                              fit: BoxFit
                                                                  .contain,
                                                            ),
                                                          ),
                                                        ),
                                                        Text(
                                                          getJsonField(
                                                            allCuratedVideosListVariableItem,
                                                            r'''$.channelInfo.channelTitle''',
                                                          ).toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily),
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ).animateOnPageLoad(animationsMap[
                                    'containerOnPageLoadAnimation']!),
                              );
                            }),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
