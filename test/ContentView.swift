//
//  ContentView.swift
//  test
//
//  Created by Artour Ilyasov on 24.02.2023.
//

import SwiftUI
import Combine

struct NodeView: View {
    @ObservedObject var node: Node
    weak var tree: TreeViewModel?
    
    var body: some View {
        NavigationView {
            List(node.children) { child in
                NavigationLink(destination: NodeView(node: child, tree: tree)) {
                    Text(child.name)
                }
            }
            .navigationBarTitle(node.name)
            .navigationBarItems(trailing:
                HStack {
                    Button(action: {
                        self.node.children.append(Node(parent: self.node))
                        self.tree?.save()
                    }) {
                        Image(systemName: "plus")
                    }
                    
                    Button(action: {
                        self.node.children.removeAll()
                        self.tree?.save()
                    }) {
                        Image(systemName: "minus")
                    }
                }
            )
        }
    }
}
