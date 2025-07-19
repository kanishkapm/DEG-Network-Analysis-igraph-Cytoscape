# Install Bioconductor (if not already)
if (!requireNamespace("BiocManager", quietly = TRUE)) install.packages("BiocManager")

# Install RCy3 (Bioconductor package to talk to Cytoscape)
BiocManager::install("RCy3")

# Load the package
library(RCy3)

# Ping Cytoscape to confirm it's running
cytoscapePing()

# Load DEG CSV file
deg <- read.csv("C:/Users/kanis/Downloads/GO ANALYSIS/TOP GO Results/DEGs_with_GeneSymbols.csv")

# Choose columns
gene_column <- "GeneSymbol"
ranking_column <- "logFC"

# Sort and select top 10 genes
deg_sorted <- deg[order(-deg[[ranking_column]]), ]
deg_top <- deg_sorted[1:50, ]
gene_list <- unique(deg_top[[gene_column]])

# Create random edges for the network (demo purpose)
set.seed(42)
edge_list <- data.frame(
  source = sample(gene_list, 15, replace = TRUE),
  target = sample(gene_list, 15, replace = TRUE)
)

# Remove self-loops and duplicate undirected edges
edge_list <- edge_list[edge_list$source != edge_list$target, ]
edge_list <- edge_list[!duplicated(t(apply(edge_list, 1, sort))), ]

# Send network to Cytoscape
createNetworkFromDataFrames(edges = edge_list, title = "Top 10 DEG Network", collection = "DEG_Collection")

# Optional: apply a layout and style
layoutNetwork("circular")  # Other layouts: "force-directed", "grid", etc.
setVisualStyle("default")  # Or define your own style
