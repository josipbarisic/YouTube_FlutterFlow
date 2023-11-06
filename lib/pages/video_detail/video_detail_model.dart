import '/backend/api_requests/api_calls.dart';
import '/components/horizontal_divider_widget.dart';
import '/components/loading_widget.dart';
import '/components/video_stats_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/flutter_flow_youtube_player.dart';
import '/flutter_flow/request_manager.dart';

import 'video_detail_widget.dart' show VideoDetailWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class VideoDetailModel extends FlutterFlowModel<VideoDetailWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for VideoStats component.
  late VideoStatsModel videoStatsModel1;
  // Model for HorizontalDivider component.
  late HorizontalDividerModel horizontalDividerModel;

  /// Query cache managers for this widget.

  final _relatedContentManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> relatedContent({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _relatedContentManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearRelatedContentCache() => _relatedContentManager.clear();
  void clearRelatedContentCacheKey(String? uniqueKey) =>
      _relatedContentManager.clearRequest(uniqueKey);

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    videoStatsModel1 = createModel(context, () => VideoStatsModel());
    horizontalDividerModel =
        createModel(context, () => HorizontalDividerModel());
  }

  void dispose() {
    unfocusNode.dispose();
    videoStatsModel1.dispose();
    horizontalDividerModel.dispose();

    /// Dispose query cache managers for this widget.

    clearRelatedContentCache();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
