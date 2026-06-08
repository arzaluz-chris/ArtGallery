//
//  ObraVistaDetalle.swift
//  ArtGallery
//
//  Created by Christian Arzaluz on 08/06/26.
//

import SwiftUI

struct ObraVistaDetalle: View {
    @Binding var obra: ObraDeArte

    @State private var escalaActual: CGFloat = 1.0
    @State var imagenAmpliada = false

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            VStack(alignment: .leading, spacing: 8) {
                Text(obra.titulo)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundStyle(.primary)

                Text(obra.artista)
                    .font(.title3)
                    .fontWeight(.medium)
                    .foregroundStyle(.secondary)
                
                HStack {
                    Label(obra.tecnica, systemImage: "paintpalette")
                    Spacer()
                    Label(obra.year, systemImage: "calendar")
                }
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .padding(.top, 4)
                
                Text(obra.precio, format: .currency(code: "USD"))
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundStyle(.green)
                    .padding(.top, 4)
                
                Text(obra.descripcion)
                    .font(.body)
                    .foregroundStyle(.secondary)
                    .lineSpacing(4)
                    .padding(.top, 4)
            }
            .padding(.horizontal)
            .padding(.top, 20)
            .padding(.bottom, 16)

            GeometryReader { geo in
                ScrollView([.horizontal, .vertical], showsIndicators: false) {
                    Image(obra.imagen)
                        .resizable()
                        .scaledToFit()
                        .frame(
                            width: geo.size.width * escalaActual,
                            height: geo.size.height * escalaActual,
                            alignment: .center
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
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    ObraVistaDetalle(obra: .constant(ObraDeArte.listaObras[0]))
}
