-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

local physics = require( "physics" )
physics.start()

local tapCount = 0

local background = display.newImageRect( "images/background.png", 360, 570 )
background.x = display.contentCenterX
background.y = display.contentCenterY

-- shadow
local tapTextShadow = display.newText( tapCount, display.contentCenterX + 1, 50 + 1, native.systemFont, 40 )
tapTextShadow:setFillColor( 0, 0, 0 )
-- white text
local tapText = display.newText( tapCount, display.contentCenterX, 50, native.systemFont, 40 )
tapText:setFillColor( 1, 1, 1 )

local platform = display.newImageRect( "images/platform.png", 300, 50 )
platform.x = display.contentCenterX
platform.y = display.contentHeight - (platform.height / 2)

local balloon = display.newImageRect( "images/balloon.png", 112, 112 )
balloon.x = display.contentCenterX
balloon.y = display.contentCenterY
balloon.alpha = 0.8

physics.addBody( balloon, "dynamic", { radius = 50, bounce = 0.3 } )
physics.addBody( platform, "static" )


local function pushBalloon()
	balloon:applyLinearImpulse( 0, -0.75, balloon.x, balloon.y )

	tapCount = tapCount + 1
    tapText.text = tapCount
    tapTextShadow.text = tapCount
end
balloon:addEventListener( "tap", pushBalloon )
