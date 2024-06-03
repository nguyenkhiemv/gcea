
      ##### FISHER test
      # m :  gene list
      # n : NOT immune genes
      # k: genes interact with drug
      # x: genes interact with drug AND in immune gene set

fisher_test <- function ( compound.gene, geneList ) {
       #number of immune genes
       m <- length( unique(geneList ))
       print( paste( 'm=', m ) )

       #universal genes( back ground )
       total.genes <- length( unique( compound.gene$hgnc_symbol ) )

       #number of genes not in the genelist
       n <- total.genes - m
       print( n )

       #get compound list
       compounds.list <- unique( compound.gene$id )
       print( length( compounds.list ))

       #data frame to store the data
       res <- as.data.frame( matrix( NA, nrow = length( compounds.list), ncol = 6))

       for ( i in 1:length( compounds.list ) ) {
         #get compound
         compound <- compounds.list[i]

         #name <- compound.gene$name[ compound.gene$id == compound]
         print( paste( compound ) )

         #get interaction genes for each compound
         intx.genes <- unique( compound.gene$hgnc_symbol[ compound.gene$id == compound ] )
         k <- length( unique(intx.genes ))
         print( k )

         #number of interacting genes in immune gene set
         x <- length( intersect( intx.genes, geneList))
         print( x )

         # Fisher test
         xo <- 0:k
         probs <- dhyper( xo, m, n, k, log = FALSE )

         #sum of probs of tables that have > x overlaped genes
         low <- x + 1
         high <- min( k + 1, m+1 )
         pval <- sum( probs[ low:high ])
         res[i,] <-  c( paste( compound ), x, k, m, n, pval)
       }

       colnames( res ) <- c( 'compound', 'x', 'k', 'm', 'n','pval')
       return( res )
}





