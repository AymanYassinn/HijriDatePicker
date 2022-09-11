JHijri Picker Package
-
Just An Amazing Hijri Date Picker Widget With Many Customizable Options, Easy To Use, Customise & Implement.


## Features
* Hijri Date Picker.
* Normal Date Picker.
* Easy To Use , Customise and Implement.


## Usage
To Use `JHijriPicker`

* JDateModel

This Model Could Be JHijri Or DateTime, One Value Not Both.
```dart
DateModel dM = JDateModel(dateTime: DateTime.now());
Or
dM = JDateModel(jhijri: JHijri.now());
```
If You Want to Use JHijri IN JDateModel You Have to add [JHijriConverter](https://pub.dev/packages/jhijri) to your `pubspec.yaml`

Note:
-
If You Use `onChange` Method You Can't Use `onOk`

As Dialog:
-
```dart
final val = openDialog(context);
Future<HijriDate?> openDialog(BuildContext context)async{
 return await showJHijriPicker(
    context: context,
    startDate: JDateModel(dateTime: DateTime.parse("2005-12-24")) ,
    selectedDate: JDateModel(dateTime: DateTime.now()),
    endDate: JDateModel(dateTime: DateTime.parse("2030-09-20")),
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

To Use `JDateTimePicker`

As Dialog:
-
```dart
final val = openDialog(context);
Future<HijriDate?> openDialog(BuildContext context)async{
 return await showJHijriPicker(
   context: context,
   pickerType: PickerType.JWestern,
   startDate: JDateModel(
       jhijri: JHijri(
         fYear: 1442,
         fMonth: 12,
         fDay: 10,
       )),
   selectedDate: JDateModel(jhijri: JHijri.now()),
   endDate: JDateModel(
       jhijri: JHijri(
         fDay: 25,
         fMonth: 1,
         fYear: 1460,
       )),
   pickerMode: DatePickerMode.day,
   theme: Theme.of(context),
   textDirection: TextDirection.rtl,
   //locale: const Locale("ar", "SA"),
   okButton: "حفظ",
   cancelButton: "عودة",
   /* onChange: (val) {
                  debugPrint(val.toString());
                },*/
   onOk: (value) {
     debugPrint(value.toString());
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
     child: Text("التقويم الميلادي"),
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
    return JWesternDatePicker(
      widgetType: WidgetType.JContainer,
      buttons: const SizedBox(),
      primaryColor: Colors.blue,
      calendarTextColor: Colors.white,
      backgroundColor: Colors.black,
      borderRadius: const Radius.circular(10),
      headerTitle: const Center(
        child: Text("التقويم الميلادي"),
      ),
      startDate: JDateModel(dateTime: DateTime.parse("1984-12-24")),
      selectedDate: JDateModel(dateTime: DateTime.now()),
      endDate: JDateModel(dateTime: DateTime.parse("2030-09-20")),
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
