#Yet another Data Exctractor ?
#Super ultra modular function for generic and periodic data exctration + file management

#-------------------------
#Done
# > Structs + Builder function proto 1
#ToDo
# > File Extension management + openning

#Structures
mutable struct DSsettings
	#DSsetting input values need to be preprocessed and controled via the corresponding function before initialization.
	#absSize is size(readlines) whatever is inside ; relSize is uSets*uStats (used data size)
	fileName::AbstractString
	format::AbstractString
	absSize::Tuple{Int,Int}
	relSize::Int
	#uIndividuals is the list of all the unique Indiviuals of the population, uSets is the list of all the different Sets of Data (from 1 to Inf. ; no redundancy accepted)
	#uCategories is the list of all unique Categories individuals can be sorted with, uStats is the list of statistical parameters issues from indiviuals.
	uIndividuals::Array{AbstractString,1}
	uSets::Array{AbstractString,1}
	uCategories::Array{AbstractString,1}
	uStats::Array{AbstractString,1}
	#Just the length of each corresponding variable (ergonomic !)
	nIndividuals::Int
	nSets::Int
	nCategories::Int
	nStats::Int
	#Columns (c) and Rows (r) of each variable into the designated file.
	cIndividuals::Int
	cSets::Int
	cCat::Int
	rStats::Int
	dataStartAt::Tuple{Int,Int}
	dataStopAt::Tuple{Int,Int}
end

mutable struct DSbox
	#DSbox is storing Sets affiliated Data,Categroies and Individuals.
	sIndiviuals::Array{AbstractString,1}
	sCategories::Array{AbstractString,1}
	sRawData::Array{Float64,2}
	sStatData::Array{Float64,2}

end

DSpool = Dict{AbstractString,DSbox}()

#File Extention Check
function FileMUX(fileName::AbstractString)
	f = nothing
	ns = split(fileName,".")
	if (ns[end] == ".csv") || (ns[end] == ".txt")
		f = open(fileName,"r")
	elseif
		#to update
	elseif
		print "\t > File format not recognized"
	end
	return f,ns[end]
end

#Exctraction initialization (via variables or external file)
function ExctractorBuilder(fileName::AbstractString,cIndividuals::Int,rStats::Int;cSets::Int=0,cCat::Int=0,dataStartAt::Tuple{Int,Int}=(0,0),dataStopAt::Tuple{Int,Int}=(0,0))
	#Working /w variables
	#Scanning data file
end

function ExctractorBuilder(BuilderFileName::AbstractString)
	#Working /w config file
	#Reading config file
end