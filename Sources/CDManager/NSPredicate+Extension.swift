//
//  NSPredicate+Extension.swift
//  BaseSwiftUI
//
//  Created by Abdallah Edres on 21/11/2025.
//

import Foundation

public extension NSPredicate {
    
    // MARK: - ID Filters
    public static func byUUID(_ id: UUID) -> NSPredicate {
        NSPredicate(format: "id == %@", id as CVarArg)
    }
    
    public static func byId(_ id: CVarArg) -> NSPredicate {
        NSPredicate(format: "id == %@", id)
    }
    
    
    // MARK: - Basic `where`
    public static func `where`(_ key: String, isEqual value: CVarArg) -> NSPredicate {
        NSPredicate(format: "%K == %@", key, value)
    }
    
    public static func `where`(_ key: String, notEqual value: CVarArg) -> NSPredicate {
        NSPredicate(format: "%K != %@", key, value)
    }
    
    
    // MARK: - Comparison Operators
    public static func `where`(_ key: String, greaterThan value: CVarArg) -> NSPredicate {
        NSPredicate(format: "%K > %@", key, value)
    }
    
    public static func `where`(_ key: String, greaterThanOrEqual value: CVarArg) -> NSPredicate {
        NSPredicate(format: "%K >= %@", key, value)
    }
    
    public static func `where`(_ key: String, lessThan value: CVarArg) -> NSPredicate {
        NSPredicate(format: "%K < %@", key, value)
    }
    
    public static func `where`(_ key: String, lessThanOrEqual value: CVarArg) -> NSPredicate {
        NSPredicate(format: "%K <= %@", key, value)
    }
    
    
    // MARK: - String Filters
    public static func contains(_ key: String, _ value: String, caseInsensitive: Bool = true) -> NSPredicate {
        let modifier = caseInsensitive ? "[c]" : ""
        return NSPredicate(format: "%K CONTAINS\(modifier) %@", key, value)
    }
    
    public static func beginsWith(_ key: String, _ value: String, caseInsensitive: Bool = true) -> NSPredicate {
        let modifier = caseInsensitive ? "[c]" : ""
        return NSPredicate(format: "%K BEGINSWITH\(modifier) %@", key, value)
    }
    
    public static func endsWith(_ key: String, _ value: String, caseInsensitive: Bool = true) -> NSPredicate {
        let modifier = caseInsensitive ? "[c]" : ""
        return NSPredicate(format: "%K ENDSWITH\(modifier) %@", key, value)
    }
    
    
    // MARK: - IN
    public static func `in`(_ key: String, _ values: [CVarArg]) -> NSPredicate {
        NSPredicate(format: "%K IN %@", key, values)
    }
    
    
    // MARK: - BETWEEN
    public static func between(_ key: String, _ from: CVarArg, _ to: CVarArg) -> NSPredicate {
        NSPredicate(format: "%K BETWEEN {%@, %@}", key, from, to)
    }
    
    
    // MARK: - Relationship ANY / ALL
    public static func any(_ relation: String, satisfies predicate: NSPredicate) -> NSPredicate {
        NSPredicate(format: "ANY %K %@", relation, predicate)
    }
    
    public static func all(_ relation: String, satisfies predicate: NSPredicate) -> NSPredicate {
        NSPredicate(format: "ALL %K %@", relation, predicate)
    }
    
    
    // MARK: - Compound Predicates
    public static func and(_ predicates: NSPredicate...) -> NSPredicate {
        NSCompoundPredicate(andPredicateWithSubpredicates: predicates)
    }
    
    public static func or(_ predicates: NSPredicate...) -> NSPredicate {
        NSCompoundPredicate(orPredicateWithSubpredicates: predicates)
    }
    
    public static func not(_ predicate: NSPredicate) -> NSPredicate {
        NSCompoundPredicate(notPredicateWithSubpredicate: predicate)
    }
}
