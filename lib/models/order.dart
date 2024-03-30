
import 'package:ecommerceadmin/models/address.dart';
import 'package:ecommerceadmin/models/cartitem.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'order.freezed.dart';
part 'order.g.dart';
@freezed
abstract class Orders with _$Orders {
    @JsonSerializable(explicitToJson: true)
  factory Orders(
      { String? uid,
      required List<CartItem> products,
      required double total,
      required String orderId,
      required AddressModel address,
      bool? isAccepted,
      bool? isCancelled,
      bool? isDelivered,
      required DateTime date}) = _Orders;
  factory Orders.fromJson(Map<String, dynamic> json) => _$OrdersFromJson(json);
}