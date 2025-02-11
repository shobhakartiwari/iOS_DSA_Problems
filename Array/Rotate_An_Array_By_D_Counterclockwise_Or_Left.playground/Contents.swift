//  Created by Dixit Akabari on 11.02.2025.

/*
MARK: - Problem: Rotate an Array by d (Counterclockwise or Left)

Given an array and an integer `d`, rotate the array to the left by `d` positions.
If `d` is greater than the array size, it should wrap around. For negative `d`, no rotation is performed.

Example Input 1: let arr1 = [1, 2, 3, 4, 5, 6], d = 2
Expected Output: [3, 4, 5, 6, 1, 2]

Example Input 2: let arr2 = [1, 2, 3], d = 4
Expected Output: [2, 3, 1]

Example Input 3: let arr6 = [1, 2, 3], d = -1
Expected Output: [1, 2, 3] (No rotation for negative `d`)

===================

MARK: - Solution Approaches:

Method 1: Using Array Slicing and Concatenation (Simplest)
    - This method utilizes Swift's array slicing and concatenation to perform rotation in an easy-to-understand way.
    - Handles cases where `d > n` by performing modulo operation.

Method 2: In-Place Rotation (Using Reversal Algorithm)
    - This method rotates the array in place using the reversal algorithm, which is space-efficient (O(1) space).
    - The most efficient approach for space optimization.
*/

import Foundation

// MARK: - Method 1: Using Array Slicing and Concatenation (Simplest)
func rotateLeftUsingSlicing(arr: [Int], d: Int) -> [Int] {
    let n = arr.count
    let effectiveRotations = d % n // Handle cases where d > n

    // If rotations are negative or if the array is empty, return the original array
    guard effectiveRotations >= 0 else {
        print("Rotations cannot be negative")
        return arr
    }
    
    if n == 0 {
        return []
    }

    // Slice the array and concatenate the two parts, then convert the result to an array
    let rotatedArray = Array(arr[effectiveRotations..<n] + arr[0..<effectiveRotations])
    return rotatedArray
}

// Example usage for Method 1:
let arr1 = [1, 2, 3, 4, 5, 6]
let rotated1 = rotateLeftUsingSlicing(arr: arr1, d: 2)
print(rotated1) // Output: [3, 4, 5, 6, 1, 2]

let arr2 = [1, 2, 3]
let rotated2 = rotateLeftUsingSlicing(arr: arr2, d: 4)
print(rotated2) // Output: [2, 3, 1]

let arr6 = [1, 2, 3]
let rotated6 = rotateLeftUsingSlicing(arr: arr6, d: -1)
print(rotated6) // Output: [1, 2, 3] (No rotation for negative `d`)


// MARK: - Method 2: In-Place Rotation (Using Reversal Algorithm)
func rotateLeftInPlace(arr: inout [Int], d: Int) {
    let n = arr.count
    let effectiveRotations = d % n // Handle cases where `d > n`

    // If rotations are negative or if the array is empty, return without modification
    guard effectiveRotations >= 0 else {
        print("Rotations cannot be negative")
        return
    }
    
    if n == 0 {
        return
    }

    // Step 1: Reverse the first 'd' elements
    reverseArray(&arr, start: 0, end: effectiveRotations - 1)

    // Step 2: Reverse the remaining 'n - d' elements
    reverseArray(&arr, start: effectiveRotations, end: n - 1)

    // Step 3: Reverse the entire array to complete the rotation
    reverseArray(&arr, start: 0, end: n - 1)
}

// Helper function to reverse a portion of the array
private func reverseArray(_ arr: inout [Int], start: Int, end: Int) {
    var start = start
    var end = end
    while start < end {
        arr.swapAt(start, end)
        start += 1
        end -= 1
    }
}

// Example usage for Method 2:
var arr11 = [1, 2, 3, 4, 5, 6]
rotateLeftInPlace(arr: &arr11, d: 2)
print(arr11) // Output: [3, 4, 5, 6, 1, 2]

var arr12 = [1, 2, 3]
rotateLeftInPlace(arr: &arr12, d: 4)
print(arr12) // Output: [2, 3, 1]

var arr16 = [1, 2, 3]
rotateLeftInPlace(arr: &arr16, d: -1)
print(arr16) // Output: [1, 2, 3] (No rotation for negative `d`)
