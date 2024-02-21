import 'package:flutter/material.dart';
import 'package:shopping/services/extension_service.dart';

import '../widgets/third_initial_page.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({Key? key}) : super(key: key);


  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  final _controller = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_handlePageChange);
  }

  @override
  void dispose() {
    _controller.removeListener(_handlePageChange);
    _controller.dispose();
    super.dispose();
  }

  void _handlePageChange() {
    setState(() {
      _currentPage = _controller.page!.round();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 40, 162, 155),
                  image: DecorationImage(
                    image: AssetImage("assets/images/Online ads.png"),
                    fit: BoxFit.fitWidth,
                  ),
                ),
                child:  Padding(
                  padding: const EdgeInsets.symmetric(vertical: 75.0, horizontal: 16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [

                      Text("discount".tr, style: const TextStyle(color: Colors.white, fontSize: 25),)
                    ],
                  ),
                ),
              ),

              Container(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 40, 162, 155),
                  image: DecorationImage(
                    image: AssetImage("assets/images/oilaviy_photo_for_intro.png"),
                    fit: BoxFit.fitWidth,
                  ),
                ),
                child:  Padding(
                  padding: const EdgeInsets.symmetric(vertical: 75.0, horizontal: 16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("costs".tr, style: const TextStyle(color: Colors.white, fontSize: 25),)
                    ],
                  ),
                ),
              ),

              const ThirdInitialPage(),


            ],
          ),
          Positioned(
            bottom: 25.0,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < 3; i++)
                  if (i == _currentPage)
                    _buildPageIndicator(true)
                  else
                    _buildPageIndicator(false),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPageIndicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 24.0 : 8.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.black45 : Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
