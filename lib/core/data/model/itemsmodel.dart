class Itemsmodel {
  String? itemsId;
  String? itemsName;
  String? itemsNameAr;
  String? itemsDesc;
  String? itemsDescAr;
  String? itemsImage;
  String? itemsCount;
  String? itemsActive;
  String? itemsPrice;
  String? itemsDiscount;
  String? itemsDate;
  String? itemsCat;
  String? itemsPriceDiscount;
  String? categoriesId;
  String? categoriesName;
  String? categoriesNameAr;
  String? categoriesImages;
  String? categoriesDatetime;
  String? favorite;

  Itemsmodel.fromJson(Map<String, dynamic> json) {
    itemsId = json['items_id'].toString();
    itemsName = json['items_name'];
    itemsNameAr = json['items_name_ar'];
    itemsDesc = json['items_desc'];
    itemsDescAr = json['items_desc_ar'];
    itemsImage = json['items_image'];
    itemsCount = json['items_count'].toString();
    itemsActive = json['items_active'].toString();
    itemsPrice = json['items_price'].toString();
    itemsDiscount = json['items_discount'].toString();
    itemsDate = json['items_date'];
    itemsCat = json['items_cat'].toString();
    itemsPriceDiscount = json['itemspricediscount'].toString();
    categoriesId = json['categories_id'].toString();
    categoriesName = json['categoreis_name'];
    categoriesNameAr = json['categories_name_ar'];
    categoriesImages = json['categories_images'];
    categoriesDatetime = json['categories_datetime'];
    favorite = json['favorite']?.toString() ?? "0";

  }
}
