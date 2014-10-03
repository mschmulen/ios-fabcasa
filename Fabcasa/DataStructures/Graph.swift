//
//  Graph.swift
//  ExampleTemplate
//
//  Created by Matthew Schmulen on 10/2/14.
//  Copyright (c) 2014 Matthew Schmulen. All rights reserved.
//

import Foundation

/*

usage:

//data
var myGraph: Graph = Graph()

*/

// reference : https://github.com/waynewbishop/SwiftStructures

public class GraphNode{
    var node: String?
    var neighbors: Array<GraphEdge>
    var visited: Bool = false
    
    init() {
        self.neighbors = Array<GraphEdge>()
    }
}

public class GraphEdge {
    var neighbor: GraphNode
    var weight: Int
    
    init() {
        weight = 0
        self.neighbor = GraphNode()
    }
}

class GraphPath {
    var total: Int!
    var destination: GraphNode
    var previous: GraphPath!
    
    init(){ destination = GraphNode() }
}

class Graph
{
    private var canvas: Array<GraphNode>
    var isDirected: Bool
    
    init() {
        canvas = Array<GraphNode>()
        isDirected = true
    }
    
    //add a new node to the graph
    func addNode(#node: String) -> GraphNode {
        //set the key
        var childNode: GraphNode = GraphNode()
        childNode.node = node
        
        //add the node to the graph canvas
        canvas.append(childNode)
        
        return childNode
    }
    
    //add edge to source node
    func addEdge(#source: GraphNode, neighbor: GraphNode, weight: Int) {
        
        //create a new edge
        var newEdge = GraphEdge()
        
        //establish the default properties
        newEdge.neighbor = neighbor
        newEdge.weight = weight
        source.neighbors.append(newEdge)
        
        println("The neighbor of node: \(source.node as String!) is \(neighbor.node as String!)..")
        
        //check condition for an undirected graph
        if (isDirected == false) {
            
            //create a new reversed edge
            var reverseEdge = GraphEdge()
            
            //estabish the reversed properties
            reverseEdge.neighbor = source
            reverseEdge.weight = weight
            neighbor.neighbors.append(reverseEdge)
            
            println("The neighbor of node: \(neighbor.node as String!) is \(source.node as String!)..")
        }
    }
    
    //reverse the sequence of paths given the shortest path. process analagous to reversing a linked list.
    func reversePath(var head: GraphPath!, source: GraphNode) -> GraphPath! {
        
        if (head == nil) { return nil; }
        
        var current: GraphPath! = head
        var prev: GraphPath!
        var next: GraphPath!
        
        while(current != nil) {
            next = current.previous
            current.previous = prev
            prev = current
            current = next
        }
        
        //append the source path to the sequence
        var sourcePath: GraphPath = GraphPath()
        
        sourcePath.destination = source
        sourcePath.previous = prev
        sourcePath.total = nil
        head = sourcePath
        
        return head
    }
    
    //process Dijkstra's shortest path algorthim
    func processDijkstra(source: GraphNode, destination: GraphNode) -> GraphPath? {
        
        var frontier: Array<GraphPath> = Array<GraphPath>()
        var finalPaths: Array<GraphPath> = Array<GraphPath>()
        
        //use source edges to create the frontier
        for e in source.neighbors {
            
            var newPath: GraphPath = GraphPath()
            
            newPath.destination = e.neighbor
            newPath.previous = nil
            newPath.total = e.weight
            
            //add the new path to the frontier
            frontier.append(newPath)
        }
        
        //construct the best path
        var bestPath: GraphPath = GraphPath()
        
        while(frontier.count != 0) {
            
            //support path changes using the greedy approach
            bestPath = GraphPath()
            
            var x: Int = 0
            var pathIndex: Int = 0
            
            
            for (x = 0; x < frontier.count; x++) {
                
                var itemPath: GraphPath = frontier[x]
                
                if  (bestPath.total == nil) || (itemPath.total < bestPath.total) {
                    bestPath = itemPath
                    pathIndex = x
                }
                
            }
            
            //enumerate the bestPath edges
            for e in bestPath.destination.neighbors {
                
                var newPath: GraphPath = GraphPath()
                
                newPath.destination = e.neighbor
                newPath.previous = bestPath
                newPath.total = bestPath.total + e.weight
                
                //add the new path to the frontier
                frontier.append(newPath)
            }
            
            //preserve the bestPath
            finalPaths.append(bestPath)
            
            //remove the bestPath from the frontier
            frontier.removeAtIndex(pathIndex)
            
        } //end while
        
        //establish the shortest path as an optional
        var shortestPath: GraphPath! = GraphPath()
        
        for itemPath in finalPaths {
            if (itemPath.destination.node == destination.node) {
                if  (shortestPath.total == nil) || (itemPath.total < shortestPath.total) {
                    shortestPath = itemPath
                }
            }
        }
        return shortestPath
    }
    
    
    // MAS TODO breadth first search     func traverseGraphBFS(startingv: GraphNode) {
    
    // MAS TODO  an optimized version of Dijkstra's shortest path algorthim processDijkstraWithHeap(source: GraphVertex, destination: GraphVertex) -> GraphPath!
    
}