black_price <- function(forward, strike, volatility, tenor, callput) {
    lengths <- unique(c(length(forward), length(strike), length(volatility), length(tenor), length(callput)))
    if (length(lengths) > 2L) { stop("All arguments must be the same length or length 1.") }
    # The C++ code expects all arguments to be vectors of the same length.
    # We use data.frame to promote arguments of length 1 to vectors.
    df <- data.frame(
        forward = as.numeric(forward),
        strike  = as.numeric(strike),
        volatility   = as.numeric(volatility),
        tenor   = as.numeric(tenor),
        callput = as.numeric(callput)
    )
    .black_price(df$forward, df$strike, df$volatility, df$tenor, df$callput)
}

bachelier_price <- function(forward, strike, volatility, tenor, callput) {
    lengths <- unique(c(length(forward), length(strike), length(volatility), length(tenor), length(callput)))
    if (length(lengths) > 2L) { stop("All arguments must be the same length or length 1.") }
    df <- data.frame(
        forward = as.numeric(forward),
        strike  = as.numeric(strike),
        volatility   = as.numeric(volatility),
        tenor   = as.numeric(tenor),
        callput = as.numeric(callput)
    )
    .bachelier_price(df$forward, df$strike, df$volatility, df$tenor, df$callput)
}

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
