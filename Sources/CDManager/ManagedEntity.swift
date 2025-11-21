//
//  ManagedEntity.swift
//  BaseSwiftUI
//
//  Created by Abdallah Edres on 21/11/2025.
//

import CoreData
public protocol ManagedEntity: NSManagedObject {
    static var entityName: String { get }
}

public extension ManagedEntity {
    static var entityName: String { String(describing: Self.self) }
}
