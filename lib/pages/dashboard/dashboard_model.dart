import '/backend/backend.dart';
import '/components/headingbar/headingbar_widget.dart';
import '/components/web_nav/web_nav_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DashboardModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for webNav component.
  late WebNavModel webNavModel;
  // Model for headingbar component.
  late HeadingbarModel headingbarModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    webNavModel = createModel(context, () => WebNavModel());
    headingbarModel = createModel(context, () => HeadingbarModel());
  }

  void dispose() {
    webNavModel.dispose();
    headingbarModel.dispose();
  }

  /// Additional helper methods are added here.

}
