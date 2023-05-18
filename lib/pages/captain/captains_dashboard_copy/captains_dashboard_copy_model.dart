import '/backend/backend.dart';
import '/components/bottombar/bottombar_widget.dart';
import '/components/headingbar/headingbar_widget.dart';
import '/components/no_list/no_list_widget.dart';
import '/components/web_nav/web_nav_widget.dart';
import '/flutter_flow/flutter_flow_checkbox_group.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CaptainsDashboardCopyModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for webNav component.
  late WebNavModel webNavModel;
  // Model for headingbar component.
  late HeadingbarModel headingbarModel;
  // State field(s) for TextField widget.
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Model for bottombar component.
  late BottombarModel bottombarModel;
  // State field(s) for stateCheckbox widget.
  List<String>? stateCheckboxValues;
  FormFieldController<List<String>>? stateCheckboxValueController;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    webNavModel = createModel(context, () => WebNavModel());
    headingbarModel = createModel(context, () => HeadingbarModel());
    bottombarModel = createModel(context, () => BottombarModel());
  }

  void dispose() {
    webNavModel.dispose();
    headingbarModel.dispose();
    textController?.dispose();
    bottombarModel.dispose();
  }

  /// Additional helper methods are added here.

}
