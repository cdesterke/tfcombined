#' @title tfcrcalc

#' Calculates transcription factor coregulation enrichment on the input human gene list
#' @param custom a vector of human gene symbol containing possible transcription factors
#' @usage custom<-c("GATA4","GTF2B","JUN","SOX9","SP1","NCOA1","TRERF1","ZNF653","NFYA","PROX1","SOX2","PIAS1","TBX19","SOX8","EDF1","PNRC2","PITX1","NRIP1","CXXC1","CTNNB1","AR")
#' @usage res<-tfcrcalc(custom)
#' @examples custom<-c("GATA4","GTF2B","JUN","SOX9","SP1","NCOA1","TRERF1","ZNF653","NFYA","PROX1","SOX2","PIAS1","TBX19","SOX8","EDF1","PNRC2","PITX1","NRIP1","CXXC1","CTNNB1","AR")
#' @examples res<-tfcrcalc(custom)
#' @examples res<-head(res,n=15)
#' @examples res




tfcrcalc<-function(custom){

	# load necessary packages

	data(genesplit)

	export <- names(genesplit)
	export <- as.data.frame(export)

	for(i in 1:length(genesplit)){
  		export$intersect[i]<-length(intersect(custom,genesplit[[i]]))}

	export$input<-length(custom)

	for(i in 1:length(genesplit)){
  		export$geneset[i]<-length(genesplit[[i]])}

	export$totaldb<-length(unique(unlist(genesplit)))


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
