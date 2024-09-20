This repository contains a simulation code related to THC concentration and the activation of CB1 and CB2 receptors in different regions of the brain. The code also generates a scatter plot to visualize the relationship between these factors. Below is a detailed explanation of each part of the code.

Installing and Loading Required Packages
The code uses the dplyr and ggplot2 packages for data manipulation and graphical visualization, respectively. If you do not have these packages installed, they can be installed and loaded using the following commands:


# Install and load the required package
install.packages("dplyr")
library(dplyr)

install.packages("ggplot2")
library(ggplot2)
Data Simulation
The data is simulated to represent the concentration of THC and the activation of CB1 and CB2 receptors in different regions of the brain. The data also includes a value that indicates the observed neurological effect. To ensure reproducibility, the set.seed() function is used to generate the same random numbers in each execution.


set.seed(123)  # For reproducibility
regions <- c("Prefrontal Cortex", "Hippocampus", "Amygdala", "Cerebellum", "Nucleus Accumbens")
A dataset is created using the data.frame() function, where:

Concentration_THC: A random value between 1 and 10 ng/mg.
Activation_CB1: Simulates CB1 receptor activation using a normal distribution with a mean of 0.5 and a standard deviation of 0.1.
Activation_CB2: Simulates CB2 receptor activation with a normal distribution, a mean of 0.3, and a standard deviation of 0.1.
Observed_Effect: A random value between 0 and 1 representing the observed neurological effect.

data <- data.frame(
  Region = rep(regions, each = 10),
  THC_Concentration = runif(50, min = 1, max = 10),  # THC concentration in ng/mg
  Activation_CB1 = rnorm(50, mean = 0.5, sd = 0.1),  # CB1 receptor activation
  Activation_CB2 = rnorm(50, mean = 0.3, sd = 0.1),  # CB2 receptor activation
  Observed_Effect = runif(50, min = 0, max = 1)      # Observed neurological effect
)

# Display the first records
head(data)
Statistical Summary by Brain Region
We use the dplyr package to group the data by brain region and calculate the means of the THC_Concentration, Activation_CB1, Activation_CB2, and Observed_Effect variables.


stat_summary <- data %>%
  group_by(Region) %>%
  summarize(
    Mean_THC = mean(THC_Concentration),
    Mean_Activation_CB1 = mean(Activation_CB1),
    Mean_Activation_CB2 = mean(Activation_CB2),
    Mean_Observed_Effect = mean(Observed_Effect)
  )

# Display the statistical summary
print(stat_summary)
Graphical Visualization
Finally, we use the ggplot2 package to create a scatter plot showing the relationship between THC Concentration and CB1 Receptor Activation. The size of the points indicates CB2 Receptor Activation, and the colors represent different regions of the brain.


ggplot(data = data, aes(x = THC_Concentration, y = Activation_CB1, color = Region, size = Activation_CB2)) +
  geom_point(alpha = 0.7) +
  labs(
    title = "Relationship between THC Concentration and CB1 and CB2 Receptor Activation",
    x = "THC Concentration (ng/mg)",
    y = "CB1 Receptor Activation",
    size = "CB2 Activation"
  ) +
  theme_minimal() +
  scale_color_brewer(palette = "Set1")
This plot facilitates the visualization of the relationship between THC concentration and neurological responses in different regions of the brain.
