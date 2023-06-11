import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:community_app/Screens/bottom_navigation_page/dashboard_page/dashboard_grid_pages/event_page/event_details_screen.dart';
import 'package:community_app/models/event_model.dart';
import 'package:community_app/utils/color_const.dart';
import 'package:community_app/utils/image_const.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rxdart/rxdart.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../../../../components/app_bar_const.dart';
import '../../../../../components/text_const.dart';
import '../../../../../utils/app_url.dart';
import '../../../../../utils/calendar_utils.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({Key? key}) : super(key: key);

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  String datetime =
      DateFormat(DateFormat.YEAR_MONTH_WEEKDAY_DAY).format(DateTime.now());

  final _formKey = GlobalKey<FormState>();

  TextEditingController eventName = TextEditingController();
  TextEditingController eventDescription = TextEditingController();

  int selectTextField = -1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectedDay = _focusedDay;

    loadPreviousEvents();
  }

  Map<String, List> mySelectedEvents = {};

  loadPreviousEvents() {
    mySelectedEvents = {
      "2023-04-13": [
        {"eventDescp": "Annual Function", "eventTitle": "Annual 2023"},
        {"eventDescp": "Ganesh Chaturthi", "eventTitle": "Shree Ganesh"}
      ],
      "2023-04-30": [
        {"eventDescp": "Good Friday", "eventTitle": "Happy Friday"}
      ],
      "2023-04-20": [
        {"eventTitle": "Rakshabandhan", "eventDescp": "Happy Rakhi Day"}
      ]
    };
  }

  List _listOfDayEvents(DateTime dateTime) {
    if (mySelectedEvents[DateFormat('yyyy-MM-dd').format(dateTime)] != null) {
      return mySelectedEvents[DateFormat('yyyy-MM-dd').format(dateTime)]!;
    } else {
      return [];
    }
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        Future.delayed(Duration(seconds: 4), () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => EventScreen()));
        });
        return AlertDialog(
          icon: Image.asset(
            height: 80,
            width: 80,
            filterQuality: FilterQuality.high,
            AssetImageConst.submitted,
          ),
          title: TextConst(
            text: 'Event Added!',
            fontWeight: FontWeight.bold,
            fontSize: 20,
            fontFamily: 'Poppins',
            color: AppColors.appBaseColor,
          ),
        );
      },
    );
  }

  Future<EventModel?> addEvent(
      String eventName, String eventDescription) async {
    try {
      String url = AppUrl.baseUrl + AppUrl.addEventApi;
      var headers = {'Content-Type': 'application/json'};
      var request = http.Request('POST', Uri.parse(url));
      request.body = json.encode({
        "eventName": "$eventName",
        "eventDescription": "$eventDescription"
      });
      print("data pass : ${request.body}");
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        print("Response: ${response.statusCode}");
        var jsonD = jsonDecode(await response.stream.bytesToString());
        return EventModel.fromJson(jsonD);
      } else {
        print("Error");
      }
    } catch (e) {
      print("Error: " + e.toString());
    }
    return null;
  }

  final BehaviorSubject<List<EventData>> _streamBehaviour =
  BehaviorSubject<List<EventData>>();

  Stream<List<EventData>> get getStreamBehaviour => _streamBehaviour.stream;

  getDataCall() async {
    final EventModel? eventModel = await getEventApi();
    _streamBehaviour.sink.add(eventModel!.eventData!);
  }

  Future<EventModel?> getEventApi() async {
    var request =
    http.MultipartRequest('GET', Uri.parse(AppUrl.eventApi));
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var jsonD = jsonDecode(await response.stream.bytesToString());
      return EventModel.fromJson(jsonD);
      // print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  _showAddEventDialog() async {
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          'Add New Event',
          textAlign: TextAlign.center,
        ),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: eventName,
              textCapitalization: TextCapitalization.words,
              decoration: const InputDecoration(
                labelText: 'Title',
              ),
            ),
            TextField(
              controller: eventDescription,
              textCapitalization: TextCapitalization.words,
              decoration: const InputDecoration(labelText: 'Description'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            child: const Text('Add Event'),
            onPressed: () {
              if (eventName.text.isEmpty &&
                  eventDescription.text.isEmpty) {
                Fluttertoast.showToast(
                  msg: 'Required All Form Fields',
                  gravity: ToastGravity.BOTTOM,
                  toastLength: Toast.LENGTH_SHORT,
                  backgroundColor: AppColors.appBaseColor,
                  textColor: Colors.black,
                );
                return;
              } else {
                print(eventName.text);
                print(eventDescription.text);

                addEvent(eventName.text.toString(),
                    eventDescription.text.toString());

                setState(() {
                  if (mySelectedEvents[
                  DateFormat('yyyy-MM-dd').format(_selectedDay!)] !=
                      null) {
                    mySelectedEvents[
                    DateFormat('yyyy-MM-dd').format(_selectedDay!)]
                        ?.add({
                      "eventTitle": eventName.text,
                      "eventDescp": eventDescription.text,
                    });
                  } else {
                    mySelectedEvents[
                    DateFormat('yyyy-MM-dd').format(_selectedDay!)] = [
                      {
                        "eventTitle": eventName.text,
                        "eventDescp": eventDescription.text,
                      }
                    ];
                  }
                });

                print(
                    "New Event for backend developer ${json.encode(mySelectedEvents)}");
                eventName.clear();
                eventDescription.clear();
                Navigator.pop(context);
                return;
              }
            },
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: AppBarConst(
          text: 'Events',
          backgroundColor: Colors.white,
          elevation: 5,
          centerTitle: true,
          icon: Icons.arrow_back_rounded,
          iconColor: Colors.black,
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      floatingActionButton: SizedBox(
        height: 40,
        child: FittedBox(
          child: FloatingActionButton.extended(
            onPressed: () {
              _showAddEventDialog();
            },
            icon: Icon(
              Icons.add,
              color: Colors.white,
              size: 23,
            ),
            label: TextConst(
              text: 'Add Event',
              fontFamily: 'Poppins',
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
            elevation: 0,
            backgroundColor: AppColors.appBaseColor,
          ),
        ),
      ),
      body: StreamBuilder<List<EventData>>(
        stream: getStreamBehaviour,
        builder: (context, AsyncSnapshot<List<EventData>> snapshot) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.11,
                    width: MediaQuery.of(context).size.width,
                    child: Card(
                      elevation: 5,
                      shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.black.withOpacity(.3),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextConst(
                            text: "${greeting()} !",
                            fontSize: 15,
                            color: AppColors.appBaseColor,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins',
                          ),
                          Divider(
                            color: Colors.black.withOpacity(.3),
                            indent: 10,
                            endIndent: 10,
                          ),
                          TextConst(
                            text: datetime,
                            fontSize: 15,
                            color: AppColors.appBaseColor,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins',
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.40,
                    child: Card(
                      elevation: 5,
                      shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.black.withOpacity(.3),
                        ),
                      ),
                      child: TableCalendar(
                        pageAnimationEnabled: true,
                        firstDay: kFirstDay,
                        lastDay: kLastDay,
                        focusedDay: _focusedDay,
                        calendarFormat: _calendarFormat,
                        headerStyle: const HeaderStyle(
                          titleCentered: true,
                          formatButtonVisible: false,
                          titleTextStyle: TextStyle(
                            fontSize: 15,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                            color: AppColors.appBaseColor,
                          ),
                        ),
                        daysOfWeekStyle: const DaysOfWeekStyle(
                          weekendStyle: TextStyle(
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            color: AppColors.appBaseColor,
                          ),
                          weekdayStyle: TextStyle(
                            fontSize: 12,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        rowHeight: 40,
                        calendarStyle: const CalendarStyle(
                          defaultTextStyle: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 12,
                          ),
                          holidayTextStyle: TextStyle(
                            color: AppColors.appBaseColor,
                            fontFamily: 'Poppins',
                            fontSize: 12,
                          ),
                          disabledTextStyle: TextStyle(
                            fontSize: 12,
                            fontFamily: 'Poppins',
                          ),
                          isTodayHighlighted: true,
                          todayDecoration: BoxDecoration(
                            color: AppColors.appBaseColor,
                            shape: BoxShape.circle,
                          ),
                          selectedTextStyle: TextStyle(
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            color: Colors.white,
                          ),
                          todayTextStyle: TextStyle(
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            color: Colors.white,
                          ),
                          withinRangeTextStyle: TextStyle(
                            fontSize: 12,
                            fontFamily: 'Poppins',
                          ),
                          rangeEndTextStyle: TextStyle(
                            fontSize: 12,
                            fontFamily: 'Poppins',
                          ),
                          weekNumberTextStyle: TextStyle(
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            color: AppColors.appBaseColor,
                          ),
                          weekendTextStyle: TextStyle(
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            color: AppColors.appBaseColor,
                          ),
                          outsideTextStyle: TextStyle(
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            color: Colors.grey,
                          ),
                          tablePadding: EdgeInsets.only(left: 20, right: 20),
                        ),
                        selectedDayPredicate: (day) {
                          return isSameDay(_selectedDay, day);
                        },
                        onDaySelected: (selectedDay, focusedDay) {
                          if (!isSameDay(_selectedDay, selectedDay)) {
                            setState(() {
                              _selectedDay = selectedDay;
                              _focusedDay = focusedDay;
                            });
                          }
                        },
                        onFormatChanged: (format) {
                          if (_calendarFormat != format) {
                            // Call `setState()` when updating calendar format
                            setState(() {
                              _calendarFormat = format;
                            });
                          }
                        },
                        onPageChanged: (focusedDay) {
                          // No need to call `setState()` here
                          _focusedDay = focusedDay;
                        },
                        eventLoader: _listOfDayEvents,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.369,
                    width: MediaQuery.of(context).size.width,
                    child: Card(
                      elevation: 5,
                      shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.black.withOpacity(.3),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 05, left: 10, right: 10,bottom: 10),
                        child: SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: Column(
                            children: [
                              TextConst(
                                text: 'Events',
                                fontSize: 17,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Poppins',
                              ),
                              Divider(
                                color: Colors.black.withOpacity(.3),
                              ),
                              ..._listOfDayEvents(_selectedDay!).map(
                                    (myEvents) => SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: Card(
                                    elevation: 0,
                                    shape: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: Colors.black.withOpacity(.3),
                                      ),
                                    ),
                                    child: ListTile(
                                      onTap: () {
                                        Navigator.of(context).push(MaterialPageRoute(
                                            builder: (context) =>
                                            const EventDetailsScreen()));
                                      },
                                      visualDensity:
                                      VisualDensity.adaptivePlatformDensity,
                                      title: TextConst(
                                        text: '${myEvents['eventTitle']}',
                                        fontFamily: 'Poppins',
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                      subtitle: TextConst(
                                        text: '${myEvents['eventDescp']}',
                                        fontFamily: 'Poppins',
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey,
                                      ),
                                      leading: const CircleAvatar(
                                        backgroundColor: Colors.transparent,
                                        backgroundImage:
                                        AssetImage(AssetImageConst.eventImage),
                                      ),
                                      trailing: TextConst(
                                        textAlign: TextAlign.center,
                                        text: '2 Days to go',
                                        fontFamily: 'Poppins',
                                        fontSize: 11,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.appBaseColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

String greeting() {
  var hour = DateTime.now().hour;
  if (hour < 12) {
    return 'GOOD MORNING';
  }
  if (hour < 17) {
    return 'GOOD AFTERNOON';
  }
  return 'GOOD EVENING';
}
