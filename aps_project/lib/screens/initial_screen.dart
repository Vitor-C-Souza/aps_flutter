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
              'Liberdade',
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRt_-wPiRvD0FS2DY-Jdb7PKIHjeGVdfqx4eygB_QDhDA&s',
              '11535050'),
          Location(
              'Liberdade',
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRt_-wPiRvD0FS2DY-Jdb7PKIHjeGVdfqx4eygB_QDhDA&s',
              '11535050'),
        ]));
  }
}

class Location extends StatefulWidget {
  final String nome;
  final String picture;
  final String cep;

  const Location(this.nome, this.picture, this.cep, {Key? key}) : super(key: key);

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
                            onPressed: () {},
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
