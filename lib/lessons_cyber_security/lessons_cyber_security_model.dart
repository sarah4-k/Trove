import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'lessons_cyber_security_widget.dart' show LessonsCyberSecurityWidget;
import 'package:flutter/material.dart';

class LessonsCyberSecurityModel
    extends FlutterFlowModel<LessonsCyberSecurityWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (search)] action in LessonsCyberSecurity widget.
  ApiCallResponse? apiResultpf2;
  // Stores action output result for [Backend Call - API (search)] action in Container widget.
  ApiCallResponse? apiResultn6f;

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
