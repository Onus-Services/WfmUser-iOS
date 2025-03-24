//
//  HomePageListDayPageView.swift
//  WfmUser
//
//  Created by Mustafa Alper Aydin on 17.03.2025.
//

import SwiftUI

struct HomePageListDayPageView: View {
    @EnvironmentObject var homePageVM: HomePageViewModel
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                HomePageListDayPageHeaderInfo().environmentObject(homePageVM)
                    .padding(.vertical, 5)
                ScrollView {
                    VStack(spacing: 5) {
                        ForEach(0..<homePageVM.personelDayRoutePointArray.count, id:\.self) { i in
                            let cell = homePageVM.personelDayRoutePointArray[i]
                            if i == 0 {
                                HomePageRouteCellView(pastCell: cell, cell: cell).environmentObject(homePageVM)
                            } else {
                                let pastCell = homePageVM.personelDayRoutePointArray[i - 1]
                                HomePageRouteCellView(pastCell: pastCell, cell: cell).environmentObject(homePageVM)
                            }
                        }
                    }.padding(.horizontal, 5)
                }
                
            }.frame(maxHeight: .infinity, alignment: .top)
        }
    }
}

#Preview {
    //HomePageListDayPageView().environmentObject(HomePageViewModel())
    HomePageListDayPageHeaderInfo()
}


struct HomePageListDayPageHeaderInfo: View {
    @EnvironmentObject var homePageVM: HomePageViewModel
    
    var body: some View {
        VStack {
            //road.lanes - clock.circle -  - scalemass - turkishlirasign.circle
            //number.circle - calendar
            HStack {
                HomePageListDayPageHeaderInfoView(image: "calendar", desc: "\(getDayName(for: currentWeekdayNumber()))")
                HomePageListDayPageHeaderInfoView(image: "number.circle", desc: "\(homePageVM.personelRoutePointArray.filter { $0.haftaninGunu == "\(currentWeekdayNumber())" }.count)")
                HomePageListDayPageHeaderInfoView(image: "scalemass", desc: "0 gr")
                HomePageListDayPageHeaderInfoView(image: "turkishlirasign.circle", desc: "0 TL")
            }
            
            HStack {
                HomePageListDayPageHeaderInfoView(image: "road.lanes", desc: "0")
                HomePageListDayPageHeaderInfoView(image: "clock.circle", desc: "0")
            }
            
        }.padding(.horizontal, 5)
    }
}

struct HomePageListDayPageHeaderInfoView: View {
    
    var image: String
    var text: String = ""
    var desc: String
    
    var body: some View {
        HStack(spacing: 5) {
            Image(systemName: image)
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundStyle(.white)
            
            /*Text(text)
                .font(.custom(fontsSemiBold, size: 14))
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundStyle(.white)
                .padding(.horizontal, 5) */
            
            Text(desc)
                .font(.custom(fontsSemiBold, size: 14))
                .foregroundStyle(.white)
            
        }.padding(.vertical, 5)
            .padding(.horizontal, 5)
            .background(Color.MyColor.releaseNoteBlueText)
            .customOverlayStyle(cornerRadius: 10, lineColor: Color.MyColor.releaseNoteBlueText)
    }
}
