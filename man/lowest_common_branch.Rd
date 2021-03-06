\name{lowest_common_branch}
\alias{lowest_common_branch}
\title{Find lowest common branch were the two items are shared}
\usage{
lowest_common_branch(item1, item2, ...)
}
\arguments{
  \item{item1}{a named numeric vector (of cluster group
  with names of k level)}

  \item{item2}{a named numeric vector (of cluster group
  with names of k level)}

  \item{...}{not used}
}
\value{
The first location (from left) where the two vectors have
the same A dendrogram, after adjusting the members attr in
all of its nodes.
}
\description{
Given two vectors, for two items, of cluster belonging -
the function finds the lowest branch (e.g: largest number
of k clusters) for which the two items are in the same
cluster for the two trees.
}
\examples{
item1 <- structure(c(1L, 1L, 1L, 1L), .Names = c("1", "2", "3", "4"))
item2 <- structure(c(1L, 1L, 2L, 2L), .Names = c("1", "2", "3", "4"))
lowest_common_branch(item1, item2)
}
\seealso{
\link{cor_bakers_gamma}
}

