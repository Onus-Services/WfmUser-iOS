//
//  CustomPickerView.swift
//  WfmAdmin
//
//  Created by Mustafa Alper Aydin on 30.01.2025.
//

import SwiftUI

enum SelectionMode {
    case single, multiple
}

struct CustomPickerViewDialog<T: Hashable & CustomStringConvertible>: View {
    
    @EnvironmentObject var homePageVM: HomePageViewModel
    
    var title: String
    @Binding var selectedItems: Set<T>
    var items: [T]
    var selectionMode: SelectionMode
    @State private var showPicker = false
    var index: Int
    var disable: Bool = false
    //var onTap: () -> Void
    
    
    
    var body: some View {
        VStack(spacing: 5) {
            
            Text(title)
                //.font(.custom(fontsRegular, size: 12))
                .foregroundColor(.gray)
            Button(action: {
                withAnimation {
                    homePageVM.selectedFilterIndex = index
                    print("homePageVM.selectedFilterIndex - \(homePageVM.selectedFilterIndex)")
                    homePageVM.isPickerViewOpen = true
                }
            }) {
                HStack {
                    Text(selectedItems.isEmpty ? "Seçim yapın" : selectedText)
                    Spacer()
                    Image(systemName: "chevron.down")
                        .rotationEffect(Angle(degrees: showPicker ? 180 : 0))
                }
                .padding(3)
                .frame(height: 30)
                .foregroundStyle(disable ? .gray : .black)
                .customOverlayStyle(cornerRadius: 10, lineColor: disable ? .gray : .black)
                //.background(RoundedRectangle(cornerRadius: 10).stroke())
            }
            
            if showPicker {
                VStack(spacing: 0) {
                    ScrollView {
                        ForEach(items.indices, id: \.self) { index in
                            //if index != 0 { // 0. indeksi atlıyoruz
                                Button(action: {
                                    selectItem(items[index])
                                }) {
                                    HStack {
                                        Text(items[index].description)
                                        Spacer()
                                        if selectedItems.contains(items[index]) {
                                            Image(systemName: "checkmark")
                                        }
                                    }
                                }
                                .padding(.vertical, 5)
                            //}
                        }
                    }.frame(maxHeight: 100)
                }
                .background(Color(.systemGray6))
                .cornerRadius(10)
            }
        }.frame(maxHeight: 200)
            .padding(.horizontal, 10)
    }
    
    // Seçim işlemi
    private func selectItem(_ item: T) {
        switch selectionMode {
        case .single:
            selectedItems = [item] // Tekli seçim modunda, sadece seçilen öğe set edilir
        case .multiple:
            if selectedItems.contains(item) {
                selectedItems.remove(item) // Seçiliyse kaldır
            } else {
                selectedItems.insert(item) // Seçili değilse ekle
            }
        }
    }
    
    // Seçili öğelerin metin formatında gösterimi
    private var selectedText: String {
        if selectedItems.isEmpty {
            return items.first?.description ?? ""
        } else {
            return selectedItems.map { $0.description }.joined(separator: ", ")
        }
    }
}

struct CustomPickerView1<T: Hashable & CustomStringConvertible>: View {
    var title: String
    @Binding var selectedItems: Set<T>
    var items: [T]
    var selectionMode: SelectionMode
    @State private var showPicker = false
    
