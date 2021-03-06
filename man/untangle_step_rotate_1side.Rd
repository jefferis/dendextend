\name{untangle_step_rotate_1side}
\alias{untangle_step_rotate_1side}
\title{Stepwise untangle one tree compared to another}
\usage{
untangle_step_rotate_1side(dend1, dend2_fixed, L = 1.5,
  direction = c("forward", "backward"), k_seq = NULL, dend_heights_per_k,
  ...)
}
\arguments{
  \item{dend1}{a dendrogram object. The one we will rotate
  to best fit dend2_fixed.}

  \item{dend2_fixed}{a dendrogram object. This one is kept
  fixed.}

  \item{L}{the distance norm to use for measuring the
  distance between the two trees. It can be any positive
  number, often one will want to use 0, 1, 1.5, 2 (see
  'details' in \link{entanglement}).}

  \item{direction}{a character scalar, either "forward"
  (default) or "backward". Impacts the direction of
  clustering that are tried. Either from 2 and up (in case
  of "forward"), or from nleaves to down (in case of
  "backward")

  If k_seq is not NULL, then it overrides "direction".}

  \item{k_seq}{a sequence of k clusters to go through for
  improving dend1. If NULL (default), then we use the
  "direction" parameter.}

  \item{dend_heights_per_k}{a numeric vector of values
  which indicate which height will produce which number of
  clusters (k)}

  \item{...}{not used}
}
\value{
dend1 after it was rotated to best fit dend2_fixed.
}
\description{
Given a fixed tree and a tree we wish to rotate, this
function goes through all of the k number of clusters (from
2 onward), and each time rotates the branch which was
introduced in the new k'th cluster. This rotated tree is
compared with the fixed tree, and if it has a better
entanglement, it will be used for the following
interations.

This is a greedy forward selection algorithm for rotating
the tree and looking for a better match.

This is useful for finding good trees for a
\link{tanglegram}.
}
\examples{
\dontrun{
dend1 <- as.dendrogram(hclust(dist(USArrests[1:10,])))
set.seed(3525)
dend2 <- shuffle(dend1)
tanglegram(dend1,dend2)
entanglement(dend1,dend2, L = 2) # 0.4727

dend2_corrected <- untangle_step_rotate_1side(dend2, dend1)
tanglegram(dend1,dend2_corrected) # FIXED.
entanglement(dend1,dend2_corrected, L = 2) # 0

}
}
\seealso{
\link{tanglegram}, \link{match_order_by_labels},
\link{entanglement}, \link{flip_leaves},
\link{all_couple_rotations_at_k},
\link{untangle_step_rotate_2side}.
}

