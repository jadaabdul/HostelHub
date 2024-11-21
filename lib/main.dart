import 'package:flutter/material.dart';
import 'package:application_1/pages/leave1.dart';
// import 'package:application_1/pages/leave2.dart';
import 'package:application_1/pages/mess.dart';
import 'package:application_1/pages/meeting1.dart';
// import 'package:application_1/pages/meeting2.dart';
import 'package:application_1/pages/complain1.dart';
import 'package:application_1/pages/documents.dart';


void main() {
  runApp(const MaterialApp(
    home: FirstRoute(),
  ));
}

class FirstRoute extends StatelessWidget {
  const FirstRoute({super.key});
  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> items = [
      {
      "image":
          "https://static.vecteezy.com/system/resources/previews/025/685/326/original/travel-bag-icon-design-template-simple-and-modern-vector.jpg",
      "label": "Leave"
    },
    {
      "image":
          "https://media.istockphoto.com/id/1038356020/vector/restaurant-icon.jpg?s=612x612&w=0&k=20&c=Tk_v3JuJA4lz_8ZRJi78xS4p75Idqt97uEtYJciVtFI=",
      "label": "Mess"
    },
    {
      "image":
          "https://st2.depositphotos.com/1364916/6967/v/950/depositphotos_69679145-stock-illustration-teamwork-meeting-people-logo-vector.jpg",
      "label": "Meeting"
    },
    {
      "image":
          "https://thumbs.dreamstime.com/b/%E6%89%93%E5%8D%B0-207281923.jpg",
      "label": "Complain "
    },
    {
      "image":
          "https://thumbs.dreamstime.com/b/multiple-file-document-icon-logo-design-element-multiple-file-document-icon-logo-design-element-white-background-122728126.jpg",
      "label": "Documents"
    },
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "HOSTELBOYS",
        ),
        backgroundColor: Color(0xffcb54df),
        actions: [
          Padding(
            padding: EdgeInsets.all(5.0),
            child: Container(
              width: 30,
              height: 90,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black
                        .withOpacity(0.1), // Shadow color with opacity
                    spreadRadius: 1, // Spread radius
                    blurRadius: 10, // Blur radius
                    offset: Offset(0, 2), // Offset in x and y directions
                  ),
                ],
              ),
              child: Icon(
                Icons.notifications_on_outlined,
                color: Colors.blue,
                size: 25,
              ),
            ),
          ),
          //2nd Button
          Padding(
            padding: EdgeInsets.all(5.0),
            child: Container(
              width: 30,
              height: 90,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black
                        .withOpacity(0.1), 
                    spreadRadius: 1, // Spread radius
                    blurRadius: 10, // Blur radius
                    offset: Offset(0, 2), // Offset in x and y directions
                  ),
                ],
              ),
              child: Icon(
                Icons.person_2_outlined,
                color: Colors.blue,
                size: 25,
              ),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(children: [
          UserAccountsDrawerHeader(
            accountName: Text("Student Name"),
            accountEmail: Text("Student Contact No."),
            currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                // child: Text("IA"),  //for letter
                child: ClipOval(
                    //for round image
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
      body: GridView.builder(
        padding: const EdgeInsets.all(10.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 2 columns
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              if (index == 0) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SecondRoute()),
                );
              } else if (index == 1) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FourthRoute()),
                );
              } else if (index == 2) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FifthRoute()),
                );
              } else if (index == 3) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SeventhRoute()),
                );
              } else if (index == 4) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const NinthRoute()),
                );
              }
            },
             child: Container(
              decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              border: Border.all(
                color: Colors.black, // Border color
                width: 1, // Border width
              ),
              ),
             child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    items[index]['image']!,
                    fit: BoxFit.fill,
                    height: 100,
                    width: 100,
                  ),
                  SizedBox(height: 10),
                  Text(
                    items[index]['label']!,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

             )
          );
        },
      ),
    );
  }
}









