comp_gene_query <- function( obj, n = 10, score_thres = 500 ) {

  if( compound != 'drug' & compound != 'biocomp' & compound != 'LINCS'){
    stop("Error: compound must be 'drug' or 'biocomp' or 'LINCS' ") }

  if ( compound == 'drug' ) { compound.gene <- gcea::drug.gene.final
  }

  if( compound =='biocomp' ) { compound.gene <- gcea::biocomp.gene.final
  }
  if( compound =='LINCS' ) { compound.gene <- gcea::LINCS.comp.gene.final}

  #extract compound
  topcomp <- obj[ 1:n, ]

  #load compound gene signature
  comp_gene_sign <- gcea::comp_gene_sign

  #get genes interact with topcomp
  topcomp_gene <- compound.gene[ compound.gene$ichikey %in% topcomp$ichikey, ]
  topcomp_gene <- topcomp_gene[ topcomp_gene$combined.score >= score_thres, ]


  #get signature for compound
  res <- merge( topcomp_gene, comp_gene_sign, by = c('ichikey', 'hgnc_symbol'), all.x = T)
  return( res )
}
