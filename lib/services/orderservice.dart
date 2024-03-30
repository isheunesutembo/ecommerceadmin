import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceadmin/constants/firebaseconstants.dart';
import 'package:ecommerceadmin/models/order.dart';
import 'package:ecommerceadmin/providers/firebaseproviders.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
final ordersServiceProvider=Provider((ref){
  return OrderService(firestore: ref.watch(firebaseFirestoreProvider));
});
class OrderService{
  final FirebaseFirestore _firestore;

  OrderService({required FirebaseFirestore firestore})
  :_firestore=firestore;
  
  CollectionReference get _orders=>_firestore
  .collection(FirebaseConstants.orderCollection);

  Stream<List<Orders>>getOrders(){

    return _orders.where("isCancelled",isEqualTo: false).
    where("isAccepted",isEqualTo: false)
    .where("isDelivered",isEqualTo: false)
    .snapshots().map((event) {
      List<Orders>orders=[];

      for (var doc in event.docs){
        orders.add(Orders.fromJson(doc.data()as Map<String,dynamic>));
      }
      return orders;
    });
    
    
  }
  Stream<List<Orders>>getAcceptedOrders(){

    return _orders.where("isAccepted",isEqualTo: true).where("isDelivered",isEqualTo: false).snapshots().map((event) {
      List<Orders>orders=[];

      for (var doc in event.docs){
        orders.add(Orders.fromJson(doc.data()as Map<String,dynamic>));
      }
      return orders;
    });
    
    
  }
  Stream<List<Orders>>getDeliveredOrders(){

    return _orders.where("isDelivered",isEqualTo: true).where("isCancelled",isEqualTo: false).snapshots().map((event) {
      List<Orders>orders=[];

      for (var doc in event.docs){
        orders.add(Orders.fromJson(doc.data()as Map<String,dynamic>));
      }
      return orders;
    });
    
    
  }
   Stream<List<Orders>>getCancelledOrders(){

    return _orders.where("isCancelled",isEqualTo: true).snapshots().map((event) {
      List<Orders>orders=[];

      for (var doc in event.docs){
        orders.add(Orders.fromJson(doc.data()as Map<String,dynamic>));
      }
      return orders;
    });
    
    
  }

  Future<void>updateOrder(Orders order,String field,bool value)async{
    _firestore.collection(FirebaseConstants.orderCollection)
    .where("orderId",isEqualTo: order.orderId)
    .get().then((querySnapshot) {
      querySnapshot.docs.first.reference.update({field:value});

    });
  }

}