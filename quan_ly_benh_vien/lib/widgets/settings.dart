
import "/models/user_interface.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";

class MySettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<UserInterface>(
      builder: (context, ui, child) {
        return Scaffold(
            appBar: AppBar(
              title: Text("Settings", style: TextStyle(color: Colors.white),),
              backgroundColor: ui.appBarColor,
            ),
            body: Column(
              children: [
                Text(
                  "Font size: ${ui.fontSize.toInt()}",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),

                Slider(
                  min: 1,
                  max: 100,
                  value: ui.fontSize,
                  onChanged: (newValue) {
                    ui.fontSize = newValue;
                  },
                ),

                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "AppBar Color:",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),

                      DropdownButton<String>(
                        value: ui.strAppBarColor,
                        items: UserInterface.listColorAppBar.map<DropdownMenuItem<String>>(
                                (String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }
                        ).toList(),
                        onChanged: (String? value) {
                          ui.appBarColor = value!;
                        },
                      )
                    ]
                ),

                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Background Color:",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),

                      DropdownButton<String>(
                        value: ui.strBackgroundColor,
                        items: UserInterface.listColorBackground.map<DropdownMenuItem<String>>(
                                (String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }
                        ).toList(),
                        onChanged: (String? value) {
                          ui.backgroundColor = value!;
                        },
                      )
                    ]
                ),

              ],
            )
        );
      },
    );
  }
}
