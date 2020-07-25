% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/cellTypeAssignSCRNA.R
\name{cellTypeAssignSCRNA}
\alias{cellTypeAssignSCRNA}
\title{\code{cellTypeAssignSCRNA} assigns CDSeq-identified cell types using single cell RNAseq data.}
\usage{
cellTypeAssignSCRNA(
  cdseq_gep = NULL,
  sc_gep = NULL,
  sc_annotation = NULL,
  ncell = 1,
  nb_size = 100,
  nb_mu = 1000,
  seurat_count_threshold = 100,
  seurat_scale_factor = 10000,
  seurat_norm_method = "LogNormalize",
  seurat_select_method = "vst",
  seurat_nfeatures = 100,
  seurat_npcs = 50,
  seurat_dims = 1:10,
  seurat_reduction = "pca",
  seurat_resolution = 0.8,
  seurat_DE_test = "wilcox",
  seurat_DE_logfc = 0.25,
  seurat_top_n_markers = 10,
  plot_umap = 1,
  plot_tsne = 1,
  fig_path = getwd(),
  fig_name = "cellTypeAssignSCRNA",
  fig_format = "pdf"
)
}
\arguments{
\item{cdseq_gep}{CDSeq-estimated gene expression profile matrix with G rows (genes) and M columns (cell types).}

\item{sc_gep}{a G (genes) by N (cell) matrix or dataframe that contains the gene expression profile for N single cells.}

\item{sc_annotation}{a dataframe contains two columns "cell_id"  and "cell_type". cell_id needs to match with the cell_id in sc_gep but not required to have the same size. cell_type is the cell type annotation for the single cells.}

\item{ncell}{number of pseudo single cells generated for each CDSeq-estimated cell type using CDSeq-estimaged GEP, typically 1 works fine.}

\item{nb_size}{size parameter for negative binomial distribution, check rnbinom for details.}

\item{nb_mu}{mu parameter for negative binomial distribution, check rnbinom for details.}

\item{seurat_count_threshold}{this parameter will be passed to Seurat subset function (subset = nCount_RNA > seurat_count_threshold) for filtering out single cells whose total counts is less this threshold.}

\item{seurat_scale_factor}{this parameter will be passed to scale.factor in Seurat function NormalizeData.}

\item{seurat_norm_method}{this parameter will be passed to normalization.method in Seurat function NormalizeData.}

\item{seurat_select_method}{this parameter will be passed to selection.method in Seurat function FindVariableFeatures}

\item{seurat_nfeatures}{this parameter will be passed to nfeatures in Seurat function FindVariableFeatures.}

\item{seurat_npcs}{this parameter will be passed to npcs in Seurat function RunPCA.}

\item{seurat_dims}{this parameter will be passed to dims in Seurat function FindNeighbors.}

\item{seurat_reduction}{this parameter will be passed to reduction in Seurat function FindNeighbors.}

\item{seurat_resolution}{ths parameter will be passed to resolution in Seurat function FindClusters.}

\item{seurat_DE_test}{this parameter will be passed to test.use in Seurat function FindAllMarkers.}

\item{seurat_DE_logfc}{this parameter will be passed to logfc.threshold in Seurat function FindAllMarkers.}

\item{seurat_top_n_markers}{the number of top DE markers saved from Seurat output.}

\item{plot_umap}{set 1 to plot umap figure of scRNAseq and CDSeq-estimated cell types, 0 otherwise.}

\item{plot_tsne}{set 1 to plot tsne figure of scRNAseq and CDSeq-estimated cell types, 0 otherwise.}

\item{fig_path}{the location where the heatmap figure is saved.}

\item{fig_name}{the name of umap and tsne figures. Umap figure will have the name of fig_name_umap and tsne figure will be named fig_name_tsne.}

\item{fig_format}{"pdf", "jpeg", or "png".}
}
\value{
cellTypeAssignSCRNA returns a list containing following fields: 
fig_path: same as the input fig_path

fig_name: same as the input fig_name

cdseq_scRNA_umap: ggplot figure of the umap outcome

cdseq_scRNA_tsne: ggplot figure of the tsne outcome

cdseq_synth_scRNA_seurat: Seurat object containing the scRNAseq combined with CDSeq-estimated cell types. Cell id for CDSeq-estimated cell types start with "CDSeq". 

seurat_cluster_purity: for all cells in a Seurat cluster i,  the ith value in seurat_cluster_purity is the proportion of the mostly repeated cell annotation from sc_annotation. 
For example, after Seurat clustering, suppose there are 100 cells in cluster 1, out of these 100 cells, 90 cells' annotation in sc_annotation is cell type A, then 
the fist value in seurat_cluster_purity is 0.9. This output can be used to assess the agreement between Seurat clustering and the given sc_annotation. 

seurat_unique_clusters: Unique Seurat cluster numbering. This can be used together with seurat_cluster_gold_label to match the Seurat clusters with given annotations.

seurat_cluster_gold_label: The cell type annotations for each unique Seurat cluster based on sc_annotation.

seurat_markers: DE genes for each Seurat cluster.

seurat_top_markers: Top seurat_top_n_markers DE genes for each Seurat cluster.
}
\description{
\code{cellTypeAssignSCRNA} assigns CDSeq-identified cell types using single cell RNAseq data.
}