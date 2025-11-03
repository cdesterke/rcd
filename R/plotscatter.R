#' @title plotscatter

#' perform scatterplot of the rcd enrichment
#' @param res results of the rcd enrichment obtained by over function
#' @param x_min minimum for x axis
#' @param x_max maximum for x axis
#' @param y_min minimum for y axis
#' @param y_max maximum for y axis
#' @param label size of the labels
#' @param base base size of the ggplot
#' @usage custom<-c("CALR","KLRK1","HMGB1","HSPA1A","HSPA1B","HSPA1L","FLNA","FLNB","MYH9","TLN1","ACTB","MYL6","MYH10")
#' @usage load(rcd)
#' @usage geneset<-data(rcd)
#' @usage res<-over(custom,geneset)
#' @usage plotscatter(res,x_min=-10,x_max=70,y_min=0,y_max=10,label=5,base=18)
#' @examples load(rcd)
#' @examples geneset<-data(rcd)
#' @examples custom<-c("CALR","KLRK1","HMGB1","HSPA1A","HSPA1B","HSPA1L","FLNA","FLNB","MYH9","TLN1","ACTB","MYL6","MYH10")
#' @examples res<-over(custom,geneset)
#' @examples res<-head(res,n=15)
#' @examples res
#' @examples plotscatter(res,x_min=-10,x_max=70,y_min=0,y_max=10,label=5,base=18)


plotscatter<-function(res,x_min=-10,x_max=70,y_min=0,y_max=10,label=5,base=18){

		## load necessary packages
		  	if(!require(ggplot2)){
    				install.packages("ggplot2")
    			library(ggplot2)}

		## load necessary packages
		  	if(!require(dplyr)){
    				install.packages("dplyr")
    			library(dplyr)}

		## compute significance column
		res%>%mutate(significance=ifelse(qvalues<=0.05,"yes","no"))->res

		custom_colors <- c("yes" = "#E41A1C", "no" = "#377EB8") 

		## perform sctterplot
		p = ggplot(res, aes(x = ES, y = NLP, size = intersect, color = significance, label = family)) +
  		geom_point(alpha = 1) +
  		scale_color_manual(values = custom_colors) +
		geom_text(vjust = -0.8,hjust = 0.5, size = label) +
  		theme_minimal(base_size=base) +
  		xlim(x_min, x_max) +
		ylim(y_min, y_max) +
  		labs(
    			title = "Regulated Cell Death",
    			x = "Enrichment Score (ES)",
    			y = "Negative Log P-value (NLP)",
    			size = "Intersect",
    			color = "significance"
  		)

		return(p)
}









