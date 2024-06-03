QQplot <- function ( obj ) {
  
  #install ggplot2
  if ( !require( ggplot2 )) {
    install.packages( 'ggplot2' )
    library( ggplot2, quietly = TRUE)
  }
  
  #extract raw pvalues
  pvec <-   obj$pval  
  pvec <- as.numeric( pvec )
  pvec <- -log10( pvec )
  #qq plot
  pvec <- sort ( pvec, decreasing = FALSE )
  exp<-  sort( -(log10( 1:length( pvec ) / length( pvec ) )), decreasing = FALSE)
  dat <- as.data.frame( cbind( pvec, exp ) )
  
  ggplot( data = dat, aes( exp, pvec ) ) +
    geom_point(color = 'darkblue', alpha = 1/40) +
  
  labs( x= expression( ~ -log~ italic(p['Expected'])),
         y = expression( ~ -log~ italic(p['Observed'])) ) +
  
  geom_abline( 0, 1, col = 'red', size = 1.5) +
    lims( x = c( 0, max( exp )), y = c( 0, max( pvec )))
  
}