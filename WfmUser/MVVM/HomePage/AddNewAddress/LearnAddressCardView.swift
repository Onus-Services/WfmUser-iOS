//
//  LearnAddressCardView.swift
//  WfmUser
//
//  Created by Mustafa Alper Aydin on 21.03.2025.
//

import SwiftUI

struct LearnAddressCardView: View {
    @EnvironmentObject var homePageVM: HomePageViewModel
    
    var body: some View {
        ZStack {
            VStack(spacing: 1){
                
                Image(ImageConstants.learnAddressIcon.rawValue)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 53)
                
            }
            
            VStack(spacing: 0) {
                HStack {
                    Image(ImageConstants.adresDegistiriliyor.rawValue)
                        .resizable()
                        .frame(width: 20, height: 20)
                    Text(homePageVM.addressOnCenterMap)
                        .frame(maxWidth: .infinity)
                        .font(.custom(fontsRegular, size: 16))
                        .foregroundColor(.gray)
                        .padding(.vertical, 3)
                }
                .padding(.horizontal, 10)
                    .background(.white)
                    .customOverlayStyle(cornerRadius: 10, lineColor: Color.gray)
                HStack(spacing: 0) {
                    Button {
                        homePageVM.editAddress = false
                        homePageVM.pinOnMap = false
                    } label: {
                        Text("LearnAddressVazgec")
                            .padding(.vertical, 3)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .foregroundColor(.white)
                            .background(.green)
                    }
                    Button {
                        if homePageVM.addressOnCenterMap != "..." && homePageVM.place != nil {
                            /*mainPageVM.setPointAddress(mxRoutePoinstId: mainPageVM.clickedPoint!.MxRoutePointsId!, address: mainPageVM.addressOnCenterMap, lat: mainPageVM.place?.geoCoordinates?.latitude ?? -1.0, long: mainPageVM.place?.geoCoordinates?.longitude ?? -1.0) { result in
                                mainPageVM.createAllPointMarker()
                            } */
                            //homePageVM.editAddress = false
                            homePageVM.pinOnMap = false
                            homePageVM.isAddNewAddressDialog = true
                        }
                    } label: {
                        Text("LearnAddressOnayla")
                            .padding(.vertical, 3)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .foregroundColor(.white)
                            .background(.blue)
                    }
                }.customOverlayStyle(cornerRadius: 10, lineColor: .blue)
                    .padding(.horizontal, 40)
            }.padding(.horizontal, 10)
                .padding(.bottom, 150)
        }
    }
}

#Preview {
    LearnAddressCardView()
}

struct LearnAddressPinCardView: View {
    @EnvironmentObject var homePageVM: HomePageViewModel
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Button {
                    withAnimation {
                        homePageVM.editAddress = false
                        homePageVM.pinOnMap = true
                    }
                    
                } label: {
                    Image(ImageConstants.adresDegistirBtn.rawValue)
                        .resizable()
                        .frame(width: 60, height: 35)
                }
            }
        }.padding(10)
    }
}
