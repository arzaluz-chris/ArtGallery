# ArtGallery — SwiftUI App

## Objetivo

Construir una aplicación móvil en SwiftUI que permita visualizar las obras de una galería de arte y mostrar gráficas de ingresos y egresos de la misma.

## Contexto

La aplicación tiene dos audiencias principales:

- **Visitantes / clientes:** pueden explorar las obras expuestas en la galería, ver su imagen en lista y navegar a una vista de detalle donde pueden ampliar la imagen con un gesto de doble tap.
- **Administradores:** pueden consultar una gráfica de línea con los ingresos y egresos mensuales de la galería.

La arquitectura es sencilla: dos tabs en la parte inferior, uno para la galería y otro para las gráficas.

---

## Prerequisito: Imágenes en Assets

Las siguientes imágenes ya deben estar en `ArtGallery/Resources/Assets.xcassets` antes de compilar:

| Nombre en Assets         |
|--------------------------|
| `paisajeCampirano`       |
| `paisajeCerroSilla`      |
| `paisajeConLuces`        |
| `atardecer`              |
| `cascada`                |
| `desdeLasNubes`          |
| `montañas`               |

> Si usas imágenes propias, asegúrate de que los nombres en Assets coincidan exactamente con los strings usados en `ObraDeArte.listaObras`.

---

## Archivos a crear

El proyecto final tendrá esta estructura relevante:

```
ArtGallery/
├── ArtGalleryApp.swift          (generado por Xcode, no modificar)
├── ContentView.swift            (modificar — integración con TabView)
├── ObraDeArte.swift             (Swift File — modelo de datos)
├── ResultadosGaleria.swift      (Swift File — modelo de datos para gráfica)
├── VistaGaleria.swift           (SwiftUI View — lista de obras)
├── ObraVistaDetalle.swift       (SwiftUI View — detalle de una obra)
└── GraficaGaleria.swift         (SwiftUI View — gráfica de ingresos/egresos)
```

---

## Paso 1 — Crear el modelo `ObraDeArte`

**Tipo de archivo:** Swift File  
**Nombre:** `ObraDeArte.swift`

Este archivo define la estructura de datos que representa una obra de arte y la lista estática de obras de la galería.

```swift
import Foundation

struct ObraDeArte: Identifiable {
    var id = UUID()
    var titulo: String
    var artista: String
    var year: String
    var tecnica: String
    var imagen: String

    static var listaObras: [ObraDeArte] = [
        ObraDeArte(titulo: "Cerro de la silla",    artista: "Karla Rojas",         year: "2015", tecnica: "Fotografía", imagen: "paisajeCerroSilla"),
        ObraDeArte(titulo: "Paisaje Con Luces",    artista: "Federico Buenavista", year: "2000", tecnica: "Oleo",       imagen: "paisajeConLuces"),
        ObraDeArte(titulo: "Cascada",              artista: "Guadalupe Leal",      year: "1978", tecnica: "Oleo",       imagen: "cascada"),
        ObraDeArte(titulo: "Atardecer",            artista: "Karla Rojas",         year: "2011", tecnica: "Oleo",       imagen: "atardecer"),
        ObraDeArte(titulo: "Desde las nubes",      artista: "Federico Buenavista", year: "2021", tecnica: "Oleo",       imagen: "desdeLasNubes"),
        ObraDeArte(titulo: "Montañas",             artista: "Patricia Robles",     year: "2001", tecnica: "Acuarela",   imagen: "montañas"),
        ObraDeArte(titulo: "Paisaje Campirano",    artista: "Patricia Robles",     year: "1992", tecnica: "Lápiz",      imagen: "paisajeCampirano")
    ]
}
```

**Puntos clave:**
- Conforma `Identifiable` para poder usarlo en `ForEach` sin especificar `id:`.
- `id = UUID()` genera un identificador único automáticamente para cada instancia.
- La variable `listaObras` es `static`, por lo que se accede como `ObraDeArte.listaObras` sin necesidad de instanciar la estructura.

---

## Paso 2 — Crear la vista `VistaGaleria`

