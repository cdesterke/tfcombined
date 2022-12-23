# tfcombined


R package to perform a combinatorial human transcription factor network enrichment starting from a human gene list obtained for example by omics experiment.


### package installation
```r
library(devtools)
install_github("cdesterke/tfcombined")
```

### description

Starting from an imput human gene list obtained by omics experiments this tfcombined package allows to perform a combinatorial transcription factor enrichment.

- In a first step compare your input genelist to human TF-TF interaction database (Ravasi Timothy 2010). This initial step of enrichment performs with "tfcrcalc" function allows to output a result table with significance of enrichments. 

- In second step you could output your enrichment results in barplot for "enrichment scores with "plotes" function and for negative log10 p-values with "plotnlp" function. 

- In last step you can performed a combinatorial transcription factor network with Louvain communitie detection: fonction "tfcrnet". Significant families during the enrichment were represented with red edges and not significant families with gray edges. 

## code for processing analysis

```r
##define a human gene list
custom<-c("GATA4","GTF2B","JUN","SOX9","SP1","NCOA1","TRERF1","ZNF653","NFYA","PROX1","SOX2","PIAS1","TBX19","SOX8","EDF1","PNRC2","PITX1","NRIP1","CXXC1","CTNNB1","AR")
## calculates the GPCR family enrichments
res<-tfcrcalc(custom)
head(res,n=15)
```
![res](https://github.com/cdesterke/tfcombined/blob/main/res.png)


```r
plotes(res)

```
![es](https://github.com/cdesterke/tfcombined/blob/main/es.png)


### barplot of negative log10 p-values

```r
plotnlp(res)

```
![nlp](https://github.com/cdesterke/gpcr/blob/tfcombined/nlp.png)


## network of enriched
default parameters


