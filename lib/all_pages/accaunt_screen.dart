import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_driwer.dart';

class MyAccauntSetting extends StatefulWidget {
  const MyAccauntSetting({Key? key}) : super(key: key);

  @override
  State<MyAccauntSetting> createState() => _MyAccauntSettingState();
}

class _MyAccauntSettingState extends State<MyAccauntSetting> {
  bool _isSearchVisible = false;
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 40, 162, 155),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 70, 162, 155),
        title: _isSearchVisible
            ? TextField(
          controller: _searchController,
          decoration: const InputDecoration(
            hintText: 'Search...',
            hintStyle: TextStyle(color: Colors.black, fontSize: 20),
            border: InputBorder.none,
          ),
        )
            : const Text(
          "Account",
          style: TextStyle(
              color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                _isSearchVisible = !_isSearchVisible;
              });
            },
            icon: _isSearchVisible
                ? const Icon(Icons.close, color: Colors.black,)
                : const Icon(Icons.search, color: Colors.black,),
          ),
          const SizedBox(width: 10),
        ],
        elevation: 0, // Remove the default shadow
        // Wrap AppBar with Container to add border
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.black, width: 2.0),
              ),
            ),
          ),
        ),
      ),

      drawer: const CustomDrawer(),

      body:  SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              MaterialButton(
                height: 50,
                minWidth: double.infinity,
                color: Colors.white10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                onPressed: () {
                  // Add functionality for My Profile button
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.person_3_outlined), // Replace 'icon_name' with the actual icon you want to use
                    SizedBox(width: 5), // Add some spacing between icon and text
                    Text(
                      'My Profile',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 5),
                    Icon(Icons.arrow_right_sharp)
                  ],
                ),
              ),
              MaterialButton(
                height: 50,
                minWidth: double.infinity,
                color: Colors.white10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                onPressed: () {
                  // Add functionality for My Profile button
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.notification_important_outlined, color: Colors.black,), // Replace 'icon_name' with the actual icon you want to use
                    SizedBox(width: 5), // Add some spacing between icon and text
                    Text(
                      'Notification',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 5),
                    Icon(Icons.arrow_right_sharp)
                  ],
                ),
              ),
              MaterialButton(
                height: 50,
                minWidth: double.infinity,
                color: Colors.white10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                onPressed: () {
                  // Add functionality for My Profile button
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(CupertinoIcons.globe, color: Colors.black,), // Replace 'icon_name' with the actual icon you want to use
                    SizedBox(width: 5), // Add some spacing between icon and text
                    Text(
                      '     Til    ',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 5),
                    Icon(Icons.arrow_right_sharp)
                  ],
                ),
              ),
              MaterialButton(
                height: 50,
                minWidth: double.infinity,
                color: Colors.white10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                onPressed: () {
                  // Add functionality for My Profile button
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(CupertinoIcons.location_solid, color: Colors.black,), // Replace 'icon_name' with the actual icon you want to use
                    SizedBox(width: 5), // Add some spacing between icon and text
                    Text(
                      ' Location',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 5),
                    Icon(Icons.arrow_right_sharp)
                  ],
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
