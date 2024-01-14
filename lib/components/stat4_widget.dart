import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'stat4_model.dart';
export 'stat4_model.dart';

class Stat4Widget extends StatefulWidget {
  const Stat4Widget({
    super.key,
    this.author,
    this.views,
    this.publshedTimeText,
  });

  final String? author;
  final int? views;
  final String? publshedTimeText;

  @override
  _Stat4WidgetState createState() => _Stat4WidgetState();
}

class _Stat4WidgetState extends State<Stat4Widget> {
  late Stat4Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Stat4Model());
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
            '${widget.views?.toString()}views',
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
              widget.publshedTimeText!,
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
