# Read the datasets
df_macro <- read.csv("df_macro.csv")
df_meso <- read.csv("df_meso.csv")
df_dependent_variables = read.csv("df_dependent_variables.csv") 

# Working on local component - Macroscopic characteristics
y = df_dependent_variables$Mean.LocalComponent

# 1. Average Distance
x_Averagedistance = df_macro$Average.Distance
simple_lr = lm(y ~  x_Averagedistance)
summary(simple_lr)
u_hat <- resid(simple_lr)
log_u_hat = log((u_hat)^2)
reg_u_hat = lm(log_u_hat ~  x_Averagedistance)
g_hat = fitted(reg_u_hat)
h_hat = exp(g_hat)
w = 1/h_hat
simple_lr_fgls = lm(y ~  x_Averagedistance, weight = w)
confint(simple_lr_fgls)
summary(simple_lr_fgls)

# 2. Density
x_Density = df_macro$Density  
simple_lr = lm(y ~  x_Density)
summary(simple_lr)
u_hat <- resid(simple_lr)
log_u_hat = log((u_hat)^2)
reg_u_hat = lm(log_u_hat ~  x_Density)
g_hat = fitted(reg_u_hat)
h_hat = exp(g_hat)
w = 1/h_hat
simple_lr_fgls = lm(y ~  x_Density, weight = w)
confint(simple_lr_fgls)
summary(simple_lr_fgls)

# 3. Transitivity
x_Transitivity = df_macro$Transitivity 
simple_lr = lm(y ~  x_Transitivity)
summary(simple_lr)
u_hat <- resid(simple_lr)
log_u_hat = log((u_hat)^2)
reg_u_hat = lm(log_u_hat ~  x_Transitivity)
g_hat = fitted(reg_u_hat)
h_hat = exp(g_hat)
w = 1/h_hat
simple_lr_fgls = lm(y ~  x_Transitivity, weight = w)
confint(simple_lr_fgls)
summary(simple_lr_fgls)

# 4. Assortativity
x_Assortativity = df_macro$Assortativity  
simple_lr = lm(y ~  x_Assortativity)
summary(simple_lr)
u_hat <- resid(simple_lr)
log_u_hat = log((u_hat)^2)
reg_u_hat = lm(log_u_hat ~  x_Assortativity)
g_hat = fitted(reg_u_hat)
h_hat = exp(g_hat)
w = 1/h_hat
simple_lr_fgls = lm(y ~  x_Assortativity, weight = w)
confint(simple_lr_fgls)
summary(simple_lr_fgls)


# 5. Diameter 
x_Diameter = df_macro$Diameter
simple_lr = lm(y ~  x_Diameter)
summary(simple_lr)
u_hat <- resid(simple_lr)
log_u_hat = log((u_hat)^2)
reg_u_hat = lm(log_u_hat ~  x_Diameter)
g_hat = fitted(reg_u_hat)
h_hat = exp(g_hat)
w = 1/h_hat
simple_lr_fgls = lm(y ~  x_Diameter, weight = w)
confint(simple_lr_fgls)
summary(simple_lr_fgls)


# 6. Efficiency
x_Efficiency = df_macro$Efficiency 
simple_lr = lm(y ~  x_Efficiency)
summary(simple_lr)
u_hat <- resid(simple_lr)
log_u_hat = log((u_hat)^2)
reg_u_hat = lm(log_u_hat ~  x_Efficiency)
g_hat = fitted(reg_u_hat)
h_hat = exp(g_hat)
w = 1/h_hat
simple_lr_fgls = lm(y ~  x_Efficiency, weight = w)
confint(simple_lr_fgls)
summary(simple_lr_fgls)



# Working on local component - Mesoscopic characteristics
# 1. Mixing parameter
x_Mixingparameter = df_meso$Mixing.parameter 
simple_lr = lm(y ~  x_Mixingparameter)
summary(simple_lr)
u_hat <- resid(simple_lr)
log_u_hat = log((u_hat)^2)
reg_u_hat = lm(log_u_hat ~  x_Mixingparameter)
g_hat = fitted(reg_u_hat)
h_hat = exp(g_hat)
w = 1/h_hat
simple_lr_fgls = lm(y ~  x_Mixingparameter, weight = w)
confint(simple_lr_fgls)
summary(simple_lr_fgls)

