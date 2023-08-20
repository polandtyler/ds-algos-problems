import Foundation

protocol Graphable {
    associatedtype Element: Hashable
    var desciption: CustomStringConvertible { get }
    
    // create a new vertex (node)
    func createVertex(data: Element) -> Vertex<Element>
    
    // add an element
    func add(_ type: EdgeType, from source: Vertex<Element>, to destination: Vertex<Element>, weight: Double?)
    
    // get weight for edge
    func weight(from source: Vertex<Element>, to destination: Vertex<Element>) -> Double?
    
    // get all edges
    func edges(from source: Vertex<Element>) -> [Edge<Element>]?
}

//MARK: Breadth-first search
extension Graphable {
    public func breadthFirstSearch(from source: Vertex<Element>, to destination: Vertex<Element>) -> [Edge<Element>]? {
        var queue = Queue<Vertex<Element>>()
        queue.enqueue(source)
        var enqueuedVerts = Set<Vertex<Element>>()
        let visits: [Vertex<Element> : Visit<Element>] = [source: .source]
        
        while let visitedVertex = queue.dequeue() {
            if visitedVertex == destination {
                var vertex = destination
                var route: [Edge<Element>] = []
                
                while let visit = visits[vertex], case .edge(let edge) = visit {
                    route = [edge] + route
                    vertex = edge.source
                }
                return route
            }
            let neighbors = edges(from: visitedVertex) ?? []
            for edge in neighbors {
                if !enqueuedVerts.contains(edge.destination) {
                    enqueuedVerts.insert(visitedVertex)
                    queue.enqueue(edge.destination)
                }
            }
        }
        return nil
    }
}

//enum Visit<Element: Hashable> {
//    case source
//    case edge(Edge<Element>)
//}
