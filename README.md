JHijri Picker Package
-
Just An Amazing Hijri Date Picker Widget With Many Customizable Options, Easy To Use, Customise & Implement.


## Features
* Hijri Date Picker
* Easy To Use , Customise and Implement


## Converter
To Convert Date From Gregorian to Hijri and From Hijri to Gregorian
Use [JHijriConverter](https://pub.dev/packages/jhijri)

## Usage
To Use `JHijriPicker`

* JDateModel
This Model Could Be JHijri Or DateTime, One Value Not Both.
```dart
DateModel dM = JDateModel(dateTime: DateTime.now());
Or
dM = JDateModel(jhijri: JHijri.now());
```
If You Want to Use JHijri IN DateModel You Have to add [JHijriConverter](https://pub.dev/packages/jhijri) to your `pubspec.yaml`

As Dialog:
-
```dart
final val = openDialog(context);
Future<HijriDate?> openDialog(BuildContext context)async{
 return await showJHijriPicker(
    context: context,
    startDate: DateModel(dateTime: DateTime.parse("2005-12-24")) ,
    selectedDate: DateModel(dateTime: DateTime.now()),
    endDate: DateModel(dateTime: DateTime.parse("2030-09-20")),
    pickerMode: DatePickerMode.day,
    theme: Theme.of(context),
    textDirection: TextDirection.rtl,
    //locale: const Locale("ar", "SA"),
    okButton: "حفظ",
    cancelButton: "عودة",
    onChange: (val) {
      debugPrint(val.toString());
    },
    onOk: (value) {
      debugPrint(value.toMap().toString());
      Navigator.pop(context);
    },
    onCancel: () {
      Navigator.pop(context);
    },
    primaryColor: Colors.blue,
    calendarTextColor: Colors.white,
    backgroundColor: Colors.black,
    borderRadius: const Radius.circular(10),
    buttonTextColor: Colors.white,
    headerTitle: const Center(
      child: Text("التقويم الهجري"),
    ),
  );
}
```
As Widget:
-
```dart
  class Ex extends StatelessWidget {
  const Ex({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return JHijriPicker(
      widgetType: WidgetType.JContainer,
      buttons: const SizedBox(),
      primaryColor: Colors.blue,
      calendarTextColor: Colors.white,
      backgroundColor: Colors.black,
      borderRadius: const Radius.circular(10),
      headerTitle: const Center(
        child: Text("التقويم الهجري"),
      ),
      startDate: JDateModel(jhijri:JHijri(
        fYear: 1442,
        fMonth: 12,
        fDay: 10,
      )),
      selectedDate: JDateModel(jhijri:JHijri.now()),
      endDate: JDateModel(jhijri:JHijri(
        fDay: 25,
        fMonth: 1,
        fYear: 1460,
      )),
      pickerMode: DatePickerMode.day,
      themeD: Theme.of(context),
      textDirection: TextDirection.rtl,
      onChange: (val) {
        debugPrint(val.toString());
      },
    );
  }
}
```

## Additional information

Provided By [Just Codes Developers](https://jucodes.com/)
