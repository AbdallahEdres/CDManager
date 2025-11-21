//
//  CoreDataRepository.swift
//  BaseSwiftUI
//
//  Created by Abdallah Edres on 21/11/2025.
//

import CoreData
final class CDDataSource<T: ManagedEntity> {

    private let context: NSManagedObjectContext
    
    public init(context: NSManagedObjectContext) {
        self.context = context
    }
    // MARK: - Create
    public func create(_ configure: (T) -> Void) throws -> T {
        let object = T(context: context)
        configure(object)
        try self.save()
        return object
    }

    // MARK: - Edit
    public func edit(_ object: T, _ configure: (T) -> Void) throws {
        configure(object)
        try self.save()
    }

    // MARK: - Delete
    public func delete(_ object: T)  throws{
        context.delete(object)
        try self.save()
    }

    // MARK: - Get All
    public func getAll(sort: [NSSortDescriptor] = []) throws -> [T]  {
        let request = NSFetchRequest<T>(entityName: T.entityName)
        request.sortDescriptors = sort

        return (try context.fetch(request))
    }

    // MARK: - Get By ID
    public func get(by id: UUID) throws -> T? {
        let request = NSFetchRequest<T>(entityName: T.entityName)
        request.predicate = NSPredicate(format: "id == %@", id as CVarArg)
        request.fetchLimit = 1

        return try context.fetch(request).first
    }

    // MARK: - Filter (Dynamic)
    public func filter(_ predicate: NSPredicate,
                sort: [NSSortDescriptor] = []) throws -> [T] {

        let request = NSFetchRequest<T>(entityName: T.entityName)
        request.predicate = predicate
        request.sortDescriptors = sort

        return (try context.fetch(request))
    }
    
    private public func save() throws{
        if context.hasChanges{
            try context.save()
        }
    }
}
