//
//  HomeView.swift
//  Restart
//
//  Created by Aneudys Amparo on 25/4/23.
//

import SwiftUI

struct HomeView: View {
    
    @AppStorage(Constants.OnboardingKey) var isOnboardingViewActive: Bool = false
    @State var isAnimating: Bool = false
    
    var body: some View {
        VStack {
            // HEADER
            Spacer()
            
            ZStack {
                CircleGroupView(ShapeColor: .gray, ShapeOpacity: 0.1)
                Image("character-2")
                    .resizable()
                    .scaledToFit()
                    .padding()
                    .offset(y: isAnimating ? 35 : -35)
                    .animation(.easeInOut(duration: 4).repeatForever(), value: isAnimating)
            }
            
            // CENTER
            
            Text("The time that leads to mastery is dependent on the intensity of our focus.")
                .font(.title3)
                .fontWeight(.light)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding()
            
            
            // FOOTER
            Spacer()
            
            Button(action: {
                withAnimation {
                    playSound(sound: "success", type: "m4a")
                    isOnboardingViewActive = true
                }
            }) {
                Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                    .imageScale(.large)
                Text("Restart")
                    .font(.system(.title3, design: .rounded))
                    .fontWeight(.bold)
            }
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .controlSize(.large)
        
        }
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now()+0.5, execute: {
                isAnimating = true
            })
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
