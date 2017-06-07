local frames = 60
local frame = 1000 / frames

function update() {
}

function draw() {
  canvas:attrColor('black')
  canvas:drawRect('fill', 0, 0, canvas:attrSize())
  canvas:attrFont ('vera', 110,'bold')
  canvas:drawText('pong')
  canvas:flush()
}

loop = function () {
  update()
  draw()
  event.timer(frame, loop)
} 