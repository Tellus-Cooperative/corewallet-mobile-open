import 'package:flutter/cupertino.dart';

import '../models/api.graphql.dart';
import '../repositories/profile_repository.dart';

class ProfileProvider with ChangeNotifier {
  final ProfileRepository profileRepository;

  List<Profiles$Query$Profiles$Results?> profiles = [];

  bool hasNextPage = true;
  bool isFirstLoadRunning = false;
  bool isLoadMoreRunning = false;

  int offset = 0;
  int limit = 20;
  double? _profileId;

  late ScrollController controller;

  ProfileProvider(this.profileRepository);

  init({required double profileId}) {
    _profileId = profileId;
  }

  bool isLoading = false;
  bool isSaved = false;

  bool loadingIcon = false;
  bool showIcon = false;

  TextEditingController pinController = TextEditingController(text: '');

  initProfile(Profile$Query$Profile? profile) {
    if (profile != null) {
      // nameController.text = profile.pin!;
    }
  }

  Future updateProfilePin({required int id}) async {
    isLoading = true;
    isSaved = await profileRepository.updateProfilePin(
        id: id, pin: pinController.text);
    notifyListeners();
  }

  Future updateCardReserved({required int id}) async {
    isSaved = await profileRepository.updateProfileCardReserved(id: id);
    notifyListeners();
  }
}
