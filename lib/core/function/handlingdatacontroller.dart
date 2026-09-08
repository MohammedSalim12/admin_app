
import 'package:admen_app/core/class/statusRequest.dart';

StatusRequest handlingData(response) {
  if (response == null) {
    return StatusRequest.serverException;
  }

  if (response is StatusRequest) {
    return response;
  }

  return StatusRequest.success;
}
