import '/components/video_stat_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'videodetails_widget.dart' show VideodetailsWidget;
import 'package:flutter/material.dart';

class VideodetailsModel extends FlutterFlowModel<VideodetailsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for videoStat component.
  late VideoStatModel videoStatModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    videoStatModel = createModel(context, () => VideoStatModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    videoStatModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
