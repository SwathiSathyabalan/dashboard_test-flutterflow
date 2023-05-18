import '/backend/backend.dart';
import '/components/bottombar/bottombar_widget.dart';
import '/components/headingbar/headingbar_widget.dart';
import '/components/no_list/no_list_widget.dart';
import '/components/web_nav/web_nav_widget.dart';
import '/flutter_flow/flutter_flow_checkbox_group.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
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
import 'workers_dashboard_copy_model.dart';
export 'workers_dashboard_copy_model.dart';

class WorkersDashboardCopyWidget extends StatefulWidget {
  const WorkersDashboardCopyWidget({
    Key? key,
    required this.capDoc,
  }) : super(key: key);

  final RecruitersRecord? capDoc;

  @override
  _WorkersDashboardCopyWidgetState createState() =>
      _WorkersDashboardCopyWidgetState();
}

class _WorkersDashboardCopyWidgetState
    extends State<WorkersDashboardCopyWidget> {
  late WorkersDashboardCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WorkersDashboardCopyModel());

    _model.textController ??= TextEditingController();
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

    return StreamBuilder<List<WorkersRecord>>(
      stream: queryWorkersRecord(
        queryBuilder: (workersRecord) => workersRecord
            .whereIn('state', _model.stateCheckboxValues)
            .orderBy('created_date', descending: true),
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
        List<WorkersRecord> workersDashboardCopyWorkersRecordList =
            snapshot.data!;
        return GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: WillPopScope(
            onWillPop: () async => false,
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
              endDrawer: Container(
                width: MediaQuery.of(context).size.width * 0.23,
                child: Drawer(
                  elevation: 20.0,
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 20.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Filters',
                                  style: FlutterFlowTheme.of(context)
                                      .headlineMedium,
                                ),
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    if (scaffoldKey
                                            .currentState!.isDrawerOpen ||
                                        scaffoldKey
                                            .currentState!.isEndDrawerOpen) {
                                      Navigator.pop(context);
                                    }
                                  },
                                  child: Icon(
                                    Icons.cancel,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 28.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 20.0, 0.0, 0.0),
                            child: Text(
                              'GENDER',
                              style:
                                  FlutterFlowTheme.of(context).headlineMedium,
                            ),
                          ),
                          Container(
                            width: 300.0,
                            height: 120.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: FlutterFlowCheckboxGroup(
                                        options: ['Male', 'Female', 'Others'],
                                        onChanged: (val) => setState(() =>
                                            _model.genderCheckboxValues = val),
                                        controller: _model
                                                .genderCheckboxValueController ??=
                                            FormFieldController<List<String>>(
                                          [],
                                        ),
                                        activeColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        checkColor: Colors.white,
                                        checkboxBorderColor: Color(0xFF95A1AC),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .headlineSmall,
                                        labelPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                20.0, 0.0, 0.0, 0.0),
                                        itemPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 2.0, 0.0, 2.0),
                                        initialized:
                                            _model.genderCheckboxValues != null,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 20.0, 0.0, 0.0),
                            child: Text(
                              'SKILLS',
                              style:
                                  FlutterFlowTheme.of(context).headlineMedium,
                            ),
                          ),
                          Container(
                            width: 300.0,
                            height: 390.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: FlutterFlowCheckboxGroup(
                                        options: [
                                          'Sewing',
                                          'Farming',
                                          'Textiles',
                                          'Plumber',
                                          'Welder',
                                          'Cooking',
                                          'Fabricators',
                                          'Installers',
                                          'Assembling',
                                          'Fitters'
                                        ],
                                        onChanged: (val) => setState(() =>
                                            _model.skillsCheckboxValues = val),
                                        controller: _model
                                                .skillsCheckboxValueController ??=
                                            FormFieldController<List<String>>(
                                          [],
                                        ),
                                        activeColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        checkColor: Colors.white,
                                        checkboxBorderColor: Color(0xFF95A1AC),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .headlineSmall,
                                        labelPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                20.0, 0.0, 0.0, 0.0),
                                        itemPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 2.0, 0.0, 2.0),
                                        initialized:
                                            _model.skillsCheckboxValues != null,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 20.0, 0.0, 0.0),
                            child: Text(
                              'STATE',
                              style:
                                  FlutterFlowTheme.of(context).headlineMedium,
                            ),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              setState(() {
                                FFAppState().addToStateslist(
                                    _model.stateCheckboxValues!.first);
                              });
                            },
                            child: Container(
                              width: 300.0,
                              height: 950.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: FlutterFlowCheckboxGroup(
                                          options: [
                                            'Andhra Pradesh',
                                            'Arunachal Pradesh\t',
                                            'Assam',
                                            'Bihar',
                                            'Chhattisgarh',
                                            'Goa',
                                            'Gujarat',
                                            'Haryana',
                                            'Himachal Pradesh',
                                            '\tJharkhand',
                                            '\tKarnataka',
                                            'Kerala',
                                            'Madhya Pradesh',
                                            'Maharashtra',
                                            'Manipur\t',
                                            'Nagaland',
                                            'Odisha',
                                            'Punjab\t',
                                            'Rajasthan',
                                            'Sikkim',
                                            'Tamil Nadu',
                                            'Telangana',
                                            'Tripura',
                                            'Uttar Pradesh',
                                            'Uttarakhand',
                                            'West Bengal'
                                          ],
                                          onChanged: (val) => setState(() =>
                                              _model.stateCheckboxValues = val),
                                          controller: _model
                                                  .stateCheckboxValueController ??=
                                              FormFieldController<List<String>>(
                                            [],
                                          ),
                                          activeColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          checkColor: Colors.white,
                                          checkboxBorderColor:
                                              Color(0xFF95A1AC),
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .headlineSmall,
                                          labelPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 0.0, 0.0, 0.0),
                                          itemPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 2.0, 0.0, 2.0),
                                          initialized:
                                              _model.stateCheckboxValues !=
                                                  null,
                                        ),
                                      ),
                                    ],
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
              ),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                        child: wrapWithModel(
                          model: _model.webNavModel,
                          updateCallback: () => setState(() {}),
                          child: WebNavWidget(
                            colour1: FlutterFlowTheme.of(context).tertiary,
                            colour2: FlutterFlowTheme.of(context).tertiary,
                            colour3: FlutterFlowTheme.of(context).tertiary,
                            colour4: FlutterFlowTheme.of(context).secondary,
                            colour5: FlutterFlowTheme.of(context).tertiary,
                            colour6: FlutterFlowTheme.of(context).tertiary,
                            colour7: FlutterFlowTheme.of(context).tertiary,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 8,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  wrapWithModel(
                                    model: _model.headingbarModel,
                                    updateCallback: () => setState(() {}),
                                    child: HeadingbarWidget(
                                      text: 'WORKERS DASHBOARD',
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      width: double.infinity,
                                      height: 100.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 4.0,
                                            color: Color(0x33000000),
                                            offset: Offset(0.0, 2.0),
                                          )
                                        ],
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 0.0, 20.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 20.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  FFButtonWidget(
                                                    onPressed: () async {
                                                      setState(() {
                                                        FFAppState().AddWorker =
                                                            'Worker';
                                                      });
                                                      setState(() {
                                                        FFAppState()
                                                            .profilepic = '';
                                                      });

                                                      context.pushNamed(
                                                          'Authentication');
                                                    },
                                                    text: 'ADD NEW WORKER',
                                                    options: FFButtonOptions(
                                                      width: 250.0,
                                                      height: 50.0,
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      iconPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 18.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                      elevation: 2.0,
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 30.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                    width: 600.0,
                                                    height: 70.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      border: Border.all(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .outlines,
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  10.0,
                                                                  10.0,
                                                                  10.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Icon(
                                                            Icons
                                                                .search_rounded,
                                                            color: Colors.black,
                                                            size: 28.0,
                                                          ),
                                                          Expanded(
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          20.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child:
                                                                  TextFormField(
                                                                controller: _model
                                                                    .textController,
                                                                onChanged: (_) =>
                                                                    EasyDebounce
                                                                        .debounce(
                                                                  '_model.textController',
                                                                  Duration(
                                                                      milliseconds:
                                                                          1),
                                                                  () => setState(
                                                                      () {}),
                                                                ),
                                                                obscureText:
                                                                    false,
                                                                decoration:
                                                                    InputDecoration(
                                                                  hintText:
                                                                      'Search by name',
                                                                  hintStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                      ),
                                                                  enabledBorder:
                                                                      UnderlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: Color(
                                                                          0x00000000),
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        const BorderRadius
                                                                            .only(
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              4.0),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              4.0),
                                                                    ),
                                                                  ),
                                                                  focusedBorder:
                                                                      UnderlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: Color(
                                                                          0x00000000),
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        const BorderRadius
                                                                            .only(
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              4.0),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              4.0),
                                                                    ),
                                                                  ),
                                                                  errorBorder:
                                                                      UnderlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: Color(
                                                                          0x00000000),
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        const BorderRadius
                                                                            .only(
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              4.0),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              4.0),
                                                                    ),
                                                                  ),
                                                                  focusedErrorBorder:
                                                                      UnderlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: Color(
                                                                          0x00000000),
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        const BorderRadius
                                                                            .only(
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              4.0),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              4.0),
                                                                    ),
                                                                  ),
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineSmall,
                                                                keyboardType:
                                                                    TextInputType
                                                                        .name,
                                                                validator: _model
                                                                    .textControllerValidator
                                                                    .asValidator(
                                                                        context),
                                                                inputFormatters: [
                                                                  FilteringTextInputFormatter
                                                                      .allow(RegExp(
                                                                          '[a-zA-Z]'))
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    20.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Container(
                                                          width: 300.0,
                                                          height: 70.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            10.0,
                                                                            0.0),
                                                                child: Text(
                                                                  'Sort By :',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmall,
                                                                ),
                                                              ),
                                                              FlutterFlowDropDown<
                                                                  String>(
                                                                controller: _model
                                                                        .dropDownValueController ??=
                                                                    FormFieldController<
                                                                        String>(
                                                                  _model.dropDownValue ??=
                                                                      'All',
                                                                ),
                                                                options: [
                                                                  'Status',
                                                                  'Age',
                                                                  'All'
                                                                ],
                                                                onChanged:
                                                                    (val) async {
                                                                  setState(() =>
                                                                      _model.dropDownValue =
                                                                          val);
                                                                  setState(() {
                                                                    FFAppState()
                                                                            .agesort =
                                                                        () {
                                                                      if (_model
                                                                              .dropDownValue ==
                                                                          'Status') {
                                                                        return '1';
                                                                      } else if (_model
                                                                              .dropDownValue ==
                                                                          'Age') {
                                                                        return '2';
                                                                      } else if (_model
                                                                              .dropDownValue ==
                                                                          'All') {
                                                                        return '0';
                                                                      } else {
                                                                        return 'kk';
                                                                      }
                                                                    }();
                                                                  });
                                                                },
                                                                width: 180.0,
                                                                height: 50.0,
                                                                textStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMedium,
                                                                hintText:
                                                                    'Sort By.....',
                                                                fillColor:
                                                                    Colors
                                                                        .white,
                                                                elevation: 2.0,
                                                                borderColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .outlines,
                                                                borderWidth:
                                                                    0.0,
                                                                borderRadius:
                                                                    8.0,
                                                                margin: EdgeInsetsDirectional
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
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 30.0, 0.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Expanded(
                                                      child: Container(
                                                        width: double.infinity,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      8.0,
                                                                      8.0,
                                                                      8.0,
                                                                      8.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Container(
                                                                width: double
                                                                    .infinity,
                                                                height: 60.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .tertiary,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              0.0),
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          10.0,
                                                                          0.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Container(
                                                                        width:
                                                                            282.5,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          borderRadius:
                                                                              BorderRadius.circular(0.0),
                                                                          shape:
                                                                              BoxShape.rectangle,
                                                                        ),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Container(
                                                                              width: 245.0,
                                                                              height: 100.0,
                                                                              decoration: BoxDecoration(),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                    child: Text(
                                                                                      'FULL NAME',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Poppins',
                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                            fontSize: 18.0,
                                                                                            fontWeight: FontWeight.w600,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Container(
                                                                        width:
                                                                            218.0,
                                                                        height:
                                                                            100.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          borderRadius:
                                                                              BorderRadius.circular(0.0),
                                                                          shape:
                                                                              BoxShape.rectangle,
                                                                        ),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Text(
                                                                              'STATUS',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Poppins',
                                                                                    fontWeight: FontWeight.w600,
                                                                                  ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Container(
                                                                        width:
                                                                            179.0,
                                                                        height:
                                                                            100.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          borderRadius:
                                                                              BorderRadius.circular(0.0),
                                                                          shape:
                                                                              BoxShape.rectangle,
                                                                        ),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Text(
                                                                              'GENDER',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Poppins',
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                    fontSize: 18.0,
                                                                                    fontWeight: FontWeight.w600,
                                                                                  ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Container(
                                                                        width:
                                                                            152.0,
                                                                        height:
                                                                            100.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          borderRadius:
                                                                              BorderRadius.circular(0.0),
                                                                          shape:
                                                                              BoxShape.rectangle,
                                                                        ),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Text(
                                                                              'AGE',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Poppins',
                                                                                    fontWeight: FontWeight.w600,
                                                                                  ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Container(
                                                                        width:
                                                                            207.0,
                                                                        height:
                                                                            100.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          borderRadius:
                                                                              BorderRadius.circular(0.0),
                                                                          shape:
                                                                              BoxShape.rectangle,
                                                                        ),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Text(
                                                                              'DISTRICT',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Poppins',
                                                                                    fontWeight: FontWeight.w600,
                                                                                  ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Container(
                                                                        width:
                                                                            158.5,
                                                                        height:
                                                                            100.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          borderRadius:
                                                                              BorderRadius.circular(0.0),
                                                                          shape:
                                                                              BoxShape.rectangle,
                                                                        ),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Text(
                                                                              'STATE',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Poppins',
                                                                                    fontWeight: FontWeight.w600,
                                                                                  ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Container(
                                                                        width:
                                                                            194.0,
                                                                        height:
                                                                            100.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          borderRadius:
                                                                              BorderRadius.circular(0.0),
                                                                          shape:
                                                                              BoxShape.rectangle,
                                                                        ),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Text(
                                                                              'KEY SKILL',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium,
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Container(
                                                                        width:
                                                                            70.0,
                                                                        height:
                                                                            100.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          borderRadius:
                                                                              BorderRadius.circular(0.0),
                                                                          shape:
                                                                              BoxShape.rectangle,
                                                                        ),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Text(
                                                                              'VIEW',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium,
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child:
                                                                    SingleChildScrollView(
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      if (FFAppState()
                                                                              .agesort ==
                                                                          '0')
                                                                        StreamBuilder<
                                                                            List<WorkersRecord>>(
                                                                          stream:
                                                                              queryWorkersRecord(
                                                                            queryBuilder: (workersRecord) =>
                                                                                workersRecord.orderBy('created_date', descending: true),
                                                                          ),
                                                                          builder:
                                                                              (context, snapshot) {
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
                                                                            List<WorkersRecord>
                                                                                listViewWorkersRecordList =
                                                                                snapshot.data!;
                                                                            if (listViewWorkersRecordList.isEmpty) {
                                                                              return Container(
                                                                                width: double.infinity,
                                                                                height: 150.0,
                                                                                child: NoListWidget(
                                                                                  text: 'workers',
                                                                                ),
                                                                              );
                                                                            }
                                                                            return ListView.builder(
                                                                              padding: EdgeInsets.zero,
                                                                              shrinkWrap: true,
                                                                              scrollDirection: Axis.vertical,
                                                                              itemCount: listViewWorkersRecordList.length,
                                                                              itemBuilder: (context, listViewIndex) {
                                                                                final listViewWorkersRecord = listViewWorkersRecordList[listViewIndex];
                                                                                return Visibility(
                                                                                  visible: functions.search(_model.textController.text, listViewWorkersRecord.fullName!) ?? true,
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 2.0),
                                                                                    child: Container(
                                                                                      width: double.infinity,
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        boxShadow: [
                                                                                          BoxShadow(
                                                                                            blurRadius: 4.0,
                                                                                            color: Color(0x33000000),
                                                                                            offset: Offset(0.0, 2.0),
                                                                                          )
                                                                                        ],
                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                      ),
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.min,
                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                          children: [
                                                                                            Container(
                                                                                              width: 282.0,
                                                                                              decoration: BoxDecoration(
                                                                                                borderRadius: BorderRadius.circular(0.0),
                                                                                                shape: BoxShape.rectangle,
                                                                                              ),
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Container(
                                                                                                    width: 75.0,
                                                                                                    height: 75.0,
                                                                                                    decoration: BoxDecoration(
                                                                                                      image: DecorationImage(
                                                                                                        fit: BoxFit.cover,
                                                                                                        image: Image.asset(
                                                                                                          'assets/images/workers111.png',
                                                                                                        ).image,
                                                                                                      ),
                                                                                                      shape: BoxShape.circle,
                                                                                                      border: Border.all(
                                                                                                        color: FlutterFlowTheme.of(context).lineColor,
                                                                                                      ),
                                                                                                    ),
                                                                                                    child: Visibility(
                                                                                                      visible: listViewWorkersRecord.photo != null && listViewWorkersRecord.photo != '',
                                                                                                      child: Container(
                                                                                                        width: 75.0,
                                                                                                        height: 75.0,
                                                                                                        clipBehavior: Clip.antiAlias,
                                                                                                        decoration: BoxDecoration(
                                                                                                          shape: BoxShape.circle,
                                                                                                        ),
                                                                                                        child: Image.network(
                                                                                                          listViewWorkersRecord.photo!,
                                                                                                          fit: BoxFit.fill,
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                  Container(
                                                                                                    width: 245.0,
                                                                                                    height: 100.0,
                                                                                                    decoration: BoxDecoration(),
                                                                                                    child: Column(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                      children: [
                                                                                                        Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                                          child: Text(
                                                                                                            functions.firstCharUppercase(listViewWorkersRecord.fullName!).maybeHandleOverflow(
                                                                                                                  maxChars: 10,
                                                                                                                  replacement: '…',
                                                                                                                ),
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  fontFamily: 'Poppins',
                                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                  fontSize: 18.0,
                                                                                                                  fontWeight: FontWeight.normal,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                            Container(
                                                                                              width: 218.0,
                                                                                              height: 100.0,
                                                                                              decoration: BoxDecoration(
                                                                                                borderRadius: BorderRadius.circular(0.0),
                                                                                                shape: BoxShape.rectangle,
                                                                                              ),
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Container(
                                                                                                    width: 160.0,
                                                                                                    height: 40.0,
                                                                                                    decoration: BoxDecoration(
                                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                      borderRadius: BorderRadius.circular(25.0),
                                                                                                      border: Border.all(
                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                      ),
                                                                                                    ),
                                                                                                    child: Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                                      children: [
                                                                                                        Text(
                                                                                                          listViewWorkersRecord.employmentStatus == '1' ? 'Employed' : 'Unemployed',
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: 'Poppins',
                                                                                                                color: listViewWorkersRecord.employmentStatus == '1' ? Color(0xFF18EE00) : Color(0xFFFF0000),
                                                                                                                fontWeight: FontWeight.normal,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                            Container(
                                                                                              width: 179.0,
                                                                                              height: 100.0,
                                                                                              decoration: BoxDecoration(
                                                                                                borderRadius: BorderRadius.circular(0.0),
                                                                                                shape: BoxShape.rectangle,
                                                                                              ),
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Text(
                                                                                                    listViewWorkersRecord.gender!,
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Poppins',
                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                          fontSize: 18.0,
                                                                                                          fontWeight: FontWeight.normal,
                                                                                                        ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                            Container(
                                                                                              width: 152.0,
                                                                                              height: 100.0,
                                                                                              decoration: BoxDecoration(
                                                                                                borderRadius: BorderRadius.circular(0.0),
                                                                                                shape: BoxShape.rectangle,
                                                                                              ),
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                                children: [
                                                                                                  Text(
                                                                                                    listViewWorkersRecord.age!.toString(),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Poppins',
                                                                                                          fontWeight: FontWeight.normal,
                                                                                                        ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                            Container(
                                                                                              width: 207.0,
                                                                                              height: 100.0,
                                                                                              decoration: BoxDecoration(
                                                                                                borderRadius: BorderRadius.circular(0.0),
                                                                                                shape: BoxShape.rectangle,
                                                                                              ),
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Text(
                                                                                                    listViewWorkersRecord.district!.maybeHandleOverflow(
                                                                                                      maxChars: 12,
                                                                                                      replacement: '…',
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Poppins',
                                                                                                          fontWeight: FontWeight.normal,
                                                                                                        ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                            Container(
                                                                                              width: 158.5,
                                                                                              height: 100.0,
                                                                                              decoration: BoxDecoration(
                                                                                                borderRadius: BorderRadius.circular(0.0),
                                                                                                shape: BoxShape.rectangle,
                                                                                              ),
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Text(
                                                                                                    listViewWorkersRecord.state!.maybeHandleOverflow(
                                                                                                      maxChars: 9,
                                                                                                      replacement: '…',
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Poppins',
                                                                                                          fontWeight: FontWeight.normal,
                                                                                                        ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                            Container(
                                                                                              width: 194.0,
                                                                                              height: 100.0,
                                                                                              decoration: BoxDecoration(
                                                                                                borderRadius: BorderRadius.circular(0.0),
                                                                                                shape: BoxShape.rectangle,
                                                                                              ),
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Text(
                                                                                                    valueOrDefault<String>(
                                                                                                      listViewWorkersRecord.addprimary != null ? listViewWorkersRecord.skillName : 'Not available',
                                                                                                      'Not available',
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Poppins',
                                                                                                          fontWeight: FontWeight.normal,
                                                                                                        ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                            Container(
                                                                                              width: 70.0,
                                                                                              height: 100.0,
                                                                                              decoration: BoxDecoration(
                                                                                                borderRadius: BorderRadius.circular(0.0),
                                                                                                shape: BoxShape.rectangle,
                                                                                              ),
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  FlutterFlowIconButton(
                                                                                                    borderColor: Colors.transparent,
                                                                                                    borderRadius: 30.0,
                                                                                                    borderWidth: 1.0,
                                                                                                    buttonSize: 45.0,
                                                                                                    icon: Icon(
                                                                                                      Icons.arrow_forward_ios_rounded,
                                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                                      size: 25.0,
                                                                                                    ),
                                                                                                    onPressed: () async {
                                                                                                      context.pushNamed(
                                                                                                        'Workersprofile',
                                                                                                        queryParams: {
                                                                                                          'workerdetails': serializeParam(
                                                                                                            listViewWorkersRecord,
                                                                                                            ParamType.Document,
                                                                                                          ),
                                                                                                          'workers': serializeParam(
                                                                                                            listViewWorkersRecord.reference,
                                                                                                            ParamType.DocumentReference,
                                                                                                          ),
                                                                                                        }.withoutNulls,
                                                                                                        extra: <String, dynamic>{
                                                                                                          'workerdetails': listViewWorkersRecord,
                                                                                                        },
                                                                                                      );
                                                                                                    },
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                            );
                                                                          },
                                                                        ),
                                                                      if (FFAppState()
                                                                              .agesort ==
                                                                          '1')
                                                                        StreamBuilder<
                                                                            List<WorkersRecord>>(
                                                                          stream:
                                                                              queryWorkersRecord(
                                                                            queryBuilder: (workersRecord) =>
                                                                                workersRecord.orderBy('employment_status', descending: true),
                                                                          ),
                                                                          builder:
                                                                              (context, snapshot) {
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
                                                                            List<WorkersRecord>
                                                                                listViewWorkersRecordList =
                                                                                snapshot.data!;
                                                                            if (listViewWorkersRecordList.isEmpty) {
                                                                              return Container(
                                                                                width: double.infinity,
                                                                                height: 150.0,
                                                                                child: NoListWidget(
                                                                                  text: 'workers',
                                                                                ),
                                                                              );
                                                                            }
                                                                            return ListView.builder(
                                                                              padding: EdgeInsets.zero,
                                                                              shrinkWrap: true,
                                                                              scrollDirection: Axis.vertical,
                                                                              itemCount: listViewWorkersRecordList.length,
                                                                              itemBuilder: (context, listViewIndex) {
                                                                                final listViewWorkersRecord = listViewWorkersRecordList[listViewIndex];
                                                                                return Visibility(
                                                                                  visible: functions.search(_model.textController.text, listViewWorkersRecord.fullName!) ?? true,
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 2.0),
                                                                                    child: Container(
                                                                                      width: double.infinity,
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        boxShadow: [
                                                                                          BoxShadow(
                                                                                            blurRadius: 4.0,
                                                                                            color: Color(0x33000000),
                                                                                            offset: Offset(0.0, 2.0),
                                                                                          )
                                                                                        ],
                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                      ),
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.min,
                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                          children: [
                                                                                            Container(
                                                                                              width: 282.0,
                                                                                              decoration: BoxDecoration(
                                                                                                borderRadius: BorderRadius.circular(0.0),
                                                                                                shape: BoxShape.rectangle,
                                                                                              ),
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Container(
                                                                                                    width: 75.0,
                                                                                                    height: 75.0,
                                                                                                    decoration: BoxDecoration(
                                                                                                      image: DecorationImage(
                                                                                                        fit: BoxFit.cover,
                                                                                                        image: Image.asset(
                                                                                                          'assets/images/workers111.png',
                                                                                                        ).image,
                                                                                                      ),
                                                                                                      shape: BoxShape.circle,
                                                                                                      border: Border.all(
                                                                                                        color: FlutterFlowTheme.of(context).lineColor,
                                                                                                      ),
                                                                                                    ),
                                                                                                    child: Visibility(
                                                                                                      visible: listViewWorkersRecord.photo != null && listViewWorkersRecord.photo != '',
                                                                                                      child: Container(
                                                                                                        width: 75.0,
                                                                                                        height: 75.0,
                                                                                                        clipBehavior: Clip.antiAlias,
                                                                                                        decoration: BoxDecoration(
                                                                                                          shape: BoxShape.circle,
                                                                                                        ),
                                                                                                        child: Image.network(
                                                                                                          listViewWorkersRecord.photo!,
                                                                                                          fit: BoxFit.fill,
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                  Container(
                                                                                                    width: 245.0,
                                                                                                    height: 100.0,
                                                                                                    decoration: BoxDecoration(),
                                                                                                    child: Column(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                      children: [
                                                                                                        Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                                          child: Text(
                                                                                                            functions.firstCharUppercase(listViewWorkersRecord.fullName!).maybeHandleOverflow(
                                                                                                                  maxChars: 10,
                                                                                                                  replacement: '…',
                                                                                                                ),
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  fontFamily: 'Poppins',
                                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                  fontSize: 18.0,
                                                                                                                  fontWeight: FontWeight.normal,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                            Container(
                                                                                              width: 218.0,
                                                                                              height: 100.0,
                                                                                              decoration: BoxDecoration(
                                                                                                borderRadius: BorderRadius.circular(0.0),
                                                                                                shape: BoxShape.rectangle,
                                                                                              ),
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Container(
                                                                                                    width: 160.0,
                                                                                                    height: 40.0,
                                                                                                    decoration: BoxDecoration(
                                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                      borderRadius: BorderRadius.circular(25.0),
                                                                                                      border: Border.all(
                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                      ),
                                                                                                    ),
                                                                                                    child: Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                                      children: [
                                                                                                        Text(
                                                                                                          listViewWorkersRecord.employmentStatus == '1' ? 'Employed' : 'Unemployed',
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: 'Poppins',
                                                                                                                color: listViewWorkersRecord.employmentStatus == '1' ? Color(0xFF18EE00) : Color(0xFFFF0000),
                                                                                                                fontWeight: FontWeight.normal,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                            Container(
                                                                                              width: 179.0,
                                                                                              height: 100.0,
                                                                                              decoration: BoxDecoration(
                                                                                                borderRadius: BorderRadius.circular(0.0),
                                                                                                shape: BoxShape.rectangle,
                                                                                              ),
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Text(
                                                                                                    listViewWorkersRecord.gender!,
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Poppins',
                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                          fontSize: 18.0,
                                                                                                          fontWeight: FontWeight.normal,
                                                                                                        ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                            Container(
                                                                                              width: 152.0,
                                                                                              height: 100.0,
                                                                                              decoration: BoxDecoration(
                                                                                                borderRadius: BorderRadius.circular(0.0),
                                                                                                shape: BoxShape.rectangle,
                                                                                              ),
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Text(
                                                                                                    listViewWorkersRecord.age!.toString(),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Poppins',
                                                                                                          fontWeight: FontWeight.normal,
                                                                                                        ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                            Container(
                                                                                              width: 207.0,
                                                                                              height: 100.0,
                                                                                              decoration: BoxDecoration(
                                                                                                borderRadius: BorderRadius.circular(0.0),
                                                                                                shape: BoxShape.rectangle,
                                                                                              ),
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Text(
                                                                                                    listViewWorkersRecord.district!.maybeHandleOverflow(
                                                                                                      maxChars: 12,
                                                                                                      replacement: '…',
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Poppins',
                                                                                                          fontWeight: FontWeight.normal,
                                                                                                        ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                            Container(
                                                                                              width: 158.5,
                                                                                              height: 100.0,
                                                                                              decoration: BoxDecoration(
                                                                                                borderRadius: BorderRadius.circular(0.0),
                                                                                                shape: BoxShape.rectangle,
                                                                                              ),
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Text(
                                                                                                    listViewWorkersRecord.state!.maybeHandleOverflow(
                                                                                                      maxChars: 9,
                                                                                                      replacement: '…',
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Poppins',
                                                                                                          fontWeight: FontWeight.normal,
                                                                                                        ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                            Container(
                                                                                              width: 194.0,
                                                                                              height: 100.0,
                                                                                              decoration: BoxDecoration(
                                                                                                borderRadius: BorderRadius.circular(0.0),
                                                                                                shape: BoxShape.rectangle,
                                                                                              ),
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Text(
                                                                                                    listViewWorkersRecord.skillName!,
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Poppins',
                                                                                                          fontWeight: FontWeight.normal,
                                                                                                        ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                            Container(
                                                                                              width: 70.0,
                                                                                              height: 100.0,
                                                                                              decoration: BoxDecoration(
                                                                                                borderRadius: BorderRadius.circular(0.0),
                                                                                                shape: BoxShape.rectangle,
                                                                                              ),
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  FlutterFlowIconButton(
                                                                                                    borderColor: Colors.transparent,
                                                                                                    borderRadius: 30.0,
                                                                                                    borderWidth: 1.0,
                                                                                                    buttonSize: 45.0,
                                                                                                    icon: Icon(
                                                                                                      Icons.arrow_forward_ios_rounded,
                                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                                      size: 25.0,
                                                                                                    ),
                                                                                                    onPressed: () async {
                                                                                                      context.pushNamed(
                                                                                                        'Workersprofile',
                                                                                                        queryParams: {
                                                                                                          'workerdetails': serializeParam(
                                                                                                            listViewWorkersRecord,
                                                                                                            ParamType.Document,
                                                                                                          ),
                                                                                                          'workers': serializeParam(
                                                                                                            listViewWorkersRecord.reference,
                                                                                                            ParamType.DocumentReference,
                                                                                                          ),
                                                                                                        }.withoutNulls,
                                                                                                        extra: <String, dynamic>{
                                                                                                          'workerdetails': listViewWorkersRecord,
                                                                                                        },
                                                                                                      );
                                                                                                    },
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                            );
                                                                          },
                                                                        ),
                                                                      if (FFAppState()
                                                                              .agesort ==
                                                                          '2')
                                                                        StreamBuilder<
                                                                            List<WorkersRecord>>(
                                                                          stream:
                                                                              queryWorkersRecord(
                                                                            queryBuilder: (workersRecord) =>
                                                                                workersRecord.orderBy('age'),
                                                                          ),
                                                                          builder:
                                                                              (context, snapshot) {
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
                                                                            List<WorkersRecord>
                                                                                listViewWorkersRecordList =
                                                                                snapshot.data!;
                                                                            if (listViewWorkersRecordList.isEmpty) {
                                                                              return Container(
                                                                                width: double.infinity,
                                                                                height: 150.0,
                                                                                child: NoListWidget(
                                                                                  text: 'workers',
                                                                                ),
                                                                              );
                                                                            }
                                                                            return ListView.builder(
                                                                              padding: EdgeInsets.zero,
                                                                              shrinkWrap: true,
                                                                              scrollDirection: Axis.vertical,
                                                                              itemCount: listViewWorkersRecordList.length,
                                                                              itemBuilder: (context, listViewIndex) {
                                                                                final listViewWorkersRecord = listViewWorkersRecordList[listViewIndex];
                                                                                return Visibility(
                                                                                  visible: functions.search(_model.textController.text, listViewWorkersRecord.fullName!) ?? true,
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 2.0),
                                                                                    child: Container(
                                                                                      width: double.infinity,
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        boxShadow: [
                                                                                          BoxShadow(
                                                                                            blurRadius: 4.0,
                                                                                            color: Color(0x33000000),
                                                                                            offset: Offset(0.0, 2.0),
                                                                                          )
                                                                                        ],
                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                      ),
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.min,
                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                          children: [
                                                                                            Container(
                                                                                              width: 282.0,
                                                                                              decoration: BoxDecoration(
                                                                                                borderRadius: BorderRadius.circular(0.0),
                                                                                                shape: BoxShape.rectangle,
                                                                                              ),
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Container(
                                                                                                    width: 75.0,
                                                                                                    height: 75.0,
                                                                                                    decoration: BoxDecoration(
                                                                                                      image: DecorationImage(
                                                                                                        fit: BoxFit.cover,
                                                                                                        image: Image.asset(
                                                                                                          'assets/images/workers111.png',
                                                                                                        ).image,
                                                                                                      ),
                                                                                                      shape: BoxShape.circle,
                                                                                                      border: Border.all(
                                                                                                        color: FlutterFlowTheme.of(context).lineColor,
                                                                                                      ),
                                                                                                    ),
                                                                                                    child: Visibility(
                                                                                                      visible: listViewWorkersRecord.photo != null && listViewWorkersRecord.photo != '',
                                                                                                      child: Container(
                                                                                                        width: 75.0,
                                                                                                        height: 75.0,
                                                                                                        clipBehavior: Clip.antiAlias,
                                                                                                        decoration: BoxDecoration(
                                                                                                          shape: BoxShape.circle,
                                                                                                        ),
                                                                                                        child: Image.network(
                                                                                                          listViewWorkersRecord.photo!,
                                                                                                          fit: BoxFit.fill,
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                  Container(
                                                                                                    width: 245.0,
                                                                                                    height: 100.0,
                                                                                                    decoration: BoxDecoration(),
                                                                                                    child: Column(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                      children: [
                                                                                                        Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                                          child: Text(
                                                                                                            functions.firstCharUppercase(listViewWorkersRecord.fullName!).maybeHandleOverflow(
                                                                                                                  maxChars: 10,
                                                                                                                  replacement: '…',
                                                                                                                ),
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  fontFamily: 'Poppins',
                                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                  fontSize: 18.0,
                                                                                                                  fontWeight: FontWeight.normal,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                            Container(
                                                                                              width: 218.0,
                                                                                              height: 100.0,
                                                                                              decoration: BoxDecoration(
                                                                                                borderRadius: BorderRadius.circular(0.0),
                                                                                                shape: BoxShape.rectangle,
                                                                                              ),
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Container(
                                                                                                    width: 160.0,
                                                                                                    height: 40.0,
                                                                                                    decoration: BoxDecoration(
                                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                      borderRadius: BorderRadius.circular(25.0),
                                                                                                      border: Border.all(
                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                      ),
                                                                                                    ),
                                                                                                    child: Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                                      children: [
                                                                                                        Text(
                                                                                                          listViewWorkersRecord.employmentStatus == '1' ? 'Employed' : 'Unemployed',
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: 'Poppins',
                                                                                                                color: listViewWorkersRecord.employmentStatus == '1' ? Color(0xFF18EE00) : Color(0xFFFF0000),
                                                                                                                fontWeight: FontWeight.normal,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                            Container(
                                                                                              width: 179.0,
                                                                                              height: 100.0,
                                                                                              decoration: BoxDecoration(
                                                                                                borderRadius: BorderRadius.circular(0.0),
                                                                                                shape: BoxShape.rectangle,
                                                                                              ),
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Text(
                                                                                                    listViewWorkersRecord.gender!,
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Poppins',
                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                          fontSize: 18.0,
                                                                                                          fontWeight: FontWeight.normal,
                                                                                                        ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                            Container(
                                                                                              width: 152.0,
                                                                                              height: 100.0,
                                                                                              decoration: BoxDecoration(
                                                                                                borderRadius: BorderRadius.circular(0.0),
                                                                                                shape: BoxShape.rectangle,
                                                                                              ),
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Text(
                                                                                                    listViewWorkersRecord.age!.toString(),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Poppins',
                                                                                                          fontWeight: FontWeight.normal,
                                                                                                        ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                            Container(
                                                                                              width: 207.0,
                                                                                              height: 100.0,
                                                                                              decoration: BoxDecoration(
                                                                                                borderRadius: BorderRadius.circular(0.0),
                                                                                                shape: BoxShape.rectangle,
                                                                                              ),
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Text(
                                                                                                    listViewWorkersRecord.district!.maybeHandleOverflow(
                                                                                                      maxChars: 12,
                                                                                                      replacement: '…',
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Poppins',
                                                                                                          fontWeight: FontWeight.normal,
                                                                                                        ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                            Container(
                                                                                              width: 158.5,
                                                                                              height: 100.0,
                                                                                              decoration: BoxDecoration(
                                                                                                borderRadius: BorderRadius.circular(0.0),
                                                                                                shape: BoxShape.rectangle,
                                                                                              ),
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Text(
                                                                                                    listViewWorkersRecord.state!.maybeHandleOverflow(
                                                                                                      maxChars: 9,
                                                                                                      replacement: '…',
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Poppins',
                                                                                                          fontWeight: FontWeight.normal,
                                                                                                        ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                            Container(
                                                                                              width: 194.0,
                                                                                              height: 100.0,
                                                                                              decoration: BoxDecoration(
                                                                                                borderRadius: BorderRadius.circular(0.0),
                                                                                                shape: BoxShape.rectangle,
                                                                                              ),
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Text(
                                                                                                    listViewWorkersRecord.skillName!,
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Poppins',
                                                                                                          fontWeight: FontWeight.normal,
                                                                                                        ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                            Container(
                                                                                              width: 70.0,
                                                                                              height: 100.0,
                                                                                              decoration: BoxDecoration(
                                                                                                borderRadius: BorderRadius.circular(0.0),
                                                                                                shape: BoxShape.rectangle,
                                                                                              ),
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  FlutterFlowIconButton(
                                                                                                    borderColor: Colors.transparent,
                                                                                                    borderRadius: 30.0,
                                                                                                    borderWidth: 1.0,
                                                                                                    buttonSize: 45.0,
                                                                                                    icon: Icon(
                                                                                                      Icons.arrow_forward_ios_rounded,
                                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                                      size: 25.0,
                                                                                                    ),
                                                                                                    onPressed: () async {
                                                                                                      context.pushNamed(
                                                                                                        'Workersprofile',
                                                                                                        queryParams: {
                                                                                                          'workerdetails': serializeParam(
                                                                                                            listViewWorkersRecord,
                                                                                                            ParamType.Document,
                                                                                                          ),
                                                                                                          'workers': serializeParam(
                                                                                                            listViewWorkersRecord.reference,
                                                                                                            ParamType.DocumentReference,
                                                                                                          ),
                                                                                                        }.withoutNulls,
                                                                                                        extra: <String, dynamic>{
                                                                                                          'workerdetails': listViewWorkersRecord,
                                                                                                        },
                                                                                                      );
                                                                                                    },
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                            );
                                                                          },
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
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
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
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
