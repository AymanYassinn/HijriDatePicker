library jhijri_picker;

/// A Export
export '_src/_jHijriPicker.dart';
export '_src/_jDateTimePicker.dart';
import 'package:jhijri/jHijri.dart';

enum WidgetType {
  JDialog,
  JContainer,
}

class JDateModel {
  JHijri? jhijri;
  DateTime? dateTime;
  JDateModel({this.dateTime, this.jhijri});
}
