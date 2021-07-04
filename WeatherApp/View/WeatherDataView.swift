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

//                Label {
//
//                    Text("Rainfall")
//
//                } icon: {
//
//                    Image(systemName: "drop.fill")
//                }
                Label {
                    
                    Text("10-Day Forecast")
                    
                } icon: {
                    
                    Image(systemName: "calendar")
                }


            } contentView: {

                VStack(alignment: .leading, spacing: 10) {
                    
                    ForEach(forecast){ cast in
                        
                        VStack {
                            HStack(spacing: 30){
                                
                                Text(cast.day)
                                    .font(.title3.bold())
                                    .frame(width: 60)
                                
                                Image(systemName: cast.image)
                                    .symbolVariant(.fill)
                                    .foregroundStyle(.yellow,.white)
                                    .frame(width: 10, alignment: .leading)
                                
                                Text("\(Int(cast.farenheit - 3)) - \(Int(cast.farenheit))˚C")
                                    .font(.title3.bold())
                                
                                //Progress Bar....
                                ZStack(alignment: .leading) {
                                    
                                    Capsule()
                                        .fill(.tertiary)
                                        .foregroundStyle(.white)
                                    
                                    // for width...
                                    GeometryReader{proxy in
                                        
                                        Capsule()
                                            .fill(.linearGradient(.init(colors: [.green,.orange, .red]),startPoint: .leading, endPoint: .bottomTrailing))
                                            .frame(width: (cast.farenheit / 100) * proxy.size.width)
                                        
                                    }
                                }
                                .frame(height: 4)
                            }
                            
                            Divider()
                        }
                        .padding(.vertical,8)
                    }
                }
            }
        }
    }
}

struct WeatherDataView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
