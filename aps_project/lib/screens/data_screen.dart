import 'package:aps_project/components/dados_field.dart';
import 'package:aps_project/model/cep.dart';
import 'package:flutter/material.dart';


class DataLocation extends StatefulWidget {
  final String cep;
  final String descr;
  final String? rua;
  final String? cidade;
  final String? bairro;
  final String? estado;

  DataLocation(this.cep,this.descr,this.rua,this.estado,this.bairro,this.cidade, {Key? key}) : super(key: key);



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

      body: BodyField(widget.cep,widget.descr,widget.rua,widget.cidade,widget.bairro,widget.estado),


  );
  }
}





