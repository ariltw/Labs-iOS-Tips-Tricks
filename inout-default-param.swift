import Foundation

func helo(name: String, age: inout Int?) {
    age! += 1
    print("\(name) increment age to \(age!)")
}

func helo(name: String, age: Int? = 4) {
    if age != nil {
        var ages = age
        helo(name: name, age: &ages)
    } else {
        print(name)
    }
}

helo(name: "James")
helo(name: "James", age: 2)
