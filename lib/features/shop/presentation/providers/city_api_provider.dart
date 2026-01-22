import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/di/injection_container.dart';
import '../../data/datasources/shop_api.dart';
import '../../data/models/city_model.dart';

/// Provider do ShopApi
final shopApiProvider = Provider<ShopApi>((ref) {
  return getIt<ShopApi>();
});

/// Provider da lista de cidades disponíveis
final citiesApiProvider = FutureProvider<List<CityModel>>((ref) async {
  final api = ref.watch(shopApiProvider);
  final cities = await api.getCities();
  // Ordenar por nome
  cities.sort((a, b) => a.nome.compareTo(b.nome));
  return cities;
});

/// Provider da cidade selecionada
final selectedCityApiProvider = StateProvider<CityModel?>((ref) {
  return null; // Será inicializado quando as cidades forem carregadas
});

/// Provider para inicializar a cidade selecionada
final initSelectedCityProvider = FutureProvider<CityModel?>((ref) async {
  final cities = await ref.watch(citiesApiProvider.future);
  final selectedCity = ref.read(selectedCityApiProvider);
  
  if (selectedCity == null && cities.isNotEmpty) {
    // Procura por Jarinu primeiro, se não encontrar usa a primeira
    final jarinu = cities.where((c) => c.nome.toLowerCase() == 'jarinu').firstOrNull;
    final cityToSelect = jarinu ?? cities.first;
    
    // Atualiza o provider
    ref.read(selectedCityApiProvider.notifier).state = cityToSelect;
    return cityToSelect;
  }
  
  return selectedCity;
});

/// Provider para buscar cidade por ID
final cityByIdProvider = FutureProvider.family<CityModel?, String>((ref, id) async {
  final cities = await ref.watch(citiesApiProvider.future);
  try {
    return cities.firstWhere((c) => c.id == id);
  } catch (e) {
    return null;
  }
});
