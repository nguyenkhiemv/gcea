#install R package using tar.gz file

R CMD INSTALL gcea

#load the package
library( gcea )

hyper_test
Description
Hypergeometric test to determine if a group of genes is over-represented in a pre-defined set of genes that interact with a compound.
Usage
hyper_test( compound, geneList, score_thres )

Arguments
compound
 Choose ‘drug’, ‘biocomp’ or ‘LINCS’. The function will use the corresponding database ( DrugBank, FoodDB or LINCS1000) to run the test
geneList
A vector of HGNC symbols of the gene list
score_thres
  Confidence score threshold to determine gene-compound interaction. The default value is 300.
Value
Result as a data frame includes p-values and Benjamin-Hochberg adjusted p-values
Examples
Run examples
data( inflamGenes )
res <- hyper_test( compound = 'drug', geneList = inflamGenes, score_thres = 300 )

—————————————————————————————————————————
meta_anal function will use all three databases for the analysis to run hypergeometric test  

Run examples
data( inflamGenes )
res <- meta_anal( method= ‘hyper’, geneSet = inflamGenes, score_thres = 300 )
