import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:widgetbooktestapp/widgets/app_card.dart';

@widgetbook.UseCase(name: 'Card', type: AppCard)
Widget buildAppCardUseCase(BuildContext context) {
  return Center(
    child: SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: AppCard(
        title: context.knobs.string(
          label: 'Título',
          initialValue: 'Título de la Tarjeta',
        ),
        subtitle: context.knobs.string(
          label: 'Subtítulo',
          initialValue: 'Subtítulo ejemplo',
        ),
        description: context.knobs.string(
          label: 'Descripción',
          initialValue: 'Esta es una descripción de ejemplo para la tarjeta que puede contener múltiples líneas de texto.',
        ),
        imageUrl: context.knobs.string(
          label: 'URL de Imagen',
          initialValue: 'https://images.ctfassets.net/hrltx12pl8hq/7JnR6tVVwDyUM8Cbci3GtJ/bf74366cff2ba271471725d0b0ef418c/shutterstock_376532611-og.jpg?fit=fill&w=1200&h=630',
        ),
        backgroundColor: context.knobs.color(
          label: 'Color de Fondo',
          initialValue: Colors.white,
        ),
        titleColor: context.knobs.color(
          label: 'Color del Título',
          initialValue: Colors.black87,
        ),
        subtitleColor: context.knobs.color(
          label: 'Color del Subtítulo',
          initialValue: Colors.grey,
        ),
        descriptionColor: context.knobs.color(
          label: 'Color de la Descripción',
          initialValue: Colors.black54,
        ),
        borderRadius: context.knobs.double.slider(
          label: 'Radio del Borde',
          initialValue: 12.0,
          min: 0.0,
          max: 30.0,
        ),
        showImage: context.knobs.boolean(
          label: 'Mostrar Imagen',
          initialValue: true,
        ),
        imageHeight: context.knobs.double.slider(
          label: 'Altura de Imagen',
          initialValue: 200.0,
          min: 100.0,
          max: 400.0,
        ),
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('¡Card presionada!'),
              duration: Duration(seconds: 1),
            ),
          );
        },
      ),
    ),
  );
}