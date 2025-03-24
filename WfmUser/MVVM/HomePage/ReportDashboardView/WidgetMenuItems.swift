//
//  WidgetMenuItems.swift
//  WfmAdmin
//
//  Created by Mustafa Alper Aydin on 29.01.2025.
//

import Foundation
import SwiftUI

struct WidgetCardView: View {

    var cell: WidgetModel
    
    var body: some View {
        VStack(spacing: 0) {
            Text(cell.widgetTitle)
                .lineLimit(1)
                .font(.custom(fontsSemiBold, size: /*15*/17))
                .foregroundStyle(.blue)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack(spacing: 0) {
                WidgetCardItemView(bgColor1: cell.item1BgColor1, bgColor2: cell.item1BgColor2, iconText: cell.item1IconText, valueD: cell.item1ValueD, valueI: cell.item1ValueI, valueText: cell.item1ValueText, textColor: cell.item1ValueTextColor)
                if cell.valueCount == 2 {
                    /*Text("-")
                        .foregroundStyle(.blue)
                        .font(.custom(fontsBold, size: 15))
                        .offset(y: -20) */
                    WidgetCardItemView(bgColor1: cell.item2BgColor1, bgColor2: cell.item2BgColor2, iconText: cell.item2IconText, valueD: cell.item2ValueD, valueI: cell.item2ValueI, valueText: cell.item2ValueText, textColor: cell.item2ValueTextColor)
                }
                
            }
            
        }.padding(5)
            .frame(width: cell.valueCount == 2 ? screenWidth * /*0.3*/0.4 : screenWidth * 0.25)
            .background(.white)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.blue, lineWidth: 2)
            )
            .cornerRadius(10)
    }
}

struct WidgetCardItemView: View {
    var bgColor1: Color
    var bgColor2: Color
    var iconText: String
    var valueD: Double = -1.0
    var valueI: Int = -1
    var valueText: String
    var textColor: Color
    
    var onTap: () -> Void = { }

    var body: some View {
        HStack {
            HStack(spacing: 0) {
                /*VStack(spacing: 3) {
                    Text((valueD > -1.0 ? String(format: "%.2f", valueD) : valueI > -1 ? String(valueI) : ""))
                        .font(.custom(fontsMedium, size: 18))
                        .foregroundStyle(textColor)
                        .frame(maxWidth: .infinity)
                    
                    ZStack {
                        Rectangle()
                            .frame(width: 35, height: 35)
                            .foregroundStyle(LinearGradient(colors: [bgColor1, bgColor2], startPoint: .bottom, endPoint: .top))
                            .cornerRadius(5)
                        
                        Image(systemName: iconText)
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.white)
                    }
                    
                } */
                ZStack {
                    Rectangle()
                        .frame(width: 35, height: 35)
                        .foregroundStyle(LinearGradient(colors: [bgColor1, bgColor2], startPoint: .bottom, endPoint: .top))
                        .cornerRadius(5)
                    
                    Image(systemName: iconText)
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.white)
                }
                
            }
            VStack(spacing: 0) {
                Text((valueD > -1.0 ? String(format: "%.2f", valueD) : valueI > -1 ? String(valueI) : ""))
                    .font(.custom(fontsMedium, size: 15))
                    .foregroundStyle(textColor)
                    .frame(maxWidth: .infinity)
                /*Text(valueText)
                    .multilineTextAlignment(.center)
                    .font(.custom(fontsRegular, size: 12))
                    .foregroundStyle(.black)
                    .frame(maxWidth: .infinity)*/
            }.frame(height: 50)
        }//.frame(maxWidth: .infinity)
    }
}

/*
#Preview {
    WidgetCardViewNew(widgets: localWidgetModelJustData.filter( { $0.widgetType == .bolge || $0.widgetType == .seferBitirmeyen || $0.widgetType == .arac || $0.widgetType == .seferBaslatmayan} ))
}
*/

struct WidgetCardViewNew: View {

    var widgets: WidgetModelArray
    
    var body: some View {
        VStack(spacing: 0) {
            
            VStack(spacing: 5) {
                HStack {
                    
                }.frame(maxWidth: .infinity)
                    .frame(height: 10)
                    .background(widgets.color)
                
                Text(widgets.title)
                    .foregroundStyle(.black)
                    .font(.custom(fontsMedium, size: 12))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 10)
                
                ScrollView {
                    VStack(spacing: 5) {
                        ForEach(0..<widgets.widget.count, id:\.self) { i in
                            let cell = widgets.widget[i]
                            HStack {
                                /*ZStack {
                                    Rectangle()
                                        .frame(width: 20, height: 20)
                                        .foregroundStyle(LinearGradient(colors: [cell.itemBgColor1, cell.itemBgColor2], startPoint: .bottom, endPoint: .top))
                                        .cornerRadius(8)
                                    
                                    Image(systemName: cell.itemIconText)
                                        .resizable()
                                        .frame(width: 13, height: 13)
                                } */
                                
                                VStack(alignment: .center, spacing: 0) {
                                    ZStack {
                                        /*Circle()
                                            .frame(width: 25, height: 25)
                                            .foregroundStyle(.white) */
                                        
                                        Image(cell.itemIconText)
                                            .resizable()
                                            .frame(width: 20, height: 20)
                                    }
                                    
                                    
                                    Text(cell.widgetTitle)
                                        .font(.custom(fontsRegular, size: 8))
                                        .lineLimit(1)
                                        .foregroundStyle(.black)
                                        .frame(maxWidth: 50)
                                }
                                
                                Text(cell.widgetType == WidgetType.hesaplananKm || cell.widgetType == WidgetType.toplananKm ? cell.itemValue.formatToK() : cell.itemValue)
                                    .lineLimit(1)
                                    .font(.custom(fontsRegular, size: 12))
                                    .foregroundStyle(.black)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            Divider()
                                .background(widgets.color)
                        }
                    }.padding(.horizontal, 5)
                }
                
                Spacer()
            }.frame(height: screenHeight * 0.16)
                .background(.white)
            
        }.frame(width: screenWidth * 0.3)
            .background(.white)
            .cornerRadius(8)
    }
}
