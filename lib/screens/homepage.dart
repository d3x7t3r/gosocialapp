import 'package:flutter/material.dart';
import 'package:gosocial/screens/about_page.dart';
import 'package:gosocial/screens/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
var selectedItem = '';

  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Home',
      style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
    ),
    Text(
      'Search',
      style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
    ),
    Text(
      'Notifications',
      style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
    ),
    Text(
      'Messages',
      style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
    ),
    Text(
      'Profile',
      style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Home',
          style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.w400,
          ),
        ),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          ),
          PopupMenuButton(onSelected: (value){
          setState(() {
            selectedItem = value.toString();
          });
          print(value);
          switch (value){
            case '/about':
              Navigator.pushNamed(context, value);
              break;
            case '/contacts':
              Navigator.pushNamed(context, value);
              break;
            case '/settings':
              Navigator.pushNamed(context, value);
              break;
            case '/sendfeedback':
              Navigator.pushNamed(context, value);
              break;
             case '/logout':
               Navigator.pushNamedAndRemoveUntil(context, '/logout', (route)=> false);
              break;
            default:
              break;
            }
          },
    itemBuilder: (BuildContext bc){

            return const [
              PopupMenuItem(
                child: Text('About'),
                value: '/about',
              ),
              PopupMenuItem(
                child: Text('Contacts'),
                value: '/contacts',
              ),
              PopupMenuItem(
                child: Text('Settings'),
                value: '/settings',
              ),
              PopupMenuItem(
                child: Text('Send Feedback'),
                value: '/sendfeedback',
              ),
              PopupMenuItem(
                child: Text('Log Out'),
                value: '/logout',
              ),
            ];
          }
          ),
        ],
      ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              child: Text('Create a social group'),
            ),
            const SizedBox(height: 16),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Search chats',
                suffixIcon: Icon(Icons.search),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.blue,
                      child: Icon(Icons.person),
                    ),
                    title: Text('Chat ${index + 1}'),
                    subtitle: Text('Last message'),
                    trailing: Text('1:23 PM'),
                  );
                },
              ),
            ),
          ],
        ),

      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 5.0,
        color: Colors.blue,
        child: Container(
          height: 60.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.search),
                color: Colors.white,
                onPressed: () {

                },
              ),
              IconButton(
                icon: Icon(Icons.people),
                color: Colors.white,
                onPressed: () {

                },
              ),
              IconButton(
                icon: Icon(Icons.message),
                color: Colors.white,
                onPressed: () {

                },
              ),
              IconButton(
                icon: Icon(Icons.account_circle),
                color: Colors.white,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfilePage()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.blue,
        child: const Icon(Icons.home),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
