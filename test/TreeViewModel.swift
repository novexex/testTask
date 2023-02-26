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
        if let data = UserDefaults.standard.data(forKey: "treeData"),
           let rootNode = try? JSONDecoder().decode(Node.self, from: data) {
            self.rootNode = rootNode
            print("dostal!!")
        } else {
            self.rootNode = Node()
            print("nedostal")
        }
        
        self.rootNode.parent = nil
    }
    
    func save() {
        if let data = try? JSONEncoder().encode(rootNode) {
            UserDefaults.standard.set(data, forKey: "treeData")
            print("saved")
        }
    }
}
