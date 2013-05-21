#Usage: R --vanilla -f custerGeneric dataFile centroidFile clusterMembershipFile sizeFile
args = commandArgs(trailingOnly=F)
matOrig = read.table(args[5],header=F,sep=" ")
col=length(matOrig[1,])
row=length(matOrig[,1])
matNorm=matOrig
#for(i in 1:col)
#{
    #matNorm[,i]=matNorm[,i]/mean(matNorm[,i])
    #matNorm[,i]=matNorm[,i]/max(matNorm[,i])
#}
source("funcMultiClustering.r")
k = 7
km=bestKmeans(matNorm,k)
#matCenters = km$centers
#for(i in 1:col)
#{
    #matCenters[,i]=matCenters[,i]*mean(matOrig[,i])
#}
#If you do not use transpose, i.e. t(), it prints column-wise
write(t(km$centers),file=args[6],ncolumns=col)
write(km$cluster,file=args[7], sep='\n')
write(km$size,file=args[8],ncolumns=k)