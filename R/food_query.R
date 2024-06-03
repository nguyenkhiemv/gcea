food_query <- function( compoundID ) {
      #install MariaDB package
      if( !require( RMariaDB )){
        install.packages("RMariaDB")
        library(RMariaDB)
      }
      
      #connect to FOODB on mySQL server
      foodb <- dbConnect(MariaDB(), user = "root", password = 'mdtkhd29', dbname = "FOODB", 
                         host = "localhost", port = '3306')
      
      #query a single compound
      query <- paste0( 'SELECT contents.* from contents, compounds WHERE compounds.public_id ="',compoundID,'"and 
                             compounds.id = contents.source_id and contents.source_type = "Compound"
                              ORDER BY orig_content desc' )
      df <- dbSendQuery( foodb, query )
      res <- dbFetch( df )
      
      #dbDisconnect( foodb )
      dbClearResult( df )
      return( res )
      

}

#test <- food_query( compoundID = 'FDB011904')
