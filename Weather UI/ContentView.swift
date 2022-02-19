//
//  ContentView.swift
//  Weather UI
//
//  Created by Jason Liu on 2022/2/19.
//

import SwiftUI

struct WeatherInfo : Identifiable{
    var id: UUID
    var code: String
    var icon: String
    var temprature: Int
}

struct ContentView: View {
    let days = [WeatherInfo(id: UUID(), code: "TUE", icon: "cloud.sun.fill", temprature: 77), WeatherInfo(id: UUID(), code: "WED", icon: "sun.max.fill", temprature: 88), WeatherInfo(id: UUID(), code: "THU", icon: "cloud.sun.rain.fill", temprature: 66) , WeatherInfo(id: UUID(), code: "FRI", icon: "sun.max.fill", temprature: 92) , WeatherInfo(id: UUID(), code: "SAT", icon: "cloud.snow.fill", temprature: 21)]
    
    @State var isNight: Bool = false
    
    var body: some View {
        ZStack {
            LinearGradient(colors: isNight ? [.black, .gray.opacity(0.5)] :[.blue, .white], startPoint: .topLeading, endPoint: .bottomTrailing).edgesIgnoringSafeArea(.all)
            VStack(spacing: 40){
                Text("Cupertino, CA")
                    .font(.system(size: 25, weight: .medium, design: .default))
                    .foregroundColor(.white)
                    .padding()
                VStack(spacing: 5){
                    Image(
                        systemName: isNight ? "cloud.moon.fill" :"cloud.sun.fill"
                    ).renderingMode(.original).resizable().aspectRatio(contentMode: .fit).frame(width: 180, height: 180, alignment: .center)
                    Text("76°").font(.system(size: 70, weight: .medium)).foregroundColor(.white)
                }
                HStack(spacing: 30) {
                    ForEach(days) { it in
                        VStack (spacing: 15){
                            Text(it.code).font(.title3).foregroundColor(.white)
                                .padding(4)
                            Image(systemName: it.icon).renderingMode(.original).resizable().scaledToFit().frame(width: 50, height: 50, alignment: .center)
                            Text("\(it.temprature)°").font(.title).bold().foregroundColor(.white)
                        }
                    }
                }
                Spacer()
                Button(action: {
                    isNight.toggle()
                }, label: {
                    Text("Change daytime")
                        .font(.title)
                        .fontWeight(.black)
                        .padding()
                        .cornerRadius(12)
                        .background(isNight ? .black : .white)
                        .foregroundColor(isNight ? .white : .blue)
                })
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
