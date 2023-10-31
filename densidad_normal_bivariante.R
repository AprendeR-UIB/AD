# Cargamos la librerí mvtnorm
library(mvtnorm) # Agosto 2023

#library(MASS)
#mvnorm(n,mu,Sigma)

# DefiniMOS los parámetros de la distribución bivariante
mu <- c(1, 1)               
sigma <- matrix(c(2, 0.8, 0.8, 2), ncol = 2)

# Creamos una cuadrícula de puntos en el espacio bivariante
x <- seq(-2, 4, length.out = 100)
y <- seq(-2, 4, length.out = 100)
grid <- expand.grid(x = x, y = y)

# Calculamos la densidad de los puntos
z <- matrix(dmvnorm(grid, mean = mu, sigma = sigma), nrow = length(x))

# Dibujamos 

persp(x, y, z, theta = 60, phi = 30, col = "lightblue", 
      main = "Distribución Normal Bivariante",
      xlab = "X", ylab = "Y", zlab = "Densidad")

