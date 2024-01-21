import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:quan_ly_benh_vien/models/ds_phong_dt.dart';
import 'package:quan_ly_benh_vien/models/phong_dt.dart';
import 'package:quan_ly_benh_vien/models/user_interface.dart';
class ThemPhong extends StatefulWidget{
  @override
  State<ThemPhong> createState() => _ThemPhongStae();
}
class _ThemPhongStae extends State<ThemPhong>{
  final maPhongController = TextEditingController();
  final tenPhongController = TextEditingController();
  final soBenhNhanController = TextEditingController();
  final loaiPhongController = TextEditingController();
  final thietBiController = TextEditingController();
  @override
  Widget build(BuildContext context){
    return Consumer<UserInterface>(
        builder: (context, ui, child){
          return Scaffold(
            backgroundColor: ui.BackgroundColor,
            appBar: AppBar(
              title: Text('Thêm Phòng điều trị', style: TextStyle(color: Colors.white),),
              backgroundColor: ui.appBarColor,
              iconTheme: IconThemeData(
                  color: Colors.white
              ),
            ),
            body: Consumer<Ds_Phong>(
              builder: (context, danhsachPhong, child){
                return Card(
                  elevation: 5,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        TextField(
                          decoration: InputDecoration(labelText: 'Mã phòng điều trị'),
                          controller: maPhongController,
                        ),
                        TextField(
                          decoration: InputDecoration(labelText: 'Tên Phòng'),
                          controller: tenPhongController,
                        ),
                        TextField(
                          decoration: InputDecoration(labelText: 'Số bệnh nhân trong phòng'),
                          controller: soBenhNhanController,
                        ),
                        TextField(
                          decoration: InputDecoration(labelText: 'Loại phòng điều trị'),
                          controller: loaiPhongController,
                        ),
                        TextField(
                          decoration: InputDecoration(labelText: 'Số thiết bị điều trị'),
                          controller: thietBiController,
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: TextButton(
                            child: Text('Thêm phòng', style: TextStyle(color: Colors.white),),
                            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blue)),
                            onPressed: (){
                              Phong newPhong = Phong(
                                maPhong: int.parse(maPhongController.text),
                                tenPhong: tenPhongController.text,
                                soBenhNhan: int.parse(soBenhNhanController.text),
                                loaiPhong: loaiPhongController.text,
                                thietBi: int.parse(thietBiController.text),
                              );
                              Navigator.pop(context, newPhong);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        }
    );
  }
}