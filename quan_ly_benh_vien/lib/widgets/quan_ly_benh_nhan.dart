import 'package:flutter/foundation.dart';
import 'package:quan_ly_benh_vien/models/ds_benh_nhan.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/benh_nhan.dart';
import 'package:quan_ly_benh_vien/widgets/them_benh_nhan.dart';
import 'package:quan_ly_benh_vien/widgets/chinh_sua_BN.dart';
import 'package:quan_ly_benh_vien/models/user_interface.dart';

class QuanLyBenhNhan extends StatefulWidget {
  @override
  State<QuanLyBenhNhan> createState() => _QuanLyBenhNhanState();
}

class _QuanLyBenhNhanState extends State<QuanLyBenhNhan> {
  @override
  Size get preferredSize => Size(40.0, 60.0);
  Widget build(BuildContext context) {
    return Consumer<UserInterface>(
        builder: (context, ui , child){
          return Scaffold(
            backgroundColor: ui.BackgroundColor,
            appBar: AppBar(
              title: Text('Bệnh nhân', style: TextStyle(color: Colors.white),),
              backgroundColor: ui.appBarColor,
              iconTheme: IconThemeData(
                  color: Colors.white
              ),
            ),
            body: Consumer<Ds_benh_nhan>(
              builder: (context, danhSachBenhNhan, child){
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top:25, bottom: 15, left: 15),
                          child: ElevatedButton(onPressed: () async{
                            BenhNhan newBN = await Navigator.push(context, MaterialPageRoute(builder: (context) => ThemBenhNhan()));
                            if(newBN != null){
                              setState(() {
                                danhSachBenhNhan.addBN(newBN);
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
                      children: danhSachBenhNhan.ds_benh_nhan.map((bn) {
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
                                          bn.phongDieuTri.toString(),
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
                                          bn.ma.toString() + ' - ' + bn.hoVaTen,
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),
                                        Text(
                                          'Loại bệnh: ' + bn.loaiBenh,
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),
                                        Text(
                                          bn.ngayNhapVien.toString(),
                                          style: TextStyle(
                                            color: Colors.grey,
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      child: IconButton (onPressed: () async{
                                        BenhNhan updateBN = await Navigator.push(context, MaterialPageRoute(builder: (context) => ChinhSuaBenhNhan(bn: bn)));
                                        if(updateBN != null){
                                          setState(() {
                                            danhSachBenhNhan.suaBN(updateBN);
                                          });
                                        }
                                      },
                                        tooltip: 'Chỉnh sửa',
                                        icon: Icon(Icons.edit, color: Colors.blue,),),
                                    ),
                                    Container(
                                      child: IconButton(onPressed: (){
                                        setState(() {
                                          danhSachBenhNhan.removeBN(bn);
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
