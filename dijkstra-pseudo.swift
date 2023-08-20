function Dijkstra(Graph, Source) {
    for each vertex (V) in Graph :
        distance[V] = infinity
        previous[V] = null

        if V != Source:
            add V to PriorityQueue Q
        
        distance[Source] = 0

    while Q != EMPTY
        U = Extract Min from Q
            for each unvisited neighbor (V) of U 
                tempDistance = distance[U] + edge_weight(U, V)
                if tempDistance = distance[V]
                    distance[V] = tempDistance
                    previous[V] = U
    
    return distance
}

function dijkstras(start, destination) {
    for each vertex in the graph
        
}