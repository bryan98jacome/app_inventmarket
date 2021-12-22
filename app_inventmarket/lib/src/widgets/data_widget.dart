import 'package:app_inventmarket/src/models/productos_model.dart';
import 'package:app_inventmarket/src/services/data_service.dart';
import 'package:flutter/material.dart';


class DataWidget extends StatefulWidget {
  const DataWidget({Key? key}) : super(key: key);

  @override
  _DataWidgetState createState() => _DataWidgetState();
}

class _DataWidgetState extends State<DataWidget> {
  @override
  Widget build(BuildContext context) {
    return  FutureBuilder<List<Productos>>(
        future: getMovies(),
        
        builder: (context, AsyncSnapshot<List<Productos>> snapshot) {
          if(snapshot.hasData == false){
            return Container(
              alignment: Alignment.center,
              child: const Center(
                      child: CircularProgressIndicator(),
              ),
            ); 
          }
          return ListView(
              padding: const EdgeInsets.all(10),
              children: snapshot.data!.map((movie) => ListTile(
                minVerticalPadding: 10,
                minLeadingWidth: 60,
                leading: const CircleAvatar(
                  radius: 50,
                  child: Icon(Icons.brunch_dining_outlined)
                ),
                title: Text(movie.id.toString() + "\n" + movie.nombre.toString()),
                subtitle: Text("Stock       Presio\n " + movie.stock.toString() + "           " + movie.valor.toString()),
                trailing: const Icon(Icons.edit),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: const BorderSide(color: Colors.grey),
                ),
              )).toList(),
            );
        }
      );
  }
}
