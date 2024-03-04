class Model {
  String? profName;
  String? profBio;
  String? profAddress;
  String? profMobile;
  String? profEmail;
  String? userID;
  String? compname;
  String? lastmsg;
  String? userMsg;
  String? compMsg;
  String? postapply;
  String? test;
  List<String> userMsgList = [];
  List<String> compMsgList = [];
  List<dynamic> suggestedJobs = [];
  List<dynamic> allJobs = [];

  Model({
    required this.profName,
    required this.profBio,
    required this.profAddress,
    required this.profMobile,
    required this.profEmail,
    required this.userID,
    required this.compname,
    required this.lastmsg,
    required this.userMsg,
    required this.compMsg,
    required this.postapply,
    required this.test,
    required this.userMsgList,
    required this.compMsgList,
    required this.suggestedJobs,
    required this.allJobs,
  });


  String? get getProfName => profName;
  String? get getProfBio => profBio;
  String? get getProfAddress => profAddress;
  String? get getProfMobile => profMobile;
  String? get getProfEmail => profEmail;
  String? get getUserID => userID;
  String? get getCompname => compname;
  String? get getLastmsg => lastmsg;
  String? get getUserMsg => userMsg;
  String? get getCompMsg => compMsg;
  String? get getPostapply => postapply;
  String? get getTest => test;
  List<String> get getUserMsgList => userMsgList;
  List<String> get getCompMsgList => compMsgList;
  List<dynamic> get getSuggestedJobs => suggestedJobs;
  List<dynamic> get getAllJobs => allJobs;


  set setProfName(String? name) => profName = name;
  set setProfBio(String? bio) => profBio = bio;
  set setProfAddress(String? address) => profAddress = address;
  set setProfMobile(String? mobile) => profMobile = mobile;
  set setProfEmail(String? email) => profEmail = email;
  set setUserID(String? id) => userID = id;
  set setCompname(String? name) => compname = name;
  set setLastmsg(String? msg) => lastmsg = msg;
  set setUserMsg(String? msg) => userMsg = msg;
  set setCompMsg(String? msg) => compMsg = msg;
  set setPostapply(String? apply) => postapply = apply;
  set setTest(String? value) => test = value;
  set setUserMsgList(List<String> messages) => userMsgList = messages;
  set setCompMsgList(List<String> messages) => compMsgList = messages;
  set setSuggestedJobs(List<dynamic> jobs) => suggestedJobs = jobs;
  set setAllJobs(List<dynamic> jobs) => allJobs = jobs;
}
