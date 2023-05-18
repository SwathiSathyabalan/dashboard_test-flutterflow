import '/backend/backend.dart';
import '/components/bottombar/bottombar_widget.dart';
import '/components/headingbar/headingbar_widget.dart';
import '/components/no_list/no_list_widget.dart';
import '/components/web_nav/web_nav_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'vacancies_model.dart';
export 'vacancies_model.dart';

class VacanciesWidget extends StatefulWidget {
  const VacanciesWidget({Key? key}) : super(key: key);

  @override
  _VacanciesWidgetState createState() => _VacanciesWidgetState();
}

class _VacanciesWidgetState extends State<VacanciesWidget> {
  late VacanciesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VacanciesModel());

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
                crossAxisAlignment: CrossAxisAlignment.start,
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
                                  text: 'JOBS',
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
                                        30.0, 0.0, 20.0, 0.0),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 20.0, 0.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          20.0, 0.0, 0.0, 0.0),
                                                  child: Container(
                                                    width: 300.0,
                                                    height: 70.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
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
                                                            'Job Status :',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
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
                                                            'Active',
                                                            'Closed',
                                                            'All'
                                                          ],
                                                          onChanged:
                                                              (val) async {
                                                            setState(() => _model
                                                                    .dropDownValue =
                                                                val);
                                                            setState(() {
                                                              FFAppState()
                                                                      .jobfilter =
                                                                  valueOrDefault<
                                                                      String>(
                                                                _model
                                                                    .dropDownValue,
                                                                'All',
                                                              );
                                                            });
                                                          },
                                                          width: 160.0,
                                                          height: 50.0,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleMedium,
                                                          fillColor:
                                                              Colors.white,
                                                          elevation: 2.0,
                                                          borderColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .outlines,
                                                          borderWidth: 0.0,
                                                          borderRadius: 8.0,
                                                          margin:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      12.0,
                                                                      4.0,
                                                                      12.0,
                                                                      4.0),
                                                          hidesUnderline: true,
                                                          isSearchable: false,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 30.0, 0.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                if (FFAppState().jobfilter ==
                                                    'All')
                                                  Expanded(
                                                    child: FutureBuilder<
                                                        List<JobsRecord>>(
                                                      future:
                                                          queryJobsRecordOnce(),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 80.0,
                                                              height: 80.0,
                                                              child:
                                                                  SpinKitPulse(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .accent1Old,
                                                                size: 80.0,
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        List<JobsRecord>
                                                            wrapJobsRecordList =
                                                            snapshot.data!;
                                                        if (wrapJobsRecordList
                                                            .isEmpty) {
                                                          return Container(
                                                            width:
                                                                double.infinity,
                                                            height: 100.0,
                                                            child: NoListWidget(
                                                              text: 'vacanies',
                                                            ),
                                                          );
                                                        }
                                                        return Wrap(
                                                          spacing: 70.0,
                                                          runSpacing: 50.0,
                                                          alignment:
                                                              WrapAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              WrapCrossAlignment
                                                                  .start,
                                                          direction:
                                                              Axis.horizontal,
                                                          runAlignment:
                                                              WrapAlignment
                                                                  .spaceEvenly,
                                                          verticalDirection:
                                                              VerticalDirection
                                                                  .down,
                                                          clipBehavior:
                                                              Clip.none,
                                                          children: List.generate(
                                                              wrapJobsRecordList
                                                                  .length,
                                                              (wrapIndex) {
                                                            final wrapJobsRecord =
                                                                wrapJobsRecordList[
                                                                    wrapIndex];
                                                            return SingleChildScrollView(
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
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
                                                                      context
                                                                          .pushNamed(
                                                                        'JobDetails',
                                                                        queryParams:
                                                                            {
                                                                          'jobdetails':
                                                                              serializeParam(
                                                                            wrapJobsRecord,
                                                                            ParamType.Document,
                                                                          ),
                                                                        }.withoutNulls,
                                                                        extra: <
                                                                            String,
                                                                            dynamic>{
                                                                          'jobdetails':
                                                                              wrapJobsRecord,
                                                                        },
                                                                      );
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          618.0,
                                                                      height:
                                                                          250.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        boxShadow: [
                                                                          BoxShadow(
                                                                            blurRadius:
                                                                                4.0,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).faded,
                                                                            offset:
                                                                                Offset(0.0, 2.0),
                                                                          )
                                                                        ],
                                                                        borderRadius:
                                                                            BorderRadius.circular(12.0),
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).outlines,
                                                                          width:
                                                                              3.0,
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.min,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, -0.95),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 0.0, 0.0),
                                                                              child: Container(
                                                                                width: 200.0,
                                                                                height: 200.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).green,
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
                                                                                child: Stack(
                                                                                  children: [
                                                                                    if ((wrapJobsRecord.jobImage != null && wrapJobsRecord.jobImage != '') && (wrapJobsRecord.jobStatus == '1'))
                                                                                      ClipRRect(
                                                                                        borderRadius: BorderRadius.circular(260.0),
                                                                                        child: Image.network(
                                                                                          wrapJobsRecord.jobImage!,
                                                                                          width: 309.6,
                                                                                          height: 254.7,
                                                                                          fit: BoxFit.cover,
                                                                                        ),
                                                                                      ),
                                                                                    ClipRect(
                                                                                      child: ImageFiltered(
                                                                                        imageFilter: ImageFilter.blur(
                                                                                          sigmaX: 2.0,
                                                                                          sigmaY: 2.0,
                                                                                        ),
                                                                                        child: Visibility(
                                                                                          visible: (wrapJobsRecord.jobImage != null && wrapJobsRecord.jobImage != '') && (wrapJobsRecord.jobStatus == '2'),
                                                                                          child: ClipRRect(
                                                                                            borderRadius: BorderRadius.circular(260.0),
                                                                                            child: Image.network(
                                                                                              wrapJobsRecord.jobImage!,
                                                                                              width: 309.6,
                                                                                              height: 254.7,
                                                                                              fit: BoxFit.cover,
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
                                                                          Expanded(
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(30.0, 15.0, 0.0, 0.0),
                                                                              child: Container(
                                                                                width: 1000.0,
                                                                                height: 220.0,
                                                                                decoration: BoxDecoration(),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 5.0),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                        children: [
                                                                                          Text(
                                                                                            functions.firstCharUppercase(wrapJobsRecord.jobTitle!).maybeHandleOverflow(
                                                                                                  maxChars: 10,
                                                                                                  replacement: '…',
                                                                                                ),
                                                                                            style: FlutterFlowTheme.of(context).headlineMedium,
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                            child: Text(
                                                                                              wrapJobsRecord.jobStatus == '1' ? 'Active' : 'Closed',
                                                                                              style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                    fontFamily: 'Poppins',
                                                                                                    color: () {
                                                                                                      if (wrapJobsRecord.jobStatus == '1') {
                                                                                                        return FlutterFlowTheme.of(context).primary;
                                                                                                      } else if (wrapJobsRecord.jobStatus == '2') {
                                                                                                        return FlutterFlowTheme.of(context).exampleText;
                                                                                                      } else {
                                                                                                        return FlutterFlowTheme.of(context).secondary;
                                                                                                      }
                                                                                                    }(),
                                                                                                    fontSize: 22.0,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                        children: [
                                                                                          Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Container(
                                                                                                width: 20.0,
                                                                                                height: 20.0,
                                                                                                decoration: BoxDecoration(),
                                                                                                child: Image.asset(
                                                                                                  'assets/images/org.png',
                                                                                                  width: 100.0,
                                                                                                  height: 100.0,
                                                                                                  fit: BoxFit.cover,
                                                                                                ),
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                child: Text(
                                                                                                  functions.firstCharUppercase(wrapJobsRecord.organisationName!).maybeHandleOverflow(
                                                                                                        maxChars: 10,
                                                                                                        replacement: '…',
                                                                                                      ),
                                                                                                  style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                                        fontFamily: 'Poppins',
                                                                                                        fontSize: 20.0,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                              children: [
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                  child: Text(
                                                                                                    'Openings :',
                                                                                                    style: FlutterFlowTheme.of(context).titleMedium,
                                                                                                  ),
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                  child: Text(
                                                                                                    wrapJobsRecord.numberOfVacancies!.toString(),
                                                                                                    style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                                          fontFamily: 'Poppins',
                                                                                                          fontSize: 18.0,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                        children: [
                                                                                          Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Container(
                                                                                                width: 20.0,
                                                                                                height: 20.0,
                                                                                                decoration: BoxDecoration(),
                                                                                                child: Image.asset(
                                                                                                  'assets/images/vac.png',
                                                                                                  width: 100.0,
                                                                                                  height: 100.0,
                                                                                                  fit: BoxFit.cover,
                                                                                                ),
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                child: Text(
                                                                                                  functions.firstCharUppercase(wrapJobsRecord.jobCategory!).maybeHandleOverflow(
                                                                                                        maxChars: 10,
                                                                                                        replacement: '…',
                                                                                                      ),
                                                                                                  style: FlutterFlowTheme.of(context).headlineSmall,
                                                                                                ),
                                                                                              ),
                                                                                              Text(
                                                                                                '/${functions.firstCharUppercase(wrapJobsRecord.jobSubCateg!)}'.maybeHandleOverflow(
                                                                                                  maxChars: 5,
                                                                                                  replacement: '…',
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).headlineSmall,
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                          Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                            children: [
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                child: Text(
                                                                                                  'Filled :',
                                                                                                  style: FlutterFlowTheme.of(context).titleMedium,
                                                                                                ),
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                child: Text(
                                                                                                  '${functions.acceptedForJobs(wrapJobsRecord, 1).toString()}',
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'Poppins',
                                                                                                        fontSize: 18.0,
                                                                                                        fontWeight: FontWeight.normal,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                        children: [
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                              children: [
                                                                                                Icon(
                                                                                                  Icons.location_on_sharp,
                                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                                  size: 22.0,
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                                  child: Text(
                                                                                                    '${wrapJobsRecord.district}, ${wrapJobsRecord.state}'.maybeHandleOverflow(
                                                                                                      maxChars: 15,
                                                                                                      replacement: '…',
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).titleMedium,
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                          Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                            children: [
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                child: Text(
                                                                                                  'Applicants :',
                                                                                                  style: FlutterFlowTheme.of(context).titleMedium,
                                                                                                ),
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                child: Text(
                                                                                                  functions.applicantscount(wrapJobsRecord).toString(),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'Poppins',
                                                                                                        fontSize: 18.0,
                                                                                                        fontWeight: FontWeight.normal,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                        children: [
                                                                                          Container(
                                                                                            width: 20.0,
                                                                                            height: 20.0,
                                                                                            decoration: BoxDecoration(
                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                            ),
                                                                                            child: Image.asset(
                                                                                              'assets/images/rupee.jfif',
                                                                                              width: 100.0,
                                                                                              height: 100.0,
                                                                                              fit: BoxFit.cover,
                                                                                            ),
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                            child: Text(
                                                                                              '${wrapJobsRecord.minSalary}',
                                                                                              style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                    fontFamily: 'Poppins',
                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                            child: Text(
                                                                                              '-  ${wrapJobsRecord.maxSalary}',
                                                                                              style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                    fontFamily: 'Poppins',
                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ],
                                                                                  ),
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
                                                            );
                                                          }),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                if (FFAppState().jobfilter ==
                                                    'Active')
                                                  Expanded(
                                                    child: FutureBuilder<
                                                        List<JobsRecord>>(
                                                      future:
                                                          queryJobsRecordOnce(
                                                        queryBuilder: (jobsRecord) =>
                                                            jobsRecord.where(
                                                                'job_status',
                                                                isEqualTo:
                                                                    '1' != ''
                                                                        ? '1'
                                                                        : null),
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 80.0,
                                                              height: 80.0,
                                                              child:
                                                                  SpinKitPulse(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .accent1Old,
                                                                size: 80.0,
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        List<JobsRecord>
                                                            wrapJobsRecordList =
                                                            snapshot.data!;
                                                        if (wrapJobsRecordList
                                                            .isEmpty) {
                                                          return Center(
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              height: 100.0,
                                                              child:
                                                                  NoListWidget(
                                                                text:
                                                                    'vacanies',
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        return Wrap(
                                                          spacing: 70.0,
                                                          runSpacing: 50.0,
                                                          alignment:
                                                              WrapAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              WrapCrossAlignment
                                                                  .start,
                                                          direction:
                                                              Axis.horizontal,
                                                          runAlignment:
                                                              WrapAlignment
                                                                  .spaceEvenly,
                                                          verticalDirection:
                                                              VerticalDirection
                                                                  .down,
                                                          clipBehavior:
                                                              Clip.none,
                                                          children: List.generate(
                                                              wrapJobsRecordList
                                                                  .length,
                                                              (wrapIndex) {
                                                            final wrapJobsRecord =
                                                                wrapJobsRecordList[
                                                                    wrapIndex];
                                                            return SingleChildScrollView(
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
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
                                                                      context
                                                                          .pushNamed(
                                                                        'JobDetails',
                                                                        queryParams:
                                                                            {
                                                                          'jobdetails':
                                                                              serializeParam(
                                                                            wrapJobsRecord,
                                                                            ParamType.Document,
                                                                          ),
                                                                        }.withoutNulls,
                                                                        extra: <
                                                                            String,
                                                                            dynamic>{
                                                                          'jobdetails':
                                                                              wrapJobsRecord,
                                                                        },
                                                                      );
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          618.0,
                                                                      height:
                                                                          250.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        boxShadow: [
                                                                          BoxShadow(
                                                                            blurRadius:
                                                                                4.0,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).faded,
                                                                            offset:
                                                                                Offset(0.0, 2.0),
                                                                          )
                                                                        ],
                                                                        borderRadius:
                                                                            BorderRadius.circular(12.0),
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).outlines,
                                                                          width:
                                                                              3.0,
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.min,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, -0.95),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 0.0, 0.0),
                                                                              child: Container(
                                                                                width: 200.0,
                                                                                height: 200.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).green,
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
                                                                                child: Stack(
                                                                                  children: [
                                                                                    if ((wrapJobsRecord.jobImage != null && wrapJobsRecord.jobImage != '') && (wrapJobsRecord.jobStatus == '1'))
                                                                                      ClipRRect(
                                                                                        borderRadius: BorderRadius.circular(260.0),
                                                                                        child: Image.network(
                                                                                          wrapJobsRecord.jobImage!,
                                                                                          width: 309.6,
                                                                                          height: 254.7,
                                                                                          fit: BoxFit.cover,
                                                                                        ),
                                                                                      ),
                                                                                    ClipRect(
                                                                                      child: ImageFiltered(
                                                                                        imageFilter: ImageFilter.blur(
                                                                                          sigmaX: 2.0,
                                                                                          sigmaY: 2.0,
                                                                                        ),
                                                                                        child: Visibility(
                                                                                          visible: (wrapJobsRecord.jobImage != null && wrapJobsRecord.jobImage != '') && (wrapJobsRecord.jobStatus == '2'),
                                                                                          child: ClipRRect(
                                                                                            borderRadius: BorderRadius.circular(260.0),
                                                                                            child: Image.network(
                                                                                              wrapJobsRecord.jobImage!,
                                                                                              width: 309.6,
                                                                                              height: 254.7,
                                                                                              fit: BoxFit.cover,
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
                                                                          Expanded(
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(30.0, 15.0, 0.0, 0.0),
                                                                              child: Container(
                                                                                width: 1000.0,
                                                                                height: 220.0,
                                                                                decoration: BoxDecoration(),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 5.0),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                        children: [
                                                                                          Text(
                                                                                            functions.firstCharUppercase(wrapJobsRecord.jobTitle!).maybeHandleOverflow(maxChars: 10),
                                                                                            style: FlutterFlowTheme.of(context).headlineMedium,
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                            child: Text(
                                                                                              wrapJobsRecord.jobStatus == '1' ? 'Active' : 'Closed',
                                                                                              style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                    fontFamily: 'Poppins',
                                                                                                    color: () {
                                                                                                      if (wrapJobsRecord.jobStatus == '1') {
                                                                                                        return FlutterFlowTheme.of(context).primary;
                                                                                                      } else if (wrapJobsRecord.jobStatus == '2') {
                                                                                                        return FlutterFlowTheme.of(context).exampleText;
                                                                                                      } else {
                                                                                                        return FlutterFlowTheme.of(context).secondary;
                                                                                                      }
                                                                                                    }(),
                                                                                                    fontSize: 22.0,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                        children: [
                                                                                          Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Container(
                                                                                                width: 20.0,
                                                                                                height: 20.0,
                                                                                                decoration: BoxDecoration(),
                                                                                                child: Image.asset(
                                                                                                  'assets/images/org.png',
                                                                                                  width: 100.0,
                                                                                                  height: 100.0,
                                                                                                  fit: BoxFit.cover,
                                                                                                ),
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                child: Text(
                                                                                                  functions.firstCharUppercase(wrapJobsRecord.organisationName!).maybeHandleOverflow(
                                                                                                        maxChars: 10,
                                                                                                        replacement: '…',
                                                                                                      ),
                                                                                                  style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                                        fontFamily: 'Poppins',
                                                                                                        fontSize: 20.0,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                              children: [
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                  child: Text(
                                                                                                    'Openings :',
                                                                                                    style: FlutterFlowTheme.of(context).titleMedium,
                                                                                                  ),
                                                                                                ),
                                                                                                Text(
                                                                                                  wrapJobsRecord.numberOfVacancies!.toString(),
                                                                                                  style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                                        fontFamily: 'Poppins',
                                                                                                        fontSize: 18.0,
                                                                                                      ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                        children: [
                                                                                          Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Container(
                                                                                                width: 20.0,
                                                                                                height: 20.0,
                                                                                                decoration: BoxDecoration(),
                                                                                                child: Image.asset(
                                                                                                  'assets/images/vac.png',
                                                                                                  width: 100.0,
                                                                                                  height: 100.0,
                                                                                                  fit: BoxFit.cover,
                                                                                                ),
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                child: Text(
                                                                                                  functions.firstCharUppercase(wrapJobsRecord.jobCategory!).maybeHandleOverflow(
                                                                                                        maxChars: 10,
                                                                                                        replacement: '…',
                                                                                                      ),
                                                                                                  style: FlutterFlowTheme.of(context).headlineSmall,
                                                                                                ),
                                                                                              ),
                                                                                              Text(
                                                                                                '/${functions.firstCharUppercase(wrapJobsRecord.jobSubCateg!)}'.maybeHandleOverflow(
                                                                                                  maxChars: 5,
                                                                                                  replacement: '…',
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).headlineSmall,
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                          Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                            children: [
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                child: Text(
                                                                                                  'Filled :',
                                                                                                  style: FlutterFlowTheme.of(context).titleMedium,
                                                                                                ),
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                child: Text(
                                                                                                  '${functions.acceptedForJobs(wrapJobsRecord, 1).toString()}',
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'Poppins',
                                                                                                        fontSize: 18.0,
                                                                                                        fontWeight: FontWeight.normal,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                          children: [
                                                                                            Icon(
                                                                                              Icons.location_on_sharp,
                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                              size: 22.0,
                                                                                            ),
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                              child: Text(
                                                                                                '${wrapJobsRecord.district}, ${wrapJobsRecord.state}',
                                                                                                style: FlutterFlowTheme.of(context).titleMedium,
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                        children: [
                                                                                          Container(
                                                                                            width: 20.0,
                                                                                            height: 20.0,
                                                                                            decoration: BoxDecoration(
                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                            ),
                                                                                            child: Image.asset(
                                                                                              'assets/images/rupee.jfif',
                                                                                              width: 100.0,
                                                                                              height: 100.0,
                                                                                              fit: BoxFit.cover,
                                                                                            ),
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                            child: Text(
                                                                                              '${wrapJobsRecord.minSalary}',
                                                                                              style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                    fontFamily: 'Poppins',
                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                            child: Text(
                                                                                              '-  ${wrapJobsRecord.maxSalary}',
                                                                                              style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                    fontFamily: 'Poppins',
                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ],
                                                                                  ),
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
                                                            );
                                                          }),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                if (FFAppState().jobfilter ==
                                                    'Closed')
                                                  Expanded(
                                                    child: FutureBuilder<
                                                        List<JobsRecord>>(
                                                      future:
                                                          queryJobsRecordOnce(
                                                        queryBuilder: (jobsRecord) =>
                                                            jobsRecord.where(
                                                                'job_status',
                                                                isEqualTo:
                                                                    '2' != ''
                                                                        ? '2'
                                                                        : null),
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 80.0,
                                                              height: 80.0,
                                                              child:
                                                                  SpinKitPulse(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .accent1Old,
                                                                size: 80.0,
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        List<JobsRecord>
                                                            wrapJobsRecordList =
                                                            snapshot.data!;
                                                        if (wrapJobsRecordList
                                                            .isEmpty) {
                                                          return Center(
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              height: 100.0,
                                                              child:
                                                                  NoListWidget(
                                                                text:
                                                                    'vacanies',
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        return Wrap(
                                                          spacing: 70.0,
                                                          runSpacing: 50.0,
                                                          alignment:
                                                              WrapAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              WrapCrossAlignment
                                                                  .start,
                                                          direction:
                                                              Axis.horizontal,
                                                          runAlignment:
                                                              WrapAlignment
                                                                  .spaceEvenly,
                                                          verticalDirection:
                                                              VerticalDirection
                                                                  .down,
                                                          clipBehavior:
                                                              Clip.none,
                                                          children: List.generate(
                                                              wrapJobsRecordList
                                                                  .length,
                                                              (wrapIndex) {
                                                            final wrapJobsRecord =
                                                                wrapJobsRecordList[
                                                                    wrapIndex];
                                                            return SingleChildScrollView(
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
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
                                                                      context
                                                                          .pushNamed(
                                                                        'JobDetails',
                                                                        queryParams:
                                                                            {
                                                                          'jobdetails':
                                                                              serializeParam(
                                                                            wrapJobsRecord,
                                                                            ParamType.Document,
                                                                          ),
                                                                        }.withoutNulls,
                                                                        extra: <
                                                                            String,
                                                                            dynamic>{
                                                                          'jobdetails':
                                                                              wrapJobsRecord,
                                                                        },
                                                                      );
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          618.0,
                                                                      height:
                                                                          250.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        boxShadow: [
                                                                          BoxShadow(
                                                                            blurRadius:
                                                                                4.0,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).faded,
                                                                            offset:
                                                                                Offset(0.0, 2.0),
                                                                          )
                                                                        ],
                                                                        borderRadius:
                                                                            BorderRadius.circular(12.0),
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).outlines,
                                                                          width:
                                                                              3.0,
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.min,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, -0.95),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 0.0, 0.0),
                                                                              child: Container(
                                                                                width: 200.0,
                                                                                height: 200.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).green,
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
                                                                                child: Stack(
                                                                                  children: [
                                                                                    if ((wrapJobsRecord.jobImage != null && wrapJobsRecord.jobImage != '') && (wrapJobsRecord.jobStatus == '1'))
                                                                                      ClipRRect(
                                                                                        borderRadius: BorderRadius.circular(260.0),
                                                                                        child: Image.network(
                                                                                          wrapJobsRecord.jobImage!,
                                                                                          width: 309.6,
                                                                                          height: 254.7,
                                                                                          fit: BoxFit.cover,
                                                                                        ),
                                                                                      ),
                                                                                    ClipRect(
                                                                                      child: ImageFiltered(
                                                                                        imageFilter: ImageFilter.blur(
                                                                                          sigmaX: 2.0,
                                                                                          sigmaY: 2.0,
                                                                                        ),
                                                                                        child: Visibility(
                                                                                          visible: (wrapJobsRecord.jobImage != null && wrapJobsRecord.jobImage != '') && (wrapJobsRecord.jobStatus == '2'),
                                                                                          child: ClipRRect(
                                                                                            borderRadius: BorderRadius.circular(260.0),
                                                                                            child: Image.network(
                                                                                              wrapJobsRecord.jobImage!,
                                                                                              width: 309.6,
                                                                                              height: 254.7,
                                                                                              fit: BoxFit.cover,
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
                                                                          Expanded(
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(30.0, 15.0, 0.0, 0.0),
                                                                              child: Container(
                                                                                width: 1000.0,
                                                                                height: 220.0,
                                                                                decoration: BoxDecoration(),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 5.0),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                        children: [
                                                                                          Text(
                                                                                            functions.firstCharUppercase(wrapJobsRecord.jobTitle!),
                                                                                            style: FlutterFlowTheme.of(context).headlineMedium,
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                            child: Text(
                                                                                              wrapJobsRecord.jobStatus == '1' ? 'Active' : 'Closed',
                                                                                              style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                    fontFamily: 'Poppins',
                                                                                                    color: () {
                                                                                                      if (wrapJobsRecord.jobStatus == '1') {
                                                                                                        return FlutterFlowTheme.of(context).primary;
                                                                                                      } else if (wrapJobsRecord.jobStatus == '2') {
                                                                                                        return FlutterFlowTheme.of(context).exampleText;
                                                                                                      } else {
                                                                                                        return FlutterFlowTheme.of(context).secondary;
                                                                                                      }
                                                                                                    }(),
                                                                                                    fontSize: 22.0,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                        children: [
                                                                                          Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Container(
                                                                                                width: 20.0,
                                                                                                height: 20.0,
                                                                                                decoration: BoxDecoration(),
                                                                                                child: Image.asset(
                                                                                                  'assets/images/org.png',
                                                                                                  width: 100.0,
                                                                                                  height: 100.0,
                                                                                                  fit: BoxFit.cover,
                                                                                                ),
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                child: Text(
                                                                                                  functions.firstCharUppercase(wrapJobsRecord.organisationName!).maybeHandleOverflow(
                                                                                                        maxChars: 10,
                                                                                                        replacement: '…',
                                                                                                      ),
                                                                                                  style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                                        fontFamily: 'Poppins',
                                                                                                        fontSize: 20.0,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                              children: [
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                  child: Text(
                                                                                                    'Openings :',
                                                                                                    style: FlutterFlowTheme.of(context).titleMedium,
                                                                                                  ),
                                                                                                ),
                                                                                                Text(
                                                                                                  wrapJobsRecord.numberOfVacancies!.toString(),
                                                                                                  style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                                        fontFamily: 'Poppins',
                                                                                                        fontSize: 18.0,
                                                                                                      ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                        children: [
                                                                                          Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Container(
                                                                                                width: 20.0,
                                                                                                height: 20.0,
                                                                                                decoration: BoxDecoration(),
                                                                                                child: Image.asset(
                                                                                                  'assets/images/vac.png',
                                                                                                  width: 100.0,
                                                                                                  height: 100.0,
                                                                                                  fit: BoxFit.cover,
                                                                                                ),
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                child: Text(
                                                                                                  functions.firstCharUppercase(wrapJobsRecord.jobCategory!).maybeHandleOverflow(
                                                                                                        maxChars: 10,
                                                                                                        replacement: '…',
                                                                                                      ),
                                                                                                  style: FlutterFlowTheme.of(context).headlineSmall,
                                                                                                ),
                                                                                              ),
                                                                                              Text(
                                                                                                '/${functions.firstCharUppercase(wrapJobsRecord.jobSubCateg!)}'.maybeHandleOverflow(
                                                                                                  maxChars: 5,
                                                                                                  replacement: '…',
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).headlineSmall,
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                          Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                            children: [
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                child: Text(
                                                                                                  'Filled :',
                                                                                                  style: FlutterFlowTheme.of(context).titleMedium,
                                                                                                ),
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                child: Text(
                                                                                                  '${functions.acceptedForJobs(wrapJobsRecord, 1).toString()}',
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'Poppins',
                                                                                                        fontSize: 18.0,
                                                                                                        fontWeight: FontWeight.normal,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                          children: [
                                                                                            Icon(
                                                                                              Icons.location_on_sharp,
                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                              size: 22.0,
                                                                                            ),
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                              child: Text(
                                                                                                '${wrapJobsRecord.district}, ${wrapJobsRecord.state}',
                                                                                                style: FlutterFlowTheme.of(context).titleMedium,
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                        children: [
                                                                                          Container(
                                                                                            width: 20.0,
                                                                                            height: 20.0,
                                                                                            decoration: BoxDecoration(
                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                            ),
                                                                                            child: Image.asset(
                                                                                              'assets/images/rupee.jfif',
                                                                                              width: 100.0,
                                                                                              height: 100.0,
                                                                                              fit: BoxFit.cover,
                                                                                            ),
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                            child: Text(
                                                                                              '${wrapJobsRecord.minSalary}',
                                                                                              style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                    fontFamily: 'Poppins',
                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                            child: Text(
                                                                                              '-  ${wrapJobsRecord.maxSalary}',
                                                                                              style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                    fontFamily: 'Poppins',
                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ],
                                                                                  ),
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
                                                            );
                                                          }),
                                                        );
                                                      },
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
  }
}
