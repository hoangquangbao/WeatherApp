//
//  WeatherDataView.swift
//  WeatherApp
//
//  Created by Quang Bao on 29/06/2021.
//

import SwiftUI

struct WeatherDataView: View {
    
    var body: some View {

        VStack(spacing: 8){
            
            CustomStackView {
                
                Label {
                    
                    Text("Air Quality")
                    
                } icon: {
                    
                    Image(systemName: "circle.hexagonpath")
                }

            } contentView: {
                
                VStack(alignment: .leading, spacing: 10) {
                    
                    Text("143-Moderately Polluted")
                        .font(.title3.bold())
                    
                    Text("May cause breathing discomfort for people with lung disease such as asthma and discomfort for people with hear disease, children and older adults.")
                        .fontWeight(.semibold)
                }
                .foregroundStyle(.white)
            }
        }
    }
}

struct WeatherDataView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
