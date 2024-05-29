import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:gap/gap.dart';
import 'package:uzgaruvchi/poral/settings_portal.dart';
import 'package:uzgaruvchi/utils/app_constats.dart';
import 'package:uzgaruvchi/utils/styles/styles.dart';
import 'package:uzgaruvchi/views/widgets/custom_drower.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({
    super.key,
  });

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Color darkBody = AppConstants.bodyDark;
  Color lightBody = AppConstants.bodyLight;
  Color darkApp = AppConstants.appBarDark;
  Color lightApp = AppConstants.appBarLight;
  double textsize = AppConstants.textSize;
  final textSizeController = TextEditingController();
  String selectedLanduage = "Uz";

  void selectColor(Color initialColor, ValueChanged<Color> onColorChanged) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Select color'),
          content: SingleChildScrollView(
            child: SlidePicker(
              pickerColor: initialColor,
              onColorChanged: onColorChanged,
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('OK'),
              onPressed: () {
                setState(() {});
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Row(
            children: [
              DropdownButton(
                value: selectedLanduage,
                items: const [
                  DropdownMenuItem(
                    value: "Uz",
                    child: Text("Uz"),
                  ),
                  DropdownMenuItem(
                    value: "Ru",
                    child: Text("Ru"),
                  ),
                  DropdownMenuItem(
                    value: "Eng",
                    child: Text("Eng"),
                  )
                ],
                onChanged: (newvalue) {
                  setState(() {
                    selectedLanduage = newvalue!;
                  });
                },
              ),
              Gap(20)
            ],
          ),
        ],
        title: const Text(
          "Settings",
        ),
      ),
      drawer: CustomDrawer(),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            SwitchListTile(
              value: SettingPortal.of(context).themeMode == ThemeMode.dark,
              onChanged: (value) {
                SettingPortal.of(context).onOff(value);
              },
              title: Text(
                "Dark Mode",
                style: TextStyle(
                    fontSize: AppConstants.textSize,
                    color: AppConstants.textColor),
              ),
            ),
            const SizedBox(height: 30),
            ListTile(
              title: Text(
                "Dark mode Body color",
                style: TextStyle(
                    fontSize: AppConstants.textSize,
                    color: AppConstants.textColor),
              ),
              trailing: TextButton(
                onPressed: () {
                  selectColor(darkBody, (color) {
                    setState(() {
                      darkBody = color;
                      AppConstants.bodyDark = color;
                    });
                  });
                },
                child: Text(
                  "Select color",
                  style: TextStyle(
                      fontSize: AppConstants.textSize,
                      color: AppConstants.textColor),
                ),
              ),
            ),
            ListTile(
              title: Text(
                "Light mode Body color",
                style: TextStyle(
                    fontSize: AppConstants.textSize,
                    color: AppConstants.textColor),
              ),
              trailing: TextButton(
                onPressed: () {
                  selectColor(lightBody, (color) {
                    setState(() {
                      lightBody = color;
                      AppConstants.bodyLight = color;
                    });
                  });
                },
                child: Text(
                  "Select color",
                  style: TextStyle(
                      fontSize: AppConstants.textSize,
                      color: AppConstants.textColor),
                ),
              ),
            ),
            ListTile(
              title: Text(
                "Dark mode App Bar color",
                style: TextStyle(
                    fontSize: AppConstants.textSize,
                    color: AppConstants.textColor),
              ),
              trailing: TextButton(
                onPressed: () {
                  selectColor(darkApp, (color) {
                    setState(() {
                      darkApp = color;
                      AppConstants.appBarDark = color;
                    });
                  });
                },
                child: Text(
                  "Select color",
                  style: TextStyle(
                      fontSize: AppConstants.textSize,
                      color: AppConstants.textColor),
                ),
              ),
            ),
            ListTile(
              title: Text(
                "Light mode App Bar color",
                style: TextStyle(
                    fontSize: AppConstants.textSize,
                    color: AppConstants.textColor),
              ),
              trailing: TextButton(
                onPressed: () {
                  selectColor(lightApp, (color) {
                    setState(() {
                      lightApp = color;
                      AppConstants.appBarLight = color;
                    });
                  });
                },
                child: Text(
                  "Select color",
                  style: TextStyle(
                      fontSize: AppConstants.textSize,
                      color: AppConstants.textColor),
                ),
              ),
            ),
            const Gap(10),
            ListTile(
              title: Text(
                "text size",
                style: TextStyle(
                    fontSize: AppConstants.textSize,
                    color: AppConstants.textColor),
              ),
              trailing: TextButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text(
                          'Select color',
                          style: TextStyle(
                              fontSize: AppConstants.textSize,
                              color: AppConstants.textColor),
                        ),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextField(
                              decoration: InputDecoration(hintText: "Size"),
                              controller: textSizeController,
                            )
                          ],
                        ),
                        actions: <Widget>[
                          ElevatedButton(
                            child: const Text('OK'),
                            onPressed: () {
                              AppConstants.textSize =
                                  double.parse(textSizeController.text);
                              print(AppConstants.textSize);
                              print(StyleText.size);

                              setState(() {});
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                  // print(int.parse(textSizeController.text));
                },
                child: Text(
                  "set size",
                  style: TextStyle(
                      fontSize: AppConstants.textSize,
                      color: AppConstants.textColor),
                ),
              ),
            ),
            ListTile(
              title: Text(
                "text color",
                style: TextStyle(
                    fontSize: AppConstants.textSize,
                    color: AppConstants.textColor),
              ),
              trailing: TextButton(
                onPressed: () {
                  selectColor(lightApp, (color) {
                    setState(() {
                      lightApp = color;
                      AppConstants.textColor = color;
                    });
                  });
                },
                child: Text(
                  "Select color",
                  style: TextStyle(
                      fontSize: AppConstants.textSize,
                      color: AppConstants.textColor),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
