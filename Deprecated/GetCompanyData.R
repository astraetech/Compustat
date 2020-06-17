library(data.table)
library(RPostgres)
setwd("C:/Users/Nathan/Downloads")
wrds = dbConnect(Postgres(),
                 host='wrds-pgdata.wharton.upenn.edu',
                 port=9737,
                 user='mordecai',
                 password='Yum7@7Yam',
                 dbname='wrds',
                 sslmode='require')
res <- dbSendQuery(wrds,"select GVKEY, COSTAT, SIC, CONM, COSTAT, FIC, LOC
                   from COMP.COMPANY")
# where DATAFMT='STD' and CONSOL='C' and POPSRC='D'") #INDFMT='INDL' and STD is unrestatd data
data.comp.company = dbFetch(res, n = -1)

companydata = data.table(data.comp.company)
# companydata[,gvkey:=as.integer(gvkey)]
# companydata[,sic:=as.integer(sic)]
# dldata = fread('Compustat/DownloadedLOCandSICdata.csv')
# check = companydata[mordecaisrawdata,on='gvkey',`:=`(hisloc=i.location,hissic=i.SIC)]
# check2 = dldata[companydata,on='gvkey',`:=`(companyloc=i.loc,companysic=i.sic,companyfic=i.fic)]
# check1diffs = check[loc!=hisloc|sic!=hissic]
# check2diffs = check2[loc!=companyloc|sic!=companysic|fic!=companyfic]