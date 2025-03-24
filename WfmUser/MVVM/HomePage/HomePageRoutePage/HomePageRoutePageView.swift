//
//  HomePageRoutePageView.swift
//  WfmUser
//
//  Created by Mustafa Alper Aydin on 20.03.2025.
//

import SwiftUI

struct HomePageRoutePageView: View {
    @EnvironmentObject var homePageVM: HomePageViewModel
    
    @State var homePageType = 0
    
    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea(.all)
            VStack(spacing: 0) {
                if homePageType == 0 {
                    HomePageListDayPageView().environmentObject(homePageVM)
                } else {
                    VStack(spacing: 0) {
                        HomePageListDayPageHeaderInfo().environmentObject(homePageVM)
                        ZStack {
                            HelperMainMapView(mapView: homePageVM.mapView, markerClicked: { mapMarker in
                                homePageVM.dayMarkerClicked(groupingList: mapMarker)
                            }, onPanStart: {
                                if homePageVM.pinOnMap {
                                    homePageVM.onPanStart()
                                }
                            }, onPanEnd: { coor in
                                if homePageVM.pinOnMap {
                                    homePageVM.onPanEnd(coor: coor)
                                }
                            }, updateMapView: { map in
                                homePageVM.getDayRoutePointMarker()
                            })
                            if homePageVM.isDayMapExcDialog {
                                DayMapPointExcDialogView(selectedPoint: homePageVM.selectedPoint).environmentObject(homePageVM)
                            }
                            
                            if homePageVM.pinOnMap {
                                LearnAddressCardView().environmentObject(homePageVM)
                            }
                            
                            LearnAddressPinCardView().environmentObject(homePageVM)
                            
                            
                        }
                    }
                }
                HomePageBottomBar(homePageType: $homePageType).environmentObject(homePageVM)
                    .padding(.bottom, 1)
            }.frame(maxHeight: .infinity, alignment: .top)
            
            
        }
    }
}

#Preview {
    HomePageRoutePageView()
}
