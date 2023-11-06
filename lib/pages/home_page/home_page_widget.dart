import '/backend/api_requests/api_calls.dart';
import '/components/loading_widget.dart';
import '/components/video_stats_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (FFAppState().initialSearch != null &&
          FFAppState().initialSearch != '') {
        setState(() {
          _model.isLoading = true;
        });
        _model.apiResultjat = await SearchCall.call(
          searchQuery: FFAppState().initialSearch,
        );
        if ((_model.apiResultjat?.succeeded ?? true)) {
          setState(() {
            FFAppState().searchResults = SearchCall.video(
              (_model.apiResultjat?.jsonBody ?? ''),
            )!
                .toList()
                .cast<dynamic>();
          });
          setState(() {
            FFAppState().searchRefinements = getJsonField(
              (_model.apiResultjat?.jsonBody ?? ''),
              r'''$.refinements''',
              true,
            )!
                .toList()
                .cast<dynamic>();
          });
        }
      }
      setState(() {
        _model.isLoading = false;
      });
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
          title: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              'assets/images/Logo.png',
              width: 200.0,
              height: 40.0,
              fit: BoxFit.contain,
              alignment: Alignment(0.00, 0.00),
            ),
          ),
          actions: [
            FlutterFlowIconButton(
              borderWidth: 0.0,
              buttonSize: 60.0,
              icon: Icon(
                Icons.search,
                color: FlutterFlowTheme.of(context).secondaryText,
                size: 24.0,
              ),
              onPressed: () async {
                context.pushNamed(
                  'SearchPage',
                  extra: <String, dynamic>{
                    kTransitionInfoKey: TransitionInfo(
                      hasTransition: true,
                      transitionType: PageTransitionType.bottomToTop,
                    ),
                  },
                );
              },
            ),
          ],
          centerTitle: true,
          elevation: 1.0,
        ),
        body: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                  child: Builder(
                    builder: (context) {
                      final refinement =
                          FFAppState().searchRefinements.toList();
                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: List.generate(refinement.length,
                              (refinementIndex) {
                            final refinementItem = refinement[refinementIndex];
                            return Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 10.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  setState(() {
                                    _model.isLoading = true;
                                  });
                                  _model.apiResult94u = await SearchCall.call(
                                    searchQuery: refinementItem.toString(),
                                  );
                                  if ((_model.apiResult94u?.succeeded ??
                                      true)) {
                                    setState(() {
                                      FFAppState().searchResults =
                                          SearchCall.video(
                                        (_model.apiResult94u?.jsonBody ?? ''),
                                      )!
                                              .toList()
                                              .cast<dynamic>();
                                    });
                                    setState(() {
                                      FFAppState().searchRefinements =
                                          getJsonField(
                                        (_model.apiResult94u?.jsonBody ?? ''),
                                        r'''$.refinements''',
                                        true,
                                      )!
                                              .toList()
                                              .cast<dynamic>();
                                    });
                                  }
                                  setState(() {
                                    _model.isLoading = false;
                                  });

                                  setState(() {});
                                },
                                child: Material(
                                  color: Colors.transparent,
                                  elevation: 0.5,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25.0),
                                  ),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: AutoSizeText(
                                            refinementItem.toString(),
                                            textAlign: TextAlign.center,
                                            maxLines: 2,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Open Sans',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  fontSize: 12.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
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
              ),
              if (_model.isLoading == true)
                Expanded(
                  flex: 1,
                  child: wrapWithModel(
                    model: _model.loadingModel,
                    updateCallback: () => setState(() {}),
                    child: LoadingWidget(),
                  ),
                ),
              Expanded(
                flex: 8,
                child: Builder(
                  builder: (context) {
                    final video = FFAppState().searchResults.toList();
                    return ListView.separated(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: video.length,
                      separatorBuilder: (_, __) => SizedBox(height: () {
                        if (MediaQuery.sizeOf(context).width <
                            kBreakpointSmall) {
                          return 20.0;
                        } else if (MediaQuery.sizeOf(context).width <
                            kBreakpointMedium) {
                          return 30.0;
                        } else if (MediaQuery.sizeOf(context).width <
                            kBreakpointLarge) {
                          return 40.0;
                        } else {
                          return 50.0;
                        }
                      }()),
                      itemBuilder: (context, videoIndex) {
                        final videoItem = video[videoIndex];
                        return Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(20.00, 0.20),
                              child: Stack(
                                alignment: AlignmentDirectional(0.8, 0.85),
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0.00, 0.00),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed(
                                          'VideoDetail',
                                          queryParameters: {
                                            'video': serializeParam(
                                              videoItem,
                                              ParamType.JSON,
                                            ),
                                          }.withoutNulls,
                                          extra: <String, dynamic>{
                                            kTransitionInfoKey: TransitionInfo(
                                              hasTransition: true,
                                              transitionType: PageTransitionType
                                                  .rightToLeft,
                                              duration:
                                                  Duration(milliseconds: 200),
                                            ),
                                          },
                                        );
                                      },
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        child: CachedNetworkImage(
                                          fadeInDuration:
                                              Duration(milliseconds: 300),
                                          fadeOutDuration:
                                              Duration(milliseconds: 300),
                                          imageUrl: getJsonField(
                                            videoItem,
                                            r'''$.thumbnails[0].url''',
                                          ),
                                          width: () {
                                            if (MediaQuery.sizeOf(context)
                                                    .width <
                                                kBreakpointSmall) {
                                              return double.infinity;
                                            } else if (MediaQuery.sizeOf(
                                                        context)
                                                    .width <
                                                kBreakpointMedium) {
                                              return 400.0;
                                            } else if (MediaQuery.sizeOf(
                                                        context)
                                                    .width <
                                                kBreakpointLarge) {
                                              return 600.0;
                                            } else {
                                              return 800.0;
                                            }
                                          }(),
                                          height: () {
                                            if (MediaQuery.sizeOf(context)
                                                    .width <
                                                kBreakpointSmall) {
                                              return 200.0;
                                            } else if (MediaQuery.sizeOf(
                                                        context)
                                                    .width <
                                                kBreakpointMedium) {
                                              return 300.0;
                                            } else if (MediaQuery.sizeOf(
                                                        context)
                                                    .width <
                                                kBreakpointLarge) {
                                              return 400.0;
                                            } else {
                                              return 600.0;
                                            }
                                          }(),
                                          fit: BoxFit.fitHeight,
                                          alignment: Alignment(0.00, 0.00),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.90, 0.85),
                                    child: Container(
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.00, 0.00),
                                              child: Text(
                                                valueOrDefault<String>(
                                                  functions
                                                      .formatSecondsToMinutes(
                                                          getJsonField(
                                                    videoItem,
                                                    r'''$.lengthSeconds''',
                                                  )),
                                                  '0',
                                                ),
                                                textAlign: TextAlign.center,
                                                maxLines: 1,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Open Sans',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
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
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 20.0, 0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 10.0, 0.0),
                                    child: Container(
                                      width: 50.0,
                                      height: 50.0,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: CachedNetworkImage(
                                        fadeInDuration:
                                            Duration(milliseconds: 500),
                                        fadeOutDuration:
                                            Duration(milliseconds: 500),
                                        imageUrl: getJsonField(
                                          videoItem,
                                          r'''$.author.avatar[0].url''',
                                        ),
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
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 5.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Flexible(
                                                child: AutoSizeText(
                                                  getJsonField(
                                                    videoItem,
                                                    r'''$.title''',
                                                  )
                                                      .toString()
                                                      .maybeHandleOverflow(
                                                        maxChars: 50,
                                                        replacement: '…',
                                                      ),
                                                  maxLines: 1,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Open Sans',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                  minFontSize: 14.0,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        VideoStatsWidget(
                                          key: Key(
                                              'Keyv9c_${videoIndex}_of_${video.length}'),
                                          author: getJsonField(
                                            videoItem,
                                            r'''$.author.title''',
                                          ).toString(),
                                          viewCount: getJsonField(
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
    );
  }
}
