import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quan_ly_benh_vien/widgets/quan_ly_benh_nhan.dart';
import 'package:quan_ly_benh_vien/widgets/quan_ly_phong_dt.dart';
class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Column(
      children: [
        Card(
          color: Colors.white,
          margin: EdgeInsets.only(top: 50, left: 15, right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset('assets/images/avt.png', width: 90, height: 90, fit: BoxFit.cover),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Xin chào bác sĩ,',style: TextStyle(fontSize: 16),),
                  ),
                  Text('Đinh Đức Khánh', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue),)
                ],
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => QuanLyBenhNhan()));
                },
                child: Card(
                  margin: EdgeInsets.only(top: 10, left: 15, right: 15),
                  child: Container(
                    padding: EdgeInsets.only(top: 16, left: 16),
                    width: 170,
                    height: 180,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.blue, width: 1.0), // Viền màu xám, độ dày 1.0
                            borderRadius: BorderRadius.circular(8.0), // Góc bo tròn
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(6),
                            child: Icon(Icons.account_circle, color: Colors.blue, size: 40,),
                          ),
                        ),
                        Text('Bệnh nhân', style: TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.bold),),
                        Text('10', style: TextStyle(fontSize: 30, color: Colors.blue),),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Row(
                            children: [
                              Icon(Icons.trending_up, size: 16,),
                              Text('10% so với tháng trước', style: TextStyle(fontSize: 10),)
                            ],
                          ),
                        )
                      ],
                    ),
                  ),

                ),
              ),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => QuanLyPhong()));
                },
                child: Card(
                    margin: EdgeInsets.only(top: 10, left: 15, right: 15),
                    child: Container(
                      padding: EdgeInsets.only(top: 16, left: 16),
                      width: 170,
                      height: 180,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Card(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.blue, width: 1.0), // Viền màu xám, độ dày 1.0
                              borderRadius: BorderRadius.circular(8.0), // Góc bo tròn
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(6),
                              child: Icon(Icons.meeting_room, color: Colors.blue, size: 40,),
                            ),
                          ),
                          Text('Phòng bệnh', style: TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.bold),),
                          Text('10', style: TextStyle(fontSize: 30, color: Colors.blue),),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            child: Row(
                              children: [
                                Icon(Icons.trending_up, size: 16,),
                                Text('10% so với tháng trước', style: TextStyle(fontSize: 10),)
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}