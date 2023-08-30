import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'channel_banner_model.dart';
export 'channel_banner_model.dart';

class ChannelBannerWidget extends StatefulWidget {
  const ChannelBannerWidget({
    Key? key,
    String? imageBanner,
    String? channelPageTitle,
  })  : this.imageBanner = imageBanner ?? 'asdfasdf',
        this.channelPageTitle = channelPageTitle ?? 'zxcv',
        super(key: key);

  final String imageBanner;
  final String channelPageTitle;

  @override
  _ChannelBannerWidgetState createState() => _ChannelBannerWidgetState();
}

class _ChannelBannerWidgetState extends State<ChannelBannerWidget> {
  late ChannelBannerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChannelBannerModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 1.0,
      decoration: BoxDecoration(),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: AlignmentDirectional(-0.95, 0.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 2.0),
                child: Text(
                  widget.channelPageTitle,
                  textAlign: TextAlign.start,
                  style: FlutterFlowTheme.of(context).titleMedium.override(
                        fontFamily: 'Rock Salt',
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).titleMediumFamily),
                      ),
                ),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.network(
                widget.imageBanner,
                width: MediaQuery.sizeOf(context).width * 1.0,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
