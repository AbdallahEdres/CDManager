//
//  NSPredicate+Extension.swift
//  BaseSwiftUI
//
//  Created by Abdallah Edres on 21/11/2025.
//

import Foundation

public extension NSPredicate {
    
    // MARK: - ID Filters
    static func byUUID(_ id: UUID) -> NSPredicate {
        return NSPredicate(format: "id == %@", id as CVarArg)
    }
    
    static func byId(_ id: CVarArg) -> NSPredicate {
        return NSPredicate(format: "id == %@", id)
    }
    
    
    // MARK: - Basic `where`
    static func `where`(_ key: String, isEqual value: CVarArg) -> NSPredicate {
        return NSPredicate(format: "%K == %@", key, value)
    }
    
    static func `where`(_ key: String, notEqual value: CVarArg) -> NSPredicate {
        return NSPredicate(format: "%K != %@", key, value)
    }
    
    
    // MARK: - Comparison Operators
    static func `where`(_ key: String, greaterThan value: CVarArg) -> NSPredicate {
        return NSPredicate(format: "%K > %@", key, value)
    }
    
    static func `where`(_ key: String, greaterThanOrEqual value: CVarArg) -> NSPredicate {
        return NSPredicate(format: "%K >= %@", key, value)
    }
    
    static func `where`(_ key: String, lessThan value: CVarArg) -> NSPredicate {
        return NSPredicate(format: "%K < %@", key, value)
    }
    
    static func `where`(_ key: String, lessThanOrEqual value: CVarArg) -> NSPredicate {
        return NSPredicate(format: "%K <= %@", key, value)
    }
    
    
    // MARK: - String Filters
    static func contains(_ key: String, _ value: String, caseInsensitive: Bool = true) -> NSPredicate {
        let modifier = caseInsensitive ? "[c]" : ""
        return NSPredicate(format: "%K CONTAINS\(modifier) %@", key, value)
    }
    
    static func beginsWith(_ key: String, _ value: String, caseInsensitive: Bool = true) -> NSPredicate {
        let modifier = caseInsensitive ? "[c]" : ""
        return NSPredicate(format: "%K BEGINSWITH\(modifier) %@", key, value)
    }
    
    static func endsWith(_ key: String, _ value: String, caseInsensitive: Bool = true) -> NSPredicate {
        let modifier = caseInsensitive ? "[c]" : ""
        return NSPredicate(format: "%K ENDSWITH\(modifier) %@", key, value)
    }
    
    
    // MARK: - IN
    static func `in`(_ key: String, _ values: [CVarArg]) -> NSPredicate {
        return NSPredicate(format: "%K IN %@", key, values)
    }
    
    
    // MARK: - BETWEEN
    static func between(_ key: String, _ from: CVarArg, _ to: CVarArg) -> NSPredicate {
        return NSPredicate(format: "%K BETWEEN {%@, %@}", key, from, to)
    }
    
    
    // MARK: - Relationship ANY / ALL
    static func any(_ relation: String, satisfies predicate: NSPredicate) -> NSPredicate {
        return NSPredicate(format: "ANY %K %@", relation, predicate)
    }
    
    static func all(_ relation: String, satisfies predicate: NSPredicate) -> NSPredicate {
        return NSPredicate(format: "ALL %K %@", relation, predicate)
    }
    
    
    // MARK: - Compound Predicates
    static func and(_ predicates: NSPredicate...) -> NSPredicate {
        return NSCompoundPredicate(andPredicateWithSubpredicates: predicates)
    }
    
    static func or(_ predicates: NSPredicate...) -> NSPredicate {
        return NSCompoundPredicate(orPredicateWithSubpredicates: predicates)
    }
    
    static func not(_ predicate: NSPredicate) -> NSPredicate {
        return NSCompoundPredicate(notPredicateWithSubpredicate: predicate)
    }}
