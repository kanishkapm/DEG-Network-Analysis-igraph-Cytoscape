# Install and load igraph package
if (!requireNamespace("igraph", quietly = TRUE)) install.packages("igraph")
library(igraph)

# Load DEG file
deg <- read.csv("C:/Users/kanis/Downloads/GO ANALYSIS/TOP GO Results/DEGs_with_GeneSymbols.csv")
print(colnames(deg))  # View column names to confirm

# Choose relevant columns
gene_column <- "GeneSymbol"  # Update if your column name is different
ranking_column <- "logFC"    # Could also be "P.Value", "adj.P.Val", etc.

# Sort DEGs by ranking_column
deg_sorted <- deg[order(-deg[[ranking_column]]), ]

# Select top 10 genes
deg_top <- deg_sorted[1:20,]
gene_list <- unique(deg_top[[gene_column]])
cat("Using top", length(gene_list), "genes:\n", paste(gene_list, collapse = ", "), "\n")

# Check if enough genes to build a network
if (length(gene_list) >= 2) {
  set.seed(42)  # For reproducibility
  
  # Create a random edge list
  edge_list <- data.frame(
    from = sample(gene_list, 15, replace = TRUE),
    to   = sample(gene_list, 15, replace = TRUE)
  )
  edge_list <- edge_list[edge_list$from != edge_list$to, ]  # Remove self-loops
  
  # Build igraph network
  net <- graph_from_data_frame(edge_list, directed = FALSE)
  
  # Plot the network in a circular layout
  plot(net,
       layout = layout_in_circle(net),
       vertex.size = 25,
       vertex.label.cex = 0.9,
       edge.width = 1.2,
       main = "Top 10 DEGs Network (Circular Layout)")
  
} else {
  stop("Not enough genes to create a network.")
}
