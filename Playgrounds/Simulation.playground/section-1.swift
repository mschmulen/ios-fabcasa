// Playground - noun: a place where people can play

import UIKit



// http://thexbar.me/2014/10/24/raddecay/


// ----------------------------
// Simulation approach
// ----------------------------

// Bernoulli random variable (either 0 or 1)
func rbinom( maxVal:Int, startVal:Int, Prob:Float) -> Int
{
    return maxVal
}

//test if one value decays or not

let result = rbinom(1, 1, 0.5)
println(result)

//test for 512 atoms decaying
for _ in 1...512 {
    //println("decay? \(rbinom(1,1,0.5) ) ")
}

// now we know 512 atoms decay from A to B in the first one second interval


//Let’s assume we start with 56 A and 44 B atoms. We move one second forward by simulating these.




// ----------------------------
// Markov Chains approach
// ----------------------------

// Formally, they are a sequence of random variables that depend only on the current state, but that means nothing to a lot of people. You’ve probably seen them in the form of random walks.


// The easiest way I can explain them is with an analogy to baseball. Imagine a batter is up to the plate with two outs, and no one on base. There are only a few things that can happend next. He can strike out and end the inning. He can hit a single, a double, a triple, and be on base. Finally, he can hit a home run and increase his teams score by one. These make of a set of discrete results for this state. Each one has a different probability of happening, hence why we there are things like batting averages, slugging percentages, and other fancier statistics. These are the states a Markov chain can be in. Each at-bat is one of the random variables in the sequence.


let v1 = (1,1,1)
let v2 = (0,0,0)
let matrix = [
    (0,0,0),
    (0,0,0),
    (0,0,0)]

func dotMultiply( v1:(Float,Float, Float), v2:(Float,Float, Float) ) -> (Float,Float, Float) {
    
    return v1
}//end dotMultiply











