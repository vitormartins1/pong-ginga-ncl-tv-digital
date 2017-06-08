local ballSprite = canvas:new('media/fancy-ball.png')
local w, h = ballSprite:attrSize()
local velocity = 2
ball = { x = 0, y = 0, w = w, h = h }


function drawBall()
  canvas:compose(ball.x, ball.y, ballSprite)
end

function moveBall(dx, dy)
  ball.x = ball.x + (velocity * 3 * dx)
  ball.y = ball.y + (velocity * 1 * dy)
end