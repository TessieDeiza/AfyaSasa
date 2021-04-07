import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:contact_picker/contact_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:afyasasa/activityfiles/messaging.dart';

ThemeData userTheme() {
  final ThemeData base = ThemeData();
  return base.copyWith(
    hintColor: Colors.black,
    primaryColor: Colors.black,
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(
        color: Colors.black,
      ),
      labelStyle: TextStyle(
        color: Colors.black,
        fontSize: 12.0,
      ),
    ),
  );
}


class MyChartsPage extends StatefulWidget {
  MyChartsPage({Key key, this.prefs}) : super(key: key);
  final SharedPreferences prefs;

  @override
  _MyChartsPage createState() => _MyChartsPage();

}

class _MyChartsPage extends State<MyChartsPage> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', color: Color(0xFF00284B));
  final cardColor = Color(0xFF003B5B);
  int _currentIndex = 0;
  String _tabTitle = "Chats";
  List<Widget> _children = [Container(), Container()];

  final db = Firestore.instance;
  final ContactPicker _contactPicker = new ContactPicker();
  CollectionReference contactsReference;
  DocumentReference profileReference;
  DocumentSnapshot profileSnapshot;

  final GlobalKey<FormState> _formStateKey = GlobalKey<FormState>();
  final _yourNameController = TextEditingController();
  bool editName = false;

  @override
  void initState() {
    print("reached charts");
    super.initState();

    contactsReference = db
        .collection("users")
        .document(widget.prefs.getString('uid'))
        .collection('contacts');

    profileReference =
        db.collection("users").document(widget.prefs.getString('uid'));

    profileReference.snapshots().listen((querySnapshot) {
      profileSnapshot = querySnapshot;
      widget.prefs.setString('name', profileSnapshot.data["name"]);
      widget.prefs
          .setString('profile_photo', profileSnapshot.data["profile_photo"]);

      setState(() {
        _yourNameController.text = profileSnapshot.data["name"];
      });
    });
  }

  generateContactTab() {
    return Column(
      children: <Widget>[
        StreamBuilder<QuerySnapshot>(
          stream: contactsReference.snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) return new Text("No Contacts");
            return Expanded(
              child: new ListView(
                children: generateContactList(snapshot),
              ),
            );
          },
        )
      ],
    );
  }

  Future<void> getProfilePicture() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    StorageReference storageReference = FirebaseStorage.instance
        .ref()
        .child('profiles/${widget.prefs.getString('uid')}');
    StorageUploadTask uploadTask = storageReference.putFile(image);
    await uploadTask.onComplete;
    print('File Uploaded');
    String fileUrl = await storageReference.getDownloadURL();
    profileReference.updateData({'profile_photo': fileUrl});
  }

  generateProfileTab() {
    return Center(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Test"),
          ]),
    );
  }

  generateContactList(AsyncSnapshot<QuerySnapshot> snapshot) {
    return snapshot.data.documents
        .map<Widget>(
          (doc) => InkWell(
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey,
                  ),
                ),
              ),
              child: ListTile(
                title: Text(doc["name"]??""),
                subtitle: Text(doc["mobile"]??""),
                trailing: Icon(Icons.chevron_right),
              ),
            ),
            onTap: () async {
              QuerySnapshot result = await db
                  .collection('chats')
                  .where('contact1', isEqualTo: widget.prefs.getString('uid'))
                  .where('contact2', isEqualTo: doc["uid"])
                  .getDocuments();
              List<DocumentSnapshot> documents = result.documents;
              if (documents.length == 0) {
                result = await db
                    .collection('chats')
                    .where('contact2', isEqualTo: widget.prefs.getString('uid'))
                    .where('contact1', isEqualTo: doc["uid"])
                    .getDocuments();
                documents = result.documents;
                if (documents.length == 0) {
                  await db.collection('chats').add({
                    'contact1': widget.prefs.getString('uid'),
                    'contact2': doc["uid"]
                  }).then((documentReference) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => MessagingScreen(
                          prefs: widget.prefs,
                          chatId: documentReference.documentID,
                          title: doc["name"],
                        ),
                      ),
                    );
                  }).catchError((e) {});
                } else {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => MessagingScreen(
                        prefs: widget.prefs,
                        chatId: documents[0].documentID,
                        title: doc["name"],
                      ),
                    ),
                  );
                }
              } else {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => MessagingScreen(
                      prefs: widget.prefs,
                      chatId: documents[0].documentID,
                      title: doc["name"],
                    ),
                  ),
                );
              }
            },
          ),
        )
        .toList();
  }

  openContacts() async {
    Contact contact = await _contactPicker.selectContact();
    print("selected contact");
    print(contact);
    if (contact != null) {
      String phoneNumber = contact.phoneNumber.number
          .toString()
          .replaceAll(new RegExp(r"\s\b|\b\s"), "")
          .replaceAll(new RegExp(r'[^\w\s]+'), '');
      if (phoneNumber.length == 10) {    
        phoneNumber =  phoneNumber.replaceAll(new RegExp(r'0(?=\d{9}$)'), ''); 
        phoneNumber = '+254$phoneNumber';
        print("10 digits" + phoneNumber);
      }
      if (phoneNumber.length == 12) {
        phoneNumber = '+$phoneNumber';
        print("12 digits" + phoneNumber);
      }
      if (phoneNumber.length == 13) {
        print("13 digits" + phoneNumber);
        DocumentReference mobileRef = db
            .collection("mobile_nos")
            .document(phoneNumber.replaceAll(new RegExp(r'[^\w\s]+'), ''));
        await mobileRef.get().then((documentReference) {
          if (documentReference.exists) {
            contactsReference.add({
              'uid': documentReference['uid'],
              'name': contact.fullName,
              'mobile': phoneNumber.replaceAll(new RegExp(r'[^\w\s]+'), ''),
            });
          } else {
            print('User Not Registered');
            _notRegisteredDialog();
          }
        }).catchError((e) {});
      } else {
        print('Wrong Mobile Number');
      }
    }
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
      switch (_currentIndex) {
        case 0:
          _tabTitle = "Contacts";
          break;
        case 1:
          _tabTitle = "Profile";
          break;
      }
    });
  }

  void _notRegisteredDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Sorry!"),
          content: new Text("The user is not registered on Afyasasa."),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  
  @override
  Widget build(BuildContext context) {
    _children = [
      generateContactTab(),
      generateProfileTab(),
    ];
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text(_tabTitle, style: TextStyle(fontFamily: 'SF Pro', color: Color(0xFF00284B), fontSize: 20.0, fontWeight: FontWeight.bold),),
            backgroundColor: Colors.white,
            actions: <Widget>[
              (_currentIndex == 0
                  ? Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.add, color:Colors.black,),
                          onPressed: () {
                            openContacts();
                          },
                        ),
                      ],
                    )
                  : Container())
            ],
          ),
          body: _children[_currentIndex],
          // bottomNavigationBar: BottomNavigationBar(
          //   onTap: onTabTapped, // new
          //   currentIndex: _currentIndex, // new
          //   items: [
          //     new BottomNavigationBarItem(
          //       icon: Icon(Icons.mail),
          //       title: Text('Contacts'),
          //     ),
          //     new BottomNavigationBarItem(
          //       icon: Icon(Icons.verified_user),
          //       title: Text('Profile'),
          //     )
          //   ],
          // ),
        ),
      ),
    );
  }

}