import 'package:flutter/material.dart';


class EightRoute extends StatefulWidget {
  const EightRoute({super.key});

  @override
  _EightRouteState createState() => _EightRouteState();
}

class _EightRouteState extends State<EightRoute> {
  final _formKey = GlobalKey<FormState>();
  final _floorController = TextEditingController();
  final _roomNoController = TextEditingController();
  final _descriptionController = TextEditingController();

  String _selectedProblemType = 'Select Any One';
  String _selectedFloor = 'Select Floor';
  String _selectedRoomNo = 'Select Room No';

  final List<String> _problemTypes = [
    'Select Any One',
    'Electricity Issue',
    'Water Issue',
    'Furniture Issue',
  ];

  final List<String> _floors = [
    'Select Floor',
    'First Floor - Right Side',
    'First Floor - Left Side',
    'Second Floor - Right Side',
    'Second Floor - Right Side'
  ];

  final List<String> _roomNos = [
    'Select Room No',
    'F6201-F6204',
    'F6205-F6208',
    'F6209-F6212',
    'F6213-F6216',

    'F6217-F6221',
    'F6222-F6225',
    'F6226-F6229',
    'F6230-F6233'
  ];

  @override
  void dispose() {
    _floorController.dispose();
    _roomNoController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate() && 
      _selectedProblemType != 'Select Any One' &&
      _selectedFloor != 'Select Floor' &&
      _selectedRoomNo != 'Select Room No') {
      final problemType = _selectedProblemType;
      final floor = _selectedFloor;
      final roomNo = _selectedRoomNo;
      final description = _descriptionController.text;

      print('Problem Type: $problemType');
      print('Floor: $floor');
      print('Room No: $roomNo');
      print('Description: $description');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Please Fill The Form'),
      ));
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
                  value: _selectedProblemType,
                  decoration: InputDecoration(
                    labelText: 'Problem',
                    labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedProblemType = newValue!;
                    });
                  },
                  items: _problemTypes.map<DropdownMenuItem<String>>((String value) {
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
                DropdownButtonFormField<String>(
                  value: _selectedFloor,
                  decoration: InputDecoration(
                    labelText: 'Floor',
                    labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedFloor = newValue!;
                    });
                  },
                  items: _floors.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: value == 'Select Floor'
                            ? TextStyle(color: Colors.grey[600])
                            : TextStyle(),
                      ),
                    );
                  }).toList(),
                ),
                DropdownButtonFormField<String>(
                  value: _selectedRoomNo,
                  decoration: InputDecoration(
                    labelText: 'Room No',
                    labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedRoomNo = newValue!;
                    });
                  },
                  items: _roomNos.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: value == 'Select Room No'
                            ? TextStyle(color: Colors.grey[600])
                            : TextStyle(),
                      ),
                    );
                  }).toList(),
                ),
                TextFormField(
                  controller: _descriptionController,
                  decoration: InputDecoration(
                    labelText: 'Description',
                    labelStyle: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a description';
                    }
                    return null;
                  },
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