//
//  Node.swift
//  test
//
//  Created by Artour Ilyasov on 24.02.2023.
//

import Foundation

class Node: Codable, Identifiable, ObservableObject, Hashable {
    static func == (lhs: Node, rhs: Node) -> Bool {
        lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    @Published var name: String
    @Published var children: [Node]
    weak var parent: Node?

    init(name: String = "", children: [Node] = [], parent: Node? = nil) {
        self.name = name
        self.children = children
        self.parent = parent

        var hash = self.hashValue
        let hashData = Data(bytes: &hash, count: MemoryLayout.size(ofValue: hash))
        self.name = hashData.base64EncodedString()
    }

    enum CodingKeys: String, CodingKey {
        case name
        case children
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.children = try container.decode([Node].self, forKey: .children)
        self.parent = nil
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(children, forKey: .children)
    }
}

