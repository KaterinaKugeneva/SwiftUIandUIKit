//
//  ContentView.swift
//  SwiftUIandUIKit
//
//  Created by Ekaterina Kugeneva on 01.02.2022.
//

import SwiftUI



struct ContentView: View {
    @State private var targetValue: Int = Int.random(in: 0...100)
    @State private var value: Double = Double.random(in: 0...100)
    @State private var alertPresented = false
    
    var body: some View {
        
        VStack{
            Spacer()
            Text("Подвиньте слайдер как можно ближе к \(targetValue)")
                .padding()
            HStack{
                Text("0")
                SliderView(value: $value, targetValue: $targetValue)
                    .opacity((value) / Double(targetValue))
                Text("100")
            }.padding()
            Button("Показать результат") {
                alertPresented.toggle()
            }
            .alert(isPresented:$alertPresented) {
                Alert(
                    title: Text("Ваш результат:"),
                    message: Text("\(computeScore())")
                )
            }
            .padding()
            
            Button("Начать заново") {
                targetValue = Int.random(in: 0...100)
            }
            Spacer()
            
        }
    }
    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(value))
        return 100 - difference
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
