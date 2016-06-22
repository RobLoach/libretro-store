local featured = {}
featured.__index = featured

function newFeatured()
	local n = {}

	n.list = {
		{ x = 255, y =   0, w = 480, h = 320, img = lutro.graphics.newImage("assets/dino.png") },
		{ x = 255, y = 325, w = 480, h = 170, img = lutro.graphics.newImage("assets/cs.png") },
		{ x = 740, y =   0, w = 480, h = 495, img = lutro.graphics.newImage("assets/sienna.png") },
	}

	n.cursor = 1

	return setmetatable(n, featured)
end

function featured:gamepadpressed(i, k)
	if k == "down" then
		if self.cursor < #self.list then
			self.cursor = self.cursor + 1
			--lutro.audio.play(hover)
		end
	elseif k == "up" then
		if (self.cursor > 1) then
			self.cursor = self.cursor - 1
			--lutro.audio.play(hover)
		end
	elseif k == "left" then
		state = "categories"
	end
end

function featured:update(dt)
end

function featured:draw()
	for i,ni in ipairs(self.list) do
		if i == self.cursor then
			lutro.graphics.setColor(255, 255, 255)
			lutro.graphics.rectangle("fill", ni.x + c.x - 1, ni.y + c.y - 1, ni.w + 2, ni.h + 2)
			lutro.graphics.setColor(255, 166, 74)
		else
			lutro.graphics.setColor(230, 126, 34)
		end
		lutro.graphics.rectangle("fill", ni.x + c.x, ni.y + c.y, ni.w, ni.h)
		lutro.graphics.draw(ni.img, ni.x + c.x, ni.y + c.y)
	end
end

