<div align="center">
  <img src="Screenshots/AppIcon.png" width="120" style="border-radius: 24px; margin-bottom: 20px;" alt="ArtGallery App Icon"/>
  <h1>🎨 ArtGallery</h1>
  <p><em>Aplicación iOS desarrollada para el reto final del programa iOS Developer del Tecnológico de Monterrey.</em></p>
</div>

---

## 📸 Galería de la App

<div align="center">
  <table>
    <tr>
      <td align="center"><img src="Screenshots/Home%20Screen.png" width="220" style="border-radius: 12px;"/></td>
      <td align="center"><img src="Screenshots/Detailed%20View.png" width="220" style="border-radius: 12px;"/></td>
      <td align="center"><img src="Screenshots/Pinch%20to%20Zoom.png" width="220" style="border-radius: 12px;"/></td>
      <td align="center"><img src="Screenshots/Swift%20Graphs.png" width="220" style="border-radius: 12px;"/></td>
    </tr>
    <tr>
      <td align="center"><i>Pantalla Principal (Galería)</i></td>
      <td align="center"><i>Vista Detallada de Obra</i></td>
      <td align="center"><i>Zoom Interactivo (Pellizco)</i></td>
      <td align="center"><i>Gráficas Financieras</i></td>
    </tr>
  </table>
</div>

---

<div align="center">
  <a href="https://youtu.be/kkltOn5Wfws">
    <img src="https://img.youtube.com/vi/kkltOn5Wfws/maxresdefault.jpg" alt="Video Demo ArtGallery" width="600" style="border-radius: 12px; box-shadow: 0 4px 8px rgba(0,0,0,0.2);"/>
  </a>
  <br>
  <i>▶️ Haz clic en la imagen para ver el video demostrativo de la app en YouTube</i>
</div>

---

## 👨‍💻 Sobre el Proyecto

**ArtGallery** es una aplicación nativa para iOS diseñada para visualizar, interactuar y administrar una colección de obras de arte. Se destaca por una interfaz moderna, fluida y altamente reactiva, pensada para ofrecer una experiencia premium apegada a las **Apple Human Interface Guidelines**.

> [!NOTE]
> **Contexto del Reto:** Este proyecto fue elaborado de acuerdo a los requerimientos del reto del programa **iOS Developer del Tecnológico de Monterrey**. La aplicación incluye navegación avanzada, manipulación de vistas con gestos y visualización de datos estadísticos usando Swift Charts, evaluando competencias de diseño responsivo y arquitectura SwiftUI.

---

## 🛠️ Tecnologías y Herramientas

<div align="center">
  <img src="https://img.shields.io/badge/Swift-FA7343?style=for-the-badge&logo=swift&logoColor=white" />
  <img src="https://img.shields.io/badge/SwiftUI-000000?style=for-the-badge&logo=swift&logoColor=blue" />
  <img src="https://img.shields.io/badge/Swift_Charts-34C759?style=for-the-badge&logo=apple&logoColor=white" />
  <img src="https://img.shields.io/badge/Xcode-147EFB?style=for-the-badge&logo=xcode&logoColor=white" />
  <img src="https://img.shields.io/badge/iOS_17+-000000?style=for-the-badge&logo=apple&logoColor=white" />
</div>

---

## 🏗 Arquitectura y Detalles Técnicos

La aplicación está construida utilizando **SwiftUI**, garantizando un flujo de datos reactivo y un código altamente mantenible con un fuerte enfoque en el diseño de interfaces escalables.

### 📁 Jerarquía de Archivos

- **`ObraDeArte.swift`**: Contiene el modelo de datos principal (`ObraDeArte`) y el arreglo de obras predeterminadas (`galeriaObras`). Implementa el protocolo `Identifiable` para su fácil integración en las vistas.
- **`ContentView.swift`**: La vista raíz que implementa un `TabView` para navegar entre la sección de galería y la sección de gráficas.
- **`VistaGaleria.swift`**: Implementa una interfaz de tarjetas de borde a borde (*edge-to-edge*) con superposiciones de gradientes. Incluye un buscador (`.searchable`) integrado de manera nativa para filtrar obras por título o autor.
- **`ObraVistaDetalle.swift`**: Una vista detallada y elegante que muestra información curatorial y el valor de la pieza. Utiliza `GeometryReader` y gestos de ampliación (`MagnificationGesture`) para permitir al usuario hacer zoom detallado en las pinturas manteniéndolas centradas.
- **`GraficaGaleria.swift`**: Integra el moderno *framework* `Charts` de Swift para mostrar un historial de ingresos y egresos a través de gráficos de línea atractivos y responsivos, con colores y leyendas automáticas.

### ✨ Features Principales

- **Gestión de Galería:** Explora una colección cuidadosamente curada con una UI premium.
- **Búsqueda Dinámica:** Filtra rápidamente las obras de arte disponibles en tiempo real.
- **Interacción Multitáctil:** Inspecciona de cerca cada pincelada usando doble toque o gestos de pellizco en la vista de detalles.
- **Estadísticas Visuales:** Visualiza de forma clara el desempeño financiero de la galería mediante gráficos dinámicos integrados con *Swift Charts*.
- **Diseño Adaptativo:** Uso de *safe areas* correctas, gradientes sutiles y máxima legibilidad sin textos cortados, asegurando que el contenido sea siempre el protagonista.
