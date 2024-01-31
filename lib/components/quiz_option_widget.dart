import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'quiz_option_model.dart';
export 'quiz_option_model.dart';

class QuizOptionWidget extends StatefulWidget {
  const QuizOptionWidget({
    super.key,
    required this.questionNum,
    required this.questionName,
    required this.isTrue,
  });

  final String? questionNum;
  final String? questionName;
  final bool? isTrue;

  @override
  State<QuizOptionWidget> createState() => _QuizOptionWidgetState();
}

class _QuizOptionWidgetState extends State<QuizOptionWidget> {
  late QuizOptionModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuizOptionModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        if (widget.isTrue!) {
          if (_model.isAnswered != null) {
            setState(() {
              _model.isAnswered = null;
            });
            setState(() {
              FFAppState().CompletedQuestios =
                  FFAppState().CompletedQuestios + -1;
            });
            setState(() {
              FFAppState().Score = FFAppState().Score + -1;
            });
          } else {
            setState(() {
              _model.isAnswered = true;
            });
            setState(() {
              FFAppState().CompletedQuestios =
                  FFAppState().CompletedQuestios + 1;
            });
            setState(() {
              FFAppState().Score = FFAppState().Score + 1;
            });
          }
        } else {
          if (_model.isAnswered != null) {
            setState(() {
              _model.isAnswered = null;
            });
            setState(() {
              FFAppState().CompletedQuestios =
                  FFAppState().CompletedQuestios + -1;
            });
          } else {
            setState(() {
              _model.isAnswered = false;
            });
            setState(() {
              FFAppState().CompletedQuestios =
                  FFAppState().CompletedQuestios + 1;
            });
          }
        }
      },
      child: Container(
        width: double.infinity,
        height: 60.0,
        decoration: BoxDecoration(
          color: valueOrDefault<Color>(
            () {
              if (_model.isAnswered == true) {
                return const Color(0xFF07007E);
              } else if (_model.isAnswered == false) {
                return const Color(0xFF730303);
              } else {
                return const Color(0x00000000);
              }
            }(),
            Colors.white,
          ),
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: () {
              if (_model.isAnswered == true) {
                return const Color(0xFF180DE4);
              } else if (_model.isAnswered == false) {
                return const Color(0xFFD30B0B);
              } else {
                return const Color(0x00000000);
              }
            }(),
          ),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 36.0,
                height: 36.0,
                decoration: BoxDecoration(
                  color: () {
                    if (_model.isAnswered == true) {
                      return const Color(0xFF180DE4);
                    } else if (_model.isAnswered == false) {
                      return const Color(0xFFD30B0B);
                    } else {
                      return const Color(0x00000000);
                    }
                  }(),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: () {
                      if (_model.isAnswered == true) {
                        return const Color(0xFF180DE4);
                      } else if (_model.isAnswered == false) {
                        return const Color(0xFFD30B0B);
                      } else {
                        return const Color(0x00000000);
                      }
                    }(),
                  ),
                ),
                child: Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Text(
                    valueOrDefault<String>(
                      widget.questionNum,
                      '1',
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                child: Text(
                  valueOrDefault<String>(
                    widget.questionName,
                    'Question',
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
