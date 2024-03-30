

import 'package:ecommerceadmin/models/order.dart';
import 'package:ecommerceadmin/services/orderservice.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final orderControllerProvider=StateNotifierProvider<OrderController,bool>((ref)=>OrderController(ref: ref, orderService:ref.watch(ordersServiceProvider )));
final getOrdersProvider=StreamProvider((ref){
  final orders=ref.watch(orderControllerProvider.notifier).getOrders();
  return orders;

});


class OrderController extends StateNotifier<bool>{
  final Ref _ref;
  final OrderService _orderService;

  OrderController({required Ref ref,required OrderService orderService}):
  _ref=ref,_orderService=orderService,super(false);

  Stream<List<Orders>>getOrders(){
    return _orderService.getOrders();
  }
  Future<void>updateOrder(Orders order,String field,bool value)async{
   return _orderService.updateOrder(order, field, value);
  }
}