**Tipo de archivo:** SwiftUI View  
**Nombre:** `VistaGaleria.swift`

Esta vista muestra la lista completa de obras en forma de scroll vertical. Cada elemento muestra el título de la obra y su imagen. Al tocar una obra, navega a `ObraVistaDetalle`.

```swift
import SwiftUI

struct VistaGaleria: View {
    @Binding var listaObras: [ObraDeArte]

    var body: some View {
        NavigationView {
            ScrollView {
                ForEach($listaObras) { $obra in
                    NavigationLink(destination: ObraVistaDetalle(obra: $obra)) {
                        VStack {
                            Text(obra.titulo)
                                .font(.title3)
                                .foregroundStyle(.black)

                            Image(obra.imagen)
                                .resizable()
                                .scaledToFill()
                                .frame(height: 200)
                                .clipped()
                                .cornerRadius(8)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(Color.gray, lineWidth: 1)
                                )

                            Divider()
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Galería de Arte")
        }
    }
}

#Preview {
    VistaGaleria(listaObras: .constant(ObraDeArte.listaObras))
}
```

**Puntos clave:**
- `@Binding var listaObras` recibe la lista desde `ContentView` mediante un binding, lo que permite que los datos fluyan en un único lugar (fuente de verdad en `ContentView`).
- `ForEach($listaObras) { $obra in ... }` itera sobre los bindings individuales de cada obra, lo que permite pasarlos como `$obra` a la vista de detalle.
- `NavigationLink(destination: ObraVistaDetalle(obra: $obra))` habilita la navegación al detalle al tocar cualquier celda.
- Los modificadores de imagen recomendados: `.resizable()`, `.scaledToFill()`, `.frame(height: 200)`, `.clipped()`, `.cornerRadius(8)`, y un `.overlay` con `RoundedRectangle` para el borde gris. Puedes ajustar estos valores a tu criterio.
- En `#Preview` se pasa la lista completa usando `.constant(...)` para simular un binding sin estado real.

---

## Paso 3 — Crear la vista `ObraVistaDetalle`

**Tipo de archivo:** SwiftUI View  
**Nombre:** `ObraVistaDetalle.swift`

Esta vista muestra todos los datos de una obra y su imagen. La imagen puede ampliarse al doble con un doble tap, y reducirse de vuelta al tamaño original con otro doble tap. El cambio de tamaño tiene animación.

```swift
import SwiftUI

struct ObraVistaDetalle: View {
    @Binding var obra: ObraDeArte

    @State private var escalaActual: CGFloat = 1.0
    @State var imagenAmpliada = false

    var body: some View {
        VStack {
            Text(obra.titulo)
                .font(.title)
                .padding(.top, 30)

            Text("Artista: " + obra.artista)
                .font(.headline)
                .padding(.top)

            Text("Técnica: " + obra.tecnica)
                .font(.body)

            Text("Año: " + obra.year)
                .font(.subheadline)
                .foregroundStyle(.secondary)

            GeometryReader { geo in
                ScrollView([.horizontal, .vertical]) {
                    Image(obra.imagen)
                        .resizable()
                        .scaledToFit()
                        .frame(
                            width: geo.size.width * escalaActual,
                            height: geo.size.height * escalaActual
                        )
                        .gesture(
                            TapGesture(count: 2)
                                .onEnded {
                                    withAnimation(.easeInOut(duration: 0.5)) {
                                        if imagenAmpliada {
                                            escalaActual = 1.0
                                            imagenAmpliada = false
                                        } else {
                                            escalaActual = 2.0
                                            imagenAmpliada = true
                                        }
                                    }
                                }
                        )
                }
                .padding(.horizontal)
            }
        }
    }
}

#Preview {
    ObraVistaDetalle(obra: .constant(ObraDeArte.listaObras[0]))
}
```

