import os
import random
#for j in range(0,20):
#type ="Playground"
import pickle
file=open('interpolate_budget_percentage_real.pkl', 'rb')
dict_interpolate=pickle.load(file)
nodes_len_dict= {"youtube":1079712,"orkut":3072441,"stack":2601977}


for dataset in ["stack","youtube"]:
	# print('Training on Multiple Graphs =====l====== ',i)
	#random_ind = 12#random.randint(0,9)
#    command = "sh ./supervisedPredict.sh ./graph_data/graph" + str(i) + "/graph" + str(i)
	for sampling_freq in [0.003]:#[0.003]:#[0.003,0.005,0.007,0.009,0.1]:#[0.003]:# [0.0005,0.001,0.003, 0.005,0.007,0.010,0.05,0.1]:

		for budget in [10,20,50,100,150,200]:#[150,200]:#[10, 20,50,100,150,200]:#[10,20,50]:#[20,50,100,150,200]:#[100,150,200]:#1 , 5, 10,15,20,25,50, 100, 150, 200]:
			file=open('interpolate_budget_percentage_real_budget{}.pkl'.format(budget), 'rb')
			dict_interpolate=pickle.load(file)#41652230
			#41652230
			bud_mul_fac = int(dict_interpolate(nodes_len_dict[dataset])+1)*1.1
			command = "sh ./supervisedPredict.sh  ./real_data/"+dataset+"/TV/test/large_graph "+ str(budget) +" " + str(sampling_freq) +" "+ str(bud_mul_fac)
		#	command = "sh ./supervisedPredict.sh  ./real_data/stack/TV/test/large_graph "+ str(budget) +" " + str(sampling_freq) +" "+ str(bud_mul_fac)
			#command = "sh ./supervisedPredict.sh ./real_data/large_gowallah/"+str(type)+"/_bp"
			print("command ", command)
			os.system(command)
pass
