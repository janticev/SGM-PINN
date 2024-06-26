# HyperEF

https://arxiv.org/abs/2210.14813

Ali Aghdaei, Zhuo Feng

HyperEF is a scalable algorithmic framework for spectral coarsening (decomposition) of large-scale hypergraphs by exploiting hyperedge effective resistances. Motivated by the latest theoretical framework for  low-resistance-diameter decomposition of simple graphs, HyperEF aims at decomposing large hypergraphs into multiple node clusters with only a few inter-cluster hyperedges. The key component in HyperEF is a nearly-linear time  algorithm for estimating hyperedge  effective resistances, which allows incorporating the latest diffusion-based non-linear quadratic operators defined on hypergraphs. To achieve good runtime scalability, HyperEF searches within the Krylov subspace (or approximate eigensubspace) for identifying the nearly-optimal vectors for approximating the hyperedge effective resistances. In addition, a  node weight propagation scheme for multilevel spectral hypergraph decomposition   has been introduced for achieving even greater  node coarsening ratios. When compared with state-of-the-art hypergraph partitioning (clustering) methods, extensive experiment results on real-world VLSI designs show that HyperEF can more effectively coarsen (decompose) hypergraphs   without losing  key structural (spectral) properties of the original hypergraphs, while achieving over $70\times$ runtime speedups over hMetis and $20\times$ speedups over HyperSF.

<img width="872" alt="overview11_paper" src="https://user-images.githubusercontent.com/85693952/197917710-677b8b42-d06b-4763-8946-691cbdc26dd9.png">
<img width="772" alt="Screen Shot 2022-10-25 at 10 09 51 PM" src="https://user-images.githubusercontent.com/85693952/197917946-fba005ab-39cc-4f60-83e9-9a3129540199.png">

# Citation
@misc{https://doi.org/10.48550/arxiv.2210.14813,
  doi = {10.48550/ARXIV.2210.14813},
  
  url = {https://arxiv.org/abs/2210.14813},
  
  author = {Aghdaei, Ali and Feng, Zhuo},
  
  keywords = {Machine Learning (cs.LG), FOS: Computer and information sciences, FOS: Computer and information sciences},
  
  title = {HyperEF: Spectral Hypergraph Coarsening by Effective-Resistance Clustering},
  
  publisher = {arXiv},
  
  year = {2022},
  
  copyright = {Creative Commons Attribution Non Commercial Share Alike 4.0 International}
}

# Dataset
All datasets are in hMetis format:


The first line contains either two integers. The first integer is the number of hyperedges, the second is the number of vertices.
After this first line, the remaining lines store the vertices contained in each hyperedge–one line per hyperedge. In particular, the i th line (excluding comment lines) contains the vertices that are included in the (i − 1)th hyperedge.

# Output

The output of HyperEF is a clustering file. The clustering file of a hypergraph with |V | vertices, consists of |V | lines with a single number per line. The i th line of the file contains the cluster number that the i th vertex belongs to. Cluster numbers start from 1. 
