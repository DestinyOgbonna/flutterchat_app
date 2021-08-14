import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterchat_app/services/database.dart';
import 'package:flutterchat_app/widgets/app_widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import 'conversation_screen.dart';
class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  
  DataBaseMethods dataBaseMethods = DataBaseMethods();

  TextEditingController searchTextEditingController = TextEditingController();

   QuerySnapshot? searchSnapshot;
// late QuerySnapshot searchSnapShot;

  initiateSearch(){
    dataBaseMethods.getUserByUsername(searchTextEditingController.text).then
      ((val){
         setState(() {
           searchSnapshot = val;
         });
    });
  }

  //creating the chart room
  creatingChartRoom( String userName){
    List <String> users = [userName,];
  //  dataBaseMethods.createChatRoom(chartRoomID, chatRoomMap)
  }

  Widget searchList(){
    // ignore: unnecessary_null_comparison
    return searchSnapshot != null ? ListView.builder(
      itemCount: searchSnapshot!.docs.length,
        shrinkWrap: true,
        itemBuilder: (context, index){
      return SearchTile(userName: (searchSnapshot!.docs[index].data() as dynamic)['name'],
                userEmail: (searchSnapshot!.docs[index].data() as dynamic)['email']
      );
    }) : Container();
  }
  @override
  void initState() {
    //calling the initiate start function
    initiateSearch();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: appBarMain()),
      // ignore: avoid_unnecessary_containers
      body: Container(
        child: Column(
          children: [
            Container(
             // color: Colors.blueGrey,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Row( mainAxisSize: MainAxisSize.max ,
                children:  [
                  Expanded(child: TextFormField(
                    controller: searchTextEditingController,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      hintText: 'Search Contact',
                      hintStyle: TextStyle(
                        color: Colors.white54,
                        fontWeight: FontWeight.w600,
                      ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white54),
                        )
                    ),
                  )),
                  GestureDetector(
                    onTap: (){
                      //enabling the search feature
                      initiateSearch();

                    },
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          gradient: LinearGradient(
                            colors: [
                             Colors.grey,
                              Colors.black,
                            ]
                          )
                        ),

                          child: const Icon(Icons.search, color: Colors.white, size: 30,))),

                ],
              ),
            ),
            // ignore: avoid_unnecessary_containers
            Container(
                child: Expanded(child: searchList())),
          ],
        ),
      ),
    );
  }
}


class SearchTile extends StatelessWidget {
  final String userName;
  final String userEmail;
  const SearchTile({Key? key, required this.userName, required this.userEmail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 19),
      child: Expanded(
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(userName, style:GoogleFonts.montserrat(
          fontWeight: FontWeight.w400, fontSize: 14, color: Colors.white,
        )),

        Text(userEmail, style: GoogleFonts.montserrat(
          fontWeight: FontWeight.w400, fontSize: 14, color: Colors.white,
        )),
              ],
            ),

    const Spacer(),
    GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> const ConversationScreen()));
      },
      child: Container(
          decoration: const BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
      padding: const  EdgeInsets.symmetric(horizontal: 19, vertical: 19),
      child: Text('Message', style:GoogleFonts.montserrat(color: Colors.white, fontSize: 18)),
      ),
    )
          ],
        ),
      ),
    );
  }
}
