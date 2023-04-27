//
//  ContentView.swift
//  RestartApp
//
//  Created by Aneudys Amparo on 25/4/23.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage(Constants.OnboardingKey) var isOnboardingViewActive: Bool = true
    
    var body: some View {
        ZStack{
            if isOnboardingViewActive {
                OnboardingView()
            } else {
                HomeView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
