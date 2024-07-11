def tx2gene(pathTranscriptome):
    with open(pathTranscriptome,'r') as f:
        line = f.readline()
        geneList = []
        txList = []
        while line != "":
            if line[0] == ">":
                tx = line.split(' ')[0]
                tx = tx.replace('>','') 
                gene = tx.rsplit('_',1)[0]
                geneList.append(gene)
                txList.append(tx) 
                line = f.readline()
            else:
                line = f.readline()
        f.close()
    f = open("Hedophylum_tx2gene.txt", "a")
    for i in range(len(txList)):
        f.write(txList[i])
        f.write(" ")
        f.write(geneList[i])
        f.write("\n")
    f.close()
            

tx2gene('/Users/mmeynadier/Documents/kelpProject/Hedophylum_longest_isoform_assembly.fasta')