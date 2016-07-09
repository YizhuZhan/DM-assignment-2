#设置工作路径
setwd('F:\\课件\数据挖掘2016\数据挖掘作业二\第二次作业')

#加载算法库
library("Matrix")
library("arules")

#读取数据，以Basket方式
tr<-read.transactions("F:\\课件\数据挖掘2016\数据挖掘作业二\第二次作业\Program\traindata.csv",format="basket",sep=",",rm.duplicates=TRUE)

#获得频繁项集
frequentsets=eclat(tr,parameter=list(support=0.1,maxlen=4))
summary(frequentsets)
inspect(frequentsets)  
#查看支持度最高的前20个频繁项集
inspect(sort(frequentsets,by="support")[1:20]) 

#抽取关联规则
rules = apriori(tr,parameter = list(support = 0.2,confidence = 0.6))
summary(rules) 
inspect(rules)
#inspect(sort(rules,by="support")[1:20])

#筛选右变元为幸存的规则子集
x=subset(rules,subset=rhs%in%"Survive")     
x
inspect(x)

#筛选右变元为死亡的规则子集
x=subset(rules,subset=rhs%in%"Dead")
x
inspect(x)

#根据支持度对求得的关联规则子集排序并察看
inspect(sort(x,by="support")[1:10])  

#根据置信度对求得的关联规则子集排序并察看
inspect(sort(x,by="confidence")[1:10]) 

#根据lift对求得的关联规则子集排序并察看
inspect(sort(x,by="lift")[1:10])   
itemFrequencyPlot(tr,support = 0.05,cex.names =0.8)   