**Puntos clave:**
- `@Binding var obra` recibe la obra seleccionada desde `VistaGaleria`.
- `escalaActual` controla el factor de escala de la imagen (1.0 = tamaño original, 2.0 = doble).
- `imagenAmpliada` es un booleano que actúa como toggle para saber el estado actual de la imagen.
- `GeometryReader { geo in ... }` proporciona el ancho (`geo.size.width`) y alto (`geo.size.height`) del contenedor, que se usan para calcular las dimensiones de la imagen dinámicamente.
- `TapGesture(count: 2)` detecta el doble tap. Se aplica directamente sobre la `Image`.
- `withAnimation(.easeInOut(duration: 0.5))` envuelve el cambio de estado para que la transición de escala sea suave. Puedes ajustar la duración entre 0.3 y 0.7 segundos.
- `ScrollView([.horizontal, .vertical])` permite desplazar la imagen cuando está ampliada y se sale de los límites de la pantalla.

---

## Paso 4 — Crear el modelo `ResultadosGaleria`

**Tipo de archivo:** Swift File  
**Nombre:** `ResultadosGaleria.swift`

Este modelo representa los datos financieros mensuales (ingresos y egresos) que se graficarán.

```swift
import Foundation

struct ResultadosGaleria: Identifiable {
    var id = UUID()
    var mes: String
    var montoIngresos: Float
    var montoEgresos: Float

    static var datosEjemplo = [
        ResultadosGaleria(mes: "Enero",   montoIngresos: 23800, montoEgresos: 12530),
        ResultadosGaleria(mes: "Febrero", montoIngresos: 18750, montoEgresos:  9320),
        ResultadosGaleria(mes: "Marzo",   montoIngresos: 34200, montoEgresos: 13500),
        ResultadosGaleria(mes: "Abril",   montoIngresos: 19550, montoEgresos: 21530),
        ResultadosGaleria(mes: "Mayo",    montoIngresos: 40200, montoEgresos: 10220),
        ResultadosGaleria(mes: "Junio",   montoIngresos: 15870, montoEgresos: 19130),
        ResultadosGaleria(mes: "Julio",   montoIngresos: 22930, montoEgresos: 15530)
    ]
}
```

**Puntos clave:**
- Conforma `Identifiable` para usarlo en `ForEach` dentro del `Chart`.
- `datosEjemplo` es `static` y contiene 7 meses de datos listos para graficar. Puedes modificar los montos o agregar más meses.

---

## Paso 5 — Crear la vista `GraficaGaleria`

**Tipo de archivo:** SwiftUI View  
**Nombre:** `GraficaGaleria.swift`

Esta vista muestra una gráfica de línea con dos series: ingresos (verde) y egresos (rojo). El chart es desplazable horizontalmente.

```swift
import SwiftUI
import Charts

struct GraficaGaleria: View {
    @State var resultadosGaleria = ResultadosGaleria.datosEjemplo

    var body: some View {
        VStack {
            Text("Ingresos y Egresos")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .padding(.top, 20)

            ScrollView([.horizontal]) {
                Chart {
                    ForEach(resultadosGaleria) { montos in
                        // Línea de Ingresos
                        LineMark(
                            x: .value("Mes", montos.mes),
                            y: .value("Ingresos", montos.montoIngresos)
                        )
                        .foregroundStyle(.green)
                        .interpolationMethod(.catmullRom)

                        // Línea de Egresos
                        LineMark(
                            x: .value("Mes", montos.mes),
                            y: .value("Egresos", montos.montoEgresos)
                        )
                        .foregroundStyle(.red)
                        .interpolationMethod(.catmullRom)
                    }
                }
                .chartYAxis {
                    AxisMarks(position: .leading)
                }
                .chartYScale(domain: 0...50000)
                .frame(width: 600, height: 300)
                .padding()
                .border(Color.gray, width: 1)
            }
        }
    }
}

#Preview {
    GraficaGaleria()
}
```

