//  Created by Dixit Akabari on 10.02.2025.

/*
 
MARK: - Question : Second Largest Element in an Array

 Input : let numbersArr = [12, 38, 15, 10, 45, 18, 38, 6, 7, 9]
 Expected Output : 38

===================
 
MARK: - Answer Explanation:
 
 Method 1 (Sorting): The array is sorted in descending order, and the function returns the second unique element that is not equal to the largest.
 
 Method 2 (Set): The array is converted to a set to remove duplicates, sorted in descending order, and the second element is returned.

*/

import Foundation

// Input variable declaration
let numbersArr = [12, 38, 15, 10, 45, 18, 38, 6, 7, 9]

// MARK: - Method 1: Using Sorting
func findSecondLargestUsingSorting(in array: [Int]) -> Int? {
    guard array.count >= 2 else {
        return nil // Array too small
    }
    
    let sortedArray = array.sorted(by: >) // Sort in descending order
    
    // Find the first element that is not equal to the largest element
    for i in 1..<sortedArray.count {
        if sortedArray[i] != sortedArray[0] {
            return sortedArray[i]
        }
    }
    
    return nil // All elements are the same
}

// Usage of Method 1
if let secondLargestNumber = findSecondLargestUsingSorting(in: numbersArr) {
    print("Output (Using Sorting): \(secondLargestNumber)") // Output: 38
} else {
    print("Output (Using Sorting): No second largest element")
}


// MARK: - Method 2: Using Set and max()
func findSecondLargestUsingSet(in array: [Int]) -> Int? {
    guard array.count >= 2 else {
        return nil
    }
    
    let uniqueNumbers = Array(Set(array)).sorted(by: >) // Remove duplicates and sort
    
    guard uniqueNumbers.count >= 2 else {
        return nil // Either fewer than 2 unique elements or all elements were the same
    }
    
    return uniqueNumbers[1]
}

// Usage of Method 2
if let secondLargestNumber = findSecondLargestUsingSet(in: numbersArr) {
    print("Output (Using Set): \(secondLargestNumber)") // Output: 38
} else {
    print("Output (Using Set): No second largest element")
}
