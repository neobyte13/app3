import 'package:flutter/material.dart';

class Ditem {
  final String id;
  final String pickup;
  final String delivery;
  final String name;
  final String phone;
  final String date;
  final String notes;

  Ditem(
      {this.name,
      this.phone,
      @required this.id,
      this.pickup,
      this.delivery,
      this.date,
      this.notes});

  factory Ditem.fromJson(Map<String, dynamic> json) {
    return Ditem(
      id: json['id'],
      pickup: json['pickup'],
      delivery: json['delivery'],
      name: json['name'],
      phone: json['phone'],
      date: json['date'],
      notes: json['notes'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'pickup': pickup,
      'delivery': delivery,
      'name': name,
      'phone': phone,
      'date': date,
      'notes': notes,
    };
  }
}
