import 'package:contacts_list_ostad_assignment/entities/contact.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContactListScreen extends StatefulWidget {
  const ContactListScreen({super.key});



  @override
  State<ContactListScreen> createState() => _ContactListScreenState();
}

class _ContactListScreenState extends State<ContactListScreen> {
  final TextEditingController _nameTEController = TextEditingController();
  final TextEditingController _numberTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final List<Contact> _contactList = [];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact List"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _addContactForm(),
              const SizedBox(
                height: 50,
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: _contactList.length,
                  itemBuilder: (context, index){
                    return _buildLongPressed(context, index);
                  })
            ],
          ),
        ),
      ),
    );

  }

  GestureDetector _buildLongPressed(BuildContext context, int index) {
    return GestureDetector(
                    onLongPress: (){
                      _showDeleteDialogue(context, index);
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3)
                      ),
                      child: _contactPersonTile(index),
                    ),
                  );
  }

  ListTile _contactPersonTile(int index) {
    return ListTile(
                      leading: const Icon(Icons.person,
                      size: 36,),
                      title: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text( _contactList[index].name,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.red
                          ),),
                          Text(_contactList[index].number,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: Colors.black87
                          ),),
                        ],
                      ),
                      trailing: const Icon(Icons.phone,
                      color: Colors.blue,),
                    );
  }

  Future<dynamic> _showDeleteDialogue(BuildContext context, int index) {
    return showDialog(
                        context: context,
                        builder: (context){
                          return AlertDialog(
                            title: const Text("Confirmation"),
                            content: const Text("Are You Sure for delete?"),
                            actions: [
                              IconButton(onPressed: (){
                                Navigator.pop(context);
                              }, icon: const Icon(Icons.copy)),
                               IconButton(onPressed: (){
                                 if(mounted){
                                   setState(() {
                                     _contactList.removeAt(index);
                                   });
                                 }
                                 Navigator.pop(context);
                               }, icon: const Icon(Icons.delete)),
                            ],

                          );
                        });
  }
@override
  void dispose() {
    super.dispose();
    _nameTEController.dispose();
    _numberTEController.dispose();
  }
  Form _addContactForm() {
    return Form(
            key: _formKey,
            child: Column(
            children: [
              TextFormField(
                controller: _nameTEController,
                decoration: const InputDecoration(
                  hintText: 'Name'
                  ),
                validator: (String? value){
                  if(value == null || value.trim().isEmpty){
                    return 'Write Your Name';
                  }
                  return null;
                },
                keyboardType: TextInputType.name,
                ),
              const SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: _numberTEController,
                decoration: const InputDecoration(
                    hintText: 'Number'
                ),
                validator: (String? value){
                  if(value == null || value.trim().isEmpty){
                    return 'Write Your Number';
                  }
                  return null;
                },
                keyboardType: TextInputType.number,
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(onPressed: (){
                if(_formKey.currentState!.validate()){
                Contact contact = Contact(_nameTEController.text.trim(), _numberTEController.text.trim());
                _contactList.add(contact);
                setState(() {});
                _numberTEController.clear();
                _nameTEController.clear();
                //print(_contactList);
                }
              }, child: const Text("Add"))
            ],
          ),
          );
  }
}
