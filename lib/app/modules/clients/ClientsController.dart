
import 'package:get/get.dart';
import '../../routes/routes.dart';
import '../../services/ApiService.dart';
import '../../services/TokenService.dart';

class ClientsController extends GetxController{
  final ApiService _apiService = Get.put(ApiService());
  final TokenService _tokenService = TokenService();
  var clientsData ={}.obs;
  var isLoading = true.obs;

  @override
  void onInit()async{
    await _tokenService.init();
    super.onInit();
  }


  void getClients  () async {
    var  userToken = await  _tokenService.getToken().toString();
    // print("loading....");
    // print('usertoken is ${userToken}');
    try {
      final clientResponse = await _apiService.postRequest('/clients', {
        'token': userToken,
      });
      print(clientResponse.data);
      if(clientResponse.data["status"] == "success" ){
        clientsData.value = clientResponse.data;
        isLoading.value = false;
      }
    } catch (e) {
      // Handle error
      print('Login failed: $e');
    }

  }

}