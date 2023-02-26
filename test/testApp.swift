//
//  testApp.swift
//  test
//
//  Created by Artour Ilyasov on 24.02.2023.
//

import SwiftUI

@main
struct testApp: App {
    let tree = TreeViewModel()
    var body: some Scene {
        WindowGroup {
            NodeView(node: tree.rootNode, tree: tree)
        }
    }
}
