local frames = 60
local frame = 1000 / frames
local x, y = 0, 0

function update()
  
end

function draw()
  canvas:attrColor (0,0,0,255);
  canvas:drawRect('fill', 0, 0, canvas:attrSize())
  canvas:attrColor (255,255,255,255);
  canvas:attrFont ('vera', 20,'bold')
  canvas:drawText(x, y, 'pong')
  canvas:flush()
end

loop = function ()
  update()
  draw()
  event.timer(frame, loop)
end

function handler(evt) 
  if (evt.class == 'ncl') and (evt.type == 'presentation') and (evt.action == 'start') then
--    draw()
    loop()
  end
  
  if (evt.class == 'key') and (evt.type == 'press') and (evt.key == 'CURSOR_RIGHT') then
    x = x + 5
  end
end
event.register(handler)