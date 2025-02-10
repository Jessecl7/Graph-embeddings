import random
import numpy

def knembed(n):  #Generates a random embedding of the complete graph K_n, then calculates its number of faces.
    import random
    numedges= n*(n-1)
    vertperm = ""
    for i in range(n):
        vertperm = vertperm + "("
        verttemp = []
        for j in range(n-1):
            verttemp.append(str(i*(n-1) + j+1))
        random.shuffle(verttemp)
        for j in range(n-2):
            vertperm = vertperm + verttemp[j] + ","
        vertperm = vertperm + verttemp[n-2] + ")"
    #print(vertperm)
    G = SymmetricGroup(numedges)
    edges = []
    for i in range(n):
        for j in range(n-i-1):
            edges.append("("+str(i+1)+","+str(j+i+2)+")")
    random.shuffle(edges)
    #show(edges)
    occur = [0] * (numedges)
    edgeperm = ""
    #show(edges)
    for i in range(numedges/2):
        temp = edges[i]
        temp = tuple(temp)
        nums = getnums(temp)
        temp1 = nums[0]
        temp2 = nums[1]
        occur[temp1-1] = occur[temp1-1]+1
        occur[temp2-1] = occur[temp2-1]+1
        temp1 = (temp1 -1)*(n-1) + occur[temp1-1]
        temp2 = (temp2-1)*(n-1) + occur[temp2-1] 
        edgeperm = edgeperm + "(" + str(temp1) + "," + str(temp2) + ")"
    #print(vertperm)
    #print(edgeperm)
    #print(edgeperm.count("("))
    faceperm = G(vertperm)*G(edgeperm)
    faceperm = faceperm.cycle_tuples(singletons=True)
    faceperm = str(faceperm)
    #print(faceperm)
    #print("")
    faces = faceperm.count("(")
    #show(faces)
    #show(H)
    #show(conncomp)
    return int(faces)

def getnums(edge):
    temp = ""
    temp2 = ""
    i=1
    while edge[i] != ",":
        temp = temp + edge[i]
        i = i+1
    i = i+1
    while edge[i] != ")":
        temp2 = temp2 + edge[i]
        i = i+1
    temp = int(temp)
    temp2 = int(temp2)
    return temp, temp2