import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'vid_stat2_model.dart';
export 'vid_stat2_model.dart';

class VidStat2Widget extends StatefulWidget {
  const VidStat2Widget({
    super.key,
    this.author,
    this.views,
    this.publishedTimeText,
  });

  final String? author;
  final String? views;
  final String? publishedTimeText;

  @override
  _VidStat2WidgetState createState() => _VidStat2WidgetState();
}

class _VidStat2WidgetState extends State<VidStat2Widget> {
  late VidStat2Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VidStat2Model());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            widget.author!,
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Readex Pro',
                  color: FlutterFlowTheme.of(context).secondaryText,
                  fontSize: 12.0,
                ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(3.0, 2.0, 3.0, 0.0),
            child: FaIcon(
              FontAwesomeIcons.solidCircle,
              color: FlutterFlowTheme.of(context).secondaryText,
              size: 5.0,
            ),
          ),
          Text(
            '${widget.views}views',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Readex Pro',
                  color: FlutterFlowTheme.of(context).secondaryText,
                  fontSize: 12.0,
                ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(3.0, 2.0, 3.0, 0.0),
            child: FaIcon(
              FontAwesomeIcons.solidCircle,
              color: FlutterFlowTheme.of(context).secondaryText,
              size: 5.0,
            ),
          ),
          Expanded(
            child: Text(
              widget.publishedTimeText!,
              maxLines: 1,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Readex Pro',
                    color: FlutterFlowTheme.of(context).secondaryText,
                    fontSize: 12.0,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
