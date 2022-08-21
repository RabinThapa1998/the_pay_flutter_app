import "package:flutter/material.dart";

class ContestentTile extends StatelessWidget {
  const ContestentTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          height: 400,
          child: Column(children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'assets/images/pp.jpg',
                height: 200,
                width: 200,
                fit: BoxFit.fitWidth,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text("Jhon Doe",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text("Kathmandu, Dillibazar"),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(onPressed: () => {}, child: Text('Vote'))
          ]),
        ),
      ),
    );
  }
}
