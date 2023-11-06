import '/backend/api_requests/api_calls.dart';
import '/components/loading_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'search_page_widget.dart' show SearchPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SearchPageModel extends FlutterFlowModel<SearchPageWidget> {
  ///  Local state fields for this page.

  bool isLoading = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for SearchTerm widget.
  FocusNode? searchTermFocusNode;
  TextEditingController? searchTermController;
  String? Function(BuildContext, String?)? searchTermControllerValidator;
  // Stores action output result for [Backend Call - API (Search)] action in SearchTerm widget.
  ApiCallResponse? apiResultxg8;
  // Model for Loading component.
  late LoadingModel loadingModel;
  // Stores action output result for [Backend Call - API (Search)] action in IconButton widget.
  ApiCallResponse? apiResultmfi;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    loadingModel = createModel(context, () => LoadingModel());
  }

  void dispose() {
    unfocusNode.dispose();
    searchTermFocusNode?.dispose();
    searchTermController?.dispose();

    loadingModel.dispose();
  }

  /// Action blocks are added here.

  Future searchFlow(BuildContext context) async {}

  /// Additional helper methods are added here.
}
