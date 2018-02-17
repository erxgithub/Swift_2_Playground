/*:
 ## More Optionals
 Let's start off with some review of optionals.
 When we have an optional variable, the variable might contain a value or it can contain nil. Optionals are represented with a '?' after the variable type.
 */
/*:
 - Experiment:
 Declare a optional Double value and set it to nil.
 */
var doubleValue: Double? = nil


/*:
 - Experiment:
 Assign a value your optional Double.
 */
doubleValue = 1.5

/*:
 - Experiment:
 Force unwrap the optional value. Why do you have to be careful about force unwrapping?
 */
print(doubleValue!)

/*:
 - Experiment:
 Use conditional unwrapping to verify if the optional has a value. Print the value if there is something, otherwise, print out to indicate there is no value present. Why is conditional unwrapping better than force unwrapping?
 */
if let unwrapped = doubleValue {
    print(unwrapped)
} else {
    print("no value")
}

/*:
 - Callout(Challenge):
 Create a function that removes the `nil` values from the array and returns a new array with only the valid Strings.
 */
var testData: [String?] = ["Heather", nil, "Mike", "John", nil, nil, "Bob"]

func removeNil(array: [String?]) -> [String] {
    var newArray = [String]()
    for item in array {
        if let unwrapped = item {
            newArray.append(unwrapped)
        }
    }
    return newArray
}

print(removeNil(array: testData))

//var newData: [String] = testData.flatMap{$0}
//print(newData)

/*:
 - Callout(Challenge):
 We want to write a function that validates form data filled in by a user. Once we encounter the first field that is blank, we want to indicate to the user that the field is blank.
 If the user has filled in everything correctly, we want to print all information out.
 Below is some test data you can use to test your function.
 */
//func validateData(username: String?, password: String?, email: String?) {
//    if username == nil {
//        print("Username is blank.")
//    } else if password == nil {
//        print("Password is blank.")
//    } else if email == nil {
//        print("Email is blank.")
//    } else {
//        print("Username: \(username!)")
//        print("Password: \(password!)")
//        print("Email: \(email!)")
//    }
//}

func validateData(username: String?, password: String?, email: String?) {
    guard username != nil else {
        print("Username is blank.")
        return
    }
    
    guard password != nil else {
        print("Password is blank.")
        return
    }
    
    guard email != nil else {
        print("Email is blank.")
        return
    }
    
    print("Username: \(username!)")
    print("Password: \(password!)")
    print("Email: \(email!)")
}

// Should pass all checks and print all information
//let username: String? = "user1"
//let password: String? = "password123"
//let email: String? = "user1@lighthouselabs.ca"

// Should stop at password check and indicate password field is empty
//let username: String? = "user1"
//let password: String? = nil
//let email: String? = "user1@lighthouselabs.ca"

// Should stop at username check and indicate username field is empty
let username: String? = nil
let password: String? = nil
let email: String? = "user1@lighthouselabs.ca"

validateData(username: username, password: password, email: email)

/*:
 ## Guard Let
 Depending on how you finished the first challenge, the code you've written might not be as readable or optimal as it could be. So let's take a look at how we can improve this.
 A 'guard' statement is similar to an 'if', but a 'guard' statement will only run its block of code if the conditions are NOT met.
 Let's look at a simple guard example below.
 */
let myNumber = 10

// This function checks if the number given to it is a positive or negative value
func isMyNumberANegativeValue(myNumber: Int){
  
  // This guard condition checks if 'myNumber' is less than zero.
  // Remember, if this condition IS FALSE, the block of code within the else block will run
  // Otherwise, the function will continue
  guard myNumber < 0 else {
    print("I am positive")
    return
  }
  
  print("I am negative!")
}

isMyNumberANegativeValue(myNumber: myNumber)

/*:
 - Experiment:
 Try creating your own guard statement with different conditional statements. Notice which boolean condition causes the code the enter the 'else' block or bypass it entirely.
 */
var testValue: String? = nil
func checkValue(value: String?) {
    guard value != nil else {
        print("Value is nil.")
        return
    }
    print("Value is not nil.")
}
checkValue(value: testValue)

/*:
 - Experiment:
 Create a function that takes in two number parameters and divide them. We don't like dividing by zero, so ensure this doesn't happen. Otherwise, return the calculated value.
 */
func divideNumber(number: Double, byNumber: Double) -> Double {
    guard byNumber != 0 else {
        return number
    }
    
    return number / byNumber
}

print(divideNumber(number: 10, byNumber: 0))

/*:
 Let's take a look at another example and see how we can use guard for optionals
 */

let myOptionalNumber: Int? = 10

// This function just checks if the given parameter is nil or not
func isMyNumberAnOptional(myOptionalNumber: Int?){
  
  // This guard checks if 'myOptionalNumber' has a value or not. Similar concept to conditional unwrapping
  // If 'myOptionalNumber' is indeed nil, the else block will run
  // Otherwise, our guard let statement is looking for a valid value, and the code will continue to run
  guard let myUnwrapped = myOptionalNumber else {
    
    print("This value is nil")
    return
  }
  
  // Lastly, you can see we can use the variable 'myUnwrapped' variable declared above within our entire scope of this function now
  // Very convenient!!
  // A regular 'if let' would not allow this
  print("This unwrapped value is \(myUnwrapped)")
}

isMyNumberAnOptional(myOptionalNumber: myOptionalNumber)

/*:
 - Experiment:
 Create a function that takes in an array of numbers. Have the function add all the numbers together and return the result. Make sure to `guard` against an empty array. Use `array.first` to check if there is at least one value in the array.
 */
func addArrayValues(array: [Int]) -> Int {
    guard array.first != nil else {
        return 0
    }
    
    var result: Int = 0
    
    for value in array {
        result += value
    }
    
    return result
}

let anotherArray = [Int]()
//let anotherArray = [3, 2, 5, 7, 1, 9]
print(addArrayValues(array: anotherArray))

/*:
 - Callout(Challenge):
 Now that we've learnt this new guard statement, let's rewrite the form validation challenge using the guard statements. How does it improve our current implementation?
 */


//: [Next](@next)
