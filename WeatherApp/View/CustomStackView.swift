//
//  CustomerStackView.swift
//  WeatherApp
//
//  Created by Quang Bao on 20/06/2021.
//

import SwiftUI

struct CustomStackView<Title:View, Content:View>: View {
    var titleView: Title
    var contentView: Content
    
    // Offsets...
    @State var topOffset: CGFloat = 0
    @State var bottomOffset: CGFloat = 0
    
    init(@ViewBuilder titleView:@escaping ()->Title, @ViewBuilder contentView:@escaping ()->Content){
        
        self.contentView = contentView()
        self.titleView = titleView()
    }
    
    var body: some View {
        
        VStack(spacing: 0){
            
            titleView
                .font(.callout)
                .lineLimit(1)
                //Max Height...
                .frame(height: 38)
//                .frame(width: .infinity, alignment: .leading)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading)
                .background(.ultraThinMaterial,in: CustomCorner(corners: bottomOffset < 38 ? .allCorners : [.topLeft,.topRight], radius: 12))
                .zIndex(1)
            
            VStack{
                
                Divider()
                
                contentView
                    .padding()
            }
            .background(.ultraThinMaterial,in: CustomCorner(corners: [.bottomLeft, .bottomRight], radius: 12))
            //Moving Content Upward...
            .offset(y: topOffset >= 120 ? 0 : -(-topOffset + 120))
            .zIndex(0)
            //Clipping to avoid background overlay
            .clipped()
            .opacity(getOpacity())
        }
        .colorScheme(.dark) //This were replace for code line in the on above
        .cornerRadius(12)
        .opacity(getOpacity())
        // Stopping View @120...
        .offset(y: topOffset >= 120 ? 0 : -topOffset + 120)
        .background(
        
            GeometryReader{proxy -> Color in
            
            let minY = proxy.frame(in: .global).minY
            let maxY = proxy.frame(in: .global).maxY
            
            DispatchQueue.main.async {
                self.topOffset = minY
                // reducing 120...
                self.bottomOffset = maxY - 120
                // this we will get our title height 38...
            }
            
            return Color.clear
            }
        )
        .modifier(CornerModifier(bottomOffset: $bottomOffset))
    }
    
    // opacity...
    func getOpacity()->CGFloat{
        
        if bottomOffset < 28{
            
            let progress = bottomOffset / 28
            
            return progress
        }
        return 1
    }
}

struct CustomerStackView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewInterfaceOrientation(.portrait)
//            ContentView()
//                .previewInterfaceOrientation(.portrait)
        }
    }
}

// to avoid this creating new Modifier...
struct CornerModifier: ViewModifier {
    
    @Binding var bottomOffset: CGFloat
    
    func body(content: Content) -> some View {
        
        if bottomOffset < 38{
            content
        }
        else{
            content
                .cornerRadius(12)
        }
    }
}
