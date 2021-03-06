\name{Bk_permutations}
\alias{Bk_permutations}
\title{Bk permutation - Calculating Fowlkes-Mallows Index for two dendrogram}
\usage{
Bk_permutations(tree1, tree2, k, R = 1000, warn = TRUE, ...)
}
\arguments{
  \item{tree1}{a dendrogram/hclust/phylo object.}

  \item{tree2}{a dendrogram/hclust/phylo object.}

  \item{k}{an integer scalar or vector with the desired
  number of cluster groups. If missing - the Bk will be
  calculated for a default k range of 2:(nleaves-1). No
  point in checking k=1/k=n, since both will give Bk=1.}

  \item{R}{integer (Default is 1000). The number of Bk
  permutation to perform for each k.}

  \item{warn}{logical (TRUE). Should a warning be issued in
  case of problems? If set to TRUE, extra checks are made
  to varify that the two clusters have the same size and
  the same labels.}

  \item{...}{Ignored (passed to
  FM_index_R/FM_index_profdpm).}
}
\value{
A list (of the length of k's), where each element of the
list has R (number of permutations) calculations of
Fowlkes-Mallows index between two dendrogram after having
their labels shuffled.

The names of the lists' items is the k for which it was
calculated.
}
\description{
Bk is the calculation of Fowlkes-Mallows index for a series
of k cuts for two dendrograms.

Bk permutation calculates the Bk under the null hypothesis
of no similarirty between the two trees by randomally
shuffling the labels of the two trees and calculating their
Bk.
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
# tree1 <- as.treerogram(hc1)
# tree2 <- as.treerogram(hc2)
#    cutree(tree1)

some_Bk <- Bk(hc1, hc2, k = 20)
some_Bk_permu <- Bk_permutations(hc1, hc2, k = 20)

# we can see that the Bk is much higher than the permutation Bks:
plot(x=rep(1,1000), y= some_Bk_permu[[1]],
        main = "Bk distribution under H0",
        ylim = c(0,1))
points(1, y= some_Bk, pch = 19, col = 2 )

}
}
\references{
Fowlkes, E. B.; Mallows, C. L. (1 September 1983). "A
Method for Comparing Two Hierarchical Clusterings". Journal
of the American Statistical Association 78 (383): 553.

\url{http://en.wikipedia.org/wiki/Fowlkes-Mallows_index}
}
\seealso{
\code{\link{FM_index}}, \link{Bk}
}

