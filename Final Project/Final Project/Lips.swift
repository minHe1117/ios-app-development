//
//  Lips.swift
//  Final Project
//
//  Created by mac on 3/14/22.
//

import Foundation
import UIKit
struct GlobalLipsObjectList {
    static var ObjectList: [Lips] = []
}

class Lips {
    var lipsPicture: UIImage
    var nameField: String
    var brandField: String
    var noField: String
    var colorField: String
   
    init(lipsPicture: UIImage, nameField: String, brandField: String, noField: String, colorField: String) {
        
        self.lipsPicture = lipsPicture
        self.nameField = nameField
        self.brandField = brandField
        self.noField = noField
        self.colorField = colorField
     
 }
}
