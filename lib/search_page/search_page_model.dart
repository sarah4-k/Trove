import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'search_page_widget.dart' show SearchPageWidget;
import 'package:flutter/material.dart';

class SearchPageModel extends FlutterFlowModel<SearchPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for SearchTerm widget.
  FocusNode? searchTermFocusNode;
  TextEditingController? searchTermController;
  String? Function(BuildContext, String?)? searchTermControllerValidator;
  // Stores action output result for [Backend Call - API (search)] action in SearchTerm widget.
  ApiCallResponse? apiResultb3t;
  // Stores action output result for [Backend Call - API (search)] action in IconButton widget.
  ApiCallResponse? apiResulteuv;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    searchTermFocusNode?.dispose();
    searchTermController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
