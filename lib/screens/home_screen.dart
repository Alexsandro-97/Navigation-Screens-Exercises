import 'package:flutter/material.dart';
import 'package:menu_navigation/screens/first_screen.dart';
import 'package:menu_navigation/screens/second_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> screens = const [
    FirstScreen(),
    SecondScreen(),
  ];

  int onPageChanged = 0;

  late PageController controller = PageController(initialPage: onPageChanged);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text('Menu Navigation'),
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            color: Colors.amber,
            height: MediaQuery.of(context).size.height,
            width: 100.0,
            child: Column(
              children: [
                IconButton(
                    onPressed: () => controller.animateToPage(
                          --onPageChanged,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn,
                        ),
                    icon: const Icon(Icons.arrow_back),
                    tooltip: 'Voltar'),
                const SizedBox(height: 20.0),
                IconButton(
                    onPressed: () => controller.animateToPage(
                          ++onPageChanged,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn,
                        ),
                    icon: const Icon(Icons.arrow_forward),
                    tooltip: 'Seguir'),
              ],
            ),
          ),
          Expanded(
            child: PageView(
              children: screens,
              onPageChanged: (index) {
                setState(() {
                  onPageChanged = index;
                });
                // print(onPageChanged);
              },
              controller: controller,
            ),
          ),
        ],
      ),
    );
  }
}
