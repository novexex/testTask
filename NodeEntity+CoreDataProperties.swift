//
//  NodeEntity+CoreDataProperties.swift
//  test
//
//  Created by Artour Ilyasov on 27.02.2023.
//
//

import Foundation
import CoreData

extension NodeEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<NodeEntity> {
        return NSFetchRequest<NodeEntity>(entityName: "NodeEntity")
    }

    @NSManaged public var name: String?
    @NSManaged public var parent: NodeEntity?
    @NSManaged public var children: NSSet?

}

// MARK: Generated accessors for children
extension NodeEntity {

    @objc(addChildrenObject:)
    @NSManaged public func addToChildren(_ value: NodeEntity)

    @objc(removeChildrenObject:)
    @NSManaged public func removeFromChildren(_ value: NodeEntity)

    @objc(addChildren:)
    @NSManaged public func addToChildren(_ values: NSSet)

    @objc(removeChildren:)
    @NSManaged public func removeFromChildren(_ values: NSSet)

}

extension NodeEntity : Identifiable {

}
