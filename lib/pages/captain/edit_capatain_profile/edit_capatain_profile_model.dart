import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/bottombar/bottombar_widget.dart';
import '/components/editaddress_captain/editaddress_captain_widget.dart';
import '/components/headingbar/headingbar_widget.dart';
import '/components/web_nav/web_nav_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditCapatainProfileModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for webNav component.
  late WebNavModel webNavModel;
  // Model for headingbar component.
  late HeadingbarModel headingbarModel;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  bool isDataUploading3 = false;
  FFUploadedFile uploadedLocalFile3 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl3 = '';

  // State field(s) for Worker_FullName widget.
  TextEditingController? workerFullNameController;
  String? Function(BuildContext, String?)? workerFullNameControllerValidator;
  String? _workerFullNameControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 3) {
      return 'Requires at least 3 characters.';
    }

    if (!RegExp('^[A-Za-z\\s]+\$').hasMatch(val)) {
      return 'Enter letters only';
    }
    return null;
  }

  // State field(s) for Workers_Phn widget.
  TextEditingController? workersPhnController;
  String? Function(BuildContext, String?)? workersPhnControllerValidator;
  String? _workersPhnControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for Workers_Email widget.
  TextEditingController? workersEmailController;
  String? Function(BuildContext, String?)? workersEmailControllerValidator;
  String? _workersEmailControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp('\\S+@\\S+\\.\\S+').hasMatch(val)) {
      return 'Enter correct email address';
    }
    return null;
  }

  DateTime? datePicked;
  // State field(s) for worker_Gender widget.
  String? workerGenderValue;
  FormFieldController<String>? workerGenderValueController;
  // Model for editaddressCaptain component.
  late EditaddressCaptainModel editaddressCaptainModel;
  // State field(s) for Refferal widget.
  TextEditingController? refferalController;
  String? Function(BuildContext, String?)? refferalControllerValidator;
  // State field(s) for Adhaar_number widget.
  TextEditingController? adhaarNumberController;
  String? Function(BuildContext, String?)? adhaarNumberControllerValidator;
  String? _adhaarNumberControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 12) {
      return 'Please enter correct Aadhar number';
    }
    if (val.length > 12) {
      return 'Please enter correct Aadhar number';
    }
    if (!RegExp('^[0-9\\s]+\$').hasMatch(val)) {
      return 'Please enter correct Aadhar number';
    }
    return null;
  }

  // State field(s) for Worker_PAN widget.
  TextEditingController? workerPANController;
  String? Function(BuildContext, String?)? workerPANControllerValidator;
  String? _workerPANControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 10) {
      return 'Please enter correct PAN number';
    }
    if (val.length > 10) {
      return 'Please enter correct PAN number';
    }
    if (!RegExp('[A-Z]{5}[0-9]{4}[A-Z]{1}').hasMatch(val)) {
      return 'Please enter correct PAN number';
    }
    return null;
  }

  // State field(s) for AccountName widget.
  TextEditingController? accountNameController;
  String? Function(BuildContext, String?)? accountNameControllerValidator;
  String? _accountNameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 3) {
      return 'Requires at least 3 characters.';
    }

    if (!RegExp('^[A-Za-z\\s]+\$').hasMatch(val)) {
      return 'Enter letters only';
    }
    return null;
  }

  // State field(s) for AccountNumber widget.
  TextEditingController? accountNumberController;
  String? Function(BuildContext, String?)? accountNumberControllerValidator;
  String? _accountNumberControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 12) {
      return 'Please enter valid Account number';
    }
    if (val.length > 17) {
      return 'Please enter valid Account number';
    }
    if (!RegExp('^[0-9\\s]+\$').hasMatch(val)) {
      return 'Please enter valid Account number';
    }
    return null;
  }

  // State field(s) for BankName widget.
  TextEditingController? bankNameController;
  String? Function(BuildContext, String?)? bankNameControllerValidator;
  String? _bankNameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for IFSC widget.
  TextEditingController? ifscController;
  String? Function(BuildContext, String?)? ifscControllerValidator;
  String? _ifscControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 11) {
      return 'Please enter correct IFSC code';
    }
    if (val.length > 11) {
      return 'Please enter correct IFSC code';
    }
    if (!RegExp('^[A-Z]{4}0[A-Z0-9]{6}\$').hasMatch(val)) {
      return 'Please enter correct IFSC code';
    }
    return null;
  }

  // Model for bottombar component.
  late BottombarModel bottombarModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    webNavModel = createModel(context, () => WebNavModel());
    headingbarModel = createModel(context, () => HeadingbarModel());
    workerFullNameControllerValidator = _workerFullNameControllerValidator;
    workersPhnControllerValidator = _workersPhnControllerValidator;
    workersEmailControllerValidator = _workersEmailControllerValidator;
    editaddressCaptainModel =
        createModel(context, () => EditaddressCaptainModel());
    adhaarNumberControllerValidator = _adhaarNumberControllerValidator;
    workerPANControllerValidator = _workerPANControllerValidator;
    accountNameControllerValidator = _accountNameControllerValidator;
    accountNumberControllerValidator = _accountNumberControllerValidator;
    bankNameControllerValidator = _bankNameControllerValidator;
    ifscControllerValidator = _ifscControllerValidator;
    bottombarModel = createModel(context, () => BottombarModel());

    editaddressCaptainModel.pincodefieldControllerValidator =
        _formTextFieldValidator;
  }

  void dispose() {
    webNavModel.dispose();
    headingbarModel.dispose();
    workerFullNameController?.dispose();
    workersPhnController?.dispose();
    workersEmailController?.dispose();
    editaddressCaptainModel.dispose();
    refferalController?.dispose();
    adhaarNumberController?.dispose();
    workerPANController?.dispose();
    accountNameController?.dispose();
    accountNumberController?.dispose();
    bankNameController?.dispose();
    ifscController?.dispose();
    bottombarModel.dispose();
  }

  /// Additional helper methods are added here.

  String? _formTextFieldValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 6) {
      return 'Minimum  six characters required';
    }
    if (val.length > 6) {
      return 'Maimum  six characters required';
    }

    return null;
  }
}
