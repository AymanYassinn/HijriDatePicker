import 'package:flutter/material.dart';
import 'package:jhijri/jHijri.dart';
import 'package:jhijri_picker/jhijri_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
              child: ListView(
            children: [
              JHijriPicker(
                widgetType: WidgetType.JContainer,
                buttons: const SizedBox(),
                primaryColor: Colors.blue,
                calendarTextColor: Colors.white,
                backgroundColor: Colors.black,
                borderRadius: const Radius.circular(10),
                headerTitle: const Center(
                  child: Text("التقويم الهجري"),
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
              ),
              const Divider(
                color: Colors.blue,
              ),
              JWesternDatePicker(
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
              ),
            ],
          ))
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "4",
            onPressed: () async {
              final dateTime = await showJHijriPicker(context: context);
              if (dateTime != null) {
                debugPrint(dateTime.toMap().toString());
              }
            },
            tooltip: 'CC',
            child: const Icon(Icons.cabin),
          ),
          FloatingActionButton(
            heroTag: "3",
            onPressed: () async {
              final dateTime = await showJHijriPicker(
                context: context,
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
                /*onChange: (val) {
                  debugPrint(val.toString());
                },*/
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
              if (dateTime != null) {
                debugPrint(dateTime.toMap().toString());
              }
            },
            tooltip: 'CC',
            child: const Icon(Icons.cabin),
          ),
          FloatingActionButton(
            heroTag: "2",
            onPressed: () async {
              final dateTime = await showJHijriPicker(
                  pickerType: PickerType.JWestern, context: context);
              if (dateTime != null) {
                debugPrint(dateTime.toString());
              }
            },
            tooltip: 'CC',
            child: const Icon(Icons.cabin_outlined),
          ),
          FloatingActionButton(
            heroTag: "1",
            onPressed: () async {
              final dateTime = await showJHijriPicker(
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
              if (dateTime != null) {
                debugPrint(dateTime.toString());
              }
            },
            tooltip: 'CC',
            child: const Icon(Icons.cabin_outlined),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
