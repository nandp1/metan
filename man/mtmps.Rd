% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mtmps.R
\name{mtmps}
\alias{mtmps}
\title{Multi-trait mean performance and stability index}
\usage{
mtmps(model, SI = 15, mineval = 1, verbose = TRUE)
}
\arguments{
\item{model}{An object of class \code{mtmps}}

\item{SI}{An integer (0-100). The selection intensity in percentage of the
total number of genotypes.}

\item{mineval}{The minimum value so that an eigenvector is retained in the
factor analysis.}

\item{verbose}{If \code{verbose = TRUE} (Default), some results are shown in the
console.}
}
\value{
An object of class \code{mtmps} with the following items:
\itemize{
\item \strong{data} The data used to compute the factor analysis.
\item \strong{cormat} The correlation matrix among the environments.
\item \strong{PCA} The eigenvalues and explained variance.
\item \strong{FA} The factor analysis.
\item \strong{KMO} The result for the Kaiser-Meyer-Olkin test.
\item \strong{MSA} The measure of sampling adequacy for individual variable.
\item \strong{communalities} The communalities.
\item \strong{communalities_mean} The communalities' mean.
\item \strong{initial_loadings} The initial loadings.
\item \strong{finish_loadings} The final loadings after varimax rotation.
\item \strong{canonical_loadings} The canonical loadings.
\item \strong{scores_gen} The scores for genotypes in all retained factors.
\item \strong{scores_ide} The scores for the ideotype in all retained factors.
\item \strong{MTSI} The multi-trait mean performance and stability index.
\item \strong{contri_fac} The relative contribution of each factor on the MTSI
value. The lower the contribution of a factor, the close of the ideotype the
variables in such factor are.
\item \strong{contri_fac_rank, contri_fac_rank_sel} The rank for the contribution
of each factor for all genotypes and selected genotypes, respectively.
\item \strong{sel_dif_trait, sel_dif_stab, sel_dif_mps} A data frame containing the
selection differential (gains) for the mean performance, stability index, and
mean performance and stability index, respectively. The following variables
are shown.
\itemize{
\item \code{VAR}: the trait's name.
\item \code{Factor}: The factor that traits where grouped into.
\item \code{Xo}: The original population mean.
\item \code{Xs}: The mean of selected genotypes.
\item \code{SD} and \code{SDperc}: The selection differential and selection differential in
percentage, respectively.
\item \code{h2}: The broad-sense heritability.
\item \code{SG} and \code{SGperc}: The selection gains and selection gains in percentage,
respectively.
\item \code{sense}: The desired selection sense.
\item \code{goal}: selection gains match desired sense? 100 for yes and 0 for no.
}
\item \strong{stat_dif_trait, stat_dif_stab, stat_dif_mps} A data frame with the
descriptive statistic for the selection gains for the mean performance,
stability index, and mean performance and stability index, respectively. The
following columns are shown by sense.
\itemize{
\item \code{sense}: The desired selection sense.
\item \code{variable}: the trait's name.
\item \code{min}: the minimum value for the selection gain.
\item \code{mean}: the mean value for the selection gain.
\item \code{ci}: the confidence interval for the selection gain.
\item \code{sd.amo}: the standard deviation for the selection gain.
\item \code{max}: the maximum value for the selection gain.
\item \code{sum}: the sum of the selection gain.
}
\item \strong{sel_gen} The selected genotypes.
}
}
\description{
\ifelse{html}{\href{https://lifecycle.r-lib.org/articles/stages.html#experimental}{\figure{lifecycle-experimental.svg}{options: alt='[Experimental]'}}}{\strong{[Experimental]}}

Computes the multi-trait stability index proposed by Olivoto et al. (2019)
considering different parametric and non-parametric stability indexes.
}
\examples{
\donttest{
library(metan)
# The same approach as mtsi()
# mean performance and stability for GY and HM
# mean performance: The genotype's BLUP
# stability: the WAASB index (lower is better)
# weights: equal for mean performance and stability

model <-
mps(data_ge,
    env = ENV,
    gen = GEN,
    rep = REP,
    resp = everything())
selection <- mtmps(model)

# gains for stability
selection$sel_dif_stab

# gains for mean performance
selection$sel_dif_trait
}
}
\references{
Olivoto, T., A.D.C. L{\'{u}}cio, J.A.G. da silva, B.G. Sari, and
M.I. Diel. 2019. Mean performance and stability in multi-environment trials
II: Selection based on multiple traits. Agron. J. 111:2961-2969.
\doi{10.2134/agronj2019.03.0220}
}
\seealso{
\code{\link[=mgidi]{mgidi()}}, \code{\link[=mps]{mps()}}, \code{\link[=get_model_data]{get_model_data()}}
}
\author{
Tiago Olivoto \email{tiagoolivoto@gmail.com}
}
