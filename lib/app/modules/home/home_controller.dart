import 'package:get/get.dart';
import '../../routes/routes.dart';
import '../../services/ApiService.dart';
import '../../services/TokenService.dart';

class HomeController extends GetxController{
  final ApiService _apiService = Get.put(ApiService());
  final TokenService _tokenService = TokenService();
  var trackingCode = "".obs;
  var senderPhone = "".obs;
  var isSuccess = false.obs;
  var isLoading = false.obs;
  var sheetHeight = 400.0.obs;
  var homeDataLoading =  true.obs;
  var errorMessage = "".obs;
  var homeData = {}.obs;
  var data = {}.obs;

  @override
  void onInit()async{
    await _tokenService.init();
    await getHomeData();
    super.onInit();
  }

  void getTrackingData()async{

      try{
        isLoading.value = true;

        final response = await _apiService.postRequest("/track", {
          "tracking_code": trackingCode.value,
          "sender_phone": senderPhone.value
        });

        // print(response);
        if((response.data["status"] == "success") || (response.data["status"] == "fail")){
          isLoading.value = false;

        }
        if(response.data["status"] == "success"){
          isSuccess.value = true;
          data.value = response.data["body"] ?? {};
          sheetHeight.value = 600.0;
        }else{
          errorMessage.value = "Incorrect Tracking Details";
        }
      }
      catch(e){
        print(e);
      }

     }

  Future getHomeData() async{
    homeDataLoading.value = true;
    var token =   _tokenService.getToken();
    if (token == null) {
      // Handle the case where token is null

      return;
    }

    try{
      isLoading.value = true;
      final getHomeResponse = await _apiService.postRequest("/home", {
        "token": token,
      });

      if(getHomeResponse.data["status"] == "success"){
        homeDataLoading.value = false;
        homeData.value = getHomeResponse.data['body'] ?? {};
      }
    }
    catch(e){
      print(e);
    }

  }


     void closeBottomSheet(){
        trackingCode.value = "";
        senderPhone.value = "";
        isSuccess.value = false;
        errorMessage.value = "";
        sheetHeight.value = 350.0;
     }
  }