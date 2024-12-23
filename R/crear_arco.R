crear_arco <- function(x0, y0, r, inicio, fin) {
    by <- ifelse(inicio <= fin, 0.01, -0.01)
    theta <- seq(inicio, fin, by)
    x <- x0 + r * cos(theta)
    y <- y0 + r * sin(theta)
    data.frame(x, y)
}
