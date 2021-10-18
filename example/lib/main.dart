import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_phone_field/form_builder_phone_field.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FormBuilderPhoneField"),
      ),
      body: FormBuilder(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FormBuilderPhoneField(
                name: 'phone_number',
                decoration: const InputDecoration(
                  // label: Text("Phone Number"),
                  labelText: "Phone Number",
                  hintText: "enter phone ",
                  // prefixIcon: Icon(Icons.phone),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0))),
                ),
                // onChanged: _onChanged,
                priorityListByIsoCode: ['KE'],
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.numeric(context),
                  FormBuilderValidators.required(context),
                ]),
              ),
              const SizedBox(height: 15),
              FormBuilderPhoneField(
                name: 'phone_number_cupertino',
                isCupertinoPicker: true,
                decoration: const InputDecoration(
                  label: Text("Phone Number"),
                  prefixIcon: Icon(Icons.phone),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0))),
                ),
                // onChanged: _onChanged,
                priorityListByIsoCode: ['US'],
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.numeric(context),
                  FormBuilderValidators.required(context),
                ]),
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.saveAndValidate()) {
                    print(_formKey.currentState!.value);
                  }
                },
                child: Text("Submit"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
