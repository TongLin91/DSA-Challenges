//: Playground - noun: a place where people can play

//Problem 1 - 10
import UIKit

//1. Two Sum
//Given an array of integers, return indices of the two numbers such that they add up to a specific target.
func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    for i in 0..<nums.count-1{
        for j in i..<nums.count{
            if i != j && nums[i] + nums[j] == target{
                return [i, j]
            }
        }
    }
    return []
}


//2. Add Two Numbers
//You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    var advance = false
    var arr: [Int] = []
    guard var currentl1 = l1, var currentl2 = l2 else { return nil}
    
    var value = currentl1.val + currentl2.val
    if advance{
        value += 1
        advance = false
    }
    if value > 9{
        value = value % 10
        advance = true
    }
    arr.append(value)
    
    while currentl1.next != nil && currentl2.next != nil {
        currentl1 = currentl1.next!
        currentl2 = currentl2.next!
        
        var value = currentl1.val + currentl2.val
        if advance{
            value += 1
            advance = false
        }
        if value > 9{
            value = value % 10
            advance = true
        }
        arr.append(value)
        
    }
    
    while currentl1.next != nil {
        currentl1 = currentl1.next!
        if advance{
            var value = currentl1.val + 1
            
            if value > 9{
                value = value % 10
                advance = true
            }else{
                advance = false
            }
            arr.append(value)
        }else{
            arr.append(currentl1.val)
        }
    }
    
    while currentl2.next != nil {
        currentl2 = currentl2.next!
        if advance{
            var value = currentl2.val + 1
            
            if value > 9{
                value = value % 10
                advance = true
            }else{
                advance = false
            }
            arr.append(value)
        }else{
            arr.append(currentl2.val)
        }
    }
    
    if advance{
        arr.append(1)
        advance = false
    }
    
    var head = ListNode(arr.removeLast())
    for num in arr.reversed(){
        let newHead = ListNode(num)
        newHead.next = head
        head = newHead
    }
    return head
}


//3. Longest Substring Without Repeating Characters
//Given a string, find the length of the longest substring without repeating characters.
func lengthOfLongestSubstring(_ s: String) -> Int {
    guard s.characters.count > 1 else { return s.characters.count }
    let arr: [Character] = Array(s.characters)
    var longest = 0
    for index in 0..<arr.count-1{
        var dict: [Character: Int] = [:]
        for current in index..<arr.count{
            if dict[arr[current]] != nil{
                break
            }else{
                dict[arr[current]] = 1
            }
        }
        if dict.count > longest{
            longest = dict.count
            if longest == 95{
                return longest
            }
        }
    }
    return longest
}


//4. Median of Two Sorted Arrays
//There are two sorted arrays nums1 and nums2 of size m and n respectively. Find the median of the two sorted arrays. The overall run time complexity should be O(log (m+n)).
func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
    var mergedArr = [Int]()
    var nums1Pointer = 0
    var nums2Pointer = 0
    while nums1Pointer != nums1.count && nums2Pointer != nums2.count {
        if nums1[nums1Pointer] < nums2[nums2Pointer]{
            mergedArr.append(nums1[nums1Pointer])
            nums1Pointer += 1
        }else{
            mergedArr.append(nums2[nums2Pointer])
            nums2Pointer += 1
        }
    }
    while nums1Pointer != nums1.count {
        mergedArr.append(nums1[nums1Pointer])
        nums1Pointer += 1
    }
    
    while nums2Pointer != nums2.count {
        mergedArr.append(nums2[nums2Pointer])
        nums2Pointer += 1
    }
    
    switch mergedArr.count {
    case 0:
        return 0
    case 1:
        return Double(mergedArr[0])
    default:
        let medianIndex = (nums1.count + nums2.count) / 2
        
        if (nums1.count + nums2.count) % 2 == 0{
            return Double(mergedArr[medianIndex] + mergedArr[medianIndex-1]) / 2
        }
        return Double(mergedArr[medianIndex])
    }
}

findMedianSortedArrays([], [1])


