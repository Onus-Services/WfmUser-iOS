//
//  LoadingDialogView.swift
//  WfmAdmin
//
//  Created by Mustafa Alper Aydin on 27.01.2025.
//

import Foundation
import SwiftUI
import FLAnimatedImage

struct LoadingDialogView: View {
    @State private var size: CGSize?
    var body: some View {
        ZStack {
            
            VStack(alignment: .center){
                Spacer()
                
                VStack {
                    LoadingGifView()
                }.frame(maxWidth: 200, maxHeight: 150)
                
                /*VStack {
                    //LottieView(name: "loading_gif_lottie", loopMode: .loop)
                    Text("Yükleniyor")
                }.frame(maxWidth: 350, maxHeight: 250) */
                
                
                Spacer()
            }
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                Color.gray
                    .ignoresSafeArea()
                    .opacity(0.9)
                    
            )
    }
}

struct LoadingGifView: UIViewRepresentable {
    //var playGif: Bool
    //var gifName: String
    let animatedView = FLAnimatedImageView()
    
    /*func makeUIView(context: UIViewRepresentableContext<LoadingGifView>) -> UIView {
        
        let view = UIView()
        
        let path : String = Bundle.main.path(forResource: "loading_rotamen", ofType: "gif")!
        let url = URL(fileURLWithPath: path)
        let gifData = try! Data(contentsOf: url)
        
        let gif = FLAnimatedImage(animatedGIFData: gifData)
        animatedView.animatedImage = gif
        
        animatedView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animatedView)
        
        NSLayoutConstraint.activate([
            animatedView.heightAnchor.constraint(equalTo: view.heightAnchor),
            animatedView.widthAnchor.constraint(equalTo: view.widthAnchor)])

        return view
    } */
    
    func makeUIView(context: UIViewRepresentableContext<LoadingGifView>) -> UIView {
        let view = UIView()

        guard let path = Bundle.main.path(forResource: "loading_rotamen", ofType: "gif") else {
            print("GIF dosyası bulunamadı")
            return view
        }

        let url = URL(fileURLWithPath: path)

        do {
            let gifData = try Data(contentsOf: url)
            let gif = FLAnimatedImage(animatedGIFData: gifData)
            animatedView.animatedImage = gif
        } catch {
            print("GIF verisi okunamadı: \(error)")
        }

        animatedView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animatedView)

        NSLayoutConstraint.activate([
            animatedView.heightAnchor.constraint(equalTo: view.heightAnchor),
            animatedView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])

        return view
    }

    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<LoadingGifView>){
        
    }
}
