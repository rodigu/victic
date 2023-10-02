-- title:   Lua Vectic Sample
-- author:  game developer, email, etc.
-- desc:    short description
-- site:    website link
-- license: MIT License (change this to your license of choice)
-- version: 0.1
-- script:  lua

W=240
H=136

---@type fun(x:number,y:number):Vectic
function NewVec(x,y)
	local toVec=function(v)
		if type(v)=='number' then
			return NewVec(v,v)
		end
		return v
	end
	---@type Vectic
	local v={
		x=x,
		y=y,
		add=function(v,v2)
			v2=toVec(v2)
			return NewVec(v.x+v2.x,v.y+v2.y)
		end,
		sub=function(v,v2)
			v2=toVec(v2)
			return NewVec(v.x-v2.x,v.y-v2.y)
		end,
		mul=function(v,v2)
			v2=toVec(v2)
			return NewVec(v.x*v2.x,v.y*v2.y)
		end,
		repr=function(v) return "NewVec("..v.x..", "..{v.y}..")"end,
		div=function(v,v2)
			v2=toVec(v2)
			return NewVec(v.x/v2.x,v.y/v2.y)
		end,
		floordiv=function(v,v2)
			v2=toVec(v2)
			return NewVec(v.x//v2.x,v.y//v2.y)
		end,
		floor=function(v)return Vectic.floordiv(v,1)end,
		dist2=function(v,v2)
			v2=toVec(v2)
			return(v.x-v2.x)^2+(v.y-v2.y)^2
		end,
		dist=function(v,v2)
			v2=toVec(v2)
			return math.sqrt(Vectic.dist2(v,v2))
		end,
		norm=function(v)return Vectic.dist(v,Vectic.zero())end,
		len=Vectic.norm,
		eq=function(v,v2)
			v2=toVec(v2)
			return v.x==v2.x and v.y==v2.y
		end,
		normalize=function(v)return v:div(v:norm()) end,
		rotate=function(v,t)return NewVec(v.x*math.cos(t)-v.x*math.sin(t),v.y*math.sin(t)+v.y*math.cos(t))end,
		copy=function(v)return NewVec(v.x,v.y)end,
		zero=function()return NewVec(0,0)end,
		xy=function(v)return v.x,v.y end
	}
	return v
end

function TIC()
  cls(0)
end

-- <TILES>
-- 001:eccccccccc888888caaaaaaaca888888cacccccccacc0ccccacc0ccccacc0ccc
-- 002:ccccceee8888cceeaaaa0cee888a0ceeccca0ccc0cca0c0c0cca0c0c0cca0c0c
-- 003:eccccccccc888888caaaaaaaca888888cacccccccacccccccacc0ccccacc0ccc
-- 004:ccccceee8888cceeaaaa0cee888a0ceeccca0cccccca0c0c0cca0c0c0cca0c0c
-- 017:cacccccccaaaaaaacaaacaaacaaaaccccaaaaaaac8888888cc000cccecccccec
-- 018:ccca00ccaaaa0ccecaaa0ceeaaaa0ceeaaaa0cee8888ccee000cceeecccceeee
-- 019:cacccccccaaaaaaacaaacaaacaaaaccccaaaaaaac8888888cc000cccecccccec
-- 020:ccca00ccaaaa0ccecaaa0ceeaaaa0ceeaaaa0cee8888ccee000cceeecccceeee
-- </TILES>

-- <WAVES>
-- 000:00000000ffffffff00000000ffffffff
-- 001:0123456789abcdeffedcba9876543210
-- 002:0123456789abcdef0123456789abcdef
-- </WAVES>

-- <SFX>
-- 000:000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000304000000000
-- </SFX>

-- <TRACKS>
-- 000:100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- </TRACKS>

-- <PALETTE>
-- 000:1a1c2c5d275db13e53ef7d57ffcd75a7f07038b76425717929366f3b5dc941a6f673eff7f4f4f494b0c2566c86333c57
-- </PALETTE>
