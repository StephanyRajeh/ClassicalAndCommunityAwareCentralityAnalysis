import networkx as nx

"""
- The following library is concerned with coming up with different types of graphs from just 2 main inputs:
    1. Raw graph g
    2. Partition dictionary

- Partition dictionary must carry the following information (regardless of the community detection algorithm used):
    1. Key: Community number (numerated from 0 or 1 to N-1 or N number of communities)
    2. Value: List of nodes belonging to that community


- The motivation behind extracting different types of graphs from raw graph g is that we are able to take into 
consideration for each node its linkage within its community and outside its community and hence conduct several studies
on them:
    1. To get the global graph from raw graph g, we remove all intra community links from the original network and
        only consider inter links (links of nodes connecting to other communities)
    2. To get the local graph from raw graph g for a non-overlapping node, we only consider the links with the members
        of its community (we remove all inter links)

"""

"""-------------------------------------------Sub-aiding Functions-------------------------------------------------"""

""" Sub-aiding function 1 `isbelong(list1, list2)`
--> Takes in 2 lists and loops in them to check if a value in the first list exists in the second
Input: 
1. First list: list1
2. Second list: list2

Output:
1. 1 if the value in list 1 exists in list 2
2. otherwise
"""


def isbelong(list1, list2):
    x = 0
    for i in list1:
        for j in list2:
            if i == j:
                x = 1
    return x


""" Sub-aiding function 2: `isexist(x, list1)`
--> Takes in a value and a list and checks if that value exists in the given list
Inputs: 
1. Value: x
2. List: list1
Output:
1. 1 if the value in list 1 exists in list 2
2. 0 otherwise

"""


def isexist(x, list1):
    k = 0
    for i in list1:
        if x == i:
            k = 1
    return k


"""-------------------------------------------Graph Extractor Functions-----------------------------------------"""


""" Graph Extractor function 1: `intra_wo(dict_graph_wo, partition)`

Input:
1. dict_graph_wo = graph without overlapping nodes
2. Dictionary `partition` containing the key as the community number and the value as the nodes in that community (o+wo)


Output:
1. dict_g_intra_wo = Dictionary intra of non-overlapping nodes (with intra links only hence having same community)
2. graph_intra_wo = Graph intra without overlapping nodes

"""


def intra_wo(dict_graph_wo, partition):

    # Step 1: Construct a dictionary of nodes where key is node and value is the partition/community of that node
    # Mind that only graph without overlapping nodes are considered
    dict_node_partition_wo = dict()
    for i in dict_graph_wo:  # for each non-overlapping node
        dict_node_partition_wo[i] = [] # Initalize it with a key
        for j in partition:  # for each community j
            for k in partition[j]: # for each node k in community j
                if i == k: # If node i is in community j nodes (=k), add community number to the list of that node
                    dict_node_partition_wo[i].append(j)

    # Step 2: Construct dictionary `dict_graph_intra_wo`:
    # Key = Node number
    # Value = List of neighbors as value if they share the same community
    # NB: Knowing that only non-overlapping nodes are considered here
    d_copy = dict_graph_wo.copy()
    dict_g_intra_wo = dict()
    for i in d_copy:
        dict_g_intra_wo[i] = []
        for j in d_copy[i]:
            k = isbelong(dict_node_partition_wo[i], dict_node_partition_wo[j])  # Do they share any community? If so, append
            if k == 1:
                dict_g_intra_wo[i].append(j)

    # Step 3: Construct the intra graph `graph_intra_wo` with the aid of dictionary `dict_g_intra_wo`
    graph_intra_wo = nx.Graph()
    for i in dict_g_intra_wo:
        graph_intra_wo.add_node(i)

    for i in dict_g_intra_wo:
        for j in dict_g_intra_wo[i]:
            graph_intra_wo.add_edges_from([(i, j)])

    return dict_g_intra_wo, graph_intra_wo


""" Graph Extractor function 2: `intra_o(g, partition, lo)`

Input:
1. g = the raw graph
2. Dictionary `partition` containing the key as the community number and the value as the nodes in that community (o+wo)
3. lo = list of overlapping to be used to delete nodes of non-overlapping nature (added step)


Output:
1. dict_g_intra_o = Dictionary intra overlapping nodes (with intra links even if several communities)
2. graph_intra_o = Graph intra with overlapping nodes

NB: Has an extra step to be able to obtain only the overlapping nodes (Step 2)
# ------------------------------------------------------------------------------------------------------------

"""


