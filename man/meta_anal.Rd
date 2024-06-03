\name{meta_anal}
\alias{meta_anal}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{ meta_anal
%%  ~~function to do ... ~~

}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
Meta-analysis of three databases
}
\usage{
hyper_test( method, geneSet, score_thres )
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{method}{
%%     ~~Describe \code{x} here~~
  Choose 'hyper' or 'gsea' )
  }
  \item{geneSet}{
  A vector of HGNC symbols of the gene list if method = 'hyper'
  A vector of named gene set if method = 'gsea
  %%     ~~Describe \code{x} here~~
  }
  \item{score_thres}{
  Confidence score threshold to determine gene-compound interaction. The default value is 500.
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
