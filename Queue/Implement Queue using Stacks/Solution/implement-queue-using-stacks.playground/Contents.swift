import Foundation

// https://leetcode.com/problems/implement-queue-using-stacks/

class MyQueue {
    
    fileprivate var array: [Int]
    
    /** Initialize your data structure here. */
    init() {
        self.array = [Int]()
    }
    
    /** Push element x to the back of queue. */
    func push(_ x: Int) {
        array.append(x)
    }
    
    /** Removes the element from in front of queue and returns that element. */
    func pop() -> Int {
        return array.removeFirst()
    }
    
    /** Get the front element. */
    func peek() -> Int {
        return array.first ?? 0
    }
    
    /** Returns whether the queue is empty. */
    func empty() -> Bool {
        return array.isEmpty
    }
}
