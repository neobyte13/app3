import 'package:GberaaDelivery/models/ditem_model.dart';
import 'package:GberaaDelivery/services/firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class DitemProvider with ChangeNotifier {
  final api = FirestoreService();
  String _id;
  String _pickup;
  String _delivery;
  String _name;
  String _phone;
  DateTime _date;
  String _notes;
  var uuid = Uuid();

  //Getters
  String get pickup => _pickup;
  String get delivery => _delivery;
  String get name => _name;
  String get phone => _phone;
  DateTime get date => _date;
  String get notes => _notes;
  Stream<List<Ditem>> get ditems => api.getDitems();

  //Setters
  set changePickup(String pickup) {
    _pickup = pickup;
    notifyListeners();
  }

  set changeDelivery(String delivery) {
    _delivery = delivery;
    notifyListeners();
  }

  set changeName(String name) {
    _name = name;
    notifyListeners();
  }

  set changePhone(String phone) {
    _phone = phone;
    notifyListeners();
  }

  set changeDate(DateTime date) {
    _date = date;
    notifyListeners();
  }

  set changeNotes(String notes) {
    _notes = notes;
    notifyListeners();
  }

  //Functions
  loadAll(Ditem ditem) {
    if (ditem != null) {
      _id = ditem.id;
      _pickup = ditem.pickup;
      _delivery = ditem.delivery;
      _name = ditem.name;
      _phone = ditem.phone;
      _date = DateTime.parse(ditem.date);
      _notes = ditem.notes;
    } else {
      _id = null;
      _pickup = null;
      _delivery = null;
      _name = null;
      _phone = null;
      _date = DateTime.now();
      _notes = null;
    }
  }

  saveDitem() {
    if (_id == null) {
      //New
      var newDitem = Ditem(
          id: uuid.v1(),
          pickup: _pickup,
          delivery: _delivery,
          name: _name,
          phone: _phone,
          date: _date.toIso8601String(),
          notes: _notes);
      api.setDitem(newDitem);
    } else {
      //Update
      var updatedDitem = Ditem(
          id: _id,
          pickup: _pickup,
          delivery: _delivery,
          name: _name,
          phone: _phone,
          date: _date.toIso8601String(),
          notes: _notes);
      api.setDitem(updatedDitem);
    }
  }

  removeDitem(String id) {
    api.deleteDitem(id);
  }
}
