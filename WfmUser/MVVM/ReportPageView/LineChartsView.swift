//
//  LineChartsView.swift
//  RxAdmin
//
//  Created by Banu Ortac on 9.06.2024.
//

import SwiftUI
import Charts

struct LineChartsView: View {
    
    var data: [ReportModel] = localReportModel
    var reportType: ReportType = .barTeslimat
    var groupType: Int = 0
    
    var type: Int = 0 //0 grafik sayfası, 1 dialog yani büyük görüntü
    
    var data5: ChartDetailModel = ChartDetailModel(chartTitle: "GRAFİK ADI", groupArray: [["Araç", "XPLAKAX"], ["Araç", "YPLAKAY"], ["Araç", "ZPLAKAZ"]], descArray: ["Olumlu Adet", "Kısmi Olumlu Adet", "Olumsuz Adet", "Ugranmamış Adet", "Devam Eden Adet"], valueArray: [.intValues([2, 5, 4, 0, 3]), .intValues([5, 1, 3, 4, 1]), .intValues([3, 1, 4, 2, 0])])
    
    @State private var showSelectionBar = false
    @State private var offsetX = 0.0
    @State private var offsetY = 0.0
    
    @State private var selectedGroup = ""
    @State private var selectedDesc = ""
    @State private var selectedPlate = ""
    @State private var selectedValue = 0
    @State private var selectedOnlyValue = 0
    @State private var selectedValueD = 0.0
    @State private var selectedOnlyValueD = 0.0
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            Chart {
                ForEach(0..<data5.valueArray.count, id:\.self) { i in
                    let value = value3(data5.valueArray[i])
                    switch value {
                    case .intValues(let array):
                        ForEach(0..<array.count, id:\.self) { j in
                            LineMark(
                                x: .value(data5.groupArray[i][0], data5.groupArray[i][1]),
                                y: .value(data5.descArray[j], array[j])
                            )
                            .foregroundStyle(by: .value("", data5.descArray[j]))
                            .symbol {
                                LineMarkStatusCount(valueInt: array[j], color: getChartColorForIndex(i: j))
                            }
                        }
                        
                    case .doubleValues(let array):
                        ForEach(0..<array.count, id:\.self) { j in
                            LineMark(
                                x: .value(data5.groupArray[i][0], data5.groupArray[i][1]),
                                y: .value(data5.descArray[j], array[j])
                            )
                            .foregroundStyle(by: .value("", data5.descArray[j]))
                            .symbol {
                                LineMarkStatusCount(valueDouble: array[j], color: getChartColorForIndex(i: j))
                            }
                        }
                    }
                }
            }.chartYScale(range: .plotDimension(padding: 10))
                .chartForegroundStyleScale(titleToColor(data5: data5))
                .frame(height: type == 0 ? chartsHeight : .infinity)
                .chartOverlay { pr in
                    GeometryReader { geoProxy in
                        Rectangle().foregroundStyle(Color.orange.gradient)
                            .frame(width: 2, height: geoProxy.size.height * 0.95)
                            .opacity(showSelectionBar ? 1.0 : 0.0)
                            .offset(x: offsetX)
                                    
                        ChartDetailInfoDialog(selectedPlate: selectedPlate, selectedDesc: selectedDesc, selectedValue: selectedValue, selectedOnlyValue: selectedOnlyValue, selectedValueD: selectedValueD, selectedOnlyValueD: selectedOnlyValueD, showSelectionBar: $showSelectionBar)
                            .opacity(showSelectionBar ? 1.0 : 0.0)
                            .offset(x: offsetX - 50, y: offsetY - 100)
                            .onTapGesture {
                                print("AYAYAYYAYAYAYAY")
                            }
                                       
                        Rectangle().fill(.clear).contentShape(Rectangle())
                            .gesture(DragGesture().onChanged({ value in
                                print("qqqqqqqqqqq")
                                let origin = geoProxy[pr.plotAreaFrame].origin
                                let location = CGPoint(
                                    x: value.location.x - origin.x,
                                    y: value.location.y - origin.y
                                )
                                offsetX = location.x
                                offsetY = location.y
                                               
                                bar(at: location, proxy: pr, geometry: geoProxy)
                            }).onEnded({ _ in
                                showSelectionBar = false
                            }))
                    }
                }
                .padding()
        }
    }
    
    func bar(at location: CGPoint, proxy: ChartProxy, geometry: GeometryProxy) {
        let xPosition = location.x - geometry[proxy.plotAreaFrame].origin.x
        let yPosition = location.y - geometry[proxy.plotAreaFrame].origin.y
        guard let month: String = proxy.value(atX: xPosition) else { return }
        guard let measure: Double = proxy.value(atY: yPosition) else { return }
        // more logic here ....
        print("mmmmmm - \(month) - \(measure)")
        
        if let index = data5.groupArray.firstIndex(where: { $0 == ["Araç", month] }) {
            let value = value3(data5.valueArray[index])
            switch value {
            case .intValues(let arr):
                
                selectedPlate = month
                selectedValue = arr.reduce(0) { $0 + $1 }
                
                if arr.count == 5 {
                    if measure >= 0.0 && measure <= Double(arr[0])  {
                        selectedDesc = data5.descArray[0]
                        selectedOnlyValue = arr[0]
                    } else if measure >= Double(arr[0]) && measure <= Double(arr[0] + arr[1]) {
                        selectedDesc = data5.descArray[1]
                        selectedOnlyValue = arr[1]
                    } else if measure >= Double(arr[0] + arr[1]) && measure <= Double(arr[0] + arr[1] + arr[2]) {
                        selectedDesc = data5.descArray[2]
                        selectedOnlyValue = arr[2]
                    } else if measure >= Double(arr[0] + arr[1] + arr[2]) && measure <= Double(arr[0] + arr[1] + arr[2] + arr[3]) {
                        selectedDesc = data5.descArray[3]
                        selectedOnlyValue = arr[3]
                    } else if measure >= Double(arr[0] + arr[1] + arr[2] + arr[3]) && measure <= Double(arr[0] + arr[1] + arr[2] + arr[3] + arr[4]) {
                        selectedDesc = data5.descArray[4]
                        selectedOnlyValue = arr[4]
                    }
                } else if arr.count == 4 {
                    if measure >= 0.0 && measure <= Double(arr[0])  {
                        selectedDesc = data5.descArray[0]
                        selectedOnlyValue = arr[0]
                    } else if measure >= Double(arr[0]) && measure <= Double(arr[0] + arr[1]) {
                        selectedDesc = data5.descArray[1]
                        selectedOnlyValue = arr[1]
                    } else if measure >= Double(arr[0] + arr[1]) && measure <= Double(arr[0] + arr[1] + arr[2]) {
                        selectedDesc = data5.descArray[2]
                        selectedOnlyValue = arr[2]
                    } else if measure >= Double(arr[0] + arr[1] + arr[2]) && measure <= Double(arr[0] + arr[1] + arr[2] + arr[3]) {
                        selectedDesc = data5.descArray[3]
                        selectedOnlyValue = arr[3]
                    }
                } else if arr.count == 3 {
                    if measure >= 0.0 && measure <= Double(arr[0])  {
                        selectedDesc = data5.descArray[0]
                        selectedOnlyValue = arr[0]
                    } else if measure >= Double(arr[0]) && measure <= Double(arr[0] + arr[1]) {
                        selectedDesc = data5.descArray[1]
                        selectedOnlyValue = arr[1]
                    } else if measure >= Double(arr[0] + arr[1]) && measure <= Double(arr[0] + arr[1] + arr[2]) {
                        selectedDesc = data5.descArray[2]
                        selectedOnlyValue = arr[2]
                    }
                } else if arr.count == 2 {
                    if measure >= 0.0 && measure <= Double(arr[0])  {
                        selectedDesc = data5.descArray[0]
                        selectedOnlyValue = arr[0]
                    } else if measure >= Double(arr[0]) && measure <= Double(arr[0] + arr[1]) {
                        selectedDesc = data5.descArray[1]
                        selectedOnlyValue = arr[1]
                    }
                } else if arr.count == 1 {
                    if measure >= 0.0 && measure <= Double(arr[0])  {
                        selectedDesc = data5.descArray[0]
                        selectedOnlyValue = arr[0]
                    }
                }
                
            
                showSelectionBar = true
                
            case .doubleValues(let arr):
                selectedPlate = month
                
                if reportType == .lineHesaplananToplananKm {
                    selectedValueD = arr[0] + arr[1]
                } else {
                    selectedValueD = arr.reduce(0.0) { $0 + $1 }
                }
                
                
                
                if arr.count == 5 {
                    if measure >= 0.0 && measure <= arr[0]  {
                        selectedDesc = data5.descArray[0]
                        selectedOnlyValueD = arr[0]
                    } else if measure >= arr[0] && measure <= arr[0] + arr[1] {
                        selectedDesc = data5.descArray[1]
                        selectedOnlyValueD = arr[1]
                    } else if measure >= arr[0] + arr[1] && measure <= arr[0] + arr[1] + arr[2] {
                        selectedDesc = data5.descArray[2]
                        selectedOnlyValueD = arr[2]
                    } else if measure >= arr[0] + arr[1] + arr[2] && measure <= arr[0] + arr[1] + arr[2] + arr[3] {
                        selectedDesc = data5.descArray[3]
                        selectedOnlyValueD = arr[3]
                    } else if measure >= arr[0] + arr[1] + arr[2] + arr[3] && measure <= arr[0] + arr[1] + arr[2] + arr[3] + arr[4] {
                        selectedDesc = data5.descArray[4]
                        selectedOnlyValueD = arr[4]
                    }
                } else if arr.count == 4 {
                    if measure >= 0.0 && measure <= arr[0]  {
                        selectedDesc = data5.descArray[0]
                        selectedOnlyValueD = arr[0]
                    } else if measure >= arr[0] && measure <= arr[0] + arr[1] {
                        selectedDesc = data5.descArray[1]
                        selectedOnlyValueD = arr[1]
                    } else if measure >= arr[0] + arr[1] && measure <= arr[0] + arr[1] + arr[2] {
                        selectedDesc = data5.descArray[2]
                        selectedOnlyValueD = arr[2]
                    } else if measure >= arr[0] + arr[1] + arr[2] && measure <= arr[0] + arr[1] + arr[2] + arr[3] {
                        selectedDesc = data5.descArray[3]
                        selectedOnlyValueD = arr[3]
                    }
                } else if arr.count == 3 {
                    if measure >= 0.0 && measure <= arr[0]  {
                        selectedDesc = data5.descArray[0]
                        selectedOnlyValueD = arr[0]
                    } else if measure >= arr[0] && measure <= arr[0] + arr[1] {
                        selectedDesc = data5.descArray[1]
                        selectedOnlyValueD = arr[1]
                    } else if measure >= arr[0] + arr[1] && measure <= arr[0] + arr[1] + arr[2] {
                        selectedDesc = data5.descArray[2]
                        selectedOnlyValueD = arr[2]
                    }
                } else if arr.count == 2 {
                    if measure >= 0.0 && measure <= arr[0]  {
                        selectedDesc = data5.descArray[0]
                        selectedOnlyValueD = arr[0]
                    } else if measure >= arr[0] && measure <= arr[0] + arr[1] {
                        selectedDesc = data5.descArray[1]
                        selectedOnlyValueD = arr[1]
                    }
                } else if arr.count == 1 {
                    if measure >= 0.0 && measure <= arr[0]  {
                        selectedDesc = data5.descArray[0]
                        selectedOnlyValueD = arr[0]
                    }
                }
                
            
                showSelectionBar = true
            }
        } else {
            print("Item not found")
        }
    }
}

#Preview {
    LineChartsView()
}

struct LineMarkStatusCount: View {
    var valueInt: Int = 0
    var valueDouble: Double = 0.0
    var color: Color

    var body: some View {
        if valueDouble > 0.0 || valueInt > 0 {
            Circle()
                .fill(color)
                .frame(width: 8, height: 8)
                .overlay {
                    Text(valueDouble > 0.0 ? String(format: "%.2f", valueDouble) : valueInt > 0 ? String(valueInt) : "")
                        .frame(width: 30)
                        .foregroundStyle(.black)
                        .font(.custom(fontsRegular, size: 8))
                        .offset(y: -15)
                }
        }
    }
}
