import 'package:flutter/foundation.dart';
import 'package:quan_ly_benh_vien/models/user_interface.dart';
import 'package:quan_ly_benh_vien/models/ds_phong_dt.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/phong_dt.dart';
import 'package:quan_ly_benh_vien/widgets/them_phong.dart';
import 'package:quan_ly_benh_vien/widgets/chinh_sua_phong.dart';

class QuanLyPhong extends StatefulWidget {
  @override
  State<QuanLyPhong> createState() => _QuanLyPhongState();
}

class _QuanLyPhongState extends State<QuanLyPhong> {
  @override
  Widget build(BuildContext context) {
    return Consumer<UserInterface>(
        builder: (context, ui, child){
          return Scaffold(
            backgroundColor: Color(0xFFEDEDED),
            appBar: AppBar(
              title: Text('Phòng điều trị', style: TextStyle(color: Colors.white),),
              backgroundColor: ui.appBarColor,
              iconTheme: IconThemeData(
                  color: Colors.white
              ),
            ),
            body: Consumer<Ds_Phong>(
              builder: (context, danhSachPhong, child){
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top:25, bottom: 15, left: 15),
                          child: ElevatedButton(onPressed: () async{
                            Phong newPhong = await Navigator.push(context, MaterialPageRoute(builder: (context) => ThemPhong()));
                            if(newPhong != null){
                              setState(() {
                                danhSachPhong.addPhong(newPhong);
                              });
                            }
                          },
                            child: Text('Thêm', style: TextStyle(color: Colors.blue),), style: ElevatedButton.styleFrom(backgroundColor: Colors.white, ),),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 15),
                          width: 200,
                          height: 30,
                          child: SearchBar(
                            padding: const MaterialStatePropertyAll<EdgeInsets>(
                                EdgeInsets.symmetric(horizontal: 4)),
                            onTap: () {

                            },
                            onChanged: (_) {

                            },
                            leading: const Icon(Icons.search, color: Colors.blue,),
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: danhSachPhong.ds_phong.map((phong) {
                        return Container(
                          margin: EdgeInsets.only(left: 12, right: 12),
                          child: Card(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.symmetric(
                                        vertical: 10,
                                        horizontal: 15,
                                      ),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.blue,
                                            width: 2,
                                          )
                                      ),
                                      padding: EdgeInsets.all(10),
                                      child: Text(
                                          phong.tenPhong,
                                          style: TextStyle (
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            color: Colors.blue,
                                          )
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Số bệnh nhân: ' + phong.soBenhNhan.toString(),
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),
                                        Text(
                                          'Loại phòng: ' + phong.loaiPhong,
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),
                                        Text(
                                          'Số thiết bị y té trong phòng: ' + phong.thietBi.toString(),
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      child: IconButton (onPressed: () async{
                                        Phong updatePhong = await Navigator.push(context, MaterialPageRoute(builder: (context) => ChinhSuaPhong(phong: phong)));
                                        if(updatePhong!= null){
                                          setState(() {
                                            danhSachPhong.suaPhong(updatePhong);
                                          });
                                        }
                                      },
                                        tooltip: 'Chỉnh sửa',
                                        icon: Icon(Icons.edit, color: Colors.blue,),),
                                    ),
                                    Container(
                                      child: IconButton(onPressed: (){
                                        setState(() {
                                          danhSachPhong.removePhong(phong);
                                        });
                                      },
                                        tooltip: 'Xoá',
                                        icon: Icon(Icons.delete_outline, color: Colors.blue,),),
                                    ),
                                  ],
                                ),

                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                );
              },
            ),
          );
        }
    );
  }
}
