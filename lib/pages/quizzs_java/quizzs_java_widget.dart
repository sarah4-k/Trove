import '/backend/backend.dart';
import '/components/quiz_option_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'quizzs_java_model.dart';
export 'quizzs_java_model.dart';

class QuizzsJavaWidget extends StatefulWidget {
  const QuizzsJavaWidget({
    super.key,
    this.quizRef,
    required this.quizDuration,
  });

  final DocumentReference? quizRef;
  final int? quizDuration;

  @override
  _QuizzsJavaWidgetState createState() => _QuizzsJavaWidgetState();
}

class _QuizzsJavaWidgetState extends State<QuizzsJavaWidget> {
  late QuizzsJavaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuizzsJavaModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.instantTimer = InstantTimer.periodic(
        duration: const Duration(milliseconds: 1000),
        callback: (timer) async {
          _model.timerController.onStartTimer();
        },
        startImmediately: true,
      );
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return FutureBuilder<int>(
      future: queryQuizzesRecordCount(
        queryBuilder: (quizzesRecord) => quizzesRecord.where(
          'Quiz',
          isEqualTo: widget.quizRef,
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: const Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Color(0xFFF70003),
                  ),
                ),
              ),
            ),
          );
        }
        int quizzsJavaCount = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              automaticallyImplyLeading: false,
              title: Text(
                'Quizzes',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Roboto',
                      color: FlutterFlowTheme.of(context).secondaryText,
                      fontSize: 22.0,
                    ),
              ),
              actions: const [],
              centerTitle: false,
              elevation: 0.0,
            ),
            body: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(20.0, 48.0, 20.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              height: 36.0,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    12.0, 0.0, 12.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(
                                      Icons.access_time,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 24.0,
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          6.0, 0.0, 0.0, 0.0),
                                      child: FlutterFlowTimer(
                                        initialTime: widget.quizDuration!,
                                        getDisplayTime: (value) =>
                                            StopWatchTimer.getDisplayTime(
                                          value,
                                          hours: false,
                                          milliSecond: false,
                                        ),
                                        controller: _model.timerController,
                                        updateStateInterval:
                                            const Duration(milliseconds: 1000),
                                        onChanged:
                                            (value, displayTime, shouldUpdate) {
                                          _model.timerMilliseconds = value;
                                          _model.timerValue = displayTime;
                                          if (shouldUpdate) setState(() {});
                                        },
                                        textAlign: TextAlign.start,
                                        style: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .override(
                                              fontFamily: 'Roboto',
                                              fontSize: 20.0,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      RichText(
                        textScaleFactor: MediaQuery.of(context).textScaleFactor,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Q',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: FlutterFlowTheme.of(context).primary,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            TextSpan(
                              text: valueOrDefault<String>(
                                (_model.pageNavigate + 1).toString(),
                                '0',
                              ),
                              style: const TextStyle(),
                            ),
                            const TextSpan(
                              text: '',
                              style: TextStyle(),
                            )
                          ],
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                      ),
                      Flexible(
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.grid_view,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 24.0,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 96.0, 0.0, 0.0),
                    child: Container(
                      width: double.infinity,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: StreamBuilder<List<QuizzesRecord>>(
                              stream: queryQuizzesRecord(
                                queryBuilder: (quizzesRecord) =>
                                    quizzesRecord.where(
                                  'Quiz',
                                  isEqualTo: widget.quizRef,
                                ),
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return const Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          Color(0xFFF70003),
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<QuizzesRecord> pageViewQuizzesRecordList =
                                    snapshot.data!;
                                return SizedBox(
                                  width: double.infinity,
                                  height: 500.0,
                                  child: Stack(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 40.0),
                                        child: PageView.builder(
                                          controller: _model
                                                  .pageViewController ??=
                                              PageController(
                                                  initialPage: min(
                                                      0,
                                                      pageViewQuizzesRecordList
                                                              .length -
                                                          1)),
                                          scrollDirection: Axis.horizontal,
                                          itemCount:
                                              pageViewQuizzesRecordList.length,
                                          itemBuilder:
                                              (context, pageViewIndex) {
                                            final pageViewQuizzesRecord =
                                                pageViewQuizzesRecordList[
                                                    pageViewIndex];
                                            return Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(20.0, 24.0,
                                                          20.0, 0.0),
                                                  child: Text(
                                                    pageViewQuizzesRecord
                                                        .question,
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(20.0, 24.0,
                                                          20.0, 0.0),
                                                  child: ListView(
                                                    padding: EdgeInsets.zero,
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    12.0),
                                                        child: StreamBuilder<
                                                            List<
                                                                QuestionARecord>>(
                                                          stream:
                                                              queryQuestionARecord(
                                                            parent:
                                                                pageViewQuizzesRecord
                                                                    .reference,
                                                            singleRecord: true,
                                                          ),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return const Center(
                                                                child: SizedBox(
                                                                  width: 50.0,
                                                                  height: 50.0,
                                                                  child:
                                                                      CircularProgressIndicator(
                                                                    valueColor:
                                                                        AlwaysStoppedAnimation<
                                                                            Color>(
                                                                      Color(
                                                                          0xFFF70003),
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            }
                                                            List<QuestionARecord>
                                                                quizOptionQuestionARecordList =
                                                                snapshot.data!;
                                                            // Return an empty Container when the item does not exist.
                                                            if (snapshot.data!
                                                                .isEmpty) {
                                                              return Container();
                                                            }
                                                            final quizOptionQuestionARecord =
                                                                quizOptionQuestionARecordList
                                                                        .isNotEmpty
                                                                    ? quizOptionQuestionARecordList
                                                                        .first
                                                                    : null;
                                                            return QuizOptionWidget(
                                                              key: Key(
                                                                  'Keyayy_${pageViewIndex}_of_${pageViewQuizzesRecordList.length}'),
                                                              questionNum: 'A',
                                                              questionName:
                                                                  quizOptionQuestionARecord!
                                                                      .question,
                                                              isTrue:
                                                                  quizOptionQuestionARecord.isTrue,
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    12.0),
                                                        child: StreamBuilder<
                                                            List<
                                                                QuestionBRecord>>(
                                                          stream:
                                                              queryQuestionBRecord(
                                                            parent:
                                                                pageViewQuizzesRecord
                                                                    .reference,
                                                            singleRecord: true,
                                                          ),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return const Center(
                                                                child: SizedBox(
                                                                  width: 50.0,
                                                                  height: 50.0,
                                                                  child:
                                                                      CircularProgressIndicator(
                                                                    valueColor:
                                                                        AlwaysStoppedAnimation<
                                                                            Color>(
                                                                      Color(
                                                                          0xFFF70003),
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            }
                                                            List<QuestionBRecord>
                                                                quizOptionQuestionBRecordList =
                                                                snapshot.data!;
                                                            // Return an empty Container when the item does not exist.
                                                            if (snapshot.data!
                                                                .isEmpty) {
                                                              return Container();
                                                            }
                                                            final quizOptionQuestionBRecord =
                                                                quizOptionQuestionBRecordList
                                                                        .isNotEmpty
                                                                    ? quizOptionQuestionBRecordList
                                                                        .first
                                                                    : null;
                                                            return QuizOptionWidget(
                                                              key: Key(
                                                                  'Key623_${pageViewIndex}_of_${pageViewQuizzesRecordList.length}'),
                                                              questionNum: 'B',
                                                              questionName:
                                                                  quizOptionQuestionBRecord!
                                                                      .question,
                                                              isTrue:
                                                                  quizOptionQuestionBRecord.isTrue,
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    12.0),
                                                        child: StreamBuilder<
                                                            List<
                                                                QuestionCRecord>>(
                                                          stream:
                                                              queryQuestionCRecord(
                                                            parent:
                                                                pageViewQuizzesRecord
                                                                    .reference,
                                                            singleRecord: true,
                                                          ),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return const Center(
                                                                child: SizedBox(
                                                                  width: 50.0,
                                                                  height: 50.0,
                                                                  child:
                                                                      CircularProgressIndicator(
                                                                    valueColor:
                                                                        AlwaysStoppedAnimation<
                                                                            Color>(
                                                                      Color(
                                                                          0xFFF70003),
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            }
                                                            List<QuestionCRecord>
                                                                quizOptionQuestionCRecordList =
                                                                snapshot.data!;
                                                            // Return an empty Container when the item does not exist.
                                                            if (snapshot.data!
                                                                .isEmpty) {
                                                              return Container();
                                                            }
                                                            final quizOptionQuestionCRecord =
                                                                quizOptionQuestionCRecordList
                                                                        .isNotEmpty
                                                                    ? quizOptionQuestionCRecordList
                                                                        .first
                                                                    : null;
                                                            return QuizOptionWidget(
                                                              key: Key(
                                                                  'Keycjl_${pageViewIndex}_of_${pageViewQuizzesRecordList.length}'),
                                                              questionNum: 'C',
                                                              questionName:
                                                                  quizOptionQuestionCRecord!
                                                                      .question,
                                                              isTrue:
                                                                  quizOptionQuestionCRecord.isTrue,
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    12.0),
                                                        child: StreamBuilder<
                                                            List<
                                                                QuestionDRecord>>(
                                                          stream:
                                                              queryQuestionDRecord(
                                                            parent:
                                                                pageViewQuizzesRecord
                                                                    .reference,
                                                            singleRecord: true,
                                                          ),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return const Center(
                                                                child: SizedBox(
                                                                  width: 50.0,
                                                                  height: 50.0,
                                                                  child:
                                                                      CircularProgressIndicator(
                                                                    valueColor:
                                                                        AlwaysStoppedAnimation<
                                                                            Color>(
                                                                      Color(
                                                                          0xFFF70003),
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            }
                                                            List<QuestionDRecord>
                                                                quizOptionQuestionDRecordList =
                                                                snapshot.data!;
                                                            // Return an empty Container when the item does not exist.
                                                            if (snapshot.data!
                                                                .isEmpty) {
                                                              return Container();
                                                            }
                                                            final quizOptionQuestionDRecord =
                                                                quizOptionQuestionDRecordList
                                                                        .isNotEmpty
                                                                    ? quizOptionQuestionDRecordList
                                                                        .first
                                                                    : null;
                                                            return QuizOptionWidget(
                                                              key: Key(
                                                                  'Key4sd_${pageViewIndex}_of_${pageViewQuizzesRecordList.length}'),
                                                              questionNum: 'D',
                                                              questionName:
                                                                  quizOptionQuestionDRecord!
                                                                      .question,
                                                              isTrue:
                                                                  quizOptionQuestionDRecord.isTrue,
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            );
                                          },
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(-1.0, 1.0),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 0.0, 16.0),
                                          child: smooth_page_indicator
                                              .SmoothPageIndicator(
                                            controller: _model
                                                    .pageViewController ??=
                                                PageController(
                                                    initialPage: min(
                                                        0,
                                                        pageViewQuizzesRecordList
                                                                .length -
                                                            1)),
                                            count: pageViewQuizzesRecordList
                                                .length,
                                            axisDirection: Axis.horizontal,
                                            onDotClicked: (i) async {
                                              await _model.pageViewController!
                                                  .animateToPage(
                                                i,
                                                duration:
                                                    const Duration(milliseconds: 500),
                                                curve: Curves.ease,
                                              );
                                            },
                                            effect: smooth_page_indicator
                                                .ExpandingDotsEffect(
                                              expansionFactor: 3.0,
                                              spacing: 8.0,
                                              radius: 16.0,
                                              dotWidth: 16.0,
                                              dotHeight: 8.0,
                                              dotColor:
                                                  FlutterFlowTheme.of(context)
                                                      .accent1,
                                              activeDotColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              paintStyle: PaintingStyle.fill,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                          LinearPercentIndicator(
                            percent: valueOrDefault<double>(
                              FFAppState().CompletedQuestios / quizzsJavaCount,
                              0.0,
                            ),
                            width: 120.0,
                            lineHeight: 9.0,
                            animation: true,
                            animateFromLastPercent: true,
                            progressColor: FlutterFlowTheme.of(context).primary,
                            backgroundColor:
                                FlutterFlowTheme.of(context).accent4,
                            center: Text(
                              '50%',
                              style: FlutterFlowTheme.of(context)
                                  .headlineSmall
                                  .override(
                                    fontFamily: 'Roboto',
                                    fontSize: 9.0,
                                  ),
                            ),
                            padding: EdgeInsets.zero,
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 20.0, 24.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                if (FFAppState().CompletedQuestios > 0)
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 16.0, 0.0),
                                    child: FlutterFlowIconButton(
                                      borderColor:
                                          FlutterFlowTheme.of(context).primary,
                                      borderRadius: 12.0,
                                      borderWidth: 1.0,
                                      buttonSize: 40.0,
                                      fillColor:
                                          FlutterFlowTheme.of(context).accent1,
                                      icon: Icon(
                                        Icons.arrow_back_ios_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 24.0,
                                      ),
                                      onPressed: () async {
                                        await _model.pageViewController
                                            ?.previousPage(
                                          duration: const Duration(milliseconds: 300),
                                          curve: Curves.ease,
                                        );
                                        setState(() {
                                          _model.pageNavigate =
                                              _model.pageNavigate + -1;
                                        });
                                      },
                                    ),
                                  ),
                                if ((FFAppState().CompletedQuestios >= 0) &&
                                    (FFAppState().CompletedQuestios <
                                        quizzsJavaCount))
                                  Expanded(
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onDoubleTap: () async {
                                        context.pushNamed(
                                          'SecondPageQuizJava',
                                          queryParameters: {
                                            'scoreAchieved': serializeParam(
                                              0,
                                              ParamType.int,
                                            ),
                                            'totalQuestions': serializeParam(
                                              0,
                                              ParamType.int,
                                            ),
                                          }.withoutNulls,
                                        );
                                      },
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          await _model.pageViewController
                                              ?.nextPage(
                                            duration:
                                                const Duration(milliseconds: 300),
                                            curve: Curves.ease,
                                          );
                                          if (quizzsJavaCount !=
                                              _model.pageNavigate) {
                                            setState(() {
                                              _model.pageNavigate =
                                                  _model.pageNavigate + 1;
                                            });
                                          }
                                        },
                                        text: 'Next',
                                        options: FFButtonOptions(
                                          height: 40.0,
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 24.0, 0.0),
                                          iconPadding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .accent1,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                          elevation: 3.0,
                                          borderSide: const BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                if (FFAppState().CompletedQuestios ==
                                    quizzsJavaCount)
                                  Expanded(
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        context.goNamed(
                                          'SecondPageQuizJava',
                                          queryParameters: {
                                            'scoreAchieved': serializeParam(
                                              FFAppState().Score,
                                              ParamType.int,
                                            ),
                                            'totalQuestions': serializeParam(
                                              quizzsJavaCount,
                                              ParamType.int,
                                            ),
                                          }.withoutNulls,
                                        );

                                        FFAppState().update(() {
                                          FFAppState().CompletedQuestios = 0;
                                        });
                                      },
                                      text: 'Complete',
                                      options: FFButtonOptions(
                                        height: 40.0,
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        iconPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .accent1,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color: Colors.white,
                                              fontWeight: FontWeight.normal,
                                            ),
                                        elevation: 3.0,
                                        borderSide: const BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
