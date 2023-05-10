import 'package:arkamaya_test/core/resources/consts/sizes.dart';
import 'package:arkamaya_test/data/models/user_response.dart';
import 'package:arkamaya_test/presentation/widgets/toast/my_toast.dart';
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
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              "Create",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Name"),
                MyTextField(
                  controller: nameController,
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return "Harap Isi Nama";
                    }
                  },
                  onChanged: (val) {
                    setState(() {});
                  },
                ),
                Text("Job"),
                MyTextField(
                  controller: jobController,
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return "Harap Isi Job";
                    }
                  },
                  onChanged: (val) {
                    setState(() {});
                  },
                ),
              ],
            ),
            SizedBox(
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
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                            "Data Has Been Created:\nID : ${state.createUserResponse.id}\nCreated At : ${state.createUserResponse.createdAt}"),
                      ));
                      // myToast(
                      //     "Data Has Been Created:\nID : ${state.createUserResponse.id}\nCreated At : ${state.createUserResponse.createdAt}");
                    }
                    if ((state is CreateUserFailed)) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Create User Failed"),
                      ));
                      // myToast("Data is failed to create");
                    }
                  },
                  builder: (context, state) {
                    return ElevatedButton(
                        onPressed: nameController.text.isEmpty ||
                                jobController.text.isEmpty
                            ? null
                            : () {
                                if (nameController.text.isNotEmpty &&
                                    jobController.text.isNotEmpty) {
                                  context.read<UserBloc>().add(CreateUser(
                                      nama: nameController.text,
                                      job: jobController.text));
                                }
                              },
                        child: Container(
                            padding: EdgeInsets.all(sizeMedium),
                            child: state is UserLoading
                                ? const CircularProgressIndicator(
                                    color: Colors.white,
                                  )
                                : Text("Save")));
                  },
                )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
