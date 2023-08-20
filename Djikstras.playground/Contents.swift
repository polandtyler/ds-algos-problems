import UIKit

class GraphNode {
    var visited: Bool = false
    var connection: [Connection] = []
}

class Connection {
    public let to: GraphNode
    public let weight: Int
    
    init(to node: GraphNode, weight: Int) {
        assert(weight >= 0, "Weight has to be equal or greater than 0.")
        self.to = node
        self.weight = weight
    }
}

class Path {
    public let cumulativeWeight: Int
    public let node: GraphNode
    public let previousPath: Path?
    
    init(to node: GraphNode, via connection: Connection? = nil, previousPath path: Path? = nil) {
        if let previousPath = path, let viaConnection = connection {
            self.cumulativeWeight = viaConnection.weight + previousPath.cumulativeWeight
        } else {
            self.cumulativeWeight = 0
        }
        
        self.node = node
        self.previousPath = path
    }
}
