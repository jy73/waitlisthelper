//
//  ContentView.swift
//  waitlisthelper
//
//  Created by Jordan Yee on 1/8/22.
//

import SwiftUI

struct ContentView: View {
    @State private var waitlistPlace: Double = 0
    @State private var classSize: Double = 0
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("calculate_background")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()
                VStack {
                    Spacer()
                    Text("WILL YOU GET OFF THE WAITLIST?")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color.black)
                        .padding()
                    Spacer()
                    HStack {
                        Text("Place on Waitlist: \(waitlistPlace, specifier: "%.f")")
                        Spacer()
                    }
                    Slider(value: $waitlistPlace, in: 0...100, step: 1)
                        .padding()
                        .overlay(
                                RoundedRectangle(cornerRadius: 15.0)
                                    .stroke(lineWidth: 2.0)
                                    .foregroundColor(Color.blue)
                            )
                    HStack {
                        Text("Class Size: \(classSize, specifier: "%.f")")
                        Spacer()
                    }
                    Slider(value: $classSize, in: 0...100, step: 1)
                        .padding()
                        .overlay(
                                RoundedRectangle(cornerRadius: 15.0)
                                    .stroke(lineWidth: 2.0)
                                    .foregroundColor(Color.blue)
                            )

                    NavigationLink(destination: ResultView()) {
                                Text("CALCULATE")
                             }.buttonStyle(GrowingButton())
                } .padding()
                
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }
        
        }
    }

struct ResultView: View {
    @Environment(\.presentationMode) var presentation: Binding<PresentationMode>
    var body: some View {

        ZStack {
            Color(red: 50/255, green: 141/255, blue: 168/255)
                .ignoresSafeArea()
            
            Image("result_background")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
            VStack {
                HStack {
                    Button(action: {
                               self.presentation.wrappedValue.dismiss()
                            }) {
                            Image(systemName: "arrow.left")
                                .foregroundColor(.white)
                            }
                            .navigationBarHidden(true)
                    Spacer()
                } .padding()
                Spacer()
                Text("PROBABILITY")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .padding()
                Spacer()
            } .padding()
        }
        
    }
}

struct GrowingButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
