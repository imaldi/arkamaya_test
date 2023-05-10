import 'package:arkamaya_test/core/resources/consts/sizes.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../state_managements/flutter_bloc/blocs/user/user_bloc.dart';
import '../widgets/my_text_field/my_text_field.dart';

@RoutePage()
class NewUserScreen extends StatefulWidget {
  const NewUserScreen({Key? key}) : super(key: key);

  @override
  _NewUserScreenState createState() => _NewUserScreenState();
}

class _NewUserScreenState extends State<NewUserScreen> {
  final nameController = TextEditingController();
  final jobController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Text(
                "Create",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Name"),
                  MyTextField(
                    controller: nameController,
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return "Harap Isi Nama";
                      }
                      return null;
                    },
                    onChanged: (val) {
                      setState(() {});
                    },
                  ),
                  const Text("Job"),
                  MyTextField(
                    controller: jobController,
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return "Harap Isi Job";
                      }
                      return null;
                    },
                    onChanged: (val) {
                      setState(() {});
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: sizeMedium,
              ),
              Row(
                children: [
                  Expanded(
                      child: BlocConsumer<UserBloc, UserState>(
                    listener: (context, state) {
                      // const snackBar = SnackBar(
                      //   content: Text('Yay! A SnackBar!'),
                      // );
                      if (state is CreateUserSuccess) {
                        setState(() {
                          nameController.text = " ";
                          jobController.text = " ";
                        });
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                              "Data Has Been Created:\nID : ${state.createUserResponse.id}\nCreated At : ${state.createUserResponse.createdAt}"),
                        ));
                        context.read<UserBloc>().add(GetAllUsers());
                        FocusScope.of(context).requestFocus(FocusNode());
                      }
                      if ((state is CreateUserFailed)) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text("Create User Failed"),
                        ));
                        FocusScope.of(context).requestFocus(FocusNode());
                      }
                    },
                    builder: (context, state) {
                      return ElevatedButton(
                          onPressed: (nameController.text.isEmpty ||
                                      jobController.text.isEmpty) ||
                                  state is CreateUserLoading
                              ? null
                              : () {
                                  if (nameController.text.isNotEmpty &&
                                      jobController.text.isNotEmpty) {
                                    context.read<UserBloc>().add(CreateUser(
                                        nama: nameController.text.trim(),
                                        job: jobController.text.trim()));
                                  }
                                },
                          child: Container(
                              padding: const EdgeInsets.all(sizeMedium),
                              child: state is CreateUserLoading
                                  ? const CircularProgressIndicator(
                                      color: Colors.white,
                                    )
                                  : const Text("Save")));
                    },
                  )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
