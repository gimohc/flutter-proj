import 'package:flutter/material.dart';
import 'package:proj/components/default_page.dart';
import 'package:proj/components/drop_down.dart';
import 'package:proj/components/map.dart';
import 'package:proj/components/request_panel.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final ValueNotifier<String> carNotifier = ValueNotifier("Tesla Model 3");
  final ValueNotifier<String> addressNotifier = ValueNotifier("Home");

  final List<String> addresses = ["Home", "Work", "Gym"];
  final List<String> cars = ["Tesla Model 3", "BMW i4", "Nissan Leaf"];

  @override
  Widget build(BuildContext context) {
    return DefaultPage(
      title: "WattsUp",
      showProfile: true,
      child: Stack(
        children: [
          const MapBackground(),

          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Row(
              children: [
                Expanded(
                  child: ValueListenableBuilder<String>(
                    valueListenable: addressNotifier,
                    builder: (context, value, _) {
                      return DropDown(
                        icon: Icons.location_on,
                        value: value,
                        items: addresses,
                        onChanged: (newVal) => addressNotifier.value = newVal!,
                      );
                    },
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ValueListenableBuilder<String>(
                    valueListenable: carNotifier,
                    builder: (context, value, _) {
                      return DropDown(
                        icon: Icons.electric_car,
                        value: value,
                        items: cars,
                        onChanged: (newVal) => carNotifier.value = newVal!,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          RequestPanel(
            onRequestNow: () => print("Requesting ${carNotifier.value}"),
            onSchedule: () => {
              //popup time and date later
              print("schedule"),
            },
          ),
        ],
      ),
    );
  }
}
