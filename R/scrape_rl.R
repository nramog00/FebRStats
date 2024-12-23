scrape_rl <- function(game_ids) {
    base_api <- "http://baloncestoenvivo.feb.es/api/ShotChart/"
    game_apis <- paste0(base_api, game_ids)
    api_requests <- lapply(game_apis, httr::GET)

    # Dealing with API request errors
    errors <- unlist(lapply(api_requests, httr::http_error))
    good_game_ids <- game_ids[!errors]
    bad_game_ids <- game_ids[errors]
    error_message <- paste("request game ID", bad_game_ids)
    # Why not working?
    # mapply(httr::warn_for_status, api_requests, task = as.list(error_message))
    bad_requests <- api_requests[errors]
    n_errors <- length(bad_requests)
    if (sum(errors) != 0) {
        for (i in 1:n_errors) {
            httr::warn_for_status(bad_requests[[i]], task = error_message[i])
        }
    }
    good_requests <- api_requests[!errors]

    json_list <- lapply(good_requests, httr::content,
                        as = "text", encoding = "UTF-8")
    raw_list <- lapply(json_list, jsonlite::fromJSON)

    attr(raw_list, "game_ids") <- good_game_ids

    raw_list
}
