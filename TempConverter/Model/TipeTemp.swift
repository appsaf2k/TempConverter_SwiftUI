//
//  TipeTemp.swift
//  TempConverter
//
//  Created by @andreev2k on 26.08.2022.
//

import Foundation

struct TipeTemp: Identifiable, Hashable {
    var id: String = UUID().uuidString
    let name: String
    let volume: Double
    let character: String
    
    static var tempNmae = [
        
        TipeTemp(name: "Цельсия °C", volume: 1.0, character: "°C"),
        TipeTemp(name: "Фаренгейта °F", volume: 32.0, character: "°F"),
        TipeTemp(name: "Кельвина °K", volume: 273.15, character: "°K"),
        TipeTemp(name: "Ньютона °N", volume: 3.030303, character: "°N"),
        TipeTemp(name: "Реомюра °Re", volume: 0.8, character: "°Re"),
        TipeTemp(name: "Рёмера °Rø", volume: 7.5, character: "°Rø"),
        TipeTemp(name: "Ранкина °Ra", volume: 491.67, character: "°Ra"),
        TipeTemp(name: "Делиля °D", volume: 150, character: "°D")
        
    ]
    
}
