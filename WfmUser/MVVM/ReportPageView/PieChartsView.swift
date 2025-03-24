//
//  PieChartsView.swift
//  RxAdmin
//
//  Created by Banu Ortac on 9.06.2024.
//

import SwiftUI
import Charts

struct PieChartsView: View {
    
    var data: [ReportModel] = localReportModel
    var reportType: ReportType = .barTeslimat
    var groupType: Int = 0
    
    @State var slices: [(Double, Color)] = []
    @State private var slicesLoad: Bool = false
    @State private var slices360: [Double] = []
    
    var data5: ChartDetailModel = ChartDetailModel(chartTitle: "GRAFİK ADI", groupArray: [["Araç", "XPLAKAX"], ["Araç", "YPLAKAY"], ["Araç", "ZPLAKAZ"]], descArray: ["Olumlu Adet", "Kısmi Olumlu Adet", "Olumsuz Adet", "Ugranmamış Adet", "Devam Eden Adet"], valueArray: [.intValues([2, 5, 4, 0, 3]), .intValues([5, 1, 3, 4, 1]), .intValues([3, 1, 4, 2, 0])])
    
    var body: some View {
        
        VStack(spacing: 0) {
            if slicesLoad {
                ZStack {
                    HStack {
                        Canvas { context, size in
                            let total = slices.reduce(0) { $0 + $1.0 }
                            context.translateBy(x: size.width * 0.5, y: size.height * 0.5)
                            var pieContext = context
                            pieContext.rotate(by: .degrees(-90))
                            let radius = min(size.width, size.height) * 0.48
                            var startAngle = Angle.zero
                            for (value, color) in slices {
                                let angle = Angle(degrees: 360 * (value / total))
                                let endAngle = startAngle + angle
                                let path = Path { p in
                                    p.move(to: .zero)
                                    p.addArc(center: .zero, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
                                    p.closeSubpath()
                                }
                                pieContext.fill(path, with: .color(color))
                                
                                startAngle = endAngle
                            }
                        }
                        .aspectRatio(1, contentMode: .fit)
                        
                        VStack(spacing: 5) {
                            ForEach(0..<slices360.count, id:\.self) { i in
                                HStack {
                                    PieChartPieDetail(index: i, value: slices360[i])
                                }
                            }
                        }
                    }
                }
            }
            
            VStack(spacing: 0) {
                HStack {
                    LegendItem(color: Color.ChartColors.color1, text: desc1()[0])
                    if reportType.count > 1 {
                        LegendItem(color: Color.ChartColors.color2, text: desc1()[1])
                    }
                    if reportType.count > 2 {
                        LegendItem(color: Color.ChartColors.color3, text: desc1()[2])
                    }
                    
                }
                HStack {
                    if reportType.count > 4 {
                        LegendItem(color: Color.ChartColors.color4, text: desc1()[3])
                        LegendItem(color: Color.ChartColors.color5, text: desc1()[4])
                    }
                    if reportType.count > 5 {
                        LegendItem(color: Color.ChartColors.color6, text: desc1()[5])
                    }
                }
            }
            .padding(.top)
        }.frame(height: chartsHeight)
        .onAppear(perform: {
            sliceValue()
            slicesLoad = true
            print("slices - \(slices)")
        })
    }
    
    func sliceValue() {
        
        if reportType == .pieTeslimat {
            var olumlu: Int = 0
            var olumsuz: Int = 0
            var devamEden: Int = 0
            var farkliGun: Int = 0
            var farkliArac: Int = 0
            var duraklama: Int = 0
            for i in 0..<data5.valueArray.count {
                let value = value3(data5.valueArray[i])
                switch value {
                case .doubleValues(let array):
                    print("AA")
                case .intValues(let array):
                    olumlu += array[0]
                    olumsuz += array[1]
                    devamEden += array[2]
                    farkliGun += array[3]
                    farkliArac += array[4]
                    duraklama += array[5]
                }
            }
            slices.append((Double(olumlu), Color.ChartColors.color1))
            slices.append((Double(olumsuz), Color.ChartColors.color3))
            slices.append((Double(devamEden), Color.ChartColors.color5))
            slices.append((Double(farkliGun), Color.ChartColors.color1))
            slices.append((Double(farkliArac), Color.ChartColors.color3))
            slices.append((Double(duraklama), Color.ChartColors.color5))
            let total = Double(olumlu + olumsuz + devamEden + farkliGun + farkliArac + duraklama)
            slices360 = [(Double(olumlu) / total) * 360, (Double(olumsuz) / total) * 360, (Double(devamEden) / total) * 360, (Double(farkliGun) / total) * 360, (Double(farkliArac) / total) * 360, (Double(duraklama) / total) * 360]
        }
    }
    
    func titleToColor() -> KeyValuePairs<String, Color> {
        var pairs: KeyValuePairs<String, Color> = [:]

        let descriptions = desc1()
        
        if reportType.count > 0 {
            pairs = KeyValuePairs<String, Color>(dictionaryLiteral: (descriptions[0], Color.ChartColors.color1))
        }
        if reportType.count > 1 {
            pairs = KeyValuePairs<String, Color>(dictionaryLiteral: (descriptions[0], Color.ChartColors.color1), (descriptions[1], Color.ChartColors.color2))
        }
        if reportType.count > 2 {
            pairs = KeyValuePairs<String, Color>(dictionaryLiteral: (descriptions[0], Color.ChartColors.color1), (descriptions[1], Color.ChartColors.color2), (descriptions[2], Color.ChartColors.color3))
        }
        if reportType.count > 4 {
            pairs = KeyValuePairs<String, Color>(dictionaryLiteral: (descriptions[0], Color.ChartColors.color1), (descriptions[1], Color.ChartColors.color2), (descriptions[2], Color.ChartColors.color3), (descriptions[3], Color.ChartColors.color4), (descriptions[4], Color.ChartColors.color5))
        }
        if reportType.count > 5 {
            pairs = KeyValuePairs<String, Color>(dictionaryLiteral: (descriptions[0], Color.ChartColors.color1), (descriptions[1], Color.ChartColors.color2), (descriptions[2], Color.ChartColors.color3), (descriptions[3], Color.ChartColors.color4), (descriptions[4], Color.ChartColors.color5), (descriptions[5], Color.ChartColors.color6))
        }

        return pairs
    }
    
    func groupTypeDepoPlaka(_ g: Int, _ d: ReportModel) -> [String] {
        if g == 0 {
            return ["Araç", d.aracPlaka]
        } else {
            return ["Depo", d.depo]
        }
    }
    
    func desc1() -> [String] {
        switch reportType {
        case .pieTeslimat:
            return [String(localized: "RLOlumluAdet"), String(localized: "RLOlumsuzAdet"), String(localized: "RLDevamEdenAdet"), String(localized: "Farklı Gün"), String(localized: "Farklı Araç"), String(localized: "Duraklama")]
        default:
            return []
        }
    }
}

#Preview {
    PieChartsView(slices: [
        (2, .red),
        (3, .orange),
        (4, .yellow),
        (1, .green),
        (5, .blue),
        (4, .indigo),
        (2, .purple)
    ])

}


private struct PieChartPieDetail: View {
    var index: Int
    var value: Double

    var body: some View {
        HStack(spacing: 2) {
            Circle()
                .fill(index == 0 ? Color.ChartColors.color1 : index == 1 ? Color.ChartColors.color2 : index == 2 ? Color.ChartColors.color3 : index == 3 ? Color.ChartColors.color4 : index == 4 ? Color.ChartColors.color5 : Color.ChartColors.color6)
                .frame(width: 10, height: 10)
            Text("%" + String(format: "%.2f", value))
                .font(.custom(fontsRegular, size: 8))
                .foregroundStyle(.black)
                .frame(maxWidth: .infinity, alignment: .leading)
        }.frame(maxWidth: 60)
    }
}
