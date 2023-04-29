void main() {
  final pessoas = [
    'Caio|19|Masculino',
    'Francielle|18|Feminino',
    'Carlo|2|Masculino',
    'Carlo|2|Masculino',
    'Maria|32|Feminino',
    'Roberto|55|Masculino',
    'Walter|24|Masculino',
    'Caio|19|Masculino',
    'Francisca|11|Feminino',
    'Victor|30|Masculino',
    'Mozart|115|Masculino',
    'Vitória|20|Feminino',
    'Lucas|17|Masculino',
    'Roberto|55|Masculino',
    'Teresa|60|Feminino',
    'Alda|82|Feminino',
    'Beatriz|22|Feminino',
    'Victor|30|Masculino',
    'Elizabeth|4|Feminino',
  ];
  print('Pacientes: ');
  print(pessoas);
  print('');
  // Remover os pacientes duplicados e apresentar uma nova lista
  print('Removendo os pacientes duplicados do sistema...');
  final pessoaSemDuplicacao = pessoas.toSet().map((e) => e.split('|')).toList();
  pessoaSemDuplicacao.forEach((p) => print(p[0]));
  print('');

  // Mostrar a quantidade de pessoas por sexo
  final mapSexo = <String, List<String>> {};
    for (var pessoa in pessoaSemDuplicacao) {
      final sexo = pessoa[2].toLowerCase();
      final listaMasculino = mapSexo['M'] ?? <String>[];
      final listaFeminino = mapSexo['F'] ?? <String>[];


      if (sexo == 'masculino') {
        listaMasculino.add(pessoa[0]);
      }
      if (sexo == 'feminino') {
        listaFeminino.add(pessoa[0]);
      }

      mapSexo['M'] = listaMasculino;
      mapSexo['F'] = listaFeminino;
    }

    print('');
    final masculino = mapSexo['M'] ?? <String>[];
    final feminino = mapSexo['F'] ?? <String>[];
    print('Mostrando quantidade de pessoas por sexo');
    print('Masculino: ${masculino.length}');
    masculino.forEach(print);
    print('');
    print('Feminino: ${feminino.length}');
    feminino.forEach(print);
    print('');
  
  // Filtrar para pessoas maiores de 18 anos e mostrar o nome
  final maiorDe18 = pessoaSemDuplicacao.where((p){
    final idade = int.tryParse(p[1]) ?? 0;
    return idade >= 18;
  }).toList();
  print('Pessoas maiores de 18 anos: ');
  maiorDe18.forEach((p) => print(p[0]));
  print('');

  // Encontrar a pessoa mais velha da lista
  final pessoaOrdenada = [...pessoaSemDuplicacao];
  pessoaOrdenada.sort((i1, i2) {
    final idadeI1 = int.tryParse(i1[1]) ?? 0;
    final idadeI2 = int.tryParse(i2[1]) ?? 0;

    return idadeI1.compareTo(idadeI2);
  });

  final pessoaMaisVelha = pessoaOrdenada.last;
  final pessoaMaisNova = pessoaOrdenada.first;

  print('A pessoa mais velha da lista é ${pessoaMaisVelha[0]} e tem ${pessoaMaisVelha[1]} anos de idade.');
  print('');
  print('A pessoa mais nova é ${pessoaMaisNova[0]} e tem ${pessoaMaisNova[1]} anos');
  print('');
}