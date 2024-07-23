//
//  WelcomeView.swift
//  WomTestingSUI
//
//  Created by Jose David Bustos H on 22-07-24.
//

import SwiftUI

struct WelcomeView: View {
    @State private var isActive = false

    var body: some View {
        VStack {
            if isActive {
                ContentView()
            } else {
                Text("Wom Testing")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .opacity(isActive ? 0 : 1)
                    .scaleEffect(isActive ? 1.5 : 1)
                    .rotationEffect(.degrees(isActive ? 360 : 0))
                    .offset(y: isActive ? 50 : 0)
                    .animation(.easeInOut(duration: 1.5), value: isActive)
                    .onAppear {
          
                        withAnimation(Animation.easeIn(duration: 0.5)) {

                            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                                withAnimation(Animation.easeOut(duration: 2.5)) {
                                    isActive = true
                                }
                            }
                        }
                    }
            }
        }
    }
}

