//
//  LinkedList.swift
//  fabcasa
//
//  Created by Matthew Schmulen on 9/28/14.
//  Copyright (c) 2014 Matthew Schmulen. All rights reserved.
//

import Foundation

/*

usage:

//data
let numberList = [8, 2, 10, 9, 7, 5]

//create a new instance
var linkedList: LinkedList<Int> = LinkedList<Int>()

//append list items
for number in numberList {
linkedList.appendNode(number)
}

//print all the keys
linkedList.printAllNodes()

*/

// Reference articles: https://github.com/waynewbishop/SwiftStructures

class LinkedListNode <T> {
    var node: T! = nil
    var next: LinkedListNode? = nil
    var previous: LinkedListNode? = nil
}

public class LinkedList <T: Equatable> {
    
    //LLNode head instance
    private var head: LinkedListNode<T> = LinkedListNode<T>()
    
    //calculate the number of nodes in the list
    var count: Int {
        if (head.node == nil) { return 0 }
        
        else {
            var current: LinkedListNode = head
            var count: Int = 1
            
            //walk the nodes incrementing the count
            while ((current.next) != nil) {
                current = current.next!;
                count++
            }
            return count
        }
    }
    
    func appendNode(node: T) {
        
        //establish the head node
        if (head.node == nil) {
            head.node = node;
            return;
        }
        
        //establish the iteration variables
        var current: LinkedListNode? =  head
        
        while (current != nil) {
            if (current?.next == nil) {
                var childToUse: LinkedListNode = LinkedListNode<T>()
                childToUse.node = node;
                childToUse.previous = current
                current!.next = childToUse;
                break
            }
            
            else {
                current = current?.next
            }
        }
    }
    
    //remove a node at a specific index
    func removeNodeAtIndex(index: Int) {
        
        var current: LinkedListNode<T>? =  head
        var trailer: LinkedListNode<T>? = nil
        var listIndex: Int = 0
        
        //determine if the removal is at the head
        if (index == 0) {
            current = current?.next
            head = current!
            return
        }
        
        //iterate through the remaining items
        while (current != nil) {
            if (listIndex == index) {
                //redirect the trailer and next pointers
                trailer!.next = current?.next
                current = nil
                break;
            }
            //update the assignments
            trailer = current
            current = current?.next
            listIndex++
        }
    } //end function
    
    
    func addNodeAtIndex(node: T, index: Int) {
        
        //establish the head node
        if (head.node == nil) {
            head.node = node;
            return;
        }
        
        //establish the trailer, current and new items
        var current: LinkedListNode<T>? = head
        var trailer: LinkedListNode<T>? = nil
        var listIndex: Int = 0
        
        
        //iterate through the list to find the insertion point
        while (current != nil) {
            
            if (index == listIndex) {
                
                var childToUse: LinkedListNode = LinkedListNode<T>()
                
                //create the new node
                childToUse.node = node;
                
                //connect the node infront of the current node
                childToUse.next = current
                childToUse.previous = trailer
                
                //use optional binding when using the trailer
                if let linktrailer = trailer {
                    linktrailer.next = childToUse
                    childToUse.previous = linktrailer
                }
                
                //point new node to the current / previous
                current!.previous = childToUse
                
                //replace the head node if required
                if (index == 0) { head = childToUse }
                break
            } //end if
            
            //iterate through to the next item
            trailer = current
            current = current?.next
            listIndex += 1
        }
    }
    
    func printAllNodes() {
        
        println("------------------ printAllNodes ------------------")
        var current: LinkedListNode! = head;
        while (current != nil) {
            println("link item is: \(current.node)")
            current = current.next
        }
        println("------------------   ------------------")
    }
    
}