# 2. Modularity 
x_Modularity = df_meso$Modularity
simple_lr = lm(y ~  x_Modularity)
summary(simple_lr)
u_hat <- resid(simple_lr)
log_u_hat = log((u_hat)^2)
reg_u_hat = lm(log_u_hat ~  x_Modularity)
g_hat = fitted(reg_u_hat)
h_hat = exp(g_hat)
w = 1/h_hat
simple_lr_fgls = lm(y ~  x_Modularity, weight = w)
confint(simple_lr_fgls)
summary(simple_lr_fgls)


# 3. Internal distance 
x_Internaldistance = df_meso$Avg.Distance
simple_lr = lm(y ~  x_Internaldistance)
summary(simple_lr)
u_hat <- resid(simple_lr)
log_u_hat = log((u_hat)^2)
reg_u_hat = lm(log_u_hat ~  x_Internaldistance)
g_hat = fitted(reg_u_hat)
h_hat = exp(g_hat)
w = 1/h_hat
simple_lr_fgls = lm(y ~  x_Internaldistance, weight = w)
confint(simple_lr_fgls)
summary(simple_lr_fgls)

# 4. Internal density 
x_Internaldensity = df_meso$Avg.internal.density
simple_lr = lm(y ~  x_Internaldensity)
summary(simple_lr)
u_hat <- resid(simple_lr)
log_u_hat = log((u_hat)^2)
reg_u_hat = lm(log_u_hat ~  x_Internaldensity)
g_hat = fitted(reg_u_hat)
h_hat = exp(g_hat)
w = 1/h_hat
simple_lr_fgls = lm(y ~  x_Internaldensity, weight = w)
confint(simple_lr_fgls)
summary(simple_lr_fgls)


# 5. Max-ODF
x_MaxODF = df_meso$Max.ODF
simple_lr = lm(y ~  x_MaxODF)
summary(simple_lr)
u_hat <- resid(simple_lr)
log_u_hat = log((u_hat)^2)
reg_u_hat = lm(log_u_hat ~  x_MaxODF)
g_hat = fitted(reg_u_hat)
h_hat = exp(g_hat)
w = 1/h_hat
simple_lr_fgls = lm(y ~  x_MaxODF, weight = w)
confint(simple_lr_fgls)
summary(simple_lr_fgls)

# 6. Average-ODF
x_AverageODF = df_meso$Avg.ODF
simple_lr = lm(y ~  x_AverageODF)
summary(simple_lr)
u_hat <- resid(simple_lr)
log_u_hat = log((u_hat)^2)
reg_u_hat = lm(log_u_hat ~  x_AverageODF)
g_hat = fitted(reg_u_hat)
h_hat = exp(g_hat)
w = 1/h_hat
simple_lr_fgls = lm(y ~  x_AverageODF, weight = w)
confint(simple_lr_fgls)
summary(simple_lr_fgls)

# 7. Flake-ODF
x_FlakeODF = df_meso$Flake.out.ODF
simple_lr = lm(y ~  x_FlakeODF)
summary(simple_lr)
u_hat <- resid(simple_lr)
log_u_hat = log((u_hat)^2)
reg_u_hat = lm(log_u_hat ~  x_FlakeODF)
g_hat = fitted(reg_u_hat)
h_hat = exp(g_hat)
w = 1/h_hat
simple_lr_fgls = lm(y ~  x_FlakeODF, weight = w)
confint(simple_lr_fgls)
summary(simple_lr_fgls)


# 8. Embeddedness
x_Embeddedness = df_meso$Avg.Embeddedness
simple_lr = lm(y ~  x_Embeddedness)
summary(simple_lr)
u_hat <- resid(simple_lr)
log_u_hat = log((u_hat)^2)
reg_u_hat = lm(log_u_hat ~  x_Embeddedness)
g_hat = fitted(reg_u_hat)
h_hat = exp(g_hat)
w = 1/h_hat
simple_lr_fgls = lm(y ~  x_Embeddedness, weight = w)
confint(simple_lr_fgls)
summary(simple_lr_fgls)

# 9. Hub dominance
x_Hubdominance = df_meso$Avg.Hub.Dominance
simple_lr = lm(y ~  x_Hubdominance)
summary(simple_lr)
u_hat <- resid(simple_lr)
log_u_hat = log((u_hat)^2)
reg_u_hat = lm(log_u_hat ~  x_Hubdominance)
g_hat = fitted(reg_u_hat)
h_hat = exp(g_hat)
w = 1/h_hat
simple_lr_fgls = lm(y ~  x_Hubdominance, weight = w)
confint(simple_lr_fgls)
summary(simple_lr_fgls)


