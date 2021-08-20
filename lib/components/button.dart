import 'package:flutter/material.dart';

class Botao extends StatelessWidget {
  final String _nome;
  final IconData _icone;
  final Widget _routeWidget;

  Botao(this._nome, this._icone, this._routeWidget);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).primaryColor,
      child: InkWell(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => _routeWidget));
        },
        child: Container(
            padding: EdgeInsets.all(8.0),
            height: 80,
            width: 120,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(_icone, color: Colors.white, size: 24.0),
                Text(_nome,
                    style: TextStyle(color: Colors.white, fontSize: 16.0)),
              ],
            )),
      ),
    );
  }
}
