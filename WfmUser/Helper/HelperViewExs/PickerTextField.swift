//
//  PickerTextField.swift
//  WfmAdmin
//
//  Created by Mustafa Alper Aydin on 28.01.2025.
//

import Foundation
import SwiftUI

struct PickerTextField : UIViewRepresentable {
    private let textField = UITextField()
    private let pickerView = UIPickerView()
    private let helpher = HelpherPickerTextField()
    
    var data: [String]
    var placeholder: String
    var type: Int = 0
    
    @Binding var lastSelectedIndex: Int?
    
    @State var doneClicked: () -> Void = {}

    func makeUIView(context: Context) -> UITextField {
        self.pickerView.delegate = context.coordinator
        self.pickerView.dataSource = context.coordinator
        
        self.textField.placeholder = self.placeholder
        self.textField.inputView = self.pickerView
        
        if type == 1 {
            self.textField.font = UIFont(name: fontsRegular, size: 10)
            self.textField.textColor = .white
            let placeholderAttributes: [NSAttributedString.Key: Any] = [
                .foregroundColor: UIColor.white, // İstenilen rengi buraya ekleyin
            ]
            self.textField.attributedPlaceholder = NSAttributedString(string: self.placeholder, attributes: placeholderAttributes)
        } else if type == 2 {
            self.textField.font = UIFont(name: fontsMedium, size: 14)
            let placeholderAttributes: [NSAttributedString.Key: Any] = [
                .foregroundColor: UIColor.black, // İstenilen rengi buraya ekleyin
            ]
            self.textField.attributedPlaceholder = NSAttributedString(string: self.placeholder, attributes: placeholderAttributes)
        } else if type == 3 {
            self.textField.font = UIFont(name: fontsRegular, size: 8)
            let placeholderAttributes: [NSAttributedString.Key: Any] = [
                .foregroundColor: UIColor.black, // İstenilen rengi buraya ekleyin
            ]
            self.textField.attributedPlaceholder = NSAttributedString(string: self.placeholder, attributes: placeholderAttributes)
        } else if type == 4 {
            self.textField.font = UIFont(name: fontsRegular, size: 14)
            self.textField.textColor = .white
            let placeholderAttributes: [NSAttributedString.Key: Any] = [
                .foregroundColor: UIColor.white, // İstenilen rengi buraya ekleyin
            ]
            self.textField.attributedPlaceholder = NSAttributedString(string: self.placeholder, attributes: placeholderAttributes)
        } else {
            self.textField.font = UIFont(name: fontsMedium, size: 14)
        }
        self.textField.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        
        // Configure Accessory View
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Tamam", style: .plain, target: self.helpher, action: #selector(self.helpher.doneButtonAction))
        toolbar.setItems([flexibleSpace, doneButton], animated: true)
        self.textField.inputAccessoryView = toolbar
        
        self.helpher.doneButtonTapped = {
            if self.lastSelectedIndex == nil {
                self.lastSelectedIndex = 0
            }
            self.textField.resignFirstResponder()
            doneClicked()
        }

        
        return self.textField
    }
    
    func updateUIView(_ uiView: UITextField, context: Context) {
        self.pickerView.selectRow(self.lastSelectedIndex ?? 0, inComponent: 0, animated: true)
        if let lastSelectedIndex = self.lastSelectedIndex {
            
            
            if type == 3 {
                uiView.text = placeholder
            } else {
                if self.data[lastSelectedIndex] == "Durdur" {
                    uiView.text = "D"
                } else {
                    uiView.text = self.data[lastSelectedIndex]
                }
                
            }
            
            
            
        } else{
            uiView.text = ""
        }
    }
    
    func makeCoordinator() -> Coordinator {
        
        return Coordinator(data: self.data) { (index) in
            self.lastSelectedIndex = index
        }
    }
    
    class HelpherPickerTextField {
        
        public var doneButtonTapped: (() -> Void)?
        
        @objc func doneButtonAction() {
            self.doneButtonTapped?()
        }
    }
    
    class Coordinator: NSObject, UIPickerViewDelegate, UIPickerViewDataSource {
        private var data: [String]
        private var didSelectItem: ((Int) -> Void)?
        
        init(data: [String], didSelectItem: ((Int) -> Void)? = nil){
            self.data = data
            self.didSelectItem = didSelectItem
        }
        
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
        }
        
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return self.data.count
        }
        
        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            return self.data[0]
        }
        
        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            self.didSelectItem?(row)
        }
        
        func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
            return 50.0
        }
        
        func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
            
            // Yeni bir görünüm (UIView) oluşturun
            let containerView = UIView(frame: CGRect(x: 0, y: 0, width: screenWidth - 10, height: 44))
            
            
            
            // Metin etiketini oluşturun
            let labelContainer = UIView(frame: CGRect(x: 0, y: 0, width: containerView.frame.width, height: containerView.frame.height))
            
            let iconView = UIImageView(frame: CGRect(x: containerView.frame.width - 35, y: (containerView.frame.height - 25) / 2, width: 25, height: 25))
            iconView.contentMode = .scaleAspectFit
            iconView.image = UIImage(systemName: data[row] == "Kolide Hasar. Koli Kabul Edilmiyor." ? "photo.circle" : "")
            iconView.tintColor = .black
            containerView.addSubview(iconView)
            // Metin etiketini oluşturun
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: labelContainer.frame.width, height: labelContainer.frame.height - 1))
            label.text = data[row]
            label.numberOfLines = 2 // Tek satır olarak ayarlayın
            label.textAlignment = .center // Metni ortala

            // Metin etiketini labelContainer'a ekle
            labelContainer.addSubview(label)

            // labelContainer'ı containerView içinde ortala
            labelContainer.center = CGPoint(x: containerView.frame.width / 2, y: containerView.frame.height / 2)

            // labelContainer'ı containerView'a ekle
            containerView.addSubview(labelContainer)
                
            // Alt çizgi oluşturun
            let bottomLine = UIView(frame: CGRect(x: 0, y: containerView.frame.height - 1, width: containerView.frame.width, height: 1))
            bottomLine.backgroundColor = UIColor.gray.withAlphaComponent(0.5) // Çizgi rengini ayarlayın
  
            // Alt çizgiyi konteynere ekle
            containerView.addSubview(bottomLine)
                
            // Görünümü döndür
            return containerView
        }
    }
}
