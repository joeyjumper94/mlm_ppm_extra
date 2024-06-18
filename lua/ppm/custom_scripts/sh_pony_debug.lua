local FCVAR_REPLICATED_ARCHIVE=FCVAR_REPLICATED
if SERVER then
	FCVAR_REPLICATED_ARCHIVE=bit.bor(FCVAR_REPLICATED,FCVAR_ARCHIVE)
end
local name="ppm_hull_debug"
local ConVar=CreateConVar(name,"0",FCVAR_REPLICATED_ARCHIVE,"debug pony hulls",0,1)
hook.Add("PostPlayerDraw",name,function(Player,flags)
	if ConVar:GetBool()then
		local ponydata=PPM.getPonyValues(Player)
		local bodyheight=math.Clamp(ponydata.bodyheight,PPM.height_min,PPM.height_max)*.05
		local neckheight=math.Clamp(ponydata.neckheight,PPM.height_min,PPM.height_max)*.05
		local scale=0.9+bodyheight+neckheight
		local min,max=Player:GetHull()
		max.z=55*scale
		min=min*Player:GetModelScale()
		max=max*Player:GetModelScale()
		render.DrawWireframeBox(Player:GetPos(),Angle(),min,max,Color(255,255,255))
	end
end)


