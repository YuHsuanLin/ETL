Qoo = read.table("ingre_dups.txt",sep=",")
library(dplyr)
str(Qoo)

Qoo$V3 = as.integer(as.character(Qoo$V3))
Qoo$V4 = as.integer(as.character(Qoo$V4))

Qxx = 
  Qoo %>% 
  group_by(V1) %>% 
  summarise(WeightMean = mean(V3,na.rm = T),
            KalMean = mean(V4, na.rm = T),
            PerGramMean = mean(V5, na.rm = T))

write.table(Qxx, "ingre_dups1.txt",sep=",",quote = F, row.names = F,
              col.names = F)
Qyy =
select(Qoo, V1, V2) %>% 
  filter(V2 != '') %>% 
  distinct(V1,V2)
write.table(Qxx, "ingre_units.txt",sep=",",quote = F, row.names = F,
            col.names = F)

write.table(inner_join(Qxx, Qyy), "joined.txt",sep=",",quote = F, row.names = F,
            col.names = F)