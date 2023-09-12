import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/pay_wall_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'channels_model.dart';
export 'channels_model.dart';

class ChannelsWidget extends StatefulWidget {
  const ChannelsWidget({
    Key? key,
    this.channelData,
  }) : super(key: key);

  final dynamic channelData;

  @override
  _ChannelsWidgetState createState() => _ChannelsWidgetState();
}

class _ChannelsWidgetState extends State<ChannelsWidget> {
  late ChannelsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChannelsModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Channels'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('CHANNELS_PAGE_Channels_ON_INIT_STATE');
      logFirebaseEvent('Channels_custom_action');
      await actions.lockOrientation();
      if (loggedIn) {
        logFirebaseEvent('Channels_backend_call');
        _model.isSubscribedVariable = await IsUserSubscribedCall.call(
          uid: currentUserEmail,
        );
        if ((_model.isSubscribedVariable?.succeeded ?? true)) {
          if (getJsonField(
                (_model.isSubscribedVariable?.jsonBody ?? ''),
                r'''$.subscriber.entitlements.LabPremium''',
              ) !=
              null) {
            logFirebaseEvent('Channels_backend_call');

            await currentUserReference!.update(createUsersRecordData(
              isSubscribed: true,
            ));
          } else {
            logFirebaseEvent('Channels_backend_call');

            await currentUserReference!.update(createUsersRecordData(
              isSubscribed: false,
            ));
          }

          return;
        } else {
          return;
        }
      } else {
        return;
      }
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
      future: FFAppState().appLevelChannelQueryCache(
        requestFn: () => GetFilteredCuratedContentCall.call(
          uid: currentUserUid,
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
        final channelsGetFilteredCuratedContentResponse = snapshot.data!;
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
                      alignment: AlignmentDirectional(0.00, 0.00),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: Text(
                          'CHANNELS',
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .headlineMediumFamily,
                                color: Color(0xFFFAEEFF),
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
                      borderRadius: BorderRadius.circular(0.0),
                      child: Image.network(
                        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/channel-lab-v4-12jyvp/assets/18qfpoxz7tvd/aaron5000_boy_building_treehouse_inspired_by_Yanjun_Cheng_styl_28bf9cdc-f3f4-4fa8-a51c-0e857cbcce18.png',
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
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 18.0, 0.0, 0.0),
                      child: Builder(
                        builder: (context) {
                          final allChannelsListView = getJsonField(
                            channelsGetFilteredCuratedContentResponse.jsonBody,
                            r'''$''',
                          ).toList();
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            scrollDirection: Axis.vertical,
                            itemCount: allChannelsListView.length,
                            itemBuilder: (context, allChannelsListViewIndex) {
                              final allChannelsListViewItem =
                                  allChannelsListView[allChannelsListViewIndex];
                              return Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 16.0),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      constraints: BoxConstraints(
                                        maxWidth: 900.0,
                                      ),
                                      decoration: BoxDecoration(),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'CHANNELS_PAGE_Column_zte672ro_ON_TAP');
                                          if (getJsonField(
                                                allChannelsListViewItem,
                                                r'''$.isPremium''',
                                              ) !=
                                              null) {
                                            if (getJsonField(
                                              allChannelsListViewItem,
                                              r'''$.isPremium''',
                                            )) {
                                              if (valueOrDefault<bool>(
                                                  currentUserDocument
                                                      ?.isSubscribed,
                                                  false)) {
                                                logFirebaseEvent(
                                                    'Column_navigate_to');

                                                context.pushNamed(
                                                  'SingleChannel',
                                                  queryParameters: {
                                                    'channelThumbnail':
                                                        serializeParam(
                                                      getJsonField(
                                                        allChannelsListViewItem,
                                                        r'''$.channelThumbnail''',
                                                      ),
                                                      ParamType.String,
                                                    ),
                                                    'channelId': serializeParam(
                                                      getJsonField(
                                                        allChannelsListViewItem,
                                                        r'''$.channelId''',
                                                      ).toString(),
                                                      ParamType.String,
                                                    ),
                                                    'channelTitle':
                                                        serializeParam(
                                                      getJsonField(
                                                        allChannelsListViewItem,
                                                        r'''$.channelTitle''',
                                                      ).toString(),
                                                      ParamType.String,
                                                    ),
                                                    'channelBanner':
                                                        serializeParam(
                                                      getJsonField(
                                                        allChannelsListViewItem,
                                                        r'''$.channelBanner''',
                                                      ),
                                                      ParamType.String,
                                                    ),
                                                  }.withoutNulls,
                                                );

                                                return;
                                              } else {
                                                logFirebaseEvent(
                                                    'Column_bottom_sheet');
                                                await showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  context: context,
                                                  builder: (context) {
                                                    return GestureDetector(
                                                      onTap: () => FocusScope
                                                              .of(context)
                                                          .requestFocus(_model
                                                              .unfocusNode),
                                                      child: Padding(
                                                        padding: MediaQuery
                                                            .viewInsetsOf(
                                                                context),
                                                        child: PayWallWidget(),
                                                      ),
                                                    );
                                                  },
                                                ).then(
                                                    (value) => setState(() {}));
                                              }

                                              return;
                                            } else {
                                              logFirebaseEvent(
                                                  'Column_navigate_to');

                                              context.pushNamed(
                                                'SingleChannel',
                                                queryParameters: {
                                                  'channelThumbnail':
                                                      serializeParam(
                                                    getJsonField(
                                                      allChannelsListViewItem,
                                                      r'''$.channelThumbnail''',
                                                    ),
                                                    ParamType.String,
                                                  ),
                                                  'channelId': serializeParam(
                                                    getJsonField(
                                                      allChannelsListViewItem,
                                                      r'''$.channelId''',
                                                    ).toString(),
                                                    ParamType.String,
                                                  ),
                                                  'channelTitle':
                                                      serializeParam(
                                                    getJsonField(
                                                      allChannelsListViewItem,
                                                      r'''$.channelTitle''',
                                                    ).toString(),
                                                    ParamType.String,
                                                  ),
                                                  'channelBanner':
                                                      serializeParam(
                                                    getJsonField(
                                                      allChannelsListViewItem,
                                                      r'''$.channelBanner''',
                                                    ),
                                                    ParamType.String,
                                                  ),
                                                }.withoutNulls,
                                              );

                                              return;
                                            }
                                          } else {
                                            logFirebaseEvent(
                                                'Column_navigate_to');

                                            context.pushNamed(
                                              'SingleChannel',
                                              queryParameters: {
                                                'channelThumbnail':
                                                    serializeParam(
                                                  getJsonField(
                                                    allChannelsListViewItem,
                                                    r'''$.channelThumbnail''',
                                                  ),
                                                  ParamType.String,
                                                ),
                                                'channelId': serializeParam(
                                                  getJsonField(
                                                    allChannelsListViewItem,
                                                    r'''$.channelId''',
                                                  ).toString(),
                                                  ParamType.String,
                                                ),
                                                'channelTitle': serializeParam(
                                                  getJsonField(
                                                    allChannelsListViewItem,
                                                    r'''$.channelTitle''',
                                                  ).toString(),
                                                  ParamType.String,
                                                ),
                                                'channelBanner': serializeParam(
                                                  getJsonField(
                                                    allChannelsListViewItem,
                                                    r'''$.channelBanner''',
                                                  ),
                                                  ParamType.String,
                                                ),
                                              }.withoutNulls,
                                            );

                                            return;
                                          }
                                        },
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Hero(
                                              tag: valueOrDefault<String>(
                                                getJsonField(
                                                  allChannelsListViewItem,
                                                  r'''$.channelBanner''',
                                                ),
                                                'defaultBanner' +
                                                    '$allChannelsListViewIndex',
                                              ),
                                              transitionOnUserGestures: true,
                                              child: CachedNetworkImage(
                                                fadeInDuration:
                                                    Duration(milliseconds: 500),
                                                fadeOutDuration:
                                                    Duration(milliseconds: 500),
                                                imageUrl:
                                                    valueOrDefault<String>(
                                                  getJsonField(
                                                    allChannelsListViewItem,
                                                    r'''$.channelBanner''',
                                                  ),
                                                  'defaultBanner',
                                                ),
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        1.0,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 0.0, 20.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    valueOrDefault<String>(
                                                      getJsonField(
                                                        allChannelsListViewItem,
                                                        r'''$.channelTitle''',
                                                      ).toString(),
                                                      'defaultTitle',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleMediumFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMediumFamily),
                                                        ),
                                                  ),
                                                  if ((getJsonField(
                                                            allChannelsListViewItem,
                                                            r'''$.isPremium''',
                                                          ) !=
                                                          null) &&
                                                      valueOrDefault<bool>(
                                                        getJsonField(
                                                          allChannelsListViewItem,
                                                          r'''$.isPremium''',
                                                        ),
                                                        true,
                                                      ) &&
                                                      !valueOrDefault<bool>(
                                                          currentUserDocument
                                                              ?.isSubscribed,
                                                          false))
                                                    AuthUserStreamWidget(
                                                      builder: (context) =>
                                                          Icon(
                                                        Icons.lock_outline,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        size: 24.0,
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
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
