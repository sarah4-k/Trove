import '/flutter_flow/flutter_flow_util.dart';
import 'quizzes_page_write_widget.dart' show QuizzesPageWriteWidget;
import 'package:flutter/material.dart';

class QuizzesPageWriteModel extends FlutterFlowModel<QuizzesPageWriteWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for InputAnswer widget.
  FocusNode? inputAnswerFocusNode;
  TextEditingController? inputAnswerController;
  String? Function(BuildContext, String?)? inputAnswerControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    inputAnswerFocusNode?.dispose();
    inputAnswerController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
