//
//  GraficaGaleria.swift
//  ArtGallery
//
//  Created by Christian Arzaluz on 08/06/26.
//

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
                        // Serie de Ingresos
                        LineMark(
                            x: .value("Mes", montos.mes),
                            y: .value("Monto", montos.montoIngresos)
                        )
                        .foregroundStyle(by: .value("Tipo", "Ingresos"))
                        .interpolationMethod(.catmullRom)
                        
                        PointMark(
                            x: .value("Mes", montos.mes),
                            y: .value("Monto", montos.montoIngresos)
                        )
                        .foregroundStyle(by: .value("Tipo", "Ingresos"))

                        // Serie de Egresos
                        LineMark(
                            x: .value("Mes", montos.mes),
                            y: .value("Monto", montos.montoEgresos)
                        )
                        .foregroundStyle(by: .value("Tipo", "Egresos"))
                        .interpolationMethod(.catmullRom)
                        
                        PointMark(
                            x: .value("Mes", montos.mes),
                            y: .value("Monto", montos.montoEgresos)
                        )
                        .foregroundStyle(by: .value("Tipo", "Egresos"))
                    }
                }
                .chartForegroundStyleScale([
                    "Ingresos": .green,
                    "Egresos": .red
                ])
                .chartYAxis {
                    AxisMarks(position: .leading)
                }
                .chartYScale(domain: 0...50000)
                .frame(width: 600, height: 300)
                .padding()
                .background(Color(.systemBackground))
                .cornerRadius(12)
                .shadow(color: .black.opacity(0.1), radius: 8, x: 0, y: 4)
                .padding()
            }
        }
    }
}

#Preview {
    GraficaGaleria()
}
