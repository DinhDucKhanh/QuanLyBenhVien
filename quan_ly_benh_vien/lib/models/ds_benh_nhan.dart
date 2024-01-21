import 'package:flutter/cupertino.dart';
import 'package:quan_ly_benh_vien/models/benh_nhan.dart';
class Ds_benh_nhan extends ChangeNotifier{
  List<BenhNhan> _danhSachBenhNhan = [
    BenhNhan(
        ma : 1234,
        hoVaTen : "Nguyen Thi Huong",
        ngayNhapVien : DateTime(2023, 8, 20),
        phongDieuTri : "605",
        loaiBenh: "Ung thư"
    ),
    BenhNhan(
        ma : 1235,
        hoVaTen : "Pham Minh Hieu",
        ngayNhapVien : DateTime(2023, 10, 20),
        phongDieuTri : "503",
        loaiBenh: "Bê đê"
    ),
  ];
  void addBN(BenhNhan bn){
    _danhSachBenhNhan.add(bn);
  }
  void removeBN(BenhNhan bn){
    _danhSachBenhNhan.remove(bn);
  }
  void suaBN(BenhNhan bn){
    int index = _danhSachBenhNhan.indexWhere((element) => element.ma == bn.ma);
    if (index != -1) {
      _danhSachBenhNhan[index] = bn;
    }
  }
  List<BenhNhan> get ds_benh_nhan => _danhSachBenhNhan;
}