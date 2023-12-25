import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'video_stat_model.dart';
export 'video_stat_model.dart';

class VideoStatWidget extends StatefulWidget {
  const VideoStatWidget({
    super.key,
    this.author,
    this.views,
    this.publishedTime,
    required this.showAuthor,
  });

  final String? author;
  final int? views;
  final String? publishedTime;
  final bool? showAuthor;

  @override
  _VideoStatWidgetState createState() => _VideoStatWidgetState();
}

class _VideoStatWidgetState extends State<VideoStatWidget> {
  late VideoStatModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VideoStatModel());
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
          if (widget.showAuthor == true)
            Text(
              widget.author!,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Readex Pro',
                    color: FlutterFlowTheme.of(context).secondaryText,
                    fontSize: 12.0,
                  ),
            ),
          if (widget.showAuthor == true)
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
              widget.publishedTime!,
              textAlign: TextAlign.start,
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
