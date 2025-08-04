import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:widgetbooktestapp/widgets/app_button.dart';

@widgetbook.UseCase(name: 'Button', type: AppButton)
Widget buildCoolButtonUseCase(BuildContext context) {
  return Center(
    child: AppButton(
      // El context.knobs se usa para dar valores custom desde el widgetbook
      label: context.knobs.string(
        label: 'Titulo del boton',
        initialValue: 'Click me',
      ),
      onPressed: () {},
      color: context.knobs.color(
        label: 'Color del boton',
        initialValue: Colors.blue,
      ),
    ),
  );
}
