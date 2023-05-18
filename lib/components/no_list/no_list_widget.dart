import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'no_list_model.dart';
export 'no_list_model.dart';

class NoListWidget extends StatefulWidget {
  const NoListWidget({
    Key? key,
    this.text,
  }) : super(key: key);

  final String? text;

  @override
  _NoListWidgetState createState() => _NoListWidgetState();
}

class _NoListWidgetState extends State<NoListWidget> {
  late NoListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NoListModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
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
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
      child: Container(
        width: double.infinity,
        height: 100.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'There are no ',
              style: FlutterFlowTheme.of(context).headlineSmall.override(
                    fontFamily: 'Poppins',
                    color: FlutterFlowTheme.of(context).exampleText,
                  ),
            ),
            Text(
              widget.text!,
              style: FlutterFlowTheme.of(context).headlineSmall.override(
                    fontFamily: 'Poppins',
                    color: FlutterFlowTheme.of(context).exampleText,
                  ),
            ),
            Text(
              ' to display',
              style: FlutterFlowTheme.of(context).headlineSmall.override(
                    fontFamily: 'Poppins',
                    color: FlutterFlowTheme.of(context).exampleText,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
