local width, height = canvas:attrSize()

function drawScore()
  canvas:attrColor (255,255,255,255);
  canvas:attrFont ('vera', 60,'bold')
  
  canvas:drawText(10, 0, '3')
  canvas:drawText(width - 50, 0, '2')
end