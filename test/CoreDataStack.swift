//
//  CoreDataStack.swift
//  test
//
//  Created by Artour Ilyasov on 27.02.2023.
//

import CoreData

class CoreDataStack {
    
    static let shared = CoreDataStack()
    
    private lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Tree")
        container.loadPersistentStores { _, error in
            if let error = error {
                fatalError("Unresolved error \(error.localizedDescription)")
            }
        }
        return container
    }()
    
    lazy var context: NSManagedObjectContext = {
        return persistentContainer.viewContext
    }()
    
    func save() {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                fatalError("Unresolved error \(error.localizedDescription)")
            }
        }
    }
    
//    private func getNodeFromManagedObject(managedObject: NSManagedObject) -> Node? {
//        guard let name = managedObject.value(forKey: "name") as? String,
//              let children = managedObject.value(forKey: "children") as? Set<NSManagedObject>,
//              let parent = managedObject.value(forKey: "parent") as? NSManagedObject else {
//            return nil
//        }
//        
//        let node = Node(name: name)
//        
//        for child in children {
//            if let childNode = getNodeFromManagedObject(managedObject: child) {
//                node.children.append(childNode)
//            }
//        }
//        
//        if let parentNode = getNodeFromManagedObject(managedObject: parent) {
//            node.parent = parentNode
//        }
//        
//        return node
//    }
    
//    func fetchRootNode() -> Node? {
//        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "Node")
//        fetchRequest.predicate = NSPredicate(format: "parent == nil")
//        do {
//            guard let rootNode = try context.fetch(fetchRequest).first as? NSManagedObject else { return Node() }
//            return getNodeFromManagedObject(managedObject: rootNode)
//        } catch {
//            print("Failed to fetch root node: \(error)")
//            return nil
//        }
//    }


}
