//
//  Stack.swift
//  DataStructures
//
//  Created by Bibin Tom Joseph on 04/12/22.
//

import Foundation

class Stack<Value>: LinkedList<Value> {
    var top: Node? { first }

    @discardableResult func push(_ value: Value) -> Node { insert(value: value, at: 0) }

    @discardableResult func pop() -> Node? {
        guard first != nil else {
            assertionFailure("No more elements to pop")
            return nil
        }
        return remove(node: first!)
    }
}
