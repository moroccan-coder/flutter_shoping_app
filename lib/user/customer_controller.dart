
import 'package:flutter_shoping/order/base_order.dart';
import 'package:flutter_shoping/product/base_product.dart';
import 'package:flutter_shoping/user/customer.dart';
import 'package:flutter_shoping/user/userr.dart';

class CustomerController{

  Customer user;

  CustomerController(this.user);



  void addToOrders(BaseOrder order) {
    user.orders.add(order);
  }

  void addToWatchList(BaseProduct product) {
    user.watchList.add(product);
  }


  bool orderInOrders(BaseOrder order)
  {
    return user.orders.contains(order);
  }

  bool productInWAtchList(BaseProduct product)
  {
    return user.watchList.contains(product);
  }


  bool removeProductFromWatchList(BaseProduct product)
  {
    return user.watchList.remove(product);
  }
}