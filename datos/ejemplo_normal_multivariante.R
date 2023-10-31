#Mediciones de pecho, cintura y cadera de una muestra de hombres y mujeres

datos<-read.table("ejemplo_EM_1.txt", header=TRUE)
x <- datos[, c("chest", "waist", "hips")]
m <- colMeans(x)
S <- cov(x)
d<- apply(x, MARGIN = 1, function(x)
  + t(x - m) %*% solve(S) %*% (x - m))


plot(qchisq((1:nrow(x) - 1/2) / nrow(x), df = 3), sort(d),
xlab = expression(paste("Cuantiles de la ", chi[3]^2)),
ylab="Distancias ordenadas")
abline(a=0,b=1)

# Test en R para revisar normalidad multivariante

library(mvnormtest)
# Shapiro-Wilk
x=t(x)
mshapiro.test(x)

#El p-valor  de Shapiro-Wilk de 0,0003 indica que no se cumple el supuesto de normalidad multivariante.
# una o más variables individuales no se distribuyen normalmente.

library(car)
x=t(x)
qqPlot(x[,1],main="Chest")
qqPlot(x[,2])
qqPlot(x[,3])

## Contrastes

## Ejemplo moscas

datos<-read.table("ejemplo_EM_2.txt", header=TRUE)

p_valor<-1-pf(25.78,2,12)
