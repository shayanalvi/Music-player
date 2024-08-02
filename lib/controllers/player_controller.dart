import 'package:get/get.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:permission_handler/permission_handler.dart';

class PlayerController extends GetxController {

  final audioQuery = OnAudioQuery();

  @override
  void init(){
    super.onInit();

    checkPermission();
  }
  checkPermission() async {
    var perm = await Permission.storage.request();

    if(perm.isGranted){
    } else {
      checkPermission();
    }
  }

}