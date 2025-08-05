# Cómo Agregar Pantallas y Widgets a Widgetbook

## 📚 Introducción

Esta guía explica el proceso completo para agregar nuevas pantallas y widgets a Widgetbook en nuestro proyecto Flutter. Widgetbook es una herramienta que permite crear un catálogo interactivo de componentes UI, facilitando el desarrollo, testing y documentación de widgets.

## 🏗️ Estructura del Proyecto

```
whitelabel-app/
├── lib/                     # Aplicación principal
│   ├── pages/              # Pantallas de la app
│   ├── widgets/            # Widgets reutilizables
│   └── main.dart
└── widgetbook/             # Proyecto Widgetbook
    ├── lib/
    │   ├── page/           # Casos de uso para pantallas
    │   ├── main.dart       # Configuración principal
    │   └── *.dart          # Casos de uso para widgets
    └── pubspec.yaml
```

## 🎯 Ejemplo Práctico: Pantalla de Home Banking

Vamos a documentar el proceso completo usando como ejemplo la pantalla de home banking que acabamos de crear.

### Paso 1: Crear la Pantalla Principal

Primero, creamos nuestra pantalla en la aplicación principal:

**Archivo:** `lib/pages/home_page.dart`

```dart
import 'package:flutter/material.dart';
import 'package:widgetbooktestapp/widgets/app_card.dart';
import 'package:widgetbooktestapp/widgets/app_button.dart';

/// Pantalla principal de home banking que muestra el saldo,
/// tarjetas del usuario y accesos rápidos
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

// ... implementación completa de la pantalla
```

**Características implementadas:**
- ✅ Header con saludo personalizado
- ✅ Sección de saldo con gradiente atractivo
- ✅ Acciones rápidas (Transferir, Pagar, QR, Más)
- ✅ Tarjetas de crédito con diseño bancario
- ✅ Transacciones recientes
- ✅ Bottom navigation bar
- ✅ Comentarios en español para documentación

### Paso 2: Crear el Caso de Uso en Widgetbook

Después, creamos el archivo de Widgetbook para nuestra pantalla:

**Archivo:** `widgetbook/lib/page/home_page.dart`

```dart
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:widgetbooktestapp/pages/home_page.dart';

/// Caso de uso para la pantalla de Home Banking
@widgetbook.UseCase(name: 'Home Banking', type: HomePage)
Widget buildHomePageUseCase(BuildContext context) {
  return MaterialApp(
    theme: ThemeData(
      primarySwatch: Colors.blue,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
    home: HomePage(),
    debugShowCheckedModeBanner: false,
  );
}
```

**Puntos importantes:**
- ✅ Importar las dependencias necesarias
- ✅ Usar la anotación `@widgetbook.UseCase`
- ✅ Envolver en MaterialApp si es necesario
- ✅ Documentar el propósito del caso de uso

### Paso 3: Regenerar los Archivos de Widgetbook

Ejecutar el comando para regenerar los archivos automáticos:

```bash
cd widgetbook
flutter packages pub run build_runner build --delete-conflicting-outputs
```

Este comando:
- 🔄 Escanea todas las anotaciones `@widgetbook.UseCase`
- 📝 Regenera el archivo `main.directories.g.dart`
- 🔄 Actualiza la navegación de Widgetbook

## 📋 Proceso Detallado para Cualquier Widget/Pantalla

### 1. Planificación

Antes de empezar, define:
- **Propósito:** ¿Qué funcionalidad tendrá el widget?
- **Ubicación:** ¿En `pages/` o `widgets/`?
- **Dependencias:** ¿Qué otros widgets necesita?
- **Configuraciones:** ¿Qué propiedades serán personalizables?

### 2. Implementación del Widget

```dart
// Ejemplo de estructura básica
import 'package:flutter/material.dart';

/// Descripción clara del widget en español
/// Explica qué hace y cuándo se debe usar
class MiNuevoWidget extends StatelessWidget {
  // Propiedades configurables
  final String titulo;
  final Color color;
  final VoidCallback? onPressed;

  const MiNuevoWidget({
    super.key,
    required this.titulo,
    this.color = Colors.blue,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    // Implementación del widget
    return Container(/* ... */);
  }
}
```

### 3. Creación del Caso de Uso en Widgetbook

