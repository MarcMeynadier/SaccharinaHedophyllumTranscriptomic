"""
enrichmentAnalysisParser : Parse and build files to provide the user with all the necessary input files to run the Ontologizer and GO_MWU tools.

Marc Meynadier
"""


#------------------------------------------------------------------------------#
#                       Importation of external libraries                      #
#------------------------------------------------------------------------------#


import os
import wget
import shutil
import pandas as pd
from urllib.request import urlopen


#------------------------------------------------------------------------------#
#                              Files management                                #
#------------------------------------------------------------------------------#


def getOntologyFileOntologizer():
    """
    Description
    -----------
    Download the Gene Ontology database and store it in the Ontologizer tool folder.

    Parameters
    ----------
    None

    Returns
    -------
    None
    """

    url = 'http://purl.obolibrary.org/obo/go.obo'
    wget.download(url)
    shutil.move('go.obo', '../ontologizer')



def swap_columns(df, col1, col2):
    """
    Description
    -----------
    Selects two columns of a dataframe, and swap them.

    Parameters
    ----------
    df
        Pandas dataframe.
    col1
        Pandas.series, first column to swap.
    col2
        Pandas.series, second to swap.

    Returns
    -------
    df
        Pandas dataframe, after columns have been swaped.
    """

    col_list = list(df.columns)
    x, y = col_list.index(col1), col_list.index(col2)
    col_list[y], col_list[x] = col_list[x], col_list[y]
    df = df[col_list]
    return df

def getAnnotationFile(species):
    """
    Description
    -----------
    Retrieves the output file from hmmsearch, parse it to retrieve the Pfam annotation and the Pfam code of the genes. 

    Parameters
    ----------
    None

    Returns
    -------
    annotDf
       Pandas dataframe, contains successively the gene IDs, the Pfam annotations, the Pfam codes and the protein sequences.
    """

    curedFile = []
    with open('../hmmer/pfam_table_'+species+'.table') as f:
        contents = f.readlines()
    for i in contents:
        if 'TRINITY' in i:
            curedFile.append(i)
    geneNames=[] ; pfamAnnot= [] ; pfamCode = []
    separator = "PF"
    for i in range(len(curedFile)):
        geneNames.append(curedFile[i].split(" - ",1)[0])
        geneNames[i]=geneNames[i].replace('TRINITY_','')
        splitDash = curedFile[i].split(" - ",1)[1]
        splitAnnot = splitDash.split(separator,1)[0] ; splitAnnot = splitAnnot.strip()
        splitCode = splitDash.split(separator,1)[1] ; splitCode = splitCode.split(".",1)[0] ; splitCode = separator + splitCode
        pfamAnnot.append(splitAnnot) ; pfamCode.append(splitCode)
    dic={'genes':geneNames,'pfam_annotation':pfamAnnot,'pfam_code':pfamCode}
    annotDf=pd.DataFrame(dic)
    annotDf = annotDf.replace(to_replace ='(_i).*', value = '', regex = True)
    return annotDf

