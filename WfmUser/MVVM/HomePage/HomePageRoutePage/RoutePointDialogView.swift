//
//  RoutePointDialogView.swift
//  WfmUser
//
//  Created by Mustafa Alper Aydin on 18.03.2025.
//

import SwiftUI

struct RoutePointDialogView: View {
    @EnvironmentObject var homePageVM: HomePageViewModel
    /*@State var pointsArray: [PointModel] = []
    @State var personelRoutePointArray: [PointModel] = []
    @State var selectedPoint: PointModel? */
    
    var body: some View {
        ZStack {
            if let point = homePageVM.selectedPoint {
                VStack(spacing: 0) {
                    DialogHeaderCard(text: String(localized: "ABNDNoktaDetayi"), background: Color.DialogColor.dialogHeaderDarkBlue) {
                        homePageVM.isPointDialog = false
                    }
                    VStack(spacing: 0) {
                        RoutePointDialogViewTextView(text: "TakipId", desc: "\(point.takipId)", bgColorIndex: 1)
                        RoutePointDialogViewTextView(text: "Başlık", desc: "\(point.isim)", bgColorIndex: 0).lineLimit(2)
                        RoutePointDialogViewTextView(text: "Adres", desc: "\(point.gelenAdres)", bgColorIndex: 1).lineLimit(2)
                        HStack(spacing: 0) {
                            RoutePointDialogViewTextView(text: "SLA", desc: "\(point.sla)", bgColorIndex: 0, hstack: true)
                            RoutePointDialogViewTextView(text: "İ.Süre", desc: "\(point.calismaSuresiDK)", bgColorIndex: 0, hstack: true)
                        }
                        HStack(spacing: 0) {
                            RoutePointDialogViewTextView(text: "Değer", desc: "\(point.degerDesi)", bgColorIndex: 1, hstack: true)
                            RoutePointDialogViewTextView(text: "Yük", desc: "0", bgColorIndex: 1, hstack: true)
                        }
                        HStack(spacing: 0) {
                            RoutePointDialogViewTextView(text: "Hacim", desc: "\(point.hacim)", bgColorIndex: 0, hstack: true)
                            RoutePointDialogViewTextView(text: "Adet", desc: "\(point.adet)", bgColorIndex: 0, hstack: true)
                        }
                        HStack(spacing: 0) {
                            RoutePointDialogViewTextView(text: "K.Gün", desc: "\(point.kritikGun)", bgColorIndex: 1, hstack: true)
                            RoutePointDialogViewTextView(text: "K.Araç", desc: "\(point.kritikArac)", bgColorIndex: 1, hstack: true)
                        }
                        HStack(spacing: 0) {
                            RoutePointDialogViewTextView(text: "K.Nokta", desc: "\(point.kritikNokta)", bgColorIndex: 0, hstack: true)
                            RoutePointDialogViewTextView(text: "Frekans", desc: "\(point.frekans)", bgColorIndex: 0, hstack: true)
                        }
                        RoutePointDialogViewTextView(text: "", desc: "Planlama Bilgileri", bgColorIndex: 1)
                        let dayCount = point.haftaninGunu.components(separatedBy: ",").count
                        if dayCount == 1 {
                            HStack(spacing: 0) {
                                RoutePointDialogViewTextView(text: "Gün", desc: "\(getDayName(for: Int(point.haftaninGunu) ?? 0))", bgColorIndex: 0, hstack: true)
                                RoutePointDialogViewTextView(text: "KM", desc: "\(point.mesafeKM)", bgColorIndex: 0, hstack: true)
                                RoutePointDialogViewTextView(text: "Süre", desc: "\(point.sureDK)", bgColorIndex: 0, hstack: true)
                            }
                            HStack(spacing: 0) {
                                RoutePointDialogViewTextView(text: "Baş.", desc: "\(point.baslangicZamani.toTimeFormat())", bgColorIndex: 1, hstack: true)
                                RoutePointDialogViewTextView(text: "Bit.", desc: "\(point.bitisZamani.toTimeFormat())", bgColorIndex: 1, hstack: true)
                            }
                        } else if dayCount == 2 {
                            let days = point.haftaninGunu.components(separatedBy: ",")
                            let startDate = point.baslangicZamani.components(separatedBy: ",")
                            let endDate = point.bitisZamani.components(separatedBy: ",")
                            let distanceKm = point.mesafeKM.components(separatedBy: ",")
                            let timeMin = point.sureDK.components(separatedBy: ",")
                            HStack(spacing: 0) {
                                RoutePointDialogViewTextView(text: "Gün", desc: "\(getDayName(for: Int(days[0]) ?? 0))", bgColorIndex: 0, hstack: true)
                                RoutePointDialogViewTextView(text: "KM", desc: "\(distanceKm[0])", bgColorIndex: 0, hstack: true)
                                RoutePointDialogViewTextView(text: "Süre", desc: "\(timeMin[0])", bgColorIndex: 0, hstack: true)
                            }
                            HStack(spacing: 0) {
                                RoutePointDialogViewTextView(text: "Baş.", desc: "\(startDate[0].formattedTimeYYYY_MM_DDtoHH_MM_SS())", bgColorIndex: 1, hstack: true)
                                RoutePointDialogViewTextView(text: "Bit.", desc: "\(endDate[0].formattedTimeYYYY_MM_DDtoHH_MM_SS())", bgColorIndex: 1, hstack: true)
                            }
                            
                            HStack(spacing: 0) {
                                RoutePointDialogViewTextView(text: "Gün", desc: "\(getDayName(for: Int(days[1]) ?? 0))", bgColorIndex: 0, hstack: true)
                                RoutePointDialogViewTextView(text: "KM", desc: "\(distanceKm[1])", bgColorIndex: 0, hstack: true)
                                RoutePointDialogViewTextView(text: "Süre", desc: "\(timeMin[1])", bgColorIndex: 0, hstack: true)
                            }
                            HStack(spacing: 0) {
                                RoutePointDialogViewTextView(text: "Baş.", desc: "\(startDate[1].formattedTimeYYYY_MM_DDtoHH_MM_SS())", bgColorIndex: 1, hstack: true)
                                RoutePointDialogViewTextView(text: "Bit.", desc: "\(endDate[1].formattedTimeYYYY_MM_DDtoHH_MM_SS())", bgColorIndex: 1, hstack: true)
                            }
                        } else if dayCount == 3 {
                            let days = point.haftaninGunu.components(separatedBy: ",")
                            let startDate = point.baslangicZamani.components(separatedBy: ",")
                            let endDate = point.bitisZamani.components(separatedBy: ",")
                            let distanceKm = point.mesafeKM.components(separatedBy: ",")
                            let timeMin = point.sureDK.components(separatedBy: ",")
                            HStack(spacing: 0) {
                                RoutePointDialogViewTextView(text: "Gün", desc: "\(getDayName(for: Int(days[0]) ?? 0))", bgColorIndex: 0, hstack: true)
                                RoutePointDialogViewTextView(text: "KM", desc: "\(distanceKm[0])", bgColorIndex: 0, hstack: true)
                                RoutePointDialogViewTextView(text: "Süre", desc: "\(timeMin[0])", bgColorIndex: 0, hstack: true)
                            }
                            HStack(spacing: 0) {
                                RoutePointDialogViewTextView(text: "Baş.", desc: "\(startDate[0].formattedTimeYYYY_MM_DDtoHH_MM_SS())", bgColorIndex: 1, hstack: true)
                                RoutePointDialogViewTextView(text: "Bit.", desc: "\(endDate[0].formattedTimeYYYY_MM_DDtoHH_MM_SS())", bgColorIndex: 1, hstack: true)
                            }
                            
                            HStack(spacing: 0) {
                                RoutePointDialogViewTextView(text: "Gün", desc: "\(getDayName(for: Int(days[1]) ?? 0))", bgColorIndex: 0, hstack: true)
                                RoutePointDialogViewTextView(text: "KM", desc: "\(distanceKm[1])", bgColorIndex: 0, hstack: true)
                                RoutePointDialogViewTextView(text: "Süre", desc: "\(timeMin[1])", bgColorIndex: 0, hstack: true)
                            }
                            HStack(spacing: 0) {
                                RoutePointDialogViewTextView(text: "Baş.", desc: "\(startDate[1].formattedTimeYYYY_MM_DDtoHH_MM_SS())", bgColorIndex: 1, hstack: true)
                                RoutePointDialogViewTextView(text: "Bit.", desc: "\(endDate[1].formattedTimeYYYY_MM_DDtoHH_MM_SS())", bgColorIndex: 1, hstack: true)
                            }
                            
                            HStack(spacing: 0) {
                                RoutePointDialogViewTextView(text: "Gün", desc: "\(getDayName(for: Int(days[2]) ?? 0))", bgColorIndex: 0, hstack: true)
                                RoutePointDialogViewTextView(text: "KM", desc: "\(distanceKm[2])", bgColorIndex: 0, hstack: true)
                                RoutePointDialogViewTextView(text: "Süre", desc: "\(timeMin[2])", bgColorIndex: 0, hstack: true)
                            }
                            HStack(spacing: 0) {
                                RoutePointDialogViewTextView(text: "Baş.", desc: "\(startDate[2].formattedTimeYYYY_MM_DDtoHH_MM_SS())", bgColorIndex: 1, hstack: true)
                                RoutePointDialogViewTextView(text: "Bit.", desc: "\(endDate[2].formattedTimeYYYY_MM_DDtoHH_MM_SS())", bgColorIndex: 1, hstack: true)
                            }
                        } else if dayCount == 4 {
                            let days = point.haftaninGunu.components(separatedBy: ",")
                            let startDate = point.baslangicZamani.components(separatedBy: ",")
                            let endDate = point.bitisZamani.components(separatedBy: ",")
                            let distanceKm = point.mesafeKM.components(separatedBy: ",")
                            let timeMin = point.sureDK.components(separatedBy: ",")
                            HStack(spacing: 0) {
                                RoutePointDialogViewTextView(text: "Gün", desc: "\(getDayName(for: Int(days[0]) ?? 0))", bgColorIndex: 0, hstack: true)
                                RoutePointDialogViewTextView(text: "KM", desc: "\(distanceKm[0])", bgColorIndex: 0, hstack: true)
                                RoutePointDialogViewTextView(text: "Süre", desc: "\(timeMin[0])", bgColorIndex: 0, hstack: true)
                            }
                            HStack(spacing: 0) {
                                RoutePointDialogViewTextView(text: "Baş.", desc: "\(startDate[0].formattedTimeYYYY_MM_DDtoHH_MM_SS())", bgColorIndex: 1, hstack: true)
                                RoutePointDialogViewTextView(text: "Bit.", desc: "\(endDate[0].formattedTimeYYYY_MM_DDtoHH_MM_SS())", bgColorIndex: 1, hstack: true)
                            }
                            
                            HStack(spacing: 0) {
                                RoutePointDialogViewTextView(text: "Gün", desc: "\(getDayName(for: Int(days[1]) ?? 0))", bgColorIndex: 0, hstack: true)
                                RoutePointDialogViewTextView(text: "KM", desc: "\(distanceKm[1])", bgColorIndex: 0, hstack: true)
                                RoutePointDialogViewTextView(text: "Süre", desc: "\(timeMin[1])", bgColorIndex: 0, hstack: true)
                            }
                            HStack(spacing: 0) {
                                RoutePointDialogViewTextView(text: "Baş.", desc: "\(startDate[1].formattedTimeYYYY_MM_DDtoHH_MM_SS())", bgColorIndex: 1, hstack: true)
                                RoutePointDialogViewTextView(text: "Bit.", desc: "\(endDate[1].formattedTimeYYYY_MM_DDtoHH_MM_SS())", bgColorIndex: 1, hstack: true)
                            }
                            
                            HStack(spacing: 0) {
                                RoutePointDialogViewTextView(text: "Gün", desc: "\(getDayName(for: Int(days[2]) ?? 0))", bgColorIndex: 0, hstack: true)
                                RoutePointDialogViewTextView(text: "KM", desc: "\(distanceKm[2])", bgColorIndex: 0, hstack: true)
                                RoutePointDialogViewTextView(text: "Süre", desc: "\(timeMin[2])", bgColorIndex: 0, hstack: true)
                            }
                            HStack(spacing: 0) {
                                RoutePointDialogViewTextView(text: "Baş.", desc: "\(startDate[2].formattedTimeYYYY_MM_DDtoHH_MM_SS())", bgColorIndex: 1, hstack: true)
                                RoutePointDialogViewTextView(text: "Bit.", desc: "\(endDate[2].formattedTimeYYYY_MM_DDtoHH_MM_SS())", bgColorIndex: 1, hstack: true)
                            }
                            
                            HStack(spacing: 0) {
                                RoutePointDialogViewTextView(text: "Gün", desc: "\(getDayName(for: Int(days[3]) ?? 0))", bgColorIndex: 0, hstack: true)
                                RoutePointDialogViewTextView(text: "KM", desc: "\(distanceKm[3])", bgColorIndex: 0, hstack: true)
                                RoutePointDialogViewTextView(text: "Süre", desc: "\(timeMin[3])", bgColorIndex: 0, hstack: true)
                            }
                            HStack(spacing: 0) {
                                RoutePointDialogViewTextView(text: "Baş.", desc: "\(startDate[3].formattedTimeYYYY_MM_DDtoHH_MM_SS())", bgColorIndex: 1, hstack: true)
                                RoutePointDialogViewTextView(text: "Bit.", desc: "\(endDate[3].formattedTimeYYYY_MM_DDtoHH_MM_SS())", bgColorIndex: 1, hstack: true)
                            }
                        } else if dayCount == 5 {
                            let days = point.haftaninGunu.components(separatedBy: ",")
                            let startDate = point.baslangicZamani.components(separatedBy: ",")
                            let endDate = point.bitisZamani.components(separatedBy: ",")
                            let distanceKm = point.mesafeKM.components(separatedBy: ",")
                            let timeMin = point.sureDK.components(separatedBy: ",")
                            HStack(spacing: 0) {
                                RoutePointDialogViewTextView(text: "Gün", desc: "\(getDayName(for: Int(days[0]) ?? 0))", bgColorIndex: 0, hstack: true)
                                RoutePointDialogViewTextView(text: "KM", desc: "\(distanceKm[0])", bgColorIndex: 0, hstack: true)
                                RoutePointDialogViewTextView(text: "Süre", desc: "\(timeMin[0])", bgColorIndex: 0, hstack: true)
                            }
                            HStack(spacing: 0) {
                                RoutePointDialogViewTextView(text: "Baş.", desc: "\(startDate[0].formattedTimeYYYY_MM_DDtoHH_MM_SS())", bgColorIndex: 1, hstack: true)
                                RoutePointDialogViewTextView(text: "Bit.", desc: "\(endDate[0].formattedTimeYYYY_MM_DDtoHH_MM_SS())", bgColorIndex: 1, hstack: true)
                            }
                            
                            HStack(spacing: 0) {
                                RoutePointDialogViewTextView(text: "Gün", desc: "\(getDayName(for: Int(days[1]) ?? 0))", bgColorIndex: 0, hstack: true)
                                RoutePointDialogViewTextView(text: "KM", desc: "\(distanceKm[1])", bgColorIndex: 0, hstack: true)
                                RoutePointDialogViewTextView(text: "Süre", desc: "\(timeMin[1])", bgColorIndex: 0, hstack: true)
                            }
                            HStack(spacing: 0) {
                                RoutePointDialogViewTextView(text: "Baş.", desc: "\(startDate[1].formattedTimeYYYY_MM_DDtoHH_MM_SS())", bgColorIndex: 1, hstack: true)
                                RoutePointDialogViewTextView(text: "Bit.", desc: "\(endDate[1].formattedTimeYYYY_MM_DDtoHH_MM_SS())", bgColorIndex: 1, hstack: true)
                            }
                            
                            HStack(spacing: 0) {
                                RoutePointDialogViewTextView(text: "Gün", desc: "\(getDayName(for: Int(days[2]) ?? 0))", bgColorIndex: 0, hstack: true)
                                RoutePointDialogViewTextView(text: "KM", desc: "\(distanceKm[2])", bgColorIndex: 0, hstack: true)
                                RoutePointDialogViewTextView(text: "Süre", desc: "\(timeMin[2])", bgColorIndex: 0, hstack: true)
                            }
                            HStack(spacing: 0) {
                                RoutePointDialogViewTextView(text: "Baş.", desc: "\(startDate[2].formattedTimeYYYY_MM_DDtoHH_MM_SS())", bgColorIndex: 1, hstack: true)
                                RoutePointDialogViewTextView(text: "Bit.", desc: "\(endDate[2].formattedTimeYYYY_MM_DDtoHH_MM_SS())", bgColorIndex: 1, hstack: true)
                            }
                            
                            HStack(spacing: 0) {
                                RoutePointDialogViewTextView(text: "Gün", desc: "\(getDayName(for: Int(days[3]) ?? 0))", bgColorIndex: 0, hstack: true)
                                RoutePointDialogViewTextView(text: "KM", desc: "\(distanceKm[3])", bgColorIndex: 0, hstack: true)
                                RoutePointDialogViewTextView(text: "Süre", desc: "\(timeMin[3])", bgColorIndex: 0, hstack: true)
                            }
                            HStack(spacing: 0) {
                                RoutePointDialogViewTextView(text: "Baş.", desc: "\(startDate[3].formattedTimeYYYY_MM_DDtoHH_MM_SS())", bgColorIndex: 1, hstack: true)
                                RoutePointDialogViewTextView(text: "Bit.", desc: "\(endDate[3].formattedTimeYYYY_MM_DDtoHH_MM_SS())", bgColorIndex: 1, hstack: true)
                            }
                            
                            HStack(spacing: 0) {
                                RoutePointDialogViewTextView(text: "Gün", desc: "\(getDayName(for: Int(days[4]) ?? 0))", bgColorIndex: 0, hstack: true)
                                RoutePointDialogViewTextView(text: "KM", desc: "\(distanceKm[4])", bgColorIndex: 0, hstack: true)
                                RoutePointDialogViewTextView(text: "Süre", desc: "\(timeMin[4])", bgColorIndex: 0, hstack: true)
                            }
                            HStack(spacing: 0) {
                                RoutePointDialogViewTextView(text: "Baş.", desc: "\(startDate[4].formattedTimeYYYY_MM_DDtoHH_MM_SS())", bgColorIndex: 1, hstack: true)
                                RoutePointDialogViewTextView(text: "Bit.", desc: "\(endDate[4].formattedTimeYYYY_MM_DDtoHH_MM_SS())", bgColorIndex: 1, hstack: true)
                            }
                        } else if dayCount == 6 {
                            let days = point.haftaninGunu.components(separatedBy: ",")
                            let startDate = point.baslangicZamani.components(separatedBy: ",")
                            let endDate = point.bitisZamani.components(separatedBy: ",")
                            let distanceKm = point.mesafeKM.components(separatedBy: ",")
                            let timeMin = point.sureDK.components(separatedBy: ",")
                            HStack(spacing: 0) {
                                RoutePointDialogViewTextView(text: "Gün", desc: "\(getDayName(for: Int(days[0]) ?? 0))", bgColorIndex: 0, hstack: true)
                                RoutePointDialogViewTextView(text: "KM", desc: "\(distanceKm[0])", bgColorIndex: 0, hstack: true)
                                RoutePointDialogViewTextView(text: "Süre", desc: "\(timeMin[0])", bgColorIndex: 0, hstack: true)
                            }
                            HStack(spacing: 0) {
                                RoutePointDialogViewTextView(text: "Baş.", desc: "\(startDate[0].formattedTimeYYYY_MM_DDtoHH_MM_SS())", bgColorIndex: 1, hstack: true)
                                RoutePointDialogViewTextView(text: "Bit.", desc: "\(endDate[0].formattedTimeYYYY_MM_DDtoHH_MM_SS())", bgColorIndex: 1, hstack: true)
                            }
                            
                            HStack(spacing: 0) {
                                RoutePointDialogViewTextView(text: "Gün", desc: "\(getDayName(for: Int(days[1]) ?? 0))", bgColorIndex: 0, hstack: true)
                                RoutePointDialogViewTextView(text: "KM", desc: "\(distanceKm[1])", bgColorIndex: 0, hstack: true)
                                RoutePointDialogViewTextView(text: "Süre", desc: "\(timeMin[1])", bgColorIndex: 0, hstack: true)
                            }
                            HStack(spacing: 0) {
                                RoutePointDialogViewTextView(text: "Baş.", desc: "\(startDate[1].formattedTimeYYYY_MM_DDtoHH_MM_SS())", bgColorIndex: 1, hstack: true)
                                RoutePointDialogViewTextView(text: "Bit.", desc: "\(endDate[1].formattedTimeYYYY_MM_DDtoHH_MM_SS())", bgColorIndex: 1, hstack: true)
                            }
                            
                            HStack(spacing: 0) {
                                RoutePointDialogViewTextView(text: "Gün", desc: "\(getDayName(for: Int(days[2]) ?? 0))", bgColorIndex: 0, hstack: true)
                                RoutePointDialogViewTextView(text: "KM", desc: "\(distanceKm[2])", bgColorIndex: 0, hstack: true)
                                RoutePointDialogViewTextView(text: "Süre", desc: "\(timeMin[2])", bgColorIndex: 0, hstack: true)
                            }
                            HStack(spacing: 0) {
                                RoutePointDialogViewTextView(text: "Baş.", desc: "\(startDate[2].formattedTimeYYYY_MM_DDtoHH_MM_SS())", bgColorIndex: 1, hstack: true)
                                RoutePointDialogViewTextView(text: "Bit.", desc: "\(endDate[2].formattedTimeYYYY_MM_DDtoHH_MM_SS())", bgColorIndex: 1, hstack: true)
                            }
                            
                            HStack(spacing: 0) {
                                RoutePointDialogViewTextView(text: "Gün", desc: "\(getDayName(for: Int(days[3]) ?? 0))", bgColorIndex: 0, hstack: true)
                                RoutePointDialogViewTextView(text: "KM", desc: "\(distanceKm[3])", bgColorIndex: 0, hstack: true)
                                RoutePointDialogViewTextView(text: "Süre", desc: "\(timeMin[3])", bgColorIndex: 0, hstack: true)
                            }
                            HStack(spacing: 0) {
                                RoutePointDialogViewTextView(text: "Baş.", desc: "\(startDate[3].formattedTimeYYYY_MM_DDtoHH_MM_SS())", bgColorIndex: 1, hstack: true)
                                RoutePointDialogViewTextView(text: "Bit.", desc: "\(endDate[3].formattedTimeYYYY_MM_DDtoHH_MM_SS())", bgColorIndex: 1, hstack: true)
                            }
                            
                            HStack(spacing: 0) {
                                RoutePointDialogViewTextView(text: "Gün", desc: "\(getDayName(for: Int(days[4]) ?? 0))", bgColorIndex: 0, hstack: true)
                                RoutePointDialogViewTextView(text: "KM", desc: "\(distanceKm[4])", bgColorIndex: 0, hstack: true)
                                RoutePointDialogViewTextView(text: "Süre", desc: "\(timeMin[4])", bgColorIndex: 0, hstack: true)
                            }
                            HStack(spacing: 0) {
                                RoutePointDialogViewTextView(text: "Baş.", desc: "\(startDate[4].formattedTimeYYYY_MM_DDtoHH_MM_SS())", bgColorIndex: 1, hstack: true)
                                RoutePointDialogViewTextView(text: "Bit.", desc: "\(endDate[4].formattedTimeYYYY_MM_DDtoHH_MM_SS())", bgColorIndex: 1, hstack: true)
                            }
                            
                            HStack(spacing: 0) {
                                RoutePointDialogViewTextView(text: "Gün", desc: "\(getDayName(for: Int(days[5]) ?? 0))", bgColorIndex: 0, hstack: true)
                                RoutePointDialogViewTextView(text: "KM", desc: "\(distanceKm[5])", bgColorIndex: 0, hstack: true)
                                RoutePointDialogViewTextView(text: "Süre", desc: "\(timeMin[5])", bgColorIndex: 0, hstack: true)
                            }
                            HStack(spacing: 0) {
                                RoutePointDialogViewTextView(text: "Baş.", desc: "\(startDate[5].formattedTimeYYYY_MM_DDtoHH_MM_SS())", bgColorIndex: 1, hstack: true)
                                RoutePointDialogViewTextView(text: "Bit.", desc: "\(endDate[5].formattedTimeYYYY_MM_DDtoHH_MM_SS())", bgColorIndex: 1, hstack: true)
                            }
                        }
                        
                        HStack(spacing: 0) {
                            RoutePointDialogViewTextView(text: "Araç", desc: "\(point.arac)", bgColorIndex: 0, hstack: true)
                            RoutePointDialogViewTextView(text: "Araç Tipi", desc: "\(point.aracTipi)", bgColorIndex: 0, hstack: true)
                        }
                        HStack(spacing: 0) {
                            RoutePointDialogViewTextView(text: "Kapasite", desc: "", bgColorIndex: 1, hstack: true)
                            RoutePointDialogViewTextView(text: "Masraf", desc: "\(point.masraf)", bgColorIndex: 1, hstack: true)
                        }
                        HStack(spacing: 0) {
                            RoutePointDialogViewTextView(text: "Y. Süre", desc: "", bgColorIndex: 0, hstack: true)
                            RoutePointDialogViewTextView(text: "Y. Km", desc: "\(point.masraf)", bgColorIndex: 0, hstack: true)
                        }
                    }
                }
            }
        }.background(Color.white)
            .customOverlayStyle(cornerRadius: CR.dlg10, lineColor: Color.DialogColor.dialogHeaderDarkBlue)
            .padding(.horizontal, 10)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                Color.DialogColor.dialogBackgorundOpacityColor
                    .ignoresSafeArea()
                    .onTapGesture {
                        withAnimation{
                            homePageVM.isPointDialog = false
                        }
                    }
            )
            .customAppearAnimation2()
            .onAppear {
                //loadUsers()
            }
    }
    
    /*func loadUsers() {
        guard let fileURL = Bundle.main.url(forResource: "wfmUser", withExtension: "txt") else {
            print("❌ Dosya bulunamadı!")
            return
        }

        do {
            let rawData = try Data(contentsOf: fileURL)
                
            // 1. JSON'u String olarak oku
            guard let jsonString = String(data: rawData, encoding: .utf8) else {
                print("❌ Dosya içeriği stringe çevrilemedi!")
                return
            }
                
            print("✅ JSON STRING OKUNDU: \(jsonString.prefix(200))...")  // İlk 200 karakteri göster (kontrol amaçlı)
                
            // 2. İlk JSON decode işlemi: String formatında saklanan JSON'u tekrar JSON'a çevir
            guard let jsonData = jsonString.data(using: .utf8) else {
                print("❌ JSON string, Data'ya çevrilemedi!")
                return
            }
                
            let jsonStringDecoded: String
            do {
                jsonStringDecoded = try JSONDecoder().decode(String.self, from: jsonData)
                print("✅ JSON STRING DECODE EDİLDİ")
            } catch {
                print("❌ İlk JSON decode hatası: \(error.localizedDescription)")
                return
            }
                
            // 3. İkinci JSON decode işlemi: Asıl JSON veri modeline çevir
            guard let finalJsonData = jsonStringDecoded.data(using: .utf8) else {
                print("❌ Final JSON data oluşturulamadı!")
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode([PointModel].self, from: finalJsonData)
                DispatchQueue.main.async {
                    self.pointsArray = decodedData
                    self.personelRoutePointArray = self.pointsArray.filter { $0.arac == "07 BDU 311" }
                    self.selectedPoint = personelRoutePointArray[2]
                }
                print("✅ JSON BAŞARIYLA DECODE EDİLDİ!")
            } catch let DecodingError.dataCorrupted(context) {
                print("❌ Data Corrupted: \(context)")
            } catch let DecodingError.keyNotFound(key, context) {
                print("❌ Eksik Anahtar: \(key.stringValue) – Context: \(context.debugDescription)")
            } catch let DecodingError.typeMismatch(type, context) {
                print("❌ Tür Uyumsuzluğu: \(type) – Context: \(context.debugDescription)")
            } catch let DecodingError.valueNotFound(value, context) {
                print("❌ Değer Eksik: \(value) – Context: \(context.debugDescription)")
            } catch {
                print("❌ Genel JSON Decode Hatası: \(error.localizedDescription)")
            }
        } catch {
            print("❌ Dosya okuma hatası: \(error.localizedDescription)")
        }
    }*/
}

#Preview {
    RoutePointDialogView()
}

struct RoutePointDialogViewTextView: View {
    
    var text: String
    var desc: String
    var bgColorIndex: Int
    var hstack: Bool = false
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 5) {
                Text(text)
                    .font(.custom(fontsRegular, size: 12))
                    .foregroundStyle(.black)
                    .frame(maxWidth: 75, alignment: .leading)
                    .padding(.leading, 5)
                
                Divider()
                    .frame(height: 35)
                
                Text(desc)
                    .font(.custom(fontsRegular, size: 12))
                    .foregroundStyle(.black)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                if hstack {
                    Divider()
                        .frame(height: 35)
                }
            }.frame(maxWidth: .infinity)
            Divider()
        }.background(bgColorIndex == 0 ? .white : .gray.opacity(0.1))
    }
}
