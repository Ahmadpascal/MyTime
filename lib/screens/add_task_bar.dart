import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mytime/widgets/input_field.dart';
import 'package:mytime/widgets/theme.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({super.key});

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  DateTime _selectedDate = DateTime.now();
  String _startTime = DateFormat("hh:mm a").format(DateTime.now()).toString();
  String _endTime = "09.30 PM";
  int selectedRemind = 5;
  List<int> remindList = [5, 10, 15, 20];

  String selectedRepeat = "None";
  List<String> repeatList = ["None", "Daily", "Weekly", "Monthly"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Add Task",
                style: headingStyle,
              ),
              const MyInputField(
                title: "Title",
                hint: "Enter title here",
                // controller: title
              ),
              const MyInputField(
                title: "Note",
                hint: "Enter note here",
                // controller: title
              ),
              MyInputField(
                title: "Note",
                hint: DateFormat.yMd().format(_selectedDate),
                widget: IconButton(
                    onPressed: () {
                      _getDateFromUser();
                    },
                    icon: const Icon(Icons.calendar_today_outlined,
                        color: Colors.grey)),
                // controller: title
              ),
              Row(
                children: [
                  Expanded(
                      child: MyInputField(
                    title: "Start Date",
                    hint: _startTime,
                    widget: IconButton(
                        onPressed: () {
                          _getTimeFromUser(isStartTime: true);
                        },
                        icon: const Icon(
                          Icons.access_time_rounded,
                          color: Colors.grey,
                        )),
                  )),
                  const SizedBox(width: 12),
                  Expanded(
                      child: MyInputField(
                    title: "End Date",
                    hint: _endTime,
                    widget: IconButton(
                        onPressed: () {
                          _getTimeFromUser(isStartTime: false);
                        },
                        icon: const Icon(
                          Icons.access_time_rounded,
                          color: Colors.grey,
                        )),
                  ))
                ],
              ),
              MyInputField(
                title: "Remind",
                hint: "$selectedRemind minutes early",
                widget: DropdownButton(
                  icon:
                      const Icon(Icons.keyboard_arrow_down, color: Colors.grey),
                  iconSize: 32,
                  elevation: 4,
                  style: subTitleStyle,
                  underline: Container(width: 0),
                  items: remindList.map<DropdownMenuItem<String>>((int value) {
                    return DropdownMenuItem<String>(
                      value: value.toString(),
                      child: Text(value.toString()),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedRemind = int.parse(newValue!);
                    });
                  },
                ),
              ),
              MyInputField(
                title: "Repeat",
                hint: selectedRepeat,
                widget: DropdownButton(
                  icon:
                      const Icon(Icons.keyboard_arrow_down, color: Colors.grey),
                  iconSize: 32,
                  elevation: 4,
                  style: subTitleStyle,
                  underline: Container(width: 0),
                  items: repeatList.map<DropdownMenuItem<String>>((String? value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value!, style: const TextStyle(color: Colors.grey)),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedRepeat = newValue!;
                    });
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _appBar() {
    return AppBar(
      actions: const [
        Icon(
          Icons.person,
          size: 25,
        ),
        SizedBox(
          width: 20,
        ),
      ],
    );
  }

  _getDateFromUser() async {
    DateTime? pickerDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2023),
        lastDate: DateTime(2424));

    if (pickerDate != null) {
      setState(() {
        _selectedDate = pickerDate;
      });
    } else {
      print("wrong");
    }
  }

  _getTimeFromUser({required bool isStartTime}) async {
    var pickedTime = await _showTimePicker();
    String formatedTime = pickedTime.format(context);
    if (pickedTime == null) {
      print("time canceled");
    } else if (isStartTime == true) {
      setState(() {
        _startTime = formatedTime;
      });
    } else if (isStartTime == false) {
      setState(() {
        _endTime = formatedTime;
      });
    }
  }

  _showTimePicker() {
    return showTimePicker(
        initialEntryMode: TimePickerEntryMode.input,
        context: context,
        initialTime: TimeOfDay(
            hour: int.parse(_startTime.split(":")[0]),
            minute: int.parse(_startTime.split(":")[1].split(" ")[0])));
  }
}
