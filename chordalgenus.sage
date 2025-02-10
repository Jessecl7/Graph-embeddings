def orchordal(n):
    G = SymmetricGroup(6*n)
    #Generate all binary strings of length 2n
    W = Words(alphabet=[0,1], length=2*n)
    cyclecount = [0]*(2*n)
    #Make edge scheme
    edgesystem = ""
    for i in range(2*n-1):
        edgesystem = edgesystem + "(" + str(3*i+3) + "," + str(3*i+4) + ")"
    edgesystem = edgesystem + "(" + str(1) + "," + str(6*n) + ")"
    for i in range(n):
        edgesystem = edgesystem + "(" + str(3*i+2) + "," + str(3*i+2+3*n) + ")"
    edgesystem = G(edgesystem)
    #Use these to pick all rotation systems
    for w in W:
        rotsystem = ""
        numcycles = 0
        for i in range(2*n):
            if w[i]==0:
                rotsystem = rotsystem + "(" + str(3*i+1) + "," + str(3*i+2) + ","  + str(3*i+3) + ")"
            else:
                rotsystem = rotsystem + "(" + str(3*i+1) + "," + str(3*i+3) + ","  + str(3*i+2) + ")"
        rotsystem = G(rotsystem)
        facesystem = rotsystem * edgesystem
        facesystem = str(facesystem.cycle_string(singletons=True))
        cyclecount[facesystem.count("(")] += 1
        #print(facesystem)
    print(cyclecount)
    total = 0
    for j in range(2*n):
        total += j * cyclecount[j]
    total = total/(4^n)
    #Product these and count cycles
    print(total)
    return total
    #Output average

def nonorchordal(n):
    G = SymmetricGroup(12*n)
    #Generate all binary strings of length 2n
    binrot = Words(alphabet=[0,1], length=2*n)
    binedge = Words(alphabet=[0,1], length=n+1)
    cyclecount = [0]*(2*n)
    #pick all edge schemes
    for v in binedge:
        edgesystem = ""
        for i in range(2*n-1):
            #if v[i] == 0:
            edgesystem = edgesystem + "(" + str(6*i+1) + "," + str(6*i+10) + ")"
            edgesystem = edgesystem + "(" + str(6*i+6) + "," + str(6*i+11) + ")"
            #else:
                #edgesystem = edgesystem + "(" + str(6*i+1) + "," + str(6*i+11) + ")"
                #edgesystem = edgesystem + "(" + str(6*i+6) + "," + str(6*i+10) + ")"
        if v[n] == 0:
            edgesystem = edgesystem + "(" + str(4) + "," + str(12*n) + ")"
            edgesystem = edgesystem + "(" + str(5) + "," + str(12*n-5) + ")"
        else:
            edgesystem = edgesystem + "(" + str(5) + "," + str(12*n) + ")"
            edgesystem = edgesystem + "(" + str(4) + "," + str(12*n-5) + ")"
        for i in range(n):           
            if v[i] == 0:
                edgesystem = edgesystem + "(" + str(6*i+2) + "," + str(6*i+2+6*n) + ")"
                edgesystem = edgesystem + "(" + str(6*i+3) + "," + str(6*i+3+6*n) + ")"
            else:
                edgesystem = edgesystem + "(" + str(6*i+3) + "," + str(6*i+2+6*n) + ")"
                edgesystem = edgesystem + "(" + str(6*i+2) + "," + str(6*i+3+6*n) + ")"
        edgesystem = G(edgesystem)
        #Use these to pick all rotation systems
        for w in binrot:
            rotsystem = ""
            numcycles = 0
            for i in range(2*n):
                if w[i]==0:
                    rotsystem = rotsystem + "(" + str(6*i+1) + "," + str(6*i+2) + ")"
                    rotsystem = rotsystem + "(" + str(6*i+3) + "," + str(6*i+4) + ")"
                    rotsystem = rotsystem + "(" + str(6*i+5) + "," + str(6*i+6) + ")"
                else:
                    rotsystem = rotsystem + "(" + str(6*i+1) + "," + str(6*i+4) + ")"
                    rotsystem = rotsystem + "(" + str(6*i+2) + "," + str(6*i+5) + ")"
                    rotsystem = rotsystem + "(" + str(6*i+3) + "," + str(6*i+6) + ")"
            rotsystem = G(rotsystem)
            facesystem = rotsystem * edgesystem
            facesystem = str(facesystem.cycle_string(singletons=True))
            cyclecount[facesystem.count("(")/2] += 1
            #print(facesystem)
    print(cyclecount)
    total = 0
    for j in range(2*n):
        total += j * cyclecount[j]
    total = total/(2^(3*n+1))
    #Product these and count cycles
    print(total)
    return total
    #Output average
    
