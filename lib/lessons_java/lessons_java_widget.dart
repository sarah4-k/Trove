import '/backend/api_requests/api_calls.dart';
import '/components/video_stat_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_youtube_player.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'lessons_java_model.dart';
export 'lessons_java_model.dart';

class LessonsJavaWidget extends StatefulWidget {
  const LessonsJavaWidget({
    super.key,
    this.quizReff,
  });

  final DocumentReference? quizReff;

  @override
  _LessonsJavaWidgetState createState() => _LessonsJavaWidgetState();
}

class _LessonsJavaWidgetState extends State<LessonsJavaWidget> {
  late LessonsJavaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LessonsJavaModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (FFAppState().initialSearch != '') {
        _model.apiResultzj4 = await SearchCall.call(
          apiQuery: FFAppState().initialSearch,
        );
        if ((_model.apiResultzj4?.succeeded ?? true)) {
          setState(() {
            FFAppState().searchresults = SearchCall.video(
              (_model.apiResultzj4?.jsonBody ?? ''),
            )!
                .toList()
                .cast<dynamic>();
          });
          setState(() {
            FFAppState().SearchRefinements = getJsonField(
              (_model.apiResultzj4?.jsonBody ?? ''),
              r'''$.refinements''',
              true,
            )!
                .toList()
                .cast<dynamic>();
          });
        }
      }
    });
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

    return YoutubeFullScreenWrapper(
      child: GestureDetector(
        onTap: () => _model.unfocusNode.canRequestFocus
            ? FocusScope.of(context).requestFocus(_model.unfocusNode)
            : FocusScope.of(context).unfocus(),
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            automaticallyImplyLeading: false,
            leading: FlutterFlowIconButton(
              borderRadius: 30.0,
              borderWidth: 1.0,
              buttonSize: 60.0,
              icon: Icon(
                Icons.keyboard_backspace,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 30.0,
              ),
              onPressed: () async {
                context.pushNamed(
                  'java',
                  queryParameters: {
                    'duration': serializeParam(
                      0,
                      ParamType.int,
                    ),
                    'quizRef': serializeParam(
                      widget.quizReff,
                      ParamType.DocumentReference,
                    ),
                  }.withoutNulls,
                );
              },
            ),
            title: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                'assets/images/learn-java-with-ubiqum-logo.png',
                width: 250.0,
                height: 54.0,
                fit: BoxFit.contain,
              ),
            ),
            actions: [
              FlutterFlowIconButton(
                borderRadius: 40.0,
                borderWidth: 1.0,
                buttonSize: 60.0,
                icon: Icon(
                  Icons.search,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 20.0,
                ),
                onPressed: () async {
                  context.pushNamed(
                    'searchPage',
                    extra: <String, dynamic>{
                      kTransitionInfoKey: const TransitionInfo(
                        hasTransition: true,
                        transitionType: PageTransitionType.bottomToTop,
                      ),
                    },
                  );
                },
              ),
            ],
            centerTitle: true,
            elevation: 5.0,
          ),
          body: SafeArea(
            top: true,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  // open vid
                  await launchURL(
                      'https://www.youtube.com/watch?v=r59xYe3Vyks&list=PLS1QulWo1RIbfTjQvTdj8Y6yyq4R7g-Al');
                },
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                        child: Builder(
                          builder: (context) {
                            final refinment =
                                FFAppState().SearchRefinements.toList();
                            return SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: List.generate(refinment.length,
                                    (refinmentIndex) {
                                  final refinmentItem =
                                      refinment[refinmentIndex];
                                  return Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 10.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        _model.apiResult8j1 =
                                            await SearchCall.call();
                                        if ((_model.apiResult8j1?.succeeded ??
                                            true)) {
                                          setState(() {
                                            FFAppState().searchresults =
                                                SearchCall.video(
                                              (_model.apiResult8j1?.jsonBody ??
                                                  ''),
                                            )!
                                                    .toList()
                                                    .cast<dynamic>();
                                          });
                                          setState(() {
                                            FFAppState().SearchRefinements =
                                                getJsonField(
                                              (_model.apiResult8j1?.jsonBody ??
                                                  ''),
                                              r'''$.refinements''',
                                              true,
                                            )!
                                                    .toList()
                                                    .cast<dynamic>();
                                          });
                                        }

                                        setState(() {});
                                      },
                                      child: Container(
                                        width: 100.0,
                                        height: 40.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(25.0),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                refinmentItem.toString(),
                                                textAlign: TextAlign.center,
                                                maxLines: 2,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      fontSize: 12.0,
                                                    ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                              ),
                            );
                          },
                        ),
                      ),
                      const Divider(
                        height: 8.0,
                        thickness: 1.0,
                        color: Color(0xFFE5E7EB),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 20.0, 0.0, 20.0),
                        child: Builder(
                          builder: (context) {
                            final video = FFAppState().searchresults.toList();
                            return ListView.builder(
                              padding: const EdgeInsets.fromLTRB(
                                0,
                                8.0,
                                0,
                                44.0,
                              ),
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: video.length,
                              itemBuilder: (context, videoIndex) {
                                final videoItem = video[videoIndex];
                                return Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 15.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Stack(
                                        alignment:
                                            const AlignmentDirectional(0.9, 0.85),
                                        children: [
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              context.pushNamed(
                                                'videodetails',
                                                queryParameters: {
                                                  'video': serializeParam(
                                                    videoItem,
                                                    ParamType.JSON,
                                                  ),
                                                }.withoutNulls,
                                                extra: <String, dynamic>{
                                                  kTransitionInfoKey:
                                                      const TransitionInfo(
                                                    hasTransition: true,
                                                    transitionType:
                                                        PageTransitionType
                                                            .rightToLeft,
                                                    duration: Duration(
                                                        milliseconds: 200),
                                                  ),
                                                },
                                              );
                                            },
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                              child: Image.network(
                                                getJsonField(
                                                  videoItem,
                                                  r'''$.thumbnails[0].url''',
                                                ).toString(),
                                                width: 750.0,
                                                height: 200.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: 70.0,
                                            height: 30.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    valueOrDefault<String>(
                                                      functions
                                                          .newCustomFunction(
                                                              getJsonField(
                                                        videoItem,
                                                        r'''$.lengthSeconds''',
                                                      )),
                                                      '0',
                                                    ),
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 20.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 10.0, 0.0),
                                              child: Container(
                                                width: 50.0,
                                                height: 50.0,
                                                clipBehavior: Clip.antiAlias,
                                                decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Image.network(
                                                  getJsonField(
                                                    videoItem,
                                                    r'''$.author.avatar[0].url''',
                                                  ).toString(),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                          getJsonField(
                                                            videoItem,
                                                            r'''$.title''',
                                                          ).toString(),
                                                          maxLines: 1,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  VideoStatWidget(
                                                    key: Key(
                                                        'Key95p_${videoIndex}_of_${video.length}'),
                                                    author: getJsonField(
                                                      videoItem,
                                                      r'''$.author.title''',
                                                    ).toString(),
                                                    views: getJsonField(
                                                      videoItem,
                                                      r'''$.stats.views''',
                                                    ),
                                                    publishedTime: getJsonField(
                                                      videoItem,
                                                      r'''$.publishedTimeText''',
                                                    ).toString(),
                                                    showAuthor: true,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            await launchURL(
                                'https://www.youtube.com/watch?v=r59xYe3Vyks&list=PLS1QulWo1RIbfTjQvTdj8Y6yyq4R7g-Al');
                          },
                          child: const FlutterFlowYoutubePlayer(
                            url:
                                'https://www.youtube.com/watch?v=FbviMTJ_vP8&list=PL1DUmTEdeA6K7rdxKiWJq6JIxTvHalY8f',
                            autoPlay: false,
                            looping: true,
                            mute: false,
                            showControls: true,
                            showFullScreen: true,
                            strictRelatedVideos: false,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
