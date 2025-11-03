#' @title rcdscore

#' @param expr transcriptome matrix
#' @param rcd human genesets of rcd
#' @param rcdmm mus musculus genesets of rcd
#' @param method GSVA method of enrichment: "gsva", "ssgsea", "zscore", "plage"
#' @usage data(matrix)
#' @usage data(rcd)
#' @usage ssres<-rcdscore(expr,rcd,method="zscore")
#' @usage head(ssres[,1:6])
#' @examples data(matrix)
#' @examples data(rcd)
#' @examples ssres<-rcdscore(expr,rcd,method="zscore")
#' @examples head(ssres[,1:6])


rcdscore<-function(expr,rcd,method="zscore"){
 if(!require(GSVA))
   {if (!require("BiocManager", quietly = TRUE))
   install.packages("BiocManager")
   BiocManager::install("GSVA")}
  library(GSVA)
  
  data<-as.matrix(expr)

  if(method=="zscore"){
  param<-zscoreParam(data,rcd)
  results<-gsva(param)
  results<-as.data.frame(results)
  return(results)
  }
  else if(method=="gsva"){
  param<-gsvaParam(data,rcd)
  results<-gsva(param)
  results<-as.data.frame(results)
  return(results)
  }

  else if(method=="ssgsea"){
  param<-ssgseaParam(data,rcd)
  results<-gsva(param)
  results<-as.data.frame(results)
  return(results)
  }

  else if(method=="plage"){
  param<-plageParam(data,rcd)
  results<-gsva(param)
  results<-as.data.frame(results)
  return(results)
  }

  else{
  print("Input method is wrong ! (gsva, ssgsea, plage or zscore)")
  }

}
