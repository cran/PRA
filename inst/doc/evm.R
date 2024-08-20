## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(PRA)

## -----------------------------------------------------------------------------
bac <- 100000
schedule <- c(0.1, 0.2, 0.4, 0.7, 1.0)
time_period <- 3

## -----------------------------------------------------------------------------
pv <- pv(bac, schedule, time_period)
cat("Planned Value (PV):", pv, "\n")

## -----------------------------------------------------------------------------
actual_per_complete <- 0.35
ev <- ev(bac, actual_per_complete)
cat("Earned Value (EV):", ev, "\n")

## -----------------------------------------------------------------------------
actual_costs <- c(9000, 18000, 36000, 70000, 100000)
time_period <- 3
ac <- ac(actual_costs, time_period)
cat("Actual Cost (AC):", ac, "\n")

## -----------------------------------------------------------------------------
sv <- sv(ev, pv)
cat("Schedule Variance (SV):", sv, "\n")

cv <- cv(ev, ac)
cat("Cost Variance (CV):", cv, "\n")

## -----------------------------------------------------------------------------
spi <- spi(ev, pv)
cat("Schedule Performance Index (SPI):", spi, "\n")

cpi <- cpi(ev, ac)
cat("Cost Performance Index (CPI):", cpi, "\n")

