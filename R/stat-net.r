"%||%" <- function(a, b) {
  if (!is.null(a)) a else b
}



#' @export
StatNet <- ggplot2::ggproto("StatNet", ggplot2::Stat,
  required_aes = c("from_id", "to_id"),
  non_missing_aes = "weight",

  setup_params = function(data, params) {
#    print(str(params))

    params
  },

  setup_data = function(self, data, params) {
    browser()
    fiteach=params$fiteach

    # we want to keep all of the values that are NA in the second edge - give them a special value, so we can pull them out later
    levels <- levels(data$to_id)
    data$to_id <- as.character(data$to_id)
    data$to_id[is.na(data$to_id)] <- "..NA.."
    data$to_id <- factor(data$to_id, levels = c(levels, "..NA.."))

    if (fiteach) return(data)

    self$compute_network(data, layout=params$layout, layout.par=params$layout.par)
  },

compute_network = function(data, layout="kamadakawai", layout.par=list()) {
  browser()
  edges <- unique(subset(data, to_id != "..NA..")[,c('from_id', 'to_id')])

  net <- network::as.network(edges, matrix.type = "edgelist") #from network package
  m <- network::as.matrix.network.adjacency(net)

  #print("it would be nice at this point to check, whether layout is one of the supported functions, and if not,
  require(sna)
  layoutFun <- paste('gplot.layout.',layout,sep='')
  vert.coord <- data.frame(do.call(layoutFun, list(m, layout.par = layout.par)))

  vert.coord$label <- row.names(m)
  vert.coord$X1 <- scale(vert.coord$X1, center=min(vert.coord$X1), scale=diff(range(vert.coord$X1))) # center nodes
  vert.coord$X2 <- scale(vert.coord$X2, center=min(vert.coord$X2), scale=diff(range(vert.coord$X2)))
  names(vert.coord) <- c("x", "y", "label")

  edgelist <- network::as.matrix.network.edgelist(net) #network pkg
  edge.coord <- data.frame(vert.coord[edgelist[,1],], vert.coord[edgelist[,2],], row.names=NULL)
  names(edge.coord) <- c('x','y', "from", 'xend','yend', "to")

  fromto <- subset(data, to_id != "..NA..")
  edges <- merge(edge.coord, fromto, by.x=c("from", "to"), by.y=c("from_id", "to_id"), all=TRUE)

  fromonly <- subset(data, to_id == "..NA..")
  if (nrow(fromonly) > 0) {
    fromonly <- merge(fromonly, edge.coord[,c("xend", "yend", "to")], by.x = "from_id", by.y="to", all.x=T)
    fromonly <- transform(fromonly,
                          from = from_id, to=to_id,
                          x=xend, y=yend, xend=NA, yend=NA)

    edges <- rbind(edges, fromonly[, names(edges)])
  }
  edges
},
  compute_panel = function(self, data, scales, params, na.rm = FALSE,
                           layout="kamadakawai", layout.par=list(), fiteach=FALSE) {
 browser()
    if (fiteach) return(self$compute_network(data, layout=layout, layout.par=layout.par))

    data
  }
)

#' @rdname geom_net
#'
#' @return A data frame with additional columns:
#'   \item{x, y}{coordinates of the nodes, beginning of edges,}
#'   \item{xend, yend}{coordinates end points of edges.}
#' @export
stat_net <- function(mapping = NULL, data = NULL, geom = "point",
                     position = "identity", show.legend = NA,
                     inherit.aes = TRUE, layout="kamadakawai", layout.par=list(), fiteach=FALSE,
                     na.rm=FALSE, ...) {
  browser() 
  layer(
    stat = StatNet, data = data, mapping = mapping, geom = geom, position = position,
    show.legend = show.legend, inherit.aes = inherit.aes,
    params = list(layout=layout, layout.par=layout.par, fiteach=fiteach,
                  na.rm=na.rm, ...
    )
  )
}
