\name{assign_values_to_branches_edgePar}
\alias{assign_values_to_branches_edgePar}
\title{Assign values to edgePar of dendrogram's branches}
\usage{
assign_values_to_branches_edgePar(object, value, edgePar, ...)
}
\arguments{
  \item{object}{a dendrogram object}

  \item{value}{a new value scalar for the edgePar
  attribute.}

  \item{edgePar}{the value inside edgePar to adjust.}

  \item{...}{not used}
}
\value{
A dendrogram, after adjusting the edgePar attribute in all
of its branches,
}
\description{
Go through the dendrogram branches and updates the values
inside its edgePar
}
\examples{
\dontrun{

dend <- as.dendrogram(hclust(dist(USArrests[1:5,])))
plot(dend)
dend <- assign_values_to_branches_edgePar(object=dend, value = 2, edgePar = "lwd")
plot(dend)
dend <- assign_values_to_branches_edgePar(object=dend, value = 2, edgePar = "col")
plot(dend)
dend <- assign_values_to_branches_edgePar(object=dend, value = 2, edgePar = "lty")
plot(dend)

}
}
\seealso{
\link{get_branches_attr}
}

