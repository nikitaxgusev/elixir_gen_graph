alias Graphvix.Graph

isSuspended = System.get_env("ARG1")
isOriented = System.get_env("ARG2")
dotCount = System.get_env("ARG3")
relations1 = System.get_env("ARG4")
relations2 = System.get_env("ARG5")
colors = System.get_env("ARG6")

IO.puts isSuspended
IO.puts isOriented
IO.puts dotCount
IO.puts relations1
IO.puts relations2
IO.puts colors
IO.puts "----------------"

graph = Graph.new

dot_list = []
color_list = [0]
available_list = []


try do

# Parse arguments
{dotSteps, _} = Integer.parse(dotCount)
{relations1List, _} = String.split(relations1, ",")
{relations2List, _} = String.split(relations2, ",")
{needSuspended, _} = Integer.parse(isSuspended)
{needOriented, _} = Integer.parse(isOriented)
listColors = String.split(colors, ",")


# init graph parameters anonymous functions
arrowhead_style = fn
    x when x == 1 -> "normal"
    x -> "none"
end

suspend_label = fn
    x when x == 1 -> :rand.uniform(10)
    x -> ""
end

map_edges = %{}
map_edges = Enum.reduce(1..dotSteps, fn i, test ->
  Map.put(test, i:, [])
end)

map_edges = Enum.reduce(1..dotSteps, [], fn i, map_edges ->
  list1 = map.%{relate1}
  list1 ++ relate2[i]
  list2 = map.%{relate2}
  list2 ++ relate1[i]

  Map.put(map_edges, relate1:, list1)
  Map.put(map_edges, relate2:, list2)
end)

# Assigns colors (starting from 0) to all
# vertices and prints the assignment of colors
# Assign the first color to first vertex
index_color = Enum.reduce(1..dotSteps, [], fn i, index_color ->
  if(i == 1, do: index_color ++ [0], else: index_color ++ [-1])
end)

# A temporary array to store the available colors.
# True value of available[cr] would mean that the
# color cr is assigned to one of its adjacent vertices
available = Enum.reduce(1..dotSteps, [], fn i, available ->
  available ++ [false]
end)


# Process all adjacent vertices and
# flag their colors as unavailable
index_color = Enum.reduce(1..dotSteps, [], fn i, index_color ->
  if (Enum.at(index_color, i) != -1, do: available ++ true, else available ++ Enum.at(available, i)

  # Find the first available color
  color_index = 0

  Enum.reduce_while(available[j] == true, [], fn i, index_color ->
    color_index = color_index + 1
  end)

  # Assign the found color
  index_color ++ color_index

  # Reset the values back to false
  # for the next iteration
  index_color = Enum.reduce(1..dotSteps, [], fn _k, index_color ->
    if(Enum.at(index_color, _k) != -1, do: available ++ false, else: available ++ Enum.at(available, _k))
  end)
end)

# dots generation
dot_list = Enum.reduce(1..dotSteps, [], fn i, dot_list ->
  dot_name = "dot_#{i}"
  {_, new_dot} = Graph.add_vertex(graph, dot_name, :color = Enum.at(listColors, Enum.at(index_color, i))
  dot_list ++ [new_dot]
end)

# generation of relations
for i <- 1..len(relat1) do
  {graph, _} = Graph.add_edge(graph, Enum.at(relat1, i), Enum.at(relat2, i), label: suspend_label.(needSuspended), arrowhead: arrowhead_style.(needOriented))
end

# Generate .dot file with graph
Graph.write(graph, "examples/g1")
Graph.compile(graph, "examples/g1.dot", :png)

rescue IO.puts "Wrong parameters. Check it"
end


