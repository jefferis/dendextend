\name{untangle_step_rotate_2side}
\alias{untangle_step_rotate_2side}
\title{Stepwise untangle two trees one at a time}
\usage{
untangle_step_rotate_2side(dend1, dend2, L = 1.5, direction = c("forward",
  "backward"), max_n_iterations = 10L, print_times = TRUE, k_seq = NULL,
  ...)
}
\arguments{
  \item{dend1}{a dendrogram object. The one we will rotate
  to best fit dend2.}

  \item{dend2}{a dendrogram object. The one we will rotate
  to best fit dend1.}

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

  \item{max_n_iterations}{integer. The maximal number of
  times to switch between optimizing one tree with
  another.}

  \item{print_times}{logicla (TRUE), should we print how
  many times we switched between rotating the two trees?}

  \item{k_seq}{a sequence of k clusters to go through for
  improving dend1. If NULL (default), then we use the
  "direction" parameter.}

  \item{...}{not used}
}
\value{
A list with two dendrograms (dend1/dend2), after they are
rotated to best fit one another.
}
\description{
This is a greedy forward selection algorithm for rotating
the tree and looking for a better match.

This is useful for finding good trees for a
\link{tanglegram}.

It goes through rotating dend1, then dend2, and so on -
until a locally optimal solution is found.
}
\examples{
\dontrun{
dend1 <- as.dendrogram(hclust(dist(USArrests[1:20,])))
dend2 <- as.dendrogram(hclust(dist(USArrests[1:20,]), method = "single"))
set.seed(3525)
dend2 <- shuffle(dend2)
tanglegram(dend1,dend2, margin_inner=6.5)
entanglement(dend1,dend2, L = 2) # 0.79

dend2_corrected <- untangle_step_rotate_1side(dend2, dend1)
tanglegram(dend1,dend2_corrected, margin_inner=6.5) # Good.
entanglement(dend1,dend2_corrected, L = 2) # 0.0067
# it is better, but not perfect. Can we improve it?

dend12_corrected <- untangle_step_rotate_2side(dend1, dend2)
tanglegram(dend12_corrected[[1]],dend12_corrected[[2]], margin_inner=6.5) # Better...
entanglement(dend12_corrected[[1]],dend12_corrected[[2]], L=2) # 0.0045


# best combination:
dend12_corrected_1 <- untangle_random_search(dend1, dend2)
dend12_corrected_2 <- untangle_step_rotate_2side(dend12_corrected_1[[1]],dend12_corrected_1[[2]])
tanglegram(dend12_corrected_2[[1]],dend12_corrected_2[[2]], margin_inner=6.5) # Better...
entanglement(dend12_corrected_2[[1]],dend12_corrected_2[[2]], L=2) # 0 - PERFECT.

}
}
\seealso{
\link{tanglegram}, \link{match_order_by_labels},
\link{entanglement}, \link{flip_leaves},
\link{all_couple_rotations_at_k}.
\link{untangle_step_rotate_1side}.
}

