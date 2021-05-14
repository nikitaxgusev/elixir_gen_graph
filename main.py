# Python3 program to implement greedy
# algorithm for graph coloring
from graphviz import Digraph
import sys

def addEdge(adj, v, w):
    adj[v].append(w)

    # Note: the graph is undirected
    adj[w].append(v)
    return adj

# Assigns colors (starting from 0) to all
# vertices and prints the assignment of colors
def greedyColoring(adj, V, v_list, w_list, edges):
    result = [-1] * V

    # Assign the first color to first vertex
    result[0] = 0;

    # A temporary array to store the available colors.
    # True value of available[cr] would mean that the
    # color cr is assigned to one of its adjacent vertices
    available = [False] * V

    # Assign colors to remaining V-1 vertices
    for u in range(1, V):

        # Process all adjacent vertices and
        # flag their colors as unavailable
        for i in adj[u]:
            if (result[i] != -1):
                available[result[i]] = True

        # Find the first available color
        cr = 0
        while cr < V:
            if (available[cr] == False):
                break

            cr += 1

        # Assign the found color
        result[u] = cr

        # Reset the values back to false
        # for the next iteration
        for i in adj[u]:
            if (result[i] != -1):
                available[result[i]] = False

    color_for_node=""
    g = Digraph('G')
    # Pint the result
    for u in range(V):
        print("Vertex", u, " --->  Color", result[u])
        if (result[u] == 0):
            color_for_node = "red"
        if (result[u] == 1):
            color_for_node = "yellow"
        if (result[u] == 2):
            color_for_node = "purple"
        if (result[u] == 3):
            color_for_node = "blue"
        if (result[u] == 4):
            color_for_node = "gray"
        if (result[u] == 5):
            color_for_node = "green"
        g.attr('node', style='filled', color=color_for_node)
        g.node(str(u))
    g.edges(edges)
    g.render(filename='g1.dot')

# Driver Code
if __name__ == '__main__':
    print("Argument List:", str(sys.argv))
    n_vertex = sys.argv[1]
    v_list_arg = sys.argv[2]
    w_list_arg = sys.argv[3]
    edges = sys.argv[4]

    v_list_arg = list(v_list_arg)
    w_list_arg = list(w_list_arg)
    edges = edges.replace("'", "")
    edges = edges.replace(" ", "")
    edges = edges.split(",")

    print(n_vertex)
    print(v_list_arg)
    print(w_list_arg)
    print(edges)

    n = int(n_vertex)
    g1 = [[] for i in range(n)]

    for i in range(n+1):
        g1 = addEdge(g1, int(v_list_arg[i]), int(w_list_arg[i]))
    print("Coloring of graph 1 ")
    greedyColoring(g1, n, v_list_arg, w_list_arg, edges)

