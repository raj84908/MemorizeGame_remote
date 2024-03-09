//
//  ContentView.swift
//  MemorizeGame
//
//  Created by Raj Patel on 3/9/24.
//

import SwiftUI

struct ContentView: View {
    let emojis: [String] = ["👻","🎃","😈","😈"]
    var body: some View {
        HStack {
            HStack {
                ForEach(emojis.indices,id: \.self){ index in
                    CardView(content:emojis[index])
                }
            
            }
            
        }
        .foregroundColor(.orange)
        .padding()
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack{
            let base: RoundedRectangle = RoundedRectangle(cornerRadius: 12)
            if isFaceUp{
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }
            else{
                base.fill()
            }
            
        }
        .rotation3DEffect(
            .degrees(isFaceUp ? 180: 0 ),
            axis: (x:0.0, y: 1.0, z:0.0)
        )
        .onTapGesture {
            withAnimation(.easeInOut(duration: 0.5)){
                isFaceUp.toggle()
            }
        }
        
    }
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
    
}
