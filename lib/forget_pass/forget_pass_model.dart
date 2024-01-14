import '/flutter_flow/flutter_flow_util.dart';
import 'forget_pass_widget.dart' show ForgetPassWidget;
import 'package:flutter/material.dart';

class ForgetPassModel extends FlutterFlowModel<ForgetPassWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for emailAddressRecover widget.
  FocusNode? emailAddressRecoverFocusNode;
  TextEditingController? emailAddressRecoverController;
  String? Function(BuildContext, String?)?
      emailAddressRecoverControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    emailAddressRecoverFocusNode?.dispose();
    emailAddressRecoverController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
