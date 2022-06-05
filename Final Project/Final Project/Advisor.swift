//
//  Advisor.swift
//  Final Project
//
//  Created by mac on 3/12/22.
//

import Foundation
let Advisortypes = [
    Advisor(name: "150 - Nude Lingerie",
        type: .YLS,
        shortDescription: "High Shine Lipstick",
        longDescription: "Oil-infused lipstick high shine color hydrating and nourishing balm care"),
    
    Advisor(name: "70 - Le Nu- Satin Finish",
        type: .YLS,
        shortDescription: "Lipstick in a satin finish",
        longDescription: "Rich and highly pigmented color intense hydration and antioxidant care high color payoff"),
    
    Advisor(name: "444 - Pink",
        type: .MAC,
        shortDescription: "Midtone coral",
        longDescription: "A lightweight, raspberry seed- and organic extra-virgin olive oil-infused lipstick that delivers sheer and shiny colour with a long-wearing, lustrous finish"),
    
    Advisor(name: "101-LOVE ME LIPSTICK",
        type: .MAC,
        shortDescription: "Vivid blue-red. Pair with Lip Pencil in Ruby Woo",
        longDescription: "OA weightless argan oil-infused lipstick that delivers an instant hit of powerful colour and all-day moisture in a luxurious satin-soft finish"),
    
    Advisor(name: "999 - Bad Lieutenant",
        type: .TomFord,
        shortDescription: "warm toned, light medium pink",
        longDescription: "A fade-resistant lip color with a creamy, vibrant, true-color finish in shades from second-skin nudes to blazing reds."),
    
    Advisor(name: "600 - Nubile",
        type: .TomFord,
        shortDescription: "High Shine Lipstick",
        longDescription: "Oil-infused lipstick high shine color hydrating and nourishing balm care"),
    
    Advisor(name: "02 - Scarlet Rouge",
        type: .TomFord,
        shortDescription: "Bitter Peach Lip Color Matte Lipstick",
        longDescription: "A classic, velvet-matte lipstick in Bitter Peach packaging."),
    
    
    Advisor(name: "103 - 03 Androgino",
        type: .Armani,
        shortDescription: "Lip Power Long Lasting",
        longDescription: "A longwearing satin lipstick that delivers ultra-vivid color in one swipe, all-day wear and comfort, and precision application with an innovative, drop-shaped bullet"),
    
    Advisor(name: "415 - Redwood",
        type: .Armani,
        shortDescription: "Lip Maestro Liquid Matte Lipstick",
        longDescription: " A hydrating matte liquid lipstick that delivers intense, velvety lip color and a creamy texture for lips that feel as luxurious as they look"),
    
    Advisor(name: "100 - infinite",
        type: .Armani,
        shortDescription: "Ecstasy Mirror High Shine Lip Gloss",
        longDescription: "A high-shine lip lacquer that delivers high-impact, long-wearing color, hydration, and comfort in one stroke"),
]

class Advisor {
    enum `Type`: String {
        case YLS = "YLS"
        case MAC = "MAC"
        case TomFord = "TomFord"
        case Armani = "Armani"
    }
    
    var name: String
    var type: Type
    var shortDescription: String
    var longDescription: String
    
    init(name: String, type: Type, shortDescription: String, longDescription: String) {
        self.name = name
        self.type = type
        self.shortDescription = shortDescription
        self.longDescription = longDescription
    }
    
}
