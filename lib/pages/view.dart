import 'package:blogapp/model/viewpostmodel.dart';
import 'package:blogapp/services/displayservice.dart';
import 'package:flutter/material.dart';
class listpost extends StatefulWidget {
  const listpost({super.key});

  @override
  State<listpost> createState() => _listpostState();
}

class _listpostState extends State<listpost> {
  Future<List<Display>> ? data;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data=displayapi().displaypost();
  }
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: data,
        builder: (context,snapshot)
    {
      if(snapshot.hasData && snapshot.data!.isNotEmpty)
        {
          return ListView.builder(
              itemCount:snapshot.data!.length,
              itemBuilder:(context,index)
      {
        return Card(
          child: Column(
            children: [
              Text(snapshot.data![index].userId.name.toString()),
              Text(snapshot.data![index].post.toString()),
              Text(snapshot.data![index].postedDate.toString()),
            ],
          ),
        );
      });

        }
      else
        {
          return CircularProgressIndicator();
        }
    }
    );
  }
}
