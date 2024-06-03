#gene set must be in csv format with the column of gene symbol named as 'hgnc_symbol'

hyper_test <- function ( compound = c( 'drug', 'biocomp')[1], geneList, score_thres = 300 ){

      if( compound != 'drug' & compound != 'biocomp' & compound != 'LINCS'){
            stop("Error: compound must be 'drug' or 'biocomp' or 'LINCS' ") }

      if ( compound == 'drug' ) { compound.gene <- gcea::drug.gene.final
                                        }

      if( compound =='biocomp' ) { compound.gene <- gcea::biocomp.gene.final
                                        }
      if( compound =='LINCS' ) { compound.gene <- gcea::LINCS.comp.gene.final}

     # remove interaction with score < score_thres
      compound.gene <- compound.gene[ compound.gene$combined.score >= score_thres,]

      #convert symbol to upper cases
      geneList <- toupper( geneList )

      #remove duplicated genes
      geneList <- unique( geneList )
      print( head( geneList))

      #extract  genes in geneList that interact with compound
      gene.list.intx<- intersect( geneList, compound.gene$hgnc_symbol )
      print( head( gene.list.intx))
      rm( geneList )

      output <- fisher_test( compound.gene, gene.list.intx )

      #get compound names and adj pval
      drug.info <- compound.gene[, c('id', 'name', 'ichikey')]
      drug.info <- drug.info[!duplicated( drug.info$id ),]
      output <- merge( output, drug.info, by.x = 'compound', by.y = 'id')
      #fdr correction
      output$padj <- p.adjust( output$pval, method = 'BH')
      output <- output[ order( as.numeric( output$pval ), decreasing = F), ]

      return( output)
}




