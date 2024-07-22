import 'package:get/get.dart';
import '../../routes/routes.dart';
import '../../services/ApiService.dart';
import '../../services/TokenService.dart';

class ShippingController extends GetxController{
  final ApiService _apiService = Get.put(ApiService());
  final TokenService _tokenService = TokenService();
  var userShippingData = {}.obs;
  var isLoading = true.obs;

  @override
  void onInit()async{
    await _tokenService.init();
    await getUserShipping();
    super.onInit();
  }

  Future getUserShipping  () async {
    var  userToken = await  _tokenService.getToken().toString();
    print("loading....");
    print('usertoken is ${userToken}');
    try {
      final response = await _apiService.postRequest('/shipping', {
        'token': userToken,
      });

      print(response.data['body']);
      if(response.data["status"] == "success" ){
        userShippingData.value = response.data['body'];
        isLoading.value = false;
      }
      // Get.offAllNamed(Routes.home);
    } catch (e) {
      // Handle error
      print('Login failed: $e');
    }

  }

}