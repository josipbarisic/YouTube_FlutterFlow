import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'video_stats_model.dart';
export 'video_stats_model.dart';

class VideoStatsWidget extends StatefulWidget {
  const VideoStatsWidget({
    Key? key,
    required this.author,
    required this.viewCount,
    required this.publishedTime,
    bool? showAuthor,
  })  : this.showAuthor = showAuthor ?? true,
        super(key: key);

  final String? author;
  final int? viewCount;
  final String? publishedTime;
  final bool showAuthor;

  @override
  _VideoStatsWidgetState createState() => _VideoStatsWidgetState();
}

class _VideoStatsWidgetState extends State<VideoStatsWidget> {
  late VideoStatsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VideoStatsModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        if (widget.showAuthor == true)
          Text(
            widget.author!,
            style: FlutterFlowTheme.of(context).labelSmall,
          ),
        if (widget.showAuthor == true)
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(3.0, 5.0, 3.0, 5.0),
            child: FaIcon(
              FontAwesomeIcons.solidCircle,
              color: FlutterFlowTheme.of(context).secondaryText,
              size: 5.0,
            ),
          ),
        Text(
          '${widget.viewCount?.toString()} views',
          style: FlutterFlowTheme.of(context).labelSmall,
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(3.0, 5.0, 3.0, 5.0),
          child: FaIcon(
            FontAwesomeIcons.solidCircle,
            color: FlutterFlowTheme.of(context).secondaryText,
            size: 5.0,
          ),
        ),
        Expanded(
          child: Text(
            widget.publishedTime!.maybeHandleOverflow(
              maxChars: 20,
              replacement: '…',
            ),
            maxLines: 1,
            style: FlutterFlowTheme.of(context).labelSmall,
          ),
        ),
      ],
    );
  }
}
