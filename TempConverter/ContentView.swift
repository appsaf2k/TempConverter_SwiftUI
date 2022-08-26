//
//  ContentView.swift
//  TempConverter
//
//  Created by @andreev2k on 25.08.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var inValue: TipeTemp = TipeTemp.tempNmae[7]
    @State private var outValue: TipeTemp = TipeTemp.tempNmae[3]
    @State private var inValueNumber: Double? = nil
    @FocusState private var focused: Bool
    
    
    var body: some View {
        NavigationView {
            VStack {
                Divider()
                Text("**Единица измерения**")
                    .padding(.bottom)
                VStack {
                    Picker("", selection: $inValue) {
                        ForEach(TipeTemp.tempNmae, id: \.self) {
                            Text($0.name)
                                //.tag($0)
                        }
                    } .pickerStyle(.wheel)
                }
                .frame(width: 160, height: 160)
                .padding(.bottom, 18)
                
                Divider()
                
                Text("**Конвертировать в**")
                    .padding(.bottom)
                VStack {
                    Picker("", selection: $outValue) {
                        ForEach(TipeTemp.tempNmae, id: \.self) {
                            Text($0.name)
                                //.tag($0)
                        }
                    } .pickerStyle(.wheel)
                }
                .frame(width: 160, height: 160)
                
                
                Spacer()
                Section {
                    TextField("*0 градусов  \(inValue.name)", value: $inValueNumber, format: .number)
                        .padding()
                        .frame(width: 300, height: 35)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10)
                        .padding(.horizontal, 30)
                        .keyboardType(.numberPad)
                        .focused($focused)
                    

                    Text("\(resultTemp(), format: .number)  \(outValue.character)")
                        .font(.title)
                        .padding(.top)
                }
                Spacer()
            }
            .navigationTitle("Конвертер единиц Температуры")
            .padding()
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    
                    Button("Done") {
                        focused = false
                    }
                }
            }
        }
    }
    
    func resultTemp() -> Double {
        // отношение всех значений 1 х 1, начинается с 0
        if inValue.volume == outValue.volume {
            return (inValue.volume * (inValueNumber ?? 0)) / outValue.volume
        }
        
/// ЦЕЛЬСИЙ
        // цельсий в фаренгейт
        if inValue.volume == 1 && outValue.volume == 32 {
            return (inValue.volume * (inValueNumber ?? 0) * 9/5) + 32
        }
        // цельсий в кельвин
        if inValue.volume == 1 && outValue.volume == 273.15 {
            return (inValueNumber ?? 0) + 273.15
        }
        // цельсий в ньютон
        if inValue.volume == 1 && outValue.volume == 3.030303 {
            return (inValueNumber ?? 0) * 100/33
        }
        // цельсий в реомюр
        if inValue.volume == 1 && outValue.volume == 0.8 {
            return (inValueNumber ?? 0) * 0.8
        }
        // цельсий в рёмера
        if inValue.volume == 1 && outValue.volume == 7.5 {
            return ((inValueNumber ?? 0) * 0.525) + 7.5
        }
        // цельсий в ранкина
        if inValue.volume == 1 && outValue.volume == 491.67 {
            return ((inValueNumber ?? 0) * 1.8) + 491.67
        }
        // цельсий в делиль
        if inValue.volume == 1 && outValue.volume == 150 {
            return ((inValueNumber ?? 0) * 1.5) - 100
        }
        
/// ФАРЕНГЕЙТ
        // фаренгейт в цельсий
        if inValue.volume == 32 && outValue.volume == 1 {
            return ((inValueNumber ?? 0) - 32) * 5/9
        }
        // фаренгейт в кельвин
        if inValue.volume == 32 && outValue.volume == 273.15 {
            return ((inValueNumber ?? 0) - 32) * 5/9 + 273.15
        }
        // фаренгейт в ньютон
        if inValue.volume == 32 && outValue.volume == 3.030303 {
            return ((inValueNumber ?? 0) - 32) * 0.18333334
        }
        // фаренгейт в реомюр
        if inValue.volume == 32 && outValue.volume == 0.8 {
            return ((inValueNumber ?? 0) - 32) * 0.44444445
        }
        // фаренгейт в рёмера
        if inValue.volume == 32 && outValue.volume == 7.5 {
            return (((inValueNumber ?? 0) - 32) * 0.291666) + 7.5
        }
        // фаренгейт в ранкина
        if inValue.volume == 32 && outValue.volume == 491.67 {
            return ((inValueNumber ?? 0) - 32) + 491.67
        }
        // фаренгейт в делиль
        if inValue.volume == 32 && outValue.volume == 150 {
            return (((inValueNumber ?? 0) - 32) * 0.8333333333) - 100
        }
        
/// КЕЛЬВИН
        // кельвин в цельсий
        if inValue.volume == 273.15 && outValue.volume == 1 {
            return (inValueNumber ?? 0) - 273.15
        }
        // кельвин в фаренгейт
        if inValue.volume == 273.15 && outValue.volume == 32 {
            return ((inValueNumber ?? 0.0) - 273.15) * 9/5 + 32
        }
        // кельвин в ньютон
        if inValue.volume == 273.15 && outValue.volume == 3.030303 {
            return ((inValueNumber ?? 0) - 273.15) * 0.33
        }
        // кельвин в реомюр
        if inValue.volume == 273.15 && outValue.volume == 0.8 {
            return ((inValueNumber ?? 0) - 273.15) * 0.8
        }
        // кельвин в рёмера
        if inValue.volume == 273.15 && outValue.volume == 7.5 {
            return (((inValueNumber ?? 0.0) - 273.15) * 0.525) + 7.5
        }
        // кельвин в ранкина
        if inValue.volume == 273.15 && outValue.volume == 491.67 {
            return (((inValueNumber ?? 0) - 273.15) * 1.8) + 491.67
        }
        // кельвин в делиль
        if inValue.volume == 273.15 && outValue.volume == 150 {
            return (((inValueNumber ?? 0) - 273.15) * 1.5) - 100
        }
        
/// НЬЮТОН
        // ньютон в цельсий
        if inValue.volume == 3.030303 && outValue.volume == 1 {
            return (inValueNumber ?? 0) / 0.33
        }
        // ньютон в фаренгейт
        if inValue.volume == 3.030303 && outValue.volume == 32 {
            return ((inValueNumber ?? 0) * 5.4545454545) + 32
        }
        // ньютон в кельвин
        if inValue.volume == 3.030303 && outValue.volume == 273.15 {
            return ((inValueNumber ?? 0) / 0.33) + 273.15
        }
        // ньютон в реомюр
        if inValue.volume == 3.030303 && outValue.volume == 0.8 {
            return (inValueNumber ?? 0) * 2.42424246
        }
        // ньютон в рёмера
        if inValue.volume == 3.030303 && outValue.volume == 7.5 {
            return ((inValueNumber ?? 0) * 1.5909091) + 7.5
        }
        // ньютон в ранкина
        if inValue.volume == 3.030303 && outValue.volume == 491.67 {
            return ((inValueNumber ?? 0) * 5.4545) + 491.67
        }
        // ньютон в делиль
        if inValue.volume == 3.030303 && outValue.volume == 150 {
            return ((inValueNumber ?? 0) * 4.5454545) - 100
        }
        
/// РЕОМЮР
        // реомюр в цельсий
        if inValue.volume == 0.8 && outValue.volume == 1 {
            return (inValueNumber ?? 0) / 0.8
        }
        // реомюр в фаренгейт
        if inValue.volume == 0.8 && outValue.volume == 32 {
            return ((inValueNumber ?? 0) * 2.25) + 32
        }
        // реомюр в кельвин
        if inValue.volume == 0.8 && outValue.volume == 273.15 {
            return ((inValueNumber ?? 0) / 0.8) + 273.15
        }
        // реомюр в ньютон
        if inValue.volume == 0.8 && outValue.volume == 3.030303 {
            return (inValueNumber ?? 0) * 0.41250
        }
        // реомюр в рёмера
        if inValue.volume == 0.8 && outValue.volume == 7.5 {
            return ((inValueNumber ?? 0) * 0.65625) + 7.5
        }
        // реомюр в ранкина
        if inValue.volume == 0.8 && outValue.volume == 491.67 {
            return ((inValueNumber ?? 0) * 2.25) + 491.67
        }
        // реомюр в делиль
        if inValue.volume == 0.8 && outValue.volume == 150 {
            return ((inValueNumber ?? 0) * 1.8750) - 100
        }
/// РЁМЕРА
        // рёмера в цельсий
        if inValue.volume == 7.5 && outValue.volume == 1 {
            return ((inValueNumber ?? 0) - 7.5) / 0.525
        }
        // рёмера в фаренгейт
        if inValue.volume == 7.5 && outValue.volume == 32 {
            return ((inValueNumber ?? 0) - 7.5) * 3.4285714 + 32
        }
        // рёмера в кельвин
        if inValue.volume == 7.5 && outValue.volume == 273.15 {
            return ((inValueNumber ?? 0) - 7.5) / 0.525 + 273.15
        }
        // рёмера в ньютон
        if inValue.volume == 7.5 && outValue.volume == 3.030303 {
            return ((inValueNumber ?? 0) - 7.5) * 0.6285714
        }
        // рёмера в реомюр
        if inValue.volume == 7.5 && outValue.volume == 0.8 {
            return ((inValueNumber ?? 0) - 7.5) * 1.5238095
        }
        // рёмера в ранкина
        if inValue.volume == 7.5 && outValue.volume == 491.67 {
            return ((inValueNumber ?? 0) - 7.5) * 3.4285714 + 491.67
        }
        // рёмера в делиль
        if inValue.volume == 7.5 && outValue.volume == 150 {
            return ((inValueNumber ?? 0) - 7.5) * 2.8571428 - 100
        }
/// РАНКИНА
        // ранкина в цельсий
        if inValue.volume == 491.67 && outValue.volume == 1 {
            return ((inValueNumber ?? 0) - 491.67) / 1.8
        }
        // ранкина в фаренгейт
        if inValue.volume == 491.67 && outValue.volume == 32 {
            return ((inValueNumber ?? 0) - 491.67) + 32
        }
        // ранкина в кельвин
        if inValue.volume == 491.67 && outValue.volume == 273.15 {
            return ((inValueNumber ?? 0) - 491.67) / 1.8 + 273.15
        }
        // ранкина в ньютона
        if inValue.volume == 491.67 && outValue.volume == 3.030303 {
            return ((inValueNumber ?? 0) - 491.67) * 0.18333333
        }
        // ранкина в реомюр
        if inValue.volume == 491.67 && outValue.volume == 0.8 {
            return ((inValueNumber ?? 0) - 491.67) * 0.4444444
        }
        // ранкина в рёмера
        if inValue.volume == 491.67 && outValue.volume == 7.5 {
            return ((inValueNumber ?? 0) - 491.67) * 0.29166666 + 7.5
        }
        // ранкина в делиль
        if inValue.volume == 491.67 && outValue.volume == 150 {
            return ((inValueNumber ?? 0) - 491.67) * 0.83333333 - 100
        }
/// ДЕЛИЛЬ
        // делиль в цельсий
        if inValue.volume == 150 && outValue.volume == 1 {
            return ((inValueNumber ?? 0) + 100) / 1.5
        }
        // делиль в фаренгейт
        if inValue.volume == 150 && outValue.volume == 32 {
            return ((inValueNumber ?? 0) + 100) * 1.2 + 32
        }
        // делиль в кельвин
        if inValue.volume == 150 && outValue.volume == 273.15 {
            return ((inValueNumber ?? 0) + 100) / 1.5 + 273.15
        }
        // делиль в ньютон
        if inValue.volume == 150 && outValue.volume == 3.030303 {
            return ((inValueNumber ?? 0) + 100) * 0.22
        }
        // делиль в реомюр
        if inValue.volume == 150 && outValue.volume == 0.8 {
            return ((inValueNumber ?? 0) + 100) * 0.5333333333
        }
        // делиль в рёмера
        if inValue.volume == 150 && outValue.volume == 7.5 {
            return ((inValueNumber ?? 0) + 100) * 0.35 + 7.5
        }
        // делиль в ранкина
        if inValue.volume == 150 && outValue.volume == 491.67 {
            return ((inValueNumber ?? 0) + 100) * 1.2 + 491.67
        }
 
        return 0.0
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
