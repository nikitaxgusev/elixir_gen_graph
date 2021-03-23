alias Graphvix.Graph

isSuspended = System.get_env("ARG1")
isOriented = System.get_env("ARG2")
dotCount = System.get_env("ARG3")
relationsCount = System.get_env("ARG4")
IO.puts isSuspended
IO.puts isOriented
IO.puts dotCount
IO.puts relationsCount
IO.puts "----------------"

# https://onlineconvertfree.com/ru/complete/dot-png/
# ARG1=1 ARG2=1 ARG3=5 ARG4=2 mix run -r ./examples/basic.ex


graph = Graph.new

dot_list = []

# Parse arguments
{dotSteps, _} = Integer.parse(dotCount)
{cycleSteps, _} = Integer.parse(relationsCount)
{needSuspended, _} = Integer.parse(isSuspended)
{needOriented, _} = Integer.parse(isOriented)

# dots generation
dot_list = Enum.reduce(1..dotSteps, [], fn i, dot_list ->
  dot_name = "dot_#{i}"
  {_, new_dot} = Graph.add_vertex(graph, dot_name)
  dot_list ++ [new_dot]
end)

# init graph parameters anonymous functions
arrowhead_style = fn
    x when x == 1 -> "normal"
    x -> "none"
end

suspend_label = fn
    x when x == 1 -> :rand.uniform(10)
    x -> ""
end

# generation of relations
for _ <- 1..cycleSteps do
  first_dot = :rand.uniform(dotSteps)
  second_dot = :rand.uniform(dotSteps)

  {graph, _} = Graph.add_edge(graph, Enum.at(dot_list, first_dot - 1), Enum.at(dot_list, second_dot - 1), label: suspend_label.(needSuspended), arrowhead: arrowhead_style.(needOriented))
end

# Generate .dot file with graph
Graph.write(graph, "examples/generated_graph")
# Graph.compile(graph, "examples/generated_graph")