def orladder(n):
    G = SymmetricGroup(6*n)
    #Generate all binary strings of length 2n
    W = Words(alphabet=[0,1], length=2*n)
    cyclecount = [0]*(2*n)
    #Make edge scheme
    edgesystem = ""
    for i in range(2*n-1):
        edgesystem = edgesystem + "(" + str(3*i+3) + "," + str(3*i+4) + ")"
    edgesystem = edgesystem + "(" + str(1) + "," + str(6*n) + ")"
    for i in range(n):
        edgesystem = edgesystem + "(" + str(3*i+2) + "," + str(6*n+1-(3*i+2)) + ")"
    edgesystem = G(edgesystem)
    #Use these to pick all rotation systems
    for w in W:
        rotsystem = ""
        numcycles = 0
        for i in range(2*n):
            if w[i]==0:
                rotsystem = rotsystem + "(" + str(3*i+1) + "," + str(3*i+2) + ","  + str(3*i+3) + ")"
            else:
                rotsystem = rotsystem + "(" + str(3*i+1) + "," + str(3*i+3) + ","  + str(3*i+2) + ")"
        rotsystem = G(rotsystem)
        facesystem = rotsystem * edgesystem
        facesystem = str(facesystem.cycle_string(singletons=True))
        cyclecount[facesystem.count("(")] += 1
        #print(facesystem)
    print(cyclecount)
    total = 0
    for j in range(2*n):
        total += j * cyclecount[j]
    total = total/(4^n)
    #Product these and count cycles
    print(total)
    return total
    #Output average

def nonorladder(n):
    G = SymmetricGroup(12*n)
    #Generate all binary strings of length 2n
    binrot = Words(alphabet=[0,1], length=2*n)
    binedge = Words(alphabet=[0,1], length=n+1)
    cyclecount = [0]*(2*n)
    #pick all edge schemes
    for v in binedge:
        edgesystem = ""
        for i in range(2*n-1):
            #if v[i] == 0:
            edgesystem = edgesystem + "(" + str(6*i+1) + "," + str(6*i+10) + ")"
            edgesystem = edgesystem + "(" + str(6*i+6) + "," + str(6*i+11) + ")"
            #else:
                #edgesystem = edgesystem + "(" + str(6*i+1) + "," + str(6*i+11) + ")"
                #edgesystem = edgesystem + "(" + str(6*i+6) + "," + str(6*i+10) + ")"
        if v[n] == 0:
            edgesystem = edgesystem + "(" + str(4) + "," + str(12*n) + ")"
            edgesystem = edgesystem + "(" + str(5) + "," + str(12*n-5) + ")"
        else:
            edgesystem = edgesystem + "(" + str(5) + "," + str(12*n) + ")"
            edgesystem = edgesystem + "(" + str(4) + "," + str(12*n-5) + ")"
        for i in range(n):           
            if v[i] == 0:
                edgesystem = edgesystem + "(" + str(6*i+2) + "," + str(12*n-1-(6*i+2)) + ")"
                edgesystem = edgesystem + "(" + str(6*i+3) + "," + str(12*n-1-(6*i+3)) + ")"
            else:
                edgesystem = edgesystem + "(" + str(6*i+3) + "," + str(12*n-1-(6*i+2)) + ")"
                edgesystem = edgesystem + "(" + str(6*i+2) + "," + str(12*n-1-(6*i+3)) + ")"
        edgesystem = G(edgesystem)
        #Use these to pick all rotation systems
        for w in binrot:
            rotsystem = ""
            numcycles = 0
            for i in range(2*n):
                if w[i]==0:
                    rotsystem = rotsystem + "(" + str(6*i+1) + "," + str(6*i+2) + ")"
                    rotsystem = rotsystem + "(" + str(6*i+3) + "," + str(6*i+4) + ")"
                    rotsystem = rotsystem + "(" + str(6*i+5) + "," + str(6*i+6) + ")"
                else:
                    rotsystem = rotsystem + "(" + str(6*i+1) + "," + str(6*i+4) + ")"
                    rotsystem = rotsystem + "(" + str(6*i+2) + "," + str(6*i+5) + ")"
                    rotsystem = rotsystem + "(" + str(6*i+3) + "," + str(6*i+6) + ")"
            rotsystem = G(rotsystem)
            facesystem = rotsystem * edgesystem
            facesystem = str(facesystem.cycle_string(singletons=True))
            cyclecount[facesystem.count("(")/2] += 1
            #print(facesystem)
    #print(cyclecount)
    print(cyclecount)
    total = 0
    for j in range(2*n):
        total += j * cyclecount[j]
    total = total/(2^(3*n+1))
    #Product these and count cycles
    print(total)
    return total

