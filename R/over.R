#' @title over

#' Calculates regulated cell death (rcd) enrichment on the input custom gene list
#' @param custom a vector of gene symbol containing possible rcd molecules
#' @usage custom<-c("CALR","KLRK1","HMGB1","HSPA1A","HSPA1B","HSPA1L","FLNA","FLNB","MYH9","TLN1","ACTB","MYL6","MYH10")
#' @usage load(rcd)
#' @usage geneset<-data(rcd)
#' @usage res<-over(custom,geneset)
#' @examples load(rcd)
#' @examples geneset<-data(rcd)
#' @examples custom<-c("CALR","KLRK1","HMGB1","HSPA1A","HSPA1B","HSPA1L","FLNA","FLNB","MYH9","TLN1","ACTB","MYL6","MYH10")
#' @examples res<-over(custom,geneset)
#' @examples res<-head(res,n=15)
#' @examples res




over<-function(custom,geneset){

	# load necessary packages

	export <- names(geneset)
	export <- as.data.frame(export)

	for(i in 1:length(geneset)){
  		export$intersect[i]<-length(intersect(custom,geneset[[i]]))}

	export$input<-length(custom)

	for(i in 1:length(geneset)){
  		export$geneset[i]<-length(geneset[[i]])}

	export$totaldb<-length(unique(unlist(geneset)))


	export<-export[(export$intersect != "0"),]
	df<-export[with(export,order(-intersect)),]

	row.names(df)<-df$export
	df$export<-NULL

	res1 <- NULL
	for (i in 1:nrow(df)){
  		table <- matrix(c(df[i,1], df[i,2], df[i,3], df[i,4]), ncol = 2, byrow = TRUE)
  		o <- fisher.test(table, alternative="two.sided")$estimate
  		# save all odds in a vector
  		res1 <- c(res1,o)
	}

	df$ES <- res1


	res2 <- NULL
	for (i in 1:nrow(df)){
  		table <- matrix(c(df[i,1], df[i,2], df[i,3], df[i,4]), ncol = 2, byrow = TRUE)
  		p <- fisher.test(table, alternative="two.sided")$p.value
  		# save all p values in a vector
  	res2 <- c(res2,p)
	}

	df$pvalues <- res2


	df$qvalues<-p.adjust(df$pvalues,method="fdr")


	df<-df[with(df,order(pvalues)),]
	###df<-df[(df$pvalues <= 0.05),] #filtration not necessary

	df$family<-row.names(df)
	df$NLP= -log(df$pvalues,10)
	
	return(df)
}