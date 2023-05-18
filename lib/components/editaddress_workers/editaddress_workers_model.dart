import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditaddressWorkersModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // State field(s) for pincodefield widget.
  TextEditingController? pincodefieldController;
  String? Function(BuildContext, String?)? pincodefieldControllerValidator;
  // Stores action output result for [Backend Call - API (Location API)] action in pincodefield widget.
  ApiCallResponse? apiResultcci;
  // State field(s) for areadropdown widget.
  String? areadropdownValue;
  FormFieldController<String>? areadropdownValueController;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    pincodefieldController?.dispose();
  }

  /// Additional helper methods are added here.

}
