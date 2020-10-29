import 'package:flutter_shoping/order/base_order.dart';
import 'package:flutter_shoping/product/base_product.dart';
import 'package:flutter_shoping/user/userr.dart';

class ShopOwner extends Userr {
  List<BaseOrder> orders;
  List<BaseProduct> watchList;

  ShopOwner(String id, String firstName, String lastName, String email,
      String phone, String gender)
      : super(id, firstName, lastName, email, phone, gender);




}
