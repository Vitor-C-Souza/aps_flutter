import 'package:flutter/material.dart';

import 'package:aps_project/services/http_interceptors.dart';
import 'package:http/http.dart' as http;
import 'package:http_interceptor/http/http.dart';
import 'dart:convert';

import '../model/cep.dart';


API api = new API();
class BodyField extends StatefulWidget {
  final String cep;
  //final String descricao;

  BodyField(this.cep,//this.descricao, {Key? key}) : super(key: key);


  String rua = '';
  String cidade = '';
  String bairro = '';
  String estado = '';


  @override
  State<BodyField> createState() => _BodyFieldState();
}

class _BodyFieldState extends State<BodyField> {


  @override
  Widget build(BuildContext context) {

      api.getOne(widget.cep);
      return Container(
      color: Colors.greenAccent,
      child: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ListView(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                      border: UnderlineInputBorder(), labelText: 'CEP'),
                  textAlign: TextAlign.center,
                  initialValue: widget.cep,
                  readOnly: true,

                ),
                TextFormField(
                  decoration: const InputDecoration(
                      border: UnderlineInputBorder(), labelText: 'Rua'),
                  textAlign: TextAlign.center,
                  initialValue: widget.rua,
                  readOnly: true,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      border: UnderlineInputBorder(), labelText: 'Cidade'),
                  textAlign: TextAlign.center,
                  initialValue: widget.cidade,
                  readOnly: true,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      border: UnderlineInputBorder(), labelText: 'Bairro'),
                  textAlign: TextAlign.center,
                  initialValue: widget.bairro,
                  readOnly: true,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      border: UnderlineInputBorder(), labelText: 'Estado'),
                  textAlign: TextAlign.center,
                  initialValue: widget.estado,
                  readOnly: true,
                ),
                // TextFormField(
                //   decoration: const InputDecoration(
                //       border: UnderlineInputBorder(), labelText: 'descrição'),
                //   textAlign: TextAlign.center,
                //   initialValue: widget.descricao,
                //   readOnly: true,
                //   keyboardType: TextInputType.multiline,
                //   maxLines: null,
                // ),
              ],
            ),
          ],
        ),
      ),
      );


}
  void refresh(rua, estado, cidade, bairro) async{
      List<Cep> listcep = await api.getOne(widget.cep);

      setState(() {
        widget.rua = rua;
        widget.estado = estado;
        widget.cidade = cidade;
        widget.bairro = bairro;
      });
  }

}






class API {
  http.Client client = InterceptedClient.build(
    interceptors: [LoggingInterceptor()],
  );

  String url(_cep) {
    var cep = _cep;
    String url = "https://viacep.com.br/ws/";
    String resource = '$cep/json/';

    url = '$url$resource';

    return url;
  }

  Uri getUri(cep) {
    return Uri.parse(url(cep));
  }

  Future<List<Cep>> getOne(cep) async {
    http.Response response = await client.get(getUri(cep));

    if (response.statusCode != 200) {
      throw Exception();
    }

    List<Cep> result = [];

    result.add(Cep.fromJson(json.decode(response.body)));

    print(result[0].logradouro);


    return result;
  }
}
