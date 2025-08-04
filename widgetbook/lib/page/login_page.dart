import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:widgetbooktestapp/pages/login_page.dart';

@widgetbook.UseCase(name: 'Login Page', type: LoginPage)
Widget loginPageUseCase(BuildContext context) {
  return const LoginPage();
}