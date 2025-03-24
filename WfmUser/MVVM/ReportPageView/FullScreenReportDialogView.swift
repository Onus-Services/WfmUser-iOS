//
//  FullScreenReportDialogView.swift
//  RxAdmin
//
//  Created by Banu Ortac on 13.06.2024.
//

import SwiftUI

struct FullScreenReportDialogView: View {
    @EnvironmentObject var homePageVM: HomePageViewModel
    var reportType: ReportType
    var data5: ChartDetailModel
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                HStack {
                    ZStack {
                        Text(data5.chartTitle)
                            .font(.custom(fontsMedium, size: 12))
                            .foregroundStyle(.black)
                        
                        HStack {
                            Spacer()
                            Button(action: {
                                takeScreenshotAndShare()
                            }, label: {
                                Image(systemName: "square.and.arrow.up.circle")
                                    .resizable()
                                    .frame(width: 25, height: 25)
                                    .foregroundStyle(.black)
                            })
                            
                            Button(action: {
                                withAnimation {
                                    homePageVM.isFullScreenChart = false
                                }
                            }, label: {
                                Image(systemName: "xmark.circle")
                                    .resizable()
                                    .frame(width: 25, height: 25)
                                    .foregroundStyle(.black)
                            })
                        }
                    }
                }.padding(.horizontal, 10)
                    .padding(.top, 5)
                switch returnChartType(reportType: reportType) {
                case .barChart:
                    BarChartsView(type: 1, data5: data5)
                case .pieChart:
                    EmptyView()
                case .lineChart:
                    LineChartsView(type: 1, data5: data5)
                }
            }.background(.white)
                .frame(width: screenHeight - 100, height: screenWidth - 20)
                .cornerRadius(10)
                .rotationEffect(.degrees(90))
            
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                Color.DialogColor.dialogBackgorundOpacityColor
                    .ignoresSafeArea()
                    .onTapGesture {
                        withAnimation {
                            //mainPageVM.isFullScreenChart = false
                        }
                    }
            )
        .customAppearAnimation2()

    }
}

/*
#Preview {
    FullScreenReportDialogView(data5: ChartDetailModel(), reportType: <#ReportType#>)
}
*/

func takeScreenshotAndShare() {
    if let window = UIApplication.shared.windows.first {
        UIGraphicsBeginImageContextWithOptions(window.bounds.size, false, 0.0)
        window.drawHierarchy(in: window.bounds, afterScreenUpdates: true)
            
        if let screenshot = UIGraphicsGetImageFromCurrentImageContext() {
            UIGraphicsEndImageContext()

            // Paylaşma işlemi için UIActivityViewController
            let activityController = UIActivityViewController(activityItems: [screenshot], applicationActivities: nil)
            UIApplication.shared.windows.first?.rootViewController?.present(activityController, animated: true, completion: nil)
        }
    }
}
