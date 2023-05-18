import '/components/address/address_widget.dart';
import '/components/bank_details/bank_details_widget.dart';
import '/components/kyc/kyc_widget.dart';
import '/components/personal_details/personal_details_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NewProfileModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // Model for PersonalDetails component.
  late PersonalDetailsModel personalDetailsModel;
  // Model for Address component.
  late AddressModel addressModel;
  // Model for KYC component.
  late KycModel kycModel;
  // Model for BankDetails component.
  late BankDetailsModel bankDetailsModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    personalDetailsModel = createModel(context, () => PersonalDetailsModel());
    addressModel = createModel(context, () => AddressModel());
    kycModel = createModel(context, () => KycModel());
    bankDetailsModel = createModel(context, () => BankDetailsModel());
  }

  void dispose() {
    personalDetailsModel.dispose();
    addressModel.dispose();
    kycModel.dispose();
    bankDetailsModel.dispose();
  }

  /// Additional helper methods are added here.

}
