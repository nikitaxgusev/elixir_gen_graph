# Python3 program to implement greedy
# algorithm for graph coloring
from graphviz import Digraph
import sys
import random

def addEdge(adj, v, w):
    adj[v].append(w)

    # Note: the graph is undirected
    adj[w].append(v)
    return adj

# Assigns colors (starting from 0) to all
# vertices and prints the assignment of colors
def greedyColoring(adj, V, v_list, w_list):
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
        color_for_node = color_list[result[u]]
        g.attr('node', style='filled', color=color_for_node)
        g.node(str(u))

    for i in range(len(v_list)):
        suspend = ""
        arrow = "none"
        if (isSuspended == "1"):
            suspend = str(random.randint(0, 10))
        if (isOriented == "1"):
            arrow = "normal"
        g.edge(v_list[i], w_list[i], label = suspend, arrowhead = arrow)
    g.render(filename='g1.dot')

# Driver Code
if __name__ == '__main__':
    try:
        isOriented = sys.argv[1]
        isSuspended = sys.argv[2]
        n_vertex = sys.argv[3]
        v_list_arg = sys.argv[4]
        w_list_arg = sys.argv[5]
        colors = sys.argv[6]

        v_list_arg = list(v_list_arg.split(","))
        w_list_arg = list(w_list_arg.split(","))
        colors = colors.replace("'", "")
        colors = colors.replace(" ", "")
        color_list = colors.split(",")

        print(isOriented)
        print(isSuspended)
        print(n_vertex)
        print(v_list_arg)
        print(w_list_arg)
        print(color_list)
        print("----------------")

        n = int(n_vertex)
        g1 = [[] for i in range(n)]

        for i in range(n+1):
            g1 = addEdge(g1, int(v_list_arg[i]), int(w_list_arg[i]))

        greedyColoring(g1, n, v_list_arg, w_list_arg)
    except BaseException:
        print ("Wrong parameters. Check it")

