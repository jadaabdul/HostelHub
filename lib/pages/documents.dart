import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class NinthRoute extends StatelessWidget {
  const NinthRoute({super.key});

  Future<void> _pickFile(BuildContext context) async {
    try {
      // Open the file picker dialog
      final result = await FilePicker.platform.pickFiles();

      if (result != null) {
        // File selected
        final file = result.files.single;
        print('File selected: ${file.name}');
        // Handle the file here, for example, upload it to a server
      } else {
        // User canceled the picker
        print('No file selected');
      }
    } catch (e) {
      // Handle any errors that occur during file picking
      print('Error picking file: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "HostelHubz",
        ),
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
                  "https://as1.ftcdn.net/v2/jpg/02/89/49/22/1000_F_289492257_augSIlCtit7AQhCZQwYPF1X1XgtwwJkN.jpg",
                ),
              ),
            ),
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
      body: Center(
        child: Text('Content'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _pickFile(context),
        child: Icon(Icons.upload_file),
        backgroundColor: Color(0xffcb54df),
      ),
    );
  }
}
