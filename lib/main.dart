// Desenvolvido por Yohans Silva
import 'package:flutter/material.dart';

void main() {
  runApp(const MeuAppTurismo());
}

class PontoTuristico {
  final String nome;
  final String cidade;
  final String imagemUrl;
  final String descricao;
  bool favorito;

  PontoTuristico({
    required this.nome,
    required this.cidade,
    required this.imagemUrl,
    required this.descricao,
    this.favorito = false,
  });
}

class MeuAppTurismo extends StatelessWidget {
  const MeuAppTurismo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Turismo Baixada Santista',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const TelaPrincipal(),
    );
  }
}

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({super.key});

  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  final List<PontoTuristico> _pontosTuristicos = [
    PontoTuristico(
      nome: 'Jardim da Orla de Santos',
      cidade: 'Santos',
      imagemUrl: 'assets/images/orlaSantos.jpg',
      descricao: 'O maior jardim de orla de praia do mundo em extensao, registrado no Guiness Book.',
    ),
    PontoTuristico(
      nome: 'Aquario Municipal de Santos',
      cidade: 'Santos',
      imagemUrl: 'assets/images/aquario.jpg',
      descricao: 'Primeiro aquario publico do Brasil, abrigando centenas de especies marinhas.',
    ),
    PontoTuristico(
      nome: 'Teleferico de Sao Vicente',
      cidade: 'Sao Vicente',
      imagemUrl: 'assets/images/teleferico.jpg',
      descricao: 'Liga a Praia do Itarare ao Morro do Voturua proporcionando vista panoramica.',
    ),
    PontoTuristico(
      nome: 'Praia do Tombo',
      cidade: 'Guaruja',
      imagemUrl: 'assets/images/praia-do-tombo.jpg',
      descricao: 'Famosa pelas ondas ideais para o surf e certificada com a Bandeira Azul.',
    ),
    PontoTuristico(
      nome: 'Fortaleza de Santo Amaro da Barra Grande',
      cidade: 'Guaruja',
      imagemUrl: 'assets/images/fortaleza.jpg',
      descricao: 'Monumento historico construido no seculo XVI para defesa da regiao.',
    ),
    PontoTuristico(
      nome: 'Parque Estadual Xixova-Japui',
      cidade: 'Praia Grande',
      imagemUrl: 'assets/images/Xixová-Japuí.jpg',
      descricao: 'Unidade de conservacao que preserva trechos remanescentes da Mata Atlantica.',
    ),
    PontoTuristico(
      nome: 'Ruinas do Abarebebe',
      cidade: 'Peruibe',
      imagemUrl: 'assets/images/Ruinas_do_Abarebebe_1.jpg',
      descricao: 'Sitio arqueologico com as ruinas de uma das primeiras igrejas do Brasil.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Guia Baixada por Yohans Silva'),
        backgroundColor: const Color.fromARGB(255, 27, 61, 58),
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 700),
          child: ListView.builder(
            itemCount: _pontosTuristicos.length,
            itemBuilder: (context, index) {
              final ponto = _pontosTuristicos[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        ponto.imagemUrl, 
                        height: 200, 
                        width: double.infinity, 
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(height: 10),
                      Text(ponto.nome, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 4),
                      Text('Cidade: ${ponto.cidade}', style: const TextStyle(color: Colors.teal, fontWeight: FontWeight.w600)),
                      const SizedBox(height: 8),
                      Text(ponto.descricao),
                      const Divider(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                value: ponto.favorito,
                                onChanged: (bool? valor) {
                                  setState(() {
                                    ponto.favorito = valor ?? false;
                                  });
                                },
                              ),
                              const Text('Favorito'),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}