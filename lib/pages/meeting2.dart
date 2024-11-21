import 'package:flutter/material.dart';

class SixthRoute extends StatefulWidget {
  const SixthRoute({super.key});

  @override
  _SixthRouteState createState() => _SixthRouteState();
}

class _SixthRouteState extends State<SixthRoute> {
  final _formKey = GlobalKey<FormState>();
  final _reasonController = TextEditingController();
  final _forWhomController = TextEditingController();
  final _dateController = TextEditingController();
  final _timeController = TextEditingController();

  String _selectedPerson = 'Select Any One';

  final List<String> _people = [
    'Select Any One',
    'Student',
    'Warden',
    'Rector',
  ];

  @override
  void dispose() {
    _reasonController.dispose();
    _forWhomController.dispose();
    _dateController.dispose();
    _timeController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate() &&
        _selectedPerson != 'Select Any One') {
      final reason = _reasonController.text;
      final forWhom = _forWhomController.text;
      final date = _dateController.text;
      final time = _timeController.text;

      print('Person: $_selectedPerson');
      print('Reason: $reason');
      print('For Whom: $forWhom');
      print('Date: $date');
      print('Time: $time');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Please Fill The Form'),
      ));
    }
  }

  Future<void> _selectDate(TextEditingController controller) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(), // Prevent selecting a past date
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        controller.text = "${picked.toLocal()}".split(' ')[0];
      });
    }
  }

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
                  value: _selectedPerson,
                  decoration: InputDecoration(
                    labelText: 'Person',
                    labelStyle:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedPerson = newValue!;
                    });
                  },
                  items: _people.map<DropdownMenuItem<String>>((String value) {
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
                TextFormField(
                  controller: _forWhomController,
                  decoration: InputDecoration(
                    labelText: 'For Whom',
                    labelStyle: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter for whom';
                    }
                    return null;
                  },
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: TextFormField(
                        controller: _dateController,
                        decoration: InputDecoration(
                          labelText: 'Date',
                          labelStyle: TextStyle(fontWeight: FontWeight.bold),
                          suffixIcon: IconButton(
                            icon: Icon(Icons.calendar_today),
                            onPressed: () {
                              _selectDate(_dateController);
                            },
                          ),
                        ),
                        readOnly: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the date';
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
                        controller: _timeController,
                        decoration: InputDecoration(
                          labelText: 'Time',
                          labelStyle: TextStyle(fontWeight: FontWeight.bold),
                          suffixIcon: IconButton(
                            icon: Icon(Icons.access_time),
                            onPressed: () {
                              _selectTime(_timeController);
                            },
                          ),
                        ),
                        readOnly: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the time';
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
