//
//  QuoteViewModel.swift
//  mvvm-swift
//
//  Created by Matthew Schmulen on 10/10/14.
//  Copyright (c) 2014 Matthew Schmulen. All rights reserved.
//

import Foundation


class QuoteViewModel {
    
    var quoteContent: String?
    var quoteScene: String?
    
    let quoteContentPlaceholder = "Quote Content"
    let quoteScenePlaceholder = "Quote Scene"
    
    init ( quoteContent: String? = nil, quoteScene: String? = nil )
    {
        self.quoteContent = quoteContent
        self.quoteScene = quoteScene
    }
    
    func createQuote() -> Quote? {
        switch ( quoteContent, quoteScene) {
        case let ( .Some(quoteContent), .Some(quoteScene) ) :
            return Quote( content:quoteContent, scene: quoteScene)
        default:
            return nil
        }
    }
    
}