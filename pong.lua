require("ball")
require("score")
require("player")
require("ai")

local background = canvas:new('media/fancy-court.png')
local frames = 60
local frame = 1000 / frames
local x, y = 0, 0
local width, height = canvas:attrSize()
local dir = { x = 1, y = 1 }

function start()
  loop()
end

function update()
  moveBall(dir.x, dir.y)
  checkLimits()
  checkPaddleCollision()
end

function draw()
  canvas:attrColor (0,0,0,255);
  canvas:drawRect('fill', 0, 0, canvas:attrSize())
  
  canvas:compose(0, 0, background)
  
  drawScore()
  drawBall()
  drawPlayer()
  
  canvas:flush()
end

loop = function ()
  update()
  draw()
  event.timer(frame, loop)
end

function checkLimits()
  if (ball.x > width - ball.w) or (ball.x < 0) then
    dir.x = dir.x * -1
  end
  if (ball.y < 0) or (ball.y > height - ball.h) then
    dir.y = dir.y * -1
  end
end

function checkPaddleCollision()
  if (ball.x >  playerPaddle.x) and (ball.x < playerPaddle.x + playerPaddle.w) then
    if (ball.y > playerPaddle.y) and (ball.y < playerPaddle.y + playerPaddle.h) then
      dir.x = dir.x * -1
    end
  end

--  if (ball.x < playerPaddle.x + playerPaddle.w) and (ball.x + ball.w > playerPaddle.x) and
--     (ball.y < playerPaddle.y + playerPaddle.h) and (ball.y + ball.h > playerPaddle.y) then
--    dir.x = dir.x * -1      
--  end
--  if (ball.x < playerPaddle.x + playerPaddle.w) and (ball.x + ball.w > playerPaddle.x) and
--     (ball.y < playerPaddle.y + playerPaddle.h) and (ball.y + ball.h > playerPaddle.y) then
--    dir.x = dir.x * -1      
--  end
end

function handler(evt) 
  if (evt.class == 'ncl') and (evt.type == 'presentation') and (evt.action == 'start') then
    start()
  end
  
  if (evt.class == 'key') and (evt.type == 'press') then
    if (evt.key == 'CURSOR_UP') then
      movePlayerUp()
    elseif (evt.key == 'CURSOR_DOWN') then
      movePlayerDown()
    end
  end
end
event.register(handler)