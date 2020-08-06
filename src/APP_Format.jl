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

#Variables -------------------------------------------
DocTypes = ["txt","csv","xls","xlsx"]

#Private functions ------------------------------------------
function FileMUX!(DSS::DSsettings)
	ns = split(DSS.fileName,".")
	if ns[end] in DocTypes
		if isfile(DSS.fileName)
			DSS.format = ns[end]
		else
			println("\t > The file do not exist")
			return false
		end
	else
		println("\t > File format not recognized or used into the process")
		return false
	end
	return true
end

function FileSizing!(DSS::DSsettings)

	if (DSS.format == "txt")

	elseif (DSS.format == "csv")
		data = CSV.read(DSS.fileName,header=false)
	else

	end

	DSS.absSize = size(data)

	yRange = [DSS.rStats,DSS.dataStartAt[1],DSS.dataStopAt[1]]
	yNames = ["rStats","dataStartAt(Y)","dataStopAt(Y)"]
	xRange = [DSS.cIndividuals,DSS.cSets,DSS.cCategories,DSS.dataStartAt[2],DSS.dataStopAt[2]]
	xNames = ["cIndividuals","cSets","cCategories","dataStartAt(X)","dataStopAt(X)"]
	my,n = findmax(yRange)
	if my > DSS.absSize[1]
		println("\t > ",yNames[n]," out of bounds (max row: ",DSS.absSize[1],")")
		return false
	end
	mx,n = findmax(xRange)
	if mx > DSS.absSize[1]
		println("\t > ",xNames[n]," out of bounds (max column: ",DSS.absSize[2],")")
		return false
	end

	if 0 in DSS.dataStartAt
		if (my+1 > DSS.absSize[1]) || (mx+1 > DSS.absSize[2])
			println("\t > Unable to locate Data location (datasStartAt :",DSS.dataStartAt,")")
			println("\t > Please ajust manually ::dataStartAt:: variable")
			println("\t > If needed, type : '? ExctractorBuilder()' in the Julia terminal")
		else
			DSS.dataStartAt = (my+1,mx+1)
		end
	end
	if 0 in DSS.dataStopAt
		DSS.dataStopAt = (DSS.absSize[1],DSS.absSize[2])
	end
	DSS.relSize = (DSS.dataStopAt[1]-DSS.dataStartAt[1]+1) * (DSS.dataStopAt[2]-DSS.dataStartAt[2]+1)

	return true
end

function FileAnalyzing!(DSS::DSsettings)
end

#Public functions ------------------------------------------
#Exctraction initialization (via variables or external file)
function ExctractorBuilder(fileName::AbstractString,cIndividuals::Int,rStats::Int;cSets::Int=0,cCategories::Int=0,dataStartAt::Tuple{Int,Int}=(0,0),dataStopAt::Tuple{Int,Int}=(0,0))

	IDSS = DSsettings(fileName,"",(0,0),0,[""],[""],[""],[""],0,0,0,0,cIndividuals,cSets,cCategories,rStats,dataStartAt,dataStopAt)

	status = FileMUX!(IDSS)
	status==false && return false

	status = FileSizing!(IDSS)
	status==false && return false

	return IDSS
end

function ExctractorBuilder(BuilderFileName::AbstractString)
end