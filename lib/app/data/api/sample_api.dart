import 'package:home_decoration_marketplace/app/data/models/category_model.dart';

class SampleApi {
  static const sampleData = "assets/sample_data.json";
  static const _decorAssessoriesImg = "assets/decorative_accessories.jpg";
  static const _lightDecorImg = "assets/light_decor.jpg";
  static const _livingRoomImg = "assets/living-room.jpg";
  static const _throwPillowImg = "assets/throw_pillow.jpg";
  static const _wallDecorImg = "assets/wall_decor.jpg";
  static const _mirrorDecorImg = "assets/mirror_decor.jpg";

  static List<CategoryModel> categories = [
    CategoryModel(title: "Living Room", imagePath: _livingRoomImg),
    CategoryModel(title: "Decorative Accessories", imagePath: _decorAssessoriesImg),
    CategoryModel(title: "Light Decor", imagePath: _lightDecorImg),
    CategoryModel(title: "Mirror Decor", imagePath: _mirrorDecorImg),
    CategoryModel(title: "Throw Decor", imagePath: _throwPillowImg),
    CategoryModel(title: "Wall Decor", imagePath: _wallDecorImg),
  ];
}
