import 'package:flutter/material.dart';

class BuilderImage extends StatefulWidget {
  const BuilderImage({Key? key}) : super(key: key);

  @override
  State<BuilderImage> createState() => _BuilderImageState();
}

class _BuilderImageState extends State<BuilderImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List View Builder'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: ListView.builder(

                itemCount: 4,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(''),
                    ),
                    title: const Text('Name'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
