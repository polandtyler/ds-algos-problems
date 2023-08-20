import Foundation

public struct Heap<Element> {
    var elements: [Element]
    let priorityFunction: (Element, Element) -> Bool
    
    public init(elements: [Element] = [], priorityFunction: @escaping (Element, Element) -> Bool) {
        self.elements = elements
        self.priorityFunction = priorityFunction
        buildHeap()
    }
    
    mutating func buildHeap() {
        // iterate through first half in reverse order
        // NOTE: every level of the heap has room for twice as many elements as the level above,
        // which means every level of the heap has one more element than every level above it combined
        // so.... the first half of the heap is actually every parent node in the heap.
        for index in (0..<count / 2).reversed() {
            // one by one, shift every parent node down into its children.... this will shift the high priority children toward the root
            shiftDown(elementAtIndex: index)
        }
    }
    
    //MARK: Priority queue vars/funcs
    var isEmpty : Bool {
        return elements.isEmpty
    }
    
    var count : Int {
        return elements.count
    }
    
    func peek() -> Element? {
        return elements.first
    }
    
    mutating func shiftUp(elementAtIndex index: Int) {
        // Get parent index
        let parent = parentIndex(of: index)
        // Guard against it either being root
        // and against shifting an element above a higher priority
        guard !isRoot(index), isHigherPriority(at: index, than: parent) else { return }
        // do the swap
        swapElement(at: index, with: parent)
        // shift up, in case the element is not yet in position
        shiftUp(elementAtIndex: parent)
        
        // NOTE: will call self until guard is reached (it's either the root, or parent is higher priority
    }
    
    mutating func dequeue() -> Element? {
        // make sure heap has a first element, return nil if not
        guard !isEmpty else { return nil }
        // if there is, move element to the last position in the heap
        swapElement(at: 0, with: count - 1)
        // remove the highest priority element from the last position in the heap, store it
        let element = elements.removeLast()
        // if the heap isnt empty, shift the current root element down the heap to its proper place
        if !isEmpty {
            shiftDown(elementAtIndex: 0)
        }
        // return the highest priority element
        return element
    }
    
    mutating func shiftDown(elementAtIndex index: Int) {
        // find out which index points to the element with the highest priority
        // NOTE: if the argument index is a leaf, then `highestPriorityIndex` function
        // will return the argument index
        let childIndex = highestPriorityIndex(for: index)
        // if the argument index is that index, then stop shifting
        if index == childIndex {
            return
        }
        // if not, then one of the child elements has a higher priority
        // so swap the elements and keep recursively shifting down
        swapElement(at: index, with: childIndex)
        shiftDown(elementAtIndex: childIndex)
    }
    
    //MARK: Heap Helpers
    func isRoot(_ index: Int) -> Bool {
        return index == 0
    }
    
    // Clever note:
    //  Notice how each level of the tree has twice as many nodes as the level above it.
    // Given the node at index i, its left child node can be found at index 2i + 1 and its right child node can be found at index 2i + 2.
    /*
     Heap:
                                  8
                                /    \
                               7      5
                             /  \    / \
                            6    3  2   1
                           /
                          4
     
     Array representation:
     [8, 7, 5, 6, 3, 2, 1, 4]
     
     Another note: due to the below formulas,
     all left children will have odd indices
     and all right children will have even indices.
     */
    func leftChildIndex(of index: Int) -> Int {
        return (2 * index) + 1
    }
    
    func rightChildIndex(of index: Int) -> Int {
        return (2 * index) + 2
    }
    
    func parentIndex(of index: Int) -> Int {
        return (index - 1) / 2
    }
    
    func isHigherPriority(at firstIndex: Int, than secondIndex: Int) -> Bool {
        return priorityFunction(elements[firstIndex], elements[secondIndex])
    }
    
    func highestPriorityIndex(of parentIndex: Int, and childIndex: Int) -> Int {
        // nil check && return parent immediately if higher priority index
        guard childIndex < count && isHigherPriority(at: childIndex, than: parentIndex) else { return parentIndex }
        // if not, return child
        return childIndex
    }
    
    func highestPriorityIndex(for parent: Int) -> Int {
        // 1. Get indexes of right and left children
        let parentLeftChildIndex = leftChildIndex(of: parent)
        let parentRightChildIndex = rightChildIndex(of: parent)

        // 2. Find highest priority index of parent or left child
        let highestOfParentAndLeft = highestPriorityIndex(of: parent, and: parentLeftChildIndex)
        
        // 3. Find the highest priority index between parent, left, and right
        let highestOfRightAndLeft = highestPriorityIndex(of: highestOfParentAndLeft, and: parentRightChildIndex)
        
        return highestOfRightAndLeft
        // condensed:
        // return highestPriorityIndex(of: highestPriorityIndex(of: parent, and: leftChildIndex(of: parent)), and: rightChildIndex(of: parent))
    }
    
    mutating func swapElement(at firstIndex: Int, with secondIndex: Int) {
        guard firstIndex != secondIndex else { return }
        // Overlapping accesses to 'self.elements', but modification requires exclusive access, use `MutableCollection.swapAt(...)`
        // swap(&elements[firstIndex], &elements[secondIndex])
        elements.swapAt(firstIndex, secondIndex)
    }
}
