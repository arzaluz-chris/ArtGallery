//
//  ContentView.swift
//  ArtGallery
//
//  Created by Christian Arzaluz on 08/06/26.
//

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
