\name{unclass_dend}
\alias{unclass_dend}
\title{unclass an entire dendrogram tree}
\usage{
unclass_dend(dend, ...)
}
\arguments{
  \item{dend}{a dendrogram object}

  \item{...}{not used}
}
\value{
The list which was the dendrogram (but without a class)
}
\description{
unclass an entire dendrogram tree
}
\examples{
# define dendrogram object to play with:
hc <- hclust(dist(USArrests[1:3,]), "ave")
dend <- as.dendrogram(hc)

itself <- function(x) x
dend <- dendrapply(dend, itself)
unclass(dend) # this only returns a list with
            # two dendrogram objects inside it.
str(dend) # this is a great way to show a dendrogram,
            # but it doesn't help us understand how the R object is built.
str(unclass(dend)) # this is a great way to show a dendrogram,
            # but it doesn't help us understand how the R object is built.
unclass_dend(dend) # this only returns a list
                     #  with two dendrogram objects inside it.
str(unclass_dend(dend)) # NOW we can more easily understand
                        # how the dendrogram object is structured...
}
\seealso{
\link{nleaves}
}

