// import 'package:flutter/foundation.dart';
// import 'package:wellancer/models/profile.dart'; // Import ProfileModel

// class ProfileProvider with ChangeNotifier {
//   ProfileModel? _profile;

//   ProfileModel? get profile => _profile;

//   set profile(ProfileModel? value) {
//     _profile = value;
//     notifyListeners();
//   }

//   void updateProfile(ProfileModel profile) {
//     _profile = profile;
//     notifyListeners();
//   }
// }

import 'package:flutter/foundation.dart';
import 'package:wellancer/models/profile.dart'; // Import ProfileModel

class ProfileProvider with ChangeNotifier {
  ProfileModel? _profile;

  ProfileModel? get profile => _profile;

  set profile(ProfileModel? value) {
    _profile = value;
    notifyListeners();
  }
}
