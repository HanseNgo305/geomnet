#' Network of blood types
#'
#' A list of two datasets, vertices and edges, containing information on blood type (see \url{http://www.redcrossblood.org/learn-about-blood/blood-types}).
#' The variables are as follows:
#'
#' @format A list of two data frames:
#' \itemize{
#' \item the edges data set consists of three variables of length 27:
#' \itemize{
#'   \item from, to factor variables of blood types describing the relationship 'is compatible with'
#'   \item group_to factor variable with levels 'same' and 'diff' for same or different blood type group not regarding the rho-gam factor.
#' }
#' \item the vertices data set consists of five variables and 32 rows:
#' \itemize{
#'   \item label factor variable of blood types,
#'   \item type factor variable of blood type, not regarding the rhesus factor,
#'   \item rho factor variable: 'pos' and 'neg' describing the rhesus factor,
#'   \item Ethnicity factor variable of four variables: 'Caucasians', 'African.American', 'Hispanic', and 'Asian',
#'   \item Predominance numeric variable consisting of the percentage points of each blood type within each ethnicity.
#' }
#' }
"blood"

