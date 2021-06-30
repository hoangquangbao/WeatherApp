//
//  ContentView.swift
//  WeatherApp
//
//  Created by Quang Bao on 17/06/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
//        Home()
        //Since Windows is Decrepted in iOS 15...
        //Getting Safe area using Geometry Reader...
        GeometryReader{proxy in
            
            let topEdge = proxy.safeAreaInsets.top
            
            Home(topEdge: topEdge)
                .ignoresSafeArea(.all, edges: .top)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
