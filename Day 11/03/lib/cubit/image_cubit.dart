import 'dart:math';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'image_state.dart';

class ImageCubit extends Cubit<ImageState> {
  ImageCubit()
    : super(ImageState(imageUrl: "https://picsum.photos/300/300?random=1"));

  final List<String> images = [
    "https://picsum.photos/300/300?random=1",
    "https://picsum.photos/300/300?random=2",
    "https://picsum.photos/300/300?random=3",
    "https://picsum.photos/300/300?random=4",
    "https://picsum.photos/300/300?random=5",
  ];

  final Random _random = Random();

  void changeImage() {
    final newImage = images[_random.nextInt(images.length)];
    emit(ImageState(imageUrl: newImage));
  }
}
