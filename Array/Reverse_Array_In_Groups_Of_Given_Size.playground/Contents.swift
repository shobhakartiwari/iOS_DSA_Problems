//  Created by Dixit Akabari on 11.02.2025.

/*
 
MARK: - Problem: Reverse an Array in Groups of Given Size

Given an array and a group size `k`, reverse the elements in groups of `k`. If the remaining elements are less than `k`, reverse them as well.

Example Input: let arr1 = [1, 2, 3, 4, 5, 6, 7, 8, 9]
Expected Output: [3, 2, 1, 6, 5, 4, 9, 8, 7]

===================

MARK: - Solution Approaches:

Method 1: In-Place Reversal (Using `swapAt`)
    - This method modifies the original array in place by swapping elements to reverse each subarray of size `k`.
    - Most efficient in terms of both time and space complexity.

Method 2: Functional Approach (Using `reversed()` and `flatMap`)
    - This method creates a new array by reversing subarrays of size `k` using Swift's functional programming features.
    - This approach is clean but slightly less efficient as it creates a new array.
 
*/

import Foundation

// MARK: - Method 1: In-Place Reversal (Most Efficient)
func reverseSubarraysInPlace(arr: inout [Int], k: Int) {
    let n = arr.count
    var i = 0

    // Loop through the array in steps of size `k`
    while i < n {
        var left = i
        var right = min(i + k - 1, n - 1) // Ensure the right pointer doesn't exceed array bounds

        // Swap elements between the left and right pointers to reverse the subarray
        while left < right {
            arr.swapAt(left, right) // In-place swap
            left += 1
            right -= 1
        }

        i += k // Move to the next group of size `k`
    }
}

// Example usage for Method 1:
var arr1 = [1, 2, 3, 4, 5, 6, 7, 8, 9]
reverseSubarraysInPlace(arr: &arr1, k: 3)
print(arr1) // Output: [3, 2, 1, 6, 5, 4, 9, 8, 7]

var arr2 = [1, 2, 3, 4, 5, 6, 7, 8]
reverseSubarraysInPlace(arr: &arr2, k: 5)
print(arr2) // Output: [5, 4, 3, 2, 1, 8, 7, 6]


// MARK: - Method 2: Functional Approach (Using `reversed()` and `flatMap`)
func reverseSubarraysFunctional(arr: [Int], k: Int) -> [Int] {
    let n = arr.count
    var result: [Int] = []

    // Loop through the array in steps of size `k`
    for i in stride(from: 0, to: n, by: k) {
        // Extract the subarray of size `k` (or smaller if at the end of the array)
        let subarray = Array(arr[i..<min(i + k, n)])
        
        // Reverse the subarray and append it to the result
        result.append(contentsOf: subarray.reversed())
    }

    return result
}

// Example usage for Method 2:
var arr3 = [1, 2, 3, 4, 5, 6, 7, 8, 9]
let reversedArr21 = reverseSubarraysFunctional(arr: arr3, k: 3)
print(reversedArr21) // Output: [3, 2, 1, 6, 5, 4, 9, 8, 7]

var arr4 = [1, 2, 3, 4, 5, 6, 7, 8]
let reversedArr22 = reverseSubarraysFunctional(arr: arr4, k: 5)
print(reversedArr22) // Output: [5, 4, 3, 2, 1, 8, 7, 6]

