import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_new/blocs/auth/auth_bloc.dart';
import 'package:tobeto_new/blocs/auth/auth_event.dart';
import 'package:tobeto_new/models/users.dart';
import 'package:tobeto_new/screens/calendar_screen.dart';
import 'package:tobeto_new/screens/catalog_screen.dart';
import 'package:tobeto_new/screens/home_screen.dart';
import 'package:tobeto_new/screens/login_screen/login_screen.dart';
import 'package:tobeto_new/screens/profile_screen.dart';
import 'package:tobeto_new/screens/reviews_screen.dart';
import 'package:tobeto_new/widgets/profile_edit_widget/user.dart';

class TobetoDrawer extends StatefulWidget {
  const TobetoDrawer({Key? key}) : super(key: key);

  @override
  _TobetoDrawerState createState() => _TobetoDrawerState();
}

class _TobetoDrawerState extends State<TobetoDrawer> {
  // ignore: prefer_typing_uninitialized_variables
  var _selectedIndex;

  void _logout() {
    context.read<AuthBloc>().add(Logout());
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    Color? textColor = isDarkMode
        ? Theme.of(context).textTheme.bodyMedium!.color
        : Theme.of(context).textTheme.bodyMedium!.color;
    var phoneWidth = MediaQuery.of(context).size.width;
    var phoneHeight = MediaQuery.of(context).size.height;
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: phoneHeight / 30, horizontal: phoneWidth / 20),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    isDarkMode
                        ? Image.asset(
                            "lib/assets/tobeto-logo-dark.png",
                            width: phoneWidth / 2.5,
                          )
                        : Image.asset(
                            "lib/assets/tobeto.png",
                            width: phoneWidth / 2.5,
                          ),
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(Icons.close))
                  ]),
            ),
            SizedBox(
              height: 40,
              child: ListTile(
                selected: _selectedIndex == 0,
                title: Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Anasayfa',
                    style: TextStyle(color: textColor),
                  ),
                ),
                onTap: () {
                  if (_selectedIndex == 0) {
                    Navigator.pop(context);
                  } else {
                    setState(() {
                      _selectedIndex = 0;
                    });

                    Navigator.pop(context);
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  }
                },
              ),
            ),
            SizedBox(
              height: 40,
              child: ListTile(
                // selected: _selectedIndex == 1,
                title: Container(
                  alignment: Alignment.topLeft,
                  child: Text('Değerlendirmeler',
                      style: TextStyle(color: textColor)),
                ),
                onTap: () {
                  if (_selectedIndex == 1) {
                    Navigator.pop(context);
                  } else {
                    setState(() {
                      _selectedIndex = 1;
                    });

                    Navigator.pop(context);
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ReviewsScreen()));
                  }
                },
              ),
            ),
            SizedBox(
              height: 40,
              child: ListTile(
                  // selected: _selectedIndex == 2,
                  title: Container(
                    alignment: Alignment.topLeft,
                    child: Text('Profilim', style: TextStyle(color: textColor)),
                  ),
                  onTap: () {
                    if (_selectedIndex == 2) {
                      Navigator.pop(context);
                    } else {
                      setState(() {
                        _selectedIndex = 2;
                      });

                      Navigator.pop(context);
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ProfileScreen()));
                    }
                  }),
            ),
            SizedBox(
              height: 40,
              child: ListTile(
                // selected: _selectedIndex == 3,
                title: Container(
                  alignment: Alignment.topLeft,
                  child: Text('Katalog', style: TextStyle(color: textColor)),
                ),
                onTap: () {
                  if (_selectedIndex == 3) {
                    Navigator.pop(context);
                  } else {
                    setState(() {
                      _selectedIndex = 3;
                    });

                    Navigator.pop(context);
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => CatalogScreen()));
                  }
                },
              ),
            ),
            SizedBox(
              height: 40,
              child: ListTile(
                // selected: _selectedIndex == 4,
                title: Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Takvim',
                    style: TextStyle(color: textColor),
                  ),
                ),
                onTap: () {
                  if (_selectedIndex == 4) {
                    Navigator.pop(context);
                  } else {
                    setState(() {
                      _selectedIndex = 4;
                    });

                    Navigator.pop(context);
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => CalendarScreen()));
                  }
                },
              ),
            ),
            Divider(
              height: 40,
              indent: 10,
              endIndent: 15,
              color: isDarkMode
                  ? const Color.fromARGB(255, 217, 217, 217)
                  : Color.fromARGB(70, 136, 136, 136),
            ),
            ListTile(
              onTap: () {},
              title: Row(
                children: [
                  Text(
                    'Tobeto',
                    style: TextStyle(color: textColor),
                  ),
                  const SizedBox(width: 8),
                  Icon(
                    Icons.home,
                    color: textColor,
                  ),
                ],
              ),
            ),
            Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    border: Border.all(
                      style: BorderStyle.solid,
                      color: isDarkMode
                          ? Color.fromARGB(255, 173, 173, 173)
                          : Color.fromARGB(70, 136, 136, 136),
                    ),
                    borderRadius: BorderRadius.circular(40)),
                child: InkWell(
                  onTap: () {},
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ListTile(
                          title: Text(
                            'Beyza',
                            style: TextStyle(color: textColor),
                          ),
                        ),
                      ),
                      const Spacer(),
                      Expanded(
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 20,
                          child: ClipOval(
                            child: SizedBox(
                              width: 40,
                              height: 40,
                              child: Image.asset(
                                "lib/assets/user.jpeg",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 40,
              child: ListTile(
                title: Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Çıkış Yap',
                    style: TextStyle(color: textColor),
                  ),
                ),
                onTap: () {
                  _logout();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
