dibujar_grafico <- function(df, ...) {

    court <- crear_cancha()

    plt <- ggplot(environment = environment()) +
        geom_point(data = df, aes(x, y, ...), alpha = 0.8) +
        geom_path(aes(x, y), size = 0.2, data = court$outer_lines) +
        geom_path(aes(x, y), size = 0.2, data = court$paint) +
        geom_path(aes(x, y), size = 0.2, data = court$ft_circle) +
        geom_path(aes(x, y), size = 0.2, data = court$arc3) +
        coord_fixed() +
        theme_void() +
        theme(panel.background = element_rect(fill = "whitesmoke"),
              legend.position = "bottom") +
        labs(color = "")
    plt
}
