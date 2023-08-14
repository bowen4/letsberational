#include "lets_be_rational.h"
EXPORT_EXTERN_C double Bachelier(double forward, double strike, double sigma, double T, double q);
EXPORT_EXTERN_C double ImpliedNormalVolatility(double price, double forward, double strike, double T, double q);

#include "Rcpp.h"
using namespace Rcpp;

#include <algorithm>

// [[Rcpp::export(.black_price)]]
NumericVector black_price(
        NumericVector forward,
        NumericVector strike,
        NumericVector sigma,
        NumericVector tenor,
        NumericVector callput
) {
    // R code guarantees all arguments have the same length.
    int n = forward.length();
    NumericVector res(n);
    for (int i = 0; i < n; ++i) {
        res[i] = black(forward[i], strike[i], sigma[i], tenor[i], callput[i]);
    }
    return res;
}

// [[Rcpp::export(.bachelier_price)]]
NumericVector bachelier_price(
        NumericVector forward,
        NumericVector strike,
        NumericVector sigma,
        NumericVector tenor,
        NumericVector callput
) {
    int n = forward.length();
    NumericVector res(n);
    for (int i = 0; i < n; ++i) {
        res[i] = Bachelier(forward[i], strike[i], sigma[i], tenor[i], callput[i]);
    }
    return res;
}

// [[Rcpp::export(.black_volatility)]]
NumericVector black_volatility(
        NumericVector price,
        NumericVector forward,
        NumericVector strike,
        NumericVector tenor,
        NumericVector callput
) {
    int n = price.length();
    NumericVector res(n);
    for (int i = 0; i < n; ++i) {
        res[i] =
            implied_volatility_from_a_transformed_rational_guess(price[i], forward[i], strike[i], tenor[i], callput[i]);
    }
    return res;
}

// [[Rcpp::export(.bachelier_volatility)]]
NumericVector bachelier_volatility(
        NumericVector price,
        NumericVector forward,
        NumericVector strike,
        NumericVector tenor,
        NumericVector callput
) {
    int n = price.length();
    NumericVector res(n);
    for (int i = 0; i < n; ++i) {
        res[i] = ImpliedNormalVolatility(price[i], forward[i], strike[i], tenor[i], callput[i]);
    }
    return res;
}
