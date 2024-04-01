

import 'package:ecommerceadmin/models/payment.dart';
import 'package:ecommerceadmin/services/paymentservice.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
final paymentControllerProvider=StateNotifierProvider<PaymentsController,bool>((ref)=>PaymentsController(ref: ref, paymentService:ref.watch(paymentServiceProvider)));
final getPaymentsStreamProvider=StreamProvider((ref){
  final payments=ref.watch(paymentControllerProvider.notifier).getPayments();
  return payments;

});

class PaymentsController extends StateNotifier<bool>{
  final Ref _ref;
  final PaymentsService _paymentsService;

  PaymentsController({required Ref ref,required PaymentsService paymentService}):
  _ref=ref,_paymentsService=paymentService,super(false);

  Stream<List<Payment>>getPayments(){
    return _paymentsService.getPayments();
  }

}