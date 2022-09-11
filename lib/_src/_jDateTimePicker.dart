import 'package:flutter/material.dart';
import '../jhijri_picker.dart';

Future<DateTime?> showJDateTimePicker({
  required BuildContext context,
  JDateModel? selectedDate,
  JDateModel? startDate,
  JDateModel? endDate,
  DatePickerMode pickerMode = DatePickerMode.day,
  String? okButton,
  String? cancelButton,
  Widget? headerTitle,
  Widget? buttons,
  Function(DateTime datetime)? onOk,
  Function(DateTime datetime)? onChange,
  VoidCallback? onCancel,
  ThemeData? theme,
  Color? primaryColor,
  Color? backgroundColor,
  Color? calendarTextColor,
  Color? buttonTextColor,
  Radius? borderRadius,
  TextDirection? textDirection,
  Locale? locale,
}) {
  return showDialog<DateTime?>(
    context: context,
    builder: (BuildContext context) {
      return JDateTimePicker(
        startDate: startDate,
        selectedDate: selectedDate,
        endDate: endDate,
        pickerMode: pickerMode,
        themeD: theme,
        textDirection: textDirection,
        locale: locale,
        okButtonT: okButton,
        cancelButtonT: cancelButton,
        onOk: onOk,
        onCancel: onCancel,
        primaryColor: primaryColor,
        calendarTextColor: calendarTextColor,
        backgroundColor: backgroundColor,
        borderRadius: borderRadius,
        buttonTextColor: buttonTextColor,
        headerTitle: headerTitle,
        buttons: buttons,
        widgetType: WidgetType.JDialog,
        onChange: onChange,
      );
    },
  );
}

class JDateTimePicker extends StatefulWidget {
  final JDateModel? selectedDate;
  final JDateModel? startDate;
  final JDateModel? endDate;
  final DatePickerMode? pickerMode;
  final String? okButtonT;
  final String? cancelButtonT;
  final Widget? headerTitle;
  final Function(DateTime datetime)? onOk;
  final Function(DateTime datetime)? onChange;
  final VoidCallback? onCancel;
  final ThemeData? themeD;
  final Color? primaryColor;
  final Color? backgroundColor;
  final Color? calendarTextColor;
  final Color? buttonTextColor;
  final Radius? borderRadius;
  final Widget? buttons;
  final WidgetType widgetType;
  final TextDirection? textDirection;
  final Locale? locale;
  const JDateTimePicker(
      {Key? key,
      this.selectedDate,
      this.startDate,
      this.endDate,
      this.pickerMode,
      this.okButtonT,
      this.cancelButtonT,
      this.headerTitle,
      this.onOk,
      this.onChange,
      this.onCancel,
      this.themeD,
      this.primaryColor,
      this.backgroundColor,
      this.calendarTextColor,
      this.buttonTextColor,
      this.borderRadius,
      this.buttons,
      this.widgetType = WidgetType.JDialog,
      this.textDirection,
      this.locale})
      : super(key: key);

  @override
  State<JDateTimePicker> createState() => _JDateTimePickerState();
}

class _JDateTimePickerState extends State<JDateTimePicker> {
  late DateTime sel;
  late DateTime sel1;
  late DateTime sta;
  late DateTime end;
  @override
  void initState() {
    _jDa();
    super.initState();
  }

  _jDa() {
    if (widget.startDate != null) {
      if (widget.startDate!.jhijri != null) {
        sta = widget.startDate!.jhijri!.dateTime;
      } else if (widget.startDate!.dateTime != null) {
        sta = widget.startDate!.dateTime!;
      } else {
        sta = DateTime(2018);
      }
    }
    if (widget.endDate != null) {
      if (widget.endDate!.jhijri != null) {
        end = widget.endDate!.jhijri!.dateTime;
      } else if (widget.endDate!.dateTime != null) {
        end = widget.endDate!.dateTime!;
      } else {
        end = DateTime(2060);
      }
    }
    if (widget.selectedDate != null) {
      if (widget.selectedDate!.jhijri != null) {
        sel1 = widget.selectedDate!.jhijri!.dateTime;
        sel = widget.selectedDate!.jhijri!.dateTime;
      } else if (widget.selectedDate!.dateTime != null) {
        sel1 = widget.selectedDate!.dateTime!;
        sel = widget.selectedDate!.dateTime!;
      } else {
        sel1 = DateTime.now();
        sel = DateTime.now();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = widget.themeD ?? Theme.of(context);
    final media = MediaQuery.of(context);
    return _JLocalDirection(
        locale: widget.locale,
        textDirection: widget.textDirection,
        child: _WidgetType(
            widgetType: widget.widgetType,
            child: Theme(
              data: ThemeData(
                colorScheme: theme.colorScheme.copyWith(
                  primary: widget.primaryColor ?? Colors.blue,
                  surface: widget.backgroundColor ?? Colors.white,
                  onSurface: widget.calendarTextColor ?? Colors.black,
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (widget.headerTitle != null) widget.headerTitle!,
                    Container(
                      constraints:
                          BoxConstraints(maxHeight: media.size.height - 120),
                      decoration: BoxDecoration(
                        color: widget.backgroundColor ?? Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: widget.borderRadius ??
                                const Radius.circular(16),
                            topRight: widget.borderRadius ??
                                const Radius.circular(16)),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CalendarDatePicker(
                            initialDate: sel1,
                            firstDate: sta,
                            lastDate: end,
                            onDateChanged: widget.onChange != null
                                ? (dateTime) => widget.onChange!(dateTime)
                                : (dateTime) {
                                    sel = dateTime;
                                  },
                          ),
                        ],
                      ),
                    ),
                    if (widget.buttons != null) widget.buttons!,
                    if (widget.buttons == null)
                      Container(
                        decoration: BoxDecoration(
                          color: widget.backgroundColor ?? Colors.white,
                          borderRadius: BorderRadius.only(
                            bottomLeft: widget.borderRadius ??
                                const Radius.circular(16),
                            bottomRight: widget.borderRadius ??
                                const Radius.circular(16),
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
                                      widget.backgroundColor),
                                ),
                                onPressed: widget.onCancel ??
                                    () {
                                      Navigator.pop(context);
                                    },
                                child: Text(
                                  widget.cancelButtonT ?? "Cancel",
                                  style: TextStyle(
                                      color: widget.buttonTextColor ??
                                          Colors.black),
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
                                  backgroundColor: MaterialStateProperty.all(
                                      widget.backgroundColor),
                                ),
                                onPressed: widget.onOk != null
                                    ? () => widget.onOk!(sel)
                                    : () {
                                        Navigator.pop(context, sel);
                                      },
                                child: Text(
                                  widget.okButtonT ?? "Ok",
                                  style: TextStyle(
                                      color: widget.buttonTextColor ??
                                          Colors.black),
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
