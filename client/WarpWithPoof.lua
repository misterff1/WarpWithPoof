-------------------------------------------------------------------------------------------------
----|	   								      Warp-With-Poof  v1.1								           |----
----|								         Original script by beatles1								     |----
----|			    					 	          By Misterff1								              |----
-------------------------------------------------------------------------------------------------

function PoofStart(pos) 

   ClientEffect.Play(AssetLocation.Game, { effect_id = 250, position = pos, angle = Angle() })
   
end 
 
Network:Subscribe("PoofStart", PoofStart) 