    var body: some View {
        VStack(spacing: 5) {
            
            Text(title)
                .font(.custom(fontsRegular, size: 12))
                .foregroundColor(.gray)
            Button(action: {
                showPicker.toggle()
            }) {
                HStack {
                    Text(selectedItems.isEmpty ? "Seçim yapın" : selectedText)
                    Spacer()
                    Image(systemName: "chevron.down")
                        .rotationEffect(Angle(degrees: showPicker ? 180 : 0))
                }
                .padding(3)
                .frame(height: 30)
                .background(RoundedRectangle(cornerRadius: 10).stroke())
            }
            
            if showPicker {
                VStack(spacing: 0) {
                    ScrollView {
                        ForEach(items.indices, id: \.self) { index in
                            //if index != 0 { // 0. indeksi atlıyoruz
                                Button(action: {
                                    selectItem(items[index])
                                }) {
                                    HStack {
                                        Text(items[index].description)
                                        Spacer()
                                        if selectedItems.contains(items[index]) {
                                            Image(systemName: "checkmark")
                                        }
                                    }
                                }
                                .padding(.vertical, 5)
                            //}
                        }
                    }.frame(maxHeight: 100)
                }
                .background(Color(.systemGray6))
                .cornerRadius(10)
                
            }
        }.frame(maxHeight: 200)
            .padding(.horizontal, 10)
    }
    
    // Seçim işlemi
    private func selectItem(_ item: T) {
        switch selectionMode {
        case .single:
            selectedItems = [item] // Tekli seçim modunda, sadece seçilen öğe set edilir
        case .multiple:
            if selectedItems.contains(item) {
                selectedItems.remove(item) // Seçiliyse kaldır
            } else {
                selectedItems.insert(item) // Seçili değilse ekle
            }
        }
    }
    
    // Seçili öğelerin metin formatında gösterimi
    private var selectedText: String {
        if selectedItems.isEmpty {
            return items.first?.description ?? ""
        } else {
            return selectedItems.map { $0.description }.joined(separator: ", ")
        }
    }
}

struct CustomPickerView: View {
    @Binding var selectedValue: String
    var items: [String]
    var selectionMode: SelectionMode
    
    @State private var showPicker = false
    @State private var tempSelectedItems: Set<String> = []

    var body: some View {
        VStack(spacing: 0) {
            // Seçili öğeleri gösteren buton
            Button(action: {
                showPicker.toggle()
                if selectionMode == .multiple {
                    tempSelectedItems = Set(selectedValue.split(separator: ", ").map { String($0) })
                }
            }) {
                HStack {
                    Text(selectedValue.isEmpty ? "Seçim yapın" : selectedValue)
                    Spacer()
                    Image(systemName: "chevron.down")
                        .rotationEffect(Angle(degrees: showPicker ? 180 : 0))
                }
                .padding(3)
                .background(RoundedRectangle(cornerRadius: 10).stroke())
                
            }

            // Seçeneklerin göründüğü picker
            if showPicker {
                VStack(spacing: 0) {
                    ScrollView {
                        ForEach(items, id: \.self) { item in
                            Button(action: {
                                selectItem(item)
                            }) {
                                HStack {
                                    Text(item)
                                    Spacer()
                                    if isSelected(item) {
                                        Image(systemName: "checkmark")
                                    }
                                }
                            }
                            .padding(.vertical, 3)
                        }
                    }.frame(maxHeight: 100)
                    
                    
                    // Çoklu seçim için onay butonu
                    if selectionMode == .multiple {
                        Button("Tamam") {
                            selectedValue = tempSelectedItems.joined(separator: ", ")
                            showPicker = false
                        }
                        .padding(10)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.blue))
                        .foregroundColor(.white)
                        .padding(.bottom, 5)
                    }
                }
                
                .background(Color(.systemGray6))
                .cornerRadius(10)
                
            }
        }.frame(maxHeight: 200)
            .padding(.horizontal, 10)
    }

    // Seçim işlemi
    private func selectItem(_ item: String) {
        switch selectionMode {
        case .single:
            selectedValue = item
            showPicker = false // Tekli seçimde picker kapanır
        case .multiple:
            if tempSelectedItems.contains(item) {
                tempSelectedItems.remove(item)
            } else {
                tempSelectedItems.insert(item)
            }
        }
    }

    // Seçili öğeyi belirleme
    private func isSelected(_ item: String) -> Bool {
        switch selectionMode {
        case .single:
            return selectedValue == item
        case .multiple:
            return tempSelectedItems.contains(item)
        }
    }
}
