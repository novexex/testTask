//
//  TreeViewModel.swift
//  test
//
//  Created by Artour Ilyasov on 24.02.2023.
//

import Foundation
import CoreData

class TreeViewModel: ObservableObject {
    @Published var rootNode: NodeEntity
    
    init() {
        let fetchRequest = NodeEntity.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "parent == nil")
        let context = CoreDataStack.shared.context
        do {
            guard let node = try context.fetch(fetchRequest).first else { return }
            self.rootNode = node
        } catch {
            print(error.localizedDescription)
        }

        self.rootNode.parent = nil
    }
}
