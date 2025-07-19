Project Summary
This project presents an integrative workflow for constructing and visualizing gene regulatory networks using the top 20% differentially expressed genes (DEGs) derived from transcriptomic data. The workflow reveals potential regulatory interactions—such as gene, transcription factor (TF), and miRNA relationships—using both static and interactive visualization tools within R.

Tools & Technologies Used
R programming language
igraph: For static circular network visualization in R
RCy3: Interface for connecting R with Cytoscape via CyREST API
Cytoscape: For advanced network visualization, layout optimization, and biological interpretation

OBJECTIVES
Construct regulatory networks comprising mRNAs, TFs, and miRNAs
Visualize top-ranked DEGs by expression scores or statistical metrics

Generate:
Circular network layout in R using igraph
Interactive network visualization in Cytoscape via RCy3
Enable export and further analysis (e.g., clustering, hub detection)

 Key Features
Focuses on the top 20% of DEGs for interpretable, biologically relevant networks
Modular code structure for easy adaptation to different DEG datasets
Dual visualization pipeline: static in R, interactive in Cytoscape
Supports multiple node types: genes, transcription factors, miRNAs

Target Users
Bioinformaticians and molecular biologists working with transcriptomic data
Researchers seeking effective visualization of gene regulation networks
Students learning systems biology and network analysis

Getting Started
Prepare your DEG table and any regulatory input files needed.
Run igraph_network.R for static R-based visualization.
Use cytoscape_network.R to export and explore your network in Cytoscape.

Contribution
Contributions and suggestions are welcome. Please fork the repository or open an issue to participate.
