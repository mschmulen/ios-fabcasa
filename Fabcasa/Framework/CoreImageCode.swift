//
//  CoreImageCode.swift
//  fourTabTemplate
//
//  Created by Matthew Schmulen on 9/17/14.
//  Copyright (c) 2014 Matthew Schmulen. All rights reserved.
//

import Foundation
import CoreImage
import UIKit

typealias Filter = CIImage -> CIImage
typealias Parameters = Dictionary<String, AnyObject>

extension CIFilter {
    convenience init(name:String, parameters: Parameters) {
        self.init(name: name)
        setDefaults()
        for( key, value: AnyObject) in parameters {
            setValue(value, forKey: key)
        }
    }
    
    // computed property
    var outputImage: CIImage { return self.valueForKey(kCIOutputImageKey) as CIImage }
    
}

func blur( radius: Double) -> Filter {
    return { image in
        let parameters: Parameters = [kCIInputRadiusKey: radius, kCIInputImageKey: image]
        let filter = CIFilter(name:"CIGaussianBlur", parameters:parameters )
        return filter.outputImage
    }
}

func colorGenerator(color:UIColor) -> Filter {
    return { _ in
        let filter = CIFilter(name:"CIConstantColorGenerator",
                        parameters: [kCIInputColorKey: color] )
        return filter.outputImage
    }
}

func compositeSourceOver(overlay: CIImage) -> Filter{
    return { image in
        let parameters: Parameters = [kCIInputBackgroundImageKey: image, kCIInputImageKey: overlay]
        let filter = CIFilter(name:"CIGaussianBlur", parameters:parameters )
        return filter.outputImage.imageByCroppingToRect( image.extent())
    }
}

func colorOverlay(color: UIColor) -> Filter {
    return { image in
        let overlay = colorGenerator(color)(image)
        return compositeSourceOver(overlay)(image)
    }
}

func test() {
    
    let url = NSURL(string: "https://lh4.googleusercontent.com/-YCRFnjDOiwk/AAAAAAAAAAI/AAAAAA")
    let image = CIImage(contentsOfURL: url)
    
    let blurRadius = 5.0
    let overlayColor = UIColor.redColor().colorWithAlphaComponent(0.2)
    let blurredImage = blur(blurRadius)(image)
    let overlaidImage = colorOverlay(overlayColor)(blurredImage)
    
    let result = colorOverlay(overlayColor)(blur( blurRadius)(image))
    
}

//custom operator

func composeFilters( filter1:Filter, filter2:Filter) -> Filter
{
    return { img in filter1(filter2(img)) }
}


//Operator for filter composition

infix operator |> { associativity left }

func |> ( filter1:Filter, filter2:Filter ) -> Filter {
    return { img in filter1(filter2(img)) }
}

func testComposit() {
    
    let url = NSURL(string: "https://lh4.googleusercontent.com/-YCRFnjDOiwk/AAAAAAAAAAI/AAAAAA")
    let image = CIImage(contentsOfURL: url)

    let blurRadius = 5.0
    let overlayColor = UIColor.redColor().colorWithAlphaComponent(0.2)
    
    let myFilter1 = composeFilters(blur(blurRadius), colorOverlay(overlayColor))
    let result1 = myFilter1(image)
    
    let myFilter2 = blur(blurRadius) |> colorOverlay(overlayColor)
    let result2 = myFilter2(image)

}







