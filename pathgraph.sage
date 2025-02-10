def pathpoly(n,l):  #Recursively calculates the face distribution of a path graph, returns the roots of the resulting polynomial. 
    dist = [0] * (n*l)
    G = SymmetricGroup(l*n*2)
    edges = '' #the single, fixed edge permutation
    for j in range(l):
        for i in range(n):
            edges = edges +'(' + str(i+1+j*2*n) + ',' + str(i+1+n+j*2*n) + ')'
    P = [n]
    H = SymmetricGroup(n)
    fullcyclesa = H.conjugacy_class(P)
    fullcyclesa = fullcyclesa.list()
    Q = [2*n]
    L = SymmetricGroup(2*n)
    fullcyclesb = L.conjugacy_class(Q)
    fullcyclesb = fullcyclesb.list()
    for a in fullcyclesa: #recursive thing
        recurvertexpoly(a, 1, edges, n, l, fullcyclesa, fullcyclesb, G, dist) 
    R.<t> = QQ[]
    poly = R(dist)
    show(poly)
    poly = poly - poly
    maxcoeff = numpy.max(numpy.nonzero(dist))
    eulers = [0] * (maxcoeff + 1)
    eulers[0] = 1
    for i in range(maxcoeff):
        i = i+1
        for k in range(i):
            eulers[i] = eulers[i] + binomial(i, k) * eulers[k] * (t-1)^(i - 1 - k)
    for i in range(maxcoeff):
        i = i+1
        poly = poly + dist[i] * (1-t)^(maxcoeff - i) * eulers[i]   
    poly = poly / factorial(int(maxcoeff))
    print(str(poly))
    show(poly.roots(CC))
    return

def recurvertexpoly(temp, j, edges, n, l, fullcyclesa, fullcyclesb, G, dist):
    if j < l:
        for k in fullcyclesb:
            temp2 = str(k)
            temp2 = tuple(temp2)
            temp3 = '('
            for i in range(2*n):
                temp3 = temp3 + str(int(temp2[2*i+1]) + n*(2*j-1))
                if i == 2*n-1:
                    temp3 = temp3 + ')'
                else:
                    temp3 = temp3 + ','
            temp3 = str(temp3)
            recurvertexpoly(str(temp) + temp3, j+1, edges, n, l, fullcyclesa, fullcyclesb, G, dist)      
    else: 
        k = fullcyclesa[1]
        finaltemp = temp
        temp2 = str(k)
        temp2 = tuple(temp2)
        temp3 = '('
        for i in range(n):
            temp3 = temp3 + str(int(temp2[2*i+1]) + n*(2*l-1))
            if i == n-1:
                temp3 = temp3 + ')'
            else:
                temp3 = temp3 + ','
        temp3 = str(temp3)
        finaltemp = str(temp) + temp3 
        finaltemp = G(finaltemp) * G(edges)
        finaltemp = finaltemp.cycle_tuples(singletons=True)
        finaltemp = str(finaltemp)
        numcycles = finaltemp.count('(')
        dist[numcycles] = dist[numcycles] + 1
    return
    