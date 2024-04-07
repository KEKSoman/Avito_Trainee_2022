//
//  Support.swift
//  Avito_Trainee_2022
//
//  Created by Евгений колесников on 07.04.2024.
//

import Foundation
import UIKit


public func isIpad() -> Bool {
    
    switch UIDevice.current.userInterfaceIdiom {
    case .pad:
        return true
    default:
        return false
    }
}

let bgColor = UIColor(red: 159/255, green: 188/255, blue: 239/255, alpha: 1)
let cellColor = UIColor(red: 201/255, green: 231/255, blue: 163/255, alpha: 0.51)
