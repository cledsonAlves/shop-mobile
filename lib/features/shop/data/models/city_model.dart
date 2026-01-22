import 'package:freezed_annotation/freezed_annotation.dart';

part 'city_model.freezed.dart';
part 'city_model.g.dart';

@freezed
class CityModel with _$CityModel {
  const CityModel._();

  const factory CityModel({
    required String id,
    required String nome,
    required String estado,
    @JsonKey(name: 'codigo_ibge') String? codigoIbge,
    @Default(true) bool ativo,
    @JsonKey(name: 'criado_em') String? criadoEm,
    @JsonKey(name: 'atualizado_em') String? atualizadoEm,
  }) = _CityModel;

  factory CityModel.fromJson(Map<String, dynamic> json) =>
      _$CityModelFromJson(json);

  /// Nome completo da cidade com estado
  String get displayName => '$nome - $estado';
}
