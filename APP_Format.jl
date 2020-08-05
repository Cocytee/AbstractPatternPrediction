#Yet another Data Exctractor ?
#Super ultra modular function for generic and periodic data exctration + file management

#Structures ------------------------------------------
mutable struct DSsettings
	#DSsetting input values need to be preprocessed and controled via the corresponding function before initialization.
	#absSize is size(readlines) whatever is inside ; relSize is uSets*uStats (used data size)
	fileName::AbstractString
	format::AbstractString
	absSize::Tuple{Int,Int}
	relSize::Int
	#uIndividuals is the list of all the unique Indiviuals of the population
	#uSets is the list of all the different Sets of Data (from 1 to Inf. ; no redundancy accepted)
	#uCategories is the list of all unique Categories individuals can be sorted with
	#uStats is the list of statistical parameters issues from indiviuals.
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
	cCategories::Int
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

#Private functions ------------------------------------------
function FileMUX(fileName::AbstractString)
	f = "None"
	ns = split(fileName,".")
	if (ns[end] == "csv") || (ns[end] == "txt")
		try
			f = open(fileName,"r")
		catch
			println("\t > The file do not exist or is corrupted")
			return nothing
		end
	elseif (ns[end] == "xls") || (ns[end] == "xlsx")
		#to update
	else
		println("\t > File format not recognized")
		return nothing
	end
	return f,ns[end]
end

function FileSizing(f,DSS::DSsettings)
	if (DSS.format == "csv") || (DSS.format == "txt")
		data = readlines(f)
		return data,0,0
	else
		return nothing
	end
end

#Public functions ------------------------------------------
#Exctraction initialization (via variables or external file)
function ExctractorBuilder(fileName::AbstractString,cIndividuals::Int,rStats::Int;cSets::Int=0,cCategories::Int=0,dataStartAt::Tuple{Int,Int}=(0,0),dataStopAt::Tuple{Int,Int}=(0,0))

	IDSS = DSsettings(fileName,"",(0,0),0,[""],[""],[""],[""],0,0,0,0,cIndividuals,cSets,cCategories,rStats,dataStartAt,dataStopAt)

	r = FileMUX(IDSS.fileName)
	r==nothing && return nothing
	(f,IDSS.format) = r

	r = FileSizing(f,IDSS)
	r==nothing && return nothing
	(rsDATA,IDSS.absSize,IDSS.relSize) = r

	return IDSS
end

function ExctractorBuilder(BuilderFileName::AbstractString)
end