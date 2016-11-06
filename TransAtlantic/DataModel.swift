//
//  DataModel.swift
//  TransAtlantic
//
//  Created by Alistair Cooper on 11/5/16.
//  Copyright © 2016 Alistair Cooper. All rights reserved.
//

import Foundation
import UIKit

struct Person {
    
    let name: String
    let image: UIImage
    let isAmerican: Bool
    var guessIsAmerican: Bool?
    var isCorrect: Bool = false
    
    init(name: String, image: UIImage, isAmerican: Bool) {
        self.name = name
        self.image = image
        self.isAmerican = isAmerican
    }
}



