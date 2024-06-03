\name{gsea_test}
\alias{gsea_test}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{gsea_test
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
Test to determine if a group of genes is enriched in a pre-defined set of genes that interact with a compound
}
\usage{
gsea_test( compound, geneRanked, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{compound}{
  Name of compound data set( 'drug', 'biocomp', 'LINCS' )
%%     ~~Describe \code{x} here~~
}
  \item{geneRanked}{
  Named vector of gene-level stats (i.e, a ranking metric). The current version only support HGNC symbols as gene names.
%%     ~~Describe \code{x} here~~
}
  \item{Other arguments}{
  see function \emph{ fgsea } in the \pkg{fgsea} package
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
data( geneRanked )
res <- gsea_test( compound = 'drug', geneRanked = geneRanked )
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
%% \keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
%% \keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
