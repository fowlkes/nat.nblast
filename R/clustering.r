#' Cluster a set of neurons
#'
#' Given a vector of neuron identifiers use hclust to carry out a
#' hierarchical clustering. The default value of distfun will handle square
#' distance matrices and R.
#' @param neuron_names character vector of neuron identifiers.
#' @param method clustering method (default Ward's).
#' @param scoremat score matrix to use (see \code{sub_score_mat} for details of
#'   default).
#' @param distfun function to convert distance matrix returned by
#'   \code{sub_dist_mat} into R dist object (default=as.dist).
#' @param ... additional parameters passed to hclust.
#' @inheritParams sub_dist_mat
#' @return An object of class \code{\link{hclust}} which describes the tree
#'   produced by the clustering process.
#' @export
#' @family scoremats
#' @seealso \code{\link{hclust}, \link{dist}}
#' @examples
#' \dontrun{
#' data(kcs20, package='nat')
#' hckcs=hclustn(names(kcs20))
#' # dividide hclust object into 3 groups
#' library(dendroextras)
#' plot(colour_clusters(hckcs, k=3))
#' # 3d plot of neurons in those clusters (with matching colours)
#' library(nat)
#' plot3d(hckcs, k=3, db=kcs20)
#' # names of neurons in 3 groups
#' subset(hckcs, k=3)
#' }
hclustn <- function(neuron_names, method='ward', scoremat=NULL, distfun=as.dist, ..., maxneurons=4000) {
  subdistmat <- sub_dist_mat(neuron_names, scoremat, maxneurons=maxneurons)
  if(min(subdistmat) < 0)
    stop("Negative distances not allowed. Are you sure this is a distance matrix?")
  hclust(as.dist(subdistmat), method=method, ...)
}
