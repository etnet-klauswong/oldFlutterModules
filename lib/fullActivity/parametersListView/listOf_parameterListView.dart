import 'package:flutter/material.dart';
import 'package:fluttercompletelibrary/fullActivity/parametersListView/BB_ParameterWidget.dart';
import 'package:fluttercompletelibrary/fullActivity/parametersListView/DMI_ParameterWidget.dart';
import 'package:fluttercompletelibrary/fullActivity/parametersListView/EMA_ParameterWidget.dart';
import 'package:fluttercompletelibrary/fullActivity/parametersListView/MACD_ParameterWidget.dart';
import 'package:fluttercompletelibrary/fullActivity/parametersListView/OBV_ParameterWidget.dart';
import 'package:fluttercompletelibrary/fullActivity/parametersListView/ROC_ParameterWidget.dart';
import 'package:fluttercompletelibrary/fullActivity/parametersListView/RSI_ParameterWidget.dart';
import 'package:fluttercompletelibrary/fullActivity/parametersListView/SAR_ParameterWidget.dart';
import 'package:fluttercompletelibrary/fullActivity/parametersListView/SMA_ParameterWidget.dart';
import 'package:fluttercompletelibrary/fullActivity/parametersListView/STC-Fast_ParameterWidget.dart';
import 'package:fluttercompletelibrary/fullActivity/parametersListView/STC-Slow_ParameterWidget.dart';
import 'package:fluttercompletelibrary/fullActivity/parametersListView/VOL_ParameterWidget.dart';
import 'package:fluttercompletelibrary/fullActivity/parametersListView/WILL%20%25R_ParameterWidget.dart';
import 'package:fluttercompletelibrary/fullActivity/parametersListView/WMA_ParameterWidget.dart';

List<Widget> listOf_parameterListView = [
  SMA_ParameterWidget(),
  EMA_ParameterWidget(),
  WBA_ParameterWidget(),
  BB_ParameterWidget(),
  SAR_ParameterWidget(),
  DMI_ParameterWidget(),
  MACD_ParameterWidget(),
  OBV_ParameterWidget(),
  ROC_ParameterWidget(),
  RSI_ParameterWidget(),
  STC_Fast_ParameterWidget(),
  STC_Slow_ParameterWidget(),
  VOL_ParameterWidget(),
  WILL_R_ParameterWidget(),
];
