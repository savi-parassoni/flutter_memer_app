import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_memer/services/api.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Memer App')),
      body: FutureBuilder(
        future: Api.getMemes(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.data!.memes!.length,
              itemBuilder: (context, index) {
                final meme = snapshot.data!.data!.memes![index];
                return ListTile(
                  leading: CircleAvatar(
                    radius: 50,
                    child: ClipOval(
                      child: CachedNetworkImage(
                        imageUrl: meme.url!,
                        fit: BoxFit.cover,
                        height: 50,
                        width: 50,
                      ),
                    ),
                  ),
                  title: Text(meme.name!),
                  subtitle: Text(meme.url!),
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
