import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'lessons_python_widget.dart' show LessonsPythonWidget;
import 'package:flutter/material.dart';

class LessonsPythonModel extends FlutterFlowModel<LessonsPythonWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (search)] action in LessonsPython widget.
  ApiCallResponse? apiResultpu0;
  // Stores action output result for [Backend Call - API (search)] action in Container widget.
  ApiCallResponse? apiResultcbx;

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
