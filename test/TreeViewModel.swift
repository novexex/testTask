//
//  TreeViewModel.swift
//  test
//
//  Created by Artour Ilyasov on 24.02.2023.
//

import Foundation

class TreeViewModel: ObservableObject {
    @Published var rootNode: Node
    
    init() {
        let rootNode = NodeEntity(context: CoreDataStack.shared.context)
//        {
//            self.rootNode = rootNode
//            print("dostal!!")
//        } else {
//            self.rootNode = Node()
//            print("nedostal")
//        }
            self.rootNode.parent = nil
    }
}
