import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:widgetbooktestapp/pages/home_page.dart';

/// Caso de uso para la pantalla de Home Banking
/// Demuestra la interfaz principal de la aplicación bancaria
/// con saldo, tarjetas y accesos rápidos
@widgetbook.UseCase(name: 'Home Banking', type: HomePage)
Widget buildHomePageUseCase(BuildContext context) {
  return MaterialApp(
    // Configuración del tema para la demostración
    theme: ThemeData(
      primarySwatch: Colors.blue,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
    home: HomePage(),
    // Removemos el banner de debug para una presentación más limpia
    debugShowCheckedModeBanner: false,
  );
}

/// Caso de uso alternativo que muestra solo el widget de acciones rápidas
/// Permite personalizar el comportamiento de los botones individualmente
@widgetbook.UseCase(name: 'Acciones Rápidas', type: _QuickActionsDemo)
Widget buildQuickActionsDemoUseCase(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.grey[50],
    appBar: AppBar(
      title: Text('Demo - Acciones Rápidas'),
      backgroundColor: Colors.blue[700],
    ),
    body: Padding(
      padding: EdgeInsets.all(16),
      child: _QuickActionsDemo(
        // Permite personalizar el número de acciones mostradas
        showTransferAction: context.knobs.boolean(
          label: 'Mostrar Transferir',
          initialValue: true,
        ),
        showPayAction: context.knobs.boolean(
          label: 'Mostrar Pagar',
          initialValue: true,
        ),
        showQRAction: context.knobs.boolean(
          label: 'Mostrar QR',
          initialValue: true,
        ),
        showMoreAction: context.knobs.boolean(
          label: 'Mostrar Más',
          initialValue: true,
        ),
      ),
    ),
  );
}

/// Widget demo para mostrar solo las acciones rápidas
/// Útil para testear el comportamiento individual de cada botón
class _QuickActionsDemo extends StatelessWidget {
  final bool showTransferAction;
  final bool showPayAction;
  final bool showQRAction;
  final bool showMoreAction;

  const _QuickActionsDemo({
    this.showTransferAction = true,
    this.showPayAction = true,
    this.showQRAction = true,
    this.showMoreAction = true,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> actions = [];

    if (showTransferAction) {
      actions.add(
        Expanded(
          child: _QuickActionButton(
            icon: Icons.send,
            label: 'Transferir',
            color: Colors.green,
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Transferir presionado')),
              );
            },
          ),
        ),
      );
    }

    if (showPayAction) {
      if (actions.isNotEmpty) actions.add(SizedBox(width: 12));
      actions.add(
        Expanded(
          child: _QuickActionButton(
            icon: Icons.payment,
            label: 'Pagar',
            color: Colors.orange,
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Pagar presionado')),
              );
            },
          ),
        ),
      );
    }

    if (showQRAction) {
      if (actions.isNotEmpty) actions.add(SizedBox(width: 12));
      actions.add(
        Expanded(
          child: _QuickActionButton(
            icon: Icons.qr_code,
            label: 'QR',
            color: Colors.purple,
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('QR presionado')),
              );
            },
          ),
        ),
      );
    }

    if (showMoreAction) {
      if (actions.isNotEmpty) actions.add(SizedBox(width: 12));
      actions.add(
        Expanded(
          child: _QuickActionButton(
            icon: Icons.more_horiz,
            label: 'Más',
            color: Colors.grey[600]!,
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Más presionado')),
              );
            },
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Acciones rápidas',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.grey[800],
          ),
        ),
        SizedBox(height: 16),
        Row(children: actions),
      ],
    );
  }
}

/// Widget personalizado para los botones de acceso rápido
/// Reutilizado desde HomePage para mantener consistencia
class _QuickActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onPressed;

  const _QuickActionButton({
    required this.icon,
    required this.label,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                icon,
                color: color,
                size: 24,
              ),
            ),
            SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.grey[700],
              ),
            ),
          ],
        ),
      ),
    );
  }
}