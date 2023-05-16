import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ModalClass{
  String? title;
  String? text;
  Color? backgroundcolor;
  TimeOfDay? starttime;
  TimeOfDay? endtime;
  String? selectdate;
  String? status;

  ModalClass({this.title,this.text, this.backgroundcolor, this.starttime, this.endtime, this.selectdate, this.status});
}
List<ModalClass> TodoList = [];
List<ModalClass> DoneList = [];
List<ModalClass> all_list = [];