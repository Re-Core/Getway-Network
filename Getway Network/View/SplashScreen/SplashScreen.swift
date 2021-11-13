//
//  SplashScreen.swift
//  Getway Network
//
//  Created by Rebin Aziz on 11/12/21.
//

import SwiftUI

struct SplashScreen: View {
    
    
    @State var animate = false
    @State var endSplash = false
    
    var body: some View {
        ZStack {
            
            Color("bg")
            Image("splash_screen_icon")
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: animate ? .fill : .fit)
                .frame(width: animate ? nil : 45, height:  animate ? nil : 45)
            
                .scaleEffect(animate ? 3 : 1)
                .frame(width: UIScreen.main.bounds.width)
            
        }
        .ignoresSafeArea(.all, edges: .all)
        .onAppear(perform: animateSplash)
        .opacity(endSplash ? 0 : 1)

    }
    
    func animateSplash(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
            withAnimation(Animation.easeOut(duration: 0.45 )) {
                animate.toggle()
            }
            
            withAnimation(Animation.linear(duration: 0.35 )) {
                endSplash.toggle()
            }
        }
    }
    
}



struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
