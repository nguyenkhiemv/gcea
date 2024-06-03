#install fgsea package
if ( !require( fgsea )) {
        if (!requireNamespace("BiocManager", quietly = TRUE))
          install.packages("BiocManager")
        BiocManager::install("fgsea")
        library( fgsea )
}


gsea_test <- function( compound, geneRanked, minSize = 15, maxSize = 1500, eps = 0,
                       scoreType = c( 'std', 'pos', 'neg')[1] ) {

  #load gmt file
      if( compound != 'drug' & compound != 'biocomp' & compound != 'LINCS'){
            stop("Error: compound must be 'drug' or 'biocomp' or 'LINCS") }

      if ( compound == 'drug' ) { compound_gmt <- gcea::drug_gmt_500 }


      if( compound =='biocomp' ) { compound_gmt <- gcea::biocomp_gmt_500 }

      if ( compound == 'LINCS') { compound_gmt <- gcea::LINCS_gmt_500 }

      #call fgsea
      fgseaRes <- fgsea::fgsea(pathways = compound_gmt,
                                  stats    = geneRanked,
                                  eps      = eps,
                                  minSize  = minSize,
                                  maxSize  = maxSize,
                                  scoreType = scoreType,
                                  nproc = 1
                  )
      #add compound names
      rm( compound_gmt )

      if ( compound == 'drug' ) { compound.gene <- gcea::drug.gene.final }


      if( compound =='biocomp' ) { compound.gene <- gcea::biocomp.gene.final }

      if( compound =='LINCS' ) { compound.gene <- gcea::LINCS.comp.gene.final }

      compound_name <- compound.gene[ , c( 'id', 'name')]
      compound_name <- compound_name[ !duplicated( compound_name$id), ]
      fgseaRes <- merge( fgseaRes,compound_name, by.x = 'pathway', by.y = 'id' )

  return( fgseaRes )
}
### rank genes( )
#genes_ranked <-  genes$logFC *( -log10( genes$PValue))
#names( genes_ranked ) <- toupper( genes$GeneName )
#genes_ranked <- rank( genes_ranked, ties.method = 'random')
#genes_ranked <- sort( genes_ranked, decreasing = F)
#
