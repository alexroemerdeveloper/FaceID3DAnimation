//
//  ContentView.swift
//  FaceID3DAnimation
//
//  Created by Alexander Römer on 20.12.19.
//  Copyright © 2019 Alexander Römer. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showFirstStroke  = false
    @State private var showSecondStroke = false
    @State private var showCheckMark    = false
    
    var body: some View {
        ZStack() {
            RadialGradient(gradient: Gradient(colors: [Color.black, .black]), center: .center, startRadius: 5, endRadius: 500)
            
            Circle()
                .strokeBorder(lineWidth: showFirstStroke ? 2 :  50, antialiased: false)
                .frame(width: 100, height: 100)
                .foregroundColor(showFirstStroke ? .green : .pink)
                .rotation3DEffect(.degrees(showFirstStroke ? 0 : 360), axis: (x: 1, y: 1, z: 1))
                .animation(Animation.easeInOut(duration: 2).delay(1))
                .onAppear() {
                    self.showFirstStroke.toggle()
            }
            
            Circle()
                .strokeBorder(lineWidth: showSecondStroke ? 2 :  50, antialiased: false)
                .frame(width: 100, height: 100)
                .foregroundColor(showFirstStroke ? .green : .pink)
                .rotation3DEffect(.degrees(showSecondStroke ? 0 : 360), axis: (x: -1, y: 1, z: 1))
                .animation(Animation.easeInOut(duration: 2).delay(1))
                .onAppear() {
                    self.showSecondStroke.toggle()
            }
            
            Path { path in
                path.move(to: CGPoint(x: 25, y: 45))
                path.addLine(to: CGPoint(x: 25, y: 45))
                path.addLine(to: CGPoint(x: 40, y: 60))
                path.addLine(to: CGPoint(x: 70, y: 30))
            }
            .trim(from: 0, to: showCheckMark ? 1 : 0)
            .stroke(style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round))
            .foregroundColor(.white)
            .offset(x: UIScreen.main.bounds.size.width / 2 - 47, y: UIScreen.main.bounds.size.height / 2 - 45)
            .animation(Animation.easeInOut.delay(3))
            .onAppear() {
                self.showCheckMark.toggle()
            }
            
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
