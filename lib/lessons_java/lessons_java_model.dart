import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'lessons_java_widget.dart' show LessonsJavaWidget;
import 'package:flutter/material.dart';

class LessonsJavaModel extends FlutterFlowModel<LessonsJavaWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (search)] action in LessonsJava widget.
  ApiCallResponse? apiResultzj4;
  // Stores action output result for [Backend Call - API (search)] action in Container widget.
  ApiCallResponse? apiResult8j1;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
