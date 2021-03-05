import networkx as nx

def mappingAndRelabeling(g):
    # Mapping
    g_nx=g.copy()
    l_nodes = g_nx.nodes ()
    taille=len(l_nodes)
    dict_graph = dict ()  # nodes in the key and themselves
    for i in l_nodes:
        dict_graph[i] = [i]
    index = 0
    for i in dict_graph:
        for j in dict_graph[i]:
            dict_graph[i] = index
            index = index + 1
            
    # Relabling: Construct a new graph with those mappings now
    mapping = dict_graph
    g_relabled = nx.relabel_nodes(g, mapping, copy=True)
    
    return g_relabled


