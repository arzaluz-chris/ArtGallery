//
//  ResultadosGaleria.swift
//  ArtGallery
//
//  Created by Christian Arzaluz on 08/06/26.
//

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
