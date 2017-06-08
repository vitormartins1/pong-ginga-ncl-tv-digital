local img = canvas:new('media/fancy-paddle-blue.png')
local w, h = img:attrSize()
local speed = 8

playerPaddle = { x = 15, y = 300 - h/2, w = w, h = h }

function drawPlayer()
  canvas:compose(playerPaddle.x, playerPaddle.y, img)
end

function movePlayerUp()
  playerPaddle.y = playerPaddle.y - speed
end

function movePlayerDown()
  playerPaddle.y = playerPaddle.y + speed
end