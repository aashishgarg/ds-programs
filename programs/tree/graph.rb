# Graph - A graph is a pair (V,E), where V is set of nodes called vertices and E is the collection of pairs of
#         vertices called Edges.
# A graph with no cycles is called a tree. A tree is an acyclic connected graph.
# The Degree of a vertex is the number of edges incident on it.
# A graph is connected if there is a path from every vertex to every other vertex.
# If a graph is not connected then it consists of a set of connected components.
# A forest is a disjoint set of trees.
# A spanning tree of a connected graph is a subgraph that contains all of that graph’s vertices and is a single
#                 tree. A spanning forest of a graph is the union of spanning trees of its connected components.
# Graphs with relatively few edges (generally if it edges < |V| log |V|) are called sparse graphs.
# Directed weighted graphs are sometimes called network.
class Graph
  attr_accessor :adj_matrix, :vertex_count

  def initialize(vertex_count)
    @vertex_count = vertex_count
    @adj_matrix = Array.new(vertex_count) { Array.new(vertex_count, false) }
  end

  def add_edge(i, j)
    if (i >=0) && (i<vertex_count) && (j>0) && (j<vertex_count)
      @adj_matrix[i][j] = true
      @adj_matrix[j][i] = true
    end
  end

  def remove_edge(i, j)
    if (i >=0) && (i<vertex_count) && (j>0) && (j<vertex_count)
      @adj_matrix[i][j] = false
      @adj_matrix[j][i] = false
    end
  end

  def is_edge?(i, j)
    if (i >=0) && (i<vertex_count) && (j>0) && (j<vertex_count)
      @adj_matrix[i][j]
    else
      false
    end
  end
end