import networkx as nx
import random
from functools import partial
import time
import json
import multiprocessing as mp
from networkx.readwrite import  json_graph

def fair_reward(sampled_G,activated_node, attributes, attr_value_id, group_size):
    I_attribute_value=[{},{},{},{},{}]
    for node in activated_node:
        for attr_idx, attribute in enumerate(attributes):
            if attr_value_id[attr_idx][sampled_G.node[node][attribute]] not in I_attribute_value[attr_idx].keys():
                I_attribute_value[attr_idx][attr_value_id[attr_idx][sampled_G.node[node][attribute]]] = 1
            else:
                I_attribute_value[attr_idx][attr_value_id[attr_idx][sampled_G.node[node][attribute]]] = I_attribute_value[attr_idx][attr_value_id[attr_idx][sampled_G.node[node][attribute]]]+1
    #print(I_attribute_value)
    Maximin_influence=[{},{},{},{},{}]
    for attr_idx, attribute in enumerate(attributes):
        for (key,value) in attr_value_id[attr_idx].items():
            if value in I_attribute_value[attr_idx].keys():
                Maximin_influence[attr_idx][key]=I_attribute_value[attr_idx][value]/group_size[attribute][value]
            else:
                Maximin_influence[attr_idx][key]=0
    #print(Maximin_influence)
    return min(Maximin_influence[0].values())

def calculate_spread(sampled_G, seed_nodes,new_node,attributes, attr_value_id, group_size,l):
    beg_time = time.time()
    if len(seed_nodes)==0:
        return 0
    for node in seed_nodes:
        sampled_G.add_edge(new_node,node,weight=1.0)

    total_nodes = len(nx.descendants(sampled_G,new_node))
    fairness = l*fair_reward(sampled_G,nx.descendants(sampled_G,new_node),attributes, attr_value_id, group_size)
    sampled_G.remove_node(new_node)
    end_time = time.time()
    print("spread time ", end_time- beg_time)
    return total_nodes + fairness


def evaluate(sampled_G, num_nodes, selected_nodes,attributes, attr_value_id, group_size,l):
#	num_nodes = main_graph.number_of_nodes()
    new_node_to_be_added = num_nodes + 1
    spread = calculate_spread(sampled_G, selected_nodes,new_node_to_be_added,attributes, attr_value_id, group_size,l)
    print(" graph spread ", spread)
    #del main_graph
    return spread
#
def mp_pool_format(mc_sim_graphs_dir, num_nodes , selected_nodes, mc_id, attributes, attr_value_id, group_size, l):
    print("selected_nodes", selected_nodes)
    sampled_graph_json_path = mc_sim_graphs_dir + str(mc_id) +"-G.json"
    print("sampled_graph_json_path ", sampled_graph_json_path )
    sampled_G_data = json.load(open(sampled_graph_json_path))
    sampled_G = json_graph.node_link_graph(sampled_G_data)
    num_nodes=999999999999

    print("loaded",num_nodes)
    spread = evaluate(sampled_G, num_nodes, selected_nodes,attributes, attr_value_id, group_size,l)
    print("SPREAD VAL", spread, sampled_graph_json_path)
    return spread


def evaluate_helper_mp(graph_dir, main_graph, selected_nodes, num_mc_sim):

    mc_sim_graphs_dir = graph_dir+'/mc_sim_graphs/'
    print(" mc_sim_graphs dir ", mc_sim_graphs_dir  )
    result_list = []
    mc_sim = [x for x in range(0, num_mc_sim)]
    print(mc_sim)
    pool = mp.Pool(processes=12)
    pool_args = partial(mp_pool_format,mc_sim_graphs_dir, main_graph, selected_nodes)
    print(pool_args)
    for iter, res in enumerate(pool.map(pool_args,mc_sim, chunksize=25
                                        )):
        print("iter, res", iter, res)
        result_list.append(res)
        avg_spread = round(sum(result_list) * 1.0 / len(result_list) * 1.0, 4)
        print("len result list", len(result_list))
        print("Avg_spread", avg_spread)
    print("final results")
    avg_spread = round(sum(result_list) * 1.0 / len(result_list) * 1.0, 4)
    print("len result list", len(result_list))
    print("Avg_spread", avg_spread)
    return avg_spread


def evaluate_helper_without_mp_fair(graph_dir, main_graph, selected_nodes, num_mc_sim,attributes, attr_value_id, group_size,l):

    mc_sim_graphs_dir = graph_dir+'/mc_sim_graphs/'
    print(" mc_sim_graphs dir ", mc_sim_graphs_dir  )
    result_list = []
    mc_sim = [x for x in range(0, num_mc_sim)]
    num_nodes = 999999999999
    for sim in mc_sim:
        res = mp_pool_format(mc_sim_graphs_dir, num_nodes, selected_nodes, sim,attributes, attr_value_id, group_size,l)
        result_list.append(res)
        avg_spread = round(sum(result_list) * 1.0 / len(result_list) * 1.0, 4)
        print("len result list", len(result_list))
        print("Avg_spread", avg_spread)
    # for iter, res in enumerate(pool.map(pool_args,mc_sim, chunksize=1)):
    # 	print("iter, res", iter, res)
    # 	result_list.append(res)
    # 	avg_spread = round(sum(result_list) * 1.0 / len(result_list) * 1.0, 4)
    # 	print("len result list", len(result_list))
    # 	print("Avg_spread", avg_spread)
    print("final results")
    avg_spread = round(sum(result_list) * 1.0 / len(result_list) * 1.0, 4)
    print("len result list", len(result_list))
    print("Avg_spread", avg_spread)
    return avg_spread
