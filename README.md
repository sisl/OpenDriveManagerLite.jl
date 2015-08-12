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
odr = OdrManagerLite()
@assert(loadfile(odr, "myfile.xml"))

pos = create_position(odr)
activate_position(odr, pos)
```

Given any coordinate, one can set the inertal `OdrManagerLite` position and then transform it to the other three forms.

Convert an inertial coordinate to a track coordinate:
```julia
x = 2
```
