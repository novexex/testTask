//
//  TreeViewModel.swift
//  test
//
//  Created by Artour Ilyasov on 24.02.2023.
//

import Foundation

class TreeViewModel: ObservableObject {
    @Published var rootNode: Node

    func save() {
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let archiveURL = documentsDirectory.appendingPathComponent("tree_state.json")
        let jsonEncoder = JSONEncoder()
        guard let jsonData = try? jsonEncoder.encode(rootNode) else { return }
        do {
            try jsonData.write(to: archiveURL, options: .noFileProtection)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    init() {
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let archiveURL = documentsDirectory.appendingPathComponent("tree_state.json")
        guard let jsonData = try? Data(contentsOf: archiveURL) else {
            self.rootNode = Node()
            return
        }
        let jsonDecoder = JSONDecoder()
        
        if let node = try? jsonDecoder.decode(Node.self, from: jsonData) {
            self.rootNode = node
        } else {
            self.rootNode = Node()
        }
        
        self.rootNode.parent = nil
    }

}
