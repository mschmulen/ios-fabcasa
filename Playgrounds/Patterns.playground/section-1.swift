// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


let startDay:Int = 100 //eventA.1
let endDay:Int = 200//eventZ.1

let totalNumberOfDays = startDay - endDay
println(totalNumberOfDays)

//for day in startDay...endDay {
for day in startDay...endDay {
    
    println("\(day) times 5 is \(day * 5)")
    
}




//  For with a Wildcard Pattern
// A wildcard pattern matches and ignores any value and consists of an underscore (_). Use a wildcard pattern when you don’t care about the values being matched against. For example, the following code iterates through the closed range 1...3, ignoring the current value of the range on each iteration of the loop:

for _ in 1...3 {
    // Do something three times.
}




/*
Type-Casting Patterns

There are two type-casting patterns, the is pattern and the as pattern. Both type-casting patterns appear only in switch statement case labels. The is and as patterns have the following form:

is type
pattern as type
The is pattern matches a value if the type of that value at runtime is the same as the type specified in the right-hand side of the is pattern—or a subclass of that type. The is pattern behaves like the is operator in that they both perform a type cast but discard the returned type.

The as pattern matches a value if the type of that value at runtime is the same as the type specified in the right-hand side of the as pattern—or a subclass of that type. If the match succeeds, the type of the matched value is cast to the pattern specified in the left-hand side of the as pattern.

For an example that uses a switch statement to match values with is and as patterns, see Type Casting for Any and AnyObject.

GRAMMAR OF A TYPE CASTING PATTERN

type-casting-pattern → is-pattern­  as-pattern­
is-pattern → is­type­
as-pattern → pattern­as­type­
Expression Pattern

An expression pattern represents the value of an expression. Expression patterns appear only in switch statement case labels.

The expression represented by the expression pattern is compared with the value of an input expression using the Swift standard library ~= operator. The matches succeeds if the ~= operator returns true. By default, the ~= operator compares two values of the same type using the == operator. It can also match an integer value with a range of integers in an Range object, as the following example shows:

let point = (1, 2)
switch point {
case (0, 0):
println("(0, 0) is at the origin.")
case (-2...2, -2...2):
println("(\(point.0), \(point.1)) is near the origin.")
default:
println("The point is at (\(point.0), \(point.1)).")
}
// prints "(1, 2) is near the origin."
You can overload the ~= operator to provide custom expression matching behavior. For example, you can rewrite the above example to compare the point expression with a string representations of points.

// Overload the ~= operator to match a string with an integer
func ~=(pattern: String, value: Int) -> Bool {
return pattern == "\(value)"
}
switch point {
case ("0", "0"):
println("(0, 0) is at the origin.")
default:
println("The point is at (\(point.0), \(point.1)).")
}
// prints "The point is at (1, 2)."
GRAMMAR OF AN EXPRESSION PATTERN

expression-pattern → expression­
*/
