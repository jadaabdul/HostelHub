import 'package:flutter/material.dart';

class FourthRoute extends StatelessWidget {
  final List<Map<String, String>> days = [
    {
      "day": "Monday",
      "description":
          "LUNCH: \nLilu Shak, Kathod nu shak, Daal-Rice, Rotli/Puri, Salad, Chash.\nDINNER: \nThepla/ Rotli/ Bhakhri, Lilu Shak/Kathod nu shak, Pulav, Chash, Papad"
    },
    {
      "day": "Tuesday",
      "description":
          "LUNCH: \nLilu Shak, Kathod nu shak, Daal-Rice, Rotli/Puri, Salad, Chash.\nDINNER: \nRotli/ Bhakhri, Lilu Shak/Kathod nu shak, Kichdi-Kadhi, Chash, Papad"
    },
    {
      "day": "Wednesday",
      "description":
          "LUNCH: \nLilu Shak, Kathod nu shak, Daal-Rice, Rotli/Puri, Salad, Chash.\nDINNER: \nChole/ Paav-Bhaji, Pulav, Chash, Papad, Onion&Chilli"
    },
    {
      "day": "Thursday",
      "description":
          "LUNCH: \nLilu Shak, Kathod nu shak, Daal-Rice, Rotli/Puri, Salad, Chash.\nDINNER: \nPunjabi Shabji/ Aloo-Mater/ Malai-Kopta, Pulav, Chash, Papad, Onion&Chilli"
    },
    {
      "day": "Friday",
      "description":
          "LUNCH: \nLilu Shak, Kathod nu shak, Daal-Rice, Rotli/Puri, Salad, Chash.\nDINNER: \nDaal-Dhokli, Rice, Sev-Tameta nu Shak, Rotli, Papad, Chash"
    },
    {
      "day": "Saturday",
      "description":
          "LUNCH: \nLilu Shak, Kathod nu shak, Daal-Rice, Rotli/Puri, Salad, Chash.\nDINNER: \nPunjabi Shabji/ Aloo-Mater/ Malai-Kopta, Pulav, Chash, Papad, Onion&Chilli"
    },
    {
      "day": "Sunday",
      "description":
          "LUNCH: \nLilu Shak/Kathod nu shak, Batata nu shak, Kadhi-Khichdi/ Daal-Rice, Rotli/Puri, Salad, Sweet(Limited).\nDINNER: \nBhakhri/ Rotli, Sabji, Chash, Papad, Kadhi-Khichdi"
    },
  ];

  final List<Color> colors = [
    Colors.blueAccent.shade100,
    const Color.fromARGB(255, 140, 240, 168),
    Colors.redAccent.shade100,
    Colors.orangeAccent.shade100,
    Colors.pinkAccent.shade100,
    Color.fromARGB(255, 229, 229, 57),
    const Color.fromARGB(255, 82, 235, 200),
  ];

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
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                    child: Text(
                  'Your Mess Menu..!!!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                )),
              ),
              //  Expanded(child: ListView.builder(
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.all(15.0),
                  itemCount: days.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                        margin: EdgeInsets.symmetric(vertical: 5.0),
                        decoration: BoxDecoration(
                          // color: Color(0xffcb54df), // Background color
                          color: colors[index % colors.length],
                          borderRadius:
                              BorderRadius.circular(8.0), // Rounded corners
                        ),
                        child: ExpansionTile(
                          title: Text(days[index]['day']!,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                // backgroundColor: Color(0xffcb54df),
                              )),
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 8.0),
                              child: Text(
                                days[index]['description']!,
                                style: TextStyle(
                                    fontSize: 19, color: Colors.white70),
                              ),
                            ),
                          ],
                        ));
                  },
                ),
              )
            ]));
  }
}
