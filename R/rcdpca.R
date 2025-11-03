#' @title rcdpca

#' @param ssres results obtained from rcdscore
#' @param phenotype phenotype file from tested samples
#' @param scale scaling TRUE or FALSE
#' @param fontsize size of the font on the graph
#' @param alpha dot transparency
#' @usage data(matrix)
#' @usage data(rcd)
#' @usage data(phenotype)
#' @usage ssres<-rcdscore(expr,rcd,method="zscore")
#' @usage rcdpca(ssres,phenotype,group="condition",scale=TRUE,fontsize=16)
#' @examples data(matrix)
#' @examples data(rcd)
#' @examples data(phenotype)
#' @examples ssres<-rcdscore(expr,rcd,method="zscore")
#' @examples rcdpca(ssres,phenotype,group="condition",scale=TRUE,fontsize=16)


rcdpca<-function(ssres,phenotype,group="condition",pal="Dark2",fontsize=16,scale=TRUE,alpha=1,names = FALSE,x=1,y=2){
  
  #install require R packages if necessary and load them
  if(!require(ggfortify)){
    install.packages("ggfortify")
    library(ggfortify)}
  if(!require(ggrepel)){
    install.packages("ggrepel")
    library(ggrepel)}
  
  # transpose data
  trans<-t(ssres)
  
  # perform PCA on transposed data
  pca<-prcomp(trans,scale=scale)
  
  # graphical output if names FALSE
  if(names==FALSE){
    autoplot(pca,data=phenotype,colour=group,label=F, label.size=0,size=4,alpha=alpha,x = x, y = y)+
      theme_classic(base_size = fontsize)+ scale_color_brewer(palette=pal)}
  
  # graphical output if names TRUE
  else{
    autoplot(pca,data=phenotype,colour=group,label=F, label.size=4,size=4,alpha=alpha,x = x, y = y)+
      theme_classic(base_size = 16)+ scale_color_brewer(palette=pal)+
      geom_text_repel(label = rownames(pheno))}
  
}
