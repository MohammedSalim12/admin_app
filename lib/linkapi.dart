class Applink {
  static const String server = "http://192.168.10.206:9000";
  static const String imagestatic = "http://192.168.10.206:9000/upload";

  
  
  static const String login = "$server/admin/auth/login";
  // categores =============
  static const String categoresview = "$server/admin/categoris/view";
  static const String categoresadd = "$server/admin/categoris/add";
  static const String categoresedit = "$server/admin/categoris/edit";
  static const String categoresdelete = "$server/admin/categoris/delete";

  // items ================
  static const String itemsview = "$server/admin/items/view";
  static const String itemsadd = "$server/admin/items/add";
  static const String itemsedit = "$server/admin/items/edit";
  static const String itemsdelete = "$server/admin/items/delete";


  static const String imagescategories = "$imagestatic/categories";
  static const String imagesitems = "$imagestatic/items"; 

}
