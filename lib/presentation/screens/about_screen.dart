import 'package:arkamaya_test/core/resources/consts/colors.dart';
import 'package:arkamaya_test/presentation/widgets/toast/my_toast.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rate_in_stars/rate_in_stars.dart';

import '../../core/resources/consts/sizes.dart';

@RoutePage()
class AboutScreen extends StatefulWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "About",
                style: TextStyle(
                    color: primaryColor,
                    fontSize: sizeBig,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const CircleAvatar(
              radius: 75,
              backgroundImage: AssetImage(
                "assets/img/me.jpg",
              ),
            ),
            Card(
              color: primaryColor,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Material(
                    type: MaterialType.transparency,
                    textStyle: const TextStyle(color: Colors.white),
                    child: Table(
                      children: const [
                        TableRow(children: [
                          Text("Nama"),
                          Text(": Aldi Irsan Majid")
                        ]),
                        TableRow(
                          children: [
                            Text("Tempat Tanggal Lahir"),
                            Text(": Jakarta, 2 Oktober 1998"),
                          ],
                        ),
                        TableRow(
                          children: [
                            Text("Nomor Telepon"),
                            Text(": 082235539449"),
                          ],
                        ),
                      ],
                    )),
              ),
            ),
            Column(
              children: [
                const Text("How much do you like my app?"),
                RatingStars(
                  editable: true,
                  rating: 5,
                  color: Colors.amber,
                  iconSize: 32,
                ),
                ElevatedButton(
                    onPressed: () {
                      myToast("Thanks!");
                    },
                    child: const Text("Save"))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
