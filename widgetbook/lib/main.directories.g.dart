// dart format width=80
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:widgetbook/widgetbook.dart' as _widgetbook;
import 'package:widgetbook_workspace/app_button.dart'
    as _widgetbook_workspace_app_button;
import 'package:widgetbook_workspace/page/login_page.dart'
    as _widgetbook_workspace_page_login_page;

final directories = <_widgetbook.WidgetbookNode>[
  _widgetbook.WidgetbookFolder(
    name: 'pages',
    children: [
      _widgetbook.WidgetbookLeafComponent(
        name: 'LoginPage',
        useCase: _widgetbook.WidgetbookUseCase(
          name: 'Login Page',
          builder: _widgetbook_workspace_page_login_page.loginPageUseCase,
        ),
      ),
    ],
  ),
  _widgetbook.WidgetbookFolder(
    name: 'widgets',
    children: [
      _widgetbook.WidgetbookLeafComponent(
        name: 'AppButton',
        useCase: _widgetbook.WidgetbookUseCase(
          name: 'Button',
          builder: _widgetbook_workspace_app_button.buildCoolButtonUseCase,
        ),
      ),
    ],
  ),
];
