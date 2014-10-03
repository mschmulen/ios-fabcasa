//
//  Queue.swift
//  ExampleTemplate
//
//  Created by Matthew Schmulen on 10/2/14.
//  Copyright (c) 2014 Matthew Schmulen. All rights reserved.
//

import Foundation

public class QueueNode<T>
{
    var node:T? = nil
    var next:QueueNode? = nil
}

public class Queue<T> {
    
    private var top: QueueNode<T>! = QueueNode<T>()
    
    //calculate the count
    var count: Int {
        var qCount = 0
        if ( top == nil ){ return qCount}
        else {
            var current: QueueNode<T> = top
            qCount = 1
            while ( current.next != nil ) {
                current = current.next!
                qCount++
            }
        }
        return qCount
    }
    
    
}