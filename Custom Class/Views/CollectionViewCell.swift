//
//  CollectionViewCell.swift
//  HKP
//
//  Created by Amisha on 25/12/18.
//  Copyright © 2018 Amisha. All rights reserved.
//

import UIKit

//@IBDesignable
class CollectionViewCell: UICollectionViewCell {

    @IBInspectable var backgroundColorTypeAdapter : Int32 = 0 {
        didSet {
            self.backgroundColorType = ColorType(rawValue: self.backgroundColorTypeAdapter)
        }
    }
    var backgroundColorType : ColorType? {
        didSet {
            self.backgroundColor = backgroundColorType?.value
        }
    }
    
    @IBInspectable var gradientBackgroundTypeAdapter : Int32 = 0 {
        didSet {
            gradientBackgroundType = GradientColorType(rawValue: gradientBackgroundTypeAdapter) ?? .Clear
        }
    }
    var gradientBackgroundType : GradientColorType = .Clear {
        didSet {
            setGradientBackground(gradientBackgroundType: gradientBackgroundType)
        }
    }
    
    @IBInspectable var cornerRadius : CGFloat = 0 {
        didSet {
            setCornerRadius(cornerRadius)
        }
    }
   
    @IBInspectable var applyShadow : Bool = false {
        didSet {
            setShadow(applyShadow: applyShadow)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setGradientBackground(gradientBackgroundType: gradientBackgroundType)
    }
}
