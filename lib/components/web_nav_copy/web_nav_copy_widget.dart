import '../../backend/backend.dart';
import '../../backend/schema/recruiters_record.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'web_nav_copy_model.dart';
export 'web_nav_copy_model.dart';

class WebNavCopyWidget extends StatefulWidget {
  const WebNavCopyWidget({
    Key? key,
    this.colour1,
    this.colour2,
    this.colour3,
    this.colour4,
    this.colour5,
    this.colour6,
    this.colour7,
  }) : super(key: key);

  final Color? colour1;
  final Color? colour2;
  final Color? colour3;
  final Color? colour4;
  final Color? colour5;
  final Color? colour6;
  final Color? colour7;

  @override
  _WebNavCopyWidgetState createState() => _WebNavCopyWidgetState();
}

class _WebNavCopyWidgetState extends State<WebNavCopyWidget> {
  late WebNavCopyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WebNavCopyModel());

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

    return StreamBuilder<List<RecruitersRecord>>(
      stream: queryRecruitersRecord(
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 80,
              height: 80,
              child: SpinKitPulse(
                color: FlutterFlowTheme
                    .of(context)
                    .accent1Old,
                size: 80,
              ),
            ),
          );
        }
        List<RecruitersRecord> mainNavCaptainsRecordList = snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final mainNavCaptainsRecord = mainNavCaptainsRecordList.isNotEmpty
            ? mainNavCaptainsRecordList.first
            : null;
        return Container(
          width: 300.0,
          height: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme
                .of(context)
                .tertiary,
            boxShadow: [
              BoxShadow(
                blurRadius: 12.0,
                color: Color(0x33000000),
                offset: Offset(0.0, 5.0),
              )
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 32.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          0.0, 16.0, 0.0, 0.0),
                      child: Image.asset(
                        'assets/images/Picture2.png',
                        width: 244.0,
                        height: 130.8,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 10.0, 16.0, 30.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    context.goNamed('Dashboard');
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: widget.colour1,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Padding(
                      padding:
                      EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 12.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Icon(
                            Icons.dashboard_rounded,
                            color: FlutterFlowTheme
                                .of(context)
                                .primaryText,
                          ),
                          Padding(
                            padding:
                            EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                            child: Text(
                              'DASHBOARD',
                              style: FlutterFlowTheme
                                  .of(context)
                                  .bodySmall
                                  .override(
                                fontFamily: 'Poppins',
                                color: FlutterFlowTheme
                                    .of(context)
                                    .primaryText,
                                fontSize: 20.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 30.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    context.goNamed('Vacancies');
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: widget.colour2,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Padding(
                      padding:
                      EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 12.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Icon(
                            Icons.receipt_rounded,
                            color: FlutterFlowTheme
                                .of(context)
                                .primaryText,
                            size: 24.0,
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 0.0, 0.0),
                              child: Text(
                                'VACANCIES',
                                style: FlutterFlowTheme
                                    .of(context)
                                    .bodySmall
                                    .override(
                                  fontFamily: 'Poppins',
                                  color:
                                  FlutterFlowTheme
                                      .of(context)
                                      .primaryText,
                                  fontSize: 20.0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 30.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    context.goNamed('OrganisationListCopy');
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: widget.colour3,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Padding(
                      padding:
                      EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 12.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Icon(
                            Icons.bar_chart_rounded,
                            color: FlutterFlowTheme
                                .of(context)
                                .primaryText,
                            size: 24.0,
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 0.0, 0.0),
                              child: Text(
                                'ORGANISATION',
                                style: FlutterFlowTheme
                                    .of(context)
                                    .bodySmall
                                    .override(
                                  fontFamily: 'Poppins',
                                  color:
                                  FlutterFlowTheme
                                      .of(context)
                                      .primaryText,
                                  fontSize: 20.0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 30.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    context.pushNamed('WorkersDashboardCopy',
                      queryParams: {
                        'capDoc': serializeParam(
                          mainNavCaptainsRecord,
                          ParamType.Document,
                        ),
                      }.withoutNulls,
                      extra: <String, dynamic>{
                        'capDoc': mainNavCaptainsRecord,
                      },
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: widget.colour4,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Padding(
                      padding:
                      EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 12.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Icon(
                            Icons.group_rounded,
                            color: FlutterFlowTheme
                                .of(context)
                                .primaryText,
                            size: 24.0,
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 0.0, 0.0),
                              child: Text(
                                'WORKERS',
                                style: FlutterFlowTheme
                                    .of(context)
                                    .bodySmall
                                    .override(
                                  fontFamily: 'Poppins',
                                  color:
                                  FlutterFlowTheme
                                      .of(context)
                                      .primaryText,
                                  fontSize: 20.0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 30.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    context.pushNamed('CaptainsDashboardCopy');
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: widget.colour5,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Padding(
                      padding:
                      EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 12.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Icon(
                            Icons.group_rounded,
                            color: FlutterFlowTheme
                                .of(context)
                                .primaryText,
                            size: 24.0,
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 0.0, 0.0),
                              child: Text(
                                'CAPTAINS',
                                style: FlutterFlowTheme
                                    .of(context)
                                    .bodySmall
                                    .override(
                                  fontFamily: 'Poppins',
                                  color:
                                  FlutterFlowTheme
                                      .of(context)
                                      .primaryText,
                                  fontSize: 20.0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 30.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    context.pushNamed('ScoutsDashboardCopy');
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: widget.colour6,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Padding(
                      padding:
                      EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 12.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Icon(
                            Icons.group_rounded,
                            color: FlutterFlowTheme
                                .of(context)
                                .primaryText,
                            size: 24.0,
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 0.0, 0.0),
                              child: Text(
                                'SCOUTS',
                                style: FlutterFlowTheme
                                    .of(context)
                                    .bodySmall
                                    .override(
                                  fontFamily: 'Poppins',
                                  color:
                                  FlutterFlowTheme
                                      .of(context)
                                      .primaryText,
                                  fontSize: 20.0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 16.0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: widget.colour7,
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 12.0, 12.0, 12.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Icon(
                                          Icons.settings,
                                          color: FlutterFlowTheme
                                              .of(context)
                                              .primaryText,
                                          size: 24.0,
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: EdgeInsetsDirectional
                                                .fromSTEB(
                                                12.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              'SETTINGS',
                                              style: FlutterFlowTheme
                                                  .of(context)
                                                  .bodySmall
                                                  .override(
                                                fontFamily: 'Poppins',
                                                color:
                                                FlutterFlowTheme
                                                    .of(context)
                                                    .primaryText,
                                                fontSize: 20.0,
                                              ),
                                            ),
                                          ),
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
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },);
  }
}
