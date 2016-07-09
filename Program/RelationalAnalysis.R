#���ù���·��
setwd('F:\\�μ�\�����ھ�2016\�����ھ���ҵ��\�ڶ�����ҵ')

#�����㷨��
library("Matrix")
library("arules")

#��ȡ���ݣ���Basket��ʽ
tr<-read.transactions("F:\\�μ�\�����ھ�2016\�����ھ���ҵ��\�ڶ�����ҵ\Program\traindata.csv",format="basket",sep=",",rm.duplicates=TRUE)

#���Ƶ���
frequentsets=eclat(tr,parameter=list(support=0.1,maxlen=4))
summary(frequentsets)
inspect(frequentsets)  
#�鿴֧�ֶ���ߵ�ǰ20��Ƶ���
inspect(sort(frequentsets,by="support")[1:20]) 

#��ȡ��������
rules = apriori(tr,parameter = list(support = 0.2,confidence = 0.6))
summary(rules) 
inspect(rules)
#inspect(sort(rules,by="support")[1:20])

#ɸѡ�ұ�ԪΪ�Ҵ�Ĺ����Ӽ�
x=subset(rules,subset=rhs%in%"Survive")     
x
inspect(x)

#ɸѡ�ұ�ԪΪ�����Ĺ����Ӽ�
x=subset(rules,subset=rhs%in%"Dead")
x
inspect(x)

#����֧�ֶȶ���õĹ��������Ӽ����򲢲쿴
inspect(sort(x,by="support")[1:10])  

#�������Ŷȶ���õĹ��������Ӽ����򲢲쿴
inspect(sort(x,by="confidence")[1:10]) 

#����lift����õĹ��������Ӽ����򲢲쿴
inspect(sort(x,by="lift")[1:10])   
itemFrequencyPlot(tr,support = 0.05,cex.names =0.8)   