local graph = require('sprites.graph')

graph = Graph()

graph.add_vertexs('A', 'B', 'C', 'D', 'E')

 graph.add_arch('A', 'B')
-- graph.add_arch('A', 'C')
-- graph.add_arch('A', 'D')
-- graph.add_arch('D', 'E')
-- graph.add_arch('A', 'G')
-- graph.add_arch('G', 'F')
-- graph.add_arch('H', 'G')
-- graph.add_arch('I', 'E')

return graph