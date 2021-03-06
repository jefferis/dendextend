\name{get_branches_heights}
\alias{dendextend_get_branches_heights}
\alias{get_branches_heights}
\title{Get height attributes from a dendrogram}
\usage{
get_branches_heights(tree, sort = TRUE, decreasing = FALSE, ...)
}
\arguments{
  \item{tree}{a dendrogram.}

  \item{sort}{logical. Should the heights be sorted?}

  \item{decreasing}{logical. Should the sort be increasing
  or decreasing? Not available for partial sorting.}

  \item{...}{not used.}
}
\value{
a vector of the dendrogram's nodes heights (excluding
leaves).
}
\description{
Get height attributes from a dendrogram
}
\examples{
hc <- hclust(dist(USArrests[1:4,]), "ave")
dend <- as.dendrogram(hc)
get_branches_heights(dend)

\dontrun{
dat1 <- iris[1:150,-5]
dat1 <- rbind(dat1,dat1,dat1,dat1,dat1,dat1,dat1)
dend_big = as.dendrogram(hclust(dist(dat1)))
require(microbenchmark)
require(dendextendRcpp)
microbenchmark(dendextend_get_branches_heights(dend_big),
               get_branches_heights(dend_big),
               dendextendRcpp::get_branches_heights(dend_big),
               times = 10)
               # ~148 times faster! (for larger trees)
}
}

