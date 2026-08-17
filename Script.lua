local P=game:GetService("Players")local R=game:GetService("RunService")local U=game:GetService("UserInputService")local W=game:GetService("Workspace")local L=P.LocalPlayer
local UI
local ok,r=pcall(function()local s=game:HttpGet("https://raw.githubusercontent.com/finendss/VowLibrary/refs/heads/main/WINDUI.lua",true)local f=loadstring(s)if not f then error("loadstring nil")end return f()end)
if ok and r then UI=r end
if not UI then return end
local C=W.CurrentCamera or W:FindFirstChildWhichIsA("Camera")
W:GetPropertyChangedSignal("CurrentCamera"):Connect(function()C=W.CurrentCamera or W:FindFirstChildWhichIsA("Camera")end)
local hm=hookmetamethod or hookmetafunction local cc=checkcaller or function()return false end
local gnm=getnamecallmethod or function()return""end
local hf=hookfunction local nc=newcclosure
local function nd(t)local o,p=pcall(function()return Drawing.new(t)end)return o and p or nil end
local CP={["白色"]=Color3.fromRGB(255,255,255),["红色"]=Color3.fromRGB(255,60,60),["绿色"]=Color3.fromRGB(60,255,100),["蓝色"]=Color3.fromRGB(60,150,255),["黄色"]=Color3.fromRGB(255,230,0),["紫色"]=Color3.fromRGB(180,60,255),["青色"]=Color3.fromRGB(0,255,230),["粉色"]=Color3.fromRGB(255,100,200),["橙色"]=Color3.fromRGB(255,150,0),["灰色"]=Color3.fromRGB(150,150,150)}
local SM={"Raycast","FindPartOnRay","FindPartOnRayWithIgnoreList","FindPartOnRayWithWhitelist","ScreenPointToRay","ViewportPointToRay","Ray"}
local K={SA={En=false,FOV=150,Dist=500,HC=100,HS=100,TP="Head",WC=false,TC=true,Mt="Raycast",FF=true,FY=220,TL=false,IP=false},FC={En=false,Cl=Color3.fromRGB(255,255,255),Tr=50,Fl=false,Th=1,CE=false,CS="圆点",CZ=6},ESP={En=false,Bx=true,HB=true,Nm=true,Ds=true,Tr=false,Sk=false,VC=false,TC=true,MD=500,Cl=Color3.fromRGB(60,255,100),TCe=false,EVC=Color3.fromRGB(255,60,60),ENC=Color3.fromRGB(150,150,150),MVC=Color3.fromRGB(60,150,255),MNC=Color3.fromRGB(150,150,150)},HB={En=false,HEn=true,CEn=false,HS=5,CS=5,TC=true,Tr=50}}
local Bn={{"Head","UpperTorso"},{"UpperTorso","LowerTorso"},{"UpperTorso","LeftUpperArm"},{"LeftUpperArm","LeftLowerArm"},{"LeftLowerArm","LeftHand"},{"UpperTorso","RightUpperArm"},{"RightUpperArm","RightLowerArm"},{"RightLowerArm","RightHand"},{"LowerTorso","LeftUpperLeg"},{"LeftUpperLeg","LeftLowerLeg"},{"LeftLowerLeg","LeftFoot"},{"LowerTorso","RightUpperLeg"},{"RightUpperLeg","RightLowerLeg"},{"RightLowerLeg","RightFoot"}}
local B6={{"Head","Torso"},{"Torso","Left Arm"},{"Torso","Right Arm"},{"Torso","Left Leg"},{"Torso","Right Leg"}}
local function al(p)if not p or not p.Character then return false end local h=p.Character:FindFirstChildOfClass("Humanoid")return h~=nil and h.Health>0 end
local function rp(c)if not c then return nil end return c:FindFirstChild("HumanoidRootPart")or c:FindFirstChild("Torso")or c:FindFirstChild("LowerTorso")end
local function hd2(c)return c and c:FindFirstChild("Head")end
local function st(p)if not K.SA.TC then return false end if not L.Team or not p.Team then return false end return p.Team==L.Team end
local function ste(p)if not K.ESP.TC then return false end if not L.Team or not p.Team then return false end return p.Team==L.Team end
local function vis(t,c)if not t then return false end local o=C.CFrame.Position local d=t.Position-o local r=RaycastParams.new()r.FilterDescendantsInstances={L.Character,c}r.FilterType=Enum.RaycastFilterType.Exclude r.RespectCanCollide=true local h=W:Raycast(o,d,r)return not h or h.Instance:IsDescendantOf(c)end
local function ap()if K.SA.FF then local v=C.ViewportSize return Vector2.new(v.X/2,K.SA.FY)else return U:GetMouseLocation()end end
local its=false
local function gt()if its then return nil end its=true
local cp,cd=nil,math.huge local a=ap()local co=C.CFrame.Position
for _,p in ipairs(P:GetPlayers())do if p~=L and al(p)and not st(p)then local c=p.Character local r=rp(c)local h=hd2(c)if r and h then local d3=(r.Position-co).Magnitude if d3<=K.SA.Dist then local ck=r if K.SA.TP=="Head"then ck=h end local sp,os2=C:WorldToViewportPoint(ck.Position)if os2 then local sd=(Vector2.new(sp.X,sp.Y)-a).Magnitude if sd<=K.SA.FOV and sd<cd then local cs=not K.SA.WC or vis(ck,c)if cs then if K.SA.TP=="Auto"then if math.random(1,100)<=K.SA.HS then cp=h else cp=r end else cp=ck end cd=sd end end end end end end end
its=false return cp end
local FG=Instance.new("ScreenGui")FG.Name="FOVGui"FG.IgnoreGuiInset=true FG.ResetOnSpawn=false FG.Parent=L:WaitForChild("PlayerGui")
local FF=Instance.new("Frame",FG)FF.AnchorPoint=Vector2.new(0.5,0.5)FF.Position=UDim2.new(0.5,0,0,K.SA.FY)FF.Size=UDim2.fromOffset(K.SA.FOV*2,K.SA.FOV*2)FF.BackgroundTransparency=1 FF.Visible=false
Instance.new("UICorner",FF).CornerRadius=UDim.new(1,0)
local FS=Instance.new("UIStroke",FF)FS.Thickness=1 FS.Color=K.FC.Cl FS.Transparency=K.FC.Tr/100
local FC2=nd("Circle")if FC2 then FC2.Radius=3 FC2.Color=K.FC.Cl FC2.Filled=true FC2.Visible=false end
local TL=nd("Line")if TL then TL.Thickness=1 TL.Color=Color3.fromRGB(255,255,0)TL.Visible=false end
local CL1=nd("Line")local CL2=nd("Line")for _,l in ipairs({CL1,CL2})do if l then l.Thickness=1 l.Color=Color3.fromRGB(255,255,255)l.Visible=false end end
local IPG=Instance.new("ScreenGui")IPG.Name="AimInfo"IPG.IgnoreGuiInset=true IPG.ResetOnSpawn=false IPG.Parent=L:WaitForChild("PlayerGui")
local IPF=Instance.new("Frame",IPG)IPF.Size=UDim2.fromOffset(180,70)IPF.Position=UDim2.new(1,-190,0.5,-35)IPF.BackgroundColor3=Color3.fromRGB(20,20,20)IPF.BackgroundTransparency=0.2 IPF.Visible=false IPF.Active=true
Instance.new("UICorner",IPF).CornerRadius=UDim.new(0,6)
local IPT=Instance.new("TextLabel",IPF)IPT.Size=UDim2.new(1,-10,1,-10)IPT.Position=UDim2.fromOffset(5,5)IPT.BackgroundTransparency=1 IPT.Font=Enum.Font.Gotham IPT.TextSize=12 IPT.TextColor3=Color3.fromRGB(255,255,255)IPT.TextXAlignment=Enum.TextXAlignment.Left IPT.TextYAlignment=Enum.TextYAlignment.Top IPT.Text="无目标"
local dg,dp=false,nil
IPF.InputBegan:Connect(function(i)if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then dg=true dp=i.Position-IPF.AbsolutePosition end end)
U.InputEnded:Connect(function(i)if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then dg=false end end)
U.InputChanged:Connect(function(i)if dg and(i.UserInputType==Enum.UserInputType.MouseMovement or i.UserInputType==Enum.UserInputType.Touch)then local np=i.Position-dp IPF.Position=UDim2.fromOffset(np.X,np.Y)end end)
local oN,oR,hN,hR=false,false,false,false
local function sh()if not hm then return false end
local function nh(...)local m=gnm()if not K.SA.En or cc()or its then return oN(...)end
if m~=K.SA.Mt and m:lower()~=K.SA.Mt:lower()then return oN(...)end
if math.random(1,100)>K.SA.HC then return oN(...)end
local a={...}local s=a[1]
if m=="Raycast"then local o=a[2]local d=a[3]if o and d then local t=gt()if t then a[3]=(t.Position-o).Unit*d.Magnitude end end return oN(s,a[2],a[3],a[4])
elseif m=="FindPartOnRay"or m=="FindPartOnRayWithIgnoreList"or m=="FindPartOnRayWithWhitelist"then local r=a[2]if r and typeof(r)=="Ray"then local o=r.Origin local t=gt()if t then a[2]=Ray.new(o,(t.Position-o).Unit*r.Direction.Magnitude)end end return oN(unpack(a))
elseif m=="ScreenPointToRay"or m=="ViewportPointToRay"then if s==C then local t=gt()if t then local o=C.CFrame.Position return Ray.new(o,(t.Position-o).Unit)end end end
return oN(...)end
if nc then oN=hm(game,"__namecall",nc(nh))else oN=hm(game,"__namecall",nh)end return true end
local function srh()if not hf then return false end
local function rh(o,d)if K.SA.En and K.SA.Mt=="Ray"and not cc()and not its and math.random(1,100)<=K.SA.HC then local t=gt()if t then d=(t.Position-o).Unit*d.Magnitude end end return oR(o,d)end
if nc then oR=hf(Ray.new,nc(rh))else oR=hf(Ray.new,rh)end return true end
hN=pcall(sh)hR=pcall(srh)
local vCache={}local vTimer=0
local function refreshVis()
local cnt=0
for _,p in ipairs(P:GetPlayers())do if p~=L and p.Character then cnt=cnt+1
if cnt>20 then vCache[p]=false
else local char=p.Character local o=C.CFrame.Position local pts={"Head","UpperTorso","Torso","HumanoidRootPart"}local rp2=RaycastParams.new()rp2.FilterType=Enum.RaycastFilterType.Exclude rp2.FilterDescendantsInstances={L.Character,char}local v=false
for _,pn in ipairs(pts)do local pt=char:FindFirstChild(pn)if pt then local d=pt.Position-o local h=W:Raycast(o,d,rp2)if not h or(h.Position-pt.Position).Magnitude<5 then v=true break end end end
vCache[p]=v end end end end
local EO={}
local function ce()local e={}
e.BO={nd("Line"),nd("Line"),nd("Line"),nd("Line")}for _,l in ipairs(e.BO)do if l then l.Thickness=3 l.Color=Color3.fromRGB(0,0,0)l.Visible=false end end
e.B={nd("Line"),nd("Line"),nd("Line"),nd("Line")}for _,l in ipairs(e.B)do if l then l.Thickness=1 l.Visible=false end end
e.HO=nd("Line")if e.HO then e.HO.Thickness=4 e.HO.Color=Color3.fromRGB(0,0,0)e.HO.Visible=false end
e.HB=nd("Line")if e.HB then e.HB.Thickness=2 e.HB.Visible=false end
e.N=nd("Text")if e.N then e.N.Size=14 e.N.Center=true e.N.Outline=true e.N.Color=Color3.fromRGB(255,255,255)e.N.Visible=false end
e.D=nd("Text")if e.D then e.D.Size=13 e.D.Center=true e.D.Outline=true e.D.Color=Color3.fromRGB(200,200,200)e.D.Visible=false end
e.T=nd("Line")if e.T then e.T.Thickness=1 e.T.Visible=false end
e.S={}for i=1,14 do e.S[i]=nd("Line")if e.S[i]then e.S[i].Thickness=1 e.S[i].Visible=false end end
return e end
local function re(e)if not e then return end for _,l in ipairs(e.BO)do pcall(function()l:Remove()end)end for _,l in ipairs(e.B)do pcall(function()l:Remove()end)end for _,l in ipairs(e.S)do pcall(function()l:Remove()end)end for _,o in pairs({e.HO,e.HB,e.N,e.D,e.T})do pcall(function()o:Remove()end)end end
local function he(e)if not e then return end for _,l in ipairs(e.BO)do l.Visible=false end for _,l in ipairs(e.B)do l.Visible=false end for _,l in ipairs(e.S)do l.Visible=false end for _,o in pairs({e.HO,e.HB,e.N,e.D,e.T})do o.Visible=false end end
for _,p in ipairs(P:GetPlayers())do if p~=L then EO[p]=ce()end end
P.PlayerAdded:Connect(function(p)if p~=L then EO[p]=ce()end end)
P.PlayerRemoving:Connect(function(p)if EO[p]then re(EO[p])EO[p]=nil end end)
R.RenderStepped:Connect(function()
local sf=K.FC.En FF.Visible=sf
FF.Size=UDim2.fromOffset(K.SA.FOV*2,K.SA.FOV*2)local fpos=K.SA.FF and UDim2.new(0.5,0,0,K.SA.FY)or UDim2.new(0.5,0,0.5,0)FF.Position=fpos FF.BackgroundColor3=K.FC.Cl FF.BackgroundTransparency=(K.FC.Fl and K.FC.Tr/100)or 1 FS.Color=K.FC.Cl FS.Thickness=K.FC.Th FS.Transparency=K.FC.Tr/100
local ap2=ap()local cz=K.FC.CZ local showCH=sf and K.FC.CE local cs=K.FC.CS if FC2 then FC2.Position=ap2 FC2.Color=K.FC.Cl FC2.Radius=cz/2 end
local showDot=showCH and(cs=="圆点"or cs=="圆点+十字")
local showCross=showCH and(cs=="十字"or cs=="圆点+十字")
local showX=showCH and cs=="X形"
if FC2 then FC2.Visible=showDot end
if CL1 and CL2 then if showCross then local cc2=K.FC.Cl CL1.Color=cc2 CL2.Color=cc2 CL1.Thickness=1 CL2.Thickness=1 CL1.From=Vector2.new(ap2.X-cz,ap2.Y)CL1.To=Vector2.new(ap2.X+cz,ap2.Y)CL2.From=Vector2.new(ap2.X,ap2.Y-cz)CL2.To=Vector2.new(ap2.X,ap2.Y+cz)CL1.Visible=true CL2.Visible=true
elseif showX then local cc2=K.FC.Cl CL1.Color=cc2 CL2.Color=cc2 CL1.Thickness=1 CL2.Thickness=1 CL1.From=Vector2.new(ap2.X-cz,ap2.Y-cz)CL1.To=Vector2.new(ap2.X+cz,ap2.Y+cz)CL2.From=Vector2.new(ap2.X-cz,ap2.Y+cz)CL2.To=Vector2.new(ap2.X+cz,ap2.Y-cz)CL1.Visible=true CL2.Visible=true
else CL1.Visible=false CL2.Visible=false end else if CL1 then CL1.Visible=false end if CL2 then CL2.Visible=false end end
local curT=nil
if K.SA.En and(K.SA.TL or K.SA.IP)then curT=gt()end
if TL then if curT then local sp,os2=C:WorldToViewportPoint(curT.Position)if os2 and sp.Z>0 then TL.From=ap()TL.To=Vector2.new(sp.X,sp.Y)TL.Visible=K.SA.TL else TL.Visible=false end else TL.Visible=false end end
if K.SA.IP then if curT then local tp=nil for _,pl in ipairs(P:GetPlayers())do if pl~=L and pl.Character and pl.Character:IsAncestorOf(curT)then tp=pl break end end if tp then local r=rp(tp.Character)local hu=tp.Character:FindFirstChildOfClass("Humanoid")local dist=r and math.floor((r.Position-C.CFrame.Position).Magnitude)or 0 local hp=hu and math.floor(hu.Health)or 0 IPT.Text="目标: "..tp.DisplayName.."\n距离: "..dist.."m\n血量: "..hp IPF.Visible=true else IPF.Visible=false end else IPF.Visible=false end else IPF.Visible=false end
if not K.ESP.En then for _,e in pairs(EO)do he(e)end return end
local vp={}for _,p in ipairs(P:GetPlayers())do vp[p]=true end
for p,e in pairs(EO)do if not vp[p]then re(e)EO[p]=nil end end
local now=tick()
if now-vTimer>0.15 then vTimer=now refreshVis()end
local myChar=L.Character local myRoot=myChar and rp(myChar)
local function ue(p,e)if p==L or not p.Parent then he(e)return end local c=p.Character if not c or not al(p)then he(e)return end if ste(p)then he(e)return end
local r=rp(c)local h=hd2(c)local hu=c:FindFirstChildOfClass("Humanoid")if not r or not h or not hu then he(e)return end
local dist3D=myRoot and(r.Position-myRoot.Position).Magnitude or(r.Position-C.CFrame.Position).Magnitude
if dist3D>K.ESP.MD then he(e)return end
local headPos=h.Position local feetPos=r.Position-Vector3.new(0,3,0)local topPos=headPos+Vector3.new(0,0.5,0)
local rs,ron=C:WorldToViewportPoint(r.Position)local hs=C:WorldToViewportPoint(topPos)local fs=C:WorldToViewportPoint(feetPos)
if not ron or rs.Z<=0 then he(e)return end
local vis=vCache[p]or false
local col=K.ESP.Cl
local isEnemy=L.Team and p.Team and p.Team~=L.Team
if K.ESP.TCe then if isEnemy then col=vis and K.ESP.EVC or K.ESP.ENC else col=vis and K.ESP.MVC or K.ESP.MNC end
elseif K.ESP.VC then col=vis and K.ESP.Cl or Color3.fromRGB(255,60,60)end
local boxTop,boxBottom=hs.Y,fs.Y local boxH=math.abs(boxBottom-boxTop)local boxW=boxH*0.6 local cx=rs.X
if K.ESP.Bx then
e.B[1].From=Vector2.new(cx-boxW/2,boxTop)e.B[1].To=Vector2.new(cx+boxW/2,boxTop)
e.B[2].From=Vector2.new(cx+boxW/2,boxTop)e.B[2].To=Vector2.new(cx+boxW/2,boxBottom)
e.B[3].From=Vector2.new(cx+boxW/2,boxBottom)e.B[3].To=Vector2.new(cx-boxW/2,boxBottom)
e.B[4].From=Vector2.new(cx-boxW/2,boxBottom)e.B[4].To=Vector2.new(cx-boxW/2,boxTop)
e.BO[1].From=e.B[1].From e.BO[1].To=e.B[1].To e.BO[2].From=e.B[2].From e.BO[2].To=e.B[2].To e.BO[3].From=e.B[3].From e.BO[3].To=e.B[3].To e.BO[4].From=e.B[4].From e.BO[4].To=e.B[4].To
for i=1,4 do e.B[i].Color=col e.B[i].Visible=true e.BO[i].Visible=true end
else for i=1,4 do e.B[i].Visible=false e.BO[i].Visible=false end end
if K.ESP.HB then local hp=math.clamp(hu.Health/hu.MaxHealth,0,1)local hH=boxH*hp
e.HB.Visible=true e.HB.Color=Color3.fromHSV(hp/2.5,0.89,0.75)e.HB.From=Vector2.new(cx-boxW/2-6,boxBottom)e.HB.To=Vector2.new(cx-boxW/2-6,boxBottom-hH)
e.HO.Visible=true e.HO.From=Vector2.new(cx-boxW/2-6,boxTop)e.HO.To=Vector2.new(cx-boxW/2-6,boxBottom)
else e.HB.Visible=false e.HO.Visible=false end
if K.ESP.Nm then e.N.Visible=true e.N.Text=p.DisplayName e.N.Position=Vector2.new(cx,boxTop-18)e.N.Color=col else e.N.Visible=false end
if K.ESP.Ds then e.D.Visible=true e.D.Text=string.format("%.0f",dist3D).."m"e.D.Position=Vector2.new(cx,boxBottom+2)else e.D.Visible=false end
if K.ESP.Tr then local v=C.ViewportSize e.T.Visible=true e.T.From=Vector2.new(v.X/2,v.Y)e.T.To=Vector2.new(cx,boxBottom)e.T.Color=col else e.T.Visible=false end
if K.ESP.Sk then local bones=c:FindFirstChild("Torso")and B6 or Bn
for i,b in ipairs(bones)do if e.S[i]then local p1=c:FindFirstChild(b[1])local p2=c:FindFirstChild(b[2])if p1 and p2 then local s1,o1=C:WorldToViewportPoint(p1.Position)local s2,o2=C:WorldToViewportPoint(p2.Position)if o1 and o2 and s1.Z>0 and s2.Z>0 then e.S[i].From=Vector2.new(s1.X,s1.Y)e.S[i].To=Vector2.new(s2.X,s2.Y)e.S[i].Color=col e.S[i].Visible=true else e.S[i].Visible=false end else e.S[i].Visible=false end end end
for i=#bones+1,14 do if e.S[i]then e.S[i].Visible=false end end
else for i=1,14 do if e.S[i]then e.S[i].Visible=false end end end end
for p,e in pairs(EO)do ue(p,e)end end)
local HBS={}
local function rhb(p)if HBS[p]then for part,o in pairs(HBS[p])do if part and part.Parent then part.Size=o.Sz part.Transparency=o.Tr end end HBS[p]=nil end end
P.PlayerRemoving:Connect(function(p)rhb(p)end)
R.Heartbeat:Connect(function()
if not K.HB.En then for p in pairs(HBS)do rhb(p)end return end
for _,p in ipairs(P:GetPlayers())do
if p==L or not al(p)or(K.HB.TC and st(p))then rhb(p)
else local c=p.Character if c then
local tgts={}
if K.HB.HEn then local h=c:FindFirstChild("Head")if h then tgts[h]=K.HB.HS end end
if K.HB.CEn then local t=c:FindFirstChild("UpperTorso")or c:FindFirstChild("Torso")if t then tgts[t]=K.HB.CS end end
if HBS[p]then for part in pairs(HBS[p])do if not tgts[part]then part.Size=HBS[p][part].Sz part.Transparency=HBS[p][part].Tr HBS[p][part]=nil end end end
for part,sz in pairs(tgts)do if not HBS[p]then HBS[p]={}end if not HBS[p][part]then HBS[p][part]={Sz=part.Size,Tr=part.Transparency}end part.Size=Vector3.new(sz,sz,sz)part.Transparency=K.HB.Tr/100 part.CanCollide=false end
end end end end)
local WD=UI:CreateWindow({Title="血与铁脚本",Icon="swords",Author="血与铁脚本",Folder="BloodAndIron",Size=UDim2.fromOffset(400,420),Theme="Dark",HideSearchBar=false})
WD:EditOpenButton({Title="血与铁脚本",Icon="swords",CornerRadius=UDim.new(0,16),StrokeThickness=2,Color=ColorSequence.new(Color3.fromHex("FF6B6B")),Draggable=true})
local TT=WD:Tag({Title="00:00",Color=Color3.fromRGB(255,255,255)})
task.spawn(function()local h=0 while true do local n=os.date("*t")h=(h+0.01)%1 TT:SetTitle(string.format("%02d:%02d",n.hour,n.min))TT:SetColor(Color3.fromHSV(h,1,1))task.wait(0.06)end end)
WD:Tag({Title="手机端",Color=Color3.fromHex("#7FDBFF")})
local T1=WD:Tab({Title="静默自瞄",Icon="crosshair"})
T1:Section({Title="主要设置",TextXAlignment="Left",TextSize=17})
T1:Toggle({Title="开启静默自瞄",Value=false,Callback=function(s)K.SA.En=s UI:Notify({Title="静默自瞄",Content=s and"已开启"or"已关闭",Duration=3})end})
T1:Dropdown({Title="自瞄方式",Values=SM,Value="Raycast",Callback=function(v)K.SA.Mt=v UI:Notify({Title="自瞄方式",Content="已切换为: "..v,Duration=3})end})
T1:Slider({Title="FOV范围(像素)",Value={Min=50,Max=1000,Default=150},Increment=1,Callback=function(v)K.SA.FOV=v end})
T1:Slider({Title="最大距离(格)",Value={Min=50,Max=2000,Default=500},Increment=1,Callback=function(v)K.SA.Dist=v end})
T1:Slider({Title="命中率(%)",Value={Min=0,Max=100,Default=100},Increment=1,Callback=function(v)K.SA.HC=v end})
T1:Slider({Title="爆头率(%)[自动模式]",Value={Min=0,Max=100,Default=100},Increment=1,Callback=function(v)K.SA.HS=v end})
T1:Dropdown({Title="瞄准部位",Values={"头部","身体","自动"},Value="头部",Callback=function(v)if v=="头部"then K.SA.TP="Head"elseif v=="身体"then K.SA.TP="Body"else K.SA.TP="Auto"end end})
T1:Toggle({Title="穿墙检测",Value=false,Callback=function(s)K.SA.WC=s end})
T1:Toggle({Title="队伍检测",Value=true,Callback=function(s)K.SA.TC=s end})
T1:Section({Title="目标显示",TextXAlignment="Left",TextSize=17})
T1:Toggle({Title="目标连线(瞄准点到目标)",Value=false,Callback=function(s)K.SA.TL=s if TL then TL.Visible=false end end})
T1:Toggle({Title="目标信息面板",Value=false,Callback=function(s)K.SA.IP=s IPF.Visible=false end})
T1:Section({Title="固定FOV(移动端)",TextXAlignment="Left",TextSize=17})
T1:Toggle({Title="启用固定FOV",Value=true,Callback=function(s)K.SA.FF=s UI:Notify({Title="固定FOV",Content=s and"已开启"or"已关闭",Duration=3})end})
T1:Slider({Title="固定FOV Y轴位置",Value={Min=50,Max=500,Default=220},Increment=1,Callback=function(v)K.SA.FY=v end})
T1:Section({Title="FOV圆圈",TextXAlignment="Left",TextSize=17})
T1:Toggle({Title="显示FOV圆圈",Value=false,Callback=function(s)K.FC.En=s end})
T1:Dropdown({Title="圆圈颜色",Values={"白色","红色","绿色","蓝色","黄色","紫色","青色","粉色","橙色"},Value="白色",Callback=function(v)K.FC.Cl=CP[v]FS.Color=CP[v]if FC2 then FC2.Color=CP[v]end end})
T1:Slider({Title="圆圈透明度",Value={Min=0,Max=100,Default=50},Increment=1,Callback=function(v)K.FC.Tr=v end})
T1:Slider({Title="圆圈粗度",Value={Min=1,Max=10,Default=1},Increment=1,Callback=function(v)K.FC.Th=v FS.Thickness=v end})
T1:Toggle({Title="圆圈填充",Value=false,Callback=function(s)K.FC.Fl=s end})
T1:Section({Title="准心",TextXAlignment="Left",TextSize=17})
T1:Toggle({Title="显示准心",Value=false,Callback=function(s)K.FC.CE=s end})
T1:Dropdown({Title="准心样式",Values={"圆点","十字","X形","圆点+十字"},Value="圆点",Callback=function(v)K.FC.CS=v end})
T1:Slider({Title="准心大小",Value={Min=2,Max=30,Default=6},Increment=1,Callback=function(v)K.FC.CZ=v end})
local T2=WD:Tab({Title="ESP透视",Icon="eye"})
T2:Section({Title="主要设置",TextXAlignment="Left",TextSize=17})
T2:Toggle({Title="开启ESP透视",Value=false,Callback=function(s)K.ESP.En=s UI:Notify({Title="ESP透视",Content=s and"已开启"or"已关闭",Duration=3})end})
T2:Slider({Title="最大显示距离(格)",Value={Min=50,Max=20000,Default=500},Increment=10,Callback=function(v)K.ESP.MD=v end})
T2:Section({Title="视觉元素",TextXAlignment="Left",TextSize=17})
T2:Toggle({Title="显示方框",Value=true,Callback=function(s)K.ESP.Bx=s end})
T2:Toggle({Title="显示血条",Value=true,Callback=function(s)K.ESP.HB=s end})
T2:Toggle({Title="显示骨骼",Value=false,Callback=function(s)K.ESP.Sk=s end})
T2:Toggle({Title="显示名字",Value=true,Callback=function(s)K.ESP.Nm=s end})
T2:Toggle({Title="显示距离",Value=true,Callback=function(s)K.ESP.Ds=s end})
T2:Toggle({Title="显示连线",Value=false,Callback=function(s)K.ESP.Tr=s end})
T2:Section({Title="检测设置",TextXAlignment="Left",TextSize=17})
T2:Toggle({Title="可见性检测(可见绿色/不可见红色)",Value=false,Callback=function(s)K.ESP.VC=s end})
T2:Toggle({Title="队伍检测",Value=true,Callback=function(s)K.ESP.TC=s end})
T2:Dropdown({Title="ESP颜色(可见时)",Values={"白色","红色","绿色","蓝色","黄色","紫色","青色","粉色","橙色"},Value="绿色",Callback=function(v)K.ESP.Cl=CP[v]end})
T2:Section({Title="队伍颜色",TextXAlignment="Left",TextSize=17})
T2:Toggle({Title="启用队伍颜色(分敌我可见/不可见)",Value=false,Callback=function(s)K.ESP.TCe=s end})
T2:Dropdown({Title="敌方可见颜色",Values={"白色","红色","绿色","蓝色","黄色","紫色","青色","粉色","橙色"},Value="红色",Callback=function(v)K.ESP.EVC=CP[v]end})
T2:Dropdown({Title="敌方不可见颜色",Values={"白色","红色","绿色","蓝色","黄色","紫色","青色","粉色","橙色"},Value="灰色",Callback=function(v)K.ESP.ENC=CP[v]end})
T2:Dropdown({Title="我方可见颜色",Values={"白色","红色","绿色","蓝色","黄色","紫色","青色","粉色","橙色"},Value="蓝色",Callback=function(v)K.ESP.MVC=CP[v]end})
T2:Dropdown({Title="我方不可见颜色",Values={"白色","红色","绿色","蓝色","黄色","紫色","青色","粉色","橙色"},Value="灰色",Callback=function(v)K.ESP.MNC=CP[v]end})
local T3=WD:Tab({Title="Hitbox",Icon="box"})
T3:Section({Title="主要设置",TextXAlignment="Left",TextSize=17})
T3:Toggle({Title="开启Hitbox",Value=false,Callback=function(s)K.HB.En=s UI:Notify({Title="Hitbox",Content=s and"已开启"or"已关闭",Duration=3})end})
T3:Toggle({Title="队伍检测",Value=true,Callback=function(s)K.HB.TC=s end})
T3:Section({Title="部位放大",TextXAlignment="Left",TextSize=17})
T3:Toggle({Title="头部放大",Value=true,Callback=function(s)K.HB.HEn=s end})
T3:Toggle({Title="胸部放大",Value=false,Callback=function(s)K.HB.CEn=s end})
T3:Slider({Title="头部放大尺寸(格)",Value={Min=1,Max=20,Default=5},Increment=1,Callback=function(v)K.HB.HS=v end})
T3:Slider({Title="胸部放大尺寸(格)",Value={Min=1,Max=20,Default=5},Increment=1,Callback=function(v)K.HB.CS=v end})
T3:Slider({Title="放大透明度",Value={Min=0,Max=100,Default=50},Increment=1,Callback=function(v)K.HB.Tr=v end})
local T4=WD:Tab({Title="设置",Icon="settings"})
T4:Section({Title="关于",TextXAlignment="Left",TextSize=17})
T4:Paragraph({Title="血与铁脚本",Desc="本脚本主要缝合vape v4;此脚本为AI脚本 如被圈钱概不负责"})
T4:Section({Title="状态检测",TextXAlignment="Left",TextSize=17})
T4:Paragraph({Title="执行器兼容性",Desc="hookmetamethod: "..(hm and"[OK]"or"[X]").."\nhookfunction: "..(hf and"[OK]"or"[X]").."\nNamecall Hook: "..(hN and"[OK]已安装"or"[X]失败").."\nRay Hook: "..(hR and"[OK]已安装"or"[X]失败")})
T4:Section({Title="操作",TextXAlignment="Left",TextSize=17})
T4:Button({Title="卸载脚本",Callback=function()UI:Notify({Title="卸载中",Content="正在清理...",Duration=2})K.SA.En=false K.SA.TL=false K.SA.IP=false K.ESP.En=false K.FC.En=false K.FC.CE=false K.HB.En=false for p in pairs(HBS)do rhb(p)end if oN and hm then pcall(function()hm(game,"__namecall",oN)end)oN=nil end if oR and hf then pcall(function()hf(Ray.new,oR)end)oR=nil end for _,l in ipairs({TL,CL1,CL2,FC2})do if l then pcall(function()l:Remove()end)end end pcall(function()FG:Destroy()end)pcall(function()IPG:Destroy()end)for _,e in pairs(EO)do re(e)end table.clear(EO)task.wait(1)pcall(function()if WD.Destroy then WD:Destroy()end end)end})
T4:Button({Title="复制Gitee源码库",Callback=function()if setclipboard then setclipboard("https://paste.rs/WYP3v.txt")UI:Notify({Title="已复制",Content="信息已复制",Duration=3})else UI:Notify({Title="错误",Content="不支持复制",Duration=5})end end})
task.wait(0.5)
UI:Notify({Title="血与铁脚本",Content="加载成功!",Duration=5})
if not hN then task.wait(1)UI:Notify({Title="警告",Content="Namecall Hook失败,请更换执行器",Duration=10})end
if not hR then task.wait(0.5)UI:Notify({Title="提示",Content="Ray方式不可用",Duration=8})end