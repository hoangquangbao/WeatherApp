//
//  WeatherDataView.swift
//  WeatherApp
//
//  Created by Quang Bao on 29/06/2021.
//

import SwiftUI

struct WeatherDataView: View {
    
    var body: some View {

        VStack(spacing: 20){
            
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
            
            HStack{
                
                CustomStackView {
                    
                    Label {
                        
                        Text("UV Index")
                        
                    } icon: {
                        
                        Image(systemName: "sun.min")
                    }

                } contentView: {
                    
                    VStack(alignment: .leading, spacing: 10) {
                        
                        Text("0")
                            .font(.title)
                            .fontWeight(.semibold)
                        
                        Text("Low")
                            .font(.title)
                            .fontWeight(.semibold)
                    }
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                }
                
                CustomStackView {
                    
                    Label {
                        
                        Text("Rainfall")
                        
                    } icon: {
                        
                        Image(systemName: "drop.fill")
                    }

                } contentView: {
                    
                    VStack(alignment: .leading, spacing: 10) {
                        
                        Text("0 mm")
                            .font(.title)
                            .fontWeight(.semibold)
                        
                        Text("in last 24 hours")
                            .font(.title3)
                            .fontWeight(.semibold)
                    }
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                }
            }
            .frame(maxHeight: .infinity)
            
            CustomStackView {
                
                Label {
                    
                    Text("Rainfall")
                    
                } icon: {
                    
                    Image(systemName: "drop.fill")
                }

            } contentView: {
                
                VStack(alignment: .leading, spacing: 10) {
                    
                    Text("0 mm")
                        .font(.title)
                        .fontWeight(.semibold)
                    
                    Text("in last 24 hours")
                        .font(.title3)
                        .fontWeight(.semibold)
                }
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            }
        }
    }
}

struct WeatherDataView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
