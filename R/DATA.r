#' Scoring matrices for neuron similarities in FCWB template brain
#'
#' Scoring matrices quantify the log2 odds ratio that a segment pair with a
#' given distance and absolute dot product come from a pair of neurons of the
#' same type, rather than unrelated neurons.
#'
#' These scoring matrices were generated using all by all pairs from 150 DL2
#' antennal lobe projection neurons from the \url{http://flycircuit.tw} dataset
#' and 5000 random pairs from the same dataset.
#'
#' \itemize{
#'
#' \item \code{smat} was trained using nearest-neighbour distance and the
#' tangent vector defined by the first eigen vector of the k=5 nearest
#' neighbours.
#'
#' \item \code{smat_alpha} was defined as for \code{smat} but weighted by the
#' factor \code{alpha} defined as (l1-l2)/(l1+l2+l3) where l1,l2,l3 are the
#' three eigen values.
#'
#' }
#'
#' Most work on the flyircuit dataset has been carried out using the \code{smat}
#' scoring matrix although the \code{smat_alpha} matrix which emphasises the
#' significance of matches between linear regions of the neuron (such as axons)
#' may have some advantages.
#'
#' @name smat
#' @aliases smat_alpha
#' @docType data
NULL
