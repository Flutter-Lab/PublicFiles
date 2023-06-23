// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';

class DragableDemoScreen extends StatefulWidget {
  const DragableDemoScreen({super.key});

  @override
  State<DragableDemoScreen> createState() => _DragableDemoScreenState();
}

class _DragableDemoScreenState extends State<DragableDemoScreen> {
  Color caughtColor = Colors.red;
  Widget? imageWidgetData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Draggable(
              data: Image.network(
                  'https://media.istockphoto.com/id/1211279940/photo/sunlight-shining-through-a-red-flanders-poppy-floer.jpg?s=612x612&w=0&k=20&c=X7JdJDwSZgneLk8f01bUYuJszw620Y1vWjFbpyUmYEo='),
              child: Container(
                width: 100,
                height: 100,
                color: Colors.orangeAccent,
                child: Center(
                  child: Text('Box'),
                ),
              ),
              onDraggableCanceled: (velocity, offset) {
                print('Drag is canceled. Val: $velocity, Off: $offset');
              },
              feedback: Container(
                width: 150,
                height: 150,
                color: Colors.orangeAccent.withOpacity(0.5),
                child: Center(
                  child: Text(
                    'Box...',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        decoration: TextDecoration.none),
                  ),
                ),
              ),
            ),
            DragTarget(
              onAccept: (Widget imageWidget) {
                // caughtColor = color;
                imageWidgetData = imageWidget;
              },
              builder: (context, accepted, rejected) {
                return Container(
                  width: 200,
                  height: 200,
                  // color: accepted.isEmpty ? caughtColor : Colors.grey.shade200,
                  child: accepted.isEmpty
                      ? imageWidgetData
                      : Center(
                          child: Text('Drag here..'),
                        ),
                );
              },
              onWillAccept: (data) {
                return true;
              },
            )
          ],
        ),
      ),
    );
  }
}
