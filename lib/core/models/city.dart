class City {
  final String id;
  final String name;
  final String state;

  const City({
    required this.id,
    required this.name,
    required this.state,
  });
}

// Lista de cidades disponíveis
final citiesList = [
  const City(id: 'jarinu', name: 'Jarinu', state: 'SP'),
  const City(id: 'saopaulo', name: 'São Paulo', state: 'SP'),
  const City(id: 'campinas', name: 'Campinas', state: 'SP'),
  const City(id: 'sorocaba', name: 'Sorocaba', state: 'SP'),
  const City(id: 'jundiai', name: 'Jundiaí', state: 'SP'),
  const City(id: 'itu', name: 'Itu', state: 'SP'),
  const City(id: 'indaiatuba', name: 'Indaiatuba', state: 'SP'),
  const City(id: 'salto', name: 'Salto', state: 'SP'),
];