def orgirth():
    G = SymmetricGroup(36)
    #Generate all binary strings of length 2n
    W = Words(alphabet=[0,1], length=12)
    cyclecount = [0]*(12)
    #Make edge scheme
    edgesystem = ""
    #Big cycle edges
    for i in range(11):
        edgesystem = edgesystem + "(" + str(3*i+3) + "," + str(3*i+4) + ")"
    edgesystem = edgesystem + "(" + str(1) + "," + str(36) + ")"
    #chords
    edgesystem = edgesystem + "(" + str(2) + "," + str(8) + ")"
    edgesystem = edgesystem + "(" + str(11) + "," + str(17) + ")"
    edgesystem = edgesystem + "(" + str(20) + "," + str(26) + ")"
    edgesystem = edgesystem + "(" + str(29) + "," + str(35) + ")"
    edgesystem = edgesystem + "(" + str(5) + "," + str(23) + ")"
    edgesystem = edgesystem + "(" + str(14) + "," + str(32) + ")"
    edgesystem = G(edgesystem)
    #Use these to pick all rotation systems
    for w in W:
        rotsystem = ""
        numcycles = 0
        for i in range(12):
            if w[i]==0:
                rotsystem = rotsystem + "(" + str(3*i+1) + "," + str(3*i+2) + ","  + str(3*i+3) + ")"
            else:
                rotsystem = rotsystem + "(" + str(3*i+1) + "," + str(3*i+3) + ","  + str(3*i+2) + ")"
        rotsystem = G(rotsystem)
        facesystem = rotsystem * edgesystem
        facesystem = str(facesystem.cycle_string(singletons=True))
        cyclecount[facesystem.count("(")] += 1
        #print(facesystem)
    print(cyclecount)
    total = 0
    for j in range(12):
        total += j * cyclecount[j]
    total = total/(2^12)
    #Product these and count cycles
    return total
    #Output average

