//
//  Queue.swift
//  DataStructures
//
//  Created by Bibin Tom Joseph on 04/12/22.
//

import Foundation

class Queue<Value>: LinkedList<Value> {
    var peekNode: Node? { first }
    var peek: Value? { peekNode?.value }

    @discardableResult func enqueue(_ value: Value) -> Node { append(value: value) }

    @discardableResult func dequeue() -> Node? {
        guard first != nil else {
            assertionFailure("No elements to \(#function)")
            return nil
        }
        return remove(node: first!)
    }
}
