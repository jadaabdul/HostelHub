import 'package:flutter/material.dart';
import 'package:application_1/pages/meeting2.dart';

class FifthRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "HostelHubz",
          ),
          backgroundColor: Color(0xffcb54df),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Recent'),
              Tab(text: 'History'),
            ],
          ),
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
        body: TabBarView(
          children: [
            Center(child: Text('There is no meeting.')),
            Center(child: Text('There is no meeting.')),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print("ADDED");
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SixthRoute()),
            );
          },
          child: Icon(Icons.add),
          backgroundColor: Color(0xffcb54df),
        ),
      ),
    );
  }
}
