import '/backend/api_requests/api_calls.dart';
import '/components/video_stat_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_youtube_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'videodetails_model.dart';
export 'videodetails_model.dart';

class VideodetailsWidget extends StatefulWidget {
  const VideodetailsWidget({
    super.key,
    required this.video,
  });

  final dynamic video;

  @override
  _VideodetailsWidgetState createState() => _VideodetailsWidgetState();
}

class _VideodetailsWidgetState extends State<VideodetailsWidget> {
  late VideodetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VideodetailsModel());
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
          body: NestedScrollView(
            floatHeaderSlivers: true,
            headerSliverBuilder: (context, _) => [
              SliverAppBar(
                expandedHeight: 280.0,
                pinned: false,
                floating: false,
                backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
                automaticallyImplyLeading: false,
                actions: const [],
                flexibleSpace: FlexibleSpaceBar(
                  background: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          FlutterFlowIconButton(
                            borderRadius: 30.0,
                            borderWidth: 1.0,
                            buttonSize: 60.0,
                            icon: Icon(
                              Icons.keyboard_backspace,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 30.0,
                            ),
                            onPressed: () async {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                      FlutterFlowYoutubePlayer(
                        url: 'https://www.youtube.com/watch?v=${getJsonField(
                          widget.video,
                          r'''$.videoId''',
                        ).toString()}',
                        autoPlay: false,
                        looping: true,
                        mute: false,
                        showControls: true,
                        showFullScreen: true,
                        strictRelatedVideos: false,
                      ),
                    ],
                  ),
                ),
                centerTitle: false,
                elevation: 5.0,
              )
            ],
            body: Builder(
              builder: (context) {
                return SafeArea(
                  top: false,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            20.0, 20.0, 20.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Text(
                                getJsonField(
                                  widget.video,
                                  r'''$.title''',
                                ).toString(),
                                style: FlutterFlowTheme.of(context)
                                    .headlineLarge
                                    .override(
                                      fontFamily: 'Roboto',
                                      fontSize: 16.0,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 20.0, 0.0),
                                child: wrapWithModel(
                                  model: _model.videoStatModel1,
                                  updateCallback: () => setState(() {}),
                                  child: VideoStatWidget(
                                    author: getJsonField(
                                      widget.video,
                                      r'''$.author.title''',
                                    ).toString(),
                                    views: getJsonField(
                                      widget.video,
                                      r'''$.stats.views''',
                                    ),
                                    publishedTime: getJsonField(
                                      widget.video,
                                      r'''$.publishedTimeText''',
                                    ).toString(),
                                    showAuthor: true,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Text(
                                getJsonField(
                                  widget.video,
                                  r'''$.descriptionSnippet''',
                                ).toString(),
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider(
                        thickness: 1.0,
                        indent: 20.0,
                        endIndent: 20.0,
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            20.0, 10.0, 20.0, 20.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'more content',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    fontSize: 16.0,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      FutureBuilder<ApiCallResponse>(
                        future: RetrieveChanelVideoCall.call(
                          id: getJsonField(
                            widget.video,
                            r'''$.author.channelId''',
                          ).toString(),
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return const Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    Color(0xFFF70003),
                                  ),
                                ),
                              ),
                            );
                          }
                          final columnRetrieveChanelVideoResponse =
                              snapshot.data!;
                          return Builder(
                            builder: (context) {
                              final channelvid =
                                  RetrieveChanelVideoCall.contents(
                                        columnRetrieveChanelVideoResponse
                                            .jsonBody,
                                      )?.toList() ??
                                      [];
                              return SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: List.generate(channelvid.length,
                                      (channelvidIndex) {
                                    final channelvidItem =
                                        channelvid[channelvidIndex];
                                    return Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          20.0, 0.0, 20.0, 20.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 15.0, 0.0),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Image.network(
                                                getJsonField(
                                                  channelvidItem,
                                                  r'''$.thumbnails[0].url''',
                                                ).toString(),
                                                width: 80.0,
                                                height: 80.0,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 15.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                          getJsonField(
                                                            channelvidItem,
                                                            r'''$.title''',
                                                          ).toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: VideoStatWidget(
                                                        key: Key(
                                                            'Key8gy_${channelvidIndex}_of_${channelvid.length}'),
                                                        author: getJsonField(
                                                          channelvidItem,
                                                          r'''$.author.title''',
                                                        ).toString(),
                                                        views: getJsonField(
                                                          channelvidItem,
                                                          r'''$.stats.views''',
                                                        ),
                                                        publishedTime:
                                                            getJsonField(
                                                          channelvidItem,
                                                          r'''$.publishedTimeText''',
                                                        ).toString(),
                                                        showAuthor: false,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
