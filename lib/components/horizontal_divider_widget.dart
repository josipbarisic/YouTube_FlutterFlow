import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'horizontal_divider_model.dart';
export 'horizontal_divider_model.dart';

class HorizontalDividerWidget extends StatefulWidget {
  const HorizontalDividerWidget({Key? key}) : super(key: key);

  @override
  _HorizontalDividerWidgetState createState() =>
      _HorizontalDividerWidgetState();
}

class _HorizontalDividerWidgetState extends State<HorizontalDividerWidget> {
  late HorizontalDividerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HorizontalDividerModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 20.0),
      child: Container(
        width: double.infinity,
        height: 1.0,
        decoration: BoxDecoration(
          color: Color(0x5957636C),
        ),
      ),
    );
  }
}
