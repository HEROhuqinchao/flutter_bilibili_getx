import '../../../../../core/model/xliveAppInterfaceV2IndexFeedModel.dart';

class LiveState {
  late List<CardList> cardList;
  late bool isLoadingLiveData;
  late int selectedNumber;
  LiveState() {
    isLoadingLiveData = true;
    selectedNumber = 0;
  }
}
