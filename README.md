# OpenDriveManagerLite

A Julie package interface to OdrManagerLite, by Vires, for coordinate conversions in OpenDRIVE maps.

[![Build Status](https://travis-ci.org/sisl/OpenDriveManagerLite.jl.svg?branch=master)](https://travis-ci.org/sisl/OpenDriveManagerLite.jl)
[![Coverage Status](https://coveralls.io/repos/sisl/OpenDriveManagerLite.jl/badge.svg?branch=master&service=github)](https://coveralls.io/github/sisl/OpenDriveManagerLite.jl?branch=master)

## Installation
```julia
Pkg.clone("https://github.com/sisl/OpenDriveManagerLite.jl.git")
Pkg.build("OpenDriveManagerLite")
```

## Coordinate Frames

Inertial (Coord)
Track (TrackCoord)
Lane (LaneCoord)
Foot (Coord)

## Use

Create an instance of `OdrManagerLite`, load an XML file, and then initialize a position:

```julia
mgr = OdrManagerLite()
@assert(loadfile(mgr, "myfile.xml"))

pos = create_position(mgr)
activate_position(mgr, pos)
```

Given any coordinate, one can set the inertal `OdrManagerLite` position and then transform it to the other three forms.

Convert a track coordinate to an inertial coordinate:
```julia
mgr = OdrManagerLite()
set_trackpos(mgr, 0, 1.0, 2.0)
set_trackpos(mgr::OdrManagerLite, value::AbstractTrackCoord)
track2inertial(mgr)
pos = get_inertialpos(mgr)
```

Convert an inertial coordinate to a track coordinate:
```julia
mgr = OdrManagerLite()
set_inertialpos(mgr::OdrManagerLite, x::Real, y::Real, z::Real)
inertial2track(mgr)
pos = get_trackpos(mgr)
```

Convert a lane coordinate to an inertial coordinate:
```julia
mgr = OdrManagerLite()
set_lanepos(mgr::OdrManagerLite, value::AbstractLaneCoord)
lane2inertial(mgr)
pos = get_inertialpos(mgr)
```

Convert an inertial coordinate to a lane coordinate:
```julia
mgr = OdrManagerLite()
set_inertialpos(mgr::OdrManagerLite, x::Real, y::Real, z::Real)
inertial2lane(mgr)
pos = get_lanepos(mgr)
```

Copy a foot point into the inertial position. `get_footpoint` returns foot point inertial (real-world) co-ordinate.
```julia
mgr = OdrManagerLite()
footpoint2inertial(mgr)
get_footpoint(mgr)
```
