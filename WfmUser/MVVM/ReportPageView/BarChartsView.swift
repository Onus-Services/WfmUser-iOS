//
//  BarChartsView.swift
//  RxAdmin
//
//  Created by Banu Ortac on 8.06.2024.
//

import SwiftUI
import Charts

struct BarChartsView: View {
    
    @EnvironmentObject var homePageVM: HomePageViewModel
    var isReportOneDay: Bool = true
    var data: [ReportModel] = localReportModel
    var reportType: ReportType = .barTeslimat
    var groupType: Int = 0
    
    var type: Int = 0 //0 grafik sayfası, 1 dialog yani büyük görüntü
    
    var data5: ChartDetailModel = ChartDetailModel(chartTitle: "BAR ADI", groupArray: [["Araç", "XPLAKAX"], ["Araç", "YPLAKAY"], ["Araç", "ZPLAKAZ"]], descArray: ["Olumlu Adet", "Kısmi Olumlu Adet", "Olumsuz Adet", "Ugranmamış Adet", "Devam Eden Adet"], valueArray: [.intValues([2, 5, 4, 0, 3]), .intValues([5, 1, 3, 4, 1]), .intValues([3, 1, 4, 2, 0])])
    
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
        ZStack {
            VStack(spacing: 0) {
                
                Chart {
                    if isReportOneDay {
                        ForEach(0..<data5.groupArray.count, id:\.self) { i in
                            let value = value3(data5.valueArray[0])
                            switch value {
                            case .intValues(let array):
                                BarMark(
                                    x: .value(data5.groupArray[i][0], data5.groupArray[i][1]),
                                    y: .value(data5.descArray[i], array[i])
                                )
                                .foregroundStyle(by: .value("", data5.descArray[i]))
                                .annotation (position: .overlay) {
                                    if array[i] > 0 {
                                        Text("\(array[i])")
                                            .foregroundStyle(.white)
                                            .font(.custom(fontsRegular, size: 8))
                                    }
                                }
                            case .doubleValues(let array):
                                BarMark(
                                    x: .value(data5.groupArray[i][0], data5.groupArray[i][1]),
                                    y: .value(data5.descArray[i], array[i])
                                )
                                .foregroundStyle(by: .value("", data5.descArray[i]))
                                .annotation (position: .overlay) {
                                    if array[i] > 0 {
                                        Text(String(format: "%.2f", array[i]))
                                            .foregroundStyle(.white)
                                            .font(.custom(fontsRegular, size: 8))
                                    }
                                }
                            }
                        }
                    } else {
                        ForEach(0..<data5.valueArray.count, id:\.self) { i in
                            let value = value3(data5.valueArray[i])
                            switch value {
                            case .intValues(let array):
                                ForEach(0..<array.count, id:\.self) { j in
                                    BarMark(
                                        x: .value(data5.groupArray[i][0], data5.groupArray[i][1]),
                                        y: .value(data5.descArray[j], array[j])
                                    )
                                    .foregroundStyle(by: .value("", data5.descArray[j]))
                                    .annotation (position: .overlay) {
                                        if array[j] > 0 {
                                            Text("\(array[j])")
                                                .foregroundStyle(.white)
                                                .font(.custom(fontsRegular, size: 8))
                                        }
                                    }
                                    
                                    /*.annotation {
                                        Text("\(array.reduce(0) { $0 + $1 })")
                                            .foregroundStyle(.black)
                                            .font(.custom(fontsRegular, size: 8))
                                            .opacity(array.count - 1 == j ? 1 : 0)
                                    }*/
                                }
                                
                            case .doubleValues(let array):
                                ForEach(0..<array.count, id:\.self) { j in
                                    BarMark(
                                        x: .value(data5.groupArray[i][0], data5.groupArray[i][1]),
                                        y: .value(data5.descArray[j], array[j])
                                    )
                                    .foregroundStyle(by: .value("", data5.descArray[j]))
                                    .annotation (position: .overlay) {
                                        if array[j] > 0 {
                                            Text(String(format: "%.2f", array[j]))
                                                .foregroundStyle(.white)
                                                .font(.custom(fontsRegular, size: 8))
                                        }
                                    }
                                    /*.annotation {
                                        Text(String(format: "%.2f", array.reduce(0.0) { $0 + $1 }))
                                            .foregroundStyle(.black)
                                            .font(.custom(fontsRegular, size: 8))
                                            .opacity(array.count - 1 == j ? 1.0 : 0.0)
                                    }*/
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
                                        
                            /*ChartDetailInfoDialog(selectedPlate: selectedPlate, selectedDesc: selectedDesc, selectedValue: selectedValue, selectedOnlyValue: selectedOnlyValue, selectedValueD: selectedValueD, selectedOnlyValueD: selectedOnlyValueD, showSelectionBar: $showSelectionBar, onTap: {
                                /*let mapPlate = hpmvm.routePlanPlateModel.filter { $0.Plate == selectedPlate }.first
                                if mapPlate != nil {
                                    hpmvm.onApperPage = false
                                    mainPageVM.mainPageType = MainPageTypes.anasayfaHarita
                                    hpmvm.isDateSelect = true
                                    hpmvm.mapRoutePlanPlateModel = hpmvm.routePlanPlateModel.filter { $0.Plate == selectedPlate }
                                    hpmvm.addSelectedVehicleArray(vehicle: mapPlate!)
                                }
                                print("TATTATATATATATATA - \(selectedPlate)")
                                print("JAJAJAJAJ - \(hpmvm.routePlanPlateModel)")
                                print("YYY - \(hpmvm.routePlanPlateModel.filter { $0.Plate == selectedPlate })")*/
                            }).opacity(showSelectionBar ? 1.0 : 0.0)
                                .offset(x: offsetX - 50, y: offsetY - 100)*/
                                /*.onTapGesture {
                                    let mapPlate = hpmvm.routePlanPlateModel.filter { $0.Plate == selectedPlate }.first
                                    if mapPlate != nil {
                                        hpmvm.onApperPage = false
                                        mainPageVM.mainPageType = MainPageTypes.anasayfaHarita
                                        hpmvm.isDateSelect = true
                                        hpmvm.mapRoutePlanPlateModel = hpmvm.routePlanPlateModel.filter { $0.Plate == selectedPlate }
                                        hpmvm.addSelectedVehicleArray(vehicle: mapPlate!)
                                    }
                                    print("TATTATATATATATATA - \(selectedPlate)")
                                    print("JAJAJAJAJ - \(hpmvm.routePlanPlateModel)")
                                    print("YYY - \(hpmvm.routePlanPlateModel.filter { $0.Plate == selectedPlate })")
                                }*/
                                
                            
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
                                    //showSelectionBar = false
                                }))
                        }
                    }
                    .padding()
            }
            
        }.onAppear {
            print("TTTTTTgroupArray \(data5.groupArray) - \(data5.groupArray.count)")
            print("YYYYYYdescArray \(data5.descArray) - \(data5.descArray.count)")
            print("RRRRRRvalueArray \(data5.valueArray) - \(data5.valueArray.count)")
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
                selectedValueD = arr.reduce(0.0) { $0 + $1 }
                
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

/*
#Preview {
    ChartDetailInfoDialog(selectedPlate: "34ONUSS123", selectedDesc: "Kısmi Olumlu Adet", selectedValue: 12, selectedOnlyValue: 3)
}
*/

struct BarMarkStatusCount: View {
    //BarMarkStatusCount(valueDouble: array[5]) her değerin üstünde kendi değeri gözükmesi için kullanım şekli
    var valueInt: Int = 0
    var valueDouble: Double = 0.0

    var body: some View {
        if valueDouble > 0.0 || valueInt > 0 {
            Text(valueDouble > 0.0 ? String(format: "%.2f", valueDouble) : valueInt > 0 ? String(valueInt) : "")
                .foregroundStyle(.white)
                .font(.custom(fontsRegular, size: 8))
        }
    }
}

struct BarMarkStatusTotalCount: View {
    //BarMarkStatusTotalCount(valueInt: array[4], arrayCount: reportType.count, index: 3) en üstte yazan toplam değerin sadece bir kez gösterilmesi için kullanım şekli
    var valueInt: Int = 0
    var valueDouble: Double = 0.0
    
    var arrayCount: Int
    var index: Int

    var body: some View {
        if valueDouble > 0.0 || valueInt > 0 {
            Text(valueDouble > 0.0 ? String(format: "%.2f", valueDouble) : valueInt > 0 ? String(valueInt) : "")
                .foregroundStyle(.black)
                .font(.custom(fontsRegular, size: 8))
                .opacity(arrayCount - 1 == index ? 1.0 : 0.0)
        }
    }
}

struct LegendItem: View {
    var color: Color
    var text: String

    var body: some View {
        HStack {
            Circle()
                .fill(color)
                .frame(width: 10, height: 10)
            Text(text)
                .font(.custom(fontsRegular, size: 8))
                .foregroundStyle(.black)
        }
        .padding(.trailing, 10)
    }
}

struct ChartDetailInfoDialog: View {

    var selectedPlate: String
    var selectedDesc: String
    var selectedValue: Int = 0
    var selectedOnlyValue: Int = 0
    var selectedValueD: Double = 0.0
    var selectedOnlyValueD: Double = 0.0
    
    @Binding var showSelectionBar: Bool
    
    var onTap: () -> Void = { }
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text("\(selectedPlate)")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.custom(fontsMedium, size: 10))
                
                Button {
                    showSelectionBar = false
                } label: {
                    Image(systemName: "xmark.circle")
                        .resizable()
                        .frame(width: 15, height: 15)
                        .foregroundStyle(.black)
                }
            }
            
            HStack {
                Text("\(selectedDesc): \(selectedOnlyValueD > 0.0 ? String(format: "%.2f", selectedOnlyValueD) : selectedOnlyValue > 0 ? String(selectedOnlyValue) : "")")
                    .font(.custom(fontsRegular, size: 10))
                    .frame(maxWidth: .infinity, alignment: .leading)
                /*Text(selectedOnlyValueD > 0.0 ? String(format: "%.2f", selectedOnlyValueD) : selectedOnlyValue > 0 ? String(selectedOnlyValue) : "")
                    .font(.custom(fontsMedium, size: 10)) */
                
            }
            
            Text("Total: \(selectedValueD > 0.0 ? String(format: "%.2f", selectedValueD) : selectedValue > 0 ? String(selectedValue) : "")")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.custom(fontsRegular, size: 10))
            
            Button {
                onTap()
            } label: {
                Text("ChartHaritayaGit")
                    .padding(.vertical, 5)
                    .frame(maxWidth: .infinity)
                    .background(Color.NewColor.primary1)
                    .foregroundStyle(.white)
                    .font(.custom(fontsRegular, size: 10))
            }

            
        }.padding(5)
            .frame(width: screenWidth * 0.3)
            .background(.white)
            .cornerRadius(5)
            .overlay(
            RoundedRectangle(cornerRadius: 5)
                .stroke(Color.black, lineWidth: 1))
        
    }
}
