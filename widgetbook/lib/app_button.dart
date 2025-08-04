import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:widgetbooktestapp/widgets/app_button.dart';

@widgetbook.UseCase(name: 'Default', type: AppButton)
Widget buildCoolButtonUseCase(BuildContext context) {
  return Center(
    child: AppButton(
      // El context.knobs se usa para dar valores custom desde el widgetbook
      label: context.knobs.string(
        label: 'Button Label',
        initialValue: 'Click me',
      ),
      onPressed: () {},
      color: context.knobs.color(
        label: 'Button Color',
        initialValue: Colors.blue,
      ),
    ),
  );
}
