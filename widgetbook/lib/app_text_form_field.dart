import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:widgetbooktestapp/widgets/app_text_form_field.dart';

@widgetbook.UseCase(name: 'TextFormField', type: AppTextFormField)
Widget buildTextFormFieldUseCase(BuildContext context) {
  final controller = TextEditingController();

  return Center(
    child: AppTextFormField(
      controller: controller,
      label: context.knobs.string(label: 'Label', initialValue: 'Correo electronico'),
      prefixIcon: Icons.email_outlined,
      obscureText: context.knobs.boolean(label: 'Obscure Text'),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor ingresa tu correo';
        }
        if (!value.contains('@')) {
          return 'Ingresa un correo válido';
        }
        return null;
      },
    ),
  );
}