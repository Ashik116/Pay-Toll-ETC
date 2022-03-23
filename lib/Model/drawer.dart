import 'package:flutter/material.dart';
import 'package:toll_payetc/Ui/homepage.dart';
import 'package:toll_payetc/test.dart';

class SlideDrawer extends StatefulWidget {
  const SlideDrawer({Key? key}) : super(key: key);

  @override
  State<SlideDrawer> createState() => _SlideDrawerState();
}

class _SlideDrawerState extends State<SlideDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0C8ECA), Color(0xFFCFC3C3)],
            begin: Alignment.topLeft,
            end: Alignment.topRight,
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.only(top: 50),
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                  image: DecorationImage(
                fit: BoxFit.contain,
                image: AssetImage('images/logo.png'),
              )),
              child: null,
            ),
            const Divider(
              thickness: 1,
              indent: 100,
              endIndent: 100,
            ),
            const Divider(
              thickness: 1,
              indent: 60,
              endIndent: 60,
            ),
            const Divider(
              thickness: 1,
              indent: 20,
              endIndent: 20,
            ),
            ListTile(
              leading: const Icon(Icons.account_circle_rounded),
              title: const Text('My Profile'),
              onTap: () {
                //Navigator.of(context).pushNamed("/profile/user");
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => Test()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                //Navigator.of(context).pushNamed("/profile/user");
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => HomePage()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout_outlined),
              title: const Text('LogOut'),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => Test()));
              },
            ),
            const Divider(
              thickness: 1,
              indent: 20,
              endIndent: 20,
            ),
            const Divider(
              thickness: 1,
              indent: 60,
              endIndent: 60,
            ),
            const Divider(
              thickness: 1,
              indent: 100,
              endIndent: 100,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Version: 1.0.0',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.brown,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
