\name{hyper_test}
\alias{hyper_test}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{ hyper_test
%%  ~~function to do ... ~~

}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
Hypergeometric test to determine if a group of genes is over-represented in a pre-defined set of genes that interact with a compound.
}
\usage{
hyper_test( compound, geneList, score_thres )
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{compound}{
%%     ~~Describe \code{x} here~~
  Choose 'hyper' or 'gsea' )
  }
  \item{geneList}{
  A vector of HGNC symbols of the gene list

  %%     ~~Describe \code{x} here~~
  }
  \item{score_thres}{
  Confidence score threshold to determine gene-compound interaction. The default value is 300.
  %%     ~~Describe \code{x} here~~

  }
}

\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
Result as a data frame includes p-values and Benjamin-Hochberg adjusted p-values
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{

data( inflamGenes )
res <- hyper_test( compound = 'drug', geneList = inflamGenes, score_thres = 300 )
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
%% \keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
%% \keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
