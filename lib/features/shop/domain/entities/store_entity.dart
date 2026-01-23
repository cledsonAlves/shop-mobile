import 'package:freezed_annotation/freezed_annotation.dart';

part 'store_entity.freezed.dart';

@freezed
class StoreEntity with _$StoreEntity {
  const factory StoreEntity({
    required String id,
    required String name,
    required String category,
    required String imageUrl,
    required double rating,
    required String deliveryTime,
    required double deliveryFee,
    String? description,
    String? address,
    String? phone,
    String? whatsapp,
    String? email,
    String? cityId,
    String? cep,
    String? bairro,
    String? horarioFuncionamento,
    @Default(true) bool isOpen,
  }) = _StoreEntity;
}
