import Foundation
import XCPlayground

print("DIJKSTRAS SHORTEST PATH")
// TREASURE HUNT THROUGH A SET OF ROOMS EXAMPLE
// 1. Go to shortest path (entrance)
// 2. evaluate if its the thing youre looking for
// 3. If not, determine all the neighbors connected to that room, and prioritise them by their distance from the entrance (add them to priority queue)
// 4. Go to next nearest room -- (highest priority as measured by distance from entrance)
// 5. Explore next nearest room
// 6. Maybe you find an alternative route that is shorter than the current route, so update the priority to explore that room sooner (if the alternative route was longer, you would keep current
// 7. Keep exploring until the treasure room becomes the highest priority room (via the shortest route possible from the entrance), or until you run out of rooms -- which would mean there is no treasure to be found






print("ADJACENCY LISTS")
let adjacencyList = AdjacencyList<String>()

let singapore = adjacencyList.createVertex(data: "Singapore")
let tokyo = adjacencyList.createVertex(data: "Tokyo")
let hongKong = adjacencyList.createVertex(data: "Hong Kong")
let detroit = adjacencyList.createVertex(data: "Detroit")
let sanFrancisco = adjacencyList.createVertex(data: "San Francisco")
let washingtonDC = adjacencyList.createVertex(data: "Washington DC")
let austinTexas = adjacencyList.createVertex(data: "Austin")
let seattle = adjacencyList.createVertex(data: "Seattle")

adjacencyList.add(.undirected, from: singapore, to: hongKong, weight: 300)
adjacencyList.add(.undirected, from: singapore, to: tokyo, weight: 500)
adjacencyList.add(.undirected, from: hongKong, to: tokyo, weight: 250)
adjacencyList.add(.undirected, from: tokyo, to: detroit, weight: 450)
adjacencyList.add(.undirected, from: tokyo, to: washingtonDC, weight: 300)
adjacencyList.add(.undirected, from: hongKong, to: sanFrancisco, weight: 600)
adjacencyList.add(.undirected, from: detroit, to: austinTexas, weight: 50)
adjacencyList.add(.undirected, from: austinTexas, to: washingtonDC, weight: 292)
adjacencyList.add(.undirected, from: sanFrancisco, to: washingtonDC, weight: 337)
adjacencyList.add(.undirected, from: washingtonDC, to: seattle, weight: 277)
adjacencyList.add(.undirected, from: sanFrancisco, to: seattle, weight: 218)
adjacencyList.add(.undirected, from: austinTexas, to: sanFrancisco, weight: 297)

print("All Flights:")
print("--------------------------------")
print(adjacencyList.desciption)
print("The cost for a flight from Singapore to Tokyo is $\(adjacencyList.weight(from: singapore, to: tokyo) ?? 0) \n")
if let flightsFromSanFrancisco = adjacencyList.edges(from: sanFrancisco) {
  print("All San Francisco Out Going Flights:")
  print("--------------------------------")
  for edge in flightsFromSanFrancisco {
    print("from: \(edge.source) to: \(edge.destination)")
  }
}

/*
 BREADTH-FIRST
 */
let dungeon = AdjacencyList<String>()

let entranceRoom = dungeon.createVertex(data: "Entrance")
let spiderRoom = dungeon.createVertex(data: "Spider")
let goblinRoom = dungeon.createVertex(data: "Goblin")
let ratRoom = dungeon.createVertex(data: "Rat")
let knightRoom = dungeon.createVertex(data: "Knight")
let batRoom = dungeon.createVertex(data: "Bat")
let orcRoom = dungeon.createVertex(data: "Orc")
let keyRoom = dungeon.createVertex(data: "Key")
let treasureRoom = dungeon.createVertex(data: "Treasure")

dungeon.add(.undirected, from: entranceRoom, to: spiderRoom, weight: 1)
dungeon.add(.undirected, from: entranceRoom, to: ratRoom, weight: 1)
dungeon.add(.undirected, from: entranceRoom, to: batRoom, weight: 1)
dungeon.add(.undirected, from: spiderRoom, to: goblinRoom, weight: 1)
dungeon.add(.undirected, from: spiderRoom, to: orcRoom, weight: 1)
dungeon.add(.undirected, from: ratRoom, to: treasureRoom, weight: 1)
dungeon.add(.undirected, from: ratRoom, to: keyRoom, weight: 1)
dungeon.add(.undirected, from: batRoom, to: knightRoom, weight: 1)

print("\nBREADTH-FIRST SEARCH")
print("All paths:")
print("--------------------------------")
print(dungeon.desciption)
print("Shortest Path: Breadth-first")
print("--------------------------------")
// Since this searches neighbors first,
// you know that any route you find will be the shortest path (least moves) possible
// --- but this assumes the distance (or difficulty?) of any two neighbors is the same.
// .... so what if its not?
if let edges = dungeon.breadthFirstSearch(from: entranceRoom, to: treasureRoom) {
  for edge in edges {
    print("\(edge.source) -> \(edge.destination)")
  }
}

print("\nHEAP")
var heap = Heap(elements: [3, 2, 8, 5, 0], priorityFunction: >)






