import 'package:flutter/material.dart';
import 'package:shopping/services/extension_service.dart';

class ThirdInitialPage extends StatefulWidget {
  const ThirdInitialPage({Key? key}) : super(key: key);

  @override
  State<ThirdInitialPage> createState() => _ThirdInitialPageState();
}

class _ThirdInitialPageState extends State<ThirdInitialPage> {
  String _selectedLanguage = 'English'; // Initial language

  bool _isDarkMode = false; // Initial dark mode status

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 40, 162, 155),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {
                      // Show the settings dialog when the settings icon is pressed
                      showSettingsDialog(context);
                    },
                    icon: const Icon(Icons.settings, color: Colors.white, size: 25),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _isDarkMode = !_isDarkMode; // Toggle dark mode status
                      });
                    },
                    icon: _isDarkMode ? const Icon(Icons.light_mode, color: Colors.white,) : const Icon(Icons.dark_mode, color: Colors.black,),
                  )

                ],
              ),
              Expanded(
                child: Image.asset(
                  "assets/images/location_intro.png",
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 25),
              Text("location".tr, style: const TextStyle(color: Colors.white, fontSize: 20),),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  MaterialButton(
                    height: 40,
                    minWidth: 100,
                    color: Colors.white24,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, "/sign_in");
                    },
                    child: const Text(
                      "Next",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  const SizedBox(width: 5,),
                ],
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }

// Function to show the settings dialog
  void showSettingsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Settings'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                title: const Text('Language'),
                onTap: () {
                  Navigator.pop(context);
                  showLanguageMenu(context);
                },
              ),
              ListTile(
                title: const Text('Admin Account'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, "/admin_panel"); // Navigate to admin panel
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void showLanguageMenu(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Select Language'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text('English'),
                onTap: () {
                  setState(() {
                    _selectedLanguage = 'English'; // Update selected language
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Uzbek'),
                onTap: () {
                  setState(() {
                    _selectedLanguage = 'Uzbek'; // Update selected language
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Russian'),
                onTap: () {
                  setState(() {
                    _selectedLanguage = 'Russian'; // Update selected language
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Back'),
                onTap: () {
                  Navigator.pop(context); // Close the language selection dialog
                  showSettingsDialog(context); // Reopen the settings dialog
                },
              ),
            ],
          ),
        );
      },
    );
  }


}
