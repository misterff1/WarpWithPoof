-- WarpwithPoof version 1.0  |  Original script: warptoPlayer by beatles1, script edit by Misterff1


local noWarpTable = {}

warpToPlayer = function(args)
	local msg = args.text
	local player = args.player
 
	if ( msg:sub(1, 1) ~= "/" ) then
		return true
	end
 
	local cmdargs = args.text:split(" ")
 
	if (cmdargs[1] == "/goto") then
		local name = msg:gsub("/goto ", ""):gsub(" $", "")
		local results = Player.Match(name)
		if #results < 1 then
			Chat:Send(player, "Could not find a player with that name.", Color(200, 50, 200))
		else
			local b = results[1]
			local steamid = b:GetSteamId().id
			local cantwarp = noWarpTable[steamid]
			if not cantwarp then
				-- Send the effect to everyone near you
				Network:SendNearby(args.player, "PoofStart", args.player:GetPosition())
					
				Chat:Send(b, player:GetName() .." has warped to you.", Color(200, 50, 200))
				Chat:Send(player, "You have warped to ".. b:GetName() ..".", Color(200, 50, 200))
				local vector = b:GetPosition()
				vector.x = vector.x + 2
				player:SetPosition(vector)
			else
				Chat:Send(player,  b:GetName() .." has disabled warping to them.", Color(200, 50, 200))
			end
		end
		return false
	
	elseif (cmdargs[1] == "/togglewarp") or (cmdargs[1] == "/warpoff") then
		local steamid = player:GetSteamId().id
		noWarpTable[steamid] = not noWarpTable[steamid]
		if not noWarpTable[steamid] then
			Chat:Send(player, "People can now warp to you.", Color(200, 50, 200))
		else
			Chat:Send(player, "People can no longer warp to you.", Color(200, 50, 200))
		end
	end
	return true
end
Events:Subscribe("PlayerChat", warpToPlayer)

removeFromWarpTable = function(args)
	local player = args.player
	local steamid = player:GetSteamId().id
	noWarpTable[steamid] = nil
end
Events:Subscribe("PlayerQuit", removeFromWarpTable)
