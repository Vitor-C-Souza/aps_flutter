import 'package:aps_project/screens/data_screen.dart';
import 'package:flutter/material.dart';

import '../components/dados_field.dart';
import '../model/cep.dart';



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
          backgroundColor: Colors.black,
          leading: Container(),
          title: const Text(
            'Lugares',
            style: TextStyle(color: Colors.green),
          ),
        ),
        body: ListView(children: [
          Location(
            'Instuto EcoFaxina',
            'https://static.wixstatic.com/media/1fafda_963613349e43479597c0d555e36d0263~mv2.png',
            '11025010',
            'O Instituto Ecofaxina foi criado em 2008 pelo seu atual presidente, Willian Schepis, como um projeto pequeno desenvolvido por ele e outros alunos da Unisanta no curso de Biologia marinha. O projeto foi crescendo logo após sua criação, com uma motivação inicial de reduzir ao máximo a quantidade de resíduos disponíveis no estuário (conjunto das praias e mangues) de Santos, combater a poluição marinha e dar visibilidade a este problema e como o mesmo impacta não só na questão ambiental, mas também no âmbito social.',
          ),
          Location(
            'Praiamar Shopping',
            'https://cdn.diariodolitoral.com.br/upload/dn_noticia/2020/05/praiamar_1.jpg',
            '11025202',
            'O Praiamar Shopping é um dos locais de lazer mais conhecidos e visitados de Santos. Situado no bairro da Aparecida, o local possui uma solução sustentável em relação à água que utiliza, pois usam água de reuso. Segundo Valdez, o projeto foi implementado em 2015, onde seu intuito inicial além de economizar água, era também economizar dinheiro',
          ),
        ]));
  }
}

class Location extends StatefulWidget {
  final String nome;
  final String picture;
  final String cep;
  final String descricao;

  Location(this.nome, this.picture, this.cep, this.descricao, {Key? key})
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
  String? rua;
  String? cidade;
  String? bairro;
  String? estado;

  apidata() async {
    API api = new API();
    List<Cep>? listcep = await api.getOne(widget.cep);


    rua = listcep[0].logradouro;
    estado = listcep[0].uf;
    cidade = listcep[0].localidade;
    bairro = listcep[0].bairro;
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
                              setState(() {
                                apidata();
                              });
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (contextNew) => DataLocation(
                                          widget.cep,
                                          widget.descricao,
                                          rua,
                                          estado,
                                          bairro,
                                          cidade)));
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
