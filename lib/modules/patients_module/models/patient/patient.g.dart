// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PatientImpl _$$PatientImplFromJson(Map<String, dynamic> json) =>
    _$PatientImpl(
      id: (json['id'] as num?)?.toInt(),
      title: (json['title'] as num?)?.toInt(),
      name: json['name'] as String?,
      email: json['email'] as String?,
      mobile: json['mobile'] as String?,
      gender: json['gender'] as String?,
      dob: json['dob'] as String?,
      time: json['time'] as String?,
      userId: json['user_id'] as String?,
      doctorId: json['doctor_id'] as String?,
      self: json['self'] as String?,
      state: json['state'] as String?,
      address: json['address'] as String?,
      zip: json['zip'] as String?,
      timeSlot: json['time_slot'] as String?,
      status: json['status'] as String?,
      disOrder: json['dis_order'] as String?,
      paymentStatus: json['payment_status'] as String?,
      orderId: json['order_id'] as String?,
      txnId: json['txn_id'] as String?,
      paymentMode: json['payment_mode'] as String?,
      totalAmount: json['total_amount'] as String?,
      discount: json['discount'] as String?,
      oVStatus: json['o_v_status'] as String?,
      height: (json['height'] as num?)?.toInt(),
      weight: (json['weight'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$PatientImplToJson(_$PatientImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'name': instance.name,
      'email': instance.email,
      'mobile': instance.mobile,
      'gender': instance.gender,
      'dob': instance.dob,
      'time': instance.time,
      'user_id': instance.userId,
      'doctor_id': instance.doctorId,
      'self': instance.self,
      'state': instance.state,
      'address': instance.address,
      'zip': instance.zip,
      'time_slot': instance.timeSlot,
      'status': instance.status,
      'dis_order': instance.disOrder,
      'payment_status': instance.paymentStatus,
      'order_id': instance.orderId,
      'txn_id': instance.txnId,
      'payment_mode': instance.paymentMode,
      'total_amount': instance.totalAmount,
      'discount': instance.discount,
      'o_v_status': instance.oVStatus,
      'height': instance.height,
      'weight': instance.weight,
    };