def nonorgirth():
    G = SymmetricGroup(12*6)
    #Generate all binary strings of length 2n
    binrot = Words(alphabet=[0,1], length=12)
    binedge = Words(alphabet=[0,1], length=7)
    cyclecount = [0]*(12)
    #pick all edge schemes
    for v in binedge:
        edgesystem = ""
        for i in range(11):
            #if v[i] == 0:
            edgesystem = edgesystem + "(" + str(6*i+1) + "," + str(6*i+10) + ")"
            edgesystem = edgesystem + "(" + str(6*i+6) + "," + str(6*i+11) + ")"
            #else:
                #edgesystem = edgesystem + "(" + str(6*i+1) + "," + str(6*i+11) + ")"
                #edgesystem = edgesystem + "(" + str(6*i+6) + "," + str(6*i+10) + ")"
        if v[6] == 0:
            edgesystem = edgesystem + "(" + str(4) + "," + str(12*6) + ")"
            edgesystem = edgesystem + "(" + str(5) + "," + str(12*6-5) + ")"
        else:
            edgesystem = edgesystem + "(" + str(5) + "," + str(12*6) + ")"
            edgesystem = edgesystem + "(" + str(4) + "," + str(12*6-5) + ")"
        if v[0] == 0:
            edgesystem = edgesystem + "(" + str(2) + "," + str(14) + ")"
            edgesystem = edgesystem + "(" + str(3) + "," + str(15) + ")"
        else:
            edgesystem = edgesystem + "(" + str(3) + "," + str(14) + ")"
            edgesystem = edgesystem + "(" + str(2) + "," + str(15) + ")"
        if v[1] == 0:
            edgesystem = edgesystem + "(" + str(20) + "," + str(32) + ")"
            edgesystem = edgesystem + "(" + str(21) + "," + str(33) + ")"
        else:
            edgesystem = edgesystem + "(" + str(21) + "," + str(32) + ")"
            edgesystem = edgesystem + "(" + str(20) + "," + str(33) + ")"
        if v[2] == 0:
            edgesystem = edgesystem + "(" + str(38) + "," + str(50) + ")"
            edgesystem = edgesystem + "(" + str(39) + "," + str(51) + ")"
        else:
            edgesystem = edgesystem + "(" + str(39) + "," + str(50) + ")"
            edgesystem = edgesystem + "(" + str(38) + "," + str(51) + ")"
        if v[3] == 0:
            edgesystem = edgesystem + "(" + str(56) + "," + str(68) + ")"
            edgesystem = edgesystem + "(" + str(57) + "," + str(69) + ")"
        else:
            edgesystem = edgesystem + "(" + str(57) + "," + str(68) + ")"
            edgesystem = edgesystem + "(" + str(56) + "," + str(69) + ")"
        if v[4] == 0:
            edgesystem = edgesystem + "(" + str(8) + "," + str(44) + ")"
            edgesystem = edgesystem + "(" + str(9) + "," + str(45) + ")"
        else:
            edgesystem = edgesystem + "(" + str(9) + "," + str(44) + ")"
            edgesystem = edgesystem + "(" + str(8) + "," + str(45) + ")"
        if v[5] == 0:
            edgesystem = edgesystem + "(" + str(26) + "," + str(62) + ")"
            edgesystem = edgesystem + "(" + str(27) + "," + str(63) + ")"
        else:
            edgesystem = edgesystem + "(" + str(27) + "," + str(62) + ")"
            edgesystem = edgesystem + "(" + str(26) + "," + str(63) + ")"
        edgesystem = G(edgesystem)
        #Use these to pick all rotation systems
        for w in binrot:
            rotsystem = ""
            numcycles = 0
            for i in range(12):
                if w[i]==0:
                    rotsystem = rotsystem + "(" + str(6*i+1) + "," + str(6*i+2) + ")"
                    rotsystem = rotsystem + "(" + str(6*i+3) + "," + str(6*i+4) + ")"
                    rotsystem = rotsystem + "(" + str(6*i+5) + "," + str(6*i+6) + ")"
                else:
                    rotsystem = rotsystem + "(" + str(6*i+1) + "," + str(6*i+4) + ")"
                    rotsystem = rotsystem + "(" + str(6*i+2) + "," + str(6*i+5) + ")"
                    rotsystem = rotsystem + "(" + str(6*i+3) + "," + str(6*i+6) + ")"
            rotsystem = G(rotsystem)
            facesystem = rotsystem * edgesystem
            facesystem = str(facesystem.cycle_string(singletons=True))
            cyclecount[facesystem.count("(")/2] += 1
            #print(facesystem)
    #print(cyclecount)
    print(cyclecount)
    total = 0
    for j in range(12):
        total += j * cyclecount[j]
    total = total/(2^(3*6+1))
    #Product these and count cycles
    return total