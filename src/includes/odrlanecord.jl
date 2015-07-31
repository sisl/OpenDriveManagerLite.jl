export


type LaneCoord
	laneid::Cint
	offset::Cdouble



	function TrackCoord() 
	    trackcoord = new() # create one without setting any values
	    finalizer(trackcoord, obj ->begin
	        ccall((:freeTrackCoord, LIB_ODRMGR), Void, (Ptr{Void},), obj.prt)
	    end)
	        trackcoord
	end
	function TrackCoord(trackid::Int, s::Real, t::Real, z::Real=0.0, h::Real=0.0, p::Real=0.0, r::Real=0.0)
	    trackcoord =  new(trackid, s, t, z, h, p, r)
	    finalizer(trackcoord, obj ->begin
	        ccall((:freeTrackCoord, LIB_ODRMGR), Void, (Ptr{Void},), obj.prt)
	    end)
	        trackcoord
    end
    
end


