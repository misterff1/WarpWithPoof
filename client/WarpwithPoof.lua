-- WarpwithPoof version 1.0  |  Original script: warptoPlayer by beatles1, script edit by Misterff1


function PoofStart(pos)
   ClientEffect.Play(AssetLocation.Game, { effect_id = 250, position = pos, angle = Angle() })
end

Network:Subscribe("PoofStart", PoofStart)