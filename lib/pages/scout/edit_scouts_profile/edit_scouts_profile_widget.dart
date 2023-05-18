import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/bottombar/bottombar_widget.dart';
import '/components/editaddress_scouts/editaddress_scouts_widget.dart';
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
import 'edit_scouts_profile_model.dart';
export 'edit_scouts_profile_model.dart';

class EditScoutsProfileWidget extends StatefulWidget {
  const EditScoutsProfileWidget({
    Key? key,
    this.editScout,
  }) : super(key: key);

  final RecruitersRecord? editScout;

  @override
  _EditScoutsProfileWidgetState createState() =>
      _EditScoutsProfileWidgetState();
}

class _EditScoutsProfileWidgetState extends State<EditScoutsProfileWidget> {
  late EditScoutsProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditScoutsProfileModel());

    _model.fullNameController ??=
        TextEditingController(text: widget.editScout!.fullName);
    _model.workersPhnController ??=
        TextEditingController(text: widget.editScout!.phone);
    _model.workersEmailController ??=
        TextEditingController(text: widget.editScout!.email);
    _model.adhaarNumberController ??=
        TextEditingController(text: widget.editScout!.aadhar);
    _model.panController ??=
        TextEditingController(text: widget.editScout!.panNumber);
    _model.accountNameController ??=
        TextEditingController(text: widget.editScout!.accountName);
    _model.accountNumberController ??=
        TextEditingController(text: widget.editScout!.accountNumber);
    _model.bankNameController ??=
        TextEditingController(text: widget.editScout!.bankName);
    _model.ifscController ??=
        TextEditingController(text: widget.editScout!.ifscCode);
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          body: SafeArea(
            child: Visibility(
              visible: responsiveVisibility(
                context: context,
                phone: false,
                tablet: false,
                tabletLandscape: false,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  wrapWithModel(
                    model: _model.webNavModel,
                    updateCallback: () => setState(() {}),
                    child: WebNavWidget(
                      colour1: FlutterFlowTheme.of(context).tertiary,
                      colour2: FlutterFlowTheme.of(context).tertiary,
                      colour3: FlutterFlowTheme.of(context).tertiary,
                      colour4: FlutterFlowTheme.of(context).tertiary,
                      colour5: FlutterFlowTheme.of(context).tertiary,
                      colour6: FlutterFlowTheme.of(context).secondary,
                      colour7: FlutterFlowTheme.of(context).tertiary,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        wrapWithModel(
                          model: _model.headingbarModel,
                          updateCallback: () => setState(() {}),
                          child: HeadingbarWidget(
                            text: 'EDIT SCOUT PROFILE',
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 30.0, 0.0, 0.0),
                          child: Container(
                            width: double.infinity,
                            height: 169.8,
                            decoration: BoxDecoration(),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            final selectedMedia =
                                                await selectMediaWithSourceBottomSheet(
                                              context: context,
                                              allowPhoto: true,
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              textColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              pickerFontFamily: 'Lato',
                                            );
                                            if (selectedMedia != null &&
                                                selectedMedia.every((m) =>
                                                    validateFileFormat(
                                                        m.storagePath,
                                                        context))) {
                                              setState(() => _model
                                                  .isDataUploading1 = true);
                                              var selectedUploadedFiles =
                                                  <FFUploadedFile>[];
                                              var downloadUrls = <String>[];
                                              try {
                                                selectedUploadedFiles =
                                                    selectedMedia
                                                        .map((m) =>
                                                            FFUploadedFile(
                                                              name: m
                                                                  .storagePath
                                                                  .split('/')
                                                                  .last,
                                                              bytes: m.bytes,
                                                              height: m
                                                                  .dimensions
                                                                  ?.height,
                                                              width: m
                                                                  .dimensions
                                                                  ?.width,
                                                              blurHash:
                                                                  m.blurHash,
                                                            ))
                                                        .toList();

                                                downloadUrls =
                                                    (await Future.wait(
                                                  selectedMedia.map(
                                                    (m) async =>
                                                        await uploadData(
                                                            m.storagePath,
                                                            m.bytes),
                                                  ),
                                                ))
                                                        .where((u) => u != null)
                                                        .map((u) => u!)
                                                        .toList();
                                              } finally {
                                                _model.isDataUploading1 = false;
                                              }
                                              if (selectedUploadedFiles
                                                          .length ==
                                                      selectedMedia.length &&
                                                  downloadUrls.length ==
                                                      selectedMedia.length) {
                                                setState(() {
                                                  _model.uploadedLocalFile1 =
                                                      selectedUploadedFiles
                                                          .first;
                                                  _model.uploadedFileUrl1 =
                                                      downloadUrls.first;
                                                });
                                              } else {
                                                setState(() {});
                                                return;
                                              }
                                            }

                                            setState(() {
                                              FFAppState().profilepic =
                                                  _model.uploadedFileUrl1;
                                            });
                                          },
                                          child: Container(
                                            width: 140.0,
                                            height: 140.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .green,
                                              image: DecorationImage(
                                                fit: BoxFit.fill,
                                                image: Image.asset(
                                                  'assets/images/account-tie-hat.png',
                                                ).image,
                                              ),
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color: Color(0xFFBBBBBB),
                                              ),
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: 140.0,
                                                  height: 140.0,
                                                  child: Stack(
                                                    children: [
                                                      Container(
                                                        width: 140.0,
                                                        height: 140.0,
                                                        child: Stack(
                                                          children: [
                                                            Container(
                                                              width: 140.0,
                                                              height: 140.0,
                                                              child: Stack(
                                                                children: [
                                                                  Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(-1.0, -1.0),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                                                                              child: Icon(
                                                                                Icons.upload_sharp,
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                size: 24.0,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            5.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.min,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.start,
                                                                          children: [
                                                                            Text(
                                                                              'Upload  the picture',
                                                                              style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                    fontFamily: 'Poppins',
                                                                                    fontSize: 8.0,
                                                                                  ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  if (FFAppState()
                                                                              .profilepic !=
                                                                          null &&
                                                                      FFAppState()
                                                                              .profilepic !=
                                                                          '')
                                                                    ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              260.0),
                                                                      child: Image
                                                                          .network(
                                                                        FFAppState()
                                                                            .profilepic,
                                                                        width:
                                                                            259.6,
                                                                        height:
                                                                            254.7,
                                                                        fit: BoxFit
                                                                            .fill,
                                                                      ),
                                                                    ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 20.0, 0.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        if (FFAppState().profilepic != null &&
                                            FFAppState().profilepic != '')
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 16.0, 0.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                var confirmDialogResponse =
                                                    await showDialog<bool>(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return AlertDialog(
                                                              title: Text(
                                                                  'Alert !'),
                                                              content: Text(
                                                                  'Do you want to change the profile photo?'),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext,
                                                                          false),
                                                                  child: Text(
                                                                      'No'),
                                                                ),
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext,
                                                                          true),
                                                                  child: Text(
                                                                      'Yes'),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        ) ??
                                                        false;
                                                if (confirmDialogResponse) {
                                                  setState(() {
                                                    FFAppState().profilepic =
                                                        '';
                                                  });
                                                  if (FFAppState().profilepic ==
                                                          null ||
                                                      FFAppState().profilepic ==
                                                          '') {
                                                    final selectedMedia =
                                                        await selectMediaWithSourceBottomSheet(
                                                      context: context,
                                                      allowPhoto: true,
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                      textColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      pickerFontFamily: 'Lato',
                                                    );
                                                    if (selectedMedia != null &&
                                                        selectedMedia.every((m) =>
                                                            validateFileFormat(
                                                                m.storagePath,
                                                                context))) {
                                                      setState(() => _model
                                                              .isDataUploading2 =
                                                          true);
                                                      var selectedUploadedFiles =
                                                          <FFUploadedFile>[];
                                                      var downloadUrls =
                                                          <String>[];
                                                      try {
                                                        selectedUploadedFiles =
                                                            selectedMedia
                                                                .map((m) =>
                                                                    FFUploadedFile(
                                                                      name: m
                                                                          .storagePath
                                                                          .split(
                                                                              '/')
                                                                          .last,
                                                                      bytes: m
                                                                          .bytes,
                                                                      height: m
                                                                          .dimensions
                                                                          ?.height,
                                                                      width: m
                                                                          .dimensions
                                                                          ?.width,
                                                                      blurHash:
                                                                          m.blurHash,
                                                                    ))
                                                                .toList();

                                                        downloadUrls =
                                                            (await Future.wait(
                                                          selectedMedia.map(
                                                            (m) async =>
                                                                await uploadData(
                                                                    m.storagePath,
                                                                    m.bytes),
                                                          ),
                                                        ))
                                                                .where((u) =>
                                                                    u != null)
                                                                .map((u) => u!)
                                                                .toList();
                                                      } finally {
                                                        _model.isDataUploading2 =
                                                            false;
                                                      }
                                                      if (selectedUploadedFiles
                                                                  .length ==
                                                              selectedMedia
                                                                  .length &&
                                                          downloadUrls.length ==
                                                              selectedMedia
                                                                  .length) {
                                                        setState(() {
                                                          _model.uploadedLocalFile2 =
                                                              selectedUploadedFiles
                                                                  .first;
                                                          _model.uploadedFileUrl2 =
                                                              downloadUrls
                                                                  .first;
                                                        });
                                                      } else {
                                                        setState(() {});
                                                        return;
                                                      }
                                                    }

                                                    setState(() {
                                                      FFAppState().profilepic =
                                                          _model
                                                              .uploadedFileUrl2;
                                                    });
                                                  } else {
                                                    return;
                                                  }
                                                } else {
                                                  return;
                                                }
                                              },
                                              child: Container(
                                                width: 120.0,
                                                height: 40.0,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .accent1Old,
                                                  ),
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    4.0),
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            var confirmDialogResponse =
                                                                await showDialog<
                                                                        bool>(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (alertDialogContext) {
                                                                        return AlertDialog(
                                                                          title:
                                                                              Text('Alert !'),
                                                                          content:
                                                                              Text('Do you want to change the profile photo?'),
                                                                          actions: [
                                                                            TextButton(
                                                                              onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                              child: Text('No'),
                                                                            ),
                                                                            TextButton(
                                                                              onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                              child: Text('Yes'),
                                                                            ),
                                                                          ],
                                                                        );
                                                                      },
                                                                    ) ??
                                                                    false;
                                                            if (confirmDialogResponse) {
                                                              setState(() {
                                                                FFAppState()
                                                                    .profilepic = '';
                                                              });
                                                              if (FFAppState()
                                                                          .profilepic ==
                                                                      null ||
                                                                  FFAppState()
                                                                          .profilepic ==
                                                                      '') {
                                                                final selectedMedia =
                                                                    await selectMediaWithSourceBottomSheet(
                                                                  context:
                                                                      context,
                                                                  allowPhoto:
                                                                      true,
                                                                  backgroundColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .alternate,
                                                                  textColor: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  pickerFontFamily:
                                                                      'Lato',
                                                                );
                                                                if (selectedMedia !=
                                                                        null &&
                                                                    selectedMedia.every((m) =>
                                                                        validateFileFormat(
                                                                            m.storagePath,
                                                                            context))) {
                                                                  setState(() =>
                                                                      _model.isDataUploading3 =
                                                                          true);
                                                                  var selectedUploadedFiles =
                                                                      <FFUploadedFile>[];
                                                                  var downloadUrls =
                                                                      <String>[];
                                                                  try {
                                                                    selectedUploadedFiles = selectedMedia
                                                                        .map((m) => FFUploadedFile(
                                                                              name: m.storagePath.split('/').last,
                                                                              bytes: m.bytes,
                                                                              height: m.dimensions?.height,
                                                                              width: m.dimensions?.width,
                                                                              blurHash: m.blurHash,
                                                                            ))
                                                                        .toList();

                                                                    downloadUrls = (await Future
                                                                            .wait(
                                                                      selectedMedia
                                                                          .map(
                                                                        (m) async => await uploadData(
                                                                            m.storagePath,
                                                                            m.bytes),
                                                                      ),
                                                                    ))
                                                                        .where((u) =>
                                                                            u !=
                                                                            null)
                                                                        .map((u) =>
                                                                            u!)
                                                                        .toList();
                                                                  } finally {
                                                                    _model.isDataUploading3 =
                                                                        false;
                                                                  }
                                                                  if (selectedUploadedFiles
                                                                              .length ==
                                                                          selectedMedia
                                                                              .length &&
                                                                      downloadUrls
                                                                              .length ==
                                                                          selectedMedia
                                                                              .length) {
                                                                    setState(
                                                                        () {
                                                                      _model.uploadedLocalFile3 =
                                                                          selectedUploadedFiles
                                                                              .first;
                                                                      _model.uploadedFileUrl3 =
                                                                          downloadUrls
                                                                              .first;
                                                                    });
                                                                  } else {
                                                                    setState(
                                                                        () {});
                                                                    return;
                                                                  }
                                                                }

                                                                setState(() {
                                                                  FFAppState()
                                                                          .profilepic =
                                                                      _model
                                                                          .uploadedFileUrl3;
                                                                });
                                                              } else {
                                                                return;
                                                              }
                                                            } else {
                                                              return;
                                                            }
                                                          },
                                                          child: Icon(
                                                            Icons.edit,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .accent1Old,
                                                            size: 24.0,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  5.0,
                                                                  20.0,
                                                                  0.0),
                                                      child: Text(
                                                        'Edit',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Poppins',
                                                              fontSize: 18.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                            ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        if (FFAppState().profilepic != null &&
                                            FFAppState().profilepic != '')
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 16.0, 0.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                var confirmDialogResponse =
                                                    await showDialog<bool>(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return AlertDialog(
                                                              title: Text(
                                                                  'Alert !'),
                                                              content: Text(
                                                                  'Do you want to delete profile photo?'),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext,
                                                                          false),
                                                                  child: Text(
                                                                      'No'),
                                                                ),
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext,
                                                                          true),
                                                                  child: Text(
                                                                      'Yes'),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        ) ??
                                                        false;
                                                if (confirmDialogResponse) {
                                                  setState(() {
                                                    FFAppState().profilepic =
                                                        '';
                                                  });
                                                  return;
                                                } else {
                                                  return;
                                                }
                                              },
                                              child: Container(
                                                width: 120.0,
                                                height: 40.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .tertiary,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .accent1Old,
                                                  ),
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    if (FFAppState()
                                                                .profilepic !=
                                                            null &&
                                                        FFAppState()
                                                                .profilepic !=
                                                            '')
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Icon(
                                                          Icons.delete_forever,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .red,
                                                          size: 30.0,
                                                        ),
                                                      ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.75, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    5.0,
                                                                    5.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          'Delete ',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                fontSize: 18.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            width: 700.0,
                            height: 100.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 50.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 10.0, 20.0, 0.0),
                                            child: Form(
                                              key: _model.formKey,
                                              autovalidateMode:
                                                  AutovalidateMode.disabled,
                                              child: SingleChildScrollView(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  30.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        -0.75,
                                                                        0.45),
                                                                child: Text(
                                                                  'EDIT GENERAL DETAILS',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineMedium,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  10.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Text(
                                                            'Full name',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .headlineSmall,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    TextFormField(
                                                      controller: _model
                                                          .fullNameController,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        hintText:
                                                            'Enter your Full Name here',
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .textColor50,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .outlines,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .grayIcon,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .red,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        focusedErrorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .red,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        contentPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    20.0,
                                                                    32.0,
                                                                    20.0,
                                                                    12.0),
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleMedium,
                                                      textAlign:
                                                          TextAlign.start,
                                                      keyboardType:
                                                          TextInputType.name,
                                                      validator: _model
                                                          .fullNameControllerValidator
                                                          .asValidator(context),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  20.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Text(
                                                            'Phone number',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .headlineSmall,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    TextFormField(
                                                      controller: _model
                                                          .workersPhnController,
                                                      readOnly: true,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        hintText:
                                                            'Phone Number',
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .textColor50,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .outlines,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .grayIcon,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .red,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        focusedErrorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .red,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        contentPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    20.0,
                                                                    32.0,
                                                                    20.0,
                                                                    12.0),
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleMedium,
                                                      textAlign:
                                                          TextAlign.start,
                                                      keyboardType:
                                                          TextInputType.phone,
                                                      validator: _model
                                                          .workersPhnControllerValidator
                                                          .asValidator(context),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  20.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Text(
                                                            'Email',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .headlineSmall,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    TextFormField(
                                                      controller: _model
                                                          .workersEmailController,
                                                      onChanged: (_) =>
                                                          EasyDebounce.debounce(
                                                        '_model.workersEmailController',
                                                        Duration(
                                                            milliseconds: 2000),
                                                        () async {
                                                          if (_model.formKey
                                                                      .currentState ==
                                                                  null ||
                                                              !_model.formKey
                                                                  .currentState!
                                                                  .validate()) {
                                                            return;
                                                          }
                                                          if (_model
                                                                  .workerGenderValue ==
                                                              null) {
                                                            return;
                                                          }
                                                          if (_model
                                                                  .editaddressScoutsModel
                                                                  .areadropdownValue ==
                                                              null) {
                                                            return;
                                                          }
                                                        },
                                                      ),
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        hintText:
                                                            'Enter your Email here',
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .textColor50,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .outlines,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .grayIcon,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .red,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        focusedErrorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .red,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        contentPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    20.0,
                                                                    32.0,
                                                                    20.0,
                                                                    12.0),
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleMedium,
                                                      textAlign:
                                                          TextAlign.start,
                                                      keyboardType:
                                                          TextInputType
                                                              .emailAddress,
                                                      validator: _model
                                                          .workersEmailControllerValidator
                                                          .asValidator(context),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  20.0,
                                                                  20.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -0.02,
                                                                    0.07),
                                                            child: Text(
                                                              'Date of birth',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .headlineSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Expanded(
                                                          child: Container(
                                                            width: 643.3,
                                                            height: 60.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        8.0),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        0.0),
                                                                topLeft: Radius
                                                                    .circular(
                                                                        8.0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        0.0),
                                                              ),
                                                              border:
                                                                  Border.all(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .lineColor,
                                                                width: 2.0,
                                                              ),
                                                            ),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                if ((FFAppState()
                                                                            .eligibilitycheck ==
                                                                        '1') ||
                                                                    (FFAppState()
                                                                            .eligibilitycheck ==
                                                                        '2'))
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            20.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        FFAppState().eligibilitycheck ==
                                                                                '1'
                                                                            ? dateTimeFormat('yMd',
                                                                                _model.datePicked)
                                                                            : widget.editScout!.dob,
                                                                        'dd',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleMedium,
                                                                    ),
                                                                  ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .end,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          1.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Container(
                                                                width: 50.0,
                                                                height: 60.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            0.0),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            8.0),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            0.0),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            8.0),
                                                                  ),
                                                                  border: Border
                                                                      .all(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .lineColor,
                                                                    width: 2.0,
                                                                  ),
                                                                ),
                                                                child: InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    FFAppState()
                                                                        .update(
                                                                            () {
                                                                      FFAppState()
                                                                          .WORKERAGE = 0;
                                                                      FFAppState()
                                                                          .nextage = 0;
                                                                      FFAppState()
                                                                          .SAVEAGE = 0;
                                                                      FFAppState()
                                                                              .pass =
                                                                          '1';
                                                                      FFAppState()
                                                                              .success =
                                                                          '0';
                                                                    });
                                                                    if (kIsWeb) {
                                                                      final _datePickedDate =
                                                                          await showDatePicker(
                                                                        context:
                                                                            context,
                                                                        initialDate:
                                                                            getCurrentTimestamp,
                                                                        firstDate:
                                                                            DateTime(1900),
                                                                        lastDate:
                                                                            getCurrentTimestamp,
                                                                      );

                                                                      if (_datePickedDate !=
                                                                          null) {
                                                                        setState(
                                                                            () {
                                                                          _model.datePicked =
                                                                              DateTime(
                                                                            _datePickedDate.year,
                                                                            _datePickedDate.month,
                                                                            _datePickedDate.day,
                                                                          );
                                                                        });
                                                                      }
                                                                    } else {
                                                                      await DatePicker
                                                                          .showDatePicker(
                                                                        context,
                                                                        showTitleActions:
                                                                            true,
                                                                        onConfirm:
                                                                            (date) {
                                                                          setState(
                                                                              () {
                                                                            _model.datePicked =
                                                                                date;
                                                                          });
                                                                        },
                                                                        currentTime:
                                                                            getCurrentTimestamp,
                                                                        minTime: DateTime(
                                                                            0,
                                                                            0,
                                                                            0),
                                                                        maxTime:
                                                                            getCurrentTimestamp,
                                                                      );
                                                                    }

                                                                    FFAppState()
                                                                        .update(
                                                                            () {
                                                                      FFAppState()
                                                                              .WORKERAGE =
                                                                          functions.ageofperson(_model
                                                                              .datePicked!
                                                                              .toString());
                                                                    });
                                                                    if ((FFAppState().WORKERAGE >=
                                                                            18) &&
                                                                        (FFAppState().WORKERAGE <=
                                                                            60)) {
                                                                      FFAppState()
                                                                          .update(
                                                                              () {
                                                                        FFAppState().eligibilitycheck =
                                                                            '1';
                                                                      });
                                                                      FFAppState()
                                                                          .update(
                                                                              () {
                                                                        FFAppState().SAVEAGE =
                                                                            FFAppState().WORKERAGE;
                                                                        FFAppState().success =
                                                                            '1';
                                                                      });
                                                                      return;
                                                                    } else {
                                                                      FFAppState()
                                                                          .update(
                                                                              () {
                                                                        FFAppState().eligibilitycheck =
                                                                            '';
                                                                      });
                                                                      await showDialog(
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (alertDialogContext) {
                                                                          return AlertDialog(
                                                                            title:
                                                                                Text('Alert'),
                                                                            content:
                                                                                Text('Please enter the valid age '),
                                                                            actions: [
                                                                              TextButton(
                                                                                onPressed: () => Navigator.pop(alertDialogContext),
                                                                                child: Text('Ok'),
                                                                              ),
                                                                            ],
                                                                          );
                                                                        },
                                                                      );
                                                                      return;
                                                                    }
                                                                  },
                                                                  child: Icon(
                                                                    Icons
                                                                        .calendar_today,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  20.0,
                                                                  20.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -0.02,
                                                                    0.07),
                                                            child: Text(
                                                              'Gender',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .headlineSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      width: double.infinity,
                                                      height: 60.0,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    2.0,
                                                                    2.0,
                                                                    2.0,
                                                                    2.0),
                                                        child:
                                                            FlutterFlowDropDown<
                                                                String>(
                                                          controller: _model
                                                                  .workerGenderValueController ??=
                                                              FormFieldController<
                                                                  String>(
                                                            _model.workerGenderValue ??=
                                                                widget
                                                                    .editScout!
                                                                    .gender,
                                                          ),
                                                          options: [
                                                            'Male',
                                                            'Female',
                                                            'Others'
                                                          ],
                                                          onChanged: (val) =>
                                                              setState(() =>
                                                                  _model.workerGenderValue =
                                                                      val),
                                                          width: 180.0,
                                                          height: 50.0,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleMedium,
                                                          hintText:
                                                              'Select your Gender here',
                                                          elevation: 2.0,
                                                          borderColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .outlines,
                                                          borderWidth: 0.0,
                                                          borderRadius: 0.0,
                                                          margin:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      16.0,
                                                                      16.0,
                                                                      16.0,
                                                                      16.0),
                                                          hidesUnderline: true,
                                                          isSearchable: false,
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  20.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: wrapWithModel(
                                                        model: _model
                                                            .editaddressScoutsModel,
                                                        updateCallback: () =>
                                                            setState(() {}),
                                                        updateOnChange: true,
                                                        child:
                                                            EditaddressScoutsWidget(
                                                          area: widget
                                                              .editScout!.area,
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  30.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -0.75,
                                                                    0.45),
                                                            child: Text(
                                                              'ENTER KYC DETAILS',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .headlineMedium,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  10.0,
                                                                  20.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -0.02,
                                                                    0.07),
                                                            child: Text(
                                                              'Aadhar number',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .headlineSmall,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    TextFormField(
                                                      controller: _model
                                                          .adhaarNumberController,
                                                      onChanged: (_) =>
                                                          EasyDebounce.debounce(
                                                        '_model.adhaarNumberController',
                                                        Duration(
                                                            milliseconds: 2000),
                                                        () async {
                                                          if (_model.formKey
                                                                      .currentState ==
                                                                  null ||
                                                              !_model.formKey
                                                                  .currentState!
                                                                  .validate()) {
                                                            return;
                                                          }
                                                          if (_model
                                                                  .workerGenderValue ==
                                                              null) {
                                                            return;
                                                          }
                                                          if (_model
                                                                  .editaddressScoutsModel
                                                                  .areadropdownValue ==
                                                              null) {
                                                            return;
                                                          }
                                                        },
                                                      ),
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w300,
                                                                ),
                                                        hintText:
                                                            'Enter your Aadhaar number here',
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .textColor50,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .lineColor,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .grayIcon,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .red,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        focusedErrorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .red,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        contentPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    20.0,
                                                                    32.0,
                                                                    20.0,
                                                                    12.0),
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleMedium,
                                                      textAlign:
                                                          TextAlign.start,
                                                      keyboardType:
                                                          TextInputType.number,
                                                      validator: _model
                                                          .adhaarNumberControllerValidator
                                                          .asValidator(context),
                                                      inputFormatters: [
                                                        FilteringTextInputFormatter
                                                            .allow(
                                                                RegExp('[0-9]'))
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  20.0,
                                                                  20.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -0.02,
                                                                    0.07),
                                                            child: Text(
                                                              'Pan number',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .headlineSmall,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    TextFormField(
                                                      controller:
                                                          _model.panController,
                                                      onFieldSubmitted:
                                                          (_) async {
                                                        if (_model.formKey
                                                                    .currentState ==
                                                                null ||
                                                            !_model.formKey
                                                                .currentState!
                                                                .validate()) {
                                                          return;
                                                        }
                                                        if (_model
                                                                .workerGenderValue ==
                                                            null) {
                                                          return;
                                                        }
                                                        if (_model
                                                                .editaddressScoutsModel
                                                                .areadropdownValue ==
                                                            null) {
                                                          return;
                                                        }
                                                      },
                                                      textCapitalization:
                                                          TextCapitalization
                                                              .words,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w300,
                                                                ),
                                                        hintText:
                                                            'Enter Pan card number',
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .textColor50,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .lineColor,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .grayIcon,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .red,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        focusedErrorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .red,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        contentPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    20.0,
                                                                    32.0,
                                                                    20.0,
                                                                    12.0),
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleMedium,
                                                      textAlign:
                                                          TextAlign.start,
                                                      validator: _model
                                                          .panControllerValidator
                                                          .asValidator(context),
                                                      inputFormatters: [
                                                        FilteringTextInputFormatter
                                                            .allow(RegExp(
                                                                '[a-zA-Z0-9]'))
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  30.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -0.75,
                                                                    0.45),
                                                            child: Text(
                                                              'ENTER BANK DETAILS',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .headlineMedium,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  10.0,
                                                                  20.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -0.02,
                                                                    0.07),
                                                            child: Text(
                                                              'Account name',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .headlineSmall,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    TextFormField(
                                                      controller: _model
                                                          .accountNameController,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w300,
                                                                ),
                                                        hintText:
                                                            'Enter your Account Name here',
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .textColor50,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .lineColor,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .grayIcon,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .red,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        focusedErrorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .red,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        contentPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    20.0,
                                                                    32.0,
                                                                    20.0,
                                                                    12.0),
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleMedium,
                                                      textAlign:
                                                          TextAlign.start,
                                                      validator: _model
                                                          .accountNameControllerValidator
                                                          .asValidator(context),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  20.0,
                                                                  20.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -0.02,
                                                                    0.07),
                                                            child: Text(
                                                              'Account number',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .headlineSmall,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    TextFormField(
                                                      controller: _model
                                                          .accountNumberController,
                                                      onChanged: (_) =>
                                                          EasyDebounce.debounce(
                                                        '_model.accountNumberController',
                                                        Duration(
                                                            milliseconds: 2000),
                                                        () async {
                                                          if (_model.formKey
                                                                      .currentState ==
                                                                  null ||
                                                              !_model.formKey
                                                                  .currentState!
                                                                  .validate()) {
                                                            return;
                                                          }
                                                          if (_model
                                                                  .workerGenderValue ==
                                                              null) {
                                                            return;
                                                          }
                                                          if (_model
                                                                  .editaddressScoutsModel
                                                                  .areadropdownValue ==
                                                              null) {
                                                            return;
                                                          }
                                                        },
                                                      ),
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w300,
                                                                ),
                                                        hintText:
                                                            'Enter your Account Number here',
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .textColor50,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .lineColor,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .grayIcon,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .red,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        focusedErrorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .red,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        contentPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    20.0,
                                                                    32.0,
                                                                    20.0,
                                                                    12.0),
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleMedium,
                                                      textAlign:
                                                          TextAlign.start,
                                                      keyboardType:
                                                          TextInputType.number,
                                                      validator: _model
                                                          .accountNumberControllerValidator
                                                          .asValidator(context),
                                                      inputFormatters: [
                                                        FilteringTextInputFormatter
                                                            .allow(
                                                                RegExp('[0-9]'))
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  20.0,
                                                                  20.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -0.02,
                                                                    0.07),
                                                            child: Text(
                                                              'Bank name',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .headlineSmall,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    TextFormField(
                                                      controller: _model
                                                          .bankNameController,
                                                      textCapitalization:
                                                          TextCapitalization
                                                              .words,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w300,
                                                                ),
                                                        hintText: 'Bank Name',
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .textColor50,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .lineColor,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .grayIcon,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .red,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        focusedErrorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .red,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        contentPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    20.0,
                                                                    32.0,
                                                                    20.0,
                                                                    12.0),
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleMedium,
                                                      textAlign:
                                                          TextAlign.start,
                                                      validator: _model
                                                          .bankNameControllerValidator
                                                          .asValidator(context),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  20.0,
                                                                  20.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -0.02,
                                                                    0.07),
                                                            child: Text(
                                                              'IFSC code',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .headlineSmall,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    TextFormField(
                                                      controller:
                                                          _model.ifscController,
                                                      onChanged: (_) =>
                                                          EasyDebounce.debounce(
                                                        '_model.ifscController',
                                                        Duration(
                                                            milliseconds: 2000),
                                                        () async {
                                                          if (_model.formKey
                                                                      .currentState ==
                                                                  null ||
                                                              !_model.formKey
                                                                  .currentState!
                                                                  .validate()) {
                                                            return;
                                                          }
                                                          if (_model
                                                                  .workerGenderValue ==
                                                              null) {
                                                            return;
                                                          }
                                                          if (_model
                                                                  .editaddressScoutsModel
                                                                  .areadropdownValue ==
                                                              null) {
                                                            return;
                                                          }
                                                        },
                                                      ),
                                                      textCapitalization:
                                                          TextCapitalization
                                                              .characters,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w300,
                                                                ),
                                                        hintText:
                                                            'Enter you IFSC Code here',
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .textColor50,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .lineColor,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .grayIcon,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .red,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        focusedErrorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .red,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        contentPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    20.0,
                                                                    32.0,
                                                                    20.0,
                                                                    12.0),
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleMedium,
                                                      textAlign:
                                                          TextAlign.start,
                                                      validator: _model
                                                          .ifscControllerValidator
                                                          .asValidator(context),
                                                      inputFormatters: [
                                                        FilteringTextInputFormatter
                                                            .allow(RegExp(
                                                                '[a-zA-Z0-9]'))
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 120.0,
                          decoration: BoxDecoration(
                            color: Color(0x00FFFFFF),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 24.0, 0.0, 16.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onDoubleTap: () async {
                                    if (FFAppState().success == '1') {
                                      final captainsUpdateData =
                                          createRecruitersRecordData(
                                        fullName:
                                            _model.fullNameController.text,
                                        phone: _model.workersPhnController.text,
                                        dob: FFAppState().eligibilitycheck ==
                                                '1'
                                            ? functions.ddmmyyyy(dateTimeFormat(
                                                'yMd', _model.datePicked))
                                            : widget.editScout!.dob,
                                        gender: _model.workerGenderValue,
                                        email:
                                            _model.workersEmailController.text,
                                        pinCode: _model.editaddressScoutsModel
                                            .pincodefieldController.text,
                                        area: _model.editaddressScoutsModel
                                            .areadropdownValue,
                                        district: FFAppState().district,
                                        state: FFAppState().state,
                                        aadhar:
                                            _model.adhaarNumberController.text,
                                        panNumber: _model.panController.text,
                                        accountName:
                                            _model.accountNameController.text,
                                        accountNumber:
                                            _model.accountNumberController.text,
                                        bankName:
                                            _model.bankNameController.text,
                                        ifscCode: _model.ifscController.text,
                                        tag: 'Scout',
                                        photo: FFAppState().profilepic,
                                      );
                                      await widget.editScout!.reference
                                          .update(captainsUpdateData);

                                      context.pushNamed('ScoutsDashboardCopy');
                                    } else {
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: Text('Alert'),
                                            content: Text(
                                                'Date of birth is  not set'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext),
                                                child: Text('Ok'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    }
                                  },
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      if (FFAppState().pass == '0') {
                                        FFAppState().update(() {
                                          FFAppState().nextage =
                                              widget.editScout!.age!;
                                        });
                                        if ((_model.editaddressScoutsModel
                                                        .pincodefieldController.text !=
                                                    null &&
                                                _model
                                                        .editaddressScoutsModel
                                                        .pincodefieldController
                                                        .text !=
                                                    '') &&
                                            (_model.editaddressScoutsModel
                                                        .areadropdownValue !=
                                                    null &&
                                                _model.editaddressScoutsModel
                                                        .areadropdownValue !=
                                                    '') &&
                                            (FFAppState().testapi == '1')) {
                                          if (_model.formKey.currentState ==
                                                  null ||
                                              !_model.formKey.currentState!
                                                  .validate()) {
                                            return;
                                          }
                                          if (_model.workerGenderValue ==
                                              null) {
                                            return;
                                          }
                                          if (_model.editaddressScoutsModel
                                                  .areadropdownValue ==
                                              null) {
                                            return;
                                          }

                                          final captainsUpdateData1 =
                                              createRecruitersRecordData(
                                            fullName:
                                                _model.fullNameController.text,
                                            phone: _model
                                                .workersPhnController.text,
                                            dob:
                                                FFAppState().eligibilitycheck ==
                                                        '1'
                                                    ? functions.ddmmyyyy(
                                                        dateTimeFormat('yMd',
                                                            _model.datePicked))
                                                    : widget.editScout!.dob,
                                            gender: _model.workerGenderValue,
                                            email: _model
                                                .workersEmailController.text,
                                            pinCode: _model
                                                .editaddressScoutsModel
                                                .pincodefieldController
                                                .text,
                                            area: _model.editaddressScoutsModel
                                                .areadropdownValue,
                                            district:
                                                FFAppState().disabling == '2'
                                                    ? widget.editScout!.district
                                                    : FFAppState().district,
                                            state: FFAppState().disabling == '2'
                                                ? widget.editScout!.state
                                                : FFAppState().state,
                                            aadhar: _model
                                                .adhaarNumberController.text,
                                            panNumber:
                                                _model.panController.text,
                                            accountName: _model
                                                .accountNameController.text,
                                            accountNumber: _model
                                                .accountNumberController.text,
                                            bankName:
                                                _model.bankNameController.text,
                                            ifscCode:
                                                _model.ifscController.text,
                                            tag: 'Scout',
                                            photo: FFAppState().profilepic,
                                          );
                                          await widget.editScout!.reference
                                              .update(captainsUpdateData1);
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                content: Text('RECORD UPDATED'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext),
                                                    child: Text('Ok'),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                          FFAppState().update(() {
                                            FFAppState().profilepic = '';
                                            FFAppState().editorgarea = [];
                                            FFAppState().district = 'District';
                                            FFAppState().state = 'State';
                                          });

                                          context
                                              .pushNamed('ScoutsDashboardCopy');
                                        } else {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                title: Text('Alert'),
                                                content: Text(
                                                    'Address details are not set'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext),
                                                    child: Text('Ok'),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        }
                                      } else {
                                        FFAppState().update(() {
                                          FFAppState().nextage =
                                              FFAppState().SAVEAGE;
                                        });
                                        if ((_model.editaddressScoutsModel
                                                        .pincodefieldController.text !=
                                                    null &&
                                                _model
                                                        .editaddressScoutsModel
                                                        .pincodefieldController
                                                        .text !=
                                                    '') &&
                                            (_model.editaddressScoutsModel
                                                        .areadropdownValue !=
                                                    null &&
                                                _model.editaddressScoutsModel
                                                        .areadropdownValue !=
                                                    '') &&
                                            (FFAppState().testapi == '1') &&
                                            (FFAppState().area == '1')) {
                                          if (_model.formKey.currentState ==
                                                  null ||
                                              !_model.formKey.currentState!
                                                  .validate()) {
                                            return;
                                          }
                                          if (_model.workerGenderValue ==
                                              null) {
                                            return;
                                          }
                                          if (_model.editaddressScoutsModel
                                                  .areadropdownValue ==
                                              null) {
                                            return;
                                          }
                                          if (FFAppState().success == '1') {
                                            final captainsUpdateData2 =
                                                createRecruitersRecordData(
                                              fullName: _model
                                                  .fullNameController.text,
                                              phone: _model
                                                  .workersPhnController.text,
                                              dob: FFAppState()
                                                          .eligibilitycheck ==
                                                      '1'
                                                  ? functions.ddmmyyyy(
                                                      dateTimeFormat('yMd',
                                                          _model.datePicked))
                                                  : widget.editScout!.dob,
                                              gender: _model.workerGenderValue,
                                              email: _model
                                                  .workersEmailController.text,
                                              pinCode: _model
                                                  .editaddressScoutsModel
                                                  .pincodefieldController
                                                  .text,
                                              area: _model
                                                  .editaddressScoutsModel
                                                  .areadropdownValue,
                                              district: FFAppState().district,
                                              state: FFAppState().state,
                                              aadhar: _model
                                                  .adhaarNumberController.text,
                                              panNumber:
                                                  _model.panController.text,
                                              accountName: _model
                                                  .accountNameController.text,
                                              accountNumber: _model
                                                  .accountNumberController.text,
                                              bankName: _model
                                                  .bankNameController.text,
                                              ifscCode:
                                                  _model.ifscController.text,
                                              tag: 'Scout',
                                              photo: FFAppState().profilepic,
                                            );
                                            await widget.editScout!.reference
                                                .update(captainsUpdateData2);
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  content:
                                                      Text('RECORD UPDATED'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext),
                                                      child: Text('Ok'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                            FFAppState().update(() {
                                              FFAppState().profilepic = '';
                                              FFAppState().editorgarea = [];
                                              FFAppState().district =
                                                  'District';
                                              FFAppState().state = 'State';
                                            });

                                            context.pushNamed(
                                                'ScoutsDashboardCopy');
                                          } else {
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  title: Text('Alert'),
                                                  content: Text(
                                                      'Date of birth is  not set'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext),
                                                      child: Text('Ok'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          }
                                        } else {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                title: Text('Alert'),
                                                content: Text(
                                                    'Address details are not set'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext),
                                                    child: Text('Ok'),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        }
                                      }
                                    },
                                    text: 'CONFIRM CHANGES',
                                    options: FFButtonOptions(
                                      width: 300.0,
                                      height: 60.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                      elevation: 3.0,
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 1.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        wrapWithModel(
                          model: _model.bottombarModel,
                          updateCallback: () => setState(() {}),
                          child: BottombarWidget(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
