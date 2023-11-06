import '/backend/api_requests/api_calls.dart';
import '/components/loading_widget.dart';
import '/components/video_stats_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'home_page_widget.dart' show HomePageWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  Local state fields for this page.

  bool isLoading = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (Search)] action in HomePage widget.
  ApiCallResponse? apiResultjat;
  // Stores action output result for [Backend Call - API (Search)] action in Container widget.
  ApiCallResponse? apiResult94u;
  // Model for Loading component.
  late LoadingModel loadingModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    loadingModel = createModel(context, () => LoadingModel());
  }

  void dispose() {
    unfocusNode.dispose();
    loadingModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
