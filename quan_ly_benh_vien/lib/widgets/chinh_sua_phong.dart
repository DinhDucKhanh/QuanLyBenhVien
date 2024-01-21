import 'package:provider/provider.dart';
import 'package:quan_ly_benh_vien/models/phong_dt.dart';
import 'package:flutter/material.dart';
import 'package:quan_ly_benh_vien/models/user_interface.dart';

class ChinhSuaPhong extends StatefulWidget{
  Phong phong;
  ChinhSuaPhong({required this.phong,});
  @override
  State<ChinhSuaPhong> createState() => _ChinhSuaPhongState();
}
class _ChinhSuaPhongState extends State<ChinhSuaPhong>{
  TextEditingController maPhongController = TextEditingController();
  TextEditingController tenPhongController = TextEditingController();
  TextEditingController soBenhNhanController = TextEditingController();
  TextEditingController loaiPhongController = TextEditingController();
  TextEditingController thietBiController = TextEditingController();
  @override
  Widget build(BuildContext context){
    maPhongController = TextEditingController(text: widget.phong.maPhong.toString());
    tenPhongController = TextEditingController(text: widget.phong.tenPhong);
    soBenhNhanController = TextEditingController(text: widget.phong.soBenhNhan.toString());
    loaiPhongController = TextEditingController(text: widget.phong.loaiPhong);
    thietBiController = TextEditingController(text: widget.phong.thietBi.toString());
    return Consumer<UserInterface>(
        builder: (context, ui, child){
          return Scaffold(
            appBar: AppBar(
              title: Text('Chỉnh sửa', style: TextStyle(color: Colors.white),),
              backgroundColor: ui.appBarColor,
              iconTheme: IconThemeData(
                color: Colors.white,
              ),
            ),
            body: Card(
              elevation: 5,
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextField(
                      decoration: InputDecoration(labelText: 'Tên phòng'),
                      controller: tenPhongController,
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: 'Số bệnh nhân trong phòng điều trị'),
                      controller: soBenhNhanController,
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: 'Loại phòng diều trị'),
                      controller: loaiPhongController,
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: 'Số thiết bị điều trị'),
                      controller: thietBiController,
                    ),
                    TextButton(
                      child: Text('Chỉnh sửa'),
                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blue)),
                      onPressed: (){
                        Phong updatedPhong = Phong(
                          maPhong: int.parse(maPhongController.text),
                          tenPhong: tenPhongController.text,
                          soBenhNhan: int.parse(soBenhNhanController.text),
                          loaiPhong: loaiPhongController.text,
                          thietBi:  int.parse(thietBiController.text),
                        );

                        Navigator.pop(context, updatedPhong);
                      },
                    )
                  ],
                ),
              ),
            ),
          );
        }
    );
  }
}