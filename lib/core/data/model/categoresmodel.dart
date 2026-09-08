class CategoriesModel {
  String? categoriesId;
  String? categoriesName;
  String? categoriesNameAr;
  String? categoriesImage;
  String? categoriesDatetime;


  CategoriesModel.fromJson(Map<String, dynamic> json) {
    categoriesId =json['categories_id'].toString();
    categoriesName = json['categoreis_name'];
    categoriesNameAr = json['categoreis_name_ar'];
    categoriesImage = json['categoreis_images'];
    categoriesDatetime = json['categoreis_datetime'];
  }
}
