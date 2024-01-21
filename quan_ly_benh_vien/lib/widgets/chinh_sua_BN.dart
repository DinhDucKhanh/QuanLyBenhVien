import 'package:provider/provider.dart';
import 'package:quan_ly_benh_vien/models/benh_nhan.dart';
import 'package:flutter/material.dart';
import 'package:quan_ly_benh_vien/models/user_interface.dart';
class ChinhSuaBenhNhan extends StatefulWidget{
  BenhNhan bn;
  ChinhSuaBenhNhan({required this.bn,});
  @override
  State<ChinhSuaBenhNhan> createState() => _ChinhSuaBenhNhanState();
}
class _ChinhSuaBenhNhanState extends State<ChinhSuaBenhNhan>{
  TextEditingController maController = TextEditingController();
  TextEditingController hoVaTenController = TextEditingController();
  TextEditingController ngayNhapVienController = TextEditingController();
  TextEditingController phongDieuTriController = TextEditingController();
  TextEditingController loaiBenhController = TextEditingController();
  @override
  Widget build(BuildContext context){
    maController = TextEditingController(text: widget.bn.ma.toString());
    hoVaTenController = TextEditingController(text: widget.bn.hoVaTen);
    ngayNhapVienController = TextEditingController(text: widget.bn.ngayNhapVien.toString());
    phongDieuTriController = TextEditingController(text: widget.bn.phongDieuTri);
    loaiBenhController = TextEditingController(text: widget.bn.loaiBenh);
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
                    TextButton(
                      child: Text('Chỉnh sửa'),
                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blue)),
                      onPressed: (){
                        BenhNhan updatedBenhNhan = BenhNhan(
                          ma: int.parse(maController.text),
                          hoVaTen: hoVaTenController.text,
                          ngayNhapVien: DateTime.parse(ngayNhapVienController.text),
                          phongDieuTri: phongDieuTriController.text,
                          loaiBenh: loaiBenhController.text,
                        );

                        Navigator.pop(context, updatedBenhNhan);
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