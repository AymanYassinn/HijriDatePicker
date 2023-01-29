import 'package:flutter/material.dart';
import 'package:jhijri/jHijri.dart';
import '_src.dart';

enum WidgetType {
  JDialog,
  JContainer,
}

enum PickerType {
  JHijri,
  JNormal,
}

class JDateModel {
  JHijri? jhijri;
  DateTime? dateTime;
  JDateModel({this.dateTime, this.jhijri});
}

class JPickerValue {
  JHijri? _jHijri;
  DateTime? _dateTime;
  JHijri get jhijri => _jHijri ?? JHijri.now();
  DateTime get date => _dateTime ?? DateTime.now();
  JPickerValue.value(JDateModel data) {
    if (data.jhijri != null) {
      _jHijri = data.jhijri!;
      _dateTime = data.jhijri!.dateTime;
    }
    if (data.dateTime != null) {
      _dateTime = data.dateTime;
      if (data.dateTime!.year > 1938 && data.dateTime!.year < 2076) {
        _jHijri = JHijri(fDate: data.dateTime);
      }
    }
  }
  @override
  String toString() {
    return {
      "Date": date.toString(),
      "HijriDate": jhijri.toMap(),
    }.toString();
  }
}

Future<JPickerValue?> showGlobalDatePicker({
  required BuildContext context,
  PickerType pickerType = PickerType.JHijri,
  JDateModel? startDate,
  JDateModel? endDate,
  JDateModel? selectedDate,
  DatePickerMode? pickerMode,
  String? okButtonText,
  String? cancelButtonText,
  Widget? headerTitle,
  Function(JPickerValue datetime)? onOk,
  Function(JPickerValue datetime)? onChange,
  VoidCallback? onCancel,
  ThemeData? pickerTheme,
  Color? primaryColor,
  Color? backgroundColor,
  Color? calendarTextColor,
  Color? buttonTextColor,
  Color? cancelButtonColor,
  Color? okButtonColor,
  Radius? borderRadius,
  Widget? buttons,
  TextDirection? textDirection,
  Locale? locale,
  SelectableDayPredicate? selectableDayPredicate,
  JSelectableDayPredicate? jSelectableDayPredicate,
}) {
  JHijri _select = JHijri();
  JHijri _start = JHijri(fYear: 2000);
  JHijri _end = JHijri(fYear: 2060);
  JDateModel _startDate = startDate != null
      ? startDate
      : pickerType == PickerType.JHijri
          ? JDateModel(jhijri: _start)
          : JDateModel(dateTime: _start.dateTime);
  JDateModel _endDate = endDate != null
      ? endDate
      : pickerType == PickerType.JHijri
          ? JDateModel(jhijri: _end)
          : JDateModel(dateTime: _end.dateTime);
  JDateModel _selectedDate = selectedDate != null
      ? selectedDate
      : pickerType == PickerType.JHijri
          ? JDateModel(jhijri: _select)
          : JDateModel(dateTime: _select.dateTime);
  return showDialog<JPickerValue?>(
    context: context,
    builder: (BuildContext context) {
      return JGlobalDatePicker(
          pickerType: pickerType,
          selectableDayPredicate: selectableDayPredicate,
          jSelectableDayPredicate: jSelectableDayPredicate,
          locale: locale,
          textDirection: textDirection,
          buttons: buttons,
          borderRadius: borderRadius,
          okButtonText: okButtonText,
          okButtonColor: okButtonColor,
          cancelButtonText: cancelButtonText,
          cancelButtonColor: cancelButtonColor,
          calendarTextColor: calendarTextColor,
          primaryColor: primaryColor,
          pickerTheme: pickerTheme,
          pickerMode: pickerMode,
          onCancel: onCancel,
          onChange: onChange,
          onOk: onOk,
          headerTitle: headerTitle,
          backgroundColor: backgroundColor,
          buttonTextColor: buttonTextColor,
          selectedDate: _selectedDate,
          startDate: _startDate,
          endDate: _endDate);
    },
  );
}

