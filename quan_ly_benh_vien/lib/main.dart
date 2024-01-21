import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import "/models/user_interface.dart";
import 'package:quan_ly_benh_vien/models/ds_benh_nhan.dart';
import 'package:quan_ly_benh_vien/models/ds_phong_dt.dart';
import 'package:quan_ly_benh_vien/widgets/bottom_nav.dart';
/// Flutter code sample for [NavigationBar].

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build (BuildContext context){
    return MultiProvider(
        providers:[
          ChangeNotifierProvider(create: (context) => UserInterface()),
          ChangeNotifierProvider(create: (context) => Ds_benh_nhan()),
          ChangeNotifierProvider(create: (context) => Ds_Phong()),
        ],
        child: NavigationBarApp(),

    );
  }
}
