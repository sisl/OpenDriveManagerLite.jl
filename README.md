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
The components of each coordinate frame and how to create new instances of each frame. 

Inertial (AbstractCoord)
```Julia
type CoordIm <: AbstractCoord
    x::Cdouble
    y::Cdouble
    z::Cdouble
    h::Cdouble
    p::Cdouble
    r::Cdouble

    Coord()=new()
    Coord(x::Real, y::Real, z::Real, h::Real=0.0, p::Real=0.0, r::Real=0.0) =
        new(x, y, z, h, p, r)
end
```
Track (AbstractTrackCoord)
```Julia
type TrackCoordIm <: AbstractTrackCoord

    trackid::Cint # id of the corresponding track
    s::Cdouble    # distance along the track
    t::Cdouble    # distance perpendicular to the track
    z::Cdouble    # height
    h::Cdouble    # heading [rad]
    p::Cdouble    # pitch [rad]
    r::Cdouble    # roll [rad]

    TrackCoord() = new() # create one without setting any values
    TrackCoord(trackid::Integer, s::Real, t::Real, z::Real=0.0, h::Real=0.0, p::Real=0.0, r::Real=0.0) =
        new(trackid, s, t, z, h, p, r)
end
```
Lane (AbstractLaneCoord)
```Julia
type LaneCoordIm <: AbstractLaneCoord
    trackid::Cint # id of the corresponding track
    s::Cdouble    # distance along the track
    t::Cdouble    # distance perpendicular to the track
    z::Cdouble    # height
    h::Cdouble    # heading [rad]
    p::Cdouble    # pitch [rad]
    r::Cdouble 
    laneid::Cint
    offset::Cdouble

    LaneCoord() = new() # create one without setting any values
    LaneCoord(trackid::Integer, s::Real, t::Real, z::Real = 0.0, h::Real=0.0, p::Real=0.0, r::Real=0.0, laneid::Real=1,       
    offset::Real=0.0 ) =
        new(trackid, s, t, z, h, p, r, laneid, offset)
end
```
Foot (AbstractCoord). `footpoint` coordinates are inertial coordinates of the lane closest to the vehicle. 
```Julia
type CoordIm <: AbstractCoord
    x::Cdouble
    y::Cdouble
    z::Cdouble
    h::Cdouble
    p::Cdouble
    r::Cdouble

    Coord()=new()
    Coord(x::Real, y::Real, z::Real, h::Real=0.0, p::Real=0.0, r::Real=0.0) =
        new(x, y, z, h, p, r)
end
```
t
## Transformations 

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
set_trackpos(mgr, 0, 1.0, 2.0)
set_trackpos(mgr::OdrManagerLite, value::AbstractTrackCoord)
track2inertial(mgr)
pos = get_inertialpos(mgr)
```

Convert an inertial coordinate to a track coordinate:
```julia
set_inertialpos(mgr::OdrManagerLite, x::Real, y::Real, z::Real)
inertial2track(mgr)
pos = get_trackpos(mgr)
```

Convert a lane coordinate to an inertial coordinate:
```julia
set_lanepos(mgr::OdrManagerLite, value::AbstractLaneCoord)
lane2inertial(mgr)
pos = get_inertialpos(mgr)
```

Convert an inertial coordinate to a lane coordinate:
```julia
set_inertialpos(mgr::OdrManagerLite, x::Real, y::Real, z::Real)
inertial2lane(mgr)
pos = get_lanepos(mgr)
```

Copy a foot point into the inertial position. `get_footpoint` returns foot point inertial (real-world) co-ordinate. A position must be activate to using `footpoint`.
```julia
footpoint2inertial(mgr)
get_footpoint(mgr)
```

## For further documentation, see OpenDRIVE Manager Manuel
[![OpenDRIVE Manager](http://www.vires.com/docs/OdrMgrUserManualRevI.pdf)]


