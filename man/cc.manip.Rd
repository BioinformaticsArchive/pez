% Generated by roxygen2 (4.1.0): do not edit by hand
% Please edit documentation in R/comparative.comm.R, R/utility.R
\name{cc.manip}
\alias{[.comparative.comm}
\alias{as.data.frame.comparative.comm}
\alias{assemblage.phylogenies}
\alias{cc.manip}
\alias{comm}
\alias{comm<-}
\alias{env}
\alias{env.names}
\alias{env<-}
\alias{phy}
\alias{phy<-}
\alias{sites}
\alias{sites<-}
\alias{species}
\alias{species<-}
\alias{trait.names}
\alias{traits}
\alias{traits<-}
\alias{tree}
\alias{tree<-}
\alias{within.comparative.comm}
\title{Manipulating and examining comparative.comm objects}
\usage{
\method{[}{comparative.comm}(x, sites, spp, warn = FALSE)

trait.names(object)

env.names(object)

species(x)

species(x) <- value

sites(x)

sites(x) <- value

traits(x) <- value

traits(x)

env(x) <- value

env(x)

comm(x) <- value

comm(x)

tree(x)

phy(x)

tree(x) <- value

phy(x) <- value

assemblage.phylogenies(data)

\method{as.data.frame}{comparative.comm}(x, row.names = NULL,
  optional = FALSE, abundance.weighted = FALSE, ...)

\method{within}{comparative.comm}(data, expr, ...)
}
\arguments{
\item{x}{\code{comparative.comm} object}

\item{sites}{numbers of sites to be kept or dropped from \code{x};
must be given as numbers. For example, \code{x[1:5,]}, or
\code{x[-1:-5,]}, but not \code{x[c("site a", "site b"),]}.}

\item{spp}{numbers of species to be kept or dropped from \code{x};
must be given as numbers. For example, \code{x[,1:5]}, or
\code{x[,-1:-5]}, but not \code{x[c("sp a", "sp b"),]}.}

\item{warn}{whether to warn if species/sites are dropped when
creating object (default: TRUE)}

\item{object}{A \code{\link{comparative.comm}} object}

\item{value}{when altering a \code{\link{comparative.comm}}
object's internal structure, the thing that you're inserting into
it!}

\item{data}{A \code{\link{comparative.comm}} object}

\item{row.names}{ignored}

\item{optional}{ignored
presence-absence dataset (default: FALSE)}

\item{abundance.weighted}{whether to create to create a}

\item{...}{ignored}

\item{expr}{expression to be evaluated within the scope of
\code{data}}
}
\value{
Names of the traits or environmental variables
}
\description{
As described in the vignette, we recommend using these wrappers to
manipulate species and site data, as it guarantees that everything
will be kept consistent across all parts of the
\code{\link{comparative.comm}} object. With them, you can drop
species, sites, and work directly with each part of your data. You
can also manipulate your \code{\link{comparative.comm}} object's
\code{phy}, \code{data}, \code{env}, and \code{comm} slots directly
if you wish, but altering the object directly yourself runs the
risk of things getting unsynchronised.

Manipulate internals of \code{comparative.comm} object
}
\note{
As described in \code{\link{comparative.comm}}, each
\code{\link{comparative.comm}} object contains a phylogeny
(\code{$phy}) and a site-by-species community matrix (as used in
\code{\link{vegan}}). Optionally, it may contain a
\code{data.frame} of trait data (each row a species, each column a
trait ) *called \code{data}* for compatibility with
\code{\link[caper:comparative.data]{comparative.data}}.
}
\examples{
data(laja)
data <- comparative.comm(invert.tree, river.sites, invert.traits, river.env)
#Subset on species, then sites
data <- data[1:5,]
data <- data[,1:5]
#Site and species can be manipulated
species(data)
sites(data)[1:3] <- c("lovely", "invert", "sites")
#Other data can be viewed
trait.names(data)
env.names(data)
#Get assemblage phylogenies of all sites
assemblage.phylogenies(data)
#Add some trait/env data in
traits(data)$new.trait <- sample(letters, nrow(comm(data)), replace=TRUE)
env(data)$new.env <- sample(letters, ncol(comm(data)), replace=TRUE)
#Manipulate/check phylogeny and community matrix
phy(data) #...tree(data) works too...
comm(data)[1,3] <- 3
comm(data) <- comm(data)[-3,]
}
\seealso{
comparative.comm plot.comaparative.comm
}

