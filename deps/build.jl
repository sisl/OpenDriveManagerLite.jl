#=
1 - download the zip file
2 - extract the zip file
3 - move inc/ and lib/ to compile/
4 - move libODriveLite.1.4.3.a to compile/
5 - compile
=#

@linux ? nothing : error("OpenDriveManagerLite only supports Linux at this time")

if isfile("odrMgrLite.1.4.3.zip")
    rm("odrMgrLite.1.4.3.zip")
end
if isdir("compile/lib")
    rm("compile/lib", recursive=true)
end
if isdir("compile/inc")
    rm("compile/inc", recursive=true)
end
if isfile("compile/libODriveLite.1.4.3.a")
    rm("compile/libODriveLite.1.4.3.a")
end

run(`wget --user-agent="Chrome" http://www.vires.com/download/OpenDRIVE/odrMgrLite.1.4.3.zip`)
run(`unzip odrMgrLite.1.4.3.zip`)
if isfile("odrMgrLite.1.4.3.zip")
    rm("odrMgrLite.1.4.3.zip")
end

run(`mv V1.4.3lite/inc compile/inc`)
run(`mv V1.4.3lite/lib compile/lib`)
run(`cp compile/lib/Linux/lib64/libODriveLite.1.4.3.a compile/`)

if isdir("V1.4.3lite")
    rm("V1.4.3lite", recursive=true)
end

cd("compile") do
    run(`bash -x compile.sh`)
end


