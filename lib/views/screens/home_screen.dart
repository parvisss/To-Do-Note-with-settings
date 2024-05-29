import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:uzgaruvchi/controllers/note_controller.dart';
import 'package:uzgaruvchi/utils/app_constats.dart';
import 'package:uzgaruvchi/views/widgets/custom_drower.dart';
import 'package:uzgaruvchi/views/widgets/to_do.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedLanduage = "Uz";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Home Screen"),
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
                const Gap(20)
              ],
            ),
          ],
        ),
        drawer: const CustomDrawer(),
        body: ToDO());
  }
}
