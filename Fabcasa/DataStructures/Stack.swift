//
//  Stack.swift
//  ExampleTemplate
//
//  Created by Matthew Schmulen on 10/2/14.
//  Copyright (c) 2014 Matthew Schmulen. All rights reserved.
//

import Foundation

/*

usage:

//data
let numberList = [8, 2, 10, 9, 7, 5]

//create a new instance
var myStack: Stack<Int> = Stack<Int>()

//append list items
for number in numberList {
    myStack:push(number)
}

//pop
linkedList.pop()

*/

// reference : https://github.com/waynewbishop/SwiftStructures

class Stack<T> {
    
    private var top: LinkedListNode<T>! = LinkedListNode<T>()

    //push an item onto the stack
    func push(var node: T) {
        if (top == nil) {  top = LinkedListNode<T>() }
        
        if (top.node == nil){
            top.node = node;
            return
        }
        else {
            
            var childToUse: LinkedListNode<T> = LinkedListNode<T>()
            childToUse.node = node
            
            //set newly created item at the top
            childToUse.next = top;
            top = childToUse;
        }
    }
    
    //remove an item from the stack
    func pop() -> T? {
        
        //determine if the key or instance exist
        let topitem: T? = self.top?.node
        
        if (topitem == nil){ return nil }
        
        //retrieve and queue the next item
        var queueitem: T? = top.node!
        
        //reset the top value
        if let nextitem = top.next { top = nextitem }
        else { top = nil }
        
        return queueitem
    }
    
    //retrieve the top most item
    func peek() -> T? {
        //determine if the key or instance exist
        if let topitem: T = self.top?.node { return topitem }
        else { return nil }
    }
    
    //check for the presence of a value
    func isEmpty() -> Bool {
        //determine if the key or instance exist
        if let topitem: T = self.top?.node { return false }
        else { return true }
    }
    
    //calculate the count of the queue
    func count() -> Int {
        
        var SCount: Int = 0
        
        //determine if the key or instance exist
        let topitem: T? = self.top?.node
        
        if (topitem == nil) { return 0 }
        
        var current: LinkedListNode = top
        SCount++
        
        //cycle through the list of items to get to the end.
        while ((current.next) != nil) {
            current = current.next!;
            SCount++
        }
        return SCount
    }
    
}
