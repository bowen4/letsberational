#' Black Price
#' @export
black_price <- function(forward, strike, sigma, tenor, callput) {
    lengths <- unique(c(length(forward), length(strike), length(sigma), length(tenor), length(callput)))
    if (length(lengths) > 2L) { stop("All arguments must be the same length or length 1.") }
    df <- data.frame(
        forward = as.numeric(forward),
        strike  = as.numeric(strike),
        sigma   = as.numeric(sigma),
        tenor   = as.numeric(tenor),
        callput = as.numeric(callput)
    )
    .black_price(df$forward, df$strike, df$sigma, df$tenor, df$callput)
}

#' Bachelier Price
#' @export
bachelier_price <- function(forward, strike, sigma, tenor, callput) {
    lengths <- unique(c(length(forward), length(strike), length(sigma), length(tenor), length(callput)))
    if (length(lengths) > 2L) { stop("All arguments must be the same length or length 1.") }
    df <- data.frame(
        forward = as.numeric(forward),
        strike  = as.numeric(strike),
        sigma   = as.numeric(sigma),
        tenor   = as.numeric(tenor),
        callput = as.numeric(callput)
    )
    .bachelier_price(df$forward, df$strike, df$sigma, df$tenor, df$callput)
}

#' Black Volatility
#' @export
black_volatility <- function(price, forward, strike, tenor, callput) {
    lengths <- unique(c(length(price), length(forward), length(strike), length(tenor), length(callput)))
    if (length(lengths) > 2L) { stop("All arguments must be the same length or length 1.") }
    df <- data.frame(
        price   = as.numeric(price),
        forward = as.numeric(forward),
        strike  = as.numeric(strike),
        tenor   = as.numeric(tenor),
        callput = as.numeric(callput)
    )
    .black_volatility(df$price, df$forward, df$strike, df$tenor, df$callput)
}

#' Bachelier Volatility
#' @export
bachelier_volatility <- function(price, forward, strike, tenor, callput) {
    lengths <- unique(c(length(price), length(forward), length(strike), length(tenor), length(callput)))
    if (length(lengths) > 2L) { stop("All arguments must be the same length or length 1.") }
    df <- data.frame(
        price   = as.numeric(price),
        forward = as.numeric(forward),
        strike  = as.numeric(strike),
        tenor   = as.numeric(tenor),
        callput = as.numeric(callput)
    )
    .bachelier_volatility(df$price, df$forward, df$strike, df$tenor, df$callput)
}
