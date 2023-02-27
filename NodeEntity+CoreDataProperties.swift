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

    @NSManaged public var name: NSObject?
    @NSManaged public var parent: NodeEntity?
    @NSManaged public var child: NSSet?

}

// MARK: Generated accessors for child
extension NodeEntity {

    @objc(addChildObject:)
    @NSManaged public func addToChild(_ value: NodeEntity)

    @objc(removeChildObject:)
    @NSManaged public func removeFromChild(_ value: NodeEntity)

    @objc(addChild:)
    @NSManaged public func addToChild(_ values: NSSet)

    @objc(removeChild:)
    @NSManaged public func removeFromChild(_ values: NSSet)

}

extension NodeEntity : Identifiable {

}
