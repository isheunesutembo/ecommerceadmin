import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceadmin/constants/firebaseconstants.dart';
import 'package:ecommerceadmin/models/payment.dart';
import 'package:ecommerceadmin/providers/firebaseproviders.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
final paymentServiceProvider=Provider((ref)=>PaymentsService(firestore:ref.watch(firebaseFirestoreProvider) ));
class PaymentsService{
   final FirebaseFirestore _firestore;

  PaymentsService({required FirebaseFirestore firestore})
  :_firestore=firestore;
  
  CollectionReference get _payments=>_firestore
  .collection(FirebaseConstants.paymentsCollection);

  Stream< List<Payment>>getPayments(){
    return _payments.snapshots().map((event) {
     List<Payment>payments=[];
     for(var doc in event.docs){
      payments.add(Payment.fromJson(doc.data()as Map<String,dynamic>));
     }
     return payments;
    });

  }
}