//
//  ContentView.swift
//  waitlisthelper
//
//  Created by Jordan Yee on 1/8/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(red: 0.65, green: 1.0, blue: 0.99)
                .ignoresSafeArea()
            Text("WAITLIST HELPER")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color.white)
                .padding()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
