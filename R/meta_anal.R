######meta analysis fxn
meta_anal <- function( method = c( 'hyper', 'gsea' )[1], geneSet, score_thres = 500,
                        minSize = 15, maxSize = 1500, eps = 0,
                        scoreType = c( 'std', 'pos', 'neg')[1]  ) {

  if ( method == 'hyper' ){
  drug <- hyper_test( compound = 'drug', geneList = geneSet, score_thres = score_thres )
  biocomp <- hyper_test( compound = 'biocomp', geneList = geneSet, score_thres = score_thres )
  lincs_comp <- hyper_test( compound = 'LINCS', geneList = geneSet, score_thres = score_thres )

  dat <- rbind( drug, biocomp, lincs_comp )
  rm( drug, biocomp, lincs_comp )

  dat <- dat[!duplicated( dat$ichikey), ]
  dat$padj <- p.adjust( as.numeric( as.character( dat$pval )), method = 'BH')

  }

  if ( method == 'gsea' ){
    drug <- gsea_test( compound = 'drug', geneRanked  = geneSet,
                       eps      = eps,
                       minSize  = minSize,
                       maxSize  = maxSize,
                       scoreType = scoreType )
    biocomp <- gsea_test( compound = 'biocomp', geneRanked  = geneSet,
                          eps      = eps,
                          minSize  = minSize,
                          maxSize  = maxSize,
                          scoreType = scoreType )
    lincs_comp <- gsea_test( compound = 'LINCS', geneRanked = geneSet,
                             eps      = eps,
                             minSize  = minSize,
                             maxSize  = maxSize,
                             scoreType = scoreType )

    dat <- rbind( drug, biocomp, lincs_comp )
    rm( drug, biocomp, lincs_comp )

    dat <- dat[!duplicated( dat$pathway), ]
    dat$padj <- p.adjust( as.numeric( as.character( dat$pval )), method = 'BH')

  }



  return( dat )

}


