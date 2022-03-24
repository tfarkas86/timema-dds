rm(list=ls())
library(reshape2)
mrd <- read.csv("~/Dropbox/Projects/DDSelection/Data/mark_recap_2004.csv")
mrd$t0 <- rep(1, nrow(mrd))

t0m <- xtabs(t0 ~ replicate + color, data=mrd, sparse=FALSE)
t1m <- xtabs(recap1~ replicate + color, data=mrd)
t2m <- xtabs(recap2 ~ replicate + color, data=mrd)
t3m <- xtabs(recap3 ~ replicate + color, data=mrd)
t4m <- xtabs(recap4 ~ replicate + color, data=mrd)

t0m <- as.data.frame.matrix(t0m)
t1m <- as.data.frame.matrix(t1m)
t2m <- as.data.frame.matrix(t2m)
t3m <- as.data.frame.matrix(t3m)
t4m <- as.data.frame.matrix(t4m)

t0m$gPro.i_isG <- rowSums(t0m[,1:2])/rowSums(t0m[,1:3])
t0m$gPro.i_isS <- t0m$G/rowSums(t0m[,1:3])
t0m$gPro.i_isX <- t0m$G/rowSums(t0m[,c(1,3)])


t1m$gPro.i_isG <- rowSums(t1m[,1:2])/rowSums(t1m[,1:3])
t1m$gPro.i_isS <- t1m$G/rowSums(t1m[,1:3])
t1m$gPro.i_isX <- t1m$G/rowSums(t1m[,c(1,3)])


t2m$gPro.i_isG <- rowSums(t2m[,1:2])/rowSums(t2m[,1:3])
t2m$gPro.i_isS <- t2m$G/rowSums(t2m[,1:3])
t2m$gPro.i_isX <- t2m$G/rowSums(t2m[,c(1,3)])

tsm <- t0m-t1m
tsm2 <- t0m-t2m
