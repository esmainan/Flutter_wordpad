class user {

  int id = 0;
  String userId = "";
  String password = "";
  String token = "";
  String status = "";

  user(String userId, String password, String token, String status) {
    this.userId = userId;
    this.password = password;
    this.token = token;
    this.status = status;
  }
  //named constructor
  user.addId(
      int Id, String userId, String password, String token, String status) {
    this.id = id;
    this.userId = userId;
    this.password = password;
    this.token = token;
    this.status = status;
  }
}
