\name{letsberational}
\alias{letsberational}
\alias{black_price}
\alias{bachelier_price}
\alias{black_volatility}
\alias{bachelier_volatility}

\title{Option Pricing and Implied Volatility Functions}
\description{Functions for pricing and calculating the implied volatilites of
options under the Black-Scholes and Bachelier models.}

\usage{
black_price(forward, strike, volatility, tenor, callput)
bachelier_price(forward, strike, volatility, tenor, callput)
black_volatility(price, forward, strike, tenor, callput)
bachelier_volatility(price, forward, strike, tenor, callput)
}

\arguments{
\item{price}{Option price (\emph{undiscounted}), for the implied volatility functions}
\item{forward}{Forward price of underlying}
\item{strike}{Option strike}
\item{volatility}{Annualized option volatility, for the pricing functions}
\item{tenor}{Option tenor in years}
\item{callput}{+1 for a call option and -1 for a put option}
}

\details{
These functions are wrappers around Peter \enc{Jäckel's}{Jaeckel's} methods and reference
implementations, which are fast and accurate. All functions are vectorized
in all arguments, and will return a vector of prices or volatilites of the same
length as the inputs.

The prices for these functions---argument \code{price} for \code{black_volatility}
and \code{bachelier_volatility}; and the return values of \code{black_price} and
\code{bachelier_price}---are all undiscounted. This means they are the future
prices of the options, before the application of a discount factor. Typically,
you would discount these prices by a factor of \eqn{e^{-rt}}{exp(-r*t)} where \eqn{r}{r} is the
risk-free rate and \eqn{t}{t} is the option tenor to obtain the present-day value.

If the price argument is lower than the option intrinsic value,
\code{black_volatility} and \code{bachelier_volatility} return a large negative
value, typically \code{-.Machine$double.xmax}. If the price is greater than the
forward (for calls) or strike (for puts) or the volatility process fails to
converge, a large positive value is returned, typically
\code{.Machine$double.xmax}.
}

\value{
The price (\emph{undiscounted}) or implied volatility of the option, under the
Black-Scholes or Bachelier models
}

\references{
\enc{Jäckel}{Jaeckel}, P. (2015), \emph{Let's Be Rational.} Wilmott, 2015: 40-53. \doi{10.1002/wilm.10395}

\enc{Jäckel}{Jaeckel}, P. (2017), \emph{Implied Normal Volatility.} Wilmott, 2017: 54--57. \doi{10.1002/wilm.10581}
}

\examples{
# Compute option prices from a volatility smile
vol <- c(0.35, 0.3, 0.25, 0.2, 0.25)
strike <- c(90, 95, 100, 105, 110)
price <- black_price(forward = 105, strike = strike, volatility = vol, tenor = 1, callput = 1)
price

# Derive back the implied volatilites; for near-the-money options, should be
# approximately equal
new_vol <-
    black_volatility(price = price, forward = 105, strike = strike, tenor = 1, callput = 1)
new_vol
}
