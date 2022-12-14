import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class HighScoretitle extends StatelessWidget {
  final String documentId;
  const HighScoretitle({Key? key,
  required this.documentId
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CollectionReference highscores = FirebaseFirestore.instance.collection('highscores');
    return FutureBuilder<DocumentSnapshot>(
      future: highscores.doc(documentId).get(),
      builder: (context,snapshot){
        if(snapshot.connectionState == ConnectionState.done){
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Row(

            children: [
              Text(data['score'].toString(),style: TextStyle(color: Colors.white)),
              SizedBox(
                width: 10,
              ),
              Text(data['name'], style: TextStyle(color: Colors.white)),

            ],
          );
        }
        else{
          return Text('loading...');
        }
      },
    );
  }
}
