// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Product _$$_ProductFromJson(Map<String, dynamic> json) => _$_Product(
      id: json['id'] as String?,
      product_name: json['product_name'] as String,
      photo_src_link: json['photo_src_link'] as String,
      price: json['price'] as int,
      description: json['description'] as String,
    );

Map<String, dynamic> _$$_ProductToJson(_$_Product instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product_name': instance.product_name,
      'photo_src_link': instance.photo_src_link,
      'price': instance.price,
      'description': instance.description,
    };
