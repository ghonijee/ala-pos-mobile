import 'package:ala_pos/domain/models/user/permission_model.dart';
import 'package:ala_pos/domain/models/user/role_model.dart';
import 'package:ala_pos/domain/models/user_model.dart';
import 'package:core/core.dart';
import 'package:get_it/get_it.dart';

class UserInfo {
  LocalStorage storage = GetIt.I.get<LocalStorage>();

  static String get roleName {
    RoleModel roleModel = UserInfo().storage.show<RoleModel>(Constant.userRole);
    return roleModel.name;
  }

  /// Check user status [Pro]
  static bool get isProUser {
    UserModel model = UserInfo().storage.show<UserModel>(Constant.userModel);
    return model.userStatus == UserStatus.PRO;
  }

  /// Check user status [Free]
  static bool get isFreeUser {
    UserModel model = UserInfo().storage.show<UserModel>(Constant.userModel);
    return model.userStatus == UserStatus.FREE;
  }

  /// Check user access by permission given
  static bool hasPermission(String permission) {
    var model = UserInfo().storage.findByKey<PermissionModel>(
          Constant.userPermissionList,
          permission,
        );
    if (model == null) {
      return false;
    }
    return true;
  }
}
