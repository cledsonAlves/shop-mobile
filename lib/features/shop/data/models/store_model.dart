import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/store_entity.dart';

part 'store_model.freezed.dart';
part 'store_model.g.dart';

@freezed
class StoreModel with _$StoreModel {
  const StoreModel._();
  
  const factory StoreModel({
    required String id,
    required String nome,
    required String email,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
    String? provider,
    @JsonKey(name: 'cidade_id') String? cidadeId,
    String? telefone,
    String? whatsapp,
    String? endereco,
    String? numero,
    String? complemento,
    String? bairro,
    String? cep,
    String? descricao,
    @JsonKey(name: 'logo_url') String? logoUrl,
    @JsonKey(name: 'horario_funcionamento') String? horarioFuncionamento,
    @Default(true) bool ativo,
    @JsonKey(name: 'criado_em') String? criadoEm,
    @JsonKey(name: 'atualizado_em') String? atualizadoEm,
  }) = _StoreModel;

  factory StoreModel.fromJson(Map<String, dynamic> json) =>
      _$StoreModelFromJson(json);

  StoreEntity toEntity() => StoreEntity(
        id: id,
        name: nome,
        category: 'Geral',
        imageUrl: logoUrl ?? 'https://via.placeholder.com/400x300?text=${Uri.encodeComponent(nome)}',
        rating: 4.5,
        deliveryTime: '30-40 min',
        deliveryFee: 5.0,
        description: descricao,
        address: _buildAddress(),
        phone: whatsapp ?? telefone,
        isOpen: ativo,
        cityId: cidadeId,
      );

  String? _buildAddress() {
    if (endereco == null) return null;
    final parts = <String>[endereco!];
    if (numero != null) parts.add(numero!);
    if (complemento != null) parts.add(complemento!);
    if (bairro != null) parts.add(bairro!);
    return parts.join(', ');
  }
      
  factory StoreModel.fromEntity(StoreEntity entity) => StoreModel(
        id: entity.id,
        nome: entity.name,
        email: '',
        ativo: entity.isOpen,
        cidadeId: entity.cityId,
        descricao: entity.description,
      );
}
