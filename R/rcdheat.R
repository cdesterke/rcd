#' @title rcdheat

#' @param ssres results obtained from rcdscore
#' @param phenotype phenotype file from tested samples
#' @param scale method of scaling "none" "row" "column"
#' @param fontsize size of the font on the graph
#' @usage data(matrix)
#' @usage data(rcd)
#' @usage data(phenotype)
#' @usage ssres<-rcdscore(expr,rcd,method="zscore")
#' @usage rcdheat(ssres,phenotype,scale="none",fontsize=10)
#' @examples data(matrix)
#' @examples data(rcd)
#' @examples data(phenotype)
#' @examples ssres<-rcdscore(expr,rcd,method="zscore")
#' @examples rcdheat(ssres,phenotype,scale="none",fontsize=10)



rcdheat<-function(ssres,phenotype,scale="none",fontsize=10){
  if(!require(pheatmap)){install.packages("pheatmap")}
  library(pheatmap)

  pheatmap(ssres,method="ward.D2",scale=scale, clustering_distance_cols = "euclidean",
		annotation=phenotype,clustering_distance_rows = "euclidean",
		cluster_cols=FALSE,show_colnames=F, fontsize = fontsize,
           	color = colorRampPalette(c("royalblue1", "white", "firebrick4"))(50))
}

