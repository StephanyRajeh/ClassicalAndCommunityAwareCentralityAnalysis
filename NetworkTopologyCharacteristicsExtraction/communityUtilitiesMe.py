"""
## Generalize function `get_community_graph_and_dict()` 
Inputs:
- dict_internal_communities_and_sizes: dict of nodes having information about a node inside its community (community number, size, neighbor node)
- communities_flipped: dict where key is the community number and value is a list of nodes in that community

Outputs:
1. graph_community_dict: dict of subgraphs for each community
2. graph_community_dict_dict: dict of dicts where the each community as key has a dict as value. The dict as value has key as nodes and vlaue as neighbors of nodes

"""

import networkx as nx

def get_community_graph(dict_internal_communities_and_sizes, communities_flipped):
    graph_community_dict = {}
    graph_community_dict_dict = {}
    
    # Initialize graph_community_dict and graph_community_dict_dict with community number as keys
    for i in communities_flipped:
        graph_community_dict[i]=0
        graph_community_dict_dict[i]=0
    
    # 1. Working on graph_community_dict
    for com in communities_flipped: # for each community com
        graph_community_1 = nx.Graph() # Create graph for community 1
        for i in communities_flipped[com]:# for each node in community com
            for j in dict_internal_communities_and_sizes: # for each node
                 if i == j: # working on node i which is the same as j
                        for k in dict_internal_communities_and_sizes[j]: # k contains the tuple of each node, we can now access it
                            # Get the neighbor only and connect it to i(or j), noting that k is just for accesssing
                            #edge = k[2]
                            start = i
                            end = k[2]
                            graph_community_1.add_edge(start, end)
        
        graph_community_dict[com] =  graph_community_1
        
        # 1.1. Working on graph_community_dict_dict
        # Get the dictionary of this graph where key is the node and value is the list of neighbors
        list_nodes = graph_community_1.nodes()
        dict_graph_community_1 = dict()  # nodes in the key and their neighbors of a community
        for i in list_nodes:
            dict_graph_community_1[i] = []
        for i in list_nodes:
            iteri = graph_community_1.neighbors(i)
            for j in iteri:
                dict_graph_community_1[i].append(j)
        
        graph_community_dict_dict[com] = dict_graph_community_1
    
    return graph_community_dict, graph_community_dict_dict