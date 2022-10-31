import 'package:aps_project/screens/data_screen.dart';
import 'package:flutter/material.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Container(),
          title: const Text('Lugares'),
        ),
        body: ListView(children: const [
          Location(
              'Instuto EcoFaxina',
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRt_-wPiRvD0FS2DY-Jdb7PKIHjeGVdfqx4eygB_QDhDA&s',
              '11025-010','O Instituto Ecofaxina foi criado em 2008 pelo seu atual presidente, Willian Schepis, como um projeto pequeno desenvolvido por ele e outros alunos da Unisanta no curso de Biologia marinha. O projeto foi crescendo logo após sua criação, com uma motivação inicial de reduzir ao máximo a quantidade de resíduos disponíveis no estuário (conjunto das praias e mangues) de Santos, combater a poluição marinha e dar visibilidade a este problema e como o mesmo impacta não só na questão ambiental, mas também no âmbito social.'),
          Location(
              'Praiamar Shopping',
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRt_-wPiRvD0FS2DY-Jdb7PKIHjeGVdfqx4eygB_QDhDA&s',
              '11025202', 'O Praiamar Shopping é um dos locais de lazer mais conhecidos e visitados de Santos. Situado no bairro da Aparecida, o local possui uma solução sustentável em relação à água que utiliza, pois usam água de reuso. Segundo Valdez, o projeto foi implementado em 2015, onde seu intuito inicial além de economizar água, era também economizar dinheiro'),
        ]));
  }
}

class Location extends StatefulWidget {
  final String nome;
  final String picture;
  final String cep;
  final String descricao;

  const Location(this.nome, this.picture, this.cep,this.descricao, {Key? key})
      : super(key: key);

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  bool assetOrNetwork() {
    if (widget.picture.contains('http')) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(),
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.greenAccent,
                ),
                height: 140,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.black26,
                      ),
                      width: 72,
                      height: 140,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: assetOrNetwork()
                            ? Image.asset(
                                widget.picture,
                                fit: BoxFit.cover,
                              )
                            : Image.network(
                                widget.picture,
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: 200,
                          child: Text(
                            widget.nome,
                            style: const TextStyle(
                              fontSize: 24,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 52,
                          height: 52,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (contextNew) =>
                                          DataLocation(widget.cep,widget.descricao)));
                            },
                            child: const Icon(Icons.account_balance),
                          ),
                        ),
                        Container(
                          width: 30,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
