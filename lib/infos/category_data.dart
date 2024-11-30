import 'package:movie_app/model/category_class_model.dart';

List<CategoryClassModel> getCategoryModel() {
  List<CategoryClassModel> categoryModel = List.empty(growable: true);

  CategoryClassModel categoryClassModel1 =
      CategoryClassModel(categoryName: "Business", imageUrl: "https://images.unsplash.com/photo-1507679799987-c73779587ccf?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8YnVzc2luZXN8ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60");
  categoryModel.add(categoryClassModel1);

  CategoryClassModel categoryClassModel2 =
      CategoryClassModel(categoryName: "Entertainment", imageUrl: "https://images.unsplash.com/photo-1603190287605-e6ade32fa852?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8ZW50ZXJ0YWlubWVudHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=900&q=60");
  categoryModel.add(categoryClassModel2);

  CategoryClassModel categoryClassModel3 =
      CategoryClassModel(categoryName: "General", imageUrl: "https://images.unsplash.com/photo-1495020689067-958852a7765e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60");
  categoryModel.add(categoryClassModel3);

  CategoryClassModel categoryClassModel4 =
      CategoryClassModel(categoryName: "Health", imageUrl: "https://images.unsplash.com/photo-1494390248081-4e521a5940db?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1595&q=80");
  categoryModel.add(categoryClassModel4);

  CategoryClassModel categoryClassModel5 =
      CategoryClassModel(categoryName: "Science", imageUrl: "https://images.unsplash.com/photo-1554475901-4538ddfbccc2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1504&q=80");
  categoryModel.add(categoryClassModel5);

  CategoryClassModel categoryClassModel6 =
      CategoryClassModel(categoryName: "Sports", imageUrl: "https://images.unsplash.com/photo-1495563923587-bdc4282494d0?ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80");
  categoryModel.add(categoryClassModel6);

    CategoryClassModel categoryClassModel7 =
      CategoryClassModel(categoryName: "Technology", imageUrl: "https://images.unsplash.com/photo-1519389950473-47ba0277781c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80");
  categoryModel.add(categoryClassModel7);

  return categoryModel;
}