class _JLocalDirection extends StatelessWidget {
  final TextDirection? textDirection;
  final Locale? locale;
  final Widget child;
  const _JLocalDirection(
      {Key? key, this.textDirection, this.locale, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Localizations.override(
      context: context,
      locale: locale,
      child: textDirection != null
          ? Directionality(
              textDirection: textDirection!,
              child: child,
            )
          : child,
    );
  }
}

class _WidgetType extends StatelessWidget {
  final Widget child;
  final WidgetType widgetType;
  const _WidgetType({Key? key, required this.widgetType, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (widgetType) {
      case WidgetType.JDialog:
        return Dialog(
          backgroundColor: Colors.transparent,
          alignment: Alignment.center,
          child: child,
        );
      case WidgetType.JContainer:
        return Container(
          color: Colors.transparent,
          alignment: Alignment.center,
          child: child,
        );
    }
  }
}

class JGlobalDatePicker extends StatelessWidget {
  final PickerType pickerType;
  final JDateModel? startDate;
  final JDateModel? endDate;
  final JDateModel? selectedDate;
  final DatePickerMode? pickerMode;
  final String? okButtonText;
  final String? cancelButtonText;
  final Widget? headerTitle;
  final Function(JPickerValue datetime)? onOk;
  final Function(JPickerValue datetime)? onChange;
  final VoidCallback? onCancel;
  final ThemeData? pickerTheme;
  final Color? primaryColor;
  final Color? backgroundColor;
  final Color? calendarTextColor;
  final Color? buttonTextColor;
  final Color? cancelButtonColor;
  final Color? okButtonColor;
  final Radius? borderRadius;
  final Widget? buttons;
  final WidgetType widgetType;
  final TextDirection? textDirection;
  final Locale? locale;
  final SelectableDayPredicate? selectableDayPredicate;
  final JSelectableDayPredicate? jSelectableDayPredicate;
  const JGlobalDatePicker(
      {Key? key,
      this.pickerType = PickerType.JHijri,
      this.startDate,
      this.endDate,
      this.selectedDate,
      this.pickerMode,
      this.headerTitle,
      this.onOk,
      this.onChange,
      this.onCancel,
      this.primaryColor,
      this.backgroundColor,
      this.calendarTextColor,
      this.buttonTextColor,
      this.borderRadius,
      this.buttons,
      this.widgetType = WidgetType.JDialog,
      this.textDirection,
      this.locale,
      this.cancelButtonColor,
      this.okButtonColor,
      this.selectableDayPredicate,
      this.jSelectableDayPredicate,
      this.okButtonText,
      this.cancelButtonText,
      this.pickerTheme})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = pickerTheme ?? Theme.of(context);
    final media = MediaQuery.of(context);
    JPickerValue? selected;
    return _JLocalDirection(
        locale: locale,
        textDirection: textDirection,
        child: _WidgetType(
            widgetType: widgetType,
            child: Theme(
              data: ThemeData(
                colorScheme: theme.colorScheme.copyWith(
                  primary: primaryColor ?? Colors.blue,
                  surface: backgroundColor ?? Colors.white,
                  onSurface: calendarTextColor ?? Colors.black,
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (headerTitle != null) headerTitle!,
                    Container(
                      constraints:
                          BoxConstraints(maxHeight: media.size.height - 120),
                      decoration: BoxDecoration(
                        color: backgroundColor ?? Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: borderRadius ?? const Radius.circular(16),
                            topRight:
                                borderRadius ?? const Radius.circular(16)),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (pickerType == PickerType.JHijri)
                            JCalendarDatePicker(
                              initialDate: jCheckDate(selectedDate),
                              localeCode: locale?.languageCode ?? "en",
                              firstDate: jCheckDate(startDate),
                              initialCalendarMode:
                                  pickerMode ?? DatePickerMode.day,
                              lastDate: jCheckDate(endDate),
                              selectableDayPredicate: jSelectableDayPredicate,
                              onDateChanged: onChange != null
                                  ? (dateTime) => onChange!(JPickerValue.value(
                                      JDateModel(
                                          jhijri: JHijri(
                                              fDate: dateTime.dateTime))))
                                  : (dateTime) => selected = JPickerValue.value(
                                      JDateModel(
                                          jhijri: JHijri(
                                              fDate: dateTime.dateTime))),
                            ),
                          if (pickerType == PickerType.JNormal)
                            CalendarDatePicker(
                              initialDate: checkDate(selectedDate),
                              firstDate: checkDate(startDate),
                              lastDate: checkDate(endDate),
                              initialCalendarMode:
                                  pickerMode ?? DatePickerMode.day,
                              selectableDayPredicate: selectableDayPredicate,
                              onDateChanged: onChange != null
                                  ? (dateTime) => onChange!(JPickerValue.value(
                                      JDateModel(dateTime: dateTime)))
                                  : (dateTime) => selected = JPickerValue.value(
                                      JDateModel(dateTime: dateTime)),
                            ),
                        ],
                      ),
                    ),
                    if (buttons != null) buttons!,
                    if (buttons == null)
                      Container(
                        decoration: BoxDecoration(
                          color: backgroundColor ?? Colors.white,
                          borderRadius: BorderRadius.only(
                            bottomLeft:
                                borderRadius ?? const Radius.circular(16),
                            bottomRight:
                                borderRadius ?? const Radius.circular(16),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: TextButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      cancelButtonColor),
                                ),
                                onPressed: onCancel ??
                                    () {
                                      Navigator.pop(context);
                                    },
                                child: Text(
                                  cancelButtonText ?? "Cancel",
                                  style: TextStyle(
                                      color: buttonTextColor ?? Colors.black),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                              child: VerticalDivider(
                                color: Colors.grey,
                              ),
                            ),
                            Expanded(
                              child: TextButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(okButtonColor),
                                ),
                                onPressed: onOk != null
                                    ? selected != null
                                        ? () => onOk!(selected!)
                                        : () => onOk!(JPickerValue.value(
                                            JDateModel(
                                                dateTime: DateTime.now())))
                                    : () {
                                        Navigator.pop(context, selected);
                                      },
                                child: Text(
                                  okButtonText ?? "Ok",
                                  style: TextStyle(
                                      color: buttonTextColor ?? Colors.black),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            )));
  }

  DateTime checkDate(JDateModel? da) {
    DateTime da2 = DateTime.now();
    if (da != null) {
      if (da.jhijri != null) {
        da2 = da.jhijri!.dateTime;
      } else if (da.dateTime != null) {
        da2 = da.dateTime!;
      }
    }
    return da2;
  }

  JHijri jCheckDate(JDateModel? da) {
    JHijri da2 = JHijri.now();
    if (da != null) {
      if (da.jhijri != null) {
        da2 = da.jhijri!;
      } else if (da.dateTime != null) {
        da2 = JHijri(fDate: da.dateTime);
      }
    }
    return da2;
  }
}
