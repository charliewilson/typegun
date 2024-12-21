local helpers = {}

function helpers:splitWord(str)
	local t = {}
	for i = 1, #str do
		t[#t + 1] = string.sub(str, i, i)
	end

	return t
end

function helpers:dump(o)
	if type(o) == "table" then
		local s = "{ "
		for k, v in pairs(o) do
			if type(k) ~= "number" then
				k = '"' .. k .. '"'
			end
			s = s .. "[" .. k .. "] = " .. helpers:dump(v) .. ","
		end
		return s .. "} "
	else
		return tostring(o)
	end
end

function helpers:setColor(colourName)
	local c = Colours[colourName]
	love.graphics.setColor(love.math.colorFromBytes(c[1], c[2], c[3]))
end

return helpers
