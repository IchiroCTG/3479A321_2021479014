import 'package:flutter/material.dart';

class GalleryPage extends StatelessWidget {
  final List<String> imageUrls;

  const GalleryPage({super.key,required this.imageUrls});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Galería'),
      ),
      body: imageUrls.isEmpty
          ? const Center(child: Text('No hay imágenes para mostrar'))
          : GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.0,
              ),
              itemCount: imageUrls.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(
                    imageUrls[index],
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
    );
  }
}