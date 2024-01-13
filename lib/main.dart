import 'package:flutter/material.dart';
import 'package:flutter_music_application/screens/home_screen.dart';
import 'package:flutter_music_application/screens/song_screen.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: Colors.white,
              displayColor: Colors.white,
            ),
      ),
      getPages: [
        GetPage(name: '/', page: () => const HomeScreen()),
        GetPage(name: '/song', page: () => const SongScreen()),
        GetPage(name: '/playlist', page: () => const HomeScreen()),
      ],

      home: DashboardScreen(),
      // Scaffold(
      //   body: Stack(
      //     fit: StackFit.expand,
      //     children: [
      //       Image.asset(
      //         'assets/images/a.png',
      //         fit: BoxFit.cover,
      //       ),
      //       ShaderMask(
      //         blendMode: BlendMode.dstOut,
      //         shaderCallback: (rec) {
      //           return LinearGradient(colors: [
      //             Colors.deepPurple.shade100,
      //           ]);
      //         },
      //         child: Container(),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int IndexOfPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: IndexedStack(
        index: IndexOfPage,
        children: getrout(),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
        child: BottomNavigationBar(
          elevation: 0,
          backgroundColor: Colors.deepPurple.shade800,
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: false,
          currentIndex: IndexOfPage,
          onTap: (index) {
            setState(() {
              IndexOfPage = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              label: '',
              icon: Icon(
                Icons.home_outlined,
                color: Colors.white,
              ),
              activeIcon: Icon(
                Icons.home,
                color: Colors.white,
              ),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: Icon(
                Icons.favorite_outline,
                color: Colors.white,
              ),
              activeIcon: Icon(
                Icons.favorite,
                color: Colors.white,
              ),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: Icon(
                Icons.play_arrow_outlined,
                color: Colors.white,
              ),
              activeIcon: Icon(
                Icons.play_arrow,
                color: Colors.white,
              ),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: Icon(
                Icons.person_outline,
                color: Colors.white,
              ),
              activeIcon: Icon(
                Icons.person,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<Widget> getrout() {
  return <Widget>[
    HomeScreen(),
    Container(),
    Container(),
    Container(),
  ];
}
