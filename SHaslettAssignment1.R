library(dplyr)
table_data <- "https://archive.ics.uci.edu/ml/machine-learning-databases/mushroom/agaricus-lepiota.data"
mushroom_data <- read.table(table_data, sep=',', stringsAsFactors=FALSE)
head(mushroom_data)

mushroom_data <- mushroom_data %>%
  select(Type = V1, CapShape = V2, Population = V22, Habitat = V23)

lapply(mushroom_data, function(x) table(x))

mushroom_data <- mushroom_data %>%
  mutate(Type = recode(Type, p="poisonous", e="edible"),
         CapShape = recode(CapShape, b="bell", c="conical", x="convex", f="flat", k="knobbed", s="sunken"),
         Population = recode(Population, a="abundant", c="clustered", n="numerous", s="scattered", v="several", y="solitary"),
         Habitat = recode(Habitat, g="grasses", l="leaves", m="meadows", p="pathes", u="urban", w="waste", d="woods"))

head(mushroom_data)