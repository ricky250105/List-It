// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class TodoModel {
 final String docID;

  final String titleTask;
  final String description;
  final String category;
  final String dateTask;
  final String timeTask;
  final bool isDone;
  TodoModel({
    required this.docID,
    required this.titleTask,
    required this.description,
    required this.category,
    required this.dateTask,
    required this.timeTask,
    required this.isDone,
  });



  TodoModel copyWith({
    String? docID,
    String? titleTask,
    String? description,
    String? category,
    String? dateTask,
    String? timeTask,
    bool? isDone,
  }) {
    return TodoModel(
      docID: docID ?? this.docID,
      titleTask: titleTask ?? this.titleTask,
      description: description ?? this.description,
      category: category ?? this.category,
      dateTask: dateTask ?? this.dateTask,
      timeTask: timeTask ?? this.timeTask,
      isDone: isDone ?? this.isDone,
    );
  }
  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'docID': docID,
      'titleTask': titleTask,
      'description': description,
      'category': category,
      'dateTask': dateTask,
      'timeTask': timeTask,
      'isDone': isDone,
    };
  }

  factory TodoModel.fromMap(Map<String, dynamic> map) {
    return TodoModel(
      docID: map['docID'] as String,
      titleTask: map['titleTask'] as String,
      description: map['description'] as String,
      category: map['category'] as String,
      dateTask: map['dateTask'] as String,
      timeTask: map['timeTask'] as String,
      isDone: map['isDone'] as bool,
    );
  }


  @override
  bool operator ==(covariant TodoModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.docID == docID &&
      other.titleTask == titleTask &&
      other.description == description &&
      other.category == category &&
      other.dateTask == dateTask &&
      other.timeTask == timeTask &&
      other.isDone == isDone;
  }

  @override
  int get hashCode {
    return docID.hashCode ^
      titleTask.hashCode ^
      description.hashCode ^
      category.hashCode ^
      dateTask.hashCode ^
      timeTask.hashCode ^
      isDone.hashCode;
  }
}
