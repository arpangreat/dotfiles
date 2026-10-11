function upgrade_uv
	for i in (uv tool list|awk '{print $1}')
		if not contains - $i
				uv tool upgrade $i
		end
	end
end
