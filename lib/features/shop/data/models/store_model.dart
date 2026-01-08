import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/store_entity.dart';

part 'store_model.freezed.dart';
part 'store_model.g.dart';

@freezed
class StoreModel with _$StoreModel {
  const StoreModel._();
  
  const factory StoreModel({
    required String id,
    required String name,
    required String category,
    @JsonKey(name: 'image_url') required String imageUrl,
    required double rating,
    @JsonKey(name: 'delivery_time') required String deliveryTime,
    @JsonKey(name: 'delivery_fee') required double deliveryFee,
    String? description,
    String? address,
    String? phone,
    @JsonKey(name: 'is_open') @Default(true) bool isOpen,
  }) = _StoreModel;

  factory StoreModel.fromJson(Map<String, dynamic> json) =>
      _$StoreModelFromJson(json);

  StoreEntity toEntity() => StoreEntity(
        id: id,
        name: name,
        category: category,
        imageUrl: imageUrl,
        rating: rating,
        deliveryTime: deliveryTime,
        deliveryFee: deliveryFee,
        description: description,
        address: address,
        phone: phone,
        isOpen: isOpen,
      );
      
  factory StoreModel.fromEntity(StoreEntity entity) => StoreModel(
        id: entity.id,
        name: entity.name,
        category: entity.category,
        imageUrl: entity.imageUrl,
        rating: entity.rating,
        deliveryTime: entity.deliveryTime,
        deliveryFee: entity.deliveryFee,
        description: entity.description,
        address: entity.address,
        phone: entity.phone,
        isOpen: entity.isOpen,
      );
}
