import 'dart:async';
import 'dart:ffi';
import 'dart:math';

import 'package:semaforo_tarea/services/mockapi.dart';
import 'package:flutter/material.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  double _width = 0;
  int resultado = 0;
  bool _textoActivo = false;
  Color _color = Colors.yellowAccent;
  bool _isExpanded = false;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.grey.shade400,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Ink(
              width: 100,
              height: 100,
              decoration: const ShapeDecoration(
                color: Colors.yellowAccent,
                shape: CircleBorder(),
              ),
              child: IconButton(
                icon: Icon(
                  Icons.airplanemode_on_outlined,
                  color: Colors.black,
                  size: 50.0,
                ),
                color: Colors.white,
                onPressed: () async {
                  _toggleExpand();
                  resultado = await MockApi().getFerrariInteger() as int;
                  refresh();
                  await Future.delayed(Duration(seconds: 1));

                  _textoActivo = true;

                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(
                  8.0),
              child: Text(""),
            ),
            AnimatedContainer(
              width: _isExpanded ? _width : _width,
              height: 15,

              decoration: BoxDecoration(
                color: _color,
              ),
              duration: Duration(seconds: _isExpanded ? 1 : 0),
            ),
            Padding(
              padding: EdgeInsets.all(
                  4.0),
              child: Text(""),
            ),
            Text(
              '${result().toString()}',
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.lightGreenAccent),
            ),
          ],
        ));
  }

  refresh() {
    setState(() {
      _width = 0;
      _isExpanded = false;
    });
  }

  _toggleExpand() {
    setState(() {
      _isExpanded = !_isExpanded;
      _width = 350;
    });
  }

  result() {
    return resultado;
  }
}