def getAssociationFile(species): 
    """
    Description
    -----------
    Retrieve the pfam2go database from the Gene Ontology site, then parse this database to retrieve the GO terms 
    and GO codes associated with each Pfam code. Since a Pfam code can contain several GO terms, several successive 
    parsings are necessary to produce a dataframe containing the Pfam annotations, the GO terms and the GO codes. 
    The dataframe from getAnnotationFile() is then retrieved and merged with the previously parsed dataframe, 
    using the common Pfam code between the two dataframes. The columns corresponding to the GO annotation, 
    Pfam and Pfam codes are then dropped in order to leave only the GO code and gene name columns, 
    corresponding to the association file format expected by Ontologizer.

    Parameters
    ----------
    None

    Returns
    -------
    None
    """    

    url = 'http://current.geneontology.org/ontology/external2go/pfam2go'
    pfam2go = urlopen(url).read().decode('utf-8') 
    pfam2goList = pfam2go.split("\n")
    curedList = []
    for i in pfam2goList:
        if "Pfam:" in i:
            curedList.append(i)
    pfamCodeList = [] ; goAnnotList = [] ; goCodeList = []
    for i in curedList:
        pfamCode = i.split()[0] ; pfamCode = pfamCode.split("Pfam:",1)[1]
        goAnnot = i.split("> ",1)[1] ; goAnnot = goAnnot.split(" ;",1)[0]
        goCode = i.rsplit("; ",1)[1] 
        pfamCodeList.append(pfamCode) ; goAnnotList.append(goAnnot) ; goCodeList.append(goCode)
    gatherGoAnnot = [] ; gatherGoCode = []
    tempGoAnnot = [] ; tempGoCode = []
    for i in range(len(pfamCodeList)):
        if pfamCodeList[i] == pfamCodeList[i-1]:
            tempGoAnnot.append(goAnnotList[i-1]) ; 
            tempGoCode.append(goCodeList[i-1])
        else:
            tempGoAnnot.append(goAnnotList[i-1]) ; tempGoCode.append(goCodeList[i-1]) 
            gatherGoAnnot.append(tempGoAnnot) ; gatherGoCode.append(tempGoCode)
            tempGoAnnot = [] ; tempGoCode = []
    gatherGoAnnot.pop(0) ; gatherGoCode.pop(0)
    manualLastGoAnnot = [] ; manualLastGoAnnot.append(goAnnotList[-2]) 
    manualLastGoAnnot.append(goAnnotList[-1]) ; gatherGoAnnot.append(manualLastGoAnnot)
    manualLastGoCode = [] ; manualLastGoCode.append(goCodeList[-2])  
    manualLastGoCode.append(goCodeList[-1]) ; gatherGoCode.append(manualLastGoCode)
    tempGoAnnot = [] ; tempGoCode = []
    finalGoAnnot = [] ; finalGoCode = []
    count = 0
    for i in range(len(pfamCodeList)):
        try:
            if pfamCodeList[i] == pfamCodeList[i+1]:
                finalGoAnnot.append(gatherGoAnnot[count]) ; 
                finalGoCode.append(gatherGoCode[count])
            else:
                finalGoAnnot.append(gatherGoAnnot[count]) ; finalGoCode.append(gatherGoCode[count]) 
                count += 1
        except IndexError:
            pass           
    finalGoAnnot.append(gatherGoAnnot[-1]) ; finalGoCode.append(gatherGoCode[-1]) 
    finalGoCode2 = []
    for i in finalGoCode:
        i = ",".join(map(str,i))
        finalGoCode2.append(i)
    dic = {'pfam_code':pfamCodeList,'GO_annotation':finalGoAnnot,'GO_code':finalGoCode2} 
    annotSequenceDf = getAnnotationFile(species)
    mergeDf = pd.DataFrame(dic)
    mergeDf = mergeDf.merge(annotSequenceDf,how='inner')
    mergeDf.drop(['GO_annotation', 'pfam_annotation','pfam_code'], axis=1, inplace=True)
    mergeDf = swap_columns(mergeDf,'GO_code','genes') 
    pathOntologizer = '../ontologizer/'+species+'/'
    mergeDf.to_csv(pathOntologizer+'associationFile.ids', sep='\t', header=False, index=False)

def getPopulationFile(species):
    """
    Description
    -----------
    From each different gene identified in the transcriptome, places each of these genes in a text file corresponding 
    to the study population file expected by Ontologizer.

    Parameters
    ----------
    None

    Returns
    -------
    None
    """   

    curedFile = []
    with open('../Trinity/'+species+'_longest_isoform_assembly.fasta') as f:
        contents = f.readlines()
    for i in contents:
        if 'TRINITY' in i:
            i = i.split("TRINITY_",1)[1]
            i = i.split("_i",1)[0]
            curedFile.append(i)
    f=open('populationFile.txt', 'a')
    f.writelines("%s\n" % i for i in curedFile)
    f.close()
    shutil.move('populationFile.txt', '../ontologizer/'+species+'/')


