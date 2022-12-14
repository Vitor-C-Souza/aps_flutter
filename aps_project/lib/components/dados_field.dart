import 'package:flutter/material.dart';

import 'package:aps_project/services/http_interceptors.dart';
import 'package:http/http.dart' as http;
import 'package:http_interceptor/http/http.dart';
import 'dart:convert';

import '../model/cep.dart';

class BodyField extends StatefulWidget {
  final String cep;
  final String descricao;
  final String? rua;
  final String? cidade;
  final String? bairro;
  final String? estado;

  const BodyField(this.cep, this.descricao,this.rua,this.cidade,this.bairro,this.estado, {Key? key}) : super(key: key);



  @override
  State<BodyField> createState() => _BodyFieldState();
}

class _BodyFieldState extends State<BodyField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.greenAccent,
      child: Padding(
        padding: const EdgeInsets.all(50.0),
        child: ListView(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                  border: UnderlineInputBorder(), labelText: 'CEP'),
              textAlign: TextAlign.center,
              initialValue: widget.cep,
              readOnly: true,
              keyboardType: TextInputType.multiline,
              maxLines: null,
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
            TextFormField(
              decoration: const InputDecoration(
                  border: UnderlineInputBorder(), labelText: 'Descri????o'),
              textAlign: TextAlign.center,
              initialValue: widget.descricao,
              readOnly: true,
              keyboardType: TextInputType.multiline,
              maxLines: null,
            ),
          ],
        ),
      ),
    );
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

    return result;
  }
}
