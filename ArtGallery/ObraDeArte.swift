//
//  ObraDeArte.swift
//  ArtGallery
//
//  Created by Christian Arzaluz on 08/06/26.
//

import Foundation

struct ObraDeArte: Identifiable {
    var id = UUID()
    var titulo: String
    var artista: String
    var year: String
    var tecnica: String
    var imagen: String
    var descripcion: String
    var precio: Double

    static var listaObras: [ObraDeArte] = [
        ObraDeArte(titulo: "El Hijo del Hombre", artista: "René Magritte", year: "1964", tecnica: "Óleo", imagen: "1. Rene Magritte - El Hijo del Hombre",
                   descripcion: "Un autorretrato surrealista que muestra a un hombre con un abrigo y un bombín, cuyo rostro está oculto en gran parte por una manzana verde flotante. Representa la curiosidad humana sobre lo que está oculto.", precio: 12500000),
        
        ObraDeArte(titulo: "Escena del Quaternario Paleolítico Superior", artista: "José María Velasco", year: "1901", tecnica: "Óleo", imagen: "2. José María Velasco - Escena del Quaternario Paleolítico Superior",
                   descripcion: "Una visión majestuosa y prehistórica del paisaje mexicano, capturando la grandiosidad de la naturaleza antes de la civilización moderna con el nivel de detalle botánico que caracteriza a Velasco.", precio: 8500000),
        
        ObraDeArte(titulo: "Cristo de San Juan de la Cruz", artista: "Salvador Dalí", year: "1951", tecnica: "Óleo", imagen: "3. Salvador Dali - Cristo de San Juan de la Cruz",
                   descripcion: "Muestra a Jesús en la cruz en un cielo oscurecido flotando sobre el agua, visto desde un ángulo cenital dramático. Dalí se inspiró en un dibujo místico del siglo XVI.", precio: 25000000),
        
        ObraDeArte(titulo: "Mona Lisa", artista: "Fernando Botero", year: "1977", tecnica: "Óleo", imagen: "4. Fernando Botero - Mona Lisa",
                   descripcion: "La inconfundible parodia del famoso cuadro de Da Vinci, donde Botero aplica su característico estilo de 'volumen' inflando la figura, dándole un tono humorístico y monumental.", precio: 4500000),
        
        ObraDeArte(titulo: "Los Girasoles", artista: "Vincent van Gogh", year: "1888", tecnica: "Óleo", imagen: "5. Van Gogh - Los Girasoles",
                   descripcion: "Parte de una serie icónica, esta vibrante obra maestra de postimpresionismo irradia energía y emoción a través de pinceladas gruesas y el uso revolucionario del color amarillo.", precio: 39900000),
        
        ObraDeArte(titulo: "La Gran Ola de Kanagawa", artista: "Katsushika Hokusai", year: "1831", tecnica: "Grabado", imagen: "6. Hokusai - La Gran Ola de Kanagawa",
                   descripcion: "El grabado en madera más famoso del arte japonés. Muestra una enorme ola amenazando embarcaciones frente a la costa, con el Monte Fuji imperturbable en el fondo.", precio: 1500000),
        
        ObraDeArte(titulo: "The Domain of Arnheim", artista: "René Magritte", year: "1962", tecnica: "Óleo", imagen: "7. Rene Magritte - The Domain of Arnheim",
                   descripcion: "Inspirada en el relato de Edgar Allan Poe, muestra una cordillera que toma la forma de un águila con sus alas extendidas, fusionando magistralmente la fauna con el paisaje mineral.", precio: 8200000)
    ]
}
