\name{FM_index_profdpm}
\alias{FM_index_profdpm}
\title{Calculating Fowlkes-Mallows index using the profdpm R package}
\usage{
FM_index_profdpm(A1_clusters, A2_clusters, assume_sorted_vectors = FALSE,
  warn = TRUE, ...)
}
\arguments{
  \item{A1_clusters}{a numeric vector of cluster grouping
  (numeric) of items, with a name attribute of item name
  for each element from group A1. These are often obtained
  by using some k cut on a dendrogram.}

  \item{A2_clusters}{a numeric vector of cluster grouping
  (numeric) of items, with a name attribute of item name
  for each element from group A2. These are often obtained
  by using some k cut on a dendrogram.}

  \item{assume_sorted_vectors}{logical (FALSE). Can we
  assume to two group vectors are sorter so that they have
  the same order of items? IF FALSE (default), then the
  vectors will be sorted based on their name attribute.}

  \item{warn}{logical (TRUE). Should a warning be issued in
  case of problems?}

  \item{...}{Ignored.}
}
\value{
The Fowlkes-Mallows index between two vectors of clustering
groups.
}
\description{
Calculating Fowlkes-Mallows index using the \code{pci}
function from the profdpm R package. This function uses C
code (thanks to Matthew Shotwell's work) and is a bit
faster than the R code (from my simple tests - it is about
1.2-1.3 times faster - which is not much but it might be
useful).

As opposed to the \code{\link{FM_index_R}} function, the
\code{FM_index_profdpm} function does NOT calculate the
expectancy or the variance of the FM Index under the null
hypothesis of no relation.

This function also allows us to compare our calculations
with an independent writing of a function calculating the
same statistic.
}
\details{
From Wikipedia:

Fowlkes-Mallows index (see references) is an external
evaluation method that is used to determine the similarity
between two clusterings (clusters obtained after a
clustering algorithm). This measure of similarity could be
either between two hierarchical clusterings or a clustering
and a benchmark classification. A higher the value for the
Fowlkes-Mallows index indicates a greater similarity
between the clusters and the benchmark classifications.
}
\examples{
\dontrun{

set.seed(23235)
ss <- TRUE # sample(1:150, 10 )
hc1 <- hclust(dist(iris[ss,-5]), "com")
hc2 <- hclust(dist(iris[ss,-5]), "single")
# dend1 <- as.dendrogram(hc1)
# dend2 <- as.dendrogram(hc2)
#    cutree(dend1)

FM_index_profdpm(cutree(hc1, k=3), cutree(hc1, k=3)) # 1
set.seed(1341)
FM_index_profdpm(cutree(hc1, k=3), sample(cutree(hc1, k=3)),
   assume_sorted_vectors =TRUE) # 0.38037
FM_index_profdpm(cutree(hc1, k=3), sample(cutree(hc1, k=3)),
   assume_sorted_vectors =FALSE) # 1 again :)
FM_index_profdpm(cutree(hc1, k=3), cutree(hc2, k=3)) # 0.8059
FM_index_profdpm(cutree(hc1, k=30), cutree(hc2, k=30)) # 0.4529

fo <- function(k) FM_index_profdpm(cutree(hc1, k), cutree(hc2, k))
lapply(1:4, fo)
ks <- 1:150
plot(sapply(ks, fo)~ ks, type = "b", main = "Bk plot for the iris dataset")

}
}
\references{
Fowlkes, E. B.; Mallows, C. L. (1 September 1983). "A
Method for Comparing Two Hierarchical Clusterings". Journal
of the American Statistical Association 78 (383): 553.

Shotwell, Matthew S. "profdpm: An R Package for MAP
Estimation in a Class of Conjugate Product Partition
Models." Journal of Statistical Software 53: 1-18.

\url{http://en.wikipedia.org/wiki/Fowlkes-Mallows_index}
}
\seealso{
\link{cor_bakers_gamma}
}

