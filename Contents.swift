//: Playground - noun: a place where people can play

import UIKit

var errorCodeString: String?
errorCodeString = "404"
//print(errorCodeString)
//if errorCodeString != nil {
//    let theError = errorCodeString!
//    print(theError)
//}

// the ! on line 9 is called "forced unwrapping"
// it accesses the underlying value of the optional
// it tries to access the value whether or not there is a value there (assumes there is a value--if not, would cause a runtime error)
// without ! it would assign the optional String instead of the actual String value

// Optional Binding
//if let temporaryConstant = anOptional {
//    code to do something with temporaryConstant
//} else {
//    there was no value in anOptional so anOptional is nil
//}
// example:
//if let theError = errorCodeString{
//    print(theError)
//}

// nesting optional binding
// watch out for deeply nested optional bindings ("the pyramid of doom")
// second if let takes place in the first making theError available to use in the second optional binding
//if let theError = errorCodeString {
//    if let errorCodeInteger = Int(theError){
//        print("\(theError): \(errorCodeInteger)")
//    }
//}

//unwrapping multiple optionals
// this unwraps two optionas in a single line
//if let theError = errorCodeString, let errorCodeInteger = Int(theError){
//    print("\(theError): \(errorCodeInteger)")
//}

// optional binding and additional checks
// here the final clause (errorCodeInteger == 404) is only executed if both optionals are successfully unwrapped
//if let theError = errorCodeString, let errorCodeInteger = Int(theError), errorCodeInteger == 404 {
//    print("\(theError): \(errorCodeInteger)")
//}


// Implicitly Unwrapped Optionals
// if you write var errorCodeString : String!, this signifies it is an implicitly unwrapped optional.  no need to unwrap.  however, accessing value will result in a runtime error if it does not have a value.  so...do not use if there is any chance the value may be nil
// will review these more when learning about classes and class initialization
// var errorCodeString: String! = nil
// you could not assign another var with type: String = errorCodeString because it can't be optional because it's already a explicitly declared type.  if you tried to assign the value of errorCodeString to another var without type explicitly declared swift would infer it to be an optional (String? = nil)

//Optional Chaining
// optional chaining provides a way to query an optional to determine whether it contains a value; it allows the programmer to chain multiple queries into an optional's value.  if each optional contains value, then the call to each succeeds and entire chain returns optional of expected type.  if any optional in query chain is nil, the entire chain returns nil.
var errorDescription: String?
if let theError = errorCodeString, let errorCodeInteger = Int(theError), errorCodeInteger == 404 {
    errorDescription = "\(errorCodeInteger + 200): resource was not found."
}
var upCaseErrorDescription = errorDescription?.uppercased()
errorDescription
// ? on line 63 signals that the code initiates the optional chaining process
// if no value in errorDescription, then no string to uppercase and so upCaseErrorDescription woudl be nil

// Modifying an optional in place
// you can modify an optional in place so you don't have to create a new var or let
upCaseErrorDescription?.append(" PLEASE TRY AGAIN.")
upCaseErrorDescription
// the ? on line 70 exposes the vaue of the optional if it exists.  if upCaseErrorDescription were nil, optiona would not have been modified because there is no value to update
// you could have used ! (to forcibly unwrap the optional) instead of ? but it is more risky (more potential for runtime crash)

// using optional binding to parse errorDescription
//let description: String
//if let errorDescription = errorDescription {
//    description = errorDescription
//} else {
//    description = "No error"
//}

// that was a lot of code for something simple, though...so therefore...
// the nil coalescing operator
// one line of code (line 86) replaces lines 76-81
let description = errorDescription ?? "No error"
// the left side of the ?? must be an optional.  the right side must be a nonoptional of the same type.
// comment out lines 60-62 and then errorDescription is nil so then description returns "No error"
// or write  errorDescription = nil before line 86

//BRONZE Challenge
// optionals are best used for things that can literally be nil...representing the complete absence of something...which is not the same as zero.  example:  which is better:
// number of kids a parent has: Int or Int?  --> I'd say Int...because all parents have at least one kid.  If it was number of kids an adult has, then Int? may be better to represent nonexistence.  However, 0 would also be okay in this instance.
// name of a person's pet: String or String?  --> in this case I'd use String...as the question implies the pet exists.  However, if the question was being asked on a form for pet owners and non pet owners then String? could be used.

// Silver Challenge
// accessing an optional's value when it is nil results in a runtime error.  try force-unwrapping an optional when it is nil.  examine the error and see what it is saying.
//var catName: String?
//catName = nil
//let petName = catName!
// this code gives an error that says "fatal error: unexpectedly found nil while unwrapping an Optional value
// also says "error: Execution was interrupted, reason: EXC_BAD_INSTRUCTION (code=EXC_1386_INVOP, subcode=0x0)


// **NOTE TO SELF**
// book says: "this chapter was fairly involved.  you learned a lot of new material.  optionals are a new topic regardless of your level of development experience.  They are also a powerful feature of swift.  as a developer, you will often need to represent nil in an instance.  optionals help keep track of whether instances are nil and provide a mechanism to respond appropriately.  If optionals do not feel comfortable yet, do not worry.  you will be seeing them quite a bit in future chapters."
// my comment: PHEW!  Optionals will take some review!  Until now, most of what has been covered has been more similar than different to javascript.  This is definitely different!  But I can also see how it can be useful.

