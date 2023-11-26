import 'package:hive/hive.dart';

part 'account.g.dart';

@HiveType(typeId: 0)
class Account extends HiveObject{

  @HiveField(0)
  String username;

  @HiveField(1)
  String password;

  Account({
    required this.username,
    required this.password,
  });

}