```dart
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:widgetbooktestapp/widgets/mi_nuevo_widget.dart';

/// Descripción del caso de uso en español
@widgetbook.UseCase(name: 'Mi Nuevo Widget', type: MiNuevoWidget)
Widget buildMiNuevoWidgetUseCase(BuildContext context) {
  return Center(
    child: MiNuevoWidget(
      titulo: context.knobs.string(
        label: 'Título',
        initialValue: 'Título de ejemplo',
      ),
      color: context.knobs.color(
        label: 'Color',
        initialValue: Colors.blue,
      ),
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Widget presionado!')),
        );
      },
    ),
  );
}
```

### 4. Tipos de Knobs Disponibles

Los knobs permiten personalizar widgets desde la interfaz de Widgetbook:

```dart
// Texto
context.knobs.string(label: 'Texto', initialValue: 'Valor inicial')

// Números
context.knobs.double.slider(label: 'Tamaño', initialValue: 16.0, min: 10.0, max: 24.0)
context.knobs.int.slider(label: 'Cantidad', initialValue: 5, min: 1, max: 10)

// Booleanos
context.knobs.boolean(label: 'Mostrar', initialValue: true)

// Colores
context.knobs.color(label: 'Color', initialValue: Colors.blue)

// Opciones
context.knobs.list(
  label: 'Tipo',
  options: ['Opción A', 'Opción B', 'Opción C'],
  initialOption: 'Opción A',
)
```

### 5. Regeneración y Testing

1. **Regenerar archivos:**
   ```bash
   cd widgetbook
   flutter packages pub run build_runner build --delete-conflicting-outputs
   ```

2. **Ejecutar Widgetbook:**
   ```bash
   cd widgetbook
   flutter run
   ```

3. **Verificar en la interfaz:**
   - ✅ El widget aparece en la navegación
   - ✅ Los knobs funcionan correctamente
   - ✅ La documentación es clara
   - ✅ No hay errores en la consola

## 🎨 Mejores Prácticas

### Documentación

```dart
/// [Título claro y descriptivo]
/// 
/// Descripción detallada que explique:
/// - Qué hace el widget
/// - Cuándo se debe usar
/// - Qué parámetros son obligatorios vs opcionales
/// 
/// Ejemplo de uso:
/// ```dart
/// MiWidget(
///   titulo: 'Ejemplo',
///   onPressed: () => print('Presionado'),
/// )
/// ```
class MiWidget extends StatelessWidget {
  // ...
}
```

### Estructura de Archivos

```
widgetbook/lib/
├── page/                   # Casos de uso para pantallas completas
│   ├── home_page.dart
│   ├── login_page.dart
│   └── ...
├── widget/                 # Casos de uso para widgets individuales (opcional)
│   ├── app_button.dart
│   ├── app_card.dart
│   └── ...
├── main.dart              # Configuración principal
└── main.directories.g.dart # Generado automáticamente
```


### Casos de Uso Múltiples

Puedes crear varios casos de uso para el mismo widget:

```dart
@widgetbook.UseCase(name: 'Botón Básico', type: AppButton)
Widget buildBasicButtonUseCase(BuildContext context) {
  // Configuración básica
}

@widgetbook.UseCase(name: 'Botón con Icono', type: AppButton)
Widget buildIconButtonUseCase(BuildContext context) {
  // Configuración con icono
}
```

## 🚀 Comandos Útiles

### Desarrollo

```bash
# Regenerar archivos de Widgetbook
cd widgetbook && flutter packages pub run build_runner build --delete-conflicting-outputs

# Ejecutar Widgetbook
cd widgetbook && flutter run

# Ejecutar aplicación principal
flutter run

# Limpiar y regenerar todo
cd widgetbook && flutter clean && flutter pub get && flutter packages pub run build_runner build --delete-conflicting-outputs
```

### Debugging

```bash
# Ver archivos generados
cd widgetbook && flutter packages pub run build_runner build --verbose

# Eliminar archivos generados y regenerar
cd widgetbook && flutter packages pub run build_runner clean && flutter packages pub run build_runner build
```

## 📊 Resultados del Ejemplo

Con la pantalla de home banking implementada, obtienes:

1. **Pantalla funcional:** Una interfaz completa de home banking
2. **Casos de uso en Widgetbook:** 
   - Vista completa de la pantalla
   - Demo individual de acciones rápidas
3. **Componentes reutilizables:** Widgets que pueden usarse en otras pantallas


---

**💡 Tip:** Siempre regenera los archivos de Widgetbook después de agregar nuevos casos de uso. El comando `build_runner` es tu mejor amigo en este proceso.