# Working on global component - Macroscopic characteristics
y = df_dependent_variables$Mean.GlobalComponent

# 1. Average Distance
x_Averagedistance = df_macro$Average.Distance
simple_lr = lm(y ~  x_Averagedistance)
summary(simple_lr)
u_hat <- resid(simple_lr)
log_u_hat = log((u_hat)^2)
reg_u_hat = lm(log_u_hat ~  x_Averagedistance)
g_hat = fitted(reg_u_hat)
h_hat = exp(g_hat)
w = 1/h_hat
simple_lr_fgls = lm(y ~  x_Averagedistance, weight = w)
confint(simple_lr_fgls)
summary(simple_lr_fgls)

# 2. Density
x_Density = df_macro$Density
simple_lr = lm(y ~  x_Density)
summary(simple_lr)
u_hat <- resid(simple_lr)
log_u_hat = log((u_hat)^2)
reg_u_hat = lm(log_u_hat ~  x_Density)
g_hat = fitted(reg_u_hat)
h_hat = exp(g_hat)
w = 1/h_hat
simple_lr_fgls = lm(y ~  x_Density, weight = w)
confint(simple_lr_fgls)
summary(simple_lr_fgls)

# 3. Transitivity
x_Transitivity = df_macro$Transitivity
simple_lr = lm(y ~  x_Transitivity)
summary(simple_lr)
u_hat <- resid(simple_lr)
log_u_hat = log((u_hat)^2)
reg_u_hat = lm(log_u_hat ~  x_Transitivity)
g_hat = fitted(reg_u_hat)
h_hat = exp(g_hat)
w = 1/h_hat
simple_lr_fgls = lm(y ~  x_Transitivity, weight = w)
confint(simple_lr_fgls)
summary(simple_lr_fgls)

# 4. Assortativity
x_Assortativity = df_macro$Assortativity
simple_lr = lm(y ~  x_Assortativity)
summary(simple_lr)
u_hat <- resid(simple_lr)
log_u_hat = log((u_hat)^2)
reg_u_hat = lm(log_u_hat ~  x_Assortativity)
g_hat = fitted(reg_u_hat)
h_hat = exp(g_hat)
w = 1/h_hat
simple_lr_fgls = lm(y ~  x_Assortativity, weight = w)
confint(simple_lr_fgls)
summary(simple_lr_fgls)


# 5. Diameter
x_Diameter = df_macro$Diameter
simple_lr = lm(y ~  x_Diameter)
summary(simple_lr)
u_hat <- resid(simple_lr)
log_u_hat = log((u_hat)^2)
reg_u_hat = lm(log_u_hat ~  x_Diameter)
g_hat = fitted(reg_u_hat)
h_hat = exp(g_hat)
w = 1/h_hat
simple_lr_fgls = lm(y ~  x_Diameter, weight = w)
confint(simple_lr_fgls)
summary(simple_lr_fgls)


# 6. Efficiency
x_Efficiency = df_macro$Efficiency
simple_lr = lm(y ~  x_Efficiency)
summary(simple_lr)
u_hat <- resid(simple_lr)
log_u_hat = log((u_hat)^2)
reg_u_hat = lm(log_u_hat ~  x_Efficiency)
g_hat = fitted(reg_u_hat)
h_hat = exp(g_hat)
w = 1/h_hat
simple_lr_fgls = lm(y ~  x_Efficiency, weight = w)
confint(simple_lr_fgls)
summary(simple_lr_fgls)


# Working on local component - Mesoscopic characteristics
# 1. Mixing parameter
x_Mixingparameter = df_meso$Mixing.parameter
simple_lr = lm(y ~  x_Mixingparameter)
summary(simple_lr)
u_hat <- resid(simple_lr)
log_u_hat = log((u_hat)^2)
reg_u_hat = lm(log_u_hat ~  x_Mixingparameter)
g_hat = fitted(reg_u_hat)
h_hat = exp(g_hat)
w = 1/h_hat
simple_lr_fgls = lm(y ~  x_Mixingparameter, weight = w)
confint(simple_lr_fgls)
summary(simple_lr_fgls)

