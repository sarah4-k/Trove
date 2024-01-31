import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _initialSearch = prefs.getString('ff_initialSearch') ?? _initialSearch;
    });
    _safeInit(() {
      _CintialSearch = prefs.getString('ff_CintialSearch') ?? _CintialSearch;
    });
    _safeInit(() {
      _history = prefs.getStringList('ff_history') ?? _history;
    });
    _safeInit(() {
      _scores = prefs.getInt('ff_scores') ?? _scores;
    });
    _safeInit(() {
      _PintialSearch = prefs.getString('ff_PintialSearch') ?? _PintialSearch;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<dynamic> _searchresults = [];
  List<dynamic> get searchresults => _searchresults;
  set searchresults(List<dynamic> value) {
    _searchresults = value;
  }

  void addToSearchresults(dynamic value) {
    _searchresults.add(value);
  }

  void removeFromSearchresults(dynamic value) {
    _searchresults.remove(value);
  }

  void removeAtIndexFromSearchresults(int index) {
    _searchresults.removeAt(index);
  }

  void updateSearchresultsAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    _searchresults[index] = updateFn(_searchresults[index]);
  }

  void insertAtIndexInSearchresults(int index, dynamic value) {
    _searchresults.insert(index, value);
  }

  String _initialSearch = 'java progrming language';
  String get initialSearch => _initialSearch;
  set initialSearch(String value) {
    _initialSearch = value;
    prefs.setString('ff_initialSearch', value);
  }

  List<dynamic> _SearchRefinements = [];
  List<dynamic> get SearchRefinements => _SearchRefinements;
  set SearchRefinements(List<dynamic> value) {
    _SearchRefinements = value;
  }

  void addToSearchRefinements(dynamic value) {
    _SearchRefinements.add(value);
  }

  void removeFromSearchRefinements(dynamic value) {
    _SearchRefinements.remove(value);
  }

  void removeAtIndexFromSearchRefinements(int index) {
    _SearchRefinements.removeAt(index);
  }

  void updateSearchRefinementsAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    _SearchRefinements[index] = updateFn(_SearchRefinements[index]);
  }

  void insertAtIndexInSearchRefinements(int index, dynamic value) {
    _SearchRefinements.insert(index, value);
  }

  String _CintialSearch = 'cyberseacurity';
  String get CintialSearch => _CintialSearch;
  set CintialSearch(String value) {
    _CintialSearch = value;
    prefs.setString('ff_CintialSearch', value);
  }

  List<String> _history = ['search term 1', 'search term 2'];
  List<String> get history => _history;
  set history(List<String> value) {
    _history = value;
    prefs.setStringList('ff_history', value);
  }

  void addToHistory(String value) {
    _history.add(value);
    prefs.setStringList('ff_history', _history);
  }

  void removeFromHistory(String value) {
    _history.remove(value);
    prefs.setStringList('ff_history', _history);
  }

  void removeAtIndexFromHistory(int index) {
    _history.removeAt(index);
    prefs.setStringList('ff_history', _history);
  }

  void updateHistoryAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _history[index] = updateFn(_history[index]);
    prefs.setStringList('ff_history', _history);
  }

  void insertAtIndexInHistory(int index, String value) {
    _history.insert(index, value);
    prefs.setStringList('ff_history', _history);
  }

  int _CompletedQuestios = 0;
  int get CompletedQuestios => _CompletedQuestios;
  set CompletedQuestios(int value) {
    _CompletedQuestios = value;
  }

  int _Score = 0;
  int get Score => _Score;
  set Score(int value) {
    _Score = value;
  }

  int _scores = 0;
  int get scores => _scores;
  set scores(int value) {
    _scores = value;
    prefs.setInt('ff_scores', value);
  }

  int _seenQuestions = 0;
  int get seenQuestions => _seenQuestions;
  set seenQuestions(int value) {
    _seenQuestions = value;
  }

  String _PintialSearch = 'Python programing  language';
  String get PintialSearch => _PintialSearch;
  set PintialSearch(String value) {
    _PintialSearch = value;
    prefs.setString('ff_PintialSearch', value);
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

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
