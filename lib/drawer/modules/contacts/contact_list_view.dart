import 'package:flab/drawer/widget/drawer.dart';
import 'package:flutter/material.dart';
import '../../data/contact_data.dart';
import 'contact_detail_view.dart';
import 'contact_list_presenter.dart';

class ContactsPage extends StatelessWidget {
  static const String routeName = '/contacts';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
        appBar: AppBar(
          title: Text("Contacts"),
          actions : [IconButton(
          icon: Icon(Icons.cancel, color: Colors.white70,),
          onPressed: (){
            Navigator.of(context, rootNavigator: true).pop(context);
          }
        )]),
        body: ContactList(),
        // persistentFooterButtons: [
        //   ListTile(
        //             title: Text('0.0.1'),
        //             onTap: () {},
        //           )
        // ],
      );
  }

}

class ContactList extends StatefulWidget{
  ContactList({ Key key }) : super(key: key);

  @override
  _ContactListState createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> implements ContactListViewContract {
  
  ContactListPresenter _presenter;
  List<Contact> _contacts;
  bool _isSearching;

  _ContactListState() {
    _presenter =  ContactListPresenter(this);
  }

  @override
  void initState() {
    super.initState();
    _isSearching = true;
    _presenter.loadContacts();
  }

  @override
  void onLoadContactsComplete(List<Contact> items) {

    setState(() {
      _contacts = items;
      _isSearching = false;
    });

  }

  @override
  void onLoadContactsError() {
    // TODO: implement onLoadContactsError
  }

  @override
  Widget build(BuildContext context) {

    var widget;
    if(_isSearching) {
      widget = Center(
        child: Padding(
          padding: EdgeInsets.only(left: 16.0, right: 16.0),
          child: CircularProgressIndicator()
        )
      );
    }else {
      widget = ListView(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            children: _buildContactList()
          );
    }
    return widget;
  }

  List<_ContactListItem> _buildContactList() {
    return _contacts.map((contact) =>
                          new _ContactListItem (
                            contact: contact,
                            onTap: () { _showContactPage(context, contact); }
                          ))
                    .toList();
  }

  void _showContactPage(BuildContext context, Contact contact) {
    Navigator.push(context, new MaterialPageRoute<Null>(
      settings: const RouteSettings(name: ContactPage.routeName),
      builder: (BuildContext context) => new ContactPage(contact)
    ));
  }

}

class _ContactListItem extends ListTile {

  _ContactListItem({ @required Contact contact,
                     @required GestureTapCallback onTap}) :
    super(
      title : Text(contact.fullName),
      subtitle: Text(contact.email),
      leading: CircleAvatar(
        child: Text(contact.fullName[0])
      ),
      onTap: onTap
    );

}