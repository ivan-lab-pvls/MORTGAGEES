import 'dart:convert';

import 'package:mortgage/modles/mortgage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MortgagesChangeNotifier extends ChangeNotifier {
  MortgagesChangeNotifier(this._sh);

  final SharedPreferences _sh;

  final List<Mortgage> loans = [];

  void initMortgagesChangeNotifier() {
    final encodedJsons = _sh.getString('cachedLoans');

    if (encodedJsons == null) return;

    final decodedJsons = jsonDecode(encodedJsons) as List<dynamic>;

    final cachedIncomes =
        decodedJsons.map((e) => Mortgage.fromJson(e)).toList();
    loans.addAll(cachedIncomes);
    notifyListeners();
  }

  void deleteMortgage(Mortgage mortgage) {
    loans.remove(mortgage);
    notifyListeners();
    _cacheMortgages();
  }

  void addMortgage(Mortgage mortgage) {
    loans.add(mortgage);
    notifyListeners();
    _cacheMortgages();
  }

  void _cacheMortgages() {
    final jsons = loans.map((e) => e.toJson()).toList();
    final encodedJsons = jsonEncode(jsons);
    _sh.setString('cachedLoans', encodedJsons);
  }

  void editMortgage(Mortgage oldMortgage, Mortgage edittedMortgage) {
    final index = loans.indexOf(oldMortgage);
    loans.removeAt(index);
    loans.insert(index, edittedMortgage);
    notifyListeners();
    _cacheMortgages();
  }
}
