import 'package:cloud_firestore/cloud_firestore.dart';

class DataBaseMethods{
    getUserByUsername(String username) async {
    return await  FirebaseFirestore.instance.collection('users')
          .where('name', isEqualTo: username)
          .get();
    }

    //uploading signed in users details to database
    uploadUserInfo(userMap){
      FirebaseFirestore.instance.collection('users').add(userMap);

    }

    createChatRoom(String chartRoomID, chatRoomMap){
        FirebaseFirestore.instance.collection('ChatRoom')
            .doc(chartRoomID).set(chatRoomMap).catchError((e){
                print(e.toString());
        });
    }
}
