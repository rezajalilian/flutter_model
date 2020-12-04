

class MenuModel{
  final String desc;
  final List<ColumnMenuModel> footer_column_menu;
  MenuModel({this.desc , this.footer_column_menu});
  factory  MenuModel.formJson(Map<String , dynamic> json){
    var list = json['footer_column_menu'] as List;
    List<ColumnMenuModel> subItem = list.map((e) => ColumnMenuModel.formJson(e)).toList();
    return MenuModel(
       desc: json['desc'],
       footer_column_menu: subItem,
    );
  }
}


class ColumnMenuModel{
  final String menu_title;
  final List<SubMenuModel> sub_menu;
  ColumnMenuModel({this.menu_title, this.sub_menu});

  factory  ColumnMenuModel.formJson(Map<String , dynamic> json){

    var list = json['sub_menu'] as List;
    List<SubMenuModel> subItem = list.map((e) => SubMenuModel.formJson(e)).toList();

    return ColumnMenuModel(
        sub_menu: subItem,
        menu_title: json['menu_title']
    );
  }
}






class SubMenuModel{
  final String sub_menu_title;
  SubMenuModel({this.sub_menu_title});
  factory  SubMenuModel.formJson(Map<String , dynamic> json){
    return SubMenuModel(
      sub_menu_title: json['this.sub_menu_title']
    );
  }
}