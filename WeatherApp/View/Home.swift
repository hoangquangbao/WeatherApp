//
//  Home.swift
//  WeatherApp
//
//  Created by Quang Bao on 18/06/2021.
//

import SwiftUI

struct Home: View {
    
    @State var offset:CGFloat = 0
    var topEdge: CGFloat
    
    var body: some View {
        ZStack{
            
            // Geometry Reader for getting height and width...
            //Dùng để fix chiều cao và chiều rộng
            GeometryReader{proxy in
                
                Image("Sky")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: proxy.size.width, height: proxy.size.height)
            }
            .ignoresSafeArea()
            //Blue Material...Làm mờ background
            //Update lên iOS 15 với bản Xcode 13 xem ntn
            //Lệnh dưới chờ update Xcode xem ntn
            //.overlay(.ultraThinMaterial)
            .overlay(.ultraThinMaterial)
            
            //Main View...
            
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack{
                    
                    //Weather Data...
                    VStack(alignment: .center, spacing: 5) {
                        
                        Text("Thua Thien Hue")
                            .font(.system(size: 35))
                            .foregroundColor(.white)
                            .shadow(radius: 5)
                        
//                        Text("33˚C")
                        Text(" 32˚")
                            .font(.system(size: 45))
                            .foregroundColor(.white)
                            .shadow(radius: 5)
                            .opacity(getTitleOpacity())
                        
                        Text("Cloudy˚")
                            .foregroundStyle(.secondary)
                            .foregroundColor(.white)
                            .shadow(radius: 5)
                            .opacity(getTitleOpacity())
                        
                        Text("H:16°,L:107°")
                            .foregroundStyle(.primary)
                            .foregroundColor(.white)
                            .shadow(radius: 5)
                            .opacity(getTitleOpacity())
                    }
                    .offset(y: -offset)
                    // For Bottom Drag Effect...
                    .offset(y: offset > 0 ? (offset / UIScreen.main.bounds.width) * 100 : 0)
                    .offset(y: getTitleOffset())
                    
                    //Custom Data View...
                    VStack(spacing: 25){
                        
                        //Customer Stack...

//                        //For Testing...
//                        ForEach(1...5,id: \.self){_ in
//                        //"CustomStackView" and "contentView" can put in here to multiply the display many time.
//
//                        }
                        CustomStackView {

                            //Lable here...
                            Label {

                                Text("Hourly Forecast")

                            } icon: {

                                Image(systemName: "clock")
                            }


                        } contentView: {

                            // Content...

                            ScrollView(.horizontal, showsIndicators: false) {

                                HStack(spacing: 10) {

                                    ForecastView(time: "12 PM", celcius: 30, image: "sun.max")
                                    ForecastView(time: "14 PM", celcius: 23, image: "cloud.hail")
                                    ForecastView(time: "16 PM", celcius: 26, image: "cloud.sun")
                                    ForecastView(time: "18 PM", celcius: 22, image: "cloud.moon.bolt.fill")
                                    ForecastView(time: "20 PM", celcius: 23, image: "cloud.hail")
                                    ForecastView(time: "22 PM", celcius: 26, image: "cloud.sun")
                                    ForecastView(time: "00 PM", celcius: 22, image: "cloud.moon.bolt.fill")
                                }
                            }
                        }
                        
                        WeatherDataView()
                    }
                    
                }
                .padding(.top,25)
                .padding()
                // getting Offset...
                .overlay(
                
                    //Using Geometry Reader...
                    GeometryReader{proxy -> Color in
                    
                    let minY = proxy.frame(in: .global).minY
                    
                    DispatchQueue.main.async {
                        self.offset = minY
                    }
                    
                    return Color.clear
                    
                    }
                )
            }
        }
    }
    
    func getTitleOpacity()->CGFloat{
        
        let titleOffset = -getTitleOffset()
        
        let progess = titleOffset / 20
        
        let opacity = 1 - progess
        
        return opacity
    }
    
    func getTitleOffset()->CGFloat{
        
        // setting one max height for whole title...
        // consider max as 120...
        if offset < 0{
            let progress = -offset / 120

            //since top padding is 25...
            let newOffset = (progress <= 1.0 ? progress : 1) * 20

            return -newOffset
        }
        
        return 0
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
         ContentView()
    }
}

struct ForecastView: View {
    var time: String
    var celcius: CGFloat
    var image: String
    var body: some View {
        VStack(spacing: 15) {
            
            Text(time)
                .font(.callout.bold())
                .foregroundStyle(.white)
            
            Text("\(Int(celcius))˚C")
                .font(.callout.bold())
                .foregroundStyle(.white)
            
            Image(systemName: image)
                .font(.title2)
            //MultiColor...
                .symbolVariant(.fill)
                .symbolRenderingMode(.palette)
             //   .foregroundStyle(.white, .yellow)
                .foregroundStyle(.yellow, .white)
            // max Frame...
                .frame(height: 30)
        }
        .padding(.horizontal,20)
    }
}
