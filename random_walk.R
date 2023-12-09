# Semilla para reproducibilidad
set.seed(123)

# Número de pasos en la caminata aleatoria
n_pasos <- 300


random_walk <- function(n) {
  pasos <- rnorm(n) 
  caminata <- cumsum(pasos)
  return(c(0, caminata))  # punto de partida (0) al inicio
}

# Generar tres trayectorias de caminatas aleatorias
trayectoria1 <- random_walk(n_pasos)
trayectoria2 <- random_walk(n_pasos)
trayectoria3 <- random_walk(n_pasos)

# Dibujamos las trayectorias
plot(0:n_pasos, trayectoria1, type = 'l', col = 'blue', ylim = c(min(trayectoria1, trayectoria2, trayectoria3), max(trayectoria1, trayectoria2, trayectoria3)), xlab = 'Pasos', ylab = 'Valor', main = 'Tres Trayectorias de Random Walk')
lines(0:n_pasos, trayectoria2, col = 'red')
lines(0:n_pasos, trayectoria3, col = 'green')

# Leyenda
legend('bottomright', legend = c('Trayectoria 1', 'Trayectoria 2', 'Trayectoria 3'), col = c('blue', 'red', 'green'), lty = 1)