**Puntos clave:**
- Requiere `import Charts` (disponible desde iOS 16 / Xcode 14).
- Dentro del `Chart`, se usa un solo `ForEach` que por cada mes genera **dos** `LineMark`: uno para ingresos y otro para egresos. SwiftUI Charts agrupa automáticamente las series por el nombre usado en `.value("Ingresos", ...)` y `.value("Egresos", ...)`.
- `.interpolationMethod(.catmullRom)` suaviza las líneas dando una apariencia más fluida.
- `.foregroundStyle(.green)` y `.foregroundStyle(.red)` asignan colores distintos a cada serie. Puedes cambiarlos.
- `.chartYAxis { AxisMarks(position: .leading) }` coloca los valores del eje Y a la izquierda.
- `.chartYScale(domain: 0...50000)` define el rango del eje Y. Ajústalo si modificas los datos de ejemplo.
- `.frame(width: 600, height: 300)` da un ancho mayor al `Chart` para que el `ScrollView` horizontal tenga sentido. Ajusta según necesites.
- El `ScrollView([.horizontal])` permite desplazar el chart si no cabe en pantalla.

---

## Paso 6 — Modificar `ContentView` para integrar todo

**Archivo existente:** `ContentView.swift`  
**Acción:** Reemplaza todo el contenido con el siguiente código.

```swift
import SwiftUI

struct ContentView: View {
    @State var listaObrasArte = ObraDeArte.listaObras

    var body: some View {
        TabView {
            VistaGaleria(listaObras: $listaObrasArte)
                .tabItem {
                    Label("Galería", systemImage: "photo")
                }

            GraficaGaleria()
                .tabItem {
                    Label("Gráficas", systemImage: "chart.bar")
                }
        }
    }
}

#Preview {
    ContentView()
}
```

**Puntos clave:**
- `@State var listaObrasArte` es la **fuente de verdad** única para la lista de obras. Se declara aquí para que `VistaGaleria` reciba un binding y cualquier cambio futuro a los datos se propague correctamente.
- `TabView` genera la barra de navegación inferior con dos tabs.
- `VistaGaleria(listaObras: $listaObrasArte)` pasa la lista como binding usando el prefijo `$`.
- `GraficaGaleria()` no necesita datos externos porque administra su propio `@State` internamente.
- Los `systemImage` usados son SF Symbols: `"photo"` para la galería y `"chart.bar"` para las gráficas.

---

## Resumen del flujo de datos

```
ContentView
  └── @State listaObrasArte: [ObraDeArte]
        │
        ├── VistaGaleria(@Binding listaObras)
        │     └── ForEach($listaObras) { $obra in
        │           └── NavigationLink → ObraVistaDetalle(@Binding obra)
        │                 └── GeometryReader + ScrollView + Image + TapGesture
        │
        └── GraficaGaleria()
              └── @State resultadosGaleria: [ResultadosGaleria]
                    └── Chart → LineMark (ingresos) + LineMark (egresos)
```

---

## Checklist de verificación final

Antes de entregar, verifica que:

- [ ] Las 7 imágenes están en `Assets.xcassets` con los nombres exactos usados en `listaObras`.
- [ ] `ObraDeArte.swift` compila sin errores y `listaObras` contiene las 7 obras.
- [ ] `VistaGaleria` muestra todas las obras en scroll vertical con imagen y título.
- [ ] Al tocar una obra, navega correctamente a `ObraVistaDetalle`.
- [ ] En `ObraVistaDetalle`, el doble tap amplía la imagen al doble con animación suave.
- [ ] Un segundo doble tap regresa la imagen a su tamaño original con animación.
- [ ] Con la imagen ampliada, el scroll horizontal y vertical funciona para inspeccionar detalles.
- [ ] `GraficaGaleria` muestra dos líneas de colores distintos (ingresos y egresos).
- [ ] La gráfica es desplazable horizontalmente.
- [ ] Los valores del eje Y aparecen a la izquierda.
- [ ] El `TabView` en `ContentView` permite cambiar entre "Galería" y "Gráficas" sin errores.
- [ ] El proyecto compila y corre en simulador sin warnings críticos.

---

## Notas de compatibilidad

| Requisito        | Versión mínima |
|-----------------|----------------|
| Swift Charts     | iOS 16.0       |
| SwiftUI          | iOS 14.0       |
| Deployment Target recomendado | iOS 16.0+ |

Si el proyecto tiene un deployment target menor a iOS 16, deberás actualizarlo en **Project Settings → General → Minimum Deployments** para poder usar el framework `Charts`.
