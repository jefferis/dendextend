\name{shuffle}
\alias{shuffle}
\alias{shuffle.default}
\alias{shuffle.dendrogram}
\alias{shuffle.hclust}
\alias{shuffle.phylo}
\title{Random rotation of trees}
\usage{
shuffle(object, ...)

\method{shuffle}{dendrogram}(object, ...)

\method{shuffle}{hclust}(object, ...)

\method{shuffle}{phylo}(object, ...)
}
\arguments{
  \item{object}{a tree object
  (\link{dendrogram}/\link{hclust}/\link[ape]{phylo})}

  \item{...}{Ignored.}
}
\value{
A randomlly rotated tree object
}
\description{
'shuffle' randomilly rotates ("shuffles") a tree, changing
its presentation while preserving its topolgoy. 'shuffle'
is based on \link[dendextend]{rotate} and through its
methods can work for any of the major tree objects in R
(\link{dendrogram}/\link{hclust}/\link[ape]{phylo}).

This function is useful in combination with
\link{tanglegram} and \link{entanglement}.
}
\details{
'shuffle' is a function that randomilly rotates
("shuffles") a tree. a dendrogram leaves order (by means of
rotation)
}
\examples{
dend <- as.dendrogram(hclust(dist(USArrests)))
set.seed(234238)
dend2 <- shuffle(dend)

tanglegram(dend, dend2, margin_inner=7)
entanglement(dend, dend2) # 0.3983

# although these ARE the SAME tree:
tanglegram(sort(dend), sort(dend2), margin_inner=7)
}
\seealso{
\code{\link{tanglegram}}, \code{\link{entanglement}},
\code{\link[dendextend]{rotate}}
}

