comp_food_query <- function( obj, n = 5  ) {

  #order compounds by pvalue
  obj$pval <- as.numeric( as.character( obj$pval ))
  obj <- obj[ order( obj$pval, decreasing = F ), ]

  #get top compounds
  compounds <- obj$compound[ 1: n ]
  rm( obj )
  if ( length( grep( 'FDB', compounds )) == 0 ) {
    print( 'Output must come from food compound data base ')
    stop( )
  }

  #create a list to store result
  res <- vector( 'list', length = length( compounds ) )

  for ( i in 1:length( compounds ) ) {
    id <- compounds[i]
    dat <- food_query( compoundID = id )
    res[[i]] <- dat
  }

  names( res  ) <- compounds

  return( res )

}

#test2 <- food_query_topComp( biocomp_res, n = 5 )