def intra_o(g, partition, lo):

    # Step 1: Construct a dictionary of nodes where key is node and value is the partition/community of that node
    # Mind that graph with and without overlapping nodes are considered
    dict_node_partition = dict ()
    for i in g:  # for each node in the graph (overlapping or not)
        dict_node_partition[i] = []  # Initialize it with a key
        for j in partition:  # for each community j
            for k in partition[j]:  # for each node k in community j
                if i == k:  # If node i is in community j nodes (=k), add community number to the list of that node
                    dict_node_partition[i].append(j)

    # Step 2: Delete the nodes of non-overlapping nature (in case they occur since sometimes all nodes are overlapped)
    # Step 2.1: Find the communities of non-overlapping
    s = set()
    for i in lo:
        for j in dict_node_partition[i]:
            s.add(j)  # s will contain all overlapping communities since it only loops for i in lo

    s_sup = set()
    for i in partition:
        s_sup.add(i)  # s_sup will contain all communities

    for i in s:  # for each overlapping communities i
        s_sup.remove(i)  # Remove it from all partitions dictionary, to have s_sup = partitions of non-overlapping only

    # Step 2.2: Delete the nodes of the non-overlapping communities (in case we have)
    g_copy = g.copy()
    for i in s_sup:
        for j in partition[i]:
            g_copy.remove_node(j)

    # Step 3: Construct the overlapping intra graph dictionary
    dict_g_intra_o = dict()
    for i in g_copy: # For only nodes overlapping
        dict_g_intra_o[i] =[]
        for j in g[i]:
            k = isbelong(dict_node_partition[i], dict_node_partition[j])  # Do they share any community? If so, append
            if k == 1:
                dict_g_intra_o[i].append(j)

    # Step 4: Construct the overlapping intra graph
    graph_intra_o = nx.Graph()
    for i in dict_g_intra_o:
        graph_intra_o.add_node(i)

    for i in dict_g_intra_o:
        for j in dict_g_intra_o[i]:
            graph_intra_o.add_edges_from([(i, j)])

    return dict_g_intra_o, graph_intra_o

""" Graph Extractor function 3: `inter_wo_o(g, partition)`

Input:
1. g = the raw graph
2. Dictionary `partition` containing the key as the community number and the value as the nodes in that community (o+wo)


Output:
1. dict_g_inter = Dictionary inter overlapping and nonoverlapping nodes (with inter links only)
2. graph_inter = Graph inter with overlapping and non-overlapping nodes


NB: Slight difference between inter and intra is that the `isbelong()` function should return 0 not 1 to make sure 
    the 2 nodes, which are connected (are neighbors), share different communities (partitions) and hence are connected 
    by inter links.
    --> So, when k == 0, nodes who don't share the same community but are neighbors should be connected (inter links)

NB: For nodes who don't have interlinks, in the dictionary g_inter, 
    they will have an empty list as their value. 
    For example, for node '1':[], since the nodes it connects to that are 489 and 963 share all the same community #42
"""


def inter_wo_o(g, partition):

    # Step 1: Construct a dictionary of nodes where key is node and value is the partition/community of that node
    # Mind that graph with and without overlapping nodes are considered
    dict_node_partition = dict()
    for i in g:
        dict_node_partition[i] = []
        for j in partition:
            for k in partition[j]:
                if i == k:
                    dict_node_partition[i].append(j)

    # Step 2: Construct the dictionary of nodes as keys and their neighbors as values IF they are not in
    #         the same community but are neighbors (link to each other from different communities)
    dict_g_inter = dict()
    for i in g:
        dict_g_inter[i] = []
        for j in g[i]:
            k = isbelong(dict_node_partition[i], dict_node_partition[j])
            if k == 0:
                dict_g_inter[i].append(j)

    # Step 3: Construct the graph of inter_wo_o
    graph_inter = nx.Graph()
    for i in dict_g_inter:
        graph_inter.add_node(i)

    for i in dict_g_inter:
        for j in dict_g_inter[i]:
            graph_inter.add_edges_from([(i, j)])

    return dict_g_inter, graph_inter

