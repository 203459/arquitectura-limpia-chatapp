import 'package:chat_grupal/features/user/presentation/page/credential/forgot_password_page.dart';
import 'package:chat_grupal/features/user/presentation/page/credential/login_page.dart';
import 'package:chat_grupal/features/user/presentation/page/credential/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:chat_grupal/features/global/const/page_const.dart';
import 'package:chat_grupal/features/group/domain/entities/single_chat_entity.dart';
import 'package:chat_grupal/features/group/presentation/create_group/create_group_page.dart';
import 'package:chat_grupal/features/group/presentation/pages/chat/single_chat_page.dart';

class OnGenerateRoute {
  static Route<dynamic> route(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case PageConst.loginPage:
        {
          return materialPageBuilder(widget: LoginPage());
        }
      case PageConst.forgotPage:
        {
          return materialPageBuilder(widget: ForgotPasswordPage());
        }
      case PageConst.registrationPage:
        {
          return materialPageBuilder(widget: SignUpPage());
        }

      case PageConst.createGroupPage:
        {
          if (args is String) {
            return materialPageBuilder(
                widget: CreateGroupPage(
              uid: args,
            ));
          } else {
            return materialPageBuilder(widget: ErrorPage());
          }
        }
      case PageConst.singleChatPage:
        {
          if (args is SingleChatEntity) {
            return materialPageBuilder(
                widget: SingleChatPage(
              singleChatEntity: args,
            ));
          } else {
            return materialPageBuilder(widget: ErrorPage());
          }
        }
      default:
        return materialPageBuilder(widget: ErrorPage());
    }
  }
}

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("error"),
      ),
      body: Center(
        child: Text("error"),
      ),
    );
  }
}

MaterialPageRoute materialPageBuilder({required Widget widget}) {
  return MaterialPageRoute(builder: (_) => widget);
}
