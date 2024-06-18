include("decompositionW2.jl")
include("Clique_sm.jl")
include("mx_func.jl")
include("StarW.jl")
include("Filter_fast2.jl")
include("h_scoreW.jl")
include("INC3.jl")
include("sparsification.jl")
include("HyperNodes.jl")
include("Mapping_fast.jl")
include("Unmapping.jl")
include("decompositionW2.jl")



using SparseArrays
using LinearAlgebra
using Clustering
using NearestNeighbors
using Distances
using Laplacians
using Arpack
using Statistics
using DelimitedFiles
using StatsBase
using Laplacians#master
using Random

function SPF(A, L, ICr)

    fdnz = findnz(tril(A, -1))

    rr = fdnz[1]
    cc = fdnz[2]
    W = fdnz[3]

    ar = Any[]

    for ii = 1:length(rr)

        push!(ar, sort([rr[ii], cc[ii]]))

    end

    ar_org = copy(ar)

    RedR = 1

    #@time ar, idx_mat, ar_mat, Emat = decompositionW2(ar, L, RedR, W)
    @time ar, idx_mat, ar_mat, Emat = decompositionW2_fast(A, L)

    avgN = mx_func(ar_org) / mx_func(ar)
    println("-------------avgN = ", avgN)

    Lmat = length(ar_mat)

    NN = [1,Lmat]

    arF, V = sparsification(NN, ar, idx_mat, ar_mat)

    ## Adding inter-cluster edges
    V = 1:mx_func(ar)

    for ii = 1:length(idx_mat)

    id1 = idx_mat[end-ii+1]

        V = V[id1]

    end

    dict2 = Dict{Any, Any}()

    for ii =1:length(ar_org)

    nd1 = sort(ar_org[ii])

    Vnd = sort(V[nd1])

    if Vnd[1]!=Vnd[2]

        vals = get!(Array{Int64,1},dict2, Vnd)

        push!(vals, ii)

    end

    end # for ii

    KS = collect(keys(dict2))

    VL = collect(values(dict2))

    EM1 = Emat[1]

    for ii = 1:length(VL)

        vl1 = VL[ii]

        SP = sortperm(EM1[vl1])

        TH = ceil(Int, length(SP) * ICr)

        ES = vl1[SP[1:TH]]

        append!(arF, ar_org[ES])

    end

    println("-------------Density = ", length(arF)/mx_func(arF))

    AS = Clique_sm(arF)

    return AS

end