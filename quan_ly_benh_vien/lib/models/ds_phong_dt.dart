import 'package:flutter/cupertino.dart';
import 'package:quan_ly_benh_vien/models/phong_dt.dart';
class Ds_Phong extends ChangeNotifier{
  List<Phong> _danhSachPhong = [
    Phong(
        maPhong: 1,
        tenPhong : "103",
        soBenhNhan : 10,
        loaiPhong : "Bình thường",
        thietBi: 10
    ),
    Phong(
        maPhong: 2,
        tenPhong : "204",
        soBenhNhan : 2,
        loaiPhong : "Đặc biệt",
        thietBi: 2
    ),
  ];
  void addPhong(Phong phong){
    _danhSachPhong.add(phong);
  }
  void removePhong(Phong phong){
    _danhSachPhong.remove(phong);
  }
  void suaPhong(Phong phong){
    int index = _danhSachPhong.indexWhere((element) => element.maPhong == phong.maPhong);
    if (index != -1) {
      _danhSachPhong[index] = phong;
    }
  }
  List<Phong> get ds_phong => _danhSachPhong;
}