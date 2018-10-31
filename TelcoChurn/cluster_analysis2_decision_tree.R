set.seed(1234214)

setwd("C:/Users/ecemapl/Google Drive/ERICSSON-2018/13. Ejercicios Prácticos/CHURN")
telco <- read.csv("WA_Fn-UseC_-Telco-Customer-Churn(1).csv")

n_total = dim(telco)[1]
n_train = n_total * .5

indices_totales = seq(1:n_total)
indices_train = sample(indices_totales, n_train)

telco_train = telco[indices_train,]

# interÃ©s: tenure, contract
library(dplyr)
library(dummies)

telco_train2 =
  telco_train %>%
  mutate(contract_num = scale(as.numeric(Contract)), 
         tenure_num = scale(as.numeric(tenure)),
         totalcharges_scale = scale(as.numeric(TotalCharges)),
         paper_num =as.numeric(PaperlessBilling),
         dependent_num =as.numeric(Dependents),
         churn =Churn)

df2 = dummy(telco_train2$PaymentMethod)
df3 = dummy(telco_train2$InternetService)

telco_train2 = cbind(telco_train2[,c("churn","paper_num",
                                     "contract_num","tenure_num",
                                     "totalcharges_scale","dependent_num")],df2)
telco_train2 =cbind(telco_train2,df3)

telco_train_dist  = dist(telco_train2)

# MDS

mds1 = cmdscale(telco_train_dist,eig=TRUE,k=5)
#mds

hc = hclust(telco_train_dist,method = "average")
plot(hc)

num_clusters=3
km1 = kmeans(mds1$points,centers=num_clusters,nstart = 25)
plot(mds1$points,pch=19,cex=4,col=km1$cluster)

for (i in 1:num_clusters){
  print(c("cluster",str(i)))
  print(nrow(telco_train[km1$cluster == i,])/n_train)
  print(table(telco_train[km1$cluster == i,]$Churn)/nrow(telco_train[km1$cluster == i,]))
}

################################################

library(rpart)
dt1 = rpart(telco_train$Churn~telco_train$PaperlessBilling+telco_train$Contract+telco_train$tenure+
              telco_train$TotalCharges+telco_train$Dependents,data=telco_train2[km1$cluster==3,])
library(rpart.plot)
library(rattle)
fancyRpartPlot(dt1)

