# rcd

## rcd: regulated cell death R-package


## code to install rcd package
```r
library(devtools)
install_github("cdesterke/rcd")
```

## Over representation analysis

```r
library(rcd)
data(rcd)
custom<-c("CALR","KLRK1","HMGB1","HSPA1A","HSPA1B","HSPA1L","FLNA","FLNB","MYH9","TLN1","ACTB","MYL6","MYH10")
res<-over(custom,rcd)
res
```

![res](https://github.com/cdesterke/rcd/blob/main/over.png)



```r
plotscatter(res,x_min=-30,x_max=70,y_min=0,y_max=10,label=5,base=18)

```



![res](https://github.com/cdesterke/rcd/blob/main/scatter.png)


## Single sample gene set enrichment analysis

```r
data(matrix)
data(rcd)
ssres<-rcdscore(expr,rcd,method="zscore")
```




![res](https://github.com/cdesterke/rcd/blob/main/ssres.png)

```r
rcdheat(ssres,phenotype,scale="none",fontsize=10)
```


![res](https://github.com/cdesterke/rcd/blob/main/heatmap.png)



```r
rcdpca(ssres,phenotype,group="condition",scale=TRUE,fontsize=16)
```

![res](https://github.com/cdesterke/rcd/blob/main/pca.png)

# REFERENCES

> Wang X, Wang Q, Zhao J, Chen J, Wu R, Pan J, Li J, Wang Z, Chen Y, Guo W, Li Y. RCDdb: A manually curated database and analysis platform for regulated cell death. Comput Struct Biotechnol J. 2024 Aug 22;23:3211-3221. doi: 10.1016/j.csbj.2024.08.012. PMID: 39257527; PMCID: PMC11384979.

> Hänzelmann S, Castelo R, Guinney J. GSVA: gene set variation analysis for microarray and RNA-seq data. BMC Bioinformatics. 2013 Jan 16;14:7. doi: 10.1186/1471-2105-14-7. PMID: 23323831; PMCID: PMC3618321.
