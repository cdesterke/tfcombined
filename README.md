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
res<-head(res,n=15)
plotes(res)

```
![es](https://github.com/cdesterke/tfcombined/blob/main/es.png)


### barplot of negative log10 p-values

```r
res<-head(res,n=15)
plotnlp(res)

```
![nlp](https://github.com/cdesterke/tfcombined/blob/main/nlp.png)


## network of enriched combinatorial transcription factors


### custom the network with some parameters

- cex parameter: change size of the vertex (nodes) label

- distance parameter: change the distance between the vertex and its label

- layout parameter: change the design of the network and have several options such as: (layout_as_star, layout_components, layout_in_circle, layout_nicely,layout_on_grid,
layout_on_sphere, layout_randomly, layout_with_dh, layout_with_drl, layout_with_fr, layout_with_gem,
layout_with_graphopt, layout_with_kk, layout_with_lgl, layout_with_mds)

output with nicely layout

```r
tfcrnet(custom,res,layout=layout_nicely,cex=1,distance=1.5)

```
![nicely](https://github.com/cdesterke/tfcombined/blob/main/netnicely.png)

output with star layout

```r
tfcrnet(custom,res,layout=layout_as_star,cex=1,distance=1.5)

```
![star](https://github.com/cdesterke/tfcombined/blob/main/netstar.png)




# REFERENCES

> Timothy Ravasi, Harukazu Suzuki, Carlo Vittorio Cannistraci, Shintaro Katayama, Vladimir B Bajic, Kai Tan, Altuna Akalin, Sebastian Schmeier, Mutsumi Kanamori-Katayama, Nicolas Bertin, Piero Carninci, Carsten O Daub, Alistair R R Forrest, Julian Gough, Sean Grimmond, Jung-Hoon Han, Takehiro Hashimoto, Winston Hide, Oliver Hofmann, Atanas Kamburov, Mandeep Kaur, Hideya Kawaji, Atsutaka Kubosaki, Timo Lassmann, Erik van Nimwegen, Cameron Ross MacPherson, Chihiro Ogawa, Aleksandar Radovanovic, Ariel Schwartz, Rohan D Teasdale, Jesper Tegnér, Boris Lenhard, Sarah A Teichmann, Takahiro Arakawa, Noriko Ninomiya, Kayoko Murakami, Michihira Tagami, Shiro Fukuda, Kengo Imamura, Chikatoshi Kai, Ryoko Ishihara, Yayoi Kitazume, Jun Kawai, David A Hume, Trey Ideker, Yoshihide Hayashizaki: Cell
. 2010 Mar 5;140(5):744-52. doi: 10.1016/j.cell.2010.01.044., An atlas of combinatorial transcriptional regulation in mouse and man (PMID: 20211142)