def getProteinSequences(species):
    """
    Description
    -----------
    Retrieves the output file from TransDecoder.Predict and parse it into a dataframe containing 
    the gene IDs and their associated protein sequences.

    Parameters
    ----------
    None

    Returns
    -------
    sequencesDf
        Pandas dataframe, contains the genes IDs, and the proteins sequences associated with the genes.
    """

    with open('../transdecoder/'+species+'_longest_orfs.pep') as f:
        contents = f.readlines()
    geneNames = []
    proteinSequences = []
    concatProt = []
    for i in contents:
        if 'TRINITY' not in i:
            concatProt.append(i)
        else:
            geneNames.append(i)
            sequenceProt = ''
            for j in concatProt:
                sequenceProt += ''.join(j)
            proteinSequences.append(sequenceProt) 
            concatProt = []
    for i in range(len(geneNames)):
        geneNames[i]=geneNames[i].replace('>','')
        geneNames[i]=geneNames[i].split(' ',1)[0]
        geneNames[i]=geneNames[i].split('_i',1)[0]  
    for i in range(len(proteinSequences)):
        proteinSequences[i] = proteinSequences[i].replace('\n','')
    dic = {'genes':geneNames,'protein_sequence':proteinSequences}
    sequencesDf = pd.DataFrame(dic)
    return sequencesDf


def getStudysetFileOntologizer(threshold,species):
    """
    Description
    -----------
    For each CSV output file from DESeq2, retrieves the genes from the file, filters them based on a threshold, 
    then retrieves only the protein-coding genes using the protein sequence dataframe, and then places the name 
    of each gene in a text file. Each text file created is placed in a folder dedicated to the study samples expected 
    by Ontologizer.

    Parameters
    ----------
    threshold
        float, p-value threshold value.

    Returns
    -------
    None
    """

    protDf = getProteinSequences(species) 
    os.chdir('../DESeq2/'+species) 
    path=os.getcwd()
    for file in os.listdir(path):
        if file.endswith(".csv"):
            curedFile = []
            txtName=file.replace(".csv",".txt")
            csvFile = pd.read_csv(file)
            csvFile.rename(columns={ csvFile.columns[0]: "genes" }, inplace = True)
            csvFile = csvFile[csvFile.padj<threshold] 
            csvFile = csvFile[csvFile['padj'].notna()]  
            csvFile = csvFile.merge(protDf,how='inner',on='genes') 
            geneNames = csvFile.iloc[:,0].tolist()
            for i in geneNames:
                if 'TRINITY' in i:
                    i = i.split("TRINITY_",1)[1]
                    curedFile.append(i)
            f=open(txtName,'a')
            f.writelines("%s\n" % i for i in curedFile)
            f.close()
            shutil.move(txtName,'../../ontologizer/'+species+'/studySamples') 


def getRevigoInput(species):
    os.chdir('../ontologizer/'+species+'/output') 
    path=os.getcwd()
    for file in os.listdir(path):
        if file.endswith(".txt"):
            df = pd.read_csv(file,sep='\t')
            dfTrimmed = df[['ID','p.adjusted']]
            arr = dfTrimmed.columns.tolist()
            arr[0] = '%GO ID' ; arr[1] = 'p-value'
            dfTrimmed.columns = arr
            nameOutput = 'REVIGO_'+file
            print(dfTrimmed)
            with open(path+'/'+nameOutput, 'a') as f:
                dfTrimmed = dfTrimmed.to_string(header=True, index=False)
                f.write(dfTrimmed)
    


def main(species):
    #getOntologyFileOntologizer()
    #getAnnotationFile(species)
    #getAssociationFile(species)
    #getPopulationFile(species)
    #getProteinSequences(species)
    #getStudysetFileOntologizer(0.05,species)
    getRevigoInput(species)

main('Saccharina')