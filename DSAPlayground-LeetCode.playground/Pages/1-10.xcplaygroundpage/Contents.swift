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
    
}