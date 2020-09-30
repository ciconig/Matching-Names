# Pacote para trabalhar Strings

install.packages("stringr")
library(stringr)

# Vetor com os nomes de DB_Units
Names_Company = str_to_upper(DB_Units$Name.Company)

# Vetor com os nomes de DB_Vendor
v1 = (DB_Units$Name.Company)
V1.collapse = str_c(DB_Vendor$V1, collapse = "|")

Names_Company1 = str_c(Names_Company, collapse = "|")

# Vetor contendo matches do tipo 1 = nomes identicos
type1_match = str_subset(Names.Company, V1.collapse)

install.packages("stringi")
library(stringi)

#type2_match = agrep(Names_Company1,v1, ignore.case = TRUE,
#                   value = TRUE, fixed = FALSE, max.distance = 2)