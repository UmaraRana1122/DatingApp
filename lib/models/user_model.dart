class UserModel {
  String id = '', fcmId = '';
  DateTime createDate = DateTime(1998);
  int userType = 0;
  String loginType = 'email';
  String email = '', number = '', contactEmail = '';
  String initialPassword = '';
  String userName = '', name = '', contactName = '';
  bool online = true, enable = true;
  bool completeProfile = false;
  String closeStatusReason = '';
  int plan = 0;
  String planKey = '';
  DateTime planExpireDate = DateTime.now();
  String shortDescription = "", moreDescription = "";
  List<int> regionType = [], foodType = [], resType = [];
  List<String> typeFilters = [];
  bool locationEnable = false;
  String street = '', city = '', zipCode = "", state = "", country = "";
  Map<String, List<Map<String, DateTime>>> timing = {
    'Mon': [],
    'Tue': [],
    'Wed': [],
    'Thu': [],
    'Fri': [],
    'Sat': [],
    'Sun': []
  };
  String website = '';
  List<String> socialMediaList = [
    "",
    "",
    "",
    ""
  ]; // fb, insta, twitter, whatapp
  String profileImage = '', bannerImage = '';
  List<String> resImages = ["", "", "", "", "", "", "", ""];
  List<String> selectedTypes = [];
  List<bool> notifications = [
    false,
    false,
    false,
    false
  ]; // follow, week(Tue), weekend(Fri), admin
  List<String> followings = [];
  int followersCount = 0;
  int postCounter = 0;
  DateTime postCounterDate = DateTime.now();
  UserModel();
  UserModel.toModel(Map<String, dynamic> jsonMap) {
    id = jsonMap['id'];
    followings = List<String>.from(jsonMap['followings'] ?? []);
    fcmId = jsonMap['fcmId'];
    createDate = jsonMap['createDate'].toDate();
    userType = jsonMap['userType'];
    loginType = jsonMap['loginType'];
    followersCount = jsonMap['followersCount'] ?? 0;
    locationEnable = jsonMap['locationEnable'] ?? false;
    number = jsonMap['number'];
    email = jsonMap['email'];
    contactEmail = jsonMap['contactEmail'];
    contactName = jsonMap['contactName'];
    initialPassword = jsonMap['initialPassword'];
    userName = jsonMap['userName'];
    name = jsonMap['name'];
    selectedTypes = List<String>.from(jsonMap['selectedTypes']);
    completeProfile = jsonMap['completeProfile'] ?? false;
    closeStatusReason = jsonMap['closeStatusReason'];
    loginType = jsonMap['loginType'];
    resImages = List<String>.from(
        jsonMap['resImages'] ?? ["", "", "", "", "", "", "", ""]);
    bannerImage = jsonMap['bannerImage'] ?? "";
    notifications = List<bool>.from(jsonMap['notifications']);
    profileImage = jsonMap['profileImage'];
    website = jsonMap['website'];
    country = jsonMap['country'];
    state = jsonMap['state'];
    zipCode = jsonMap['zipCode'];
    city = jsonMap['city'];
    street = jsonMap['street'];
    plan = jsonMap['plan'];
    planKey = jsonMap['planKey'] ?? "";
    socialMediaList = List<String>.from(jsonMap['socialMediaList']);
    typeFilters = List<String>.from(jsonMap['typeFilters']);
    planExpireDate = jsonMap['planExpireDate'] == null
        ? DateTime.now()
        : jsonMap['planExpireDate'].toDate();
    timing = convert(jsonMap['timing'] as Map);
    shortDescription = jsonMap['shortDescription'];
    moreDescription = jsonMap['moreDescription'];
    regionType = List<int>.from(jsonMap['regionType'] ?? []);
    foodType = List<int>.from(jsonMap['foodType'] ?? []);
    resType = List<int>.from(jsonMap['resType'] ?? []);
    postCounter = jsonMap['postCounter'] ?? 0;
    postCounterDate = jsonMap['postCounterDate'] == null
        ? DateTime.now()
        : jsonMap['postCounterDate'].toDate();
  }
  Map<String, List<Map<String, DateTime>>> convert(Map rawValue) {
    Map<String, List<Map<String, DateTime>>> result = {
      'Mon': [],
      'Tue': [],
      'Wed': [],
      'Thu': [],
      'Fri': [],
      'Sat': [],
      'Sun': []
    };
    rawValue.forEach((key, value) {
      List<Map<String, DateTime>> newDay = [];
      for (Map session in value) {
        DateTime start = session['0'].toDate();
        DateTime end = session['1'].toDate();
        newDay.add({'0': start, '1': end});
      }
      result[key] = newDay;
    });
    return result;
  }

  Map<String, dynamic> toJSON() {
    Map<String, dynamic> jsonMap = <String, dynamic>{};
    jsonMap['id'] = id;
    jsonMap['fcmId'] = fcmId;
    jsonMap['createDate'] = createDate;
    jsonMap['userType'] = userType;
    jsonMap['locationEnable'] = locationEnable;
    jsonMap['followings'] = followings;
    jsonMap['loginType'] = loginType;
    jsonMap['number'] = number;
    jsonMap['email'] = email;
    jsonMap['contactEmail'] = contactEmail;
    jsonMap['contactName'] = contactName;
    jsonMap['initialPassword'] = initialPassword;
    jsonMap['userName'] = userName.toLowerCase();
    jsonMap['name'] = name;
    jsonMap['selectedTypes'] = selectedTypes;
    jsonMap['completeProfile'] = completeProfile;
    jsonMap['closeStatusReason'] = closeStatusReason;
    jsonMap['bannerImage'] = bannerImage;
    jsonMap['notifications'] = notifications;
    jsonMap['loginType'] = loginType;
    jsonMap['resImages'] = resImages;
    jsonMap['profileImage'] = profileImage;
    jsonMap['website'] = website;
    jsonMap['country'] = country;
    jsonMap['state'] = state;
    jsonMap['zipCode'] = zipCode;
    jsonMap['city'] = city;
    jsonMap['street'] = street;
    jsonMap['plan'] = plan;
    jsonMap['planKey'] = planKey;
    jsonMap['socialMediaList'] = socialMediaList;
    jsonMap['planExpireDate'] = planExpireDate;
    jsonMap['timing'] = timing;
    jsonMap['shortDescription'] = shortDescription;
    jsonMap['moreDescription'] = moreDescription;
    jsonMap['regionType'] = regionType;
    jsonMap['foodType'] = foodType;
    jsonMap['resType'] = resType;
    jsonMap['typeFilters'] = typeFilters;
    jsonMap['postCounter'] = postCounter;
    jsonMap['postCounterDate'] = postCounterDate;
    return jsonMap;
  }
}
