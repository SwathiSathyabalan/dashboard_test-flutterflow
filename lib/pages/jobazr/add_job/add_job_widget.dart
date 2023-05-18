import 'package:easy_debounce/easy_debounce.dart';

import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/bottombar/bottombar_widget.dart';
import '/components/headingbar/headingbar_widget.dart';
import '/components/jobaddress/jobaddress_widget.dart';
import '/components/web_nav/web_nav_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'add_job_model.dart';
export 'add_job_model.dart';

class AddJobWidget extends StatefulWidget {
  const AddJobWidget({
    Key? key,
    this.orgdetails,
  }) : super(key: key);

  final OrganisationsRecord? orgdetails;

  @override
  _AddJobWidgetState createState() => _AddJobWidgetState();
}

class _AddJobWidgetState extends State<AddJobWidget> {
  late AddJobModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddJobModel());

    _model.organisationNameController ??= TextEditingController(
        text:
            functions.firstCharUppercase(widget.orgdetails!.organisationName!));
    _model.jobTitleController ??= TextEditingController();
    _model.jobDescriptionController ??= TextEditingController();
    _model.minimumSalaryController ??= TextEditingController();
    _model.maximumSalaryController ??= TextEditingController();
    _model.noVacanciesController ??= TextEditingController();
    _model.workHoursController ??= TextEditingController();
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
                      colour2: FlutterFlowTheme.of(context).secondary,
                      colour3: FlutterFlowTheme.of(context).tertiary,
                      colour4: FlutterFlowTheme.of(context).tertiary,
                      colour5: FlutterFlowTheme.of(context).tertiary,
                      colour6: FlutterFlowTheme.of(context).tertiary,
                      colour7: FlutterFlowTheme.of(context).tertiary,
                    ),
                  ),
                  Expanded(
                    child: StreamBuilder<List<JobimageRecord>>(
                      stream: queryJobimageRecord(
                        singleRecord: true,
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 80.0,
                              height: 80.0,
                              child: SpinKitPulse(
                                color: FlutterFlowTheme.of(context).accent1Old,
                                size: 80.0,
                              ),
                            ),
                          );
                        }
                        List<JobimageRecord> columnJobimageRecordList =
                            snapshot.data!;
                        // Return an empty Container when the item does not exist.
                        if (snapshot.data!.isEmpty) {
                          return Container();
                        }
                        final columnJobimageRecord =
                            columnJobimageRecordList.isNotEmpty
                                ? columnJobimageRecordList.first
                                : null;
                        return Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            wrapWithModel(
                              model: _model.headingbarModel,
                              updateCallback: () => setState(() {}),
                              child: HeadingbarWidget(
                                text: 'ADD NEW VACANCY',
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              height: 154.2,
                              decoration: BoxDecoration(),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    30.0, 0.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 5.0, 0.0, 0.0),
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
                                                  'assets/images/job.jpg',
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
                                                                            if (FFAppState().test ==
                                                                                '1')
                                                                              Text(
                                                                                'Upload  the picture',
                                                                                style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                      fontFamily: 'Poppins',
                                                                                      fontSize: 12.0,
                                                                                    ),
                                                                              ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      if (FFAppState()
                                                                  .profilepic !=
                                                              null &&
                                                          FFAppState()
                                                                  .profilepic !=
                                                              '')
                                                        Container(
                                                          width: 145.0,
                                                          height: 145.0,
                                                          clipBehavior:
                                                              Clip.antiAlias,
                                                          decoration:
                                                              BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child: Image.network(
                                                            FFAppState()
                                                                .profilepic,
                                                            fit: BoxFit.cover,
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
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 0.0, 0.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          if (FFAppState().profilepic != null &&
                                              FFAppState().profilepic != '')
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 20.0, 0.0, 0.0),
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
                                                      FFAppState().test = '1';
                                                    });
                                                    if (FFAppState()
                                                                .profilepic ==
                                                            null ||
                                                        FFAppState()
                                                                .profilepic ==
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
                                                        pickerFontFamily:
                                                            'Lato',
                                                      );
                                                      if (selectedMedia !=
                                                              null &&
                                                          selectedMedia.every((m) =>
                                                              validateFileFormat(
                                                                  m.storagePath,
                                                                  context))) {
                                                        setState(() => _model
                                                                .isDataUploading =
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
                                                                            .split('/')
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
                                                              (await Future
                                                                      .wait(
                                                            selectedMedia.map(
                                                              (m) async =>
                                                                  await uploadData(
                                                                      m.storagePath,
                                                                      m.bytes),
                                                            ),
                                                          ))
                                                                  .where((u) =>
                                                                      u != null)
                                                                  .map(
                                                                      (u) => u!)
                                                                  .toList();
                                                        } finally {
                                                          _model.isDataUploading =
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
                                                          setState(() {
                                                            _model.uploadedLocalFile =
                                                                selectedUploadedFiles
                                                                    .first;
                                                            _model.uploadedFileUrl =
                                                                downloadUrls
                                                                    .first;
                                                          });
                                                        } else {
                                                          setState(() {});
                                                          return;
                                                        }
                                                      }

                                                      setState(() {
                                                        FFAppState()
                                                                .profilepic =
                                                            _model
                                                                .uploadedFileUrl;
                                                        FFAppState().test = '';
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
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .accent1Old,
                                                    ),
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
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
                                                          child: Icon(
                                                            Icons.edit,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .accent1Old,
                                                            size: 24.0,
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
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                width: 700.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Stack(
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 50.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 10.0,
                                                                10.0, 0.0),
                                                    child: Form(
                                                      key: _model.formKey,
                                                      autovalidateMode:
                                                          AutovalidateMode
                                                              .disabled,
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
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
                                                                  'ENTER GENERAL DETAILS',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineMedium,
                                                                ),
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
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Text(
                                                                  'Organisation name',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmall,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          TextFormField(
                                                            controller: _model
                                                                .organisationNameController,
                                                            readOnly: true,
                                                            obscureText: false,
                                                            decoration:
                                                                InputDecoration(
                                                              hintText:
                                                                  'Enter Organisation Name',
                                                              hintStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .textColor50,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                              enabledBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .outlines,
                                                                  width: 2.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12.0),
                                                              ),
                                                              focusedBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .grayIcon,
                                                                  width: 2.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12.0),
                                                              ),
                                                              errorBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Color(
                                                                      0x00000000),
                                                                  width: 2.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12.0),
                                                              ),
                                                              focusedErrorBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Color(
                                                                      0x00000000),
                                                                  width: 2.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12.0),
                                                              ),
                                                              contentPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          20.0,
                                                                          32.0,
                                                                          20.0,
                                                                          12.0),
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                            textAlign:
                                                                TextAlign.start,
                                                            keyboardType:
                                                                TextInputType
                                                                    .name,
                                                            validator: _model
                                                                .organisationNameControllerValidator
                                                                .asValidator(
                                                                    context),
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
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Text(
                                                                  'Job category',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmall,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Container(
                                                            width: 700.0,
                                                            height: 61.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12.0),
                                                              border:
                                                                  Border.all(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .outlines,
                                                                width: 2.0,
                                                              ),
                                                            ),
                                                            child:
                                                                FlutterFlowDropDown<
                                                                    String>(
                                                              controller: _model
                                                                      .jobCategoryValueController ??=
                                                                  FormFieldController<
                                                                          String>(
                                                                      null),
                                                              options: [
                                                                'Garments',
                                                                'Textile',
                                                                'Construction',
                                                                'Restaurant',
                                                                'Driver',
                                                                'Home Staff',
                                                                'Agricultural Work',
                                                                'Mining',
                                                                'Automobile'
                                                              ],
                                                              onChanged:
                                                                  (val) async {
                                                                setState(() =>
                                                                    _model.jobCategoryValue =
                                                                        val);
                                                                FFAppState()
                                                                    .update(() {
                                                                  FFAppState()
                                                                          .jobcategory =
                                                                      _model
                                                                          .jobCategoryValue!;
                                                                  FFAppState()
                                                                          .profilepic =
                                                                      () {
                                                                    if (_model
                                                                            .jobCategoryValue ==
                                                                        'Construction') {
                                                                      return columnJobimageRecord!
                                                                          .construction!;
                                                                    } else if (_model
                                                                            .jobCategoryValue ==
                                                                        'Garments') {
                                                                      return columnJobimageRecord!
                                                                          .garments!;
                                                                    } else if (_model
                                                                            .jobCategoryValue ==
                                                                        'Textile') {
                                                                      return columnJobimageRecord!
                                                                          .textile!;
                                                                    } else if (_model
                                                                            .jobCategoryValue ==
                                                                        'Driver') {
                                                                      return columnJobimageRecord!
                                                                          .driver!;
                                                                    } else if (_model
                                                                            .jobCategoryValue ==
                                                                        'Home Staff') {
                                                                      return columnJobimageRecord!
                                                                          .homestaff!;
                                                                    } else if (_model
                                                                            .jobCategoryValue ==
                                                                        'Agricultural Work') {
                                                                      return columnJobimageRecord!
                                                                          .agri!;
                                                                    } else if (_model
                                                                            .jobCategoryValue ==
                                                                        'Restaurant') {
                                                                      return columnJobimageRecord!
                                                                          .restraunt!;
                                                                    } else if (_model
                                                                            .jobCategoryValue ==
                                                                        'Automobile') {
                                                                      return columnJobimageRecord!
                                                                          .automobile!;
                                                                    } else if (_model
                                                                            .jobCategoryValue ==
                                                                        'Minning') {
                                                                      return columnJobimageRecord!
                                                                          .mining!;
                                                                    } else {
                                                                      return 'h';
                                                                    }
                                                                  }();
                                                                });
                                                              },
                                                              width: 180.0,
                                                              height: 50.0,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium,
                                                              hintText:
                                                                  'Job category',
                                                              elevation: 2.0,
                                                              borderColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .outlines,
                                                              borderWidth: 0.0,
                                                              borderRadius:
                                                                  10.0,
                                                              margin:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          16.0,
                                                                          16.0,
                                                                          16.0),
                                                              hidesUnderline:
                                                                  true,
                                                              isSearchable:
                                                                  false,
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
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Text(
                                                                  'Job sub category',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmall,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          ListView(
                                                            padding:
                                                                EdgeInsets.zero,
                                                            shrinkWrap: true,
                                                            scrollDirection:
                                                                Axis.vertical,
                                                            children: [
                                                              if (FFAppState()
                                                                      .jobcategory ==
                                                                  'Construction')
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    if (FFAppState()
                                                                            .jobcategory ==
                                                                        'Construction')
                                                                      Expanded(
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              10.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              FlutterFlowDropDown<String>(
                                                                            controller: _model.jObtitle1ValueController ??=
                                                                                FormFieldController<String>(
                                                                              _model.jObtitle1Value ??= 'Unknown',
                                                                            ),
                                                                            options: [
                                                                              'Mason',
                                                                              'Roofer',
                                                                              'Carpenter',
                                                                              'Plumber',
                                                                              'Electrician',
                                                                              'Heavy Equipment Operator',
                                                                              'Ironworker',
                                                                              'Plasterer',
                                                                              'House Painter',
                                                                              'Unknown'
                                                                            ],
                                                                            onChanged:
                                                                                (val) async {
                                                                              setState(() => _model.jObtitle1Value = val);
                                                                              FFAppState().update(() {
                                                                                FFAppState().jobtitle = _model.jObtitle1Value!;
                                                                              });
                                                                            },
                                                                            width:
                                                                                650.0,
                                                                            height:
                                                                                58.0,
                                                                            textStyle:
                                                                                FlutterFlowTheme.of(context).titleMedium,
                                                                            hintText:
                                                                                'Job sub category',
                                                                            elevation:
                                                                                2.0,
                                                                            borderColor:
                                                                                FlutterFlowTheme.of(context).outlines,
                                                                            borderWidth:
                                                                                2.0,
                                                                            borderRadius:
                                                                                10.0,
                                                                            margin: EdgeInsetsDirectional.fromSTEB(
                                                                                22.0,
                                                                                4.0,
                                                                                12.0,
                                                                                4.0),
                                                                            hidesUnderline:
                                                                                true,
                                                                            isSearchable:
                                                                                false,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                  ],
                                                                ),
                                                              if (FFAppState()
                                                                      .jobcategory ==
                                                                  'Minning')
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    if (FFAppState()
                                                                            .jobcategory ==
                                                                        'Minning')
                                                                      Expanded(
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              10.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              FlutterFlowDropDown<String>(
                                                                            controller: _model.jObtitle2ValueController ??=
                                                                                FormFieldController<String>(
                                                                              _model.jObtitle2Value ??= 'Unknown',
                                                                            ),
                                                                            options: [
                                                                              'Fitter',
                                                                              'Plumber',
                                                                              'Minning work',
                                                                              'Load bearer',
                                                                              'Unknown'
                                                                            ],
                                                                            onChanged:
                                                                                (val) async {
                                                                              setState(() => _model.jObtitle2Value = val);
                                                                              FFAppState().update(() {
                                                                                FFAppState().jobtitle = _model.jObtitle2Value!;
                                                                              });
                                                                            },
                                                                            width:
                                                                                650.0,
                                                                            height:
                                                                                58.0,
                                                                            textStyle:
                                                                                FlutterFlowTheme.of(context).titleMedium,
                                                                            hintText:
                                                                                'Job sub category',
                                                                            elevation:
                                                                                2.0,
                                                                            borderColor:
                                                                                FlutterFlowTheme.of(context).outlines,
                                                                            borderWidth:
                                                                                2.0,
                                                                            borderRadius:
                                                                                10.0,
                                                                            margin: EdgeInsetsDirectional.fromSTEB(
                                                                                22.0,
                                                                                4.0,
                                                                                12.0,
                                                                                4.0),
                                                                            hidesUnderline:
                                                                                true,
                                                                            isSearchable:
                                                                                false,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                  ],
                                                                ),
                                                              if (FFAppState()
                                                                      .jobcategory ==
                                                                  'Agricultural Work')
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    if (FFAppState()
                                                                            .jobcategory ==
                                                                        'Agricultural Work')
                                                                      Expanded(
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              10.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              FlutterFlowDropDown<String>(
                                                                            controller: _model.jObtitle3ValueController ??=
                                                                                FormFieldController<String>(
                                                                              _model.jObtitle3Value ??= 'Unknown',
                                                                            ),
                                                                            options: [
                                                                              'Agricultutal Worker',
                                                                              'Unknown'
                                                                            ],
                                                                            onChanged:
                                                                                (val) async {
                                                                              setState(() => _model.jObtitle3Value = val);
                                                                              FFAppState().update(() {
                                                                                FFAppState().jobtitle = _model.jObtitle3Value!;
                                                                              });
                                                                            },
                                                                            width:
                                                                                650.0,
                                                                            height:
                                                                                58.0,
                                                                            textStyle:
                                                                                FlutterFlowTheme.of(context).titleMedium,
                                                                            hintText:
                                                                                'Job sub category',
                                                                            elevation:
                                                                                2.0,
                                                                            borderColor:
                                                                                FlutterFlowTheme.of(context).outlines,
                                                                            borderWidth:
                                                                                2.0,
                                                                            borderRadius:
                                                                                10.0,
                                                                            margin: EdgeInsetsDirectional.fromSTEB(
                                                                                22.0,
                                                                                4.0,
                                                                                12.0,
                                                                                4.0),
                                                                            hidesUnderline:
                                                                                true,
                                                                            isSearchable:
                                                                                false,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                  ],
                                                                ),
                                                              if (FFAppState()
                                                                      .jobcategory ==
                                                                  'Driver')
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      if (FFAppState()
                                                                              .jobcategory ==
                                                                          'Driver')
                                                                        Expanded(
                                                                          child:
                                                                              FlutterFlowDropDown<String>(
                                                                            controller: _model.jObtitle4ValueController ??=
                                                                                FormFieldController<String>(
                                                                              _model.jObtitle4Value ??= 'Unknown',
                                                                            ),
                                                                            options: [
                                                                              '12 wheel Driver',
                                                                              '8 wheel Driver',
                                                                              '4 wheel Driver',
                                                                              'Unknown'
                                                                            ],
                                                                            onChanged:
                                                                                (val) async {
                                                                              setState(() => _model.jObtitle4Value = val);
                                                                              FFAppState().update(() {
                                                                                FFAppState().jobtitle = _model.jObtitle4Value!;
                                                                              });
                                                                            },
                                                                            width:
                                                                                650.0,
                                                                            height:
                                                                                58.0,
                                                                            textStyle:
                                                                                FlutterFlowTheme.of(context).titleMedium,
                                                                            hintText:
                                                                                'Job sub category',
                                                                            elevation:
                                                                                0.0,
                                                                            borderColor:
                                                                                FlutterFlowTheme.of(context).outlines,
                                                                            borderWidth:
                                                                                2.0,
                                                                            borderRadius:
                                                                                10.0,
                                                                            margin: EdgeInsetsDirectional.fromSTEB(
                                                                                22.0,
                                                                                4.0,
                                                                                12.0,
                                                                                4.0),
                                                                            hidesUnderline:
                                                                                true,
                                                                            isSearchable:
                                                                                false,
                                                                          ),
                                                                        ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              if (FFAppState()
                                                                      .jobcategory ==
                                                                  'Home Staff')
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      if (FFAppState()
                                                                              .jobcategory ==
                                                                          'Home Staff')
                                                                        Expanded(
                                                                          child:
                                                                              FlutterFlowDropDown<String>(
                                                                            controller: _model.jObtitle5ValueController ??=
                                                                                FormFieldController<String>(
                                                                              _model.jObtitle5Value ??= 'Unknown',
                                                                            ),
                                                                            options: [
                                                                              'Gardening',
                                                                              'House Help',
                                                                              'Cooking',
                                                                              'Unknown'
                                                                            ],
                                                                            onChanged:
                                                                                (val) async {
                                                                              setState(() => _model.jObtitle5Value = val);
                                                                              FFAppState().update(() {
                                                                                FFAppState().jobtitle = _model.jObtitle5Value!;
                                                                              });
                                                                            },
                                                                            width:
                                                                                650.0,
                                                                            height:
                                                                                58.0,
                                                                            textStyle:
                                                                                FlutterFlowTheme.of(context).titleMedium,
                                                                            hintText:
                                                                                'Job sub category',
                                                                            elevation:
                                                                                0.0,
                                                                            borderColor:
                                                                                FlutterFlowTheme.of(context).outlines,
                                                                            borderWidth:
                                                                                2.0,
                                                                            borderRadius:
                                                                                10.0,
                                                                            margin: EdgeInsetsDirectional.fromSTEB(
                                                                                22.0,
                                                                                4.0,
                                                                                12.0,
                                                                                4.0),
                                                                            hidesUnderline:
                                                                                true,
                                                                            isSearchable:
                                                                                false,
                                                                          ),
                                                                        ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              if (FFAppState()
                                                                      .jobcategory ==
                                                                  'Garments')
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      if (FFAppState()
                                                                              .jobcategory ==
                                                                          'Garments')
                                                                        Expanded(
                                                                          child:
                                                                              FlutterFlowDropDown<String>(
                                                                            controller: _model.jObtitle6ValueController ??=
                                                                                FormFieldController<String>(
                                                                              _model.jObtitle6Value ??= 'Unknown',
                                                                            ),
                                                                            options: [
                                                                              'Tailor',
                                                                              'Helper',
                                                                              'Packing',
                                                                              'Checking',
                                                                              'Ironing and Packaging',
                                                                              'Printing',
                                                                              'others',
                                                                              'Unknown'
                                                                            ],
                                                                            onChanged:
                                                                                (val) async {
                                                                              setState(() => _model.jObtitle6Value = val);
                                                                              FFAppState().update(() {
                                                                                FFAppState().jobtitle = _model.jObtitle6Value!;
                                                                              });
                                                                            },
                                                                            width:
                                                                                650.0,
                                                                            height:
                                                                                58.0,
                                                                            textStyle:
                                                                                FlutterFlowTheme.of(context).titleMedium,
                                                                            hintText:
                                                                                'Job sub category',
                                                                            elevation:
                                                                                2.0,
                                                                            borderColor:
                                                                                FlutterFlowTheme.of(context).outlines,
                                                                            borderWidth:
                                                                                2.0,
                                                                            borderRadius:
                                                                                10.0,
                                                                            margin: EdgeInsetsDirectional.fromSTEB(
                                                                                22.0,
                                                                                4.0,
                                                                                12.0,
                                                                                4.0),
                                                                            hidesUnderline:
                                                                                true,
                                                                            isSearchable:
                                                                                false,
                                                                          ),
                                                                        ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              if (FFAppState()
                                                                      .jobcategory ==
                                                                  'Restaurant')
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      if (FFAppState()
                                                                              .jobcategory ==
                                                                          'Restaurant')
                                                                        Expanded(
                                                                          child:
                                                                              FlutterFlowDropDown<String>(
                                                                            controller: _model.jObtitle7ValueController ??=
                                                                                FormFieldController<String>(
                                                                              _model.jObtitle7Value ??= 'Unknown',
                                                                            ),
                                                                            options: [
                                                                              'Chef',
                                                                              'Server',
                                                                              'Busser',
                                                                              'Helper',
                                                                              'others',
                                                                              'Unknown'
                                                                            ],
                                                                            onChanged:
                                                                                (val) async {
                                                                              setState(() => _model.jObtitle7Value = val);
                                                                              FFAppState().update(() {
                                                                                FFAppState().jobtitle = _model.jObtitle7Value!;
                                                                              });
                                                                            },
                                                                            width:
                                                                                650.0,
                                                                            height:
                                                                                58.0,
                                                                            textStyle:
                                                                                FlutterFlowTheme.of(context).titleMedium,
                                                                            hintText:
                                                                                'Job sub category',
                                                                            elevation:
                                                                                2.0,
                                                                            borderColor:
                                                                                FlutterFlowTheme.of(context).outlines,
                                                                            borderWidth:
                                                                                2.0,
                                                                            borderRadius:
                                                                                10.0,
                                                                            margin: EdgeInsetsDirectional.fromSTEB(
                                                                                22.0,
                                                                                4.0,
                                                                                12.0,
                                                                                4.0),
                                                                            hidesUnderline:
                                                                                true,
                                                                            isSearchable:
                                                                                false,
                                                                          ),
                                                                        ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              if (FFAppState()
                                                                      .jobcategory ==
                                                                  'Automobile')
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      if (FFAppState()
                                                                              .jobcategory ==
                                                                          'Automobile')
                                                                        Expanded(
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                10.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                FlutterFlowDropDown<String>(
                                                                              controller: _model.jObtitle8ValueController ??= FormFieldController<String>(
                                                                                _model.jObtitle8Value ??= 'Unknown',
                                                                              ),
                                                                              options: [
                                                                                'Welder',
                                                                                'Fabricators',
                                                                                'Installers',
                                                                                'Assembling',
                                                                                'Unknown'
                                                                              ],
                                                                              onChanged: (val) async {
                                                                                setState(() => _model.jObtitle8Value = val);
                                                                                FFAppState().update(() {
                                                                                  FFAppState().jobtitle = _model.jObtitle8Value!;
                                                                                });
                                                                              },
                                                                              width: 650.0,
                                                                              height: 58.0,
                                                                              textStyle: FlutterFlowTheme.of(context).titleMedium,
                                                                              hintText: 'Job sub category',
                                                                              elevation: 2.0,
                                                                              borderColor: FlutterFlowTheme.of(context).outlines,
                                                                              borderWidth: 2.0,
                                                                              borderRadius: 10.0,
                                                                              margin: EdgeInsetsDirectional.fromSTEB(22.0, 4.0, 12.0, 4.0),
                                                                              hidesUnderline: true,
                                                                              isSearchable: false,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              if (FFAppState()
                                                                      .jobcategory ==
                                                                  'Textile')
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      if (FFAppState()
                                                                              .jobcategory ==
                                                                          'Textile')
                                                                        Expanded(
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                10.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                FlutterFlowDropDown<String>(
                                                                              controller: _model.jObtitle9ValueController ??= FormFieldController<String>(
                                                                                _model.jObtitle9Value ??= 'Unknown',
                                                                              ),
                                                                              options: [
                                                                                'Gining',
                                                                                'Weaving',
                                                                                'Spinning',
                                                                                'Knitting',
                                                                                'Dyeing',
                                                                                'Unknown'
                                                                              ],
                                                                              onChanged: (val) async {
                                                                                setState(() => _model.jObtitle9Value = val);
                                                                                FFAppState().update(() {
                                                                                  FFAppState().jobtitle = _model.jObtitle9Value!;
                                                                                });
                                                                              },
                                                                              width: 650.0,
                                                                              height: 58.0,
                                                                              textStyle: FlutterFlowTheme.of(context).titleMedium,
                                                                              hintText: 'Job sub category',
                                                                              elevation: 2.0,
                                                                              borderColor: FlutterFlowTheme.of(context).outlines,
                                                                              borderWidth: 2.0,
                                                                              borderRadius: 10.0,
                                                                              margin: EdgeInsetsDirectional.fromSTEB(22.0, 4.0, 12.0, 4.0),
                                                                              hidesUnderline: true,
                                                                              isSearchable: false,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              if (FFAppState()
                                                                          .jobcategory ==
                                                                      null ||
                                                                  FFAppState()
                                                                          .jobcategory ==
                                                                      '')
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      if (FFAppState().jobcategory ==
                                                                              null ||
                                                                          FFAppState().jobcategory ==
                                                                              '')
                                                                        Expanded(
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                10.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                FlutterFlowDropDown<String>(
                                                                              controller: _model.jObtitle10ValueController ??= FormFieldController<String>(
                                                                                _model.jObtitle10Value ??= 'Unknown',
                                                                              ),
                                                                              options: [
                                                                                'others',
                                                                                'Unknown'
                                                                              ],
                                                                              onChanged: (val) async {
                                                                                setState(() => _model.jObtitle10Value = val);
                                                                                FFAppState().update(() {
                                                                                  FFAppState().jobtitle = _model.jObtitle10Value!;
                                                                                });
                                                                              },
                                                                              width: 650.0,
                                                                              height: 58.0,
                                                                              textStyle: FlutterFlowTheme.of(context).titleMedium,
                                                                              hintText: 'Job sub category',
                                                                              elevation: 2.0,
                                                                              borderColor: FlutterFlowTheme.of(context).outlines,
                                                                              borderWidth: 2.0,
                                                                              borderRadius: 10.0,
                                                                              margin: EdgeInsetsDirectional.fromSTEB(22.0, 4.0, 12.0, 4.0),
                                                                              hidesUnderline: true,
                                                                              disabled: FFAppState().jobcategory == null || FFAppState().jobcategory == '',
                                                                              isSearchable: false,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                    ],
                                                                  ),
                                                                ),
                                                            ],
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
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Text(
                                                                  'Job title',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmall,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          TextFormField(
                                                            controller: _model
                                                                .jobTitleController,
                                                            obscureText: false,
                                                            decoration:
                                                                InputDecoration(
                                                              hintText:
                                                                  'Enter job title',
                                                              hintStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium,
                                                              enabledBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
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
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
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
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
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
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
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
                                                                          22.0,
                                                                          20.0,
                                                                          12.0),
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleMedium,
                                                            textAlign:
                                                                TextAlign.start,
                                                            keyboardType:
                                                                TextInputType
                                                                    .emailAddress,
                                                            validator: _model
                                                                .jobTitleControllerValidator
                                                                .asValidator(
                                                                    context),
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
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Text(
                                                                  'Job skill level',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmall,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          FlutterFlowDropDown<
                                                              String>(
                                                            controller: _model
                                                                    .prySkillLevelValueController ??=
                                                                FormFieldController<
                                                                        String>(
                                                                    null),
                                                            options: [
                                                              'Less than 1 year',
                                                              '1 to 10 years',
                                                              'More than 10 years'
                                                            ],
                                                            onChanged: (val) =>
                                                                setState(() =>
                                                                    _model.prySkillLevelValue =
                                                                        val),
                                                            width:
                                                                double.infinity,
                                                            height: 58.0,
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMedium,
                                                            hintText:
                                                                'Job skill Level',
                                                            elevation: 2.0,
                                                            borderColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .outlines,
                                                            borderWidth: 0.0,
                                                            borderRadius: 10.0,
                                                            margin:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        16.0,
                                                                        16.0,
                                                                        16.0),
                                                            hidesUnderline:
                                                                true,
                                                            isSearchable: false,
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
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Text(
                                                                  'Job description',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmall,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          TextFormField(
                                                            controller: _model
                                                                .jobDescriptionController,
                                                            obscureText: false,
                                                            decoration:
                                                                InputDecoration(
                                                              hintText:
                                                                  'Enter the job description here',
                                                              hintStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium,
                                                              enabledBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
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
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
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
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
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
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
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
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleMedium,
                                                            textAlign:
                                                                TextAlign.start,
                                                            validator: _model
                                                                .jobDescriptionControllerValidator
                                                                .asValidator(
                                                                    context),
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
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Text(
                                                                  'Minimum qualification',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmall,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Container(
                                                            width:
                                                                double.infinity,
                                                            height: 69.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              border:
                                                                  Border.all(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .outlines,
                                                                width: 2.0,
                                                              ),
                                                            ),
                                                            child:
                                                                FlutterFlowDropDown<
                                                                    String>(
                                                              controller: _model
                                                                      .minQualificationValueController ??=
                                                                  FormFieldController<
                                                                          String>(
                                                                      null),
                                                              options: [
                                                                'Below 8th Grade',
                                                                '8th Pass',
                                                                '10th Pass',
                                                                '12th Pass',
                                                                'Graduation',
                                                                'Post Graduation'
                                                              ],
                                                              onChanged: (val) =>
                                                                  setState(() =>
                                                                      _model.minQualificationValue =
                                                                          val),
                                                              width: 180.0,
                                                              height: 50.0,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium,
                                                              hintText:
                                                                  'Minimum qualification',
                                                              elevation: 2.0,
                                                              borderColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .outlines,
                                                              borderWidth: 0.0,
                                                              borderRadius:
                                                                  10.0,
                                                              margin:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12.0,
                                                                          4.0,
                                                                          12.0,
                                                                          4.0),
                                                              hidesUnderline:
                                                                  true,
                                                              isSearchable:
                                                                  false,
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
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Text(
                                                                  'Mode of salary',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmall,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Container(
                                                            width:
                                                                double.infinity,
                                                            height: 69.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
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
                                                                        .modeofSalaryValueController ??=
                                                                    FormFieldController<
                                                                            String>(
                                                                        null),
                                                                options: [
                                                                  'Daily',
                                                                  'Weekly',
                                                                  'Monthly'
                                                                ],
                                                                onChanged: (val) =>
                                                                    setState(() =>
                                                                        _model.modeofSalaryValue =
                                                                            val),
                                                                width: 180.0,
                                                                height: 50.0,
                                                                textStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMedium,
                                                                hintText:
                                                                    'Mode of salary',
                                                                elevation: 2.0,
                                                                borderColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .outlines,
                                                                borderWidth:
                                                                    0.0,
                                                                borderRadius:
                                                                    10.0,
                                                                margin: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        16.0,
                                                                        16.0,
                                                                        16.0),
                                                                hidesUnderline:
                                                                    true,
                                                                isSearchable:
                                                                    false,
                                                              ),
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
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Text(
                                                                  'Minimum salary (₹)',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmall,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          TextFormField(
                                                            controller: _model
                                                                .minimumSalaryController,
                                                            obscureText: false,
                                                            decoration:
                                                                InputDecoration(
                                                              hintText:
                                                                  'Enter minimum salary',
                                                              hintStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .textColor50,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                              enabledBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
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
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
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
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
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
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
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
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleMedium,
                                                            textAlign:
                                                                TextAlign.start,
                                                            keyboardType:
                                                                TextInputType
                                                                    .number,
                                                            validator: _model
                                                                .minimumSalaryControllerValidator
                                                                .asValidator(
                                                                    context),
                                                            inputFormatters: [
                                                              FilteringTextInputFormatter
                                                                  .allow(RegExp(
                                                                      '[0-9]'))
                                                            ],
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
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Text(
                                                                  'Maximum salary (₹)',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmall,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          TextFormField(
                                                            controller: _model
                                                                .maximumSalaryController,
                                                            obscureText: false,
                                                            decoration:
                                                                InputDecoration(
                                                              hintText:
                                                                  'Enter maximum salary',
                                                              hintStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .textColor50,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                              enabledBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
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
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
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
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
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
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
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
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleMedium,
                                                            textAlign:
                                                                TextAlign.start,
                                                            keyboardType:
                                                                TextInputType
                                                                    .number,
                                                            validator: _model
                                                                .maximumSalaryControllerValidator
                                                                .asValidator(
                                                                    context),
                                                            inputFormatters: [
                                                              FilteringTextInputFormatter
                                                                  .allow(RegExp(
                                                                      '[0-9]'))
                                                            ],
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
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Text(
                                                                  'Vacancies',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmall,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          TextFormField(
                                                            controller: _model
                                                                .noVacanciesController,
                                                            obscureText: false,
                                                            decoration:
                                                                InputDecoration(
                                                              hintText:
                                                                  'Enter no of vacancies',
                                                              hintStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .textColor50,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                              enabledBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
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
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
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
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
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
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
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
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleMedium,
                                                            textAlign:
                                                                TextAlign.start,
                                                            keyboardType:
                                                                TextInputType
                                                                    .number,
                                                            validator: _model
                                                                .noVacanciesControllerValidator
                                                                .asValidator(
                                                                    context),
                                                            inputFormatters: [
                                                              FilteringTextInputFormatter
                                                                  .allow(RegExp(
                                                                      '[0-9]'))
                                                            ],
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
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Text(
                                                                  'Gender',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmall,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Container(
                                                            width:
                                                                double.infinity,
                                                            height: 60.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              border:
                                                                  Border.all(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .outlines,
                                                                width: 2.0,
                                                              ),
                                                            ),
                                                            child:
                                                                FlutterFlowDropDown<
                                                                    String>(
                                                              controller: _model
                                                                      .genderValueController ??=
                                                                  FormFieldController<
                                                                          String>(
                                                                      null),
                                                              options: [
                                                                'Male',
                                                                'Female',
                                                                'Any'
                                                              ],
                                                              onChanged: (val) =>
                                                                  setState(() =>
                                                                      _model.genderValue =
                                                                          val),
                                                              width: 180.0,
                                                              height: 50.0,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium,
                                                              hintText:
                                                                  'Select the gender',
                                                              fillColor: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              elevation: 2.0,
                                                              borderColor: Colors
                                                                  .transparent,
                                                              borderWidth: 0.0,
                                                              borderRadius: 0.0,
                                                              margin:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12.0,
                                                                          4.0,
                                                                          12.0,
                                                                          4.0),
                                                              hidesUnderline:
                                                                  true,
                                                              isSearchable:
                                                                  false,
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
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Text(
                                                                  'Daily working hours',
                                                                  style: FlutterFlowTheme.of(context).headlineSmall,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          TextFormField(
                                                            controller: _model.workHoursController,
                                                            onChanged: (_) => EasyDebounce.debounce(
                                                              '_model.workHoursController',
                                                              Duration(milliseconds: 2000),
                                                                  () async {
                                                                setState(() {
                                                                  FFAppState().workhours = int.parse(_model.workHoursController.text);
                                                                });
                                                                if (FFAppState().workhours < 8) {
                                                                  await showDialog(
                                                                    context: context,
                                                                    builder: (alertDialogContext) {
                                                                      return AlertDialog(
                                                                        title: Text('ALERT'),
                                                                        content: Text('Working hours should be minimum 8'),
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
                                                                } else {
                                                                  return;
                                                                }
                                                              },
                                                            ),

                                                            obscureText: false,
                                                            decoration:InputDecoration(
                                                              hintText:'Enter working hours',
                                                              hintStyle:
                                                                  FlutterFlowTheme.of(context)
                                                                      .bodySmall
                                                                      .override(
                                                                        fontFamily:'Poppins',
                                                                        color: FlutterFlowTheme.of(context).textColor50,
                                                                        fontWeight:FontWeight.normal,),
                                                              enabledBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:BorderSide(
                                                                  color: FlutterFlowTheme.of( context).outlines,
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
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
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
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
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
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
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
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleMedium,
                                                            textAlign:
                                                                TextAlign.start,
                                                            keyboardType:
                                                                TextInputType
                                                                    .number,
                                                            validator: _model
                                                                .workHoursControllerValidator
                                                                .asValidator(
                                                                    context),
                                                            inputFormatters: [
                                                              FilteringTextInputFormatter
                                                                  .allow(RegExp(
                                                                      '[0-9]'))
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
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Text(
                                                                  'WORKER AGE',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineMedium,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Container(
                                                            width:
                                                                double.infinity,
                                                            height: 60.0,
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          438.0,
                                                                      height:
                                                                          110.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).outlines,
                                                                          width:
                                                                              2.0,
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            12.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.start,
                                                                          children: [
                                                                            Text(
                                                                              'Minimum age : ',
                                                                              style: FlutterFlowTheme.of(context).titleMedium,
                                                                            ),
                                                                            Text(
                                                                              valueOrDefault<String>(
                                                                                _model.minageSliderValue?.toString(),
                                                                                '18',
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).titleMedium,
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Container(
                                                                        width: double
                                                                            .infinity,
                                                                        height:
                                                                            100.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                          border:
                                                                              Border.all(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).outlines,
                                                                            width:
                                                                                2.0,
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              10.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              SliderTheme(
                                                                            data:
                                                                                SliderThemeData(
                                                                              showValueIndicator: ShowValueIndicator.always,
                                                                            ),
                                                                            child:
                                                                                Container(
                                                                              width: 1000.0,
                                                                              child: Slider.adaptive(
                                                                                activeColor: FlutterFlowTheme.of(context).primary,
                                                                                inactiveColor: FlutterFlowTheme.of(context).grayIcon,
                                                                                min: 18.0,
                                                                                max: valueOrDefault<double>(
                                                                                  _model.maxageSliderValue,
                                                                                  18.0,
                                                                                ),
                                                                                value: _model.minageSliderValue ??= 18.0,
                                                                                label: _model.minageSliderValue.toString(),
                                                                                onChanged: (newValue) {
                                                                                  newValue = double.parse(newValue.toStringAsFixed(0));
                                                                                  setState(() => _model.minageSliderValue = newValue);
                                                                                },
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        5.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              height: 60.0,
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            10.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            438.0,
                                                                        height:
                                                                            100.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                          border:
                                                                              Border.all(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).outlines,
                                                                            width:
                                                                                2.0,
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              12.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Text(
                                                                                'Maximum age : ',
                                                                                style: FlutterFlowTheme.of(context).titleMedium,
                                                                              ),
                                                                              Text(
                                                                                valueOrDefault<String>(
                                                                                  _model.maxageSliderValue?.toString(),
                                                                                  '60',
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).titleMedium,
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              double.infinity,
                                                                          height:
                                                                              100.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                            border:
                                                                                Border.all(
                                                                              color: FlutterFlowTheme.of(context).outlines,
                                                                              width: 2.0,
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                10.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                SliderTheme(
                                                                              data: SliderThemeData(
                                                                                showValueIndicator: ShowValueIndicator.always,
                                                                              ),
                                                                              child: Slider.adaptive(
                                                                                activeColor: FlutterFlowTheme.of(context).primary,
                                                                                inactiveColor: FlutterFlowTheme.of(context).grayIcon,
                                                                                min: valueOrDefault<double>(
                                                                                  _model.minageSliderValue,
                                                                                  60.0,
                                                                                ),
                                                                                max: 60.0,
                                                                                value: _model.maxageSliderValue ??= 60.0,
                                                                                label: _model.maxageSliderValue.toString(),
                                                                                onChanged: _model.minageSliderValue == null
                                                                                    ? null
                                                                                    : (newValue) {
                                                                                        newValue = double.parse(newValue.toStringAsFixed(0));
                                                                                        setState(() => _model.maxageSliderValue = newValue);
                                                                                      },
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
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
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              height: 194.1,
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12.0),
                                                                border:
                                                                    Border.all(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .outlines,
                                                                  width: 2.0,
                                                                ),
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      'FACILITIES',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .headlineMedium,
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          40.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            232.0,
                                                                        height:
                                                                            172.2,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                        ),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Theme(
                                                                                          data: ThemeData(
                                                                                            checkboxTheme: CheckboxThemeData(
                                                                                              shape: RoundedRectangleBorder(
                                                                                                borderRadius: BorderRadius.circular(0.0),
                                                                                              ),
                                                                                            ),
                                                                                            unselectedWidgetColor: FlutterFlowTheme.of(context).primaryText,
                                                                                          ),
                                                                                          child: Checkbox(
                                                                                            value: _model.foodCheckboxValue ??= false,
                                                                                            onChanged: (newValue) async {
                                                                                              setState(() => _model.foodCheckboxValue = newValue!);
                                                                                              if (newValue!) {
                                                                                                setState(() {
                                                                                                  FFAppState().FoodCheck = true;
                                                                                                });
                                                                                              }
                                                                                            },
                                                                                            activeColor: FlutterFlowTheme.of(context).primary,
                                                                                          ),
                                                                                        ),
                                                                                        Text(
                                                                                          'Food',
                                                                                          style: FlutterFlowTheme.of(context).titleMedium,
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Theme(
                                                                                            data: ThemeData(
                                                                                              checkboxTheme: CheckboxThemeData(
                                                                                                shape: RoundedRectangleBorder(
                                                                                                  borderRadius: BorderRadius.circular(0.0),
                                                                                                ),
                                                                                              ),
                                                                                              unselectedWidgetColor: FlutterFlowTheme.of(context).primaryText,
                                                                                            ),
                                                                                            child: Checkbox(
                                                                                              value: _model.transportationCheckboxValue ??= false,
                                                                                              onChanged: (newValue) async {
                                                                                                setState(() => _model.transportationCheckboxValue = newValue!);
                                                                                                if (newValue!) {
                                                                                                  setState(() {
                                                                                                    FFAppState().transportationcheck = true;
                                                                                                  });
                                                                                                }
                                                                                              },
                                                                                              activeColor: FlutterFlowTheme.of(context).primary,
                                                                                            ),
                                                                                          ),
                                                                                          Text(
                                                                                            'Transportation',
                                                                                            style: FlutterFlowTheme.of(context).titleMedium,
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Theme(
                                                                                        data: ThemeData(
                                                                                          checkboxTheme: CheckboxThemeData(
                                                                                            shape: RoundedRectangleBorder(
                                                                                              borderRadius: BorderRadius.circular(0.0),
                                                                                            ),
                                                                                          ),
                                                                                          unselectedWidgetColor: FlutterFlowTheme.of(context).primaryText,
                                                                                        ),
                                                                                        child: Checkbox(
                                                                                          value: _model.lodgingCheckboxValue ??= false,
                                                                                          onChanged: (newValue) async {
                                                                                            setState(() => _model.lodgingCheckboxValue = newValue!);
                                                                                            if (newValue!) {
                                                                                              setState(() {
                                                                                                FFAppState().AccomodationCheck = true;
                                                                                              });
                                                                                            }
                                                                                          },
                                                                                          activeColor: FlutterFlowTheme.of(context).primary,
                                                                                        ),
                                                                                      ),
                                                                                      Text(
                                                                                        'Lodging',
                                                                                        style: FlutterFlowTheme.of(context).titleMedium,
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Theme(
                                                                                    data: ThemeData(
                                                                                      checkboxTheme: CheckboxThemeData(
                                                                                        shape: RoundedRectangleBorder(
                                                                                          borderRadius: BorderRadius.circular(0.0),
                                                                                        ),
                                                                                      ),
                                                                                      unselectedWidgetColor: FlutterFlowTheme.of(context).primaryText,
                                                                                    ),
                                                                                    child: Checkbox(
                                                                                      value: _model.medicalCheckboxValue ??= false,
                                                                                      onChanged: (newValue) async {
                                                                                        setState(() => _model.medicalCheckboxValue = newValue!);
                                                                                        if (newValue!) {
                                                                                          setState(() {
                                                                                            FFAppState().medicalcheck = true;
                                                                                          });
                                                                                        }
                                                                                      },
                                                                                      activeColor: FlutterFlowTheme.of(context).primary,
                                                                                    ),
                                                                                  ),
                                                                                  Text(
                                                                                    'Medical',
                                                                                    style: FlutterFlowTheme.of(context).titleMedium,
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
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        20.0,
                                                                        0.0,
                                                                        15.0),
                                                            child: Row(
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
                                                                    'JOB DURATION',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineMedium,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: [
                                                              Expanded(
                                                                child:
                                                                    Container(
                                                                  width: 500.0,
                                                                  height: 50.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .only(
                                                                      bottomLeft:
                                                                          Radius.circular(
                                                                              8.0),
                                                                      bottomRight:
                                                                          Radius.circular(
                                                                              0.0),
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              8.0),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              0.0),
                                                                    ),
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .outlines,
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                  ),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            -1.0,
                                                                            0.0),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              10.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            'Start Date :',
                                                                            style:
                                                                                FlutterFlowTheme.of(context).titleMedium,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      if (_model
                                                                              .datePicked1 !=
                                                                          null)
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              20.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            valueOrDefault<String>(
                                                                              functions.ddmmyyyy(dateTimeFormat('yMd', _model.datePicked1)),
                                                                              'dd',
                                                                            ),
                                                                            style:
                                                                                FlutterFlowTheme.of(context).titleMedium,
                                                                          ),
                                                                        ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                              Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Container(
                                                                    width: 50.0,
                                                                    height:
                                                                        50.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius
                                                                              .only(
                                                                        bottomLeft:
                                                                            Radius.circular(0.0),
                                                                        bottomRight:
                                                                            Radius.circular(8.0),
                                                                        topLeft:
                                                                            Radius.circular(0.0),
                                                                        topRight:
                                                                            Radius.circular(8.0),
                                                                      ),
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .outlines,
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        if (kIsWeb) {
                                                                          final _datePicked1Date =
                                                                              await showDatePicker(
                                                                            context:
                                                                                context,
                                                                            initialDate:
                                                                                getCurrentTimestamp,
                                                                            firstDate:
                                                                                getCurrentTimestamp,
                                                                            lastDate:
                                                                                DateTime(2050),
                                                                          );

                                                                          if (_datePicked1Date !=
                                                                              null) {
                                                                            setState(() {
                                                                              _model.datePicked1 = DateTime(
                                                                                _datePicked1Date.year,
                                                                                _datePicked1Date.month,
                                                                                _datePicked1Date.day,
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
                                                                              setState(() {
                                                                                _model.datePicked1 = date;
                                                                              });
                                                                            },
                                                                            currentTime:
                                                                                getCurrentTimestamp,
                                                                            minTime:
                                                                                getCurrentTimestamp,
                                                                          );
                                                                        }
                                                                      },
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .calendar_today,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        size:
                                                                            24.0,
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
                                                                        10.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                      Container(
                                                                    width:
                                                                        500.0,
                                                                    height:
                                                                        50.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius
                                                                              .only(
                                                                        bottomLeft:
                                                                            Radius.circular(8.0),
                                                                        bottomRight:
                                                                            Radius.circular(0.0),
                                                                        topLeft:
                                                                            Radius.circular(8.0),
                                                                        topRight:
                                                                            Radius.circular(0.0),
                                                                      ),
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .outlines,
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                    ),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              -1.0,
                                                                              0.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                10.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Text(
                                                                              'End Date :',
                                                                              style: FlutterFlowTheme.of(context).titleMedium,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        if (_model.datePicked2 !=
                                                                            null)
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                20.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Text(
                                                                              valueOrDefault<String>(
                                                                                functions.ddmmyyyy(dateTimeFormat('yMd', _model.datePicked2)),
                                                                                'dd',
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).titleMedium,
                                                                            ),
                                                                          ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Container(
                                                                      width:
                                                                          50.0,
                                                                      height:
                                                                          50.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.only(
                                                                          bottomLeft:
                                                                              Radius.circular(0.0),
                                                                          bottomRight:
                                                                              Radius.circular(8.0),
                                                                          topLeft:
                                                                              Radius.circular(0.0),
                                                                          topRight:
                                                                              Radius.circular(8.0),
                                                                        ),
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).outlines,
                                                                          width:
                                                                              2.0,
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          if (kIsWeb) {
                                                                            final _datePicked2Date =
                                                                                await showDatePicker(
                                                                              context: context,
                                                                              initialDate: _model.datePicked1!,
                                                                              firstDate: _model.datePicked1!,
                                                                              lastDate: DateTime(2050),
                                                                            );

                                                                            if (_datePicked2Date !=
                                                                                null) {
                                                                              setState(() {
                                                                                _model.datePicked2 = DateTime(
                                                                                  _datePicked2Date.year,
                                                                                  _datePicked2Date.month,
                                                                                  _datePicked2Date.day,
                                                                                );
                                                                              });
                                                                            }
                                                                          } else {
                                                                            await DatePicker.showDatePicker(
                                                                              context,
                                                                              showTitleActions: true,
                                                                              onConfirm: (date) {
                                                                                setState(() {
                                                                                  _model.datePicked2 = date;
                                                                                });
                                                                              },
                                                                              currentTime: _model.datePicked1!,
                                                                              minTime: _model.datePicked1!,
                                                                            );
                                                                          }
                                                                        },
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .calendar_today,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                        ),
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
                                                                        20.0,
                                                                        0.0,
                                                                        0.0),
                                                            child:
                                                                wrapWithModel(
                                                              model: _model
                                                                  .jobaddressModel,
                                                              updateCallback:
                                                                  () => setState(
                                                                      () {}),
                                                              updateOnChange:
                                                                  true,
                                                              child:
                                                                  JobaddressWidget(),
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
                                        ],
                                      ),
                                    ),
                                  ],
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
                                        if ((_model
                                                        .jobaddressModel
                                                        .pincodefieldController
                                                        .text !=
                                                    null &&
                                                _model
                                                        .jobaddressModel
                                                        .pincodefieldController
                                                        .text !=
                                                    '') &&
                                            (_model.jobaddressModel
                                                        .areadropdownValue !=
                                                    null &&
                                                _model.jobaddressModel
                                                        .areadropdownValue !=
                                                    '')) {
                                          if (_model.formKey.currentState ==
                                                  null ||
                                              !_model.formKey.currentState!
                                                  .validate()) {
                                            return;
                                          }
                                          if (_model.jobCategoryValue == null) {
                                            return;
                                          }
                                          if (_model.prySkillLevelValue ==
                                              null) {
                                            return;
                                          }
                                          if (_model.minQualificationValue ==
                                              null) {
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  title: Text('Field required'),
                                                  content: Text(
                                                      'Min qualification is required'),
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
                                            return;
                                          }
                                          if (_model.modeofSalaryValue ==
                                              null) {
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  title: Text('Field required'),
                                                  content: Text(
                                                      'mode of salary is required'),
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
                                            return;
                                          }
                                          if (_model.genderValue == null) {
                                            return;
                                          }
                                          if (_model.datePicked1 == null) {
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  title:
                                                      Text('Date is required'),
                                                  content:
                                                      Text('Choose a date'),
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
                                            return;
                                          }
                                          if (_model.datePicked2 == null) {
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  title: Text('Field required'),
                                                  content:
                                                      Text('Choose a date'),
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
                                            return;
                                          }

                                          final jobsCreateData =
                                              createJobsRecordData(
                                            jobDescription: _model
                                                .jobDescriptionController.text,
                                            primarySkillLevel:
                                                _model.prySkillLevelValue,
                                            organisationName: widget
                                                .orgdetails!.organisationName,
                                            jobTitle:
                                                _model.jobTitleController.text,
                                            modeOfSalary:
                                                _model.modeofSalaryValue,
                                            jobCategory:
                                                _model.jobCategoryValue,
                                            pinCode: _model.jobaddressModel
                                                .pincodefieldController.text,
                                            area: _model.jobaddressModel
                                                .areadropdownValue,
                                            district: FFAppState().district,
                                            state: FFAppState().state,
                                            numberOfVacancies: int.tryParse(
                                                _model.noVacanciesController
                                                    .text),
                                            workingHours:
                                                _model.workHoursController.text,
                                            gender: _model.genderValue,
                                            minSalary: _model
                                                .minimumSalaryController.text,
                                            maxSalary: _model
                                                .maximumSalaryController.text,
                                            minAge: _model.minageSliderValue
                                                ?.toString(),
                                            maxAge: _model.maxageSliderValue
                                                ?.toString(),
                                            food:
                                                FFAppState().FoodCheck == false
                                                    ? 'unavailable'
                                                    : 'available',
                                            lodging: FFAppState()
                                                        .AccomodationCheck ==
                                                    false
                                                ? 'unavailable'
                                                : 'available',
                                            transportation: FFAppState()
                                                        .transportationcheck ==
                                                    false
                                                ? 'unavailable'
                                                : 'available',
                                            medical:
                                                FFAppState().medicalcheck ==
                                                        false
                                                    ? 'unavailable'
                                                    : 'available',
                                            jobSubCateg: FFAppState().jobtitle,
                                            orgRefId:
                                                widget.orgdetails!.reference,
                                            jobImage: FFAppState().profilepic,
                                            startDate: _model.datePicked1,
                                            endDate: _model.datePicked2,
                                            minQualification:
                                                _model.minQualificationValue,
                                            jobStatus: '1',
                                          );
                                          await JobsRecord.createDoc(
                                                  widget.orgdetails!.reference)
                                              .set(jobsCreateData);

                                          context.pushNamed(
                                              'OrganisationListCopy');

                                          setState(() {
                                            FFAppState().profilepic = '';
                                          });
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
                                      },
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          if ((_model
                                                          .jobaddressModel
                                                          .pincodefieldController
                                                          .text !=
                                                      null &&
                                                  _model
                                                          .jobaddressModel
                                                          .pincodefieldController
                                                          .text !=
                                                      '') &&
                                              (_model.jobaddressModel
                                                          .areadropdownValue !=
                                                      null &&
                                                  _model.jobaddressModel
                                                          .areadropdownValue !=
                                                      '')) {
                                            if (_model.formKey.currentState ==
                                                    null ||
                                                !_model.formKey.currentState!
                                                    .validate()) {
                                              return;
                                            }
                                            if (_model.jobCategoryValue ==
                                                null) {
                                              return;
                                            }
                                            if (_model.prySkillLevelValue ==
                                                null) {
                                              return;
                                            }
                                            if (_model.minQualificationValue ==
                                                null) {
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return AlertDialog(
                                                    title:
                                                        Text('Field required'),
                                                    content: Text(
                                                        'Min qualification is required'),
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
                                              return;
                                            }
                                            if (_model.modeofSalaryValue ==
                                                null) {
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return AlertDialog(
                                                    title:
                                                        Text('Field required'),
                                                    content: Text(
                                                        'mode of salary is required'),
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
                                              return;
                                            }
                                            if (_model.genderValue == null) {
                                              return;
                                            }
                                            if (_model.datePicked1 == null) {
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return AlertDialog(
                                                    title: Text(
                                                        'Date is required'),
                                                    content:
                                                        Text('Choose a date'),
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
                                              return;
                                            }
                                            if (_model.datePicked2 == null) {
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return AlertDialog(
                                                    title:
                                                        Text('Field required'),
                                                    content:
                                                        Text('Choose a date'),
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
                                              return;
                                            }

                                            final jobsCreateData =
                                                createJobsRecordData(
                                              jobDescription: _model
                                                  .jobDescriptionController
                                                  .text,
                                              primarySkillLevel:
                                                  _model.prySkillLevelValue,
                                              organisationName: widget
                                                  .orgdetails!.organisationName,
                                              jobTitle: _model
                                                  .jobTitleController.text,
                                              modeOfSalary:
                                                  _model.modeofSalaryValue,
                                              jobCategory:
                                                  _model.jobCategoryValue,
                                              pinCode: _model.jobaddressModel
                                                  .pincodefieldController.text,
                                              area: _model.jobaddressModel
                                                  .areadropdownValue,
                                              district: FFAppState().district,
                                              state: FFAppState().state,
                                              numberOfVacancies: int.tryParse(
                                                  _model.noVacanciesController
                                                      .text),
                                              workingHours: _model
                                                  .workHoursController.text,
                                              gender: _model.genderValue,
                                              minSalary: _model
                                                  .minimumSalaryController.text,
                                              maxSalary: _model
                                                  .maximumSalaryController.text,
                                              minAge: _model.minageSliderValue
                                                  ?.toString(),
                                              maxAge: _model.maxageSliderValue
                                                  ?.toString(),
                                              food: FFAppState().FoodCheck ==
                                                      false
                                                  ? 'unavailable'
                                                  : 'available',
                                              lodging: FFAppState()
                                                          .AccomodationCheck ==
                                                      false
                                                  ? 'unavailable'
                                                  : 'available',
                                              transportation: FFAppState()
                                                          .transportationcheck ==
                                                      false
                                                  ? 'unavailable'
                                                  : 'available',
                                              medical:
                                                  FFAppState().medicalcheck ==
                                                          false
                                                      ? 'unavailable'
                                                      : 'available',
                                              jobSubCateg:
                                                  valueOrDefault<String>(
                                                FFAppState().jobtitle,
                                                'Not Available',
                                              ),
                                              orgRefId:
                                                  widget.orgdetails!.reference,
                                              jobImage: FFAppState().profilepic,
                                              startDate: _model.datePicked1,
                                              endDate: _model.datePicked2,
                                              minQualification:
                                                  _model.minQualificationValue,
                                              jobStatus: '1',
                                              filled: 0,
                                            );
                                            await JobsRecord.createDoc(widget
                                                    .orgdetails!.reference)
                                                .set(jobsCreateData);
                                            setState(() {
                                              FFAppState().profilepic = '';
                                            });
                                            FFAppState().update(() {
                                              FFAppState().profilepic = '';
                                              FFAppState().district =
                                                  'District';
                                              FFAppState().state = 'State';
                                              FFAppState().arealist = [];
                                            });

                                            context.pushNamed(
                                              'OrganisationDashboard',
                                              queryParams: {
                                                'organisationdetails':
                                                    serializeParam(
                                                  widget.orgdetails,
                                                  ParamType.Document,
                                                ),
                                                'orgref': serializeParam(
                                                  widget.orgdetails!.reference,
                                                  ParamType.DocumentReference,
                                                ),
                                              }.withoutNulls,
                                              extra: <String, dynamic>{
                                                'organisationdetails':
                                                    widget.orgdetails,
                                              },
                                            );
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
                                            return;
                                          }
                                        },
                                        text: 'SAVE',
                                        options: FFButtonOptions(
                                          width: 150.0,
                                          height: 60.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .secondary,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleMedium
                                              .override(
                                                fontFamily: 'Poppins',
                                                color:
                                                    FlutterFlowTheme.of(context)
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
                        );
                      },
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
