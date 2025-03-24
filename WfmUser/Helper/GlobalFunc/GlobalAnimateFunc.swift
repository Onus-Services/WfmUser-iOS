//
//  GlobalAnimateFunc.swift
//  WfmAdmin
//
//  Created by Mustafa Alper Aydin on 27.01.2025.
//

import Foundation
import SwiftUI

// MARK: Buton click
struct ButtonPress: ViewModifier {
    var onPress: () -> Void
    var onRelease: () -> Void
    
    func body(content: Content) -> some View {
        content
            .simultaneousGesture(
                DragGesture(minimumDistance: 0)
                    .onChanged({ _ in
                        onPress()
                    })
                    .onEnded({ _ in
                        onRelease()
                    })
            )
    }
}

struct ButtonEffect: ViewModifier {
    @Binding var isPressed: Bool

    func body(content: Content) -> some View {
        content
            .opacity(isPressed ? 0.6 : 1.0)
            .scaleEffect(isPressed ? 1.1 : 1.0)
            .pressEvents {
                withAnimation(.easeIn(duration: 0.2)) {
                    isPressed = true
                }
            } onRelease: {
                withAnimation {
                    isPressed = false
                }
            }
    }
}

// MARK: Dialog animate
struct CustomAppearAnimation2: ViewModifier {
    @State private var offsetY: CGFloat = 1000 // Başlangıçta ekranın altında
    
    func body(content: Content) -> some View {
        content
            .offset(y: offsetY)
            .onAppear {
                withAnimation(.easeInOut(duration: 0.5)) {
                    // Görünüm ortaya çıktığında animasyon
                    offsetY = 0
                }
            }
            .onDisappear {
                withAnimation(.easeIn(duration: 0.5)) {
                    // Görünüm kaybolduğunda animasyon
                    offsetY = 1000
                }
            }
    }
}

extension View {
    func pressEvents(onPress: @escaping (() -> Void), onRelease: @escaping (() -> Void)) -> some View {
        modifier(ButtonPress(onPress: {
            onPress()
        }, onRelease: {
            onRelease()
        }))
    }
    
    func customAppearAnimation2() -> some View {
        self.modifier(CustomAppearAnimation2())
    }
}
