#' @title plotes

#' Draw the barplot of enrichment score for coregulated transcription factors
#' @param df a dataframe of results obtained with gpcrcalc function
#' @usage custom<-c("GATA4","GTF2B","JUN","SOX9","SP1","NCOA1","TRERF1","ZNF653","NFYA","PROX1","SOX2","PIAS1","TBX19","SOX8","EDF1","PNRC2","PITX1","NRIP1","CXXC1","CTNNB1","AR")
#' @usage res<-tfcrcalc(custom)
#' @usage plotes(res)
#' @examples custom<-c("GATA4","GTF2B","JUN","SOX9","SP1","NCOA1","TRERF1","ZNF653","NFYA","PROX1","SOX2","PIAS1","TBX19","SOX8","EDF1","PNRC2","PITX1","NRIP1","CXXC1","CTNNB1","AR")
#' @examples res<-tfcrcalc(custom)
#' @examples res<-head(res,n=15)
#' @examples plotes(res)


plotes<-function(res){

		## load necessary packages
		  	if(!require(ggplot2)){
    	install.packages("ggplot2")
    	library(ggplot2)}

			if(!require(pals)){
    	install.packages("pals")
    	library(pals)}

		## perform the barplot
		p=ggplot(data=res,aes(x=reorder(family,ES),y=ES,fill=family))+geom_bar(stat="identity")+
			coord_flip()+
			theme_minimal()+
			xlab("Combinatorial TF")+
			ylab("Enrichment score")+
			scale_fill_manual(values=cols25())+
			geom_text(aes(label=round(ES,2)),hjust=0, vjust=0.5,color="navy",position= position_dodge(0),size=5,angle=0)+
			ggtitle("") +theme(text = element_text(size = 16))+theme(legend.position="none")

		return(p)
}
