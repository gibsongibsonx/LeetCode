import Foundation

// https://leetcode.com/problems/median-of-two-sorted-arrays/
// Given two sorted arrays nums1 and nums2 of size m and n respectively, return the median of the two sorted arrays.

class Solution {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        let n1 = nums1.count, n2 = nums2.count
        var arr = Array(repeating: 0, count: n1 + n2)
        
        var i = n1 - 1, t = n2 - 1, c = n1 + n2 - 1
        
        while c >= 0 {
            if t < 0 || i >= 0 && nums1[i] > nums2[t] {
                arr[c] = nums1[i];
                c = c - 1
                i = i - 1
            } else {
                arr[c] = nums2[t];
                c = c - 1
                t = t - 1
            }
        }
        let x = arr.count / 2
        guard arr.count % 2 == 0 else { return Double(arr[x]) }
        return Double(arr[x-1] + arr[x]) / 2
    }
}
