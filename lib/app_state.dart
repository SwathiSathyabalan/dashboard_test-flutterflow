import 'package:flutter/material.dart';
import 'backend/backend.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _CaptainsState = prefs.getString('ff_CaptainsState') ?? _CaptainsState;
    _CaptainsDistrict =
        prefs.getString('ff_CaptainsDistrict') ?? _CaptainsDistrict;
    _WorkersState = prefs.getString('ff_WorkersState') ?? _WorkersState;
    _WorkersArea = prefs.getString('ff_WorkersArea') ?? _WorkersArea;
    _WorkersDistrict =
        prefs.getString('ff_WorkersDistrict') ?? _WorkersDistrict;
    _PinCode = prefs.getInt('ff_PinCode') ?? _PinCode;
    _CaptainPin = prefs.getString('ff_CaptainPin') ?? _CaptainPin;
    _CaptainsArea = prefs.getString('ff_CaptainsArea') ?? _CaptainsArea;
    _WorkerPin = prefs.getString('ff_WorkerPin') ?? _WorkerPin;
    _CaptainReference =
        prefs.getString('ff_CaptainReference')?.ref ?? _CaptainReference;
    _WorkerReference =
        prefs.getString('ff_WorkerReference')?.ref ?? _WorkerReference;
    _OrganisationPin =
        prefs.getString('ff_OrganisationPin') ?? _OrganisationPin;
    _OrganisationArea =
        prefs.getString('ff_OrganisationArea') ?? _OrganisationArea;
    _OrganisationState =
        prefs.getString('ff_OrganisationState') ?? _OrganisationState;
    _OrganisationDistrict =
        prefs.getString('ff_OrganisationDistrict') ?? _OrganisationDistrict;
    _OrganisationRef =
        prefs.getString('ff_OrganisationRef')?.ref ?? _OrganisationRef;
    _documentReferenceID =
        prefs.getString('ff_documentReferenceID')?.ref ?? _documentReferenceID;
    _jobReferenceID =
        prefs.getString('ff_jobReferenceID')?.ref ?? _jobReferenceID;
    _workSkills = prefs.getStringList('ff_workSkills') ?? _workSkills;
    _workMonth = prefs.getStringList('ff_workMonth') ?? _workMonth;
    _workYear = prefs.getStringList('ff_workYear') ?? _workYear;
    _monthskill = prefs.getString('ff_monthskill') ?? _monthskill;
    _Yearskill = prefs.getString('ff_Yearskill') ?? _Yearskill;
    _orgpin = prefs.getString('ff_orgpin') ?? _orgpin;
    _jobpin = prefs.getString('ff_jobpin') ?? _jobpin;
    _jobarea = prefs.getString('ff_jobarea') ?? _jobarea;
    _jobdistrict = prefs.getString('ff_jobdistrict') ?? _jobdistrict;
    _jobstate = prefs.getString('ff_jobstate') ?? _jobstate;
    _randomnumbergenerator =
        prefs.getInt('ff_randomnumbergenerator') ?? _randomnumbergenerator;
    _workerphn = prefs.getString('ff_workerphn') ?? _workerphn;
    _WORKERAGE = prefs.getInt('ff_WORKERAGE') ?? _WORKERAGE;
    _captainfilter = prefs.getString('ff_captainfilter') ?? _captainfilter;
    _filled = prefs.getInt('ff_filled') ?? _filled;
    _open = prefs.getInt('ff_open') ?? _open;
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _CaptainsState = '';
  String get CaptainsState => _CaptainsState;
  set CaptainsState(String _value) {
    _CaptainsState = _value;
    prefs.setString('ff_CaptainsState', _value);
  }

  String _CaptainsDistrict = '';
  String get CaptainsDistrict => _CaptainsDistrict;
  set CaptainsDistrict(String _value) {
    _CaptainsDistrict = _value;
    prefs.setString('ff_CaptainsDistrict', _value);
  }

  String _WorkersState = '';
  String get WorkersState => _WorkersState;
  set WorkersState(String _value) {
    _WorkersState = _value;
    prefs.setString('ff_WorkersState', _value);
  }

  String _WorkersArea = '';
  String get WorkersArea => _WorkersArea;
  set WorkersArea(String _value) {
    _WorkersArea = _value;
    prefs.setString('ff_WorkersArea', _value);
  }

  String _WorkersDistrict = '';
  String get WorkersDistrict => _WorkersDistrict;
  set WorkersDistrict(String _value) {
    _WorkersDistrict = _value;
    prefs.setString('ff_WorkersDistrict', _value);
  }

  int _PinCode = 110001;
  int get PinCode => _PinCode;
  set PinCode(int _value) {
    _PinCode = _value;
    prefs.setInt('ff_PinCode', _value);
  }

  String _CaptainPin = '';
  String get CaptainPin => _CaptainPin;
  set CaptainPin(String _value) {
    _CaptainPin = _value;
    prefs.setString('ff_CaptainPin', _value);
  }

  String _CaptainsArea = '';
  String get CaptainsArea => _CaptainsArea;
  set CaptainsArea(String _value) {
    _CaptainsArea = _value;
    prefs.setString('ff_CaptainsArea', _value);
  }

  String _WorkerPin = '';
  String get WorkerPin => _WorkerPin;
  set WorkerPin(String _value) {
    _WorkerPin = _value;
    prefs.setString('ff_WorkerPin', _value);
  }

  DocumentReference? _CaptainReference;
  DocumentReference? get CaptainReference => _CaptainReference;
  set CaptainReference(DocumentReference? _value) {
    _CaptainReference = _value;
    _value != null
        ? prefs.setString('ff_CaptainReference', _value.path)
        : prefs.remove('ff_CaptainReference');
  }

  String _dashboardrecordtype = '';
  String get dashboardrecordtype => _dashboardrecordtype;
  set dashboardrecordtype(String _value) {
    _dashboardrecordtype = _value;
  }

  DocumentReference? _WorkerReference;
  DocumentReference? get WorkerReference => _WorkerReference;
  set WorkerReference(DocumentReference? _value) {
    _WorkerReference = _value;
    _value != null
        ? prefs.setString('ff_WorkerReference', _value.path)
        : prefs.remove('ff_WorkerReference');
  }

  String _OrganisationPin = '';
  String get OrganisationPin => _OrganisationPin;
  set OrganisationPin(String _value) {
    _OrganisationPin = _value;
    prefs.setString('ff_OrganisationPin', _value);
  }

  String _OrganisationArea = 'AREW';
  String get OrganisationArea => _OrganisationArea;
  set OrganisationArea(String _value) {
    _OrganisationArea = _value;
    prefs.setString('ff_OrganisationArea', _value);
  }

  String _OrganisationState = '';
  String get OrganisationState => _OrganisationState;
  set OrganisationState(String _value) {
    _OrganisationState = _value;
    prefs.setString('ff_OrganisationState', _value);
  }

  String _OrganisationDistrict = '';
  String get OrganisationDistrict => _OrganisationDistrict;
  set OrganisationDistrict(String _value) {
    _OrganisationDistrict = _value;
    prefs.setString('ff_OrganisationDistrict', _value);
  }

  bool _FoodCheck = false;
  bool get FoodCheck => _FoodCheck;
  set FoodCheck(bool _value) {
    _FoodCheck = _value;
  }

  bool _AccomodationCheck = false;
  bool get AccomodationCheck => _AccomodationCheck;
  set AccomodationCheck(bool _value) {
    _AccomodationCheck = _value;
  }

  int _PAYSCALE = 0;
  int get PAYSCALE => _PAYSCALE;
  set PAYSCALE(int _value) {
    _PAYSCALE = _value;
  }

  String _orglogo = '';
  String get orglogo => _orglogo;
  set orglogo(String _value) {
    _orglogo = _value;
  }

  DocumentReference? _OrganisationRef;
  DocumentReference? get OrganisationRef => _OrganisationRef;
  set OrganisationRef(DocumentReference? _value) {
    _OrganisationRef = _value;
    _value != null
        ? prefs.setString('ff_OrganisationRef', _value.path)
        : prefs.remove('ff_OrganisationRef');
  }

  String _sendOTP = '';
  String get sendOTP => _sendOTP;
  set sendOTP(String _value) {
    _sendOTP = _value;
  }

  String _captainphoto = '';
  String get captainphoto => _captainphoto;
  set captainphoto(String _value) {
    _captainphoto = _value;
  }

  String _scoutpicture = '';
  String get scoutpicture => _scoutpicture;
  set scoutpicture(String _value) {
    _scoutpicture = _value;
  }

  String _AddCaptain = '';
  String get AddCaptain => _AddCaptain;
  set AddCaptain(String _value) {
    _AddCaptain = _value;
  }

  String _AddScout = '';
  String get AddScout => _AddScout;
  set AddScout(String _value) {
    _AddScout = _value;
  }

  String _AddWorker = '';
  String get AddWorker => _AddWorker;
  set AddWorker(String _value) {
    _AddWorker = _value;
  }

  String _phoneNumber = '';
  String get phoneNumber => _phoneNumber;
  set phoneNumber(String _value) {
    _phoneNumber = _value;
  }

  DocumentReference? _documentReferenceID;
  DocumentReference? get documentReferenceID => _documentReferenceID;
  set documentReferenceID(DocumentReference? _value) {
    _documentReferenceID = _value;
    _value != null
        ? prefs.setString('ff_documentReferenceID', _value.path)
        : prefs.remove('ff_documentReferenceID');
  }

  DocumentReference? _jobReferenceID;
  DocumentReference? get jobReferenceID => _jobReferenceID;
  set jobReferenceID(DocumentReference? _value) {
    _jobReferenceID = _value;
    _value != null
        ? prefs.setString('ff_jobReferenceID', _value.path)
        : prefs.remove('ff_jobReferenceID');
  }

  String _editlogo = '';
  String get editlogo => _editlogo;
  set editlogo(String _value) {
    _editlogo = _value;
  }

  String _editcappic = '';
  String get editcappic => _editcappic;
  set editcappic(String _value) {
    _editcappic = _value;
  }

  String _editscoutpic = '';
  String get editscoutpic => _editscoutpic;
  set editscoutpic(String _value) {
    _editscoutpic = _value;
  }

  String _editworkerpic = '';
  String get editworkerpic => _editworkerpic;
  set editworkerpic(String _value) {
    _editworkerpic = _value;
  }

  List<String> _experiencejob = [];
  List<String> get experiencejob => _experiencejob;
  set experiencejob(List<String> _value) {
    _experiencejob = _value;
  }

  void addToExperiencejob(String _value) {
    _experiencejob.add(_value);
  }

  void removeFromExperiencejob(String _value) {
    _experiencejob.remove(_value);
  }

  void removeAtIndexFromExperiencejob(int _index) {
    _experiencejob.removeAt(_index);
  }

  List<String> _workSkills = [];
  List<String> get workSkills => _workSkills;
  set workSkills(List<String> _value) {
    _workSkills = _value;
    prefs.setStringList('ff_workSkills', _value);
  }

  void addToWorkSkills(String _value) {
    _workSkills.add(_value);
    prefs.setStringList('ff_workSkills', _workSkills);
  }

  void removeFromWorkSkills(String _value) {
    _workSkills.remove(_value);
    prefs.setStringList('ff_workSkills', _workSkills);
  }

  void removeAtIndexFromWorkSkills(int _index) {
    _workSkills.removeAt(_index);
    prefs.setStringList('ff_workSkills', _workSkills);
  }

  List<String> _workMonth = [];
  List<String> get workMonth => _workMonth;
  set workMonth(List<String> _value) {
    _workMonth = _value;
    prefs.setStringList('ff_workMonth', _value);
  }

  void addToWorkMonth(String _value) {
    _workMonth.add(_value);
    prefs.setStringList('ff_workMonth', _workMonth);
  }

  void removeFromWorkMonth(String _value) {
    _workMonth.remove(_value);
    prefs.setStringList('ff_workMonth', _workMonth);
  }

  void removeAtIndexFromWorkMonth(int _index) {
    _workMonth.removeAt(_index);
    prefs.setStringList('ff_workMonth', _workMonth);
  }

  List<String> _workYear = [];
  List<String> get workYear => _workYear;
  set workYear(List<String> _value) {
    _workYear = _value;
    prefs.setStringList('ff_workYear', _value);
  }

  void addToWorkYear(String _value) {
    _workYear.add(_value);
    prefs.setStringList('ff_workYear', _workYear);
  }

  void removeFromWorkYear(String _value) {
    _workYear.remove(_value);
    prefs.setStringList('ff_workYear', _workYear);
  }

  void removeAtIndexFromWorkYear(int _index) {
    _workYear.removeAt(_index);
    prefs.setStringList('ff_workYear', _workYear);
  }

  String _jobtitle = '';
  String get jobtitle => _jobtitle;
  set jobtitle(String _value) {
    _jobtitle = _value;
  }

  String _Skills = '';
  String get Skills => _Skills;
  set Skills(String _value) {
    _Skills = _value;
  }

  String _monthskill = '';
  String get monthskill => _monthskill;
  set monthskill(String _value) {
    _monthskill = _value;
    prefs.setString('ff_monthskill', _value);
  }

  String _Yearskill = '';
  String get Yearskill => _Yearskill;
  set Yearskill(String _value) {
    _Yearskill = _value;
    prefs.setString('ff_Yearskill', _value);
  }

  String _jobcategory = '';
  String get jobcategory => _jobcategory;
  set jobcategory(String _value) {
    _jobcategory = _value;
  }

  String _orgpin = '';
  String get orgpin => _orgpin;
  set orgpin(String _value) {
    _orgpin = _value;
    prefs.setString('ff_orgpin', _value);
  }

  String _workerpic = '';
  String get workerpic => _workerpic;
  set workerpic(String _value) {
    _workerpic = _value;
  }

  String _temp = '0';
  String get temp => _temp;
  set temp(String _value) {
    _temp = _value;
  }

  int _orgid = 0;
  int get orgid => _orgid;
  set orgid(int _value) {
    _orgid = _value;
  }

  String _skill = '';
  String get skill => _skill;
  set skill(String _value) {
    _skill = _value;
  }

  String _jobpin = '';
  String get jobpin => _jobpin;
  set jobpin(String _value) {
    _jobpin = _value;
    prefs.setString('ff_jobpin', _value);
  }

  String _jobarea = '';
  String get jobarea => _jobarea;
  set jobarea(String _value) {
    _jobarea = _value;
    prefs.setString('ff_jobarea', _value);
  }

  String _jobdistrict = '';
  String get jobdistrict => _jobdistrict;
  set jobdistrict(String _value) {
    _jobdistrict = _value;
    prefs.setString('ff_jobdistrict', _value);
  }

  String _jobstate = '';
  String get jobstate => _jobstate;
  set jobstate(String _value) {
    _jobstate = _value;
    prefs.setString('ff_jobstate', _value);
  }

  int _randomnumbergenerator = 0;
  int get randomnumbergenerator => _randomnumbergenerator;
  set randomnumbergenerator(int _value) {
    _randomnumbergenerator = _value;
    prefs.setInt('ff_randomnumbergenerator', _value);
  }

  String _jobpic = '';
  String get jobpic => _jobpic;
  set jobpic(String _value) {
    _jobpic = _value;
  }

  String _workerphn = '';
  String get workerphn => _workerphn;
  set workerphn(String _value) {
    _workerphn = _value;
    prefs.setString('ff_workerphn', _value);
  }

  String _workercaptain = '';
  String get workercaptain => _workercaptain;
  set workercaptain(String _value) {
    _workercaptain = _value;
  }

  bool _transportationcheck = false;
  bool get transportationcheck => _transportationcheck;
  set transportationcheck(bool _value) {
    _transportationcheck = _value;
  }

  bool _medicalcheck = false;
  bool get medicalcheck => _medicalcheck;
  set medicalcheck(bool _value) {
    _medicalcheck = _value;
  }

  String _pincode = '';
  String get pincode => _pincode;
  set pincode(String _value) {
    _pincode = _value;
  }

  String _editCaptain = '';
  String get editCaptain => _editCaptain;
  set editCaptain(String _value) {
    _editCaptain = _value;
  }

  String _editScout = '';
  String get editScout => _editScout;
  set editScout(String _value) {
    _editScout = _value;
  }

  String _editWorker = '';
  String get editWorker => _editWorker;
  set editWorker(String _value) {
    _editWorker = _value;
  }

  String _phonenumber = '';
  String get phonenumber => _phonenumber;
  set phonenumber(String _value) {
    _phonenumber = _value;
  }

  String _profilepic = '';
  String get profilepic => _profilepic;
  set profilepic(String _value) {
    _profilepic = _value;
  }

  String _dummy = '';
  String get dummy => _dummy;
  set dummy(String _value) {
    _dummy = _value;
  }

  String _phonenumbercaptainscout = '';
  String get phonenumbercaptainscout => _phonenumbercaptainscout;
  set phonenumbercaptainscout(String _value) {
    _phonenumbercaptainscout = _value;
  }

  List<String> _arealist = [];
  List<String> get arealist => _arealist;
  set arealist(List<String> _value) {
    _arealist = _value;
  }

  void addToArealist(String _value) {
    _arealist.add(_value);
  }

  void removeFromArealist(String _value) {
    _arealist.remove(_value);
  }

  void removeAtIndexFromArealist(int _index) {
    _arealist.removeAt(_index);
  }

  String _district = 'District';
  String get district => _district;
  set district(String _value) {
    _district = _value;
  }

  String _state = 'State';
  String get state => _state;
  set state(String _value) {
    _state = _value;
  }

  String _disabling = '';
  String get disabling => _disabling;
  set disabling(String _value) {
    _disabling = _value;
  }

  DocumentReference? _editaddress;
  DocumentReference? get editaddress => _editaddress;
  set editaddress(DocumentReference? _value) {
    _editaddress = _value;
  }

  List<String> _editorgarea = [];
  List<String> get editorgarea => _editorgarea;
  set editorgarea(List<String> _value) {
    _editorgarea = _value;
  }

  void addToEditorgarea(String _value) {
    _editorgarea.add(_value);
  }

  void removeFromEditorgarea(String _value) {
    _editorgarea.remove(_value);
  }

  void removeAtIndexFromEditorgarea(int _index) {
    _editorgarea.removeAt(_index);
  }

  String _testapi = '';
  String get testapi => _testapi;
  set testapi(String _value) {
    _testapi = _value;
  }

  DocumentReference? _captainref;
  DocumentReference? get captainref => _captainref;
  set captainref(DocumentReference? _value) {
    _captainref = _value;
  }

  String _captainname = '';
  String get captainname => _captainname;
  set captainname(String _value) {
    _captainname = _value;
  }

  DocumentReference? _editcaptainaddress;
  DocumentReference? get editcaptainaddress => _editcaptainaddress;
  set editcaptainaddress(DocumentReference? _value) {
    _editcaptainaddress = _value;
  }

  DocumentReference? _editworkeraddress;
  DocumentReference? get editworkeraddress => _editworkeraddress;
  set editworkeraddress(DocumentReference? _value) {
    _editworkeraddress = _value;
  }

  int _WORKERAGE = 0;
  int get WORKERAGE => _WORKERAGE;
  set WORKERAGE(int _value) {
    _WORKERAGE = _value;
    prefs.setInt('ff_WORKERAGE', _value);
  }

  String _jobstatusname = '';
  String get jobstatusname => _jobstatusname;
  set jobstatusname(String _value) {
    _jobstatusname = _value;
  }

  List<String> _buttonpressed = [];
  List<String> get buttonpressed => _buttonpressed;
  set buttonpressed(List<String> _value) {
    _buttonpressed = _value;
  }

  void addToButtonpressed(String _value) {
    _buttonpressed.add(_value);
  }

  void removeFromButtonpressed(String _value) {
    _buttonpressed.remove(_value);
  }

  void removeAtIndexFromButtonpressed(int _index) {
    _buttonpressed.removeAt(_index);
  }

  String _buttonclicked = '';
  String get buttonclicked => _buttonclicked;
  set buttonclicked(String _value) {
    _buttonclicked = _value;
  }

  String _test = '';
  String get test => _test;
  set test(String _value) {
    _test = _value;
  }

  bool _signinchek = false;
  bool get signinchek => _signinchek;
  set signinchek(bool _value) {
    _signinchek = _value;
  }

  String _eligibilitycheck = '';
  String get eligibilitycheck => _eligibilitycheck;
  set eligibilitycheck(String _value) {
    _eligibilitycheck = _value;
  }

  int _SAVEAGE = 0;
  int get SAVEAGE => _SAVEAGE;
  set SAVEAGE(int _value) {
    _SAVEAGE = _value;
  }

  String _pass = '';
  String get pass => _pass;
  set pass(String _value) {
    _pass = _value;
  }

  int _nextage = 0;
  int get nextage => _nextage;
  set nextage(int _value) {
    _nextage = _value;
  }

  String _promote = '';
  String get promote => _promote;
  set promote(String _value) {
    _promote = _value;
  }

  String _area = '';
  String get area => _area;
  set area(String _value) {
    _area = _value;
  }

  String _success = '';
  String get success => _success;
  set success(String _value) {
    _success = _value;
  }

  String _workerfilter = '';
  String get workerfilter => _workerfilter;
  set workerfilter(String _value) {
    _workerfilter = _value;
  }

  String _jobfilter = 'All';
  String get jobfilter => _jobfilter;
  set jobfilter(String _value) {
    _jobfilter = _value;
  }

  String _agesort = '0';
  String get agesort => _agesort;
  set agesort(String _value) {
    _agesort = _value;
  }

  String _datesort = '';
  String get datesort => _datesort;
  set datesort(String _value) {
    _datesort = _value;
  }

  List<String> _stateslist = [];
  List<String> get stateslist => _stateslist;
  set stateslist(List<String> _value) {
    _stateslist = _value;
  }

  void addToStateslist(String _value) {
    _stateslist.add(_value);
  }

  void removeFromStateslist(String _value) {
    _stateslist.remove(_value);
  }

  void removeAtIndexFromStateslist(int _index) {
    _stateslist.removeAt(_index);
  }

  double _minage = 0.0;
  double get minage => _minage;
  set minage(double _value) {
    _minage = _value;
  }

  String _captainfilter = '';
  String get captainfilter => _captainfilter;
  set captainfilter(String _value) {
    _captainfilter = _value;
    prefs.setString('ff_captainfilter', _value);
  }

  String _minimumAgeSlider = '';
  String get minimumAgeSlider => _minimumAgeSlider;
  set minimumAgeSlider(String _value) {
    _minimumAgeSlider = _value;
  }

  String _applicationStatus = '0';
  String get applicationStatus => _applicationStatus;
  set applicationStatus(String _value) {
    _applicationStatus = _value;
  }

  String _verify = '';
  String get verify => _verify;
  set verify(String _value) {
    _verify = _value;
  }

  int _filled = 0;
  int get filled => _filled;
  set filled(int _value) {
    _filled = _value;
    prefs.setInt('ff_filled', _value);
  }

  int _open = 0;
  int get open => _open;
  set open(int _value) {
    _open = _value;
    prefs.setInt('ff_open', _value);
  }

  int _filledtodisplay = 0;
  int get filledtodisplay => _filledtodisplay;
  set filledtodisplay(int _value) {
    _filledtodisplay = _value;
  }

  int _workhours = 0;
  int get workhours => _workhours;
  set workhours(int _value) {{
    _workhours = _value;
  }
  }


}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
