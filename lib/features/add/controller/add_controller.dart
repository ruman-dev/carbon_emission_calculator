import 'package:get/get.dart';

class AddController extends GetxController {
  var numOfPeople = 52.obs;
  var numOfRooms = 16.obs;
  var totalArea = 3700.obs;
  var totalAC = 5.obs;
  var totalRef = 2.obs;
  var totalComputers = 60.obs;
  var totalInPlants = 23.obs;
  var totalKitBurners = 11.obs;

  void incrementPeople() => numOfPeople.value++;

  void decrementPeople() {
    if (numOfPeople.value > 0) numOfPeople.value--;
  }

  void incrementRooms() => numOfRooms.value++;

  void decrementRooms() {
    if (numOfRooms.value > 0) numOfRooms.value--;
  }

  void incrementArea() => totalArea.value++;

  void decrementArea() {
    if (totalArea.value > 0) totalArea.value--;
  }

  void incrementAC() => totalAC.value++;

  void decrementAC() {
    if (totalAC.value > 0) totalAC.value--;
  }

  void incrementRef() => totalRef.value++;

  void decrementRef() {
    if (totalRef.value > 0) totalRef.value--;
  }

  void incrementComputers() => totalComputers.value++;

  void decrementComputers() {
    if (totalComputers.value > 0) totalComputers.value--;
  }

  void incrementPlants() => totalInPlants.value++;

  void decrementPlants() {
    if (totalInPlants.value > 0) totalInPlants.value--;
  }

  void incrementKitBurners() => totalKitBurners.value++;

  void decrementKitBurners() {
    if (totalKitBurners.value > 0) totalKitBurners.value--;
  }
}
