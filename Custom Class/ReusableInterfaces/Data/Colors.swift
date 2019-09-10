//
//  Colors.swift
//  HKP
//
//  Created by Amisha on 25/12/18.
//  Copyright © 2018 Amisha. All rights reserved.
//

import UIKit

var ClearColor : UIColor = UIColor.clear //0
var WhiteColor : UIColor = UIColor.white //1
var DarkGrayColor : UIColor = colorFromHex(hex: "878787") //2
var LightGrayColor : UIColor = colorFromHex(hex: "acb1b5") //3

var BlueColor : UIColor = colorFromHex(hex: "0186ba")//4
var BlackColor : UIColor = UIColor.black //5
var OrangeColor : UIColor = colorFromHex(hex: "f47321")//6
var AliceBlueColor : UIColor = colorFromHex(hex: "f4f7f9")//7
var CharcolGreyColor : UIColor = colorFromHex(hex: "1c252a")//8

var AppColor : UIColor = colorFromHex(hex: "0186ba")//9
var StatusColor : UIColor = colorFromHex(hex: "00529C") //15

enum ColorType : Int32 {
    case Clear = 0
    case White = 1
    case DarkGray = 2
    case LightGray = 3
    case Blue = 4
    case Black = 5

    case Orenage = 6
    case AliceBlue = 7
    case CharcolGrey = 8
    
    case App = 9
    case Status = 15
}

extension ColorType {
    var value: UIColor {
        get {
            switch self {
            case .Clear: //0
                return ClearColor
            case .White: //1
                return WhiteColor
            case .DarkGray: //2
                return DarkGrayColor
            case .LightGray: //3
                return LightGrayColor
            case .Blue: //4
                return BlueColor
            case .Black: //5
                return BlackColor
            
            case .Orenage: //6
                return OrangeColor
            case .AliceBlue: //7
                return AliceBlueColor
            case .CharcolGrey: //8
                return CharcolGreyColor
            case .App:
                return AppColor
                
            case .Status:
                return StatusColor
            }
        }
    }
}

enum GradientColorType : Int32 {
    case Clear = 0
    case App = 1
}

extension GradientColorType {
    var layer : GradientLayer {
        get {
            let gradient = GradientLayer()
            switch self {
            case .Clear: //0
                gradient.frame = CGRect.zero
            case .App: //1
                gradient.colors = [
                    AppColor.cgColor,
                    WhiteColor.cgColor
                ]
                gradient.locations = [0, 1]
                gradient.startPoint = CGPoint.zero
                gradient.endPoint = CGPoint(x: 1, y: 0)
            }

            return gradient
        }
    }
}

