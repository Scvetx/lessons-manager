// ignore_for_file: avoid_annotating_with_dynamic

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

/// Data type which helps to convert Timestamp to DateTime in gfreezed class
class TimestampSerializer implements JsonConverter<DateTime?, dynamic> {
  const TimestampSerializer();

  @override
  DateTime? fromJson(dynamic timestamp) => timestamp?.toDate();

  @override
  Timestamp? toJson(DateTime? date) => date == null ? 
      null : 
      Timestamp.fromDate(date);
}