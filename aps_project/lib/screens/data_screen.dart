import 'dart:convert';

import 'package:aps_project/components/dados_field.dart';
import 'package:aps_project/model/cep.dart';
import 'package:flutter/material.dart';


class DataLocation extends StatefulWidget {
  final String cep;
  final String descricao;

  const DataLocation(this.cep,this.descricao, {Key? key}) : super(key: key);



  @override
  State<DataLocation> createState() => _DataLocationState();
}

class _DataLocationState extends State<DataLocation> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Dados do lugar',
          style: TextStyle(color: Colors.green),
        ),
      ),

      body: BodyField(widget.cep, widget.descricao),


  );
  }



  }




