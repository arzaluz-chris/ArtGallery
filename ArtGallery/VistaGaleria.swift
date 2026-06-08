//
//  VistaGaleria.swift
//  ArtGallery
//
//  Created by Christian Arzaluz on 08/06/26.
//

import SwiftUI

struct VistaGaleria: View {
    @Binding var listaObras: [ObraDeArte]

    var body: some View {
        NavigationView {
            ScrollView {
                ForEach($listaObras) { $obra in
                    NavigationLink(destination: ObraVistaDetalle(obra: $obra)) {
                        ZStack(alignment: .bottomLeading) {
                            Image(obra.imagen)
                                .resizable()
                                .scaledToFill()
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .frame(height: 350, alignment: .top)
                                .clipped()
                                .cornerRadius(16)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 16)
                                        .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                                )
                            
                            LinearGradient(
                                colors: [.clear, .black.opacity(0.8)],
                                startPoint: .center,
                                endPoint: .bottom
                            )
                            .cornerRadius(16)
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text(obra.titulo)
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundStyle(.white)
                                
                                Text(obra.artista)
                                    .font(.subheadline)
                                    .foregroundStyle(.white.opacity(0.8))
                            }
                            .padding()
                        }
                        .shadow(color: .black.opacity(0.2), radius: 8, x: 0, y: 4)
                        .padding(.vertical, 8)
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