# 2. Modularity
x_Modularity = df_meso$Modularity
simple_lr = lm(y ~  x_Modularity)
summary(simple_lr)
u_hat <- resid(simple_lr)
log_u_hat = log((u_hat)^2)
reg_u_hat = lm(log_u_hat ~  x_Modularity)
g_hat = fitted(reg_u_hat)
h_hat = exp(g_hat)
w = 1/h_hat
simple_lr_fgls = lm(y ~  x_Modularity, weight = w)
confint(simple_lr_fgls)
summary(simple_lr_fgls)


# 3. Internal distance
x_Internaldistance = df_meso$Avg.Distance
simple_lr = lm(y ~  x_Internaldistance)
summary(simple_lr)
u_hat <- resid(simple_lr)
log_u_hat = log((u_hat)^2)
reg_u_hat = lm(log_u_hat ~  x_Internaldistance)
g_hat = fitted(reg_u_hat)
h_hat = exp(g_hat)
w = 1/h_hat
simple_lr_fgls = lm(y ~  x_Internaldistance, weight = w)
confint(simple_lr_fgls)
summary(simple_lr_fgls)

# 4. Internal density
x_Internaldensity = df_meso$Avg.internal.density
simple_lr = lm(y ~  x_Internaldensity)
summary(simple_lr)
u_hat <- resid(simple_lr)
log_u_hat = log((u_hat)^2)
reg_u_hat = lm(log_u_hat ~  x_Internaldensity)
g_hat = fitted(reg_u_hat)
h_hat = exp(g_hat)
w = 1/h_hat
simple_lr_fgls = lm(y ~  x_Internaldensity, weight = w)
confint(simple_lr_fgls)
summary(simple_lr_fgls)


# 5. Max-ODF
x_MaxODF = df_meso$Max.ODF
simple_lr = lm(y ~  x_MaxODF)
summary(simple_lr)
u_hat <- resid(simple_lr)
log_u_hat = log((u_hat)^2)
reg_u_hat = lm(log_u_hat ~  x_MaxODF)
g_hat = fitted(reg_u_hat)
h_hat = exp(g_hat)
w = 1/h_hat
simple_lr_fgls = lm(y ~  x_MaxODF, weight = w)
confint(simple_lr_fgls)
summary(simple_lr_fgls)

# 6. Average-ODF
x_AverageODF = df_meso$Avg.ODF
simple_lr = lm(y ~  x_AverageODF)
summary(simple_lr)
u_hat <- resid(simple_lr)
log_u_hat = log((u_hat)^2)
reg_u_hat = lm(log_u_hat ~  x_AverageODF)
g_hat = fitted(reg_u_hat)
h_hat = exp(g_hat)
w = 1/h_hat
simple_lr_fgls = lm(y ~  x_AverageODF, weight = w)
confint(simple_lr_fgls)
summary(simple_lr_fgls)


# 7. Flake-ODF
x_FlakeODF = df_meso$Flake.out.ODF
simple_lr = lm(y ~  x_FlakeODF)
summary(simple_lr)
u_hat <- resid(simple_lr)
log_u_hat = log((u_hat)^2)
reg_u_hat = lm(log_u_hat ~  x_FlakeODF)
g_hat = fitted(reg_u_hat)
h_hat = exp(g_hat)
w = 1/h_hat
simple_lr_fgls = lm(y ~  x_FlakeODF, weight = w)
confint(simple_lr_fgls)
summary(simple_lr_fgls)


# 8. Embeddedness
x_Embeddedness = df_meso$Avg.Embeddedness
simple_lr = lm(y ~  x_Embeddedness)
summary(simple_lr)
u_hat <- resid(simple_lr)
log_u_hat = log((u_hat)^2)
reg_u_hat = lm(log_u_hat ~  x_Embeddedness)
g_hat = fitted(reg_u_hat)
h_hat = exp(g_hat)
w = 1/h_hat
simple_lr_fgls = lm(y ~  x_Embeddedness, weight = w)
confint(simple_lr_fgls)
summary(simple_lr_fgls)

# 9. Hub dominance
x_Hubdominance = df_meso$Avg.Hub.Dominance
simple_lr = lm(y ~  x_Hubdominance)
summary(simple_lr)
u_hat <- resid(simple_lr)
log_u_hat = log((u_hat)^2)
reg_u_hat = lm(log_u_hat ~  x_Hubdominance)
g_hat = fitted(reg_u_hat)
h_hat = exp(g_hat)
w = 1/h_hat
simple_lr_fgls = lm(y ~  x_Hubdominance, weight = w)
confint(simple_lr_fgls)
summary(simple_lr_fgls)