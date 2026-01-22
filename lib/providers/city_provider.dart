import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../core/models/city.dart';

// Provider de cidades disponíveis
final citiesProvider = Provider<List<City>>((ref) {
  return citiesList;
});

// Provider do estado da cidade selecionada
final selectedCityProvider = StateProvider<City?>((ref) {
  // Jar inu como padrão
  return citiesList.firstWhere((c) => c.id == 'jarinu');
});
