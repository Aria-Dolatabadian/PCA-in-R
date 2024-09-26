library("factoextra")
library("patchwork")

data(iris)

pca_result <- prcomp(iris[ , -5], 
 scale = TRUE)

bipl1 <- fviz_pca_biplot(pca_result,
 axes = c(1, 2),
 label="var",
 habillage = iris$Species)

bipl2 <- fviz_pca_biplot(pca_result,
 axes = c(1, 3),
 label="var",
 habillage = iris$Species)

bipl3 <- fviz_pca_biplot(pca_result,
 axes = c(2, 3),
 label="var",
 habillage = iris$Species)

bipl1 / bipl2 / bipl3


#Or

# Load necessary libraries
library("factoextra")
library("patchwork")

# Step 1: Read the CSV file from the working directory
# Ensure your CSV file has a similar structure to the iris dataset, with the species column as the last column
iris_data <- read.csv("your_data_file.csv")  # Replace 'your_data_file.csv' with your actual file name

# Step 2: Perform PCA on the numerical columns (excluding the species/label column)
pca_result <- prcomp(iris_data[ , -ncol(iris_data)], scale = TRUE)

# Step 3: Generate PCA biplots with habillage based on the species column
bipl1 <- fviz_pca_biplot(pca_result,
                         axes = c(1, 2),
                         label = "var",
                         habillage = iris_data[, ncol(iris_data)])  # Assuming the last column contains species/labels

bipl2 <- fviz_pca_biplot(pca_result,
                         axes = c(1, 3),
                         label = "var",
                         habillage = iris_data[, ncol(iris_data)])

bipl3 <- fviz_pca_biplot(pca_result,
                         axes = c(2, 3),
                         label = "var",
                         habillage = iris_data[, ncol(iris_data)])

# Combine plots and display
bipl1 / bipl2 / bipl3
