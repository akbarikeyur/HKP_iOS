//
//  Fonts.swift
//  HKP
//
//  Created by Amisha on 25/12/18.
//  Copyright © 2018 Amisha. All rights reserved.
//

import Foundation

import UIKit

let ARIAL_BOLD = "Arial-Bold"
let ARIAL_REGULAR = "Arial"

let HELVETICA_BOLD = "Helvetica-Bold"
let HELVETICA_REGULAR = "Helvetica"

let ROBOTO_BOLD = "Roboto-Bold"
let ROBOTO_REGULAR = "Roboto-Regular"
let ROBOTO_MEDIUM = "Roboto-Medium"

let LATO_BOLD = "Lato-Bold"
let LATO_REGULAR = "Lato-Regular"
let LATO_LIGHT = "Lato-Light"
let LATO_ITALIC = "Lato-Italic"
let LATO_BLACK = "Lato-Black"

enum FontType : String {
    
    case Clear = ""
    case ArialRegular = "ar"
    case ArialBold = "ab"
    
    case HelveticaBold = "hb"
    case HelveticaRegular = "hr"
    
    case rb = "rb"
    case rr = "rr"
    case rm = "rm"
    
    case lb = "lb"
    case lr = "lr"
    case ll = "ll"
    case li = "li"
    case lbl = "lbl"
}


extension FontType {
    var value: String {
        get {
            switch self {
            case .Clear:
                return ARIAL_REGULAR
            
            case .ArialRegular:
                return ARIAL_REGULAR
            case .ArialBold:
                return ARIAL_BOLD
                
                
            case .HelveticaBold:
                return HELVETICA_BOLD
            case .HelveticaRegular:
                return HELVETICA_REGULAR
            
                
            case .rb:
                return ROBOTO_BOLD
            case .rr:
                return ROBOTO_REGULAR
            case .rm:
                return ROBOTO_MEDIUM
            
            case .lb:
                return LATO_BOLD
            case .lr:
                return LATO_REGULAR
            case .ll:
                return LATO_LIGHT
            case .li:
                return LATO_ITALIC
            case .lbl:
                return LATO_BLACK
                
            }
        }
    }
}

