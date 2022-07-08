// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductModel _$$_ProductModelFromJson(Map<String, dynamic> json) =>
    _$_ProductModel(
      id: json['id'] as int,
      storeId: json['store_id'] as int,
      name: json['name'] as String,
      price: json['price'] as int,
      stock: json['stock'] as int? ?? 0,
      description: json['description'] as String?,
      reducePrice: json['reduce_price'] as int?,
      code: json['code'] as String?,
      cost: json['cost'] as int?,
      minStock: json['min_stock'] as int?,
      unit: json['unit'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$_ProductModelToJson(_$_ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'store_id': instance.storeId,
      'name': instance.name,
      'price': instance.price,
      'stock': instance.stock,
      'description': instance.description,
      'reduce_price': instance.reducePrice,
      'code': instance.code,
      'cost': instance.cost,
      'min_stock': instance.minStock,
      'unit': instance.unit,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
