import '/backend/api_requests/api_calls.dart';
import '/components/vid_stat2_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'lessons_python_model.dart';
export 'lessons_python_model.dart';

class LessonsPythonWidget extends StatefulWidget {
  const LessonsPythonWidget({super.key});

  @override
  _LessonsPythonWidgetState createState() => _LessonsPythonWidgetState();
}

class _LessonsPythonWidgetState extends State<LessonsPythonWidget> {
  late LessonsPythonModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LessonsPythonModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (FFAppState().PintialSearch != '') {
        _model.apiResultpu0 = await SearchCall.call(
          apiQuery: FFAppState().PintialSearch,
        );
        if ((_model.apiResultpu0?.succeeded ?? true)) {
          setState(() {
            FFAppState().searchresults = SearchCall.video(
              (_model.apiResultpu0?.jsonBody ?? ''),
            )!
                .toList()
                .cast<dynamic>();
          });
          setState(() {
            FFAppState().SearchRefinements = getJsonField(
              (_model.apiResultpu0?.jsonBody ?? ''),
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

    return GestureDetector(
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
              context.safePop();
            },
          ),
          title: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              'assets/images/Python-Symbol.png',
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
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Builder(
                    builder: (context) {
                      final refinments =
                          FFAppState().SearchRefinements.toList();
                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: List.generate(refinments.length,
                              (refinmentsIndex) {
                            final refinmentsItem = refinments[refinmentsIndex];
                            return Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 10.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  _model.apiResultcbx = await SearchCall.call(
                                    apiQuery: refinmentsItem.toString(),
                                  );
                                  if ((_model.apiResultcbx?.succeeded ??
                                      true)) {
                                    setState(() {
                                      FFAppState().searchresults =
                                          SearchCall.video(
                                        (_model.apiResultcbx?.jsonBody ?? ''),
                                      )!
                                              .toList()
                                              .cast<dynamic>();
                                    });
                                    setState(() {
                                      FFAppState().SearchRefinements =
                                          getJsonField(
                                        (_model.apiResultcbx?.jsonBody ?? ''),
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
                                    borderRadius: BorderRadius.circular(25.0),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          refinmentsItem.toString(),
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
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
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                    child: Builder(
                      builder: (context) {
                        final video = FFAppState().searchresults.toList();
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: video.length,
                          itemBuilder: (context, videoIndex) {
                            final videoItem = video[videoIndex];
                            return Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 15.0),
                              child: SingleChildScrollView(
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
                                            color: FlutterFlowTheme.of(context)
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
                                                    functions.newCustomFunction(
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
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
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
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
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
                                                VidStat2Widget(
                                                  key: Key(
                                                      'Key0ze_${videoIndex}_of_${video.length}'),
                                                  author: getJsonField(
                                                    videoItem,
                                                    r'''$.author.title''',
                                                  ).toString(),
                                                  views: getJsonField(
                                                    videoItem,
                                                    r'''$.stats.views''',
                                                  ).toString(),
                                                  publishedTimeText:
                                                      getJsonField(
                                                    videoItem,
                                                    r'''$.publishedTimeText''',
                                                  ).toString(),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
