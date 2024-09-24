class ImageRes{

  /*
  Center(child: appImage(imagePath: "assets/icons/user.png",width: 250,height: 250),),
   Center(child: appImage(imagePath: "assets/icons/padlock.png",width: 250,height: 250),),
   Center(child: appImage(imagePath: "assets/icons/user.png",width: 250,height: 250),),
   Center(child: appImage(imagePath: "assets/icons/user.png",width: 250,height: 250),),
   Center(child: appImage(imagePath: "assets/icons/user.png",width: 250,height: 250),)
   */

  ImageRes._();
  static const String _imageBase = "assets/icons";
  static const String  home = '$_imageBase/user.png';
  static const String  search = '$_imageBase/padlock.png';
  static const String play  = '$_imageBase/user.png';
  static const String  message ='$_imageBase/padlock.png';
  static const String  profile ='$_imageBase/user.png';
}