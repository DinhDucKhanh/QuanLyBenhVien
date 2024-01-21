import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:quan_ly_benh_vien/models/ds_benh_nhan.dart';
import 'package:quan_ly_benh_vien/models/benh_nhan.dart';
import 'package:quan_ly_benh_vien/models/user_interface.dart';
class ThemBenhNhan extends StatefulWidget{
  @override
  State<ThemBenhNhan> createState() => _ThemBenhNhanStae();
}
class _ThemBenhNhanStae extends State<ThemBenhNhan>{
  final maController = TextEditingController();
  final hoVaTenController = TextEditingController();
  final phongDieuTriController = TextEditingController();
  final loaiBenhController = TextEditingController();
  @override
  Widget build(BuildContext context){
    return Consumer<UserInterface>(
        builder: (context, ui, child){
          return Scaffold(
            appBar: AppBar(
              title: Text('Thêm bệnh nhân', style: TextStyle(color: Colors.white),),
              backgroundColor: ui.appBarColor,
              iconTheme: IconThemeData(
                  color: Colors.white,
              ),
            ),
            body: Consumer<Ds_benh_nhan>(
              builder: (context, danhsachbenhnhan, child){
                return Card(
                  elevation: 5,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        TextField(
                          decoration: InputDecoration(labelText: 'Mã bệnh nhân'),
                          controller: maController,
                        ),
                        TextField(
                          decoration: InputDecoration(labelText: 'Họ và tên'),
                          controller: hoVaTenController,
                        ),
                        TextField(
                          decoration: InputDecoration(labelText: 'Phòng điều trị'),
                          controller: phongDieuTriController,
                        ),
                        TextField(
                          decoration: InputDecoration(labelText: 'Loại bệnh'),
                          controller: loaiBenhController,
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: TextButton(
                            child: Text('Thêm bệnh nhân', style: TextStyle(color: Colors.white),),
                            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blue)),
                            onPressed: (){
                              BenhNhan newBN = BenhNhan(
                                ma: int.parse(maController.text),
                                hoVaTen: hoVaTenController.text,
                                ngayNhapVien: DateTime.now(),
                                phongDieuTri: phongDieuTriController.text,
                                loaiBenh: loaiBenhController.text,
                              );
                              Navigator.pop(context, newBN);
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