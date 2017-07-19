# Big Nerd Ranch - Swift - Chapter 8 - Optionals

## Learning Highlights
* optionals are a special instance in Swift used to indicate that an instance may not have value
* use optionals to signal that an instance is potentially nil
* forced unwrapping accesses the underlying value of the optional
* optional binding can be used to detect whether an optional contains a value.  if there's a value you can assign it to a 
temporary constant or variable and make it available in the conditional's first branch of execution

```
if let temporaryConstant = anOptional {
  // do something with temporaryConstant
} else {
  // there was no value in anOptional; i.e., anOptional is nil
}
```

* implicitly unwrapped optionals - are like regular optional types, but you don't have to unwrap them.  you declare them differently, but accessing the value of 
an implicitly unwrapped optional will result in a runtime error if it does not have a value
* optional chaining provides a way to query an optional to determine whether it contains a value (similar to optional binding except it allows 
numerous queries into an optional's value.  if any optional in the query chain is nil, the entire chain will return nil.
* nil coalescing operator - lefthand side of ?? is an optional, the righthand side is a nonoptional of the same type.  if the lefthand
side is nil, ?? returns the righthand side.  if the lefthand side option is not nil, ?? returns the value contained in the optional


