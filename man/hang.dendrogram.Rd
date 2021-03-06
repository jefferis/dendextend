\name{hang.dendrogram}
\alias{hang.dendrogram}
\title{Hang dendrogram leaves}
\source{
Noticing that as.dendrogram has a "hang" parameter was
thanks to Enrique Ramos's answer here::
\url{http://stackoverflow.com/questions/17088136/plot-horizontal-dendrogram-with-hanging-leaves-r}
}
\usage{
hang.dendrogram(dend, hang = 0.1, hang_height, ...)
}
\arguments{
  \item{dend}{a dendrogram object}

  \item{hang}{The fraction of the plot height by which
  labels should hang below the rest of the plot. A negative
  value will cause the labels to hang down from 0.}

  \item{hang_height}{is missing, then using "hang". If a
  number is given, it overrides "hang" (except if "hang" is
  negative)}

  \item{...}{not used}
}
\value{
A dendrogram, after adjusting the height attr in all of its
leaves, so that the tree will hang.
}
\description{
Adjust the height attr in all of the dendrogram leaves so
that the tree will hang. This is similar to
as.dendrogram(hclust, hang=0.1) Only that it now works on
other object than hclust turned into a dendrogram.  For
example, this allows us to hang non-binary trees.
}
\examples{
# define dendrogram object to play with:
hc <- hclust(dist(USArrests[1:5,]), "ave")
dend <- as.dendrogram(hc)

par(mfrow = c(1,2))
plot(hang.dendrogram(dend))
plot(hc)
# identical(as.dendrogram(hc, hang = 0.1), hang.dendrogram(dend, hang = 0.1))
# TRUE!!


par(mfrow = c(1,4))

plot(dend)
plot(hang.dendrogram(dend, hang = 0.1))
plot(hang.dendrogram(dend, hang = 0))
plot(hang.dendrogram(dend, hang = -0.1))

par(mfrow = c(1,1))
plot(hang.dendrogram(dend), horiz = TRUE)
}

