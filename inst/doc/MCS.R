## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## -----------------------------------------------------------------------------
library(PRA)

## -----------------------------------------------------------------------------
num_simulations <- 10000
task_distributions <- list(
  list(type = "normal", mean = 10, sd = 2),  # Task A: Normal distribution
  list(type = "triangular", a = 5, b = 10, c = 15),  # Task B: Triangular distribution
  list(type = "uniform", min = 8, max = 12)  # Task C: Uniform distribution
)

## -----------------------------------------------------------------------------
correlation_matrix <- matrix(c(
  1, 0.5, 0.3,
  0.5, 1, 0.4,
  0.3, 0.4, 1
), nrow = 3, byrow = TRUE)

## -----------------------------------------------------------------------------
results <- mcs(num_simulations, task_distributions, correlation_matrix)

## -----------------------------------------------------------------------------
cat("Mean Total Duration:", results$total_mean, "\n")

## -----------------------------------------------------------------------------
cat("Variance of Total Duration:", results$total_variance, "\n")

## -----------------------------------------------------------------------------
hist(results$total_distribution, breaks = 50, main = "Distribution of Total Project Duration", 
     xlab = "Total Duration", col = "skyblue", border = "white")

## -----------------------------------------------------------------------------
contingency <- contingency(results, phigh = 0.95, pbase = 0.50)
cat("Contingency based on 95th percentile and 50th percentile:", contingency)

## -----------------------------------------------------------------------------
sensitivity_results <- sensitivity(task_distributions, correlation_matrix)
cat("Sensitivity of the variance in total cost with respect to the variance in each task cost:\n")
print(sensitivity_results)

## -----------------------------------------------------------------------------
data <- data.frame(
   Tasks = c('A', 'B', 'C'),
   Sensitivity = sensitivity_results
)
barplot(height=data$Sensitivity, names=data$Tasks, col='skyblue', 
        horiz=TRUE, xlab = 'Sensitivity', ylab = 'Tasks')

