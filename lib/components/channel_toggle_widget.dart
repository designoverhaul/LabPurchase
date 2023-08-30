import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'channel_toggle_model.dart';
export 'channel_toggle_model.dart';

class ChannelToggleWidget extends StatefulWidget {
  const ChannelToggleWidget({
    Key? key,
    this.isHidden,
    this.channelIdParam,
  }) : super(key: key);

  final bool? isHidden;
  final String? channelIdParam;

  @override
  _ChannelToggleWidgetState createState() => _ChannelToggleWidgetState();
}

class _ChannelToggleWidgetState extends State<ChannelToggleWidget> {
  late ChannelToggleModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChannelToggleModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('CHANNEL_TOGGLE_channelToggle_ON_INIT_STA');
      logFirebaseEvent('channelToggle_clear_query_cache');
      FFAppState().clearAppLevelChannelQueryCacheCache();
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Switch.adaptive(
      value: _model.switchValue ??= widget.isHidden!,
      onChanged: (newValue) async {
        setState(() => _model.switchValue = newValue!);
        if (newValue!) {
          logFirebaseEvent('CHANNEL_TOGGLE_Switch_fmxq4hvw_ON_TOGGLE');
          var _shouldSetState = false;
          logFirebaseEvent('Switch_backend_call');
          _model.apiResultgsg = await UpdateChannelVisibilityCall.call(
            uid: currentUserUid,
            channelid: widget.channelIdParam,
          );
          _shouldSetState = true;
          if ((_model.apiResultgsg?.succeeded ?? true)) {
            logFirebaseEvent('Switch_clear_query_cache');
            FFAppState().clearAppLevelChannelQueryCacheCache();
            if (_shouldSetState) setState(() {});
            return;
          } else {
            logFirebaseEvent('Switch_show_snack_bar');
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Changing channel visibility failed. Please sign in.',
                  style: TextStyle(
                    color: FlutterFlowTheme.of(context).primaryText,
                  ),
                ),
                duration: Duration(milliseconds: 4000),
                backgroundColor: FlutterFlowTheme.of(context).primary,
              ),
            );
          }

          if (_shouldSetState) setState(() {});
        } else {
          logFirebaseEvent('CHANNEL_TOGGLE_Switch_fmxq4hvw_ON_TOGGLE');
          var _shouldSetState = false;
          logFirebaseEvent('Switch_backend_call');
          _model.apiResult6s4 = await UpdateChannelVisibilityCall.call(
            uid: currentUserUid,
            channelid: widget.channelIdParam,
          );
          _shouldSetState = true;
          if ((_model.apiResult6s4?.succeeded ?? true)) {
            if (_shouldSetState) setState(() {});
            return;
          }

          logFirebaseEvent('Switch_show_snack_bar');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Changing channel visibility failed',
                style: TextStyle(
                  color: FlutterFlowTheme.of(context).primaryText,
                ),
              ),
              duration: Duration(milliseconds: 4000),
              backgroundColor: FlutterFlowTheme.of(context).primary,
            ),
          );
          if (_shouldSetState) setState(() {});
        }
      },
      activeColor: Color(0xFF382F2F),
      activeTrackColor: Color(0xFFBCBCBC),
      inactiveTrackColor: Color(0xFF17A900),
      inactiveThumbColor: Colors.white,
    );
  }
}
