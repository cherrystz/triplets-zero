//
//  main.swift
//  tripletsZero
//
//  Created by pharuthapol on 18/6/2567 BE.
//

import Foundation

let input = readLine()
let trimmedInput = input?.trimmingCharacters(in: .init(charactersIn: "[]"))
let mapInput = trimmedInput?.components(separatedBy: ",")
let array = mapInput?.compactMap { Int($0.trimmingCharacters(in: .whitespaces)) }

public func findTriplets(_ nums: [Int]?) -> [[Int]] {
    guard let nums = nums,
          nums.count >= 3 else { return [] }
    
    var result: [[Int]] = []
    let sortedNums = nums.sorted()
    
    for i in 0..<sortedNums.count - 2 {
        if i > 0 && sortedNums[i] == sortedNums[i - 1] {
            continue
        }
        
        var left = i + 1
        var right = sortedNums.count - 1
        
        while left < right {
            let sum = sortedNums[i] + sortedNums[left] + sortedNums[right]
            
            if sum == 0 {
                result.append([sortedNums[i], sortedNums[left], sortedNums[right]])
                
                repeat { left += 1 } while left < right && sortedNums[left] == sortedNums[left - 1]
                repeat { right -= 1 } while left < right && sortedNums[right] == sortedNums[right + 1]
            } else if sum < 0 {
                left += 1
            } else {
                right -= 1
            }
        }
    }
    
    return result
}

print(findTriplets(array))
