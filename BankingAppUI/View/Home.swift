//
//  Home.swift
//  BankingAppUI
//
//  Created by Ali Aghamirbabaei on 1/23/22.
//

import SwiftUI

struct Home: View {
    
    @State var colors: [ColorGrid] = [
        ColorGrid(hexValue: "#15654B", color: Color("Green")),
        ColorGrid(hexValue: "#DAA4FF", color: Color("Violet")),
        ColorGrid(hexValue: "#FFD9BA", color: Color("Yellow")),
        ColorGrid(hexValue: "#FE9EC4", color: Color("Pink")),
        ColorGrid(hexValue: "#FB3272", color: Color ("Orange")),
        ColorGrid(hexValue: "#4460EE", color: Color("Blue")),
    ]
    
    // MARK: Animation Properties
    /// Instead of making each boolean for separate animation making it as array to avoid multiple lines of code.
    @State var animations: [Bool] = Array(repeating: false, count: 10)
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    
                } label: {
                    Image(systemName: "arrow.left")
                        .font(.title2)
                        .foregroundColor(.white)
                }
                .hTrailing()
                
                Button {
                    
                } label: {
                    Image("Profile")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 45, height: 45)
                        .clipShape(Circle())
                }
            }
            .padding([.horizontal, .top])
            .padding(.bottom, 5)
            
            // MARK: Using Geometry Reader for Setting Offset
            GeometryReader {proxy in
                let maxY = proxy.frame(in: .global).maxX
                
                CreditCard()
                // MARK: 3D Rotation
                    .rotation3DEffect(.init(degrees: animations[0] ? 0 : -270), axis: (x: 1, y: 0, z: 0), anchor: .center)
                    .offset(y: animations[0] ? 0 : -maxY)
            }
            .frame(height: 250)
            
            HStack {
                Text("Choose a color")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .hLeading()
                
                Button {
                    
                } label: {
                    Text("View all")
                        .font(.callout)
                        .fontWeight(.semibold)
                        .foregroundColor(Color("Pink"))
                        .underline()
                }
            }
            .padding()
            
            Color.black
                .clipShape(CustomCorner(corners: [.topLeft, .topRight], radius: 40))
                .padding(.top)
        }
        .vTop()
        .hCenter()
        .ignoresSafeArea(.container, edges: .bottom)
        .background(Color("Background"))
        .preferredColorScheme(.dark)
        .onAppear(perform: animateScreen)
    }
    
    func animateScreen() {
        // MARK: Animating Screen
        /// First Animation of Credit Card
        withAnimation(.interactiveSpring(response: 1.3, dampingFraction: 0.7, blendDuration: 0.7)) {
            animations[0] = true
        }
    }
    
    // MARK: Animated Credit Card
    @ViewBuilder
    func CreditCard() -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .fill(Color("Pink"))
            
            VStack {
                HStack {
                    ForEach(1...4, id: \.self) {_ in
                        Circle()
                            .fill(.white)
                            .frame(width: 6, height: 6)
                    }
                    
                    Text("1234")
                        .font(.callout)
                        .fontWeight(.semibold)
                }
                .hLeading()
                
                HStack(spacing: -12) {
                    Text("Ali Aghamirbabaei")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .hLeading()
                    
                    Circle()
                        .stroke(.white, lineWidth: 1)
                        .frame(width: 30, height: 30)
                    
                    Circle()
                        .stroke(.white, lineWidth: 1)
                        .frame(width: 30, height: 30)
                }
                .vBottom()
            }
            .padding(.vertical, 20)
            .padding(.horizontal)
            .vTop()
            .hLeading()
            
            // MARK: Top Ring
            Circle()
                .stroke(.white.opacity(0.5), lineWidth: 18)
                .offset(x: 130, y: -120)
        }
        .clipped()
        .padding()
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
