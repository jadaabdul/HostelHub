import 'package:flutter/material.dart';
import 'db_helper.dart';

class ThirdRoute extends StatefulWidget {
  const ThirdRoute({super.key});

  @override
  _ThirdRouteState createState() => _ThirdRouteState();
}
  
class _ThirdRouteState extends State<ThirdRoute> {
  final _formKey = GlobalKey<FormState>();
  final _locationController = TextEditingController();
  final _reasonController = TextEditingController();
  final _dateFromController = TextEditingController();
  final _dateToController = TextEditingController();
  final _timeFromController = TextEditingController();
  final _timeToController = TextEditingController();

  String _selectedLeaveType = 'Select Any One';

  final List<String> _leaveTypes = [
    'Select Any One',
    'Weekend Leave',
    'Sick Leave',
    'Festival Leave',
    'Emergency Leave',
    'Occasion Leave',
    'Vacation Leave',
    'Friend-Home Leave',
    'Relative-Home Leave',
  ];
  @override
  void dispose() {
    _locationController.dispose();
    _reasonController.dispose();
    _dateFromController.dispose();
    _dateToController.dispose();
    _timeFromController.dispose();
    _timeToController.dispose();
    super.dispose();
  }
  Future<void> _getLeaveRequests() async {
  List<Map<String, dynamic>> allRequests = await DatabaseHelper().getAllRequests();
  for (var request in allRequests) {
    print(request);
  }
}
  void _submitForm() async {
  if (_formKey.currentState!.validate() && _selectedLeaveType != 'Select Any One') {
    final location = _locationController.text;
    final reason = _reasonController.text;
    final dateFrom = _dateFromController.text;
    final dateTo = _dateToController.text;
    final timeFrom = _timeFromController.text;
    final timeTo = _timeToController.text;

    Map<String, dynamic> leaveRequest = {
      'leaveType': _selectedLeaveType,
      'location': location,
      'reason': reason,
      'dateFrom': dateFrom,
      'dateTo': dateTo,
      'timeFrom': timeFrom,
      'timeTo': timeTo,
    };

    // Insert the form data into SQLite database
    await DatabaseHelper().insertLeaveRequest(leaveRequest);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Form Submitted Successfully')),
    );
  } else {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Please Fill The Form'),
    ));
  }
  _getLeaveRequests();
}
  // void _submitForm() {
  //   if (_formKey.currentState!.validate() && 
  //     _selectedLeaveType != 'Select Any One') {
  //     final location = _locationController.text;
  //     final reason = _reasonController.text;
  //     final dateFrom = _dateFromController.text;
  //     final dateTo = _dateToController.text;
  //     final timeFrom = _timeFromController.text;
  //     final timeTo = _timeToController.text;

  //     print('Leave Type: $_selectedLeaveType');
  //     print('Place: $location');
  //     print('Reason: $reason');
  //     print('Date From: $dateFrom');
  //     print('Date To: $dateTo');
  //     print('Time From: $timeFrom');
  //     print('Time To: $timeTo');
  //   }
  //   else {
  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //       content: Text('Please Fill The Form'),
  //     ));
  //   }
  // }
  // Future<void> _selectDate(TextEditingController controller) async {
  //   final DateTime? picked = await showDatePicker(
  //     context: context,
  //     initialDate: DateTime.now(),
  //     firstDate: DateTime.now(), // Prevent selecting a past date
  //     lastDate: DateTime(2101),
  //   );
  //   if (picked != null) {
  //     setState(() {
  //       controller.text = "${picked.toLocal()}".split(' ')[0];
  //     });
  //   }
  // }

  Future<void> _selectTime(TextEditingController controller) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        controller.text = picked.format(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HostelHubz"),
        backgroundColor: Color(0xffcb54df),
      ),
      drawer: Drawer(
        child: Column(children: [
          UserAccountsDrawerHeader(
            accountName: Text("Student Name"),
            accountEmail: Text("Student Contact No."),
            currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: ClipOval(
                    child: Image.network(
                        "https://as1.ftcdn.net/v2/jpg/02/89/49/22/1000_F_289492257_augSIlCtit7AQhCZQwYPF1X1XgtwwJkN.jpg"))),
          ),
          ListTile(
            title: Text("Profile"),
            leading: Icon(Icons.person),
          ),
          ListTile(
            title: Text("Notification"),
            leading: Icon(Icons.notifications_on),
          ),
          Divider(
            height: 0.1,
          ),
          ListTile(
            title: Text("Setting"),
            leading: Icon(Icons.settings),
          ),
          ListTile(
            title: Text("About"),
            leading: Icon(Icons.info),
          ),
          Divider(
            height: 0.1,
          ),
          ListTile(
            title: Text("Log Out"),
            leading: Icon(Icons.logout),
          ),
        ]),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                DropdownButtonFormField<String>(
                  value: _selectedLeaveType,
                  decoration: InputDecoration(
                    labelText: 'Leave Type',
                    labelStyle:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedLeaveType = newValue!;
                    });
                  },
                  items:
                      _leaveTypes.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: value == 'Select Any One'
                            ? TextStyle(color: Colors.grey[600])
                            : TextStyle(),
                      ),
                    );
                  }).toList(),
                ),
                TextFormField(
                  controller: _locationController,
                  decoration: InputDecoration(
                    labelText: 'Location',
                    labelStyle: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the place';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _reasonController,
                  decoration: InputDecoration(
                    labelText: 'Reason',
                    labelStyle: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the reason';
                    }
                    return null;
                  },
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: TextFormField(
                        controller: _dateFromController,
                        decoration: InputDecoration(
                          labelText: 'Date From',
                          labelStyle: TextStyle(fontWeight: FontWeight.bold),
                          suffixIcon: IconButton(
                            icon: Icon(Icons.calendar_today),
                            onPressed: () {
                              _selectDate(_dateFromController);
                            },
                          ),
                        ),
                        readOnly: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the start date';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextFormField(
                        controller: _dateToController,
                        decoration: InputDecoration(
                          labelText: 'Date To',
                          labelStyle: TextStyle(fontWeight: FontWeight.bold),
                          suffixIcon: IconButton(
                            icon: Icon(Icons.calendar_today),
                            onPressed: () {
                              _selectDate(_dateToController);
                            },
                          ),
                        ),
                        readOnly: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the end date';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: TextFormField(
                        controller: _timeFromController,
                        decoration: InputDecoration(
                          labelText: 'Time From',
                          labelStyle: TextStyle(fontWeight: FontWeight.bold),
                          suffixIcon: IconButton(
                            icon: Icon(Icons.access_time),
                            onPressed: () {
                              _selectTime(_timeFromController);
                            },
                          ),
                        ),
                        readOnly: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the start time';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextFormField(
                        controller: _timeToController,
                        decoration: InputDecoration(
                          labelText: 'Time To',
                          labelStyle: TextStyle(fontWeight: FontWeight.bold),
                          suffixIcon: IconButton(
                            icon: Icon(Icons.access_time),
                            onPressed: () {
                              _selectTime(_timeToController);
                            },
                          ),
                        ),
                        readOnly: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the end time';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _submitForm,
                  child: Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}