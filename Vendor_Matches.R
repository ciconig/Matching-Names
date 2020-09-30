


Vendor.name = data.frame(DB_Vendor$V1)
names(Vendor.name)[names(Vendor.name)=="Vendor.Name"] = "name.vd"
Vendor.name$name.vd = as.character(Vendor.name$name.vd)
Vendor.name = unique(Vendor.name)

Units.name = data.frame(DB_Units$Name.Company)
names(Units.name)[names(Units.name)=="Units.Name"] = "name.Units"
Units.name$name.Units = as.character(Units.name$name.Units)
Units.name = unique(Units.name)

Vendor.name$V2 <- "" # Creating an empty column

Vendor1= str_c(Vendor.name$DB_Vendor.V1, collapse = "|")

for(i in 1:dim(Vendor.name)[1]) {
  x <- agrep(Vendor.name$DB_Vendor.V1[i], Units.name$DB_Units.Name.Company,
             ignore.case=TRUE, value=FALSE,
             max.distance = 0.05, useBytes = TRUE)
  x <- paste0(x,"")
  Vendor.name$name.Units[i] <- x
}

DB_Vendor$V3 = Vendor.name$name.Units
# encontrando as combinações de tipo 1
for(i in 1:dim(Vendor.name)[1]) {
  x <- agrep(Vendor.name$DB_Vendor.V1[i], Units.name$DB_Units.Name.Company,
             ignore.case=TRUE, value=FALSE,
             max.distance = 0.05, useBytes = TRUE)
  x <- paste0(x,"")
  Vendor.name$name.Units[i] <- x
  
}

Vendor.name$V2 <- "" # Creating an empty column

type1 = str_subset(Name.Company, V1.collapse)
type1.colap = str_c(type1, collapse = "|")

# Classificando combinações de tipo 2
for(i in 1:2023){
  if (type1.colap == Vendor.name$DB_Vendor.V1[i])
    Vendor.name$V2[i] = 1
}

# Classificando combinações do tipo 1
        
for (i in 1:2023){      
DB_Vendor$V2[i] = Vendor.name$V2[i]
DB_Vendor$V3[i] = Vendor.name$name.Units[i]
}

install.packages("xlsx")
library(xlsx)
write.xlsx(DB_Vendor, "c:/DB_Vendor.xls")
               