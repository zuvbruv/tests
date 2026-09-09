local a local aa,ab,ac,ad,ae,af,ag,ah,ai,b,c,d,e,f,g,h,i,j,k,l,m={function()local b,c,d=a(1)local e return(function(...)
local f,g,h,i,j=d(c.utility.variables),d(c.utility.image),d(c.utility.locale),d(c.utility.constants),d(c.types)export
type Theme=j.Theme export type Translator=j.Translator export type Translations=j.Translations export type
WindowConfiguration=j.WindowConfiguration export type WindowProps=j.WindowProps export type TabProps=j.TabProps export
type TagProps=j.TagProps export type SectionProps=j.SectionProps export type GroupProps=j.GroupProps export type
ButtonProps=j.ButtonProps export type ToggleProps=j.ToggleProps export type SliderProps=j.SliderProps export type
DropdownProps=j.DropdownProps export type InputProps=j.InputProps export type KeybindProps=j.KeybindProps export type
ColorPickerProps=j.ColorPickerProps export type StatProps=j.StatProps export type ProgressProps=j.ProgressProps export
type ConsoleProps=j.ConsoleProps export type TextProps=j.TextProps export type DividerProps=j.DividerProps export type
NotifyProps=j.NotifyProps export type ToastProps=j.ToastProps export type PopupBox=j.PopupBox export type PopupOption=j.
PopupOption export type PopupProps=j.PopupProps export type Moveable=j.Moveable export type Lockable=j.Lockable export
type Window=j.Window export type Tab=j.Tab export type Group=j.Group export type Button=j.Button export type Toggle=j.
Toggle export type Slider=j.Slider export type Dropdown=j.Dropdown export type Input=j.Input export type Keybind=j.
Keybind export type ColorPicker=j.ColorPicker export type Stat=j.Stat export type StatGroup=j.StatGroup export type
Progress=j.Progress export type Console=j.Console export type Section=j.Section export type TabSection=j.TabSection
export type Text=j.Text export type Divider=j.Divider export type Tag=j.Tag export type Popup=j.Popup export type
Rayfield=j.Rayfield type WindowModule={new:(j.WindowProps)->j.Window}local k={}::Rayfield local function l()local m=
Instance.new'ScreenGui'm.Name=f.httpService:GenerateGUID(false)m.ClipToDeviceSafeArea=false m.DisplayOrder=i.
displayOrder.banner m.IgnoreGuiInset=true m.ResetOnSpawn=false m.Enabled=true m.SafeAreaCompatibility=Enum.
SafeAreaCompatibility.None m.ScreenInsets=Enum.ScreenInsets.DeviceSafeInsets m.ZIndexBehavior=Enum.ZIndexBehavior.
Sibling m.Parent=f.guiContainer local n=Instance.new'ImageLabel'n.Name='Banner'n.AnchorPoint=Vector2.new(0.5,0.5)n.
BackgroundColor3=Color3.fromRGB(255,255,255)n.BackgroundTransparency=1 n.BorderColor3=Color3.fromRGB(0,0,0)n.
BorderSizePixel=0 n.Image=g.resolve(i.icons.banner)n.Position=UDim2.fromScale(0.5,0.5)n.Size=UDim2.fromOffset(262,60)n.
Parent=m return m end function k.CreateWindow(m,n:j.WindowProps):j.Window local o,p:j.Window?,q:(()->())?=(l())if f.
secureMode then g.preload(function(r)if r<=0 then return end local function s()if not p or p.unloaded then return end p:
Notify{title=h.resolve'Secure mode',content=if r==1 then h.resolve"An asset couldn't be cached and won't appear."else h.
resolve"Some assets couldn't be cached and won't appear."}end if p then s()else q=s end end)end local r,s=pcall(function
()return(d(c.components.window)::WindowModule).new(n)end)if not r then o:Destroy()error(s,0)end local t=s::j.Window p=t
do local u,v=pcall(function()local u=t:CreateTab{name='Home'}d(c.components.home).new(t,u,n)end)if not u then warn(
'Rayfield: Home tab failed to load:',v)end end if q then task.spawn(q)q=nil end if f.secureMode then task.spawn(function
()local u,v=f.fontManager:loadFont(i.fontAsset,Enum.FontWeight.Medium),f.fontManager:loadFont(i.fontAsset,Enum.
FontWeight.SemiBold)if not t.unloaded and u and v and u~=f.fallbackFont and v~=f.fallbackFont then t:ChangeTheme{Font=u,
TitleFont=v}end end)end task.spawn(function()task.wait(0.5)o:Destroy()task.wait(0.5)if not t.unloaded then t:Show()end
end)return t end return k end)()end,[3]=function()local b,c,d=a(3)local e return(function(...)local f={}f.__index=f f.
__type='Action'local g=c.Parent.Parent.utility local h,i,j=d(g.variables),d(g.log),d(g.HapticEngine)function f.new(k,l)l
=if typeof(l)=='table'then l else{}local m=setmetatable({window=assert(k,'Missing argument #1 (Window expected)'),name=l
.name or l.Name or'Action',icon=assert(l.icon or l.Icon,'Missing argument (Icon expected)'),callback=assert(l.callback
or l.Callback,'Missing argument (Function expected)'),linkedTab=l.linkedTab or l.LinkedTab},f)m.action=m.window:Create(
'Frame',{Name=m.name,BorderSizePixel=0,LayoutOrder=-(l.order or 0),Size=UDim2.fromOffset(24,24),BackgroundTransparency=1
,Parent=m.window.actionContainer})m.iconLabel=m.window:Create('ImageLabel',{Image=m.icon,Size=UDim2.fromOffset(20,20),
BorderSizePixel=0,AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),BackgroundTransparency=1,
ImageTransparency=1,Parent=m.action},{ImageColor3='ActionColor'})m.interact=m.window:Create('TextButton',{
BackgroundTransparency=1,Size=UDim2.fromScale(1,1),BorderSizePixel=0,Position=UDim2.fromScale(0.5,0.5),AnchorPoint=
Vector2.new(0.5,0.5),TextTransparency=1,Parent=m.action})local function n()if not m.window:_settled()then return end if
m.linkedTab and m.window.selectedTab==m.linkedTab then return end if m.isLit and m:isLit()then return end h.tweenService
:Create(m.iconLabel,TweenInfo.new(0.25,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{ImageTransparency=0.6}):Play()
end m.window:Connect(m.interact.MouseButton1Click,function()j.click()task.spawn(function()local o,p=pcall(m.callback)if
not o then i.warn(`Rayfield encountered an error, with the callback for a {m.__type} component named '{m.name}':`)i.
print(p)end n()end)end)m.window:Connect(m.interact.MouseEnter,function()if not m.window:_interactive()then return end h.
tweenService:Create(m.iconLabel,TweenInfo.new(0.25,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{ImageTransparency=
0.2}):Play()end)m.window:Connect(m.interact.MouseLeave,n)return m end return f end)()end,[4]=function()local b,c,d=a(4)
local e return(function(...)local f={}f.__index=f f.__type='Button'local g=c.Parent.Parent.utility local h,i,j,k,l,m=d(g
.variables),d(g.functions),d(g.moveable),d(g.lockable),d(g.locale),d(g.HapticEngine)function f.new(n,o)o=if typeof(o)==
'table'then o else{}local p=setmetatable({tab=assert(n,'Missing argument #1 (Tab expected)'),window=n.window,name=o.name
or o.Name or'Button',icon=o.icon or o.Icon,description=o.description or o.Description,compact=n.compact or false,
callback=o.callback or o.Callback or function()end},f)if p.compact then p:_buildCompact()else p:_buildFull()end if p.
description and not p.compact then p.descriptor=d(c.Parent.descriptor).new(p.tab,{description=p.description})end return
p end function f._runCallback(n)n.window:_runGuarded(n,n.callback)end function f._buildFull(n)n.main=n.window:Create(
'Frame',{Size=UDim2.new(1,-20,0,43),BorderSizePixel=0,Name=n.name,BackgroundColor3=Color3.fromRGB(255,255,255),
BackgroundTransparency=1,Parent=n.tab.tabPage},{BackgroundTransparency='ElementTransparency'})n.stroke=n.window:
StyleElementBody(n.main)n.hoverOverlay=n.window:CreateHoverOverlay(n.main)n.container=n.window:Create('Frame',{
BorderSizePixel=0,Parent=n.main,Size=UDim2.new(0,170,0,16),Position=UDim2.new(0,20,0.5,0),AnchorPoint=Vector2.new(0,0.5)
,BackgroundTransparency=1})n.containerLayout=n.window:Create('UIListLayout',{Padding=UDim.new(0,5),FillDirection=Enum.
FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.
Left,Parent=n.container})if n.icon then n.iconLabel=n.window:Create('ImageLabel',{Image=n.icon,Size=UDim2.fromOffset(16,
16),BorderSizePixel=0,BackgroundTransparency=1,ImageTransparency=1,Parent=n.container},{ImageColor3='ContentColor'})end
n.title=n.window:Create('TextLabel',{Text=l.t(n.name),Size=UDim2.fromOffset(250,16),BorderSizePixel=0,
BackgroundTransparency=1,TextSize=16,AutomaticSize=Enum.AutomaticSize.X,TextXAlignment=Enum.TextXAlignment.Left,
TextWrapped=true,LayoutOrder=1,TextTransparency=1,Parent=n.container},{TextColor3='ContentColor',FontFace='Font'})n.
interact=n.window:Create('TextButton',{BackgroundTransparency=1,Size=UDim2.fromScale(1,1),BorderSizePixel=0,Position=
UDim2.fromScale(0.5,0.5),AnchorPoint=Vector2.new(0.5,0.5),TextTransparency=1,Parent=n.main})n.window:_wireElementHover(n
)n.window:ConnectFor(n,n.interact.MouseButton1Click,function()m.click()h.tweenService:Create(n.stroke,TweenInfo.new(0.25
,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{Transparency=1}):Play()h.tweenService:Create(n.main,TweenInfo.new(0.6
,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{Size=UDim2.new(1,-26,0,43)}):Play()n:_runCallback()task.wait(
0.11)h.tweenService:Create(n.main,TweenInfo.new(0.25,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{Size=UDim2.
new(1,-20,0,43)}):Play()h.tweenService:Create(n.stroke,TweenInfo.new(0.25,Enum.EasingStyle.Quint,Enum.EasingDirection.
Out),{Transparency=n.window.theme.ElementStrokeTransparency}):Play()end)end function f._buildCompact(n)local o=n.window
n.main,n.stroke,n.interact=o:_buildCompactRow(n.tab,n.name)n.hoverOverlay=n.interact o:Create('UIPadding',{PaddingLeft=
UDim.new(0,16),PaddingRight=UDim.new(0,16),Parent=n.interact})o:Create('UIListLayout',{FillDirection=Enum.FillDirection.
Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.Center,Padding=
UDim.new(0,6),Parent=n.interact})if n.icon then n.iconLabel=o:Create('ImageLabel',{Image=n.icon,Size=UDim2.fromOffset(16
,16),BorderSizePixel=0,BackgroundTransparency=1,LayoutOrder=0,ImageTransparency=1,Parent=n.interact},{ImageColor3=
'ContentColor'})end n.title=o:Create('TextLabel',{Text=l.t(n.name),Size=UDim2.fromOffset(0,16),AutomaticSize=Enum.
AutomaticSize.X,BorderSizePixel=0,BackgroundTransparency=1,TextSize=16,TextXAlignment=Enum.TextXAlignment.Left,
TextTruncate=Enum.TextTruncate.AtEnd,LayoutOrder=1,TextTransparency=1,Parent=n.interact},{TextColor3='ContentColor',
FontFace='Font'})o:Create('UIFlexItem',{FlexMode=Enum.UIFlexMode.Shrink,Parent=n.title})n.window:_wireElementHover(n)n.
window:ConnectFor(n,n.interact.MouseButton1Click,function()m.click()h.tweenService:Create(n.stroke,TweenInfo.new(0.25,
Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{Transparency=1}):Play()n:_runCallback()task.wait(0.11)h.tweenService:
Create(n.stroke,TweenInfo.new(0.25,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{Transparency=n.window.theme.
ElementStrokeTransparency}):Play()end)end function f._setShown(n,o,p)if o then n.window:_revealCommon(n,p)else n.window:
_hideCommon(n,p)end end function f._minWidth(n)local o=32 if n.icon then o+=22 end o+=i.textWidth(n.window.theme.Font,16
,l.resolve(n.name))return o end j(f)k(f)return f end)()end,[5]=function()local b,c,d=a(5)local e return(function(...)
local f=c.Parent.Parent.utility local g,h,i,j,k,l,m,n,o=d(f.functions),d(f.locale),{},16,13,20,10,15,14 i.boxGap=8 i.
boxWidthInset=10 local function p(q)return if typeof(q)=='table'then q else{title=tostring(q)}end local function q(r)
return r.icon~=nil and r.icon~=0 and r.icon~=''end function i.measure(r,s,t)s=p(s)local u=q(s)local v=t-i.boxWidthInset-
j*2-(if u then l+m else 0)local w,x,y=g.textHeight(r.theme.TitleFont,n,h.resolve(s.title or s.Title or''),v),0,s.
description or s.Description if y and y~=''then x=g.textHeight(r.theme.Font,o,h.resolve(y),v)end local z=w+(if x>0 then
3+x else 0)local A=math.max(z,if u then l else 0)+k*2 return A,w,x,z end function i.measureAll(r,s,t)local u=0 for v,w
in s do local x=i.measure(r,w,t)u+=x if v<#s then u+=i.boxGap end end return u end function i.build(r,s,t,u,v,w)w=w or{}
t=p(t)local x,y,z,A,B,C=q(t),w.auto==true,i.measure(r,t,w.width or 0)local D=r:Create('Frame',{Name='Box',
BackgroundColor3=Color3.fromRGB(255,255,255),BorderSizePixel=0,Size=UDim2.new(1,-i.boxWidthInset,if y then 0 else 0,if y
then 0 else z),AutomaticSize=if y then Enum.AutomaticSize.Y else Enum.AutomaticSize.None,LayoutOrder=u,
BackgroundTransparency=1,Parent=s})v(D,'BackgroundTransparency',0)local E=r:StyleElementPanel(D)v(E,'Transparency',r.
theme.ElementStrokeTransparency)r:Create('UIPadding',{PaddingLeft=UDim.new(0,j),PaddingRight=UDim.new(0,j),PaddingTop=
UDim.new(0,k),PaddingBottom=UDim.new(0,k),Parent=D})r:Create('UIListLayout',{FillDirection=Enum.FillDirection.Horizontal
,VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.Left,SortOrder=Enum.
SortOrder.LayoutOrder,Padding=UDim.new(0,m),Parent=D})local F if x then F=r:Create('ImageLabel',{Image=t.icon,Size=UDim2
.fromOffset(l,l),BackgroundTransparency=1,BorderSizePixel=0,LayoutOrder=1,ImageTransparency=1,Parent=D},{ImageColor3=
'ContentColor'})v(F,'ImageTransparency',0)end local G=r:Create('Frame',{BackgroundTransparency=1,Size=UDim2.new(1,x and-
(l+m)or 0,if y then 0 else 0,if y then 0 else C),AutomaticSize=if y then Enum.AutomaticSize.Y else Enum.AutomaticSize.
None,LayoutOrder=2,Parent=D})r:Create('UIListLayout',{FillDirection=Enum.FillDirection.Vertical,SortOrder=Enum.SortOrder
.LayoutOrder,Padding=UDim.new(0,3),Parent=G})local H=r:Create('TextLabel',{Text=h.t(t.title or t.Title or''),Size=UDim2.
new(1,0,if y then 0 else 0,if y then 0 else A),AutomaticSize=if y then Enum.AutomaticSize.Y else Enum.AutomaticSize.None
,BackgroundTransparency=1,TextSize=n,TextXAlignment=Enum.TextXAlignment.Left,TextWrapped=true,LayoutOrder=1,
TextTransparency=1,Parent=G},{TextColor3='ContentColor',FontFace='TitleFont'})v(H,'TextTransparency',0)local I,J=t.
description or t.Description if I and I~=''then J=r:Create('TextLabel',{Text=h.t(I),Size=UDim2.new(1,0,if y then 0 else
0,if y then 0 else B),AutomaticSize=if y then Enum.AutomaticSize.Y else Enum.AutomaticSize.None,BackgroundTransparency=1
,TextSize=o,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,TextWrapped=true,LayoutOrder=
2,TextTransparency=1,Parent=G},{TextColor3='ContentColor',FontFace='Font'})v(J,'TextTransparency',0.65)end return{frame=
D,stroke=E,title=H,description=J,iconLabel=F,hasIcon=x}end return i end)()end,[6]=function()local b,c,d=a(6)local e
return(function(...)local f=c.Parent.Parent.utility local g,h,i,j,k,l,m=d(f.variables),d(f.filesystem),d(f.constants),d(
f.locale),d(f.HapticEngine),{},5 function l.buildCollapsedFace(n)local o=n.showIconOnly n.collapsedIcon=n:Create(
'ImageLabel',{Name='CollapsedIcon',AnchorPoint=if o then Vector2.new(0.5,0.5)else Vector2.new(0,0.5),Position=if o then
UDim2.fromScale(0.5,0.5)else UDim2.new(0,16,0.5,0),Size=UDim2.fromOffset(24,24),BackgroundTransparency=1,Image=n.
showIcon,ZIndex=i.zIndex.restoreContent,ImageTransparency=1,Parent=n.main},{ImageColor3='TitlingColor'})n:Create(
'UICorner',{Parent=n.collapsedIcon},{CornerRadius='PillCornerRadius'})local p=n:Create('Frame',{Name='CollapsedText',
Visible=not o,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,50,0.5,0),Size=UDim2.new(1,-60,0,32),
BackgroundTransparency=1,ZIndex=i.zIndex.restoreContent,Parent=n.main})n:Create('UIListLayout',{Padding=UDim.new(0,1),
VerticalAlignment=Enum.VerticalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,Parent=p})n.collapsedTitle=n:
Create('TextLabel',{Name='Title',Text=n.showName,Size=UDim2.new(1,0,0,16),BackgroundTransparency=1,FontFace=g.brandFont(
Enum.FontWeight.Medium),RichText=true,TextSize=16,TextWrapped=true,TextXAlignment=Enum.TextXAlignment.Left,LayoutOrder=1
,ZIndex=i.zIndex.restoreContent,TextTransparency=1,Parent=p},{TextColor3='TitlingColor'})n.collapsedSubtitle=n:Create(
'TextLabel',{Name='Subtitle',Text=j.t'Tap to show',Size=UDim2.new(1,0,0,14),BackgroundTransparency=1,FontFace=g.
brandFont(Enum.FontWeight.Medium),TextSize=14,TextXAlignment=Enum.TextXAlignment.Left,LayoutOrder=2,ZIndex=i.zIndex.
restoreContent,TextTransparency=1,Parent=p},{TextColor3='TitlingColor'})n.collapsedInteract=n:Create('TextButton',{Name=
'CollapsedInteract',BackgroundTransparency=1,Size=UDim2.fromScale(1,1),Text='',TextTransparency=1,Visible=false,ZIndex=i
.zIndex.restoreInteract,Parent=n.main})l.bindCollapsedDrag(n)end function l.bindCollapsedDrag(n)local o,p,q,r,s=g.
userInputService,false,false,Vector2.zero,Vector2.zero local function t()if n.screenGui and n.screenGui.IgnoreGuiInset
then return g.guiService:GetGuiInset()end return Vector2.zero end n:Connect(n.collapsedInteract.InputBegan,function(u,v)
if v or not n.hidden or n.animating then return end local w=u.UserInputType.Name if w~='MouseButton1'and w~='Touch'then
return end p,q=true,false s=o:GetMouseLocation()r=n.main.AbsolutePosition+n.main.AbsoluteSize*n.main.AnchorPoint-s end)n
:Connect(o.InputEnded,function(u)local v=u.UserInputType.Name if v~='MouseButton1'and v~='Touch'then return end if not p
then return end p=false if q then n._collapsedPosition=n.main.Position return end k.click()n:ToggleHide()end)n:Connect(o
.WindowFocusReleased,function()p=false end)n:Connect(g.runService.RenderStepped,function()if not p then return end if
not n.hidden or n.animating then p=false return end local u=o:GetMouseLocation()if not q and(u-s).Magnitude<m then
return end q=true local v=u+r+t()n.main.Position=UDim2.fromOffset(v.X,v.Y)end)end function l.isNewUser()local n=g.
localPlayer if not n then return false end if typeof(h.isfile)~='function'or typeof(h.writefile)~='function'then return
true end local o,p,q=g.fileSystemManager:getPath'lastuser.txt',tostring(n.UserId),true pcall(function()if h.isfile(o)
then q=h.readfile(o)~=p end end)pcall(function()h.writefile(o,p)end)return q end function l.setCollapsedShown(n,o,p)
local q={[n.collapsedIcon]={ImageTransparency=if o then 0 else 1}}if not n.showIconOnly then q[n.collapsedTitle]={
TextTransparency=if o then 0 else 1}q[n.collapsedSubtitle]={TextTransparency=if o then 0.5 else 1}end for r,s in q do if
p then g.tweenService:Create(r,p,s):Play()else for t,u in s do r[t]=u end end end end return l end)()end,[7]=function()
local b,c,d=a(7)local e return(function(...)local f={}f.__index=f f.__type='ColorPicker'local g=c.Parent.Parent.utility
local h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z=d(g.variables),d(g.functions),d(g.moveable),d(g.lockable),d(g.constants),d(g
.locale),d(g.HapticEngine),ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(255,0,0)),ColorSequenceKeypoint.
new(0.17,Color3.fromRGB(255,255,0)),ColorSequenceKeypoint.new(0.33,Color3.fromRGB(0,255,0)),ColorSequenceKeypoint.new(
0.5,Color3.fromRGB(0,255,255)),ColorSequenceKeypoint.new(0.67,Color3.fromRGB(0,0,255)),ColorSequenceKeypoint.new(0.83,
Color3.fromRGB(255,0,255)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,0,0))},41,52,Vector2.new(150,120),184,10,214,
10,240,62,8,400 local A,B,C,D,E,F,G,H={wide={height=190,previewPos=UDim2.new(1,-20,0,q+39),previewSize=UDim2.new(1,-(w+
20),0,78),hexPos=UDim2.new(0,w,0,q+90),hexSize=UDim2.new(1,-(w+20+x+y),0,30),alphaFieldPos=UDim2.new(1,-(20+x),0,q+90),
alphaFieldSize=UDim2.new(0,x,0,30)},narrow={height=296,previewPos=UDim2.new(1,-20,0,q+r.Y+40),previewSize=UDim2.new(1,-
40,0,56),hexPos=UDim2.new(0,20,0,q+r.Y+78),hexSize=UDim2.new(1,-(40+x+y),0,30),alphaFieldPos=UDim2.new(1,-(20+x),0,q+r.Y
+78),alphaFieldSize=UDim2.new(0,x,0,30)}},UDim2.new(1,-16,0,p/2),UDim2.fromOffset(40,22),TweenInfo.new(0.5,Enum.
EasingStyle.Exponential,Enum.EasingDirection.Out),TweenInfo.new(0.4,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),
TweenInfo.new(0.3,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),TweenInfo.new(0.12,Enum.EasingStyle.Quint,Enum.
EasingDirection.Out),TweenInfo.new(0.2,Enum.EasingStyle.Quint,Enum.EasingDirection.Out)local function I(J)return math.
clamp(J,0,1)end local function J(K)return math.clamp(math.round(K),0,255)end local K={black=Color3.fromRGB(0,0,0),white=
Color3.fromRGB(255,255,255),red=Color3.fromRGB(255,0,0),green=Color3.fromRGB(0,255,0),blue=Color3.fromRGB(0,0,255),
yellow=Color3.fromRGB(255,255,0),cyan=Color3.fromRGB(0,255,255),magenta=Color3.fromRGB(255,0,255),orange=Color3.fromRGB(
255,165,0),purple=Color3.fromRGB(128,0,128),pink=Color3.fromRGB(255,105,180),brown=Color3.fromRGB(139,69,19),gray=Color3
.fromRGB(128,128,128),grey=Color3.fromRGB(128,128,128)}local function L(M,N,O)if N<=0 then return Color3.new(O,O,O)end
local function P(Q,R,S)S=S%1 if S<0.16666666666666666 then return Q+(R-Q)*6*S elseif S<0.5 then return R elseif S<
0.6666666666666666 then return Q+(R-Q)*(0.6666666666666666-S)*6 end return Q end local Q=if O<0.5 then O*(1+N)else O+N-O
*N local R=2*O-Q return Color3.new(P(R,Q,M+0.3333333333333333),P(R,Q,M),P(R,Q,M-0.3333333333333333))end local function M
(N)local O={}for P in N:gmatch'[%d%.]+'do table.insert(O,tonumber(P))end return O end local function N(O)if typeof(O)~=
'string'then return nil end local P=(O:lower():match'^%s*(.-)%s*$')or''if P==''then return nil end if K[P]then return K[
P]end local Q,R=P:match'^(%a+)',M(P)if(Q=='hsv'or Q=='hsb')and#R>=3 then local S,T,U=(R[1]%360)/360,if R[2]>1 then R[2]/
100 else R[2],if R[3]>1 then R[3]/100 else R[3]return Color3.fromHSV(S,I(T),I(U))end if Q=='hsl'and#R>=3 then local S,T,
U=(R[1]%360)/360,if R[2]>1 then R[2]/100 else R[2],if R[3]>1 then R[3]/100 else R[3]return L(S,I(T),I(U))end if(Q=='rgb'
or Q=='rgba')and#R>=3 then return Color3.fromRGB(J(R[1]),J(R[2]),J(R[3]))end local S=P:match'^#?(%x%x%x%x%x%x)$'or P:
match'^#?(%x%x%x)$'or P:match'^0x(%x%x%x%x%x%x)$'if S then local T,U=pcall(Color3.fromHex,S)if T then return U end end
if#R>=3 and not Q then if R[1]<=1 and R[2]<=1 and R[3]<=1 then return Color3.new(I(R[1]),I(R[2]),I(R[3]))end return
Color3.fromRGB(J(R[1]),J(R[2]),J(R[3]))end return nil end local function O(P,Q)if typeof(P)=='Color3'then return P end
if typeof(P)=='string'then return N(P)or Q end return Q end function f.new(P,Q)Q=if typeof(Q)=='table'then Q else{}local
R=setmetatable({tab=assert(P,'Missing argument #1 (Tab expected)'),window=P.window,name=Q.name or Q.Name or
'Color Picker',icon=Q.icon or Q.Icon,description=Q.description or Q.Description,forgetState=Q.forgetState or Q.
ForgetState or P.forgetState,callback=Q.callback or Q.Callback or function()end,_isOpen=false},f)R.value=O(Q.color or Q.
Color or Q.value or Q.Value or Q.default,Color3.fromRGB(255,255,255))R.hue,R.sat,R.val=R.value:ToHSV()local S=Q.alpha or
Q.Alpha R.alpha=if type(S)=='number'then I(S)else 1 R.flag=Q.flag or Q.Flag or(not R.forgetState and i.
deriveFlagFromName(R.name)or nil)R.window:_registerControl(R)R.main=R.window:Create('Frame',{Size=UDim2.new(1,-20,0,p),
BorderSizePixel=0,Name=R.name,BackgroundColor3=Color3.fromRGB(255,255,255),BackgroundTransparency=1,Parent=R.tab.tabPage
},{BackgroundTransparency='ElementTransparency'})R.stroke=R.window:StyleElementBody(R.main)R.hoverOverlay=R.window:
CreateHoverOverlay(R.main)R:_buildHeader()R:_buildPicker()R.window:ConnectFor(R,R.interact.MouseButton1Click,function()n
.click()if R._isOpen then R:_close()else R:_open()end end)R.window:ConnectFor(R,R.main.MouseEnter,function()if R._isOpen
or not R.window:_interactive()then return end local T=R.window.theme h.tweenService:Create(R.stroke,E,{Transparency=T.
ElementStrokeHoverTransparency,Color=T.ElementStrokeHover}):Play()h.tweenService:Create(R.title,E,{TextColor3=T.
ElementTextHoverColor}):Play()h.tweenService:Create(R.hoverOverlay,E,{BackgroundTransparency=0.97}):Play()end)R.window:
ConnectFor(R,R.main.MouseLeave,function()local T=R.window.theme h.tweenService:Create(R.stroke,E,{Transparency=T.
ElementStrokeTransparency,Color=T.ElementStroke}):Play()h.tweenService:Create(R.title,E,{TextColor3=T.ContentColor}):
Play()h.tweenService:Create(R.hoverOverlay,E,{BackgroundTransparency=1}):Play()end)if R.description then R.descriptor=d(
c.Parent.descriptor).new(R.tab,{description=R.description})end R:_applyPickerVisibility(false,false)R:
_setControlsVisible(false)R.window:ConnectFor(R,R.main:GetPropertyChangedSignal'AbsoluteSize',function()if R.window.
animating or(R.window.hidden and R.window.hasShownOnce)then return end R:_applyLayout()end)R:_applyLayout()R:_render
'instant'return R end function f._buildHeader(P)P.container=P.window:Create('Frame',{Size=UDim2.new(0,170,0,16),Position
=UDim2.new(0,20,0,p/2),AnchorPoint=Vector2.new(0,0.5),BackgroundTransparency=1,BorderSizePixel=0,ZIndex=5,Parent=P.main}
)P.window:Create('UIListLayout',{Padding=UDim.new(0,5),FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=
Enum.VerticalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,Parent=P.container})if P.icon then P.iconLabel=P.
window:Create('ImageLabel',{Image=P.icon,Size=UDim2.fromOffset(16,16),BorderSizePixel=0,BackgroundTransparency=1,ZIndex=
5,ImageTransparency=1,Parent=P.container},{ImageColor3='ContentColor'})end P.title=P.window:Create('TextLabel',{Text=m.
t(P.name),Size=UDim2.fromOffset(150,16),AutomaticSize=Enum.AutomaticSize.X,BorderSizePixel=0,BackgroundTransparency=1,
TextSize=16,TextXAlignment=Enum.TextXAlignment.Left,LayoutOrder=1,ZIndex=5,TextTransparency=1,Parent=P.container},{
TextColor3='ContentColor',FontFace='Font'})P.preview=P.window:Create('Frame',{AnchorPoint=Vector2.new(1,0.5),Position=B,
Size=C,BackgroundColor3=P.value,BorderSizePixel=0,ZIndex=3,BackgroundTransparency=1,Parent=P.main})P.window:Create(
'UICorner',{CornerRadius=UDim.new(0,8),Parent=P.preview})P.previewShadow=P.window:CreateGlow(P.preview,P.value,20,1)P.
invisibleGroup=P.window:Create('Frame',{Size=UDim2.fromScale(1,1),Position=UDim2.fromScale(0.5,0.5),AnchorPoint=Vector2.
new(0.5,0.5),BackgroundTransparency=1,BorderSizePixel=0,ZIndex=5,Parent=P.preview})P.window:Create('UIListLayout',{
FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.
HorizontalAlignment.Center,Padding=UDim.new(0,6),SortOrder=Enum.SortOrder.LayoutOrder,Parent=P.invisibleGroup})P.
invisibleIcon=P.window:Create('ImageLabel',{Image=l.icons.colorpicker,Size=UDim2.fromOffset(16,16),
BackgroundTransparency=1,BorderSizePixel=0,ZIndex=5,ImageTransparency=1,Parent=P.invisibleGroup},{ImageColor3=
'ContentColor'})P.invisibleText=P.window:Create('TextLabel',{Text=m.t'Invisible',Size=UDim2.fromOffset(0,16),
AutomaticSize=Enum.AutomaticSize.X,BackgroundTransparency=1,BorderSizePixel=0,TextSize=15,LayoutOrder=1,ZIndex=5,
TextTransparency=1,Parent=P.invisibleGroup},{TextColor3='ContentColor',FontFace='Font'})P.interact=P.window:Create(
'TextButton',{BackgroundTransparency=1,Size=UDim2.new(1,0,0,p),Position=UDim2.fromScale(0,0),BorderSizePixel=0,Text='',
TextTransparency=1,AutoButtonColor=false,ZIndex=10,Parent=P.main})end function f._buildMap(P)P.map=P.window:Create(
'Frame',{Position=UDim2.fromOffset(20,q),Size=UDim2.fromOffset(r.X,r.Y),BackgroundColor3=Color3.fromHSV(P.hue,1,1),
BorderSizePixel=0,ZIndex=2,BackgroundTransparency=1,Parent=P.main})P.window:Create('UICorner',{CornerRadius=UDim.new(0,8
),Parent=P.map})P.mapStroke=P.window:Create('UIStroke',{Color=Color3.fromRGB(255,255,255),Transparency=1,Parent=P.map})P
.satOverlay=P.window:Create('Frame',{Size=UDim2.fromScale(1,1),BackgroundColor3=Color3.fromRGB(255,255,255),
BorderSizePixel=0,ZIndex=3,BackgroundTransparency=1,Parent=P.map})P.window:Create('UICorner',{CornerRadius=UDim.new(0,8)
,Parent=P.satOverlay})P.window:Create('UIGradient',{Transparency=NumberSequence.new{NumberSequenceKeypoint.new(0,0),
NumberSequenceKeypoint.new(1,1)},Parent=P.satOverlay})P.valOverlay=P.window:Create('Frame',{Size=UDim2.fromScale(1,1),
BackgroundColor3=Color3.fromRGB(0,0,0),BorderSizePixel=0,ZIndex=4,BackgroundTransparency=1,Parent=P.map})P.window:
Create('UICorner',{CornerRadius=UDim.new(0,8),Parent=P.valOverlay})P.window:Create('UIGradient',{Rotation=90,
Transparency=NumberSequence.new{NumberSequenceKeypoint.new(0,1),NumberSequenceKeypoint.new(1,0)},Parent=P.valOverlay})
end function f._buildPicker(P)P:_buildMap()P.satCursor=P.window:Create('Frame',{AnchorPoint=Vector2.new(0.5,0.5),Size=
UDim2.fromOffset(12,12),BackgroundColor3=Color3.fromRGB(255,255,255),BorderSizePixel=0,ZIndex=6,BackgroundTransparency=1
,Parent=P.map})P.window:Create('UICorner',{CornerRadius=UDim.new(1,0),Parent=P.satCursor})P.satCursorStroke=P.window:
Create('UIStroke',{Color=Color3.fromRGB(255,255,255),Thickness=2,Transparency=1,Parent=P.satCursor})P.mapInteract=P.
window:Create('TextButton',{BackgroundTransparency=1,Size=UDim2.fromScale(1,1),Text='',TextTransparency=1,
AutoButtonColor=false,ZIndex=7,Parent=P.map})P.hueBar=P.window:Create('Frame',{Position=UDim2.fromOffset(s,q),Size=UDim2
.fromOffset(t,r.Y),BackgroundColor3=Color3.fromRGB(255,255,255),BorderSizePixel=0,ZIndex=2,BackgroundTransparency=1,
Parent=P.main})P.window:Create('UICorner',{CornerRadius=UDim.new(1,0),Parent=P.hueBar})P.window:Create('UIGradient',{
Color=o,Rotation=90,Parent=P.hueBar})P.hueHandle=P.window:Create('Frame',{AnchorPoint=Vector2.new(0.5,0.5),Position=
UDim2.new(0.5,0,0,0),Size=UDim2.fromOffset(t+8,8),BackgroundColor3=Color3.fromRGB(255,255,255),BorderSizePixel=0,ZIndex=
4,BackgroundTransparency=1,Parent=P.hueBar})P.window:Create('UICorner',{CornerRadius=UDim.new(1,0),Parent=P.hueHandle})P
.hueHandleStroke=P.window:Create('UIStroke',{Color=Color3.fromRGB(255,255,255),Thickness=2,Transparency=1,Parent=P.
hueHandle})P.hueInteract=P.window:Create('TextButton',{BackgroundTransparency=1,Size=UDim2.new(1,16,1,8),Position=UDim2.
fromScale(0.5,0.5),AnchorPoint=Vector2.new(0.5,0.5),Text='',TextTransparency=1,AutoButtonColor=false,ZIndex=6,Parent=P.
hueBar})P.alphaBar=P.window:Create('Frame',{Position=UDim2.fromOffset(u,q),Size=UDim2.fromOffset(v,r.Y),BackgroundColor3
=P.value,BorderSizePixel=0,ZIndex=2,BackgroundTransparency=1,Parent=P.main})P.window:Create('UICorner',{CornerRadius=
UDim.new(1,0),Parent=P.alphaBar})P.alphaGradient=P.window:Create('UIGradient',{Rotation=90,Transparency=NumberSequence.
new{NumberSequenceKeypoint.new(0,0),NumberSequenceKeypoint.new(1,1)},Parent=P.alphaBar})P.alphaHandle=P.window:Create(
'Frame',{AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.new(0.5,0,0,0),Size=UDim2.fromOffset(v+8,8),BackgroundColor3=
Color3.fromRGB(255,255,255),BorderSizePixel=0,ZIndex=4,BackgroundTransparency=1,Parent=P.alphaBar})P.window:Create(
'UICorner',{CornerRadius=UDim.new(1,0),Parent=P.alphaHandle})P.alphaHandleStroke=P.window:Create('UIStroke',{Color=
Color3.fromRGB(255,255,255),Thickness=2,Transparency=1,Parent=P.alphaHandle})P.alphaInteract=P.window:Create(
'TextButton',{BackgroundTransparency=1,Size=UDim2.new(1,16,1,8),Position=UDim2.fromScale(0.5,0.5),AnchorPoint=Vector2.
new(0.5,0.5),Text='',TextTransparency=1,AutoButtonColor=false,ZIndex=6,Parent=P.alphaBar})P.hexBox=P.window:Create(
'Frame',{Position=UDim2.new(0,w,0,q+90),Size=UDim2.new(1,-(w+20),0,30),BackgroundColor3=Color3.fromRGB(255,255,255),
BorderSizePixel=0,ZIndex=2,BackgroundTransparency=1,Parent=P.main})P.window:Create('UICorner',{CornerRadius=UDim.new(0,8
),Parent=P.hexBox})P.hexBoxStroke=P.window:Create('UIStroke',{Color=Color3.fromRGB(255,255,255),Transparency=1,Parent=P.
hexBox})P.hexInput=P.window:Create('TextBox',{Text='#'..P.value:ToHex():upper(),PlaceholderText=m.t'Smart Input',Size=
UDim2.new(1,-14,1,0),Position=UDim2.fromScale(0.5,0.5),AnchorPoint=Vector2.new(0.5,0.5),BackgroundTransparency=1,
BorderSizePixel=0,TextSize=15,TextXAlignment=Enum.TextXAlignment.Center,ClearTextOnFocus=false,ZIndex=3,TextTransparency
=1,Parent=P.hexBox},{TextColor3='ContentColor',FontFace='Font',PlaceholderColor3='PlaceholderColor'})P.alphaBox=P.window
:Create('Frame',{Position=UDim2.new(0,w,0,q+90),Size=UDim2.fromOffset(x,30),BackgroundColor3=Color3.fromRGB(255,255,255)
,BorderSizePixel=0,ZIndex=2,BackgroundTransparency=1,Parent=P.main})P.window:Create('UICorner',{CornerRadius=UDim.new(0,
8),Parent=P.alphaBox})P.alphaBoxStroke=P.window:Create('UIStroke',{Color=Color3.fromRGB(255,255,255),Transparency=1,
Parent=P.alphaBox})P.alphaInput=P.window:Create('TextBox',{Text=tostring(math.round(P.alpha*100))..'%',PlaceholderText=
'100%',Size=UDim2.new(1,-10,1,0),Position=UDim2.fromScale(0.5,0.5),AnchorPoint=Vector2.new(0.5,0.5),
BackgroundTransparency=1,BorderSizePixel=0,TextSize=15,TextXAlignment=Enum.TextXAlignment.Center,ClearTextOnFocus=false,
ZIndex=3,TextTransparency=1,Parent=P.alphaBox},{TextColor3='ContentColor',FontFace='Font',PlaceholderColor3=
'PlaceholderColor'})P.window:ConnectFor(P,P.mapInteract.InputBegan,function(Q)if Q.UserInputType==Enum.UserInputType.
MouseButton1 or Q.UserInputType==Enum.UserInputType.Touch then P:_beginDrag('sat',Q.UserInputType==Enum.UserInputType.
MouseButton1)end end)P.window:ConnectFor(P,P.hueInteract.InputBegan,function(Q)if Q.UserInputType==Enum.UserInputType.
MouseButton1 or Q.UserInputType==Enum.UserInputType.Touch then P:_beginDrag('hue',Q.UserInputType==Enum.UserInputType.
MouseButton1)end end)P.window:ConnectFor(P,P.alphaInteract.InputBegan,function(Q)if Q.UserInputType==Enum.UserInputType.
MouseButton1 or Q.UserInputType==Enum.UserInputType.Touch then P:_beginDrag('alpha',Q.UserInputType==Enum.UserInputType.
MouseButton1)end end)P.window:ConnectFor(P,h.userInputService.InputEnded,function(Q)if(Q.UserInputType==Enum.
UserInputType.MouseButton1 or Q.UserInputType==Enum.UserInputType.Touch)and P._drag then P:_endDrag()end end)P.window:
ConnectFor(P,P.hexInput.FocusLost,function()local Q=N(P.hexInput.Text)if Q then P:Set(Q)else P.hexInput.Text='#'..P.
value:ToHex():upper()end end)P.window:ConnectFor(P,P.alphaInput.FocusLost,function()local Q=tonumber((P.alphaInput.Text:
gsub('[^%d%.]','')))if Q then P:SetAlpha(I(Q/100))else P.alphaInput.Text=tostring(math.round(P.alpha*100))..'%'end end)
end function f._beginDrag(P,Q,R)if not P._isOpen then return end P._drag=Q P._dragIsMouse=R P:_setHeld(Q)P:_pump()if P.
_dragConnection then P._dragConnection:Disconnect()P._dragConnection=nil end P._dragConnection=h.runService.
RenderStepped:Connect(function()local S=P._dragIsMouse and not h.userInputService:IsMouseButtonPressed(Enum.
UserInputType.MouseButton1)if P.window.unloaded or not P._drag or S then if S then P:_endDrag()return end if P.
_dragConnection then P._dragConnection:Disconnect()P._dragConnection=nil end return end P:_pump()end)end function f.
_endDrag(P)P._drag=nil P:_setHeld(nil)if P._dragConnection then P._dragConnection:Disconnect()P._dragConnection=nil end
P.window:_persist(P)end function f._setHeld(P,Q)local R,S,T=if Q=='sat'then UDim2.fromOffset(16,16)else UDim2.
fromOffset(12,12),if Q=='hue'then UDim2.fromOffset(t+12,10)else UDim2.fromOffset(t+8,8),if Q=='alpha'then UDim2.
fromOffset(v+12,10)else UDim2.fromOffset(v+8,8)h.tweenService:Create(P.satCursor,H,{Size=R}):Play()h.tweenService:
Create(P.hueHandle,H,{Size=S}):Play()h.tweenService:Create(P.alphaHandle,H,{Size=T}):Play()end function f._mouseLocation
(P)local Q,R=h.userInputService:GetMouseLocation(),P.window.screenGui if R and R.IgnoreGuiInset then return Q-h.
guiService:GetGuiInset()end return Q end function f._pump(P)local Q,R,S,T=P.hue,P.sat,P.val,P.alpha if P._drag=='sat'
then local U=P.map.AbsoluteSize if U.X<=0 or U.Y<=0 then return end local V=P:_mouseLocation()P.sat=I((V.X-P.map.
AbsolutePosition.X)/U.X)P.val=1-I((V.Y-P.map.AbsolutePosition.Y)/U.Y)elseif P._drag=='hue'then local U=P.hueBar.
AbsoluteSize.Y if U<=0 then return end local V=P:_mouseLocation()P.hue=I((V.Y-P.hueBar.AbsolutePosition.Y)/U)elseif P.
_drag=='alpha'then local U=P.alphaBar.AbsoluteSize.Y if U<=0 then return end local V=P:_mouseLocation()P.alpha=1-I((V.Y-
P.alphaBar.AbsolutePosition.Y)/U)else return end if P.hue==Q and P.sat==R and P.val==S and P.alpha==T then return end P.
value=Color3.fromHSV(P.hue,P.sat,P.val)P:_render'drag'P:_fireCallback()end function f._render(P,Q)local R,S,T,U,V,W=
Color3.fromHSV(P.hue,1,1),UDim2.new(P.sat,0,1-P.val,0),UDim2.new(0.5,0,P.hue,0),UDim2.new(0.5,0,1-P.alpha,0),1-P.alpha,1
-0.4*P.alpha if Q=='instant'then P.map.BackgroundColor3=R P.satCursor.Position,P.satCursor.BackgroundColor3=S,P.value P.
hueHandle.Position,P.hueHandle.BackgroundColor3=T,R P.alphaBar.BackgroundColor3=P.value P.alphaHandle.Position,P.
alphaHandle.BackgroundColor3=U,P.value P.preview.BackgroundColor3=P.value P.previewShadow.Color=P.value if not P.window.
hidden then P.preview.BackgroundTransparency=V P.previewShadow.Transparency=W end else local X=if Q=='drag'then G else F
h.tweenService:Create(P.map,X,{BackgroundColor3=R}):Play()h.tweenService:Create(P.satCursor,X,{Position=S,
BackgroundColor3=P.value}):Play()h.tweenService:Create(P.hueHandle,X,{Position=T,BackgroundColor3=R}):Play()h.
tweenService:Create(P.alphaHandle,X,{Position=U,BackgroundColor3=P.value}):Play()h.tweenService:Create(P.alphaBar,F,{
BackgroundColor3=P.value}):Play()local Y,Z={BackgroundColor3=P.value},{Color=P.value}if not P.window.hidden then Y.
BackgroundTransparency=V Z.Transparency=W end h.tweenService:Create(P.preview,F,Y):Play()h.tweenService:Create(P.
previewShadow,F,Z):Play()end if not P.hexInput:IsFocused()then P.hexInput.Text='#'..P.value:ToHex():upper()end if not P.
alphaInput:IsFocused()then P.alphaInput.Text=tostring(math.round(P.alpha*100))..'%'end P:_renderInvisible(Q~='instant')
end function f._renderInvisible(P,Q)local R=0 if P._isOpen and not P.window.hidden then R=I((0.12-P.alpha)/0.12)end
local S=1-R if Q then h.tweenService:Create(P.invisibleIcon,E,{ImageTransparency=S}):Play()h.tweenService:Create(P.
invisibleText,E,{TextTransparency=S}):Play()else P.invisibleIcon.ImageTransparency=S P.invisibleText.TextTransparency=S
end end function f._fireCallback(P)P.window:_runGuarded(P,P.callback,P.value,P.alpha)end function f._open(P)if P._isOpen
then return end P._isOpen=true P:_setControlsVisible(true)if P._outsideClickConn then P.window:Disconnect(P.
_outsideClickConn)end P._outsideClickConn=P.window:Connect(h.userInputService.InputBegan,function(Q)if Q.UserInputType~=
Enum.UserInputType.MouseButton1 and Q.UserInputType~=Enum.UserInputType.Touch then return end local R,S,T=Q.Position,P.
main.AbsolutePosition,P.main.AbsoluteSize if R.X<S.X or R.X>S.X+T.X or R.Y<S.Y or R.Y>S.Y+T.Y then P:_close()end end)h.
tweenService:Create(P.main,D,{Size=UDim2.new(1,-20,0,P._openHeight)}):Play()h.tweenService:Create(P.preview,D,{Position=
P._previewOpenPos,Size=P._previewOpenSize}):Play()P:_applyPickerVisibility(true,true)P:_renderInvisible(true)end
function f._close(P)if not P._isOpen then return end P._isOpen=false if P._outsideClickConn then P.window:Disconnect(P.
_outsideClickConn)P._outsideClickConn=nil end if P._drag then P:_endDrag()end if P.hexInput:IsFocused()then P.hexInput:
ReleaseFocus()end if P.alphaInput:IsFocused()then P.alphaInput:ReleaseFocus()end P:_applyPickerVisibility(false,true)P:
_renderInvisible(true)h.tweenService:Create(P.preview,D,{Position=B,Size=C}):Play()h.tweenService:Create(P.main,D,{Size=
UDim2.new(1,-20,0,p)}):Play()task.delay(E.Time,function()if not P._isOpen then P:_setControlsVisible(false)end end)end
function f._applyPickerVisibility(P,Q,R)local S={[P.map]={BackgroundTransparency=if Q then 0 else 1},[P.satOverlay]={
BackgroundTransparency=if Q then 0 else 1},[P.valOverlay]={BackgroundTransparency=if Q then 0 else 1},[P.mapStroke]={
Transparency=if Q then 0.9 else 1},[P.satCursor]={BackgroundTransparency=if Q then 0 else 1},[P.satCursorStroke]={
Transparency=if Q then 0 else 1},[P.hueBar]={BackgroundTransparency=if Q then 0 else 1},[P.hueHandle]={
BackgroundTransparency=if Q then 0 else 1},[P.hueHandleStroke]={Transparency=if Q then 0 else 1},[P.alphaBar]={
BackgroundTransparency=if Q then 0 else 1},[P.alphaHandle]={BackgroundTransparency=if Q then 0 else 1},[P.
alphaHandleStroke]={Transparency=if Q then 0 else 1},[P.hexBox]={BackgroundTransparency=if Q then 0.9 else 1},[P.
hexBoxStroke]={Transparency=if Q then 0.85 else 1},[P.hexInput]={TextTransparency=if Q then 0.4 else 1},[P.alphaBox]={
BackgroundTransparency=if Q then 0.9 else 1},[P.alphaBoxStroke]={Transparency=if Q then 0.85 else 1},[P.alphaInput]={
TextTransparency=if Q then 0.4 else 1}}for T,U in S do if R then h.tweenService:Create(T,E,U):Play()else for V,W in U do
T[V]=W end end end end function f._setControlsVisible(P,Q)for R,S in{P.map,P.hueBar,P.alphaBar,P.hexBox,P.alphaBox}do S.
Visible=Q end end function f._applyLayout(P)local Q=P.main.AbsoluteSize.X local R=if Q>0 and Q<z then'narrow'else'wide'
if R==P._layoutMode then return end P._layoutMode=R local S=A[R]P._openHeight=S.height P._previewOpenPos=S.previewPos P.
_previewOpenSize=S.previewSize P.hexBox.Position=S.hexPos P.hexBox.Size=S.hexSize P.alphaBox.Position=S.alphaFieldPos P.
alphaBox.Size=S.alphaFieldSize if P._isOpen then h.tweenService:Create(P.main,D,{Size=UDim2.new(1,-20,0,P._openHeight)})
:Play()h.tweenService:Create(P.preview,D,{Position=P._previewOpenPos,Size=P._previewOpenSize}):Play()end end function f.
Set(P,Q,R)P.value=O(Q,P.value)P.hue,P.sat,P.val=P.value:ToHSV()P:_render(if P._isOpen then'animate'else'instant')if not
R then P:_fireCallback()P.window:_persist(P)end end function f.SetAlpha(P,Q,R)P.alpha=I(if type(Q)=='number'then Q else
P.alpha)P:_render(if P._isOpen then'animate'else'instant')if not R then P:_fireCallback()P.window:_persist(P)end end
function f._serialize(P)return P.value:ToHex()..string.format('%02x',math.clamp(math.round((P.alpha or 1)*255),0,255))
end function f._deserialize(P,Q)local R,S=(tostring(Q))if#R>=8 then S=(tonumber(R:sub(7,8),16)or 255)/255 R=R:sub(1,6)
end local T,U=pcall(Color3.fromHex,R)if not T then return end if S then P:SetAlpha(S,true)end P:Set(U)end function f.
_setShown(P,Q,R)local S=P.window if Q then S:_revealCommon(P,R)S:_reveal(P.preview,{BackgroundTransparency=1-P.alpha},R)
S:_reveal(P.previewShadow,{Transparency=1-0.4*P.alpha},R)else S:_hideCommon(P,R)S:_reveal(P.preview,{
BackgroundTransparency=1},R)S:_reveal(P.previewShadow,{Transparency=1},R)if P._isOpen then P:_close()end end end j(f)k(f
)return f end)()end,[8]=function()local b,c,d=a(8)local e return(function(...)local f={}f.__index=f f.__type='Console'
local g=c.Parent.Parent.utility local h,i,j,k,l,m,n,o,p,q,r=d(g.moveable),d(g.locale),120,48,24,17,12,12,1.25,200,Font.
fromEnum(Enum.Font.Code)function f.new(s,t)t=if typeof(t)=='table'then t else{}local u=setmetatable({tab=assert(s,
'Missing argument #1 (Tab expected)'),window=s.window,name=t.name or t.Name,description=t.description or t.Description,
height=math.max(tonumber(t.height or t.Height)or j,k),follow=t.follow or t.Follow or false,maxLines=math.max(tonumber(t.
maxLines or t.MaxLines)or q,1),lines={},lineLabels={},head=1,nextOrder=1,textDirty=true},f)u:_build()u:_setLines(t.text
or t.Text or'')if u.description then u.descriptor=d(c.Parent.descriptor).new(u.tab,{description=u.description})end
return u end function f.Get(s):string if s.textDirty then s.text=table.concat(s.lines,'\n')s.textDirty=false end return
s.text end function f._setLines(s,t)t=if type(t)=='string'then t else tostring(t)table.clear(s.lines)if t~=''then for u
in string.gmatch(t..'\n','([^\n]*)\n')do table.insert(s.lines,u)end end s:_trim()s:_flush()end function f._trim(s)local
t=#s.lines-s.maxLines if t<=0 then return end table.move(s.lines,t+1,#s.lines,1)for u=#s.lines,#s.lines-t+1,-1 do s.
lines[u]=nil end end function f._makeLabel(s)return s.window:Create('TextLabel',{Size=UDim2.new(1,0,0,0),AutomaticSize=
Enum.AutomaticSize.Y,BackgroundTransparency=1,BorderSizePixel=0,FontFace=r,TextSize=o,TextXAlignment=Enum.TextXAlignment
.Left,TextYAlignment=Enum.TextYAlignment.Top,TextWrapped=true,LineHeight=p,RichText=false,TextTransparency=s.
_textTransparency or 1,Parent=s.scroll},{TextColor3='ContentColor'})end local function s(t:string):string return if t==
''then' 'else t end function f._flush(t)t.textDirty=true for u,v in t.lines do local w=t.lineLabels[u]if not w then w=t:
_makeLabel()t.lineLabels[u]=w end w.LayoutOrder=u w.Text=s(v)w.Visible=true end for u=#t.lines+1,#t.lineLabels do t.
lineLabels[u].Visible=false end t.head=1 t.nextOrder=#t.lines+1 t:_follow()end function f._pushLine(t,u:string)t.
textDirty=true if#t.lines<t.maxLines then table.insert(t.lines,u)local v=#t.lines local w=t.lineLabels[v]if not w then w
=t:_makeLabel()t.lineLabels[v]=w end w.LayoutOrder=t.nextOrder w.Text=s(u)w.Visible=true t.nextOrder+=1 return end table
.move(t.lines,2,#t.lines,1)t.lines[#t.lines]=u local v=t.lineLabels[t.head]v.LayoutOrder=t.nextOrder v.Text=s(u)v.
Visible=true t.nextOrder+=1 t.head=(t.head%#t.lineLabels)+1 end function f._build(t)local u=if t.name then l else 0 t.
main=t.window:Create('Frame',{Size=UDim2.new(1,-20,0,t.height+u+m*2),BorderSizePixel=0,Name=t.name or'Console',
BackgroundColor3=Color3.fromRGB(255,255,255),BackgroundTransparency=1,Parent=t.tab.tabPage},{BackgroundTransparency=
'ElementTransparency'})t.stroke=t.window:StyleElementBody(t.main)if t.name then t.container=t.window:Create('Frame',{
Size=UDim2.new(1,-m*2,0,16),Position=UDim2.new(0,m,0,m),BackgroundTransparency=1,BorderSizePixel=0,Parent=t.main})t.
title=t.window:Create('TextLabel',{Text=i.t(t.name),Size=UDim2.fromScale(1,1),BorderSizePixel=0,BackgroundTransparency=1
,TextSize=16,TextXAlignment=Enum.TextXAlignment.Left,TextTransparency=1,Parent=t.container},{TextColor3='ContentColor',
FontFace='Font'})end t.panel=t.window:Create('Frame',{AnchorPoint=Vector2.new(0.5,1),Position=UDim2.new(0.5,0,1,-m),Size
=UDim2.new(1,-m*2,0,t.height),BorderSizePixel=0,ClipsDescendants=true,BackgroundTransparency=1,Parent=t.main},{
BackgroundColor3='StatBackground'})t.window:Create('UICorner',{Parent=t.panel},{CornerRadius='ElementCornerRadius'})t.
panelStroke=t.window:Create('UIStroke',{ApplyStrokeMode=Enum.ApplyStrokeMode.Border,Transparency=1,Parent=t.panel},{
Color='SurfaceStroke'})t.scroll=t.window:Create('ScrollingFrame',{Size=UDim2.new(1,-n*2,1,-n*2),Position=UDim2.
fromScale(0.5,0.5),AnchorPoint=Vector2.new(0.5,0.5),BackgroundTransparency=1,BorderSizePixel=0,AutomaticCanvasSize=Enum.
AutomaticSize.Y,CanvasSize=UDim2.new(0,0,0,0),ScrollBarThickness=0,ScrollingDirection=Enum.ScrollingDirection.Y,Parent=t
.panel})t.scrollLayout=t.window:Create('UIListLayout',{FillDirection=Enum.FillDirection.Vertical,HorizontalAlignment=
Enum.HorizontalAlignment.Left,VerticalAlignment=Enum.VerticalAlignment.Top,SortOrder=Enum.SortOrder.LayoutOrder,Parent=t
.scroll})t:_watchCanvas()end function f._pin(t)local u=t.scroll if not u or not u.Parent then return end u.
CanvasPosition=Vector2.new(0,u.AbsoluteCanvasSize.Y)end function f._follow(t)if not t.follow then return end t:_pin()
task.defer(function()t:_pin()end)end function f._watchCanvas(t)t.window:ConnectFor(t,t.scrollLayout:
GetPropertyChangedSignal'AbsoluteContentSize',function()if t.follow then t:_pin()end end)end function f.Set(t,u)t:
_setLines(u)end function f.Append(t,u)u=if type(u)=='string'then u else tostring(u)for v in string.gmatch(u..'\n',
'([^\n]*)\n')do t:_pushLine(v)end t:_follow()end function f.Clear(t)table.clear(t.lines)t:_flush()end function f.Copy(t)
:boolean local u=(getgenv and getgenv().setclipboard)or setclipboard if typeof(u)~='function'then return false end
return(pcall(u,t:Get()))end function f.SetHeight(t,u)t.height=math.max(tonumber(u)or j,k)local v=if t.name then l else 0
t.panel.Size=UDim2.new(1,-m*2,0,t.height)t.main.Size=UDim2.new(1,-20,0,t.height+v+m*2)end function f._setShown(t,u,v)
local w=t.window w:_reveal(t.main,{BackgroundTransparency=if u then w.theme.ElementTransparency or 0 else 1},v)w:
_reveal(t.stroke,{Transparency=if u then w.theme.ElementStrokeTransparency else 1},v)w:_reveal(t.panel,{
BackgroundTransparency=if u then 0 else 1},v)w:_reveal(t.panelStroke,{Transparency=if u then 0.9 else 1},v)t.
_textTransparency=if u then 0.15 else 1 for x,y in t.lineLabels do w:_reveal(y,{TextTransparency=t._textTransparency},v)
end if t.title then w:_reveal(t.title,{TextTransparency=if u then 0 else 1},v)end if t.descriptor then w:_reveal(t.
descriptor.titleLabel,{TextTransparency=if u then 0.7 else 1},v)end end function f.Remove(t)if t.descriptor then t.
descriptor:Remove()end t.main:Destroy()end h(f)return f end)()end,[9]=function()local b,c,d=a(9)local e return(function(
...)local f={}f.__index=f f.__type='Descriptor'local g=d(c.Parent.Parent.utility.locale)function f.new(h,i)i=if typeof(i
)=='table'then i else{}local j=setmetatable({tab=assert(h,'Missing argument #1 (Tab expected)'),window=h.window,
description=i.description or i.Description or''},f)j.main=j.window:Create('Frame',{AutomaticSize=Enum.AutomaticSize.Y,
BackgroundTransparency=1,Size=UDim2.new(1,-30,0,0),Parent=j.tab.tabPage})j.window:Create('UIListLayout',{SortOrder=Enum.
SortOrder.LayoutOrder,Parent=j.main})j.titleLabel=j.window:Create('TextLabel',{AutomaticSize=Enum.AutomaticSize.Y,
BackgroundTransparency=1,RichText=true,Size=UDim2.new(1,-90,0,0),Text=g.t(j.description),TextSize=12,TextWrapped=true,
TextXAlignment=Enum.TextXAlignment.Left,TextTransparency=1,Parent=j.main},{TextColor3='ContentColor',FontFace='Font'})j.
window:Create('Frame',{BackgroundTransparency=1,BorderSizePixel=0,LayoutOrder=1,Size=UDim2.fromOffset(0,15),Parent=j.
main})return j end return f end)()end,[10]=function()local b,c,d=a(10)local e return(function(...)local f={}f.__index=f
f.__type='Divider'local g,h,i,j,k,l,m,n,o=d(c.Parent.Parent.utility.moveable),d(c.Parent.Parent.utility.locale),1,12,10,
14,12,0.88,0.55 function f.new(p,q)q=if typeof(q)=='table'then q else{}local r,s=q.spacing or q.Spacing,q.text or q.Text
local t=setmetatable({tab=assert(p,'Missing argument #1 (Tab expected)'),window=p.window,text=if s~=nil then tostring(s)
else'',spacing=if type(r)=='number'then math.max(r,0)else j,line=q.line~=false and q.Line~=false},f)t.main=t.window:
Create('Frame',{Size=UDim2.new(1,-40,0,0),BorderSizePixel=0,Name='Divider',BackgroundTransparency=1,Parent=t.tab.tabPage
})t.window:Create('UIListLayout',{FillDirection=Enum.FillDirection.Horizontal,Padding=UDim.new(0,k),SortOrder=Enum.
SortOrder.LayoutOrder,VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.
Center,Parent=t.main})if t.line then t.left=t:_buildHalf(1)end if t.text~=''then t:_buildLabel()end t:_applyHeight()
return t end function f._buildHalf(p,q)local r=p.window:Create('Frame',{Size=UDim2.new(0,0,0,i),BorderSizePixel=0,
LayoutOrder=q,BackgroundTransparency=1,Parent=p.main},{BackgroundColor3='ContentColor'})p.window:Create('UIFlexItem',{
FlexMode=Enum.UIFlexMode.Fill,Parent=r})return r end function f._buildLabel(p)p.title=p.window:Create('TextLabel',{Text=
h.t(p.text),Size=UDim2.fromOffset(0,l),AutomaticSize=Enum.AutomaticSize.X,BorderSizePixel=0,BackgroundTransparency=1,
TextSize=m,TextXAlignment=Enum.TextXAlignment.Center,LayoutOrder=2,TextTransparency=1,Parent=p.main},{TextColor3=
'ContentColor',FontFace='Font'})if p.line then p.right=p:_buildHalf(3)end end function f._applyHeight(p)local q=if p.
text~=''then l elseif p.line then i else 0 p.main.Size=UDim2.new(1,-40,0,p.spacing*2+q)end function f.Set(p,q)p.text=if
q~=nil then tostring(q)else''if p.text~=''and not p.title then p:_buildLabel()if not p.window.hidden then p:_setShown(
true,true)end end if p.title then p.window:_bindLocale(p.title,'Text',p.text)local r=p.text~=''p.title.Visible=r if p.
right then p.right.Visible=r end end p:_applyHeight()end function f._setShown(p,q,r)local s,t=p.window,if q then n else
1 s:_reveal(p.left,{BackgroundTransparency=t},r)s:_reveal(p.right,{BackgroundTransparency=t},r)s:_reveal(p.title,{
TextTransparency=if q then o else 1},r)end g(f)return f end)()end,[11]=function()local b,c,d=a(11)local e return(
function(...)local f={}f.__index=f f.__type='Drag'local g=c.Parent.Parent.utility local h,i=d(g.variables),d(g.constants
)function f.new(j,k)k=if typeof(k)=='table'then k else{}local l=setmetatable({window=assert(j,
'Missing argument #1 (Window expected)')},f)l.drag=l.window:Create('Frame',{BackgroundTransparency=1,Size=UDim2.
fromOffset(150,20),AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.new(0.5,0,0.5,l.window.size.Y.Offset/2+15),ZIndex=i.
zIndex.drag,Visible=false,Parent=l.window.screenGui})l.dragCosmetic=l.window:Create('Frame',{BackgroundColor3=Color3.
fromRGB(255,255,255),AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.3),ZIndex=i.zIndex.drag,
BackgroundTransparency=1,Size=UDim2.fromOffset(0,4),Parent=l.drag})l.window:Create('UICorner',{CornerRadius=UDim.new(0,
20),Parent=l.dragCosmetic})l.window:CreateGlow(l.dragCosmetic,Color3.fromRGB(255,255,255),10,0.5)l.dragInteract=l.window
:Create('TextButton',{BackgroundTransparency=1,Size=UDim2.fromScale(1,1),TextTransparency=1,ZIndex=i.zIndex.drag,Parent=
l.drag})local m,n,o,p=false,Vector2.zero,(l.window.screenGui)if o and o.IgnoreGuiInset then n=h.guiService:GetGuiInset()
end local function q()local r,s,t=h.userInputService and h.userInputService:GetMouseLocation()or Vector2.new(0,0),p or
Vector2.new(0,0),n or Vector2.new(0,0)return r+s+t end local function r()local s=q()local t,u=s.X,s.Y if l.window.
settings and l.window.settings.keepOnScreen then local v,w,x=l.window.main.AbsoluteSize,l.window.screenGui.AbsoluteSize,
8 local y,z=v.X/2,v.Y/2 t=math.clamp(t,y+x,math.max(y+x,w.X-y-x))u=math.clamp(u,z+x,math.max(z+x,w.Y-z-x))end local v,w=
UDim2.fromOffset(t,u),UDim2.fromOffset(t,u+(l.window.main.Size.Y.Offset/2+15))return v,w end l.window:Connect(l.drag.
MouseEnter,function()if not m and not l.window.hidden then h.tweenService:Create(l.dragCosmetic,TweenInfo.new(0.25,Enum.
EasingStyle.Back,Enum.EasingDirection.Out),{BackgroundTransparency=0.5,Size=UDim2.new(0,120,0,4)}):Play()end end)l.
window:Connect(l.drag.MouseLeave,function()if not m and not l.window.hidden then h.tweenService:Create(l.dragCosmetic,
TweenInfo.new(0.25,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{BackgroundTransparency=0.7,Size=UDim2.new(0,100,0,4)
}):Play()end end)local function s()if not m then return end m=false if not l.window:_interactive()then return end h.
tweenService:Create(l.dragCosmetic,TweenInfo.new(0.35,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{Size=UDim2.new(0,
100,0,4),BackgroundTransparency=0.7}):Play()local t,u,v=TweenInfo.new(0.3,Enum.EasingStyle.Quint,Enum.EasingDirection.
Out),r()h.tweenService:Create(l.window.main,t,{Position=u}):Play()h.tweenService:Create(l.drag,t,{Position=v}):Play()end
l.window:Connect(l.dragInteract.InputBegan,function(t,u)if u then return end local v=t.UserInputType.Name if v==
'MouseButton1'or v=='Touch'then if not l.window:_interactive()then return end m=true if o and o.IgnoreGuiInset then n=h.
guiService:GetGuiInset()end p=l.window.main.AbsolutePosition+l.window.main.AbsoluteSize*l.window.main.AnchorPoint-h.
userInputService:GetMouseLocation()if not l.window.hidden then h.tweenService:Create(l.dragCosmetic,TweenInfo.new(0.35,
Enum.EasingStyle.Back,Enum.EasingDirection.Out),{Size=UDim2.new(0,110,0,4),BackgroundTransparency=0}):Play()end end end)
l.window:Connect(h.userInputService.InputEnded,function(t)local u=t.UserInputType.Name if u=='MouseButton1'or u=='Touch'
then s()end end)l.window:Connect(h.userInputService.WindowFocusReleased,s)local t,u=1e-7,1e-60 l.window:Connect(h.
runService.RenderStepped,function(v)if not m then return end if not l.window:_interactive()then s()return end local w,x=
r()l.window.main.Position=l.window.main.Position:Lerp(w,1-t^v)l.drag.Position=l.drag.Position:Lerp(x,1-u^v)end)return l
end return f end)()end,[12]=function()local b,c,d=a(12)local e return(function(...)local f={}f.__index=f f.__type=
'Dropdown'local g=c.Parent.Parent.utility local h,i,j,k,l,m,n,o=d(g.variables),d(g.functions),d(g.image),d(g.constants),
d(g.locale),d(g.HapticEngine),d(g.windowSizing),d(g.lockable)local p,q,r,s,t,u,v,w,x,y,z,A,B,C,D=k.icons.chevron,k.icons
.check,k.icons.dot,k.icons.search,UDim.new(0,12),UDim.new(0,7),30,38,38,5,2,41,6,7,6 local E,F,G,H,I,J,K=C+D,4,22,
TweenInfo.new(0.2,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),TweenInfo.new(0.25,Enum.EasingStyle.Quint,Enum.
EasingDirection.Out),0.4,TweenInfo.new(0.35,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out)local function L(M)
local N,O={},{}for P,Q in M do if typeof(Q)=='string'and not N[Q]then N[Q]=true table.insert(O,Q)end end return O end
local function M(N,O)if N==nil then return{}end if typeof(N)=='string'then return{N}end if typeof(N)=='table'then local
P=L(N)if not O and#P>1 then return{P[1]}end return P end return{}end local function N(O,P)local Q={}for R,S in O do if
table.find(P,S)then table.insert(Q,S)end end return Q end local function O(P,Q)if#P~=#Q then return false end for R,S in
P do if not table.find(Q,S)then return false end end return true end function f.new(P,Q)Q=if typeof(Q)=='table'then Q
else{}local R,S=Q.options or Q.Options or{},Q.multiSelect or Q.MultiSelect or Q.MultipleOptions or false local T=
setmetatable({tab=assert(P,'Missing argument #1 (Tab expected)'),window=P.window,name=Q.name or Q.Name or'Dropdown',icon
=Q.icon or Q.Icon,description=Q.description or Q.Description,forgetState=Q.forgetState or Q.ForgetState or P.forgetState
,flag=Q.flag or Q.Flag or(not(Q.forgetState or Q.ForgetState or P.forgetState)and i.deriveFlagFromName(Q.name or Q.Name
or'Dropdown')or nil),callback=Q.callback or Q.Callback or function()end,options=L(R),multiSelect=S,placeholderText=l.
resolve(Q.placeholder or Q.Placeholder or'None'),value=M(Q.value or Q.Value or Q.currentOption or Q.CurrentOption,S),
_isOpen=false,_optionFrames={}},f)T._desiredValue=T.value T.value=N(T.value,T.options)T.window:_registerControl(T)T.main
=T.window:Create('Frame',{Size=UDim2.new(1,-20,0,41),BorderSizePixel=0,Name=T.name,BackgroundTransparency=1,Parent=T.tab
.tabPage})T.top=T.window:Create('Frame',{Size=UDim2.new(1,0,0,41),Position=UDim2.fromScale(0,0),BorderSizePixel=0,
BackgroundColor3=Color3.fromRGB(255,255,255),BackgroundTransparency=1,ZIndex=1,Parent=T.main},{BackgroundTransparency=
'ElementTransparency'})T.stroke=T.window:StyleElementBody(T.top)T.hoverOverlay=T.window:CreateHoverOverlay(T.top)T.
flashTarget=T.top T.container=T.window:Create('Frame',{BorderSizePixel=0,Parent=T.top,Size=UDim2.new(0,170,0,16),
Position=UDim2.new(0,20,0.5,0),AnchorPoint=Vector2.new(0,0.5),BackgroundTransparency=1,ZIndex=5})T.containerLayout=T.
window:Create('UIListLayout',{Padding=UDim.new(0,5),FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.
VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.Left,Parent=T.container})if T.icon then T.
iconLabel=T.window:Create('ImageLabel',{Image=T.icon,Size=UDim2.fromOffset(16,16),BorderSizePixel=0,
BackgroundTransparency=1,ImageTransparency=1,ZIndex=5,Parent=T.container},{ImageColor3='ContentColor'})end T.title=T.
window:Create('TextLabel',{Text=l.t(T.name),Size=UDim2.fromOffset(150,16),BorderSizePixel=0,BackgroundTransparency=1,
TextSize=16,AutomaticSize=Enum.AutomaticSize.X,TextXAlignment=Enum.TextXAlignment.Left,TextWrapped=true,LayoutOrder=1,
TextTransparency=1,ZIndex=5,Parent=T.container},{TextColor3='ContentColor',FontFace='Font'})T.selectedLabel=T.window:
Create('TextLabel',{AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,-41,0.5,0),Size=UDim2.fromOffset(168,15),
BorderSizePixel=0,BackgroundTransparency=1,TextSize=15,TextXAlignment=Enum.TextXAlignment.Right,TextWrapped=true,
TextTransparency=1,ZIndex=5,Parent=T.top},{TextColor3='ContentColor',FontFace='Font'})T.chevron=T.window:Create(
'ImageLabel',{AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,-18,0.5,0),Size=UDim2.fromOffset(16,16),
BorderSizePixel=0,BackgroundTransparency=1,Image='rbxassetid://'..tostring(p),Rotation=180,ImageTransparency=1,ZIndex=5,
Parent=T.top},{ImageColor3='ContentColor'})T.interact=T.window:Create('TextButton',{BackgroundTransparency=1,Size=UDim2.
new(1,0,0,41),Position=UDim2.fromScale(0,0),BorderSizePixel=0,Text='',TextTransparency=1,ZIndex=10,AutoButtonColor=false
,Parent=T.main})T.panel=T.window:Create('Frame',{AnchorPoint=Vector2.new(1,1),Position=UDim2.new(1,0,1,0),Size=UDim2.
new(1,0,1,-(A+B)),BorderSizePixel=0,ClipsDescendants=true,BackgroundColor3=Color3.fromRGB(255,255,255),ZIndex=1,
BackgroundTransparency=1,Parent=T.main})T.panelStroke=T.window:StyleElementPanel(T.panel)T.window:Create('UIListLayout',
{Padding=UDim.new(0,5),FillDirection=Enum.FillDirection.Vertical,VerticalAlignment=Enum.VerticalAlignment.Top,
HorizontalAlignment=Enum.HorizontalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,Parent=T.panel})T.window:
Create('UIPadding',{PaddingTop=UDim.new(0,C),PaddingBottom=UDim.new(0,D),Parent=T.panel})T:_buildSearch()T:
_buildActions()T.list=T.window:Create('ScrollingFrame',{Active=true,Size=UDim2.new(1,0,0,0),BorderSizePixel=0,
BackgroundTransparency=1,ClipsDescendants=true,AutomaticCanvasSize=Enum.AutomaticSize.Y,CanvasSize=UDim2.new(),
ScrollBarImageColor3=Color3.fromRGB(240,240,240),ScrollBarThickness=3,ScrollBarImageTransparency=1,ScrollingDirection=
Enum.ScrollingDirection.Y,LayoutOrder=3,ZIndex=1,Parent=T.panel})T.window:Create('UIFlexItem',{FlexMode=Enum.UIFlexMode.
Fill,Parent=T.list})T.window:ConnectFor(T,T.list:GetPropertyChangedSignal'CanvasPosition',function()T:_syncScrollHint()
end)T.window:ConnectFor(T,T.list:GetPropertyChangedSignal'AbsoluteCanvasSize',function()T:_syncScrollHint()end)T.window:
ConnectFor(T,T.list:GetPropertyChangedSignal'AbsoluteWindowSize',function()T:_syncScrollHint()end)T.listLayout=T.window:
Create('UIListLayout',{Padding=UDim.new(0,5),SortOrder=Enum.SortOrder.LayoutOrder,HorizontalAlignment=Enum.
HorizontalAlignment.Center,Parent=T.list})T.window:Create('UIPadding',{PaddingTop=UDim.new(0,z),PaddingBottom=UDim.new(0
,z),Parent=T.list})T.emptyLabel=T.window:Create('TextLabel',{Name='Empty',Size=UDim2.new(1,-12,0,x),
BackgroundTransparency=1,Text=l.t'No matches',TextSize=14,TextTransparency=0.55,Visible=false,LayoutOrder=1,Parent=T.
list},{TextColor3='ContentColor',FontFace='Font'})local function U(V)return table.find(T.value,V)~=nil end
local function V(W,X)local Y=U(W.name)local Z,_,aa,ab=if T._isOpen then(Y and 0.9 or 0.95)else 1,if T._isOpen then(Y and
0 or 0.3)else 1,if T._isOpen then(Y and 0 or 0.7)else 1,if T._isOpen then(Y and 0.85 or 0.93)else 1 j.assign(W.checkIcon
,'Image',if Y then q else r)if X then local ac=TweenInfo.new(0.3,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out)h
.tweenService:Create(W.frame,ac,{BackgroundTransparency=Z}):Play()h.tweenService:Create(W.title,ac,{TextTransparency=_})
:Play()h.tweenService:Create(W.checkIcon,ac,{ImageTransparency=aa}):Play()h.tweenService:Create(W.stroke,ac,{
Transparency=ab}):Play()else W.frame.BackgroundTransparency=Z W.title.TextTransparency=_ W.checkIcon.ImageTransparency=
aa W.stroke.Transparency=ab end end local function aa()if T.multiSelect then local ab=#T.value if ab==0 then T.
selectedLabel.Text=T.placeholderText elseif ab==1 then T.selectedLabel.Text=T.value[1]else T.selectedLabel.Text=l.
resolve'Various'end else T.selectedLabel.Text=T.value[1]or T.placeholderText end end T._renderOptionState=V T.
_updateSelectedLabel=aa local function ab(ac)local W=T.window:Create('Frame',{Size=UDim2.new(1,-12,0,x),BorderSizePixel=
0,LayoutOrder=#T._optionFrames+1,BackgroundTransparency=1,Parent=T.list},{BackgroundColor3='DropdownHighlight'})local X,
Y,Z,_=T.window:Create('UICorner',{CornerRadius=u,Parent=W}),T.window:Create('UIStroke',{Color=Color3.fromRGB(255,255,255
),Transparency=1,Parent=W}),T.window:Create('TextButton',{BackgroundTransparency=1,Size=UDim2.fromScale(1,1),Text='',
TextTransparency=1,ZIndex=50,Parent=W}),T.window:Create('Frame',{AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,14,
0.5,0),Size=UDim2.fromOffset(170,16),BorderSizePixel=0,BackgroundTransparency=1,ZIndex=5,Parent=W})T.window:Create(
'UIListLayout',{Padding=UDim.new(0,5),FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.
VerticalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,Parent=_})local ad,ae=T.window:Create('ImageLabel',{Image=
'rbxassetid://'..tostring(q),Size=UDim2.fromOffset(16,16),BorderSizePixel=0,BackgroundTransparency=1,ImageTransparency=1
,ZIndex=5,Parent=_},{ImageColor3='ContentColor'}),T.window:Create('TextLabel',{Text=ac,Size=UDim2.fromOffset(170,16),
BorderSizePixel=0,BackgroundTransparency=1,TextSize=16,TextXAlignment=Enum.TextXAlignment.Left,TextWrapped=true,
LayoutOrder=1,TextTransparency=1,ZIndex=5,Parent=_},{TextColor3='ContentColor',FontFace='Font'})local af={name=ac,frame=
W,interact=Z,title=ae,checkIcon=ad,container=_,stroke=Y,corner=X,connections={}}table.insert(af.connections,T.window:
ConnectFor(T,W.MouseEnter,function()if not T._isOpen or not T.window:_interactive()then return end if U(af.name)then
return end h.tweenService:Create(W,TweenInfo.new(0.2,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{
BackgroundTransparency=0.9}):Play()h.tweenService:Create(ae,TweenInfo.new(0.2,Enum.EasingStyle.Quint,Enum.
EasingDirection.Out),{TextTransparency=0.15}):Play()end))table.insert(af.connections,T.window:ConnectFor(T,W.MouseLeave,
function()if not T._isOpen then return end if U(af.name)then return end h.tweenService:Create(W,TweenInfo.new(0.2,Enum.
EasingStyle.Quint,Enum.EasingDirection.Out),{BackgroundTransparency=0.95}):Play()h.tweenService:Create(ae,TweenInfo.new(
0.2,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{TextTransparency=0.3}):Play()end))table.insert(af.connections,T.
window:ConnectFor(T,Z.MouseButton1Click,function()if not T._isOpen then return end m.click()local ag=U(af.name)if not T.
multiSelect then if ag then T:_close()return end table.clear(T.value)table.insert(T.value,af.name)else if ag then local
ah=table.find(T.value,af.name)if ah then table.remove(T.value,ah)end else table.insert(T.value,af.name)end end T.
_desiredValue=table.clone(T.value)for ah,ai in T._optionFrames do V(ai,true)end aa()T.window:_runGuarded(T,T.callback,T:
_callbackValue())T.window:_persist(T)if not T.multiSelect then task.wait(0.1)T:_close()end end))return af end T.
_buildOption=ab for ac,ad in T.options do local ae=ab(ad)table.insert(T._optionFrames,ae)end aa()T:_updateCorners()T.
window:ConnectFor(T,T.interact.MouseButton1Click,function()m.click()if T._isOpen then T:_close()else T:_open()end end)T.
window:ConnectFor(T,T.main.MouseEnter,function()if T._isOpen or not T.window:_interactive()then return end h.
tweenService:Create(T.title,I,{TextColor3=T.window.theme.ElementTextHoverColor}):Play()h.tweenService:Create(T.
hoverOverlay,I,{BackgroundTransparency=0.97}):Play()h.tweenService:Create(T.stroke,I,{Transparency=T.window.theme.
ElementStrokeHoverTransparency,Color=T.window.theme.ElementStrokeHover}):Play()end)T.window:ConnectFor(T,T.main.
MouseLeave,function()h.tweenService:Create(T.title,I,{TextColor3=T.window.theme.ContentColor}):Play()h.tweenService:
Create(T.hoverOverlay,I,{BackgroundTransparency=1}):Play()h.tweenService:Create(T.stroke,I,{Transparency=T.window.theme.
ElementStrokeTransparency,Color=T.window.theme.ElementStroke}):Play()end)if T.description then T.descriptor=d(c.Parent.
descriptor).new(T.tab,{description=T.description})end return T end function f._callbackValue(aa)if aa.multiSelect then
return table.clone(aa.value)end return aa.value[1]end function f._buildSearch(aa)aa._searchOpen=false aa.searchbar=aa.
window:Create('Frame',{Name='Search',Size=UDim2.new(1,-12,0,v),BorderSizePixel=0,BackgroundColor3=Color3.fromRGB(255,255
,255),BackgroundTransparency=1,LayoutOrder=1,ClipsDescendants=false,ZIndex=1,Parent=aa.panel})aa.window:Create(
'UICorner',{CornerRadius=UDim.new(0,12),Parent=aa.searchbar})aa.searchStroke=aa.window:Create('UIStroke',{Color=Color3.
fromRGB(255,255,255),Transparency=1,Parent=aa.searchbar})aa.searchShadow=aa.window:CreateGlow(aa.searchbar,Color3.
fromRGB(255,255,255),20,1)aa.searchToggle=aa.window:Create('TextButton',{BackgroundTransparency=1,Size=UDim2.fromScale(1
,1),Text='',TextTransparency=1,ZIndex=51,Parent=aa.searchbar})aa.searchInput=aa.window:Create('TextBox',{Text='',
PlaceholderText=l.t'Search...',Size=UDim2.new(1,-58,0,16),Position=UDim2.new(0,44,0.5,0),AnchorPoint=Vector2.new(0,0.5),
BackgroundTransparency=1,TextSize=16,TextXAlignment=Enum.TextXAlignment.Left,ClearTextOnFocus=false,TextEditable=false,
Interactable=false,ZIndex=52,TextTransparency=1,Parent=aa.searchbar},{TextColor3='ContentColor',FontFace='Font',
PlaceholderColor3='PlaceholderColor'})aa.searchIcon=aa.window:Create('ImageButton',{Image='rbxassetid://'..tostring(s),
Size=UDim2.fromOffset(20,20),Position=UDim2.new(0,24,0.5,0),AnchorPoint=Vector2.new(0.5,0.5),BackgroundTransparency=1,
ScaleType=Enum.ScaleType.Fit,AutoButtonColor=false,ZIndex=53,ImageTransparency=1,Parent=aa.searchbar},{ImageColor3=
'ContentColor'})aa.window:ConnectFor(aa,aa.searchToggle.MouseButton1Click,function()if not aa._searchOpen then aa:
_expandSearch()end end)aa.window:ConnectFor(aa,aa.searchIcon.MouseButton1Click,function()if aa._searchOpen then aa:
_collapseSearch()else aa:_expandSearch()end end)aa.window:ConnectFor(aa,aa.searchInput:GetPropertyChangedSignal'Text',
function()aa:_applyFilter(aa.searchInput.Text)end)aa.window:ConnectFor(aa,aa.searchInput.FocusLost,function()if aa.
searchInput.Text==''then aa:_collapseSearch()end end)end function f._expandSearch(aa)if aa._searchOpen then return end
aa._searchOpen=true aa.searchInput.TextEditable=true aa.searchInput.Interactable=true h.tweenService:Create(aa.searchbar
,K,{Size=UDim2.new(1,-12,0,w),BackgroundTransparency=0.92}):Play()h.tweenService:Create(aa.searchStroke,K,{Transparency=
0.86}):Play()h.tweenService:Create(aa.searchShadow,K,{Transparency=0.92}):Play()h.tweenService:Create(aa.searchInput,K,{
TextTransparency=0.3}):Play()aa:_resizeToOptions()aa.searchInput:CaptureFocus()end function f._collapseSearch(aa)if not
aa._searchOpen then return end aa._searchOpen=false aa.searchInput.TextEditable=false aa.searchInput.Interactable=false
aa.searchInput:ReleaseFocus()aa.searchInput.Text=''h.tweenService:Create(aa.searchbar,K,{Size=UDim2.new(1,-12,0,v),
BackgroundTransparency=1}):Play()h.tweenService:Create(aa.searchStroke,K,{Transparency=1}):Play()h.tweenService:Create(
aa.searchShadow,K,{Transparency=1}):Play()h.tweenService:Create(aa.searchInput,K,{TextTransparency=1}):Play()aa:
_resizeToOptions()end function f._applyFilter(aa,ab)ab=string.lower(ab or'')local ac=0 for ad,ae in aa._optionFrames do
local af=ab==''or string.find(string.lower(ae.name),ab,1,true)~=nil ae.frame.Visible=af if af then ac+=1 end end aa.
emptyLabel.Visible=ac==0 and ab~=''aa:_updateCorners()aa:_resizeToOptions()aa:_syncScrollHint()end function f.
_syncScrollHint(aa)local ab,ac,ad=aa.list.AbsoluteCanvasSize,aa.list.AbsoluteWindowSize,aa.list.CanvasPosition if not ab
or not ac or not ad then return end local ae=aa._isOpen and ac.Y>0 and ab.Y-(ad.Y+ac.Y)>1 h.tweenService:Create(aa.list,
H,{ScrollBarImageTransparency=if ae then J else 1}):Play()end function f._visibleOptions(aa):{string}local ab={}for ac,
ad in aa._optionFrames do if ad.frame.Visible then table.insert(ab,ad.name)end end return ab end function f.
_buildActions(aa)if not aa.multiSelect then return end aa.actions=aa.window:Create('Frame',{Name='Actions',Size=UDim2.
new(1,-12,0,G),BackgroundTransparency=1,LayoutOrder=2,Parent=aa.panel})aa.window:Create('UIListLayout',{Padding=UDim.
new(0,12),FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,SortOrder=Enum.
SortOrder.LayoutOrder,Parent=aa.actions})local function ab(ac:string,ad:number,ae:()->())local af=aa.window:Create(
'TextButton',{AutomaticSize=Enum.AutomaticSize.X,Size=UDim2.fromOffset(0,G),BackgroundTransparency=1,Text=l.t(ac),
TextSize=13,TextTransparency=0.45,LayoutOrder=ad,Parent=aa.actions},{TextColor3='ContentColor',FontFace='Font'})aa.
window:ConnectFor(aa,af.MouseEnter,function()h.tweenService:Create(af,H,{TextTransparency=0.15}):Play()end)aa.window:
ConnectFor(aa,af.MouseLeave,function()h.tweenService:Create(af,H,{TextTransparency=0.45}):Play()end)aa.window:
ConnectFor(aa,af.MouseButton1Click,function()ae()aa:_afterBulkChange()end)return af end ab('Select all',1,function()
local ac=aa:_visibleOptions()for ad,ae in ac do if not table.find(aa.value,ae)then table.insert(aa.value,ae)end end end)
ab('Clear',2,function()local ac=aa:_visibleOptions()for ad=#aa.value,1,-1 do if table.find(ac,aa.value[ad])then table.
remove(aa.value,ad)end end end)end function f._afterBulkChange(aa)aa._desiredValue=table.clone(aa.value)for ab,ac in aa.
_optionFrames do aa._renderOptionState(ac,true)end aa:_updateSelectedLabel()aa:_updateCorners()aa.window:_runGuarded(aa,
aa.callback,aa:_callbackValue())aa.window:_persist(aa)m.click()end function f._resizeToOptions(aa)if not aa._isOpen then
return end h.tweenService:Create(aa.main,K,{Size=UDim2.new(1,-20,0,aa:_openHeight())}):Play()end function f.
_updateCorners(aa)local ab={}for ac,ad in aa._optionFrames do if ad.frame.Visible then table.insert(ab,ad)end end for ac
,ad in ab do local ae,af=if ac==1 then t else u,if ac==#ab then t else u ad.corner.TopLeftRadius=ae ad.corner.
TopRightRadius=ae ad.corner.BottomLeftRadius=af ad.corner.BottomRightRadius=af end end local function aa(ab:number):
number return ab*x+math.max(0,ab-1)*y+z*2 end local function ab(ac:number):number return math.max(math.floor((ac-z*2+y)/
(x+y)),1)end function f._pageHeight(ac):number local ad=ac.window.size return n.pageHeight(ad and ad.Y.Offset,ac.window.
layout.mode)end function f._openHeight(ac)local ad=0 for ae,af in ac._optionFrames do if af.frame.Visible then ad+=1 end
end local ae=if ac._searchOpen then w else v local af,ag=A+B+E+ae+y+(if ac.actions then G+y else 0),ac:_pageHeight()
local ah=math.min(math.max(ad,1),F,ab(ag-af))return math.min(af+aa(ah),ag)end function f._open(ac)if ac._isOpen then
return end ac._isOpen=true if ac._outsideClickConn then ac.window:Disconnect(ac._outsideClickConn)end ac.
_outsideClickConn=ac.window:Connect(h.userInputService.InputBegan,function(ad)if ad.UserInputType~=Enum.UserInputType.
MouseButton1 and ad.UserInputType~=Enum.UserInputType.Touch then return end local ae,af,ag=ad.Position,ac.main.
AbsolutePosition,ac.main.AbsoluteSize if ae.X<af.X or ae.X>af.X+ag.X or ae.Y<af.Y or ae.Y>af.Y+ag.Y then ac:_close()end
end)h.tweenService:Create(ac.main,TweenInfo.new(0.5,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{Size=UDim2.
new(1,-20,0,ac:_openHeight())}):Play()h.tweenService:Create(ac.chevron,TweenInfo.new(0.7,Enum.EasingStyle.Exponential,
Enum.EasingDirection.Out),{Rotation=0}):Play()h.tweenService:Create(ac.panel,TweenInfo.new(0.4,Enum.EasingStyle.Quint,
Enum.EasingDirection.Out),{BackgroundTransparency=ac.window.theme.ElementTransparency or 0}):Play()h.tweenService:
Create(ac.panelStroke,TweenInfo.new(0.4,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{Transparency=ac.window.theme.
ElementStrokeTransparency}):Play()h.tweenService:Create(ac.searchIcon,TweenInfo.new(0.4,Enum.EasingStyle.Quint,Enum.
EasingDirection.Out),{ImageTransparency=0.5}):Play()for ad,ae in ac._optionFrames do ac._renderOptionState(ae,true)end
ac:_syncScrollHint()ac:_bringIntoView()end function f._bringIntoView(ac)local ad=ac.tab and ac.tab.tabPage if not ad
then return end local ae,af,ag,ah=ad.AbsoluteWindowSize,ad.CanvasPosition,ad.AbsolutePosition,ac.main.AbsolutePosition
if not ae or not af or not ag or not ah or ae.Y<=0 then return end local ai=ah.Y-ag.Y+af.Y local P=ai+ac:_openHeight()
local Q=P-(af.Y+ae.Y)if Q<=0 then return end local R=math.min(af.Y+Q+8,ai)h.tweenService:Create(ad,TweenInfo.new(0.4,
Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{CanvasPosition=Vector2.new(af.X,R)}):Play()end function f._close(ac)if
not ac._isOpen then return end ac._isOpen=false if ac._outsideClickConn then ac.window:Disconnect(ac._outsideClickConn)
ac._outsideClickConn=nil end ac:_collapseSearch()ac:_syncScrollHint()h.tweenService:Create(ac.chevron,TweenInfo.new(0.7,
Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{Rotation=180}):Play()h.tweenService:Create(ac.panel,TweenInfo.
new(0.4,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{BackgroundTransparency=1}):Play()h.tweenService:Create(ac.
panelStroke,TweenInfo.new(0.4,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{Transparency=1}):Play()h.tweenService:
Create(ac.searchIcon,TweenInfo.new(0.4,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{ImageTransparency=1}):Play()for
ad,ae in ac._optionFrames do ac._renderOptionState(ae,true)end h.tweenService:Create(ac.main,TweenInfo.new(0.5,Enum.
EasingStyle.Exponential,Enum.EasingDirection.Out),{Size=UDim2.new(1,-20,0,41)}):Play()end function f._destroyOption(ac,
ad)if ad.connections then for ae,af in ad.connections do local ag=table.find(ac.connections,af)if ag then table.remove(
ac.connections,ag)end ac.window:Disconnect(af)end ad.connections=nil end ac.window:DestroySubtree(ad.frame)end function
f._deriveSelection(ac)local ad=ac.value ac.value=N(ac._desiredValue or ac.value,ac.options)return not O(ac.value,ad)end
function f._reindexOptions(ac)for ad,ae in ac._optionFrames do ae.frame.LayoutOrder=ad end end function f._rebindOption(
ac,ad,ae,af)ad.name=ae ad.title.Text=ae ad.frame.LayoutOrder=af end function f._destroyOptionsFrom(ac,ad)local ae,af={},
{}for ag=#ac._optionFrames,ad,-1 do local ah=ac._optionFrames[ag]table.insert(ae,ah.frame)if ah.connections then table.
move(ah.connections,1,#ah.connections,#af+1,af)ah.connections=nil end ac._optionFrames[ag]=nil end ac.window:
DisconnectMany(ac,af)ac.window:DestroySubtrees(ae)end function f.Refresh(ac,ad)ac.options=L(ad or{})local ae,af,ag=ac:
_deriveSelection(),#ac._optionFrames,#ac.options for ah=1,math.min(af,ag)do ac:_rebindOption(ac._optionFrames[ah],ac.
options[ah],ah)end for ah=af+1,ag do local ai=ac._buildOption(ac.options[ah])ai.frame.LayoutOrder=ah table.insert(ac.
_optionFrames,ai)end if ag<af then ac:_destroyOptionsFrom(ag+1)end for ah,ai in ac._optionFrames do ac.
_renderOptionState(ai,false)end ac._updateSelectedLabel()ac:_applyFilter(if ac._searchOpen then ac.searchInput.Text else
'')if ae then ac.window:_runGuarded(ac,ac.callback,ac:_callbackValue())ac.window:_persist(ac)end end function f.Add(ac,
ad)if typeof(ad)~='string'or ad==''then return end if table.find(ac.options,ad)then return end table.insert(ac.options,
ad)local ae=ac._buildOption(ad)table.insert(ac._optionFrames,ae)local af=ac:_deriveSelection()if ac._isOpen then ac.
_renderOptionState(ae,true)end ac:_applyFilter(if ac._searchOpen then ac.searchInput.Text else'')if af then ac.
_updateSelectedLabel()ac.window:_runGuarded(ac,ac.callback,ac:_callbackValue())ac.window:_persist(ac)end end function f.
Remove(ac,ad)local ae=table.find(ac.options,ad)if not ae then return end table.remove(ac.options,ae)for af,ag in ac.
_optionFrames do if ag.name==ad then ac:_destroyOption(ag)table.remove(ac._optionFrames,af)ac:_reindexOptions()break end
end if ac._desiredValue then local af=table.find(ac._desiredValue,ad)if af then table.remove(ac._desiredValue,af)end end
local af=table.find(ac.value,ad)if af then table.remove(ac.value,af)ac._updateSelectedLabel()ac.window:_runGuarded(ac,ac
.callback,ac:_callbackValue())ac.window:_persist(ac)end ac:_applyFilter(if ac._searchOpen then ac.searchInput.Text else
'')end function f.Set(ac,ad,ae)local af=M(ad,ac.multiSelect)ac._desiredValue=af ac.value=N(af,ac.options)for ag,ah in ac
._optionFrames do ac._renderOptionState(ah,true)end ac._updateSelectedLabel()if not ae then ac.window:_runGuarded(ac,ac.
callback,ac:_callbackValue())ac.window:_persist(ac)end end function f._setShown(ac,ad,ae)local af=ac.window af:_reveal(
ac.stroke,{Transparency=if ad then af.theme.ElementStrokeTransparency else 1},ae)af:_reveal(ac.title,{TextTransparency=
if ad then 0 else 1},ae)af:_reveal(ac.top,{BackgroundTransparency=if ad then(af.theme.ElementTransparency or 0)else 1},
ae)if ac.iconLabel then af:_reveal(ac.iconLabel,{ImageTransparency=if ad then 0 else 1},ae)end if ac.descriptor then af:
_reveal(ac.descriptor.titleLabel,{TextTransparency=if ad then 0.7 else 1},ae)end af:_reveal(ac.selectedLabel,{
TextTransparency=if ad then 0.5 else 1},ae)af:_reveal(ac.chevron,{ImageTransparency=if ad then 0.5 else 1},ae)if not ad
and ac._isOpen then ac:_close()end end function f.MoveTo(ac,ad)ac.tab:_moveElement(ac,ad)end function f.MoveToTop(ac)ac.
tab:_moveElement(ac,1)end function f.MoveToBottom(ac)ac.tab:_moveElement(ac,#ac.tab.elements)end function f.MoveUp(ac)
local ad=table.find(ac.tab.elements,ac)if ad then ac.tab:_moveElement(ac,ad-1)end end function f.MoveDown(ac)local ad=
table.find(ac.tab.elements,ac)if ad then ac.tab:_moveElement(ac,ad+1)end end o(f)return f end)()end,[13]=function()local
aa,ab,ac=a(13)local ad return(function(...)local ae,af,ag,ah=ac(ab.Parent.Parent.utility.variables),ac(ab.Parent.Parent.
utility.network),{},{logo={512,512},thumbnail={768,432}}local function ai(b,c)local d=ah[c]if not d then return nil end
local e=if c=='logo'then'Logo'else'GameThumbnail'return string.format('rbxthumb://type=%s&id=%d&w=%d&h=%d',e,b,d[1],d[2]
)end local function b(c,d)local e=ah[d]if not e then return nil end return string.format(
[[https://thumbnails.roblox.com/v1/games/multiget/thumbnails?universeIds=%d&size=%dx%d&format=Png&isCircular=false]],c,e
[1],e[2])end ag.thumbnailUrl=b::((universeId:number,kind:string)->string?)?ag.lastUniverseId=nil::number?local function
c(d,e)local f=ah[e]if not d or not f then return nil end local g=af.getRequestFn()if not g then return ai(d,e)end local
h=ag.thumbnailUrl local i=if type(h)=='function'then h(d,e)else h and string.format(h,d,f[1],f[2])if not i then return
ai(d,e)end local j,k=pcall(g,{Url=i,Method='GET'})if not j or type(k)~='table'then return nil end local l=k.Body if
type(l)~='string'or l==''then return nil end local m,n=pcall(function()return ae.httpService:JSONDecode(l)end)if not m
or type(n)~='table'then return nil end local o=n.data if type(o)~='table'then return nil end local p=o[1]if type(p)~=
'table'then return nil end if p.state=='Completed'and type(p.imageUrl)=='string'then return p.imageUrl end return nil
end function ag.get(d)local e,f=if type(game)=='table'and type(game.PlaceId)=='number'then game.PlaceId else 0,{name=
type(game)=='table'and type(game.Name)=='string'and game.Name or'..',creator=nil,description=nil,universeId=nil}if e==0
then d(f)return end local g,h=pcall(function()return game:GetService'MarketplaceService':GetProductInfo(e)end)if not g
or type(h)~='table'then d(f)return end if type(h.UniverseId)=='number'and h.UniverseId~=0 then f.universeId=h.UniverseId
end if type(h.Name)=='string'and h.Name~=''then f.name=h.Name end local i=h.Creator if type(i)=='table'and type(i.Name)
=='string'and i.Name~=''then f.creator=i.Name end if type(h.Description)=='string'and h.Description~=''then f.
description=h.Description end ag.lastUniverseId=f.universeId d(f)end function ag.thumbnails(d,e)if not d then e(nil,nil)
return end task.spawn(function()local f,g=c(d,'thumbnail'),c(d,'logo')if e then e(f,g)end end)end return ag end)()end,[
14]=function()local aa,ab,ac=a(14)local ad return(function(...)local ae={}ae.__index=ae ae.__type='Group'local af,ag,ah,
ai,b=ac(ab.Parent.Parent.utility.moveable),ac(ab.Parent.Parent.utility.log),ac(ab.Parent.Parent.utility.ordering),8,{
button=true,toggle=true,stat=true,slider=true}function ae.new(c,d)d=if typeof(d)=='table'then d else{}local e=string.
lower(d.direction or d.Direction or'row')local f=e=='column'or e=='vertical'local g=not f local h=if g then Enum.
FillDirection.Horizontal else Enum.FillDirection.Vertical local i,j=setmetatable({tab=assert(c,
'Missing argument #1 (Tab expected)'),window=c.window,direction=h,compact=g,forgetState=c.forgetState,elements={}},ae),c
.direction==Enum.FillDirection.Horizontal i.main=i.window:Create('Frame',{Name='Group',BackgroundTransparency=1,
BorderSizePixel=0,AutomaticSize=Enum.AutomaticSize.Y,Size=if g then UDim2.new(1,-20,0,0)else UDim2.new(1,0,0,0),Parent=i
.tab.tabPage})if j then i.main.Size=UDim2.new(0,0,0,0)i.window:Create('UIFlexItem',{FlexMode=Enum.UIFlexMode.Fill,Parent
=i.main})end i.tabPage=i.main i.layout=i.window:Create('UIListLayout',{FillDirection=h,SortOrder=Enum.SortOrder.
LayoutOrder,Padding=UDim.new(0,ai),VerticalAlignment=if g then Enum.VerticalAlignment.Center else Enum.VerticalAlignment
.Top,HorizontalAlignment=if g then Enum.HorizontalAlignment.Left else Enum.HorizontalAlignment.Center,Parent=i.main})
return i end function ae._add(c,d,e)if c.compact and not b[d]then ag.warn(`Rayfield: a row only holds compact elements (button/toggle/stat/slider), ignoring '{
d}'. Use a column for it.`)return nil end local f=ac(ab.Parent[d]).new(c,e)table.insert(c.elements,f)ah(f,#c.elements*10
)c.window:_restoreLate(f)if c.compact then c:_wrapChild(f)end c:_reflowRow()if not c.window.hidden then f:_setShown(true
,true)end return f end function ae._reflowRow(c)if c.direction~=Enum.FillDirection.Horizontal then return end local d=#c
.elements>0 for e,f in c.elements do if f.__type~='Group'then d=false break end end c.layout.Padding=if d then UDim.new(
0,-10)else UDim.new(0,ai)end function ae._wrapChild(c,d)c.layout.Wraps=true c.layout.HorizontalFlex=Enum.UIFlexAlignment
.Fill d._widthManaged=true local e=if d._minWidth then d:_minWidth()else 0 if e>0 then d.main.AutomaticSize=Enum.
AutomaticSize.None d.main.Size=UDim2.new(0,e,d.main.Size.Y.Scale,d.main.Size.Y.Offset)end end function ae.CreateButton(c
,d)return c:_add('button',d)end function ae.CreateToggle(c,d)return c:_add('toggle',d)end function ae.CreateSwitch(c,d)
return c:_add('toggle',d)end function ae.CreateStat(c,d)return c:_add('stat',d)end function ae.CreateSlider(c,d)return c
:_add('slider',d)end function ae.CreateDropdown(c,d)return c:_add('dropdown',d)end function ae.CreateSection(c,d)return
c:_add('section',d)end function ae.CreateText(c,d)return c:_add('text',d)end function ae.CreateDivider(c,d)return c:
_add('divider',d)end function ae._addGroup(c,d)d=if typeof(d)=='table'then table.clone(d)else{}if c.direction==Enum.
FillDirection.Horizontal then c.layout.VerticalAlignment=Enum.VerticalAlignment.Top if c.tab.direction~=Enum.
FillDirection.Horizontal then c.main.Size=UDim2.new(1,0,0,0)end end local e=ae.new(c,d)table.insert(c.elements,e)e.main.
LayoutOrder=#c.elements*10 c:_reflowRow()return e end function ae.CreateGroup(c,d)return c:_addGroup(d)end function ae.
_moveElement(c,d,e)local f=table.find(c.elements,d)if not f then return end table.remove(c.elements,f)e=math.clamp(e,1,#
c.elements+1)table.insert(c.elements,e,d)for g,h in c.elements do ah(h,g*10)end end function ae._setShown(c,d,e)for f,g
in c.elements do g:_setShown(d,e)end end function ae._refreshTheme(c)for d,e in c.elements do if e._refreshTheme then e:
_refreshTheme()end end end af(ae)return ae end)()end,[15]=function()local aa,ab,ac=a(15)local ad return(function(...)
local ae=ab.Parent.Parent.utility local af,ag,ah,ai,b,c,d,e=ac(ae.variables),ac(ae.locale),ac(ae.image),ac(ab.Parent.
changelog),ac(ab.Parent.gameInfo),{},{'January','February','March','April','May','June','July','August','September',
'October','November','December'},{'th','st','nd','rd','th','th','th','th','th','th'}local function f(g)local h,i=g%10,g%
100 if i>=11 and i<=13 then return'th'end return e[h]or'th'end local function g(h)return tostring(h)..f(h)end
local function h()local i=af.localPlayer if i then local j=i.DisplayName or i.Name return ag.resolve'Greetings,'..' '..
tostring(j)..'.'end return ag.resolve'Greetings'end local function i()local j=os.date'*t'local k=d[j.month]or'January'
return string.format('%s %s, %d',k,g(j.day),j.year)end local function j(k)function k._setShown(l,m,n)if not l.main or
not l.main.Parent then return end for o,p in l.fades do l.window:_reveal(p.instance,{[p.prop]=if m then p.to else 1},n)
end end return k end function c.buildHeader(k,l)local m=k:Create('Frame',{Name='HomeHeader',Size=UDim2.new(1,-40,0,0),
AutomaticSize=Enum.AutomaticSize.Y,BorderSizePixel=0,BackgroundTransparency=1,Parent=l.tabPage})k:Create('UIListLayout',
{FillDirection=Enum.FillDirection.Vertical,SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,2),Parent=m})local n,
o=k:Create('TextLabel',{Text=h(),Size=UDim2.new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BorderSizePixel=0,
BackgroundTransparency=1,TextSize=22,TextXAlignment=Enum.TextXAlignment.Left,TextWrapped=true,LayoutOrder=1,
TextTransparency=1,Parent=m},{TextColor3='TitlingColor',FontFace='TitleFont'}),k:Create('TextLabel',{Text=i(),Size=UDim2
.new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BorderSizePixel=0,BackgroundTransparency=1,TextSize=14,TextXAlignment=
Enum.TextXAlignment.Left,TextWrapped=true,LayoutOrder=2,TextTransparency=1,Parent=m},{TextColor3='ContentColor',FontFace
='Font'})return j{window=k,fades={{instance=n,prop='TextTransparency',to=0},{instance=o,prop='TextTransparency',to=0.6}}
,__type='HomeHeader',main=m,name='Home'}end function c.buildWelcome(k,l,m)local n=k:Create('Frame',{Name='Welcome',Size=
UDim2.new(1,-20,0,0),AutomaticSize=Enum.AutomaticSize.Y,BorderSizePixel=0,BackgroundColor3=Color3.fromRGB(255,255,255),
BackgroundTransparency=1,Parent=l.tabPage},{BackgroundTransparency='ElementTransparency'})local o=k:StyleElementBody(n)k
:Create('UIPadding',{PaddingTop=UDim.new(0,0),PaddingBottom=UDim.new(0,18),PaddingLeft=UDim.new(0,0),PaddingRight=UDim.
new(0,0),Parent=n})k:Create('UIListLayout',{FillDirection=Enum.FillDirection.Vertical,SortOrder=Enum.SortOrder.
LayoutOrder,Padding=UDim.new(0,14),Parent=n})local p=k:Create('Frame',{Name='Media',Size=UDim2.new(1,0,0,140),
BorderSizePixel=0,ClipsDescendants=true,BackgroundColor3=Color3.fromRGB(255,255,255),LayoutOrder=1,
BackgroundTransparency=1,Parent=n})k:Create('UICorner',{CornerRadius=UDim.new(0,10),Parent=p})local q=k:Create('Frame',{
Size=UDim2.new(1,0,1,0),BackgroundColor3=Color3.fromRGB(255,255,255),BorderSizePixel=0,BackgroundTransparency=1,Parent=p
},{BackgroundTransparency='ElementTransparency'})k:Create('UIGradient',{Rotation=270,Parent=q},{Color='ElementGradient'}
)local function r()if not m.name then return''end if m.name==''or m.name=='..'or m.name=='.'then return''end return
string.sub(m.name,1,1)end local s,t,u=k:Create('TextLabel',{Text=r(),Size=UDim2.fromScale(1,1),BackgroundTransparency=1,
BorderSizePixel=0,TextSize=48,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,
TextTransparency=1,Parent=q},{TextColor3='ContentColor',FontFace='TitleFont'}),k:Create('ImageLabel',{Image='',Size=
UDim2.fromScale(1,1),ScaleType=Enum.ScaleType.Crop,BorderSizePixel=0,BackgroundTransparency=1,ImageTransparency=1,Parent
=p}),k:Create('Frame',{Name='Identity',Size=UDim2.new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BorderSizePixel=0,
BackgroundTransparency=1,LayoutOrder=2,Parent=n})u.Size=UDim2.new(1,0,0,0)k:Create('UIListLayout',{FillDirection=Enum.
FillDirection.Horizontal,SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,12),VerticalAlignment=Enum.
VerticalAlignment.Center,Parent=u})local v=k:Create('Frame',{Name='Logo',Size=UDim2.fromOffset(56,56),BorderSizePixel=0,
ClipsDescendants=true,BackgroundColor3=Color3.fromRGB(255,255,255),LayoutOrder=1,BackgroundTransparency=1,Parent=u})k:
Create('UICorner',{CornerRadius=UDim.new(0,8),Parent=v})local w,x=k:Create('ImageLabel',{Image='',Size=UDim2.fromScale(1
,1),ScaleType=Enum.ScaleType.Crop,BorderSizePixel=0,BackgroundTransparency=1,ImageTransparency=1,Parent=v}),k:Create(
'Frame',{Name='Text',Size=UDim2.new(1,-68,0,0),AutomaticSize=Enum.AutomaticSize.Y,BorderSizePixel=0,
BackgroundTransparency=1,LayoutOrder=2,Parent=u})k:Create('UIListLayout',{SortOrder=Enum.SortOrder.LayoutOrder,Padding=
UDim.new(0,2),Parent=x})local y,z,A,B=k:Create('TextLabel',{Name='Title',Text=m.name,Size=UDim2.new(1,0,0,0),
AutomaticSize=Enum.AutomaticSize.Y,BorderSizePixel=0,BackgroundTransparency=1,TextSize=20,TextXAlignment=Enum.
TextXAlignment.Left,TextWrapped=true,LayoutOrder=1,TextTransparency=1,Parent=x},{TextColor3='TitlingColor',FontFace=
'TitleFont'}),k:Create('TextLabel',{Name='Creator',Size=UDim2.new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,
BorderSizePixel=0,BackgroundTransparency=1,TextSize=14,TextXAlignment=Enum.TextXAlignment.Left,TextWrapped=true,
LayoutOrder=2,TextTransparency=1,Parent=x},{TextColor3='ContentColor',FontFace='Font'}),k:Create('TextLabel',{Name=
'Description',Size=UDim2.new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BorderSizePixel=0,BackgroundTransparency=1,
TextSize=14,TextWrapped=true,TextXAlignment=Enum.TextXAlignment.Left,LayoutOrder=3,TextTransparency=1,Parent=n},{
TextColor3='ContentColor',FontFace='Font'}),if m.creator then`by {m.creator}`else''z.Text=B z.Visible=B~=''A.Text=if m.
description then tostring(m.description)else''A.Visible=m.description~=nil and m.description~=''if m.universeId then b.
thumbnails(m.universeId,function(C,D)if k.unloaded or not n.Parent then return end local E=if C and C~=''then ah.
resolve(C)else''if E~=''then t.Image=E t.ImageTransparency=0 s.Visible=false end local F=if D and D~=''then ah.resolve(D
)else''if F~=''then w.Image=F w.ImageTransparency=0 end end)end return j{window=k,fades={{instance=n,prop=
'BackgroundTransparency',to=k.theme.ElementTransparency or 0},{instance=o,prop='Transparency',to=k.theme.
ElementStrokeTransparency},{instance=q,prop='BackgroundTransparency',to=k.theme.ElementTransparency or 0},{instance=y,
prop='TextTransparency',to=0},{instance=z,prop='TextTransparency',to=0.55},{instance=A,prop='TextTransparency',to=0.6},{
instance=s,prop='TextTransparency',to=0.7}},__type='Welcome',main=n,name=m.name,title=y}end function c.buildChangelog(k,
l,m)local n=ac(ab.Parent.section).new(l,{name=ag.t"What's new"})l:_register(n)local o=k:Create('Frame',{Name='Changelog'
,Size=UDim2.new(1,-20,0,0),AutomaticSize=Enum.AutomaticSize.Y,BorderSizePixel=0,BackgroundTransparency=1,Parent=l.
tabPage})k:Create('UIListLayout',{SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,ai.boxGap),Parent=o})local p=m
if not p or#p==0 then p={{title=ag.t'Welcome',description=ag.t
[[Thanks for opening Rayfield. Build your menu below and it stays saved between sessions.]]}}end local q={}for r,s in p
do ai.build(k,o,s,r,function(t,u,v)table.insert(q,{instance=t,prop=u,to=v})end,{auto=true})end return j{window=k,fades=q
,__type='Changelog',main=o,name="What's new"}end function c.new(k,l,m)m=if typeof(m)=='table'then m else{}local n=c.
buildHeader(k,l)l:_register(n)b.get(function(o)if k.unloaded or not l.tabPage or not l.tabPage.Parent then return end
local p=c.buildWelcome(k,l,o)l:_register(p)local q=c.buildChangelog(k,l,m.changelog)l:_register(q)end)end return c end)(
)end,[16]=function()local aa,ab,ac=a(16)local ad return(function(...)local ae={}ae.__index=ae ae.__type='Input'local af=
ab.Parent.Parent.utility local ag,ah,ai,b,c,d,e=ac(af.variables),ac(af.functions),ac(af.moveable),ac(af.lockable),ac(af.
locale),ac(af.constants),ac(af.HapticEngine)local f,g=d.pillResizeInfo,TweenInfo.new(0.15,Enum.EasingStyle.Quint,Enum.
EasingDirection.Out)local function h(i)local j,k=i:match'^([%d%.%-]+)%^([%d%.%-]+)$'if j and k then local l,m=tonumber(j
),tonumber(k)if l and m then return l^m end end return tonumber(i)end function ae.new(i,j)j=if typeof(j)=='table'then j
else{}local k=setmetatable({tab=assert(i,'Missing argument #1 (Tab expected)'),window=i.window,name=j.name or j.Name or
'Input',icon=j.icon or j.Icon,description=j.description or j.Description,forgetState=j.forgetState or j.ForgetState or i
.forgetState,placeholder=j.placeholder or j.Placeholder or'',numeric=j.numeric or j.Numeric or false,clearOnFocus=j.
clearOnFocus or j.ClearOnFocus or false,callback=j.callback or j.Callback or function()end},ae)k.value=tostring(j.value
or j.Value or j.currentValue or j.CurrentValue or'')k.flag=j.flag or j.Flag or(not k.forgetState and ah.
deriveFlagFromName(k.name)or nil)k.window:_registerControl(k)k.main=k.window:Create('Frame',{Size=UDim2.new(1,-20,0,41),
BorderSizePixel=0,Name=k.name,BackgroundColor3=Color3.fromRGB(255,255,255),BackgroundTransparency=1,Parent=k.tab.tabPage
},{BackgroundTransparency='ElementTransparency'})k.stroke=k.window:StyleElementBody(k.main)k.hoverOverlay=k.window:
CreateHoverOverlay(k.main)k.container=k.window:Create('Frame',{Size=UDim2.new(0,170,0,16),Position=UDim2.new(0,20,0.5,0)
,AnchorPoint=Vector2.new(0,0.5),BackgroundTransparency=1,BorderSizePixel=0,ZIndex=5,Parent=k.main})k.window:Create(
'UIListLayout',{Padding=UDim.new(0,5),FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.
VerticalAlignment.Center,Parent=k.container})if k.icon then k.iconLabel=k.window:Create('ImageLabel',{Image=k.icon,Size=
UDim2.fromOffset(16,16),BorderSizePixel=0,BackgroundTransparency=1,ZIndex=5,ImageTransparency=1,Parent=k.container},{
ImageColor3='ContentColor'})end k.title=k.window:Create('TextLabel',{Text=c.t(k.name),Size=UDim2.fromOffset(150,16),
AutomaticSize=Enum.AutomaticSize.X,BorderSizePixel=0,BackgroundTransparency=1,TextSize=16,TextXAlignment=Enum.
TextXAlignment.Left,LayoutOrder=1,ZIndex=5,TextTransparency=1,Parent=k.container},{TextColor3='ContentColor',FontFace=
'Font'})k.box=k.window:Create('Frame',{AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,-7,0,20),Size=UDim2.
fromOffset(85,30),BorderSizePixel=0,BackgroundTransparency=1,Parent=k.main},{BackgroundColor3='FieldBackground'})k.
window:Create('UICorner',{CornerRadius=UDim.new(1,0),Parent=k.box})k.boxStroke=k.window:Create('UIStroke',{Transparency=
1,Parent=k.box},{Color='SurfaceStroke'})k.glow=k.window:CreateGlow(k.box,'FieldGlow',20,1)k._glowIdle=1 k.input=k.window
:Create('TextBox',{Text=k.value,PlaceholderText=c.t(k.placeholder),Size=UDim2.new(1,-15,0,15),Position=UDim2.new(0.5,0,
0.5,0),AnchorPoint=Vector2.new(0.5,0.5),BackgroundTransparency=1,BorderSizePixel=0,TextSize=15,TextXAlignment=Enum.
TextXAlignment.Center,TextTruncate=Enum.TextTruncate.AtEnd,ClearTextOnFocus=k.clearOnFocus,TextTransparency=1,Parent=k.
box},{TextColor3='ContentColor',FontFace='Font',PlaceholderColor3='PlaceholderColor'})k.window:ConnectFor(k,k.input:
GetPropertyChangedSignal'Text',function()if k.numeric then local l=(k.input.Text:gsub('[^%d%.%-eE%^]',''))if l~=k.input.
Text then k.input.Text=l return end end k:_sizeBox(true)end)k.window:ConnectFor(k,k.input.Focused,function()ag.
tweenService:Create(k.input,g,{TextTransparency=0}):Play()end)k.window:ConnectFor(k,k.input.FocusLost,function()ag.
tweenService:Create(k.input,g,{TextTransparency=0.6}):Play()if k.clearOnFocus and k.input.Text==''and k.value~=''then k.
input.Text=k.value return end if k.input.Text==k.value then return end k:_commit(k.input.Text)end)k.window:
_wireElementHover(k)if k.description then k.descriptor=ac(ab.Parent.descriptor).new(k.tab,{description=k.description})
end k:_sizeBox(false)return k end function ae._sizeBox(i,j)local k=i.input.Text~=''and i.input.Text or i.placeholder
local l=math.clamp(ah.textWidth(i.window.theme.Font,15,k)+30,70,220)if j then ag.tweenService:Create(i.box,f,{Size=UDim2
.fromOffset(l,30)}):Play()else i.box.Size=UDim2.fromOffset(l,30)end end function ae._commit(i,j,k)j=tostring(j)if i.
numeric then local l=h(j)if not l or l~=l or l==math.huge or l==-math.huge then if i.input.Text~=i.value then i.input.
Text=i.value end return end j=tostring(l)end local l=j~=i.value i.value=j if i.input.Text~=j then i.input.Text=j end if
not k then i.window:_runGuarded(i,i.callback,j)i.window:_persist(i)if l and not i.window._loading then e.click()i.window
:_flashResult(i,true)end end end function ae.Set(i,j,k)i:_commit(j,k)end function ae._setShown(i,j,k)local l=i.window if
j then l:_revealCommon(i,k)l:_reveal(i.box,{BackgroundTransparency=l.theme.FieldTransparency},k)l:_reveal(i.boxStroke,{
Transparency=0.85},k)l:_reveal(i.input,{TextTransparency=0.6},k)else l:_hideCommon(i,k)l:_reveal(i.box,{
BackgroundTransparency=1},k)l:_reveal(i.boxStroke,{Transparency=1},k)l:_reveal(i.input,{TextTransparency=1},k)end end
function ae._refreshTheme(i)ag.tweenService:Create(i.box,TweenInfo.new(0.5,Enum.EasingStyle.Quint,Enum.EasingDirection.
Out),{BackgroundTransparency=i.window.theme.FieldTransparency}):Play()end ai(ae)b(ae)return ae end)()end,[17]=function()
local aa,ab,ac=a(17)local ad return(function(...)local ae={}ae.__index=ae ae.__type='Keybind'local af=ab.Parent.Parent.
utility local ag,ah,ai,b,c,d,e,f,g=ac(af.variables),ac(af.functions),ac(af.moveable),ac(af.lockable),ac(af.locale),ac(af
.constants),ac(af.HapticEngine),ac(af.enums),ac(af.log)local h,i,j=d.pillResizeInfo,TweenInfo.new(0.25,Enum.EasingStyle.
Quint,Enum.EasingDirection.Out),{[Enum.UserInputType.MouseButton1]='MB1',[Enum.UserInputType.MouseButton2]='MB2',[Enum.
UserInputType.MouseButton3]='MB3'}local function k(l)if typeof(l)~='EnumItem'or l==Enum.KeyCode.Unknown then return
'None'end return j[l]or l.Name end local function l(m)if typeof(m)=='EnumItem'then return m end if type(m)=='string'then
local n,o=pcall(function()return Enum.KeyCode[m]end)if n and o then return o end local p,q=pcall(function()return Enum.
UserInputType[m]end)if p and q and j[q]then return q end end return Enum.KeyCode.Unknown end function ae.new(m,n)n=if
typeof(n)=='table'then n else{}local o=setmetatable({tab=assert(m,'Missing argument #1 (Tab expected)'),window=m.window,
name=n.name or n.Name or'Keybind',icon=n.icon or n.Icon,description=n.description or n.Description,forgetState=n.
forgetState or n.ForgetState or m.forgetState,isMenuToggle=n.isMenuToggle or n.IsMenuToggle or false,callback=n.callback
or n.Callback or function()end,onChanged=n.onChanged or n.OnChanged or function()end,hold=n.hold or n.Hold or false,
holdThreshold=n.holdThreshold or n.HoldThreshold or 0.2,recording=false},ae)o.value=l(n.value or n.Value or n.default or
n.Default)o.flag=n.flag or n.Flag or(not o.forgetState and ah.deriveFlagFromName(o.name)or nil)o.window:
_registerControl(o)o.main=o.window:Create('Frame',{Size=UDim2.new(1,-20,0,41),BorderSizePixel=0,Name=o.name,
BackgroundColor3=Color3.fromRGB(255,255,255),BackgroundTransparency=1,Parent=o.tab.tabPage},{BackgroundTransparency=
'ElementTransparency'})o.stroke=o.window:StyleElementBody(o.main)o.hoverOverlay=o.window:CreateHoverOverlay(o.main)o.
container=o.window:Create('Frame',{Size=UDim2.new(0,170,0,16),Position=UDim2.new(0,20,0.5,0),AnchorPoint=Vector2.new(0,
0.5),BackgroundTransparency=1,BorderSizePixel=0,ZIndex=5,Parent=o.main})o.window:Create('UIListLayout',{Padding=UDim.
new(0,5),FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,Parent=o.container}
)if o.icon then o.iconLabel=o.window:Create('ImageLabel',{Image=o.icon,Size=UDim2.fromOffset(16,16),BorderSizePixel=0,
BackgroundTransparency=1,ZIndex=5,ImageTransparency=1,Parent=o.container},{ImageColor3='ContentColor'})end o.title=o.
window:Create('TextLabel',{Text=c.t(o.name),Size=UDim2.fromOffset(150,16),AutomaticSize=Enum.AutomaticSize.X,
BorderSizePixel=0,BackgroundTransparency=1,TextSize=16,TextXAlignment=Enum.TextXAlignment.Left,LayoutOrder=1,ZIndex=5,
TextTransparency=1,Parent=o.container},{TextColor3='ContentColor',FontFace='Font'})o.box=o.window:Create('TextButton',{
AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,-7,0,20),Size=UDim2.fromOffset(40,30),AutoButtonColor=false,Text='',
BorderSizePixel=0,BackgroundTransparency=1,Parent=o.main},{BackgroundColor3='FieldBackground'})o.window:Create(
'UICorner',{CornerRadius=UDim.new(1,0),Parent=o.box})o.boxStroke=o.window:Create('UIStroke',{Transparency=1,Parent=o.box
},{Color='SurfaceStroke'})o.glow=o.window:CreateGlow(o.box,'FieldGlow',20,1)o._glowIdle=0.9 o.keyLabel=o.window:Create(
'TextLabel',{Text=k(o.value),Size=UDim2.fromScale(1,1),BackgroundTransparency=1,BorderSizePixel=0,TextSize=15,
TextXAlignment=Enum.TextXAlignment.Center,ZIndex=2,TextTransparency=1,Parent=o.box},{TextColor3='ContentColor',FontFace=
'Font'})o.window:ConnectFor(o,o.box.MouseButton1Click,function()e.click()if o.recording then o:_stopRecording()else o:
_startRecording()end end)o.window:ConnectFor(o,ag.userInputService.InputBegan,function(p,q)if q then return end if o.
recording then o:_capture(p)return end if o.window._recordingKeybind then return end if o:_matches(p)then if o.hold then
o:_beginHold(p)else o.window:_runGuarded(o,o.callback,o.value)end end end)o.window:_wireElementHover(o)if o.description
then o.descriptor=ac(ab.Parent.descriptor).new(o.tab,{description=o.description})end o:_sizeBox(false)return o end
function ae._sizeBox(m,n)local o=math.clamp(ah.textWidth(m.window.theme.Font,15,m.keyLabel.Text)+28,40,200)if n then ag.
tweenService:Create(m.box,h,{Size=UDim2.fromOffset(o,30)}):Play()else m.box.Size=UDim2.fromOffset(o,30)end end function
ae._startRecording(m)local n=m.window._recordingKeybind if n and n~=m then n:_stopRecording()end m.recording=true m.
window._recordingKeybind=m m.keyLabel.Text=c.resolve'Recording'm:_sizeBox(true)ag.tweenService:Create(m.glow,i,{
Transparency=0.7}):Play()ag.tweenService:Create(m.keyLabel,i,{TextTransparency=0}):Play()end function ae._stopRecording(
m)m.recording=false if m.window._recordingKeybind==m then local n=m.window task.defer(function()if n._recordingKeybind==
m then n._recordingKeybind=nil end end)end m.keyLabel.Text=k(m.value)m:_sizeBox(true)ag.tweenService:Create(m.glow,i,{
Transparency=0.9}):Play()ag.tweenService:Create(m.keyLabel,i,{TextTransparency=0.6}):Play()end function ae._capture(m,n)
local o if n.UserInputType==Enum.UserInputType.Keyboard then if n.KeyCode==Enum.KeyCode.Escape then m:_stopRecording()
return end if n.KeyCode==Enum.KeyCode.Backspace then m:_bind(Enum.KeyCode.Unknown)return end o=n.KeyCode elseif n.
UserInputType==Enum.UserInputType.MouseButton2 or n.UserInputType==Enum.UserInputType.MouseButton3 then o=n.
UserInputType end if not o then return end if m.isMenuToggle then local p=m.window:_keybindUsing(o,m)if p then m.window:
Notify{title=c.resolve'Keybind unavailable',content=string.format(c.resolve'%s is bound to %s. Kept %s.',k(o),p.name,k(m
.value))}m:_stopRecording()m.window:_flashResult(m,false)return end elseif o==m.window.settings.toggleKeybind then m.
window:Notify{title=c.resolve'Keybind unavailable',content=string.format(c.resolve'%s is the menu toggle key. Kept %s.',
k(o),k(m.value))}m:_stopRecording()m.window:_flashResult(m,false)return end m:_bind(o)end function ae._bind(m,n)m.value=
n m:_stopRecording()m.window:_runGuarded(m,m.onChanged,n)m.window:_persist(m)m.window:_flashResult(m,true)end function
ae._matches(m,n)local o=m.value if typeof(o)~='EnumItem'or o==Enum.KeyCode.Unknown then return false end if o.EnumType==
Enum.KeyCode then return n.KeyCode==o elseif o.EnumType==Enum.UserInputType then return n.UserInputType==o end return
false end function ae._beginHold(m,n)if m._holding or m._holdPress then return end local o={}m._holdPress=o local p,q=n.
KeyCode,n.UserInputType task.delay(m.holdThreshold,function()if m._holdPress~=o then return end m._holding=true m.window
:_runGuarded(m,m.callback,true)end)local r r=m.window:ConnectFor(m,ag.userInputService.InputEnded,function(s)local t=if
p~=Enum.KeyCode.Unknown then s.KeyCode==p else s.UserInputType==q if not t then return end if m.connections then local u
=table.find(m.connections,r)if u then table.remove(m.connections,u)end end m.window:Disconnect(r)if m._holdPress==o then
m._holdPress=nil end if m._holding then m._holding=false m.window:_runGuarded(m,m.callback,false)end end)end function ae
.Set(m,n,o)local p=l(n)if p~=Enum.KeyCode.Unknown then if m.isMenuToggle then local q=m.window:_keybindUsing(p,m)if q
then g.warn('Rayfield: '..k(p).." is bound to '"..tostring(q.name).."'; kept "..k(m.value))return end elseif p==m.window
.settings.toggleKeybind then g.warn('Rayfield: '..k(p)..' is the menu toggle key; kept '..k(m.value))return end end m.
value=p if m.recording then m:_stopRecording()else m.keyLabel.Text=k(m.value)m:_sizeBox(true)end if not o then m.window:
_runGuarded(m,m.onChanged,m.value)m.window:_persist(m)end end function ae._serialize(m)return{tostring(m.value.EnumType)
,m.value.Value}end function ae._deserialize(m,n)local o=tostring(n[1]):gsub('^Enum%.','')local p,q=pcall(function()
return Enum[o]end)if not p or not q then return end local r=f.itemFromValue(q,n[2])if r then m:Set(r)end end function ae
._setShown(m,n,o)local p=m.window if n then p:_revealCommon(m,o)p:_reveal(m.box,{BackgroundTransparency=p.theme.
FieldTransparency},o)p:_reveal(m.boxStroke,{Transparency=0.85},o)p:_reveal(m.keyLabel,{TextTransparency=0.6},o)p:
_reveal(m.glow,{Transparency=0.9},o)else p:_hideCommon(m,o)p:_reveal(m.box,{BackgroundTransparency=1},o)p:_reveal(m.
boxStroke,{Transparency=1},o)p:_reveal(m.keyLabel,{TextTransparency=1},o)p:_reveal(m.glow,{Transparency=1},o)end end
function ae._refreshTheme(m)ag.tweenService:Create(m.box,TweenInfo.new(0.5,Enum.EasingStyle.Quint,Enum.EasingDirection.
Out),{BackgroundTransparency=m.window.theme.FieldTransparency}):Play()end ai(ae)b(ae)return ae end)()end,[18]=function()
local aa,ab,ac=a(18)local ad return(function(...)local ae={}ae.__index=ae ae.__type='Notification'local af=ab.Parent.
Parent.utility local ag,ah,ai,b,c,d,e,f,g,h,i,j,k=ac(af.variables),ac(af.functions),ac(af.constants),ac(af.HapticEngine)
,TweenInfo.new(0.6,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),TweenInfo.new(0.4,Enum.EasingStyle.Exponential
,Enum.EasingDirection.Out),TweenInfo.new(0.3,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),TweenInfo.new(0.6,
Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),TweenInfo.new(0.9,Enum.EasingStyle.Exponential,Enum.
EasingDirection.Out),UDim2.new(0.5,360,0.5,0),UDim2.new(0.5,0,0.5,0),6,8 local function l(m)return math.clamp(#m*0.06+3,
3,9)end function ae.new(m,n)n=if typeof(n)=='table'then n else{}local o=setmetatable({window=assert(m,
'Missing argument #1 (Window expected)'),title=n.title or n.Title or'Notification',content=n.content or n.Content or'',
icon=n.icon or n.Icon,_hovered=false,_dismissed=false},ae)o.duration=n.duration or n.Duration or l(o.content)local p=o.
icon~=nil and o.icon~=0 and o.icon~=''o.main=o.window:Create('Frame',{Name='Notification',BackgroundTransparency=1,Size=
UDim2.new(1,0,0,0),BorderSizePixel=0,ZIndex=ai.zIndex.notification,Parent=o.window.notifications})o.window:Create(
'UIPadding',{PaddingTop=UDim.new(0,k),Parent=o.main})o.body=o.window:Create('Frame',{BackgroundColor3=Color3.fromRGB(255
,255,255),Size=UDim2.new(1,0,1,0),Position=h,AnchorPoint=Vector2.new(0.5,0.5),Active=true,BorderSizePixel=0,ZIndex=ai.
zIndex.notification,BackgroundTransparency=1,Parent=o.main})o.window:Create('UIGradient',{Rotation=270,Offset=Vector2.
new(0,-0.1),Parent=o.body},{Color={'WindowColor',ah.toColorSequence}})o.window:Create('UICorner',{Parent=o.body},{
CornerRadius='CornerRoundness'})o.stroke=o.window:Create('UIStroke',{Transparency=1,Parent=o.body},{Color=
'SurfaceStroke'})o.shadow=o.window:CreateGlow(o.body,'ShadowColor',20,1)o.window:Create('UIPadding',{PaddingLeft=UDim.
new(0,20),PaddingRight=UDim.new(0,20),Parent=o.body})o.window:Create('UIListLayout',{FillDirection=Enum.FillDirection.
Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.Left,SortOrder=
Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,14),Parent=o.body})if p then o.iconLabel=o.window:Create('ImageLabel',{
Image=o.icon,Size=UDim2.fromOffset(24,24),BackgroundTransparency=1,BorderSizePixel=0,LayoutOrder=1,ZIndex=ai.zIndex.
notification,ImageTransparency=1,Parent=o.body},{ImageColor3='ContentColor'})end o.container=o.window:Create('Frame',{
Size=UDim2.fromOffset(p and 222 or 260,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,BorderSizePixel=0,
LayoutOrder=2,ZIndex=ai.zIndex.notification,Parent=o.body})o.window:Create('UIListLayout',{FillDirection=Enum.
FillDirection.Vertical,SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,4),Parent=o.container})o.titleLabel=o.
window:Create('TextLabel',{Text=o.title,Size=UDim2.new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,
BackgroundTransparency=1,TextSize=16,TextWrapped=true,TextXAlignment=Enum.TextXAlignment.Left,LayoutOrder=1,ZIndex=ai.
zIndex.notification,TextTransparency=1,Parent=o.container},{TextColor3='ContentColor',FontFace='TitleFont'})if o.content
~=''then o.descriptionLabel=o.window:Create('TextLabel',{Text=o.content,Size=UDim2.new(1,0,0,0),AutomaticSize=Enum.
AutomaticSize.Y,BackgroundTransparency=1,TextSize=15,TextWrapped=true,TextXAlignment=Enum.TextXAlignment.Left,
TextYAlignment=Enum.TextYAlignment.Top,LayoutOrder=2,ZIndex=ai.zIndex.notification,TextTransparency=1,Parent=o.container
},{TextColor3='ContentColor',FontFace='Font'})end o.window._notificationCount=(o.window._notificationCount or 0)+1 o.
main.LayoutOrder=o.window._notificationCount local q=o.window._liveNotifications if not q then q={}o.window.
_liveNotifications=q end table.insert(q,o)while#q>j do local r=table.remove(q,1)if r and r~=o then task.spawn(r._dismiss
,r)end end o._connections={o.window:Connect(o.body.MouseEnter,function()o._hovered=true end),o.window:Connect(o.body.
MouseLeave,function()o._hovered=false end),o.window:Connect(o.body.InputBegan,function(r)if r.UserInputType==Enum.
UserInputType.MouseButton1 or r.UserInputType==Enum.UserInputType.Touch then o:_dismiss()end end)}task.spawn(function()o
:_show()end)return o end function ae._measure(m)local n=m.iconLabel and 222 or 260 local o=ah.textHeight(m.window.theme.
TitleFont,16,m.title,n)if m.descriptionLabel then o=o+4+ah.textHeight(m.window.theme.Font,15,m.content,n)end return math
.max(o,m.iconLabel and 24 or 0)+28 end function ae._show(m)local n=m:_measure()+k if m._dismissed or not m.main.Parent
then return end b.notify()ag.tweenService:Create(m.main,c,{Size=UDim2.new(1,0,0,n)}):Play()ag.tweenService:Create(m.body
,f,{Position=i}):Play()ag.tweenService:Create(m.body,d,{BackgroundTransparency=0}):Play()ag.tweenService:Create(m.
titleLabel,e,{TextTransparency=0}):Play()ag.tweenService:Create(m.stroke,d,{Transparency=0.95}):Play()ag.tweenService:
Create(m.shadow,e,{Transparency=0.6}):Play()task.wait(0.05)if m._dismissed or not m.main.Parent then return end if m.
iconLabel then ag.tweenService:Create(m.iconLabel,e,{ImageTransparency=0}):Play()end task.wait(0.05)if m._dismissed or
not m.main.Parent then return end if m.descriptionLabel then ag.tweenService:Create(m.descriptionLabel,e,{
TextTransparency=0.35}):Play()end local o=0 while o<m.duration and not m._dismissed and m.main.Parent do local p=task.
wait()if not m._hovered then o+=p end end m:_dismiss()end function ae._dismiss(m)if m._dismissed then return end m.
_dismissed=true local n=m.window._liveNotifications local o=n and table.find(n,m)if n and o then table.remove(n,o)end if
not m.main.Parent then return end ag.tweenService:Create(m.body,d,{BackgroundTransparency=1}):Play()ag.tweenService:
Create(m.stroke,d,{Transparency=1}):Play()ag.tweenService:Create(m.shadow,e,{Transparency=1}):Play()ag.tweenService:
Create(m.titleLabel,e,{TextTransparency=1}):Play()if m.descriptionLabel then ag.tweenService:Create(m.descriptionLabel,e
,{TextTransparency=1}):Play()end if m.iconLabel then ag.tweenService:Create(m.iconLabel,e,{ImageTransparency=1}):Play()
end ag.tweenService:Create(m.body,g,{Size=UDim2.new(1,-90,1,0)}):Play()local p=ag.tweenService:Create(m.main,g,{Size=
UDim2.new(1,0,0,0)})p:Play()p.Completed:Wait()if not m.main.Parent then return end for q,r in m._connections do m.window
:Disconnect(r)end m.window:DestroySubtree(m.main)end return ae end)()end,[19]=function()local aa,ab,ac=a(19)local ad
return(function(...)local ae={}ae.__index=ae ae.__type='Popup'local af=ab.Parent.Parent.utility local ag,ah,ai,b,c,d,e,f
,g,h,i,j,k,l,m,n=ac(af.variables),ac(af.functions),ac(af.constants),ac(af.locale),ac(af.log),ac(af.HapticEngine),ac(ab.
Parent.changelog),TweenInfo.new(0.5,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),TweenInfo.new(0.4,Enum.
EasingStyle.Exponential,Enum.EasingDirection.Out),TweenInfo.new(0.3,Enum.EasingStyle.Exponential,Enum.EasingDirection.
Out),TweenInfo.new(0.35,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),400,22,24,22,16 local o,p,q,r,s,t,u,v=j-k
*2,18,14,15,16,12,300,4 local w,x,y,z,A,B,C,D=o-v*2,40,8,UDim.new(1,0),16,0.5,{}local function E()for F=#C,1,-1 do local
G=C[F]if G._closed or not G.screenGui.Parent then table.remove(C,F)end end end local function F(G)E()return C[#C]==G end
function ae.new(G,H)H=if typeof(H)=='table'then H else{}local I=setmetatable({window=assert(G,
'Missing argument #1 (Window expected)'),title=H.title or H.Title or'Popup',subtitle=H.subtitle or H.Subtitle,content=H.
content or H.Content,icon=H.icon or H.Icon,boxes=H.boxes or H.Boxes,options=H.options or H.Options,dismissable=if H.
dismissable~=nil then H.dismissable elseif H.Dismissable~=nil then H.Dismissable else true,_reveal={},_connections={},
_closed=false},ae)if not I.options or#I.options==0 then I.options={{text='Okay'}}end I:_build()E()table.insert(C,I)task.
spawn(function()I:_show()end)return I end function ae._fade(G,H,I,J)table.insert(G._reveal,{instance=H,prop=I,to=J})
return H end function ae._build(G)local H,I=G.window,G.icon~=nil and G.icon~=0 and G.icon~=''G.screenGui=H:Create(
'ScreenGui',{Name=ag.httpService:GenerateGUID(false),IgnoreGuiInset=true,ResetOnSpawn=false,Enabled=true,DisplayOrder=ai
.displayOrder.popup,ZIndexBehavior=Enum.ZIndexBehavior.Global,Parent=ag.guiContainer})G.backdrop=H:Create('Frame',{Name=
'Backdrop',BackgroundColor3=Color3.fromRGB(0,0,0),BorderSizePixel=0,Size=UDim2.fromScale(1,1),Active=true,
BackgroundTransparency=1,Parent=G.screenGui})G:_fade(G.backdrop,'BackgroundTransparency',B)G.card=H:Create('Frame',{Name
='Card',BackgroundColor3=Color3.fromRGB(255,255,255),AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.new(0.5,0,0.5,14),
Size=UDim2.fromOffset(j,0),AutomaticSize=Enum.AutomaticSize.Y,Active=true,BorderSizePixel=0,BackgroundTransparency=1,
Parent=G.screenGui})G:_fade(G.card,'BackgroundTransparency',0)H:Create('UIGradient',{Rotation=270,Offset=Vector2.new(0,-
0.1),Parent=G.card},{Color={'WindowColor',ah.toColorSequence}})H:Create('UICorner',{Parent=G.card},{CornerRadius=
'CornerRoundness'})G.cardStroke=H:Create('UIStroke',{Transparency=1,Parent=G.card},{Color='SurfaceStroke'})G:_fade(G.
cardStroke,'Transparency',0.95)G.cardShadow=H:CreateGlow(G.card,'ShadowColor',26,1)G:_fade(G.cardShadow,'Transparency',
0.55)H:Create('UIPadding',{PaddingLeft=UDim.new(0,k),PaddingRight=UDim.new(0,k),PaddingTop=UDim.new(0,l),PaddingBottom=
UDim.new(0,m),Parent=G.card})H:Create('UIListLayout',{FillDirection=Enum.FillDirection.Vertical,HorizontalAlignment=Enum
.HorizontalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,n),Parent=G.card})local J=G:
_measureHeader(I)G:_buildHeader(I,J)local K=G:_buildContent()G:_buildFooter()local L=2+(K>0 and 1 or 0)local M=l+J+K+x+m
+n*(L-1)G.card.Size=UDim2.fromOffset(j,M)G.card.AutomaticSize=Enum.AutomaticSize.None if G.dismissable then table.
insert(G._connections,H:Connect(G.backdrop.InputBegan,function(N)if N.UserInputType==Enum.UserInputType.MouseButton1 or
N.UserInputType==Enum.UserInputType.Touch then G:Close()end end))table.insert(G._connections,H:Connect(ag.
userInputService.InputBegan,function(N,O)if not O and N.KeyCode==Enum.KeyCode.Escape and F(G)then if N==D then return
end D=N G:Close()end end))end end function ae._buildHeader(G,H,I)local J=G.window local K=J:Create('Frame',{Name=
'Header',BackgroundTransparency=1,Size=UDim2.new(1,0,0,I),LayoutOrder=1,Parent=G.card})J:Create('UIListLayout',{
FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.
HorizontalAlignment.Left,SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,t),Parent=K})if H then G:_fade(J:
Create('ImageLabel',{Image=G.icon,Size=UDim2.fromOffset(s,s),BackgroundTransparency=1,BorderSizePixel=0,LayoutOrder=1,
ImageTransparency=1,Parent=K},{ImageColor3='TitlingColor'}),'ImageTransparency',0)end local L=J:Create('Frame',{Name=
'Text',BackgroundTransparency=1,Size=UDim2.new(1,H and-(s+t)or 0,0,G._columnH),LayoutOrder=2,Parent=K})J:Create(
'UIListLayout',{FillDirection=Enum.FillDirection.Vertical,SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,3),
Parent=L})G:_fade(J:Create('TextLabel',{Text=b.t(G.title),Size=UDim2.new(1,0,0,G._titleH),BackgroundTransparency=1,
TextSize=p,TextXAlignment=Enum.TextXAlignment.Left,TextWrapped=true,LayoutOrder=1,TextTransparency=1,Parent=L},{
TextColor3='TitlingColor',FontFace='Font'}),'TextTransparency',0)if G.subtitle and G.subtitle~=''then G:_fade(J:Create(
'TextLabel',{Text=b.t(G.subtitle),Size=UDim2.new(1,0,0,G._subH),BackgroundTransparency=1,TextSize=q,TextXAlignment=Enum.
TextXAlignment.Left,TextWrapped=true,LayoutOrder=2,TextTransparency=1,Parent=L},{TextColor3='TitlingColor',FontFace=
'Font'}),'TextTransparency',0.55)end end function ae._buildContent(G)if(not G.content or G.content=='')and(not G.boxes
or#G.boxes==0)then return 0 end local H,I=G.window,if G.boxes and#G.boxes>0 then G:_measureBoxes()else G:_measureText()
local J=math.min(I,u)+v*2 local K=H:Create('ScrollingFrame',{Name='Content',BackgroundTransparency=1,BorderSizePixel=0,
Size=UDim2.new(1,0,0,J),CanvasSize=UDim2.new(0,0,0,0),AutomaticCanvasSize=Enum.AutomaticSize.Y,ScrollBarThickness=4,
ScrollBarImageColor3=Color3.fromRGB(255,255,255),ScrollingDirection=Enum.ScrollingDirection.Y,LayoutOrder=2,
ScrollBarImageTransparency=1,Parent=G.card})G:_fade(K,'ScrollBarImageTransparency',0.8)H:Create('UIPadding',{PaddingLeft
=UDim.new(0,v),PaddingRight=UDim.new(0,v),PaddingTop=UDim.new(0,v),PaddingBottom=UDim.new(0,v),Parent=K})if G.boxes and#
G.boxes>0 then H:Create('UIListLayout',{FillDirection=Enum.FillDirection.Vertical,HorizontalAlignment=Enum.
HorizontalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,e.boxGap),Parent=K})for L,M in G.
boxes do G:_buildBox(K,M,L)end else G:_fade(H:Create('TextLabel',{Text=b.t(G.content),Size=UDim2.new(1,0,0,I),
BackgroundTransparency=1,TextSize=r,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,
TextWrapped=true,TextTransparency=1,Parent=K},{TextColor3='ContentColor',FontFace='Font'}),'TextTransparency',0.5)end
return J end function ae._buildBox(G,H,I,J)e.build(G.window,H,I,J,function(K,L,M)return G:_fade(K,L,M)end,{width=w})end
function ae._buildFooter(G)local H=G.window local I=H:Create('Frame',{Name='Footer',BackgroundTransparency=1,Size=UDim2.
new(1,0,0,x),LayoutOrder=3,Parent=G.card})H:Create('UIListLayout',{FillDirection=Enum.FillDirection.Horizontal,
VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.Center,HorizontalFlex=Enum.
UIFlexAlignment.Fill,SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,y),Parent=I})for J,K in G.options do G:
_buildButton(I,K,J)end end function ae._buildButton(G,H,I,J)local K=G.window I=if typeof(I)=='table'then I else{text=
tostring(I)}local L,M,N,O,P,Q,R=I.style or I.Style or'neutral',I.text or I.Text or I.name or I.Name or'Okay',I.callback
or I.Callback if L=='primary'then O,P,Q,R=K.theme.AccentColor,K.theme.AccentStroke,K.theme.AccentStroke,0.1 elseif L==
'danger'then O,P,Q,R=K.theme.ErrorColor,K.theme.ErrorStrokeColor,K.theme.ErrorStrokeColor,0 else O,P,Q,R=K.theme.
NeutralButton,K.theme.NeutralButtonHover,K.theme.NeutralButtonStroke,0.85 end local S=K:Create('Frame',{Name='Button',
BackgroundColor3=O,BorderSizePixel=0,Size=UDim2.new(0,0,0,x),LayoutOrder=J,BackgroundTransparency=1,Parent=H})G:_fade(S,
'BackgroundTransparency',0)K:Create('UIFlexItem',{FlexMode=Enum.UIFlexMode.Fill,Parent=S})K:Create('UICorner',{
CornerRadius=z,Parent=S})local T=K:Create('UIStroke',{Color=Q,Transparency=1,Parent=S})G:_fade(T,'Transparency',R)G:
_fade(K:Create('TextLabel',{Text=b.t(M),Size=UDim2.fromScale(1,1),BackgroundTransparency=1,TextSize=A,TextXAlignment=
Enum.TextXAlignment.Center,TextTruncate=Enum.TextTruncate.AtEnd,TextColor3=ah.contrastText(O),TextTransparency=1,Parent=
S},{FontFace='Font'}),'TextTransparency',0)local U,V=K:Create('TextButton',{Text='',BackgroundTransparency=1,Size=UDim2.
fromScale(1,1),BorderSizePixel=0,ZIndex=2,Parent=S}),TweenInfo.new(0.25,Enum.EasingStyle.Quint,Enum.EasingDirection.Out)
table.insert(G._connections,K:Connect(U.MouseEnter,function()if G._closed then return end ag.tweenService:Create(S,V,{
BackgroundColor3=P}):Play()end))table.insert(G._connections,K:Connect(U.MouseLeave,function()ag.tweenService:Create(S,V,
{BackgroundColor3=O}):Play()end))table.insert(G._connections,K:Connect(U.MouseButton1Click,function()if G._closed then
return end d.click()ag.tweenService:Create(T,V,{Transparency=1}):Play()if N then task.spawn(function()local W,X=pcall(N)
if not W then c.warn("Rayfield: popup button '"..M.."' callback errored:")c.print(X)end end)end G:Close()end))end
function ae._measureHeader(G,H)local I=o-(if H then s+t else 0)G._titleH=ah.textHeight(G.window.theme.Font,p,b.resolve(G
.title),I)G._subH=if G.subtitle and G.subtitle~=''then ah.textHeight(G.window.theme.Font,q,b.resolve(G.subtitle),I)else
0 G._columnH=G._titleH+(if G._subH>0 then 3+G._subH else 0)return math.max(G._columnH,if H then s else 0)end function ae
._measureText(G)return ah.textHeight(G.window.theme.Font,r,b.resolve(G.content),w)end function ae._measureBox(G,H)return
e.measure(G.window,H,w)end function ae._measureBoxes(G)return e.measureAll(G.window,G.boxes,w)end function ae._show(G)if
not G.screenGui.Parent then return end d.notify()ag.tweenService:Create(G.card,f,{Position=UDim2.new(0.5,0,0.5,0)}):
Play()for H,I in G._reveal do local J=if I.instance==G.backdrop then i else g ag.tweenService:Create(I.instance,J,{[I.
prop]=I.to}):Play()end end function ae.Close(G)if G._closed then return end G._closed=true local H=table.find(C,G)if H
then table.remove(C,H)end for I,J in G._connections do G.window:Disconnect(J)end G._connections={}if not G.screenGui.
Parent then return end ag.tweenService:Create(G.card,h,{Position=UDim2.new(0.5,0,0.5,10)}):Play()for I,J in G._reveal do
ag.tweenService:Create(J.instance,h,{[J.prop]=1}):Play()end task.delay(h.Time,function()G.window:DestroySubtree(G.
screenGui)end)end return ae end)()end,[20]=function()local aa,ab,ac=a(20)local ad return(function(...)local ae={}ae.
__index=ae ae.__type='Progress'local af=ab.Parent.Parent.utility local ag,ah,ai,b,c,d,e,f,g,h,i,j,k,l,m=ac(af.variables)
,ac(af.functions),ac(af.moveable),ac(af.locale),60,8,20,6,6,16,14,0.4,TweenInfo.new(0.45,Enum.EasingStyle.Quint,Enum.
EasingDirection.Out),NumberSequence.new{NumberSequenceKeypoint.new(0,0.85),NumberSequenceKeypoint.new(1,0)},0.9 local n=
TweenInfo.new(m,Enum.EasingStyle.Quint,Enum.EasingDirection.InOut,-1,true)local function o(p:unknown):number?local q=
tonumber(p)if q==nil or q~=q or math.abs(q)==math.huge then return nil end return q end function ae.new(p,q)q=if typeof(
q)=='table'then q else{}local r=o(q.steps or q.Steps)r=if r and r>=2 then math.floor(r)else nil local s=q.range or q.
Range local t,u=o(s and s[1])or 0,o(s and s[2])or r or 1 if t>u then t,u=u,t end local v=setmetatable({tab=assert(p,
'Missing argument #1 (Tab expected)'),window=p.window,name=q.name or q.Name or'Progress',icon=q.icon or q.Icon,
description=q.description or q.Description,min=t,max=u,steps=r,value=0,text=q.text or q.Text,format=q.format or q.Format
,showValue=if q.showValue==nil then true else q.showValue==true,indeterminate=q.indeterminate or q.Indeterminate or
false},ae)v.value=v:_clamp(o(q.value or q.Value)or t)v:_build()if v.description then v.descriptor=ac(ab.Parent.
descriptor).new(v.tab,{description=v.description})end return v end function ae._clamp(p,q:number):number return math.
clamp(o(q)or p.min,p.min,p.max)end function ae._ratio(p):number local q=p.max-p.min if q<=0 then return 1 end return(p.
value-p.min)/q end function ae._filledSteps(p):number local q=p.steps::number return math.clamp(math.round(p:_ratio()*q)
,0,q)end function ae._readout(p):string if p.text then return b.resolve(p.text)end if p.format then local q,r=pcall(p.
format,p.value,p.min,p.max)if q and type(r)=='string'then return r end end if p.steps then return string.format('%d/%d',
p:_filledSteps(),p.steps)end return string.format('%d%%',math.round(p:_ratio()*100))end function ae._build(p)p.main=p.
window:Create('Frame',{Size=UDim2.new(1,-20,0,c),BorderSizePixel=0,Name=p.name,BackgroundColor3=Color3.fromRGB(255,255,
255),BackgroundTransparency=1,Parent=p.tab.tabPage},{BackgroundTransparency='ElementTransparency'})p.stroke=p.window:
StyleElementBody(p.main)p.container=p.window:Create('Frame',{Size=UDim2.new(0,170,0,h),Position=UDim2.new(0,e,0,20),
AnchorPoint=Vector2.new(0,0.5),BackgroundTransparency=1,BorderSizePixel=0,Parent=p.main})p.window:Create('UIListLayout',
{Padding=UDim.new(0,6),FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,
HorizontalAlignment=Enum.HorizontalAlignment.Left,SortOrder=Enum.SortOrder.LayoutOrder,Parent=p.container})if p.icon
then p.iconLabel=p.window:Create('ImageLabel',{Image=p.icon,Size=UDim2.fromOffset(16,16),BorderSizePixel=0,
BackgroundTransparency=1,ImageTransparency=1,Parent=p.container},{ImageColor3='ContentColor'})end p.title=p.window:
Create('TextLabel',{Text=b.t(p.name),Size=UDim2.fromOffset(250,h),BorderSizePixel=0,BackgroundTransparency=1,TextSize=h,
AutomaticSize=Enum.AutomaticSize.X,TextXAlignment=Enum.TextXAlignment.Left,TextWrapped=true,LayoutOrder=1,
TextTransparency=1,Parent=p.container},{TextColor3='ContentColor',FontFace='Font'})p.readout=p.window:Create('TextLabel'
,{Text=p:_readout(),AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,-e,0,20),Size=UDim2.fromOffset(50,i),
AutomaticSize=Enum.AutomaticSize.X,BorderSizePixel=0,BackgroundTransparency=1,TextSize=i,TextXAlignment=Enum.
TextXAlignment.Right,Visible=p.showValue,TextTransparency=1,Parent=p.main},{TextColor3='ContentColor',FontFace='Font'})
if p.steps then p:_buildSteps()return end p.track=p.window:Create('Frame',{AnchorPoint=Vector2.new(0.5,1),Position=UDim2
.new(0.5,0,1,-16),Size=UDim2.new(1,-e*2,0,d),BorderSizePixel=0,BackgroundTransparency=1,Parent=p.main},{BackgroundColor3
='SliderBackground'})p.window:Create('UICorner',{CornerRadius=UDim.new(1,0),Parent=p.track})p.fill=p.window:Create(
'Frame',{AnchorPoint=Vector2.new(0,0.5),Position=UDim2.fromScale(0,0.5),Size=UDim2.fromScale(if p.indeterminate then 0
else p:_ratio(),1),BackgroundColor3=Color3.fromRGB(255,255,255),BorderSizePixel=0,ZIndex=2,BackgroundTransparency=1,
Parent=p.track})p.window:Create('UICorner',{CornerRadius=UDim.new(1,0),Parent=p.fill})p.window:Create('UIGradient',{
Offset=Vector2.new(0,0.5),Rotation=2,Transparency=l,Parent=p.fill},{Color={'SliderProgress',ah.toColorSequence}})p.
fillGlow=p.window:CreateGlow(p.fill,'AccentColor',20,1)if p.indeterminate then p:_startSweep()end end function ae.
_buildSteps(p)local q=p.steps::number p.track=p.window:Create('Frame',{AnchorPoint=Vector2.new(0.5,1),Position=UDim2.
new(0.5,0,1,-17),Size=UDim2.new(1,-e*2,0,f),BackgroundTransparency=1,BorderSizePixel=0,Parent=p.main})p.window:Create(
'UIListLayout',{Padding=UDim.new(0,g),FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.
VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.Left,SortOrder=Enum.SortOrder.LayoutOrder,Parent=p
.track})p.stepFrames={}for r=1,q do local s=p.window:Create('Frame',{Size=UDim2.new(1/q,-(g*(q-1))/q,1,0),
BorderSizePixel=0,LayoutOrder=r,BackgroundTransparency=1,Parent=p.track},{BackgroundColor3='SliderBackground'})p.window:
Create('UICorner',{CornerRadius=UDim.new(1,0),Parent=s})local t=p.window:Create('Frame',{Size=UDim2.fromScale(1,1),
BackgroundColor3=Color3.fromRGB(255,255,255),BorderSizePixel=0,ZIndex=2,BackgroundTransparency=1,Parent=s})p.window:
Create('UICorner',{CornerRadius=UDim.new(1,0),Parent=t})p.window:Create('UIGradient',{Rotation=90,Parent=t},{Color={
'SliderProgress',ah.toColorSequence}})table.insert(p.stepFrames,{segment=s,fill=t})end end function ae._startSweep(p)if
p._sweep or p.steps then return end p.fill.AnchorPoint=Vector2.new(0,0.5)p.fill.Position=UDim2.fromScale(0,0.5)p.fill.
Size=UDim2.fromScale(0,1)p._sweep=ag.tweenService:Create(p.fill,n,{Size=UDim2.fromScale(1,1)})p._sweep:Play()end
function ae._stopSweep(p)if not p._sweep then return end p._sweep:Cancel()p._sweep=nil p.fill.AnchorPoint=Vector2.new(0,
0.5)p.fill.Position=UDim2.fromScale(0,0.5)end function ae._render(p,q:boolean?)p.readout.Text=p:_readout()if p.steps
then if not p._shown then return end local r=p:_filledSteps()for s,t in p.stepFrames do local u=if s<=r then 0 else 1 if
q==false then t.fill.BackgroundTransparency=u else ag.tweenService:Create(t.fill,k,{BackgroundTransparency=u}):Play()end
end return end local r=UDim2.fromScale(p:_ratio(),1)if q==false then p.fill.Size=r else ag.tweenService:Create(p.fill,k,
{Size=r}):Play()end end function ae.Set(p,q)p.value=p:_clamp(q)if p.indeterminate then p.indeterminate=false p:
_stopSweep()end p:_render()end function ae.Get(p):number return p.value end function ae.GetPercentage(p):number return p
:_ratio()end function ae.SetRange(p,q,r)q=o(q)or p.min r=o(r)or p.max if q>r then q,r=r,q end p.min,p.max=q,r p.value=p:
_clamp(p.value)p:_render()end function ae.SetText(p,q)p.text=q p.readout.Text=p:_readout()end function ae.
SetIndeterminate(p,q)q=q==true if q==p.indeterminate then return end p.indeterminate=q if q then p:_startSweep()else p:
_stopSweep()p:_render(false)end end function ae._setShown(p,q,r)local s=p.window p._shown=q s:_reveal(p.readout,{
TextTransparency=if q then j else 1},r)if q then s:_revealCommon(p,r)else s:_hideCommon(p,r)end if p.steps then local t=
p:_filledSteps()for u,v in p.stepFrames do s:_reveal(v.segment,{BackgroundTransparency=if q then 0 else 1},r)s:_reveal(v
.fill,{BackgroundTransparency=if q and u<=t then 0 else 1},r)end return end s:_reveal(p.track,{BackgroundTransparency=if
q then 0 else 1},r)s:_reveal(p.fill,{BackgroundTransparency=if q then 0 else 1},r)s:_reveal(p.fillGlow,{Transparency=if
q then s.theme.AccentGlow else 1},r)end function ae.Remove(p)p:_stopSweep()if p.descriptor then p.descriptor:Remove()end
p.main:Destroy()end ai(ae)return ae end)()end,[21]=function()local aa,ab,ac=a(21)local ad return(function(...)local ae={
}ae.__index=ae local af=ab.Parent.Parent.utility local ag,ah,ai,b,c,d,e,f,g,h,i,j,k=ac(af.variables),ac(af.constants),
ac(af.layouts),ac(af.windowSizing),ac(ab.Parent.sidebar),20,24,6,0.6,0.2,TweenInfo.new(0.25,Enum.EasingStyle.Back,Enum.
EasingDirection.Out),TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),1e-4 function ae.new(l)assert(l,
'Missing argument #1 (Window expected)')local m,n,o,p,q,r,s,t,u,v=setmetatable({window=l,grip=l:Create('ImageButton',{
Name='ResizeGrip',Image=ah.icons.maximise,Size=UDim2.fromOffset(d,d),Position=UDim2.new(1,-f,1,-f),AnchorPoint=Vector2.
new(1,1),BackgroundTransparency=1,ImageTransparency=g,ZIndex=ah.zIndex.resize,AutoButtonColor=false,ScaleType=Enum.
ScaleType.Fit,Parent=l.main},{ImageColor3='ActionColor'})},ae),ag.userInputService,false,Vector2.zero,Vector2.zero,
Vector2.zero,Vector2.zero,Vector2.zero,Vector2.zero,Vector2.zero if l.screenGui and l.screenGui.IgnoreGuiInset then v=ag
.guiService:GetGuiInset()end local function w(x,y,z)ag.tweenService:Create(m.grip,z,{Size=UDim2.fromOffset(x,x),
ImageTransparency=y}):Play()end l:Connect(m.grip.MouseEnter,function()if not o then w(e,h,i)end end)l:Connect(m.grip.
MouseLeave,function()if not o then w(d,g,j)end end)local function x()if not o then return end o=false local y=m.grip.
AbsolutePosition local z,A=y+m.grip.AbsoluteSize,n:GetMouseLocation()local B=A.X>=y.X and A.X<=z.X and A.Y>=y.Y and A.Y
<=z.Y w(if B then e else d,if B then h else g,j)end l:Connect(m.grip.InputBegan,function(y,z)if z then return end if not
l:_interactive()or l.minimised then return end local A=y.UserInputType.Name if A~='MouseButton1'and A~='Touch'then
return end l._userSized=true if l.screenGui and l.screenGui.IgnoreGuiInset then v=ag.guiService:GetGuiInset()end local B
=b.profile(l.layout.mode)t=B.minSize local C=ag.workspace.CurrentCamera u=b.ceiling(C and C.ViewportSize,l.layout.mode)p
=n:GetMouseLocation()q=l.main.AbsoluteSize r=q s=l.main.AbsolutePosition+v o=true w(e,h,i)end)l:Connect(n.InputEnded,
function(y)local z=y.UserInputType.Name if z=='MouseButton1'or z=='Touch'then x()end end)l:Connect(n.WindowFocusReleased
,x)l:Connect(ag.runService.RenderStepped,function(y)local z=not(l.hidden or l.minimised)if m.grip.Visible~=z then m.grip
.Visible=z end if not o then return end if not l:_interactive()or l.minimised then x()return end local A=n:
GetMouseLocation()local B,C=Vector2.new(math.clamp(q.X+(A.X-p.X),t.X,u.X),math.clamp(q.Y+(A.Y-p.Y),t.Y,u.Y)),if y then 1
-k^y else 1 r=r+(B-r)*C local D,E=r.X,r.Y local F=UDim2.fromOffset(D,E)l.main.Size=F l.main.Position=UDim2.fromOffset(s.
X+D/2,s.Y+E/2)l.size=F if l.layout.mode=='sidebar'then local G,H=ai.railWidthFor(l.layout,D),l._railGlide if not H or H.
target~=G then local I=if l.sidebar then l.sidebar.Size.X.Offset else G H=if I==G then nil else{target=G,current=I}l.
_railGlide=H end if H then local I=if y then 1-k^y else 1 H.current=H.current+(H.target-H.current)*I local J=if math.
abs(H.target-H.current)<2 then G else H.current c.applyWidth(l,J,G<ai.sidebar.railWidth)if J==G then l._railGlide=nil
end else c.applyWidth(l,G,G<ai.sidebar.railWidth)end end l:_syncDragBar()end)return m end return ae end)()end,[22]=
function()local aa,ab,ac=a(22)local ad return(function(...)local ae=ab.Parent.Parent.utility local af,ag,ah,ai,b,c,d,e=
ac(ae.variables),ac(ae.constants),ac(ae.locale),ac(ab.Parent.action),{},TweenInfo.new(0.25,Enum.EasingStyle.Quint,Enum.
EasingDirection.Out),0.6,0.2 local function f(g)if g.__type=='Group'then local h={}local function i(j)for k,l in j.
elements do if l.__type=='Group'then i(l)elseif l.name then table.insert(h,l.name)end end end i(g)return table.concat(h,
'\n')end return g.name or''end local function g(h)local i={}for j,k in h.tabs do if k.neglectSelector then continue end
for l,m in k.elements do if m.__type~='Section'then table.insert(i,m)end end end return i end local function h(i,j,k)af.
tweenService:Create(i.searchPill,k,{BackgroundTransparency=if j then 0.9 else 1}):Play()af.tweenService:Create(i.
searchStroke,k,{Transparency=if j then 0.85 else 1}):Play()af.tweenService:Create(i.searchShadow,k,{Transparency=if j
then 0.92 else 1}):Play()af.tweenService:Create(i.searchIcon,k,{ImageTransparency=if j then 0.65 else 1}):Play()af.
tweenService:Create(i.searchInput,k,{TextTransparency=if j then 0.2 else 1}):Play()end local function i(j,k,l)if j.
layout.mode=='sidebar'then return end for m,n in j.tabs do if not n.neglectSelector and n.topbarItem then n:
_applyVisual(if k then(if j.selectedTab==n then'selected'else'unselected')else'hidden',l)end end end local function j(k,
l)l=string.lower(l or'')local m=false for n,o in k._searchUnits do local p=l==''or string.find(o.text,l,1,true)~=nil o.
unit.main.Visible=p if o.unit.descriptor then o.unit.descriptor.main.Visible=p end m=m or p end k.searchEmpty.Visible=
not m and l~=''end local function k(l)l._searchUnits={}local m=0 for n,o in g(l)do m+=1 local p=o.main table.insert(l.
_searchUnits,{unit=o,text=string.lower(f(o)),homeParent=p.Parent,homeOrder=p.LayoutOrder,descOrder=o.descriptor and o.
descriptor.main.LayoutOrder})p.LayoutOrder=m*10 p.Parent=l.searchPage p.Visible=true if o.descriptor then o.descriptor.
main.LayoutOrder=m*10+1 o.descriptor.main.Parent=l.searchPage o.descriptor.main.Visible=true end end end local function
l(m)for n,o in m._searchUnits do local p=o.unit if p.main and p.main.Parent then p.main.LayoutOrder=o.homeOrder p.main.
Parent=o.homeParent p.main.Visible=true end if p.descriptor and p.descriptor.main and p.descriptor.main.Parent then p.
descriptor.main.LayoutOrder=o.descOrder p.descriptor.main.Parent=o.homeParent p.descriptor.main.Visible=true end end m.
_searchUnits={}end function b.open(m)if m._searching or m.minimised or not m:_interactive()then return end m._searching=
true k(m)j(m,'')m:_jumpTo(m.searchPage)i(m,false,c)task.delay(c.Time,function()if m._searching and m.layout.mode~=
'sidebar'then m.tabList.Visible=false end end)m.searchPill.Visible=true h(m,true,c)m.searchInput:CaptureFocus()af.
tweenService:Create(m.searchAction.iconLabel,c,{ImageTransparency=e}):Play()end function b.close(m,n)if not m._searching
then return end n=n or{}m._searching=false m.searchInput.Text=''m.searchInput:ReleaseFocus()m.searchEmpty.Visible=false
l(m)local o=if n.jumpTo==nil then m.selectedTab and m.selectedTab.tabPage else n.jumpTo if o then m:_jumpTo(o)end h(m,
false,c)task.delay(c.Time,function()if not m._searching then m.searchPill.Visible=false end end)if n.showTabs then m.
tabList.Visible=true i(m,true,c)end af.tweenService:Create(m.searchAction.iconLabel,c,{ImageTransparency=d}):Play()end
function b.toggle(m)if m._searching then b.close(m,{showTabs=true})else b.open(m)end end function b.railWidth(m,n)if m.
searchPill then m.searchPill.Size=UDim2.new(1,-(n+30),0,35)end end function b.build(m)m._searching=false m.searchPage=m:
Create('ScrollingFrame',{Name='Search',Size=UDim2.new(1,-20,1,0),Position=UDim2.new(0.5,0,0,68),AnchorPoint=Vector2.new(
0.5,0.5),BorderSizePixel=0,BackgroundTransparency=1,AutomaticCanvasSize=Enum.AutomaticSize.Y,CanvasSize=UDim2.new(0,0,0,
0),ScrollBarThickness=0,ScrollingDirection=Enum.ScrollingDirection.Y,LayoutOrder=2000,Parent=m.elements})m:Create(
'UIListLayout',{Padding=UDim.new(0,7),FillDirection=Enum.FillDirection.Vertical,VerticalAlignment=Enum.VerticalAlignment
.Top,HorizontalAlignment=Enum.HorizontalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,Parent=m.searchPage})m:
Create('UIPadding',{PaddingTop=UDim.new(0,if m.layout.mode=='sidebar'then 53 else 10),PaddingBottom=UDim.new(0,33),
Parent=m.searchPage})m.searchEmpty=m:Create('TextLabel',{Name='NoResults',Text=ah.t'No results',FontFace=af.brandFont(
Enum.FontWeight.Medium),TextSize=15,TextTransparency=0.6,BackgroundTransparency=1,AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.55,0),Size=UDim2.fromOffset(200,20),Visible=false,ZIndex=3,Parent=m.main},{TextColor3=
'ContentColor',FontFace='Font'})local n=m.layout.mode=='sidebar'local o=if n then m.layout.chromeHeight+8 else m.layout.
tabStripTop+1 m.searchPill=m:Create('Frame',{Name='SearchBar',AnchorPoint=Vector2.new(if n then 1 else 0.5,0),Position=
UDim2.new(if n then 1 else 0.5,if n then-15 else 0,0,o),Size=UDim2.new(1,if n then-(m.layout.railWidth+30)else-35,0,35),
BackgroundColor3=Color3.fromRGB(255,255,255),BorderSizePixel=0,ZIndex=10,BackgroundTransparency=1,Visible=false,Parent=m
.main})m:Create('UICorner',{CornerRadius=UDim.new(1,0),Parent=m.searchPill})m.searchStroke=m:Create('UIStroke',{Color=
Color3.fromRGB(255,255,255),Thickness=1,Transparency=1,Parent=m.searchPill})m.searchShadow=m:Create('UIShadow',{
BlurRadius=UDim.new(0,20),Color=Color3.fromRGB(255,255,255),ZIndex=-1,Transparency=1,Parent=m.searchPill})m.searchIcon=m
:Create('ImageLabel',{Image='rbxassetid://'..tostring(ag.icons.search),AnchorPoint=Vector2.new(0,0.5),Position=UDim2.
new(0,15,0.5,1),Size=UDim2.fromOffset(16,16),BackgroundTransparency=1,ZIndex=10,ImageTransparency=1,Parent=m.searchPill}
,{ImageColor3='ContentColor'})m.searchInput=m:Create('TextBox',{Text='',PlaceholderText=ah.t'Search all pages',
AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,40,0.5,0),Size=UDim2.new(1,-110,0,18),BackgroundTransparency=1,
TextSize=16,TextXAlignment=Enum.TextXAlignment.Left,ClearTextOnFocus=false,ClipsDescendants=true,ZIndex=10,
TextTransparency=1,Parent=m.searchPill},{TextColor3='ContentColor',FontFace='Font',PlaceholderColor3='PlaceholderColor'}
)m:Connect(m.searchInput:GetPropertyChangedSignal'Text',function()if m._searching then j(m,m.searchInput.Text)end end)m.
searchAction=ai.new(m,{name='Search',icon=ag.icons.search,order=4,callback=function()b.toggle(m)end})m.searchAction.
isLit=function()return m._searching end end return b end)()end,[23]=function()local aa,ab,ac=a(23)local ad return(
function(...)local ae={}ae.__index=ae ae.__type='Section'local af,ag=ac(ab.Parent.Parent.utility.moveable),ac(ab.Parent.
Parent.utility.locale)function ae.new(ah,ai)ai=if typeof(ai)=='table'then ai else{}local b=setmetatable({tab=assert(ah,
'Missing argument #1 (Tab expected)'),window=ah.window,name=ai.name or ai.Name or'Section',icon=ai.icon or ai.Icon},ae)
local c=if#b.tab.elements==0 then 0 else 13 b.main=b.window:Create('Frame',{Size=UDim2.new(1,-40,0,20+c),BorderSizePixel
=0,Name=b.name,BackgroundTransparency=1,Parent=b.tab.tabPage})if c>0 then b.window:Create('UIPadding',{PaddingTop=UDim.
new(0,c),Parent=b.main})end b.window:Create('UIListLayout',{FillDirection=Enum.FillDirection.Horizontal,Padding=UDim.
new(0,6),SortOrder=Enum.SortOrder.LayoutOrder,VerticalAlignment=Enum.VerticalAlignment.Top,Parent=b.main})if b.icon then
b.iconLabel=b.window:Create('ImageLabel',{Image=b.icon,Size=UDim2.fromOffset(16,16),BorderSizePixel=0,
BackgroundTransparency=1,ImageTransparency=1,Parent=b.main},{ImageColor3='ContentColor'})end b.title=b.window:Create(
'TextLabel',{Text=ag.t(b.name),Size=UDim2.fromOffset(0,16),BorderSizePixel=0,BackgroundTransparency=1,TextSize=15,
AutomaticSize=Enum.AutomaticSize.X,TextXAlignment=Enum.TextXAlignment.Left,TextWrapped=true,LayoutOrder=1,
TextTransparency=1,Parent=b.main},{TextColor3='ContentColor',FontFace='Font'})return b end function ae._setShown(ah,ai,b
)local c=ah.window c:_reveal(ah.title,{TextTransparency=if ai then 0.6 else 1},b)if ah.iconLabel then c:_reveal(ah.
iconLabel,{ImageTransparency=if ai then 0.65 else 1},b)end end af(ae)return ae end)()end,[24]=function()local aa,ab,ac=
a(24)local ad return(function(...)local ae=ab.Parent.Parent.utility local af,ag,ah,ai,b,c,d,e,f,g=ac(ae.variables),ac(ae
.image),ac(ae.locale),ac(ab.Parent.tabSelector),ac(ab.Parent.search),{},0,0.7,0.95,TweenInfo.new(0.25,Enum.EasingStyle.
Quint,Enum.EasingDirection.Out)local function h(i)return i.layout.mode=='sidebar'and i.profile~=nil and i.settings.
showProfile and af.localPlayer~=nil end local function i(j,k)local l=af.localPlayer if not l then return end j.profile=j
:Create('Frame',{Name='Profile',AnchorPoint=Vector2.new(0.5,1),Position=UDim2.fromScale(0.5,1),Size=UDim2.new(1,0,0,k.
footerHeight),BackgroundTransparency=1,Parent=j.sidebar})j.profileContainer=j:Create('Frame',{AnchorPoint=Vector2.new(0,
0.5),Position=UDim2.new(0,k.rowInset,0.5,0),Size=UDim2.new(1,-k.rowInset,1,0),BackgroundTransparency=1,Parent=j.profile}
)j.profileLayout=j:Create('UIListLayout',{Padding=UDim.new(0,10),FillDirection=Enum.FillDirection.Horizontal,
VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.Left,SortOrder=Enum.
SortOrder.LayoutOrder,Parent=j.profileContainer})j.profileAvatar=j:Create('ImageLabel',{Name='Avatar',Image=ag.avatar(l.
UserId,function(m)if j.profileAvatar and not j.unloaded then ag.assign(j.profileAvatar,'Image',m)end end),Size=UDim2.
fromOffset(k.avatarSize,k.avatarSize),BackgroundColor3=Color3.fromRGB(255,255,255),BorderSizePixel=0,
BackgroundTransparency=1,ImageTransparency=1,Parent=j.profileContainer})j:Create('UICorner',{CornerRadius=UDim.new(1,0),
Parent=j.profileAvatar})j.profileLabels=j:Create('Frame',{Size=UDim2.fromOffset(50,k.avatarSize),AutomaticSize=Enum.
AutomaticSize.X,BackgroundTransparency=1,LayoutOrder=1,Parent=j.profileContainer})j:Create('UIListLayout',{Padding=UDim.
new(0,2),FillDirection=Enum.FillDirection.Vertical,VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=
Enum.HorizontalAlignment.Left,SortOrder=Enum.SortOrder.LayoutOrder,Parent=j.profileLabels})j.profileName=j:Create(
'TextLabel',{Text=l.DisplayName,Size=UDim2.fromOffset(50,16),AutomaticSize=Enum.AutomaticSize.X,BackgroundTransparency=1
,TextSize=16,TextXAlignment=Enum.TextXAlignment.Left,TextTransparency=1,Parent=j.profileLabels},{TextColor3=
'TitlingColor',FontFace='Font'})j.profileSubtitle=j:Create('TextLabel',{Text='',Size=UDim2.fromOffset(50,14),
AutomaticSize=Enum.AutomaticSize.X,BackgroundTransparency=1,TextSize=14,TextXAlignment=Enum.TextXAlignment.Left,
LayoutOrder=1,Visible=false,TextTransparency=1,Parent=j.profileLabels},{TextColor3='TitlingColor',FontFace='Font'})end
function c.build(j,k)j.sidebar=j:Create('Frame',{Name='Sidebar',AnchorPoint=Vector2.new(0,1),Position=UDim2.fromScale(0,
1),Size=UDim2.new(0,k.railWidth,1,-k.chromeHeight),BackgroundTransparency=1,Visible=false,Parent=j.main})j.tabList=j:
Create('ScrollingFrame',{Name='Tabs',Active=true,Size=UDim2.new(1,0,1,0),BackgroundTransparency=1,BorderSizePixel=0,
AutomaticCanvasSize=Enum.AutomaticSize.Y,CanvasSize=UDim2.new(0,0,0,0),ScrollBarThickness=0,ScrollBarImageTransparency=1
,ScrollingDirection=Enum.ScrollingDirection.Y,ClipsDescendants=true,Parent=j.sidebar})j:Create('UIPadding',{PaddingTop=
UDim.new(0,k.railPadding),PaddingBottom=UDim.new(0,k.railPadding),Parent=j.tabList})j.tabListLayout=j:Create(
'UIListLayout',{Padding=UDim.new(0,k.rowSpacing),FillDirection=Enum.FillDirection.Vertical,VerticalAlignment=Enum.
VerticalAlignment.Top,HorizontalAlignment=Enum.HorizontalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,Parent=j.
tabList})i(j,k)c.reflowProfile(j)end function c.reflowProfile(j)local k,l=j.layout,h(j)if j.profile then j.profile.
Visible=l end j.tabList.Size=UDim2.new(1,0,1,if l then-k.footerHeight else 0)end function c.applyWidth(j,k,l)local m=j.
layout j.sidebar.Size=UDim2.new(0,k,1,-m.chromeHeight)j.elements.Size=UDim2.new(1,-k,1,-m.chromeHeight)j.bottomFade.Size
=UDim2.new(1,-k,m.fadeSize.Y.Scale,m.fadeSize.Y.Offset)b.railWidth(j,k)if l==nil then l=k<(m.railWidth::number)end for n
,o in j.tabs do if not o.neglectSelector then ai.setRowCollapsed(o,l,m)end end if j.profileContainer then j.
profileContainer.Position=UDim2.new(0,if l then 0 else m.rowInset,0.5,0)j.profileContainer.Size=UDim2.new(1,if l then 0
else-m.rowInset,1,0)j.profileLayout.HorizontalAlignment=if l then Enum.HorizontalAlignment.Center else Enum.
HorizontalAlignment.Left j.profileLabels.Visible=not l end end function c.setProfileShown(j,k,l)if not j.profile or not
j.profile.Visible then return end local m={[j.profileAvatar]={ImageTransparency=if k then 0 else 1,
BackgroundTransparency=if k then f else 1},[j.profileName]={TextTransparency=if k then d else 1},[j.profileSubtitle]={
TextTransparency=if k then e else 1}}for n,o in m do if l then af.tweenService:Create(n,l,o):Play()else for p,q in o do
n[p]=q end end end end function c.setProfileEnabled(j,k)if not j.profile then j.settings.showProfile=k return end if k
then j.settings.showProfile=true c.reflowProfile(j)c.setProfileShown(j,true,g)return end c.setProfileShown(j,false,g)
task.delay(g.Time,function()if j.unloaded or j.settings.showProfile then return end c.reflowProfile(j)end)j.settings.
showProfile=false end function c.setSubtitle(j,k)if not j.profileSubtitle then return end local l=if type(k)=='string'
and k~=''then ah.resolve(k)else nil j.profileSubtitle.Text=l or''j.profileSubtitle.Visible=l~=nil end return c end)()end
,[25]=function()local aa,ab,ac=a(25)local ad return(function(...)local ae={}ae.__index=ae ae.__type='Slider'local af=ab.
Parent.Parent.utility local ag,ah,ai,b,c,d,e=ac(af.variables),ac(af.functions),ac(af.odometer),ac(af.moveable),ac(af.
lockable),ac(af.locale),ac(af.HapticEngine)local function f(g)local h=0 while h<6 do local i=g*10^h if math.abs(i-math.
round(i))<1e-9 then break end h+=1 end return h end local function g(h,i,j)local k=h[1]+math.round((j-h[1])/i)*i return
math.clamp(k,h[1],h[2])end local h,i,j,k,l,m=TweenInfo.new(0.45,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),
TweenInfo.new(0.3,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),TweenInfo.new(0.3,Enum.EasingStyle.Quint,Enum.
EasingDirection.Out),300,Vector2.new(35,20),Vector2.new(41,22)local function n(o:number):UDim2 return UDim2.new(o,0,1,0)
end local function o():UDim2 return UDim2.new(1,0,0.5,0)end local function p(q:number,r:number,s:number):number return
math.clamp((q-r)/s,0,1)end function ae.new(q,r)r=if typeof(r)=='table'then r else{}local s=setmetatable({tab=assert(q,
'Missing argument #1 (Tab expected)'),window=q.window,name=r.name or r.Name or'Slider',icon=r.icon or r.Icon,description
=r.description or r.Description,forgetState=r.forgetState or r.ForgetState or q.forgetState,range=r.range or r.Range or{
0,100},increment=r.increment or r.Increment or 1,suffix=r.suffix or r.Suffix or'',callback=r.callback or r.Callback or
function()end,dragging=false,minimal=r.minimal or r.Minimal or false,_handleWidth=l.X},ae)assert(typeof(s.range)==
'table'and typeof(s.range[1])=='number'and typeof(s.range[2])=='number',
'A slider range needs two numbers, like { 0, 100 }.')if s.range[1]>s.range[2]then s.range={s.range[2],s.range[1]}end if
s.increment<=0 then s.increment=1 end s.value=if(r.value or r.Value)~=nil then(r.value or r.Value)elseif(r.currentValue
or r.CurrentValue)~=nil then(r.currentValue or r.CurrentValue)else s.range[1]s.value=g(s.range,s.increment,s.value)s.
_decimals=f(s.increment)s.flag=r.flag or r.Flag or(not s.forgetState and ah.deriveFlagFromName(s.name)or nil)s.window:
_registerControl(s)s.main=s.window:Create('Frame',{Size=UDim2.new(1,-20,0,65),BorderSizePixel=0,Name=s.name,
BackgroundColor3=Color3.fromRGB(255,255,255),BackgroundTransparency=1,Parent=s.tab.tabPage},{BackgroundTransparency=
'ElementTransparency'})s.stroke=s.window:StyleElementBody(s.main)s._lastValue=s.value if not s.minimal then s:
_buildLabel()end s.track=s.window:Create('Frame',{AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,-15,0.5,0),Size=
UDim2.fromOffset(222,14),BorderSizePixel=0,BackgroundTransparency=1,Parent=s.main},{BackgroundColor3='SliderBackground'}
)s.window:Create('UICorner',{CornerRadius=UDim.new(0,13),Parent=s.track})s.progress=s.window:Create('Frame',{AnchorPoint
=Vector2.new(0,0.5),Position=UDim2.fromScale(0,0.5),Size=UDim2.fromScale(0,1),BackgroundColor3=Color3.fromRGB(255,255,
255),BorderSizePixel=0,ZIndex=2,BackgroundTransparency=1,Parent=s.track})s.window:Create('UICorner',{CornerRadius=UDim.
new(0,13),Parent=s.progress})s.window:Create('UIGradient',{Offset=Vector2.new(0,0.5),Rotation=2,Transparency=
NumberSequence.new{NumberSequenceKeypoint.new(0,0.85),NumberSequenceKeypoint.new(1,0)},Parent=s.progress},{Color={
'SliderProgress',ah.toColorSequence}})s.progressGlow=s.window:CreateGlow(s.progress,'AccentColor',20,1)s.handle=s.window
:Create('Frame',{AnchorPoint=Vector2.new(0.5,0.5),Position=o(),Size=UDim2.fromOffset(l.X,l.Y),BorderSizePixel=0,ZIndex=
50,BackgroundTransparency=1,Parent=s.progress},{BackgroundColor3='SliderHandle'})s.window:Create('UICorner',{
CornerRadius=UDim.new(1,0),Parent=s.handle})s.handleGlow=s.window:CreateGlow(s.handle,Color3.fromRGB(255,255,255),10,1)s
.handleStroke=s.window:Create('UIStroke',{Transparency=1,Parent=s.handle},{Color='SliderStroke'})s.interact=s.window:
Create('TextButton',{BackgroundTransparency=1,Size=UDim2.fromScale(1,1),Text='',TextTransparency=1,ZIndex=10,Parent=s.
track})s.window:ConnectFor(s,s.main.MouseEnter,function()if not s.window:_interactive()then return end ag.tweenService:
Create(s.track,h,{BackgroundColor3=s.window.theme.SliderBackgroundHover}):Play()end)s.window:ConnectFor(s,s.main.
MouseLeave,function()ag.tweenService:Create(s.track,h,{BackgroundColor3=s.window.theme.SliderBackground}):Play()end)s.
window:ConnectFor(s,s.interact.InputBegan,function(t)if t.UserInputType==Enum.UserInputType.MouseButton1 or t.
UserInputType==Enum.UserInputType.Touch then e.click()s.dragging=true s:_setHeld(true)s:_updateFromMouse()if s.
_dragConnection then s._dragConnection:Disconnect()s._dragConnection=nil end s._dragConnection=ag.runService.
RenderStepped:Connect(function()if s.window.unloaded or not s.dragging then if s._dragConnection then s._dragConnection:
Disconnect()s._dragConnection=nil end return end s:_updateFromMouse()end)end end)s.window:ConnectFor(s,ag.
userInputService.InputEnded,function(t)if t.UserInputType==Enum.UserInputType.MouseButton1 or t.UserInputType==Enum.
UserInputType.Touch then s:_endDrag()end end)s.window:ConnectFor(s,ag.userInputService.WindowFocusReleased,function()s:
_endDrag()end)if s.description and not s.minimal then s.descriptor=ac(ab.Parent.descriptor).new(s.tab,{description=s.
description})end s.window:ConnectFor(s,s.main:GetPropertyChangedSignal'AbsoluteSize',function()if s.window.animating or(
s.window.hidden and s.window.hasShownOnce)then return end s:_applyLayout()end)s:_applyLayout()if s.minimal then s.main.
Size=UDim2.new(1,-20,0,41)s.track.AnchorPoint=Vector2.new(0.5,0.5)s.track.Position=UDim2.new(0.5,0,0.5,0)s.track.Size=
UDim2.new(1,-30,0,14)end s:_renderProgress()return s end function ae._buildLabel(q)q.container=q.window:Create('Frame',{
AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,20,0.5,0),Size=UDim2.fromOffset(170,33),BackgroundTransparency=1,
BorderSizePixel=0,ZIndex=5,Parent=q.main})q.containerLayout=q.window:Create('UIListLayout',{Padding=UDim.new(0,2),
VerticalAlignment=Enum.VerticalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,Parent=q.container})q.
titleContainer=q.window:Create('Frame',{Size=UDim2.new(1,0,0,16),BackgroundTransparency=1,BorderSizePixel=0,ZIndex=5,
Parent=q.container})q.window:Create('UIListLayout',{Padding=UDim.new(0,5),FillDirection=Enum.FillDirection.Horizontal,
VerticalAlignment=Enum.VerticalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,Parent=q.titleContainer})q.
titleFlex=q.window:Create('UIFlexItem',{FlexMode=Enum.UIFlexMode.None,Parent=q.titleContainer})if q.icon then q.
iconLabel=q.window:Create('ImageLabel',{Image=q.icon,Size=UDim2.fromOffset(16,16),BorderSizePixel=0,
BackgroundTransparency=1,ZIndex=5,ImageTransparency=1,Parent=q.titleContainer},{ImageColor3='ContentColor'})end q.title=
q.window:Create('TextLabel',{Text=d.t(q.name),Size=UDim2.new(1,0,0,16),BorderSizePixel=0,BackgroundTransparency=1,
TextSize=16,TextXAlignment=Enum.TextXAlignment.Left,TextTruncate=Enum.TextTruncate.AtEnd,RichText=true,LayoutOrder=1,
ZIndex=5,TextTransparency=1,Parent=q.titleContainer},{TextColor3='ContentColor',FontFace='Font'})q.window:Create(
'UIFlexItem',{FlexMode=Enum.UIFlexMode.Shrink,Parent=q.title})q.valueHost=q.window:Create('Frame',{Size=UDim2.new(1,0,0,
16),BackgroundTransparency=1,BorderSizePixel=0,ZIndex=6,LayoutOrder=1,Parent=q.container})q.valueOdo=ai.new(q.window,q.
valueHost,{textSize=15,alignment=Enum.HorizontalAlignment.Left,transparency=1,duration=0.28})q.valueOdo:snap(q:_format(q
.value))end function ae._setMainHeight(q,r)if q._widthManaged then q.main.Size=UDim2.new(q.main.Size.X.Scale,q.main.Size
.X.Offset,0,r)else q.main.Size=UDim2.new(1,-20,0,r)end end function ae._applyLayout(q)if q.minimal then return end local
r=q.main.AbsoluteSize.X local s=if r>0 and r<k then'narrow'else'wide'if q._layoutMode==s then return end q._layoutMode=s
if s=='narrow'then q:_setMainHeight(70)q.container.AnchorPoint=Vector2.new(0,0)q.container.Position=UDim2.new(0,20,0,14)
q.container.Size=UDim2.new(1,-40,0,16)q.containerLayout.FillDirection=Enum.FillDirection.Horizontal q.titleFlex.FlexMode
=Enum.UIFlexMode.Fill q.valueHost.AutomaticSize=Enum.AutomaticSize.X q.valueHost.Size=UDim2.new(0,0,0,16)q.track.
AnchorPoint=Vector2.new(0.5,1)q.track.Position=UDim2.new(0.5,0,1,-14)q.track.Size=UDim2.new(1,-30,0,14)else q:
_setMainHeight(65)q.container.AnchorPoint=Vector2.new(0,0.5)q.container.Position=UDim2.new(0,20,0.5,0)q.container.Size=
UDim2.new(0,170,0,33)q.containerLayout.FillDirection=Enum.FillDirection.Vertical q.titleFlex.FlexMode=Enum.UIFlexMode.
None q.valueHost.AutomaticSize=Enum.AutomaticSize.None q.valueHost.Size=UDim2.new(1,0,0,16)q.track.AnchorPoint=Vector2.
new(1,0.5)q.track.Position=UDim2.new(1,-15,0.5,0)q.track.Size=UDim2.new(0,222,0,14)end end function ae._format(q,r)local
s=string.format('%.'..q._decimals..'f',r)if q.suffix~=''then return s..' '..q.suffix end return s end function ae.
_pillTravel(q)return math.max(q.track.AbsoluteSize.X,0)end function ae._renderProgress(q,r)local s=q.range[2]-q.range[1]
local t=if s~=0 then math.clamp((q.value-q.range[1])/s,0,1)else 0 local u=n(t)if r then ag.tweenService:Create(q.
progress,r,{Size=u}):Play()else q.progress.Size=u end end function ae._updateFromMouse(q)local r=q:_pillTravel()if r<=0
then return end local s=p(ag.userInputService:GetMouseLocation().X,q.track.AbsolutePosition.X,r)local t=g(q.range,q.
increment,q.range[1]+s*(q.range[2]-q.range[1]))if t~=q.value then q.value=t if q.valueOdo then q.valueOdo:snap(q:
_format(t))end q._lastValue=t q:_renderProgress(j)q:_fireCallback(t)end end function ae._endDrag(q)if not q.dragging
then return end q.dragging=false q:_setHeld(false)if q._dragConnection then q._dragConnection:Disconnect()q.
_dragConnection=nil end q.window:_persist(q)end function ae._setHeld(q,r)if not r then q:_fireCallback(q.value)end local
s=if r then m else l q._handleWidth=s.X ag.tweenService:Create(q.handle,i,{Size=UDim2.fromOffset(s.X,s.Y),
BackgroundTransparency=if r then 0.7 else 0}):Play()ag.tweenService:Create(q.handleStroke,i,{Transparency=if r then 0.6
else 1}):Play()q:_renderProgress(i)end function ae._fireCallback(q,r)q.window:_runGuarded(q,q.callback,r,q.dragging==
true)end function ae.Set(q,r,s)r=g(q.range,q.increment,r)q.value=r if q.valueOdo then q.valueOdo:to(q:_format(r),r>=(q.
_lastValue or r))end q._lastValue=r q:_renderProgress(h)if not s then q:_fireCallback(r)q.window:_persist(q)end end
local q=TweenInfo.new(0.4,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out,0,false,0.35)function ae._setShown(r,s,t
)local u=r.window if s then u:_revealCommon(r,t)u:_reveal(r.track,{BackgroundTransparency=0},t)u:_reveal(r.progress,{
BackgroundTransparency=0},t)u:_reveal(r.handle,{BackgroundTransparency=0},t)if r.valueOdo then r.valueOdo:reveal(0.3,t)
end u:_reveal(r.progressGlow,{Transparency=math.max(0.55,u.theme.AccentGlow)},t,q)u:_reveal(r.handleGlow,{Transparency=
0.8},t,q)else u:_hideCommon(r,t)u:_reveal(r.track,{BackgroundTransparency=1},t)u:_reveal(r.progress,{
BackgroundTransparency=1},t)u:_reveal(r.handle,{BackgroundTransparency=1},t)if r.valueOdo then r.valueOdo:reveal(1,t)end
u:_reveal(r.progressGlow,{Transparency=1},t,q)u:_reveal(r.handleGlow,{Transparency=1},t,q)end end function ae.
_refreshTheme(r)ag.tweenService:Create(r.progressGlow,TweenInfo.new(0.5,Enum.EasingStyle.Quint,Enum.EasingDirection.Out)
,{Transparency=math.max(0.55,r.window.theme.AccentGlow)}):Play()end function ae._minWidth(r)if r.minimal then return 100
end local s=40 if r.icon then s+=22 end s+=ah.textWidth(r.window.theme.Font,16,d.resolve(r.name))s+=12 s+=ah.textWidth(r
.window.theme.Font,15,r:_format(r.value))return math.max(s,160)end b(ae)c(ae)return ae end)()end,[26]=function()local aa
,ab,ac=a(26)local ad return(function(...)local ae={}ae.__index=ae ae.__type='Statistic'local af={}af.__index=af af.
__type='Group'function af._setShown(ag,ah,ai)for b,c in ag.elements do c:_setShown(ah,ai)end end function af.
_refreshTheme(ag)for ah,ai in ag.elements do if ai._refreshTheme then ai:_refreshTheme()end end end function af.
_minWidth(ag)return 0 end local ag=ab.Parent.Parent.utility local ah,ai,b,c,d,e,f=ac(ag.functions),ac(ag.odometer),ac(ag
.moveable),ac(ag.locale),ac(ag.log),8,41 local function g(h)if h>0 then return string.format('+%.1f%%',h)elseif h<0 then
return string.format('%.1f%%',h)else return'0%'end end local function h(i)if typeof(i)~='number'then return tostring(i)
end local j=math.round(math.abs(i))local k=string.format('%.0f',j)local l=k:reverse():gsub('%d%d%d','%0,'):reverse()if l
:sub(1,1)==','then l=l:sub(2)end return if i<0 and j~=0 then'-'..l else l end local function i(j)local k=math.round(j)if
k>0 then return'+'..h(k)elseif k<0 then return h(k)else return'0'end end local function j(k)return typeof(k)=='table'and
typeof(k[1])=='table'end function ae.new(k,l)if j(l)then return ae.newRow(k,l)end return ae.newSingle(k,l)end function
ae.newSingle(k,l)l=if typeof(l)=='table'then l else{}local m=setmetatable({tab=assert(k,
'Missing argument #1 (Tab expected)'),window=k.window,name=l.name or l.Name or'Statistic',icon=l.icon or l.Icon,
description=l.description or l.Description,value=if(l.value or l.Value)~=nil then(l.value or l.Value)else 0,_hasValue=(l
.value or l.Value)~=nil,numberEasing=if(l.numberEasing~=nil)then l.numberEasing elseif l.NumberEasing~=nil then l.
NumberEasing else true,changeMode=l.changeMode or l.ChangeMode or'percentage',changeBaseline=l.changeBaseline or l.
ChangeBaseline or'previous',prefix=l.prefix or l.Prefix or'',suffix=l.suffix or l.Suffix or'',compact=l.compact or l.
Compact or k.compact or false,display=(l.display or l.Display or'value'),rowCard=k.rowCard or false,_initialValue=if(l.
value or l.Value)~=nil then(l.value or l.Value)else nil,_lastChange=0},ae)if m.compact then m:_buildCompact()else m:
_buildFull()end if m.description then if m.compact then d.warn(`Rayfield: a compact stat has no room for a description, ignoring it on '{
m.name}'.`)else m.descriptor=ac(ab.Parent.descriptor).new(m.tab,{description=m.description})end end return m end
function ae.newRow(k,l)local m=k.window local n=setmetatable({tab=k,window=m,name='Stats',elements={}},af)n.main=m:
Create('Frame',{Name='Stats',AutomaticSize=Enum.AutomaticSize.Y,Size=UDim2.new(1,-20,0,0),BackgroundTransparency=1,
BorderSizePixel=0,Parent=k.tabPage})m:Create('UIListLayout',{FillDirection=Enum.FillDirection.Horizontal,
HorizontalAlignment=Enum.HorizontalAlignment.Left,VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalFlex=Enum.
UIFlexAlignment.Fill,Padding=UDim.new(0,e),SortOrder=Enum.SortOrder.LayoutOrder,Parent=n.main})for o,p in l do if
typeof(p)~='table'then d.warn(`Rayfield: ignoring a non-table stat in a grouped CreateStat (entry #{o}).`)continue end
if p.description or p.Description then d.warn(`Rayfield: a grouped stat has no room for a description, ignoring it on '{
p.name or p.Name or'?'}'.`)end local q=table.clone(p)q.description=nil q.Description=nil local r=ae.newSingle({tab=k,
window=m,tabPage=n.main,compact=false,rowCard=true,_moveElement=function()end},q)table.insert(n.elements,r)end return n
end function ae._buildFull(k)local l=k.window k.main=l:Create('Frame',{Size=UDim2.new(1,-20,0,90),BorderSizePixel=0,Name
=k.name,ZIndex=5,BackgroundColor3=Color3.fromRGB(255,255,255),BackgroundTransparency=1,Parent=k.tab.tabPage},{
BackgroundTransparency='ElementTransparency'})if k.rowCard then k.main.Size=UDim2.fromOffset(0,90)l:Create('UIFlexItem',
{FlexMode=Enum.UIFlexMode.Fill,Parent=k.main})end k.stroke=l:StyleElementBody(k.main)k.titleContainer=l:Create('Frame',{
Size=UDim2.new(1,-40,0,32),Position=UDim2.fromOffset(20,15),BorderSizePixel=0,LayoutOrder=-1,BackgroundTransparency=1,
ZIndex=5,Parent=k.main})k.title=l:Create('TextLabel',{Text=c.t(k.name),Size=if k.rowCard then UDim2.new(1,-40,0,19)else
UDim2.fromOffset(300,19),BorderSizePixel=0,BackgroundTransparency=1,TextSize=19,TextXAlignment=Enum.TextXAlignment.Left,
TextWrapped=not k.rowCard,TextTruncate=if k.rowCard then Enum.TextTruncate.AtEnd else Enum.TextTruncate.None,LayoutOrder
=1,ZIndex=10,TextTransparency=1,Parent=k.titleContainer},{TextColor3='ContentColor',FontFace='TitleFont'})if k.icon then
k.iconLabel=l:Create('ImageLabel',{Image=k.icon,Size=UDim2.fromOffset(32,32),BorderSizePixel=0,BackgroundTransparency=1,
ZIndex=10,ImageTransparency=1,Parent=k.titleContainer},{ImageColor3='ContentColor'})end k.containerLayout=l:Create(
'UIListLayout',{Padding=UDim.new(0,8),FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.
VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.Left,SortOrder=Enum.SortOrder.LayoutOrder,Parent=k
.titleContainer})k.valueHost=l:Create('Frame',{AnchorPoint=Vector2.new(0,1),Position=UDim2.new(0,20,1,-15),Size=UDim2.
fromOffset(200,20),BackgroundTransparency=1,BorderSizePixel=0,ZIndex=10,Parent=k.main})k.changeHost=l:Create('Frame',{
AnchorPoint=Vector2.new(1,1),Position=UDim2.new(1,-20,1,-15),Size=UDim2.fromOffset(200,15),BackgroundTransparency=1,
BorderSizePixel=0,ZIndex=10,Parent=k.main})k.valueOdo=ai.new(l,k.valueHost,{textSize=20,alignment=Enum.
HorizontalAlignment.Left,transparency=1})k.valueOdo:snap(k:_formatValue(k.value))k:_applyValueColor()k._lastAccentKey=
'neutral'k._lastDirection=0 k.changeOdo=ai.new(l,k.changeHost,{textSize=15,alignment=Enum.HorizontalAlignment.Right,
transparency=1})k.changeOdo:snap(k:_formatChange(0))end function ae._buildCompact(k)local l,m=k.window,k.tab.compact or
false k.main=l:Create('Frame',{Name=k.name,Size=if m then UDim2.fromOffset(0,f)else UDim2.new(1,-20,0,f),AutomaticSize=
if m then Enum.AutomaticSize.X else Enum.AutomaticSize.None,ClipsDescendants=true,BorderSizePixel=0,ZIndex=5,
BackgroundColor3=Color3.fromRGB(255,255,255),BackgroundTransparency=1,Parent=k.tab.tabPage},{BackgroundTransparency=
'ElementTransparency'})k.stroke=l:StyleElementBody(k.main)if m then l:Create('UIFlexItem',{FlexMode=Enum.UIFlexMode.Fill
,Parent=k.main})end l:Create('UIListLayout',{FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.
VerticalAlignment.Center,HorizontalFlex=Enum.UIFlexAlignment.Fill,Parent=k.main})k.card=l:Create('Frame',{AutomaticSize=
Enum.AutomaticSize.X,Size=UDim2.fromOffset(0,f),BackgroundColor3=Color3.fromRGB(255,255,255),BorderSizePixel=0,ZIndex=5,
BackgroundTransparency=1,Parent=k.main})l:Create('UIPadding',{PaddingLeft=UDim.new(0,15),PaddingRight=UDim.new(0,15),
Parent=k.card})l:Create('UIListLayout',{FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.
VerticalAlignment.Center,HorizontalFlex=Enum.UIFlexAlignment.SpaceBetween,Padding=UDim.new(0,10),Parent=k.card})k.
titleContainer=l:Create('Frame',{AutomaticSize=Enum.AutomaticSize.X,Size=UDim2.fromOffset(0,16),BackgroundTransparency=1
,BorderSizePixel=0,LayoutOrder=0,ZIndex=6,Parent=k.card})l:Create('UIFlexItem',{FlexMode=Enum.UIFlexMode.Shrink,Parent=k
.titleContainer})l:Create('UIListLayout',{Padding=UDim.new(0,6),FillDirection=Enum.FillDirection.Horizontal,
VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.Left,SortOrder=Enum.
SortOrder.LayoutOrder,Parent=k.titleContainer})if k.icon then k.iconLabel=l:Create('ImageLabel',{Image=k.icon,Size=UDim2
.fromOffset(20,20),BorderSizePixel=0,BackgroundTransparency=1,LayoutOrder=0,ZIndex=6,ImageTransparency=1,Parent=k.
titleContainer},{ImageColor3='ContentColor'})end k.title=l:Create('TextLabel',{Text=c.t(k.name),Size=UDim2.fromOffset(0,
16),AutomaticSize=Enum.AutomaticSize.X,BorderSizePixel=0,BackgroundTransparency=1,TextSize=16,TextXAlignment=Enum.
TextXAlignment.Left,TextTruncate=Enum.TextTruncate.AtEnd,LayoutOrder=1,ZIndex=6,TextTransparency=1,Parent=k.
titleContainer},{TextColor3='ContentColor',FontFace='Font'})l:Create('UIFlexItem',{FlexMode=Enum.UIFlexMode.Shrink,
Parent=k.title})k.readoutHost=l:Create('Frame',{AutomaticSize=Enum.AutomaticSize.X,Size=UDim2.fromOffset(0,18),
BackgroundTransparency=1,BorderSizePixel=0,LayoutOrder=1,ZIndex=6,Parent=k.card})k.readoutOdo=ai.new(l,k.readoutHost,{
textSize=17,alignment=Enum.HorizontalAlignment.Right,transparency=1})k.readoutOdo:snap(k.display=='change'and k:
_formatChange(0)or k:_formatValue(k.value))if k.display=='value'then k:_applyValueColor()end end function ae._setAccent(
k,l,m)k._lastAccentKey=l k._lastDirection=m k:_applyValueColor()end function ae._applyValueColor(k)local l=k.window.
theme.SliderProgress.Keypoints[1].Value if k.valueOdo then k.valueOdo:setColor(l)end if k.readoutOdo and k.display==
'value'then k.readoutOdo:setColor(l)end end function ae._refreshTheme(k)k:_applyValueColor()end function ae._formatValue
(k,l)return k.prefix..h(l)..k.suffix end function ae._formatChange(k,l)if k.changeMode=='absolute'then return i(l)else
return g(l)end end function ae._showValue(k,l,m,n,o)if k.numberEasing and not o then l:to(k:_formatValue(m),m>=n)else l:
snap(k:_formatValue(m))end end function ae._updateFullReadouts(k,l,m,n,o,p,q)k:_showValue(k.valueOdo,l,m,q)if p then k.
changeOdo:snap(p)k._lastChange=0 elseif k.numberEasing and not o then k.changeOdo:to(k:_formatChange(n),n>=k._lastChange
)k._lastChange=n else k.changeOdo:snap(k:_formatChange(n or 0))k._lastChange=n or 0 end end function ae.
_updateCompactReadout(k,l,m,n,o,p,q)if k.display=='change'then if p then k.readoutOdo:snap(p)k._lastChange=0 elseif k.
numberEasing and not o then k.readoutOdo:to(k:_formatChange(n),n>=k._lastChange)k._lastChange=n else k.readoutOdo:snap(k
:_formatChange(n or 0))k._lastChange=n or 0 end else k:_showValue(k.readoutOdo,l,m,q)end end function ae.Set(k,l)assert(
typeof(l)=='number','Statistic:Set() - value must be a number, got '..typeof(l))local m,n=k.value,not k._hasValue k.
value=l k._hasValue=true if n then k._initialValue=l end local o=if k.changeBaseline=='initial'then k._initialValue else
m local p,q,r,s,t=n or o==l if p then q=0 s='neutral't=0 elseif o==0 then local u,v=if l>0 then'+'else'-',if k.
changeMode=='percentage'then'\u{221e}%'else'\u{221e}'r=u..v s=if l>0 then'positive'else'negative't=if l>0 then 1 else-1
elseif k.changeMode=='percentage'then q=((l-o)/math.abs(o))*100 t=if q>0 then 1 elseif q<0 then-1 else 0 s=if t==1 then
'positive'elseif t==-1 then'negative'else'neutral'else q=l-o t=if q>0 then 1 elseif q<0 then-1 else 0 s=if t==1 then
'positive'elseif t==-1 then'negative'else'neutral'end k:_setAccent(s,t)if k.compact then k:_updateCompactReadout(l,m,q,p
,r,n)else k:_updateFullReadouts(l,m,q,p,r,n)end end function ae.ResetBaseline(k,l)local m,n,o=k.value,not k._hasValue,if
typeof(l)=='number'then l else k.value k._initialValue=o k.value=o k._hasValue=true k._lastChange=0 if k.compact then if
k.display=='change'then k.readoutOdo:snap(k:_formatChange(0))else k:_showValue(k.readoutOdo,o,m,n)end else k.changeOdo:
snap(k:_formatChange(0))k:_showValue(k.valueOdo,o,m,n)end k:_setAccent('neutral',0)end function ae._setShown(k,l,m)local
n=k.window if k.compact then n:_reveal(k.main,{BackgroundTransparency=if l then(k.window.theme.ElementTransparency or 0)
else 1},m)n:_reveal(k.stroke,{Transparency=if l then k.window.theme.ElementStrokeTransparency else 1},m)n:_reveal(k.
title,{TextTransparency=if l then 0 else 1},m)if k.iconLabel then n:_reveal(k.iconLabel,{ImageTransparency=if l then 0
else 1},m)end k.readoutOdo:reveal(if l then 0 else 1,m)return end if l then n:_revealCommon(k,m)if k.glow then n:
_reveal(k.glow,{Transparency=0.82},m)end k.valueOdo:reveal(0,m)k.changeOdo:reveal(0,m)else n:_hideCommon(k,m)if k.glow
then n:_reveal(k.glow,{Transparency=1},m)end k.valueOdo:reveal(1,m)k.changeOdo:reveal(1,m)end end function ae._minWidth(
k)local l=40 if k.icon then l+=26 end l+=ah.textWidth(k.window.theme.Font,16,c.resolve(k.name))local m=if k.display==
'change'then k:_formatChange(0)else k:_formatValue(k.value)l+=ah.textWidth(k.window.theme.Font,17,m)return l end b(ae)b(
af)return ae end)()end,[27]=function()local aa,ab,ac=a(27)local ad return(function(...)local ae={}ae.__index=ae ae.
__type='Tab'local af=ab.Parent.Parent.utility local ag,ah,ai,b,c=ac(af.variables),ac(af.ordering),ac(af.HapticEngine),
ac(ab.Parent.search),ac(ab.Parent.tabSelector)local function d(e,f)for g,h in f do if h.__type=='Group'then d(e,h.
elements)else e:_unregisterControl(h)end if h.connections then for i,j in h.connections do e:Disconnect(j)end h.
connections=nil end if h._dragConnection then h._dragConnection:Disconnect()h._dragConnection=nil end if e.
_recordingKeybind==h then e._recordingKeybind=nil end if h._outsideClickConn then e:Disconnect(h._outsideClickConn)h.
_outsideClickConn=nil end end end local e,f=TweenInfo.new(0.4,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),TweenInfo
.new(0.25,Enum.EasingStyle.Quint,Enum.EasingDirection.Out)function ae.new(g,h)h=if typeof(h)=='table'then h else{}local
i=setmetatable({window=assert(g,'Missing argument #1 (Window expected)'),name=h.name or h.Name,icon=h.icon or h.Icon,
neglectSelector=h.neglectSelector or h.NeglectSelector or false,customOrder=h.customOrder or h.CustomOrder or 0,
forgetState=h.forgetState or h.ForgetState or false,elements={},connections={}},ae)assert(i.name or i.icon,
'A tab needs a name or an icon.')if not i.neglectSelector then c.build(i,i.window.layout)end i.tabPage=i.window:Create(
'ScrollingFrame',{Name=i.name,Size=UDim2.new(1,-20,1,0),Position=UDim2.new(0.5,0,0,68),AnchorPoint=Vector2.new(0.5,0.5),
BorderSizePixel=0,BackgroundTransparency=1,AutomaticCanvasSize=Enum.AutomaticSize.Y,CanvasSize=UDim2.new(0,0,0,0),
ScrollBarThickness=0,ScrollingDirection=Enum.ScrollingDirection.Y,LayoutOrder=i.customOrder or 0,Parent=i.window.
elements})i.tabPageLayout=i.window:Create('UIListLayout',{Padding=UDim.new(0,7),FillDirection=Enum.FillDirection.
Vertical,VerticalAlignment=Enum.VerticalAlignment.Top,HorizontalAlignment=Enum.HorizontalAlignment.Center,SortOrder=Enum
.SortOrder.LayoutOrder,Parent=i.tabPage})i.window:Create('UIPadding',{PaddingTop=UDim.new(0,10),PaddingBottom=UDim.new(0
,33),Parent=i.tabPage})if not i.neglectSelector then table.insert(i.connections,i.window:Connect(i.topbarItemInteract.
MouseButton1Click,function()ai.click()i:Select()end))table.insert(i.connections,i.window:Connect(i.topbarItemInteract.
MouseEnter,function()if not i.window:_interactive()then return end if i.window.selectedTab~=i then i:_applyVisual(
'hover',f)i:_spinGradients()end end))table.insert(i.connections,i.window:Connect(i.topbarItemInteract.MouseLeave,
function()if i.window.selectedTab~=i then i:_applyVisual('unselected',f)end end))end return i end function ae.
_applyVisual(g,h,i)if g.neglectSelector or not g.topbarItem then return end local j=c.states[g.window.layout.mode][h]if
not j then return end c.applyVisual(g,j,i)end function ae._spinGradients(g)if g.neglectSelector then return end local h=
TweenInfo.new(0.7,Enum.EasingStyle.Quint,Enum.EasingDirection.Out)for i,j in{g.topbarItemGradient,g.
topbarItemStrokeGradient}do j.Rotation=-270 ag.tweenService:Create(j,h,{Rotation=90}):Play()end end function ae.Select(g
,h)if g.window._searching then b.close(g.window,{showTabs=true,jumpTo=false})end g.window.selectedTab=g g.window:
_jumpTo(g.tabPage)local i=h or not g.window:_interactive()if not g.neglectSelector and not i then g:_applyVisual(
'selected',e)end for j,k in g.window.tabs do if k~=g.window.selectedTab then k:Deselect(i)end end if g~=g.window.
rfSettings and g.window.settingsAction and not i then ag.tweenService:Create(g.window.settingsAction.iconLabel,TweenInfo
.new(0.25,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{ImageTransparency=0.6}):Play()end end function ae.Deselect(g
,h)if not g.neglectSelector and not h then g:_applyVisual('unselected',e)end end function ae._register(g,h)table.insert(
g.elements,h)ah(h,#g.elements*10)g.window:_restoreLate(h)if not g.window.hidden then h:_setShown(true,true)end return h
end function ae.CreateButton(g,h)return g:_register(ac(ab.Parent.button).new(g,h))end function ae.CreateToggle(g,h)
return g:_register(ac(ab.Parent.toggle).new(g,h))end function ae.CreateSwitch(g,h)return g:CreateToggle(h)end function
ae.CreateSection(g,h)return g:_register(ac(ab.Parent.section).new(g,h))end function ae.CreateText(g,h)return g:
_register(ac(ab.Parent.text).new(g,h))end function ae.CreateDivider(g,h)return g:_register(ac(ab.Parent.divider).new(g,h
))end function ae.CreateProgress(g,h)return g:_register(ac(ab.Parent.progress).new(g,h))end function ae.CreateConsole(g,
h)return g:_register(ac(ab.Parent.console).new(g,h))end function ae.CreateStat(g,h)return g:_register(ac(ab.Parent.stat)
.new(g,h))end function ae.CreateSlider(g,h)return g:_register(ac(ab.Parent.slider).new(g,h))end function ae.
CreateDropdown(g,h)return g:_register(ac(ab.Parent.dropdown).new(g,h))end function ae.CreateInput(g,h)return g:
_register(ac(ab.Parent.input).new(g,h))end function ae.CreateKeybind(g,h)return g:_register(ac(ab.Parent.keybind).new(g,
h))end function ae.CreateColorPicker(g,h)return g:_register(ac(ab.Parent.colorpicker).new(g,h))end function ae.
CreateGroup(g,h)return g:_register(ac(ab.Parent.group).new(g,h))end function ae._moveElement(g,h,i)local j=table.find(g.
elements,h)if not j then return end table.remove(g.elements,j)i=math.clamp(i,1,#g.elements+1)table.insert(g.elements,i,h
)for k,l in g.elements do ah(l,k*10)end end function ae.Remove(g)local h=g.window if h._searching then b.close(h,{
showTabs=true,jumpTo=h.selectedTab and h.selectedTab.tabPage})end local i=table.find(h.tabs,g)if i then table.remove(h.
tabs,i)end if h.selectedTab==g then h.selectedTab=nil for j,k in ipairs(h.tabs)do if not k.neglectSelector then k:
Select()break end end end d(h,g.elements)for j,k in g.connections do h:Disconnect(k)end g.connections={}if g.topbarItem
then h:DestroySubtree(g.topbarItem)end if g.tabPage then h:DestroySubtree(g.tabPage)end g.topbarItem=nil g.tabPage=nil g
.elements={}end return ae end)()end,[28]=function()local aa,ab,ac=a(28)local ad return(function(...)local ae={}ae.
__index=ae ae.__type='TabSection'local af,ag,ah,ai,b=ac(ab.Parent.Parent.utility.locale),ac(ab.Parent.Parent.utility.log
),20,6,3 local function c(d)for e,f in d.tabs do if not f.neglectSelector then return true end end return#d.tabSections>
0 end function ae.new(d,e)e=if typeof(e)=='table'then e else{}local f=setmetatable({window=assert(d,
'Missing argument #1 (Window expected)'),name=e.name or e.Name or'Section',icon=e.icon or e.Icon},ae)if d.layout.mode~=
'sidebar'then if not d._warnedTabSection then d._warnedTabSection=true ag.warn
[[Rayfield: Window:CreateSection needs the sidebar layout; it does nothing on the top strip.]]end f.inert=true return f
end f.main=d:Create('Frame',{Name=f.name,Size=UDim2.new(1,-ah*2,0,0),AutomaticSize=Enum.AutomaticSize.Y,
BackgroundTransparency=1,BorderSizePixel=0,Visible=false,Parent=d.tabList})f.padding=d:Create('UIPadding',{PaddingTop=
UDim.new(0,if c(d)then ai else 0),PaddingBottom=UDim.new(0,b),Parent=f.main})d:Create('UIListLayout',{FillDirection=Enum
.FillDirection.Horizontal,Padding=UDim.new(0,6),SortOrder=Enum.SortOrder.LayoutOrder,HorizontalAlignment=Enum.
HorizontalAlignment.Left,VerticalAlignment=Enum.VerticalAlignment.Top,Parent=f.main})if f.icon then f.iconLabel=d:
Create('ImageLabel',{Image=f.icon,Size=UDim2.fromOffset(16,16),BackgroundTransparency=1,BorderSizePixel=0,LayoutOrder=0,
ImageTransparency=1,Parent=f.main},{ImageColor3='ContentColor'})end f.title=d:Create('TextLabel',{Text=af.t(f.name),Size
=UDim2.fromOffset(0,15),AutomaticSize=Enum.AutomaticSize.X,BackgroundTransparency=1,BorderSizePixel=0,TextSize=15,
TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Bottom,TextWrapped=true,LayoutOrder=1,
TextTransparency=1,Parent=f.main},{TextColor3='ContentColor',FontFace='Font'})return f end function ae._setShown(d,e,f)
if not d.main then return end local g=d.window g:_reveal(d.title,{TextTransparency=if e then 0.6 else 1},f)if d.
iconLabel then g:_reveal(d.iconLabel,{ImageTransparency=if e then 0.65 else 1},f)end end function ae._setVisible(d,e)if
d.main then d.main.Visible=e end end function ae.Remove(d)local e=table.find(d.window.tabSections,d)if e then table.
remove(d.window.tabSections,e)end d.window:DestroySubtree(d.main)d.main=nil end return ae end)()end,[29]=function()local
aa,ab,ac=a(29)local ad return(function(...)local ae=ab.Parent.Parent.utility local af,ag,ah,ai=ac(ae.variables),ac(ae.
functions),ac(ae.locale),{}local function b(c:string?):string if type(c)~='string'or c==''then return'?'end local d=utf8
.offset(c,2)local e=if d then string.sub(c,1,d-1)else c return string.upper(e)end ai.states={top={selected={background=0
,stroke=0,content=0},hover={background=0.4,stroke=0.3,content=0.3},unselected={background=0.8,stroke=0.65,content=0.5},
hidden={background=1,stroke=1,content=1}},sidebar={selected={background=0.4,stroke=0.5,content=0,shadow=0.8},hover={
background=0.7,stroke=0.8,content=0.3,shadow=1},unselected={background=1,stroke=1,content=0.5,shadow=1},hidden={
background=1,stroke=1,content=1,shadow=1}}}local function c(d,e,f)d.topbarItemGradient=d.window:Create('UIGradient',{
Rotation=90,Parent=e},{Color={'TabBackground',ag.toColorSequence}})d.topbarItemStrokeGradient=d.window:Create(
'UIGradient',{Rotation=90,Parent=f},{Color={'TabStroke',ag.toColorSequence}})end local function d(e,f,g)if g and not e.
icon then e.topbarItemInitial=e.window:Create('TextLabel',{Text=b(e.name),Size=UDim2.fromOffset(f,f),BorderSizePixel=0,
BackgroundTransparency=1,TextSize=f-4,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.
Center,Visible=false,TextTransparency=1,Parent=e.topbarItemContainer},{TextColor3='TabColor',FontFace='Font'})end if e.
icon then e.topbarItemIcon=e.window:Create('ImageLabel',{Image=e.icon,Size=UDim2.fromOffset(f,f),BorderSizePixel=0,
BackgroundTransparency=1,ImageTransparency=1,Parent=e.topbarItemContainer},{ImageColor3='TabColor'})end if e.name then e
.topbarItemTitle=e.window:Create('TextLabel',{Text=ah.t(e.name),Size=UDim2.fromOffset(0,16),BorderSizePixel=0,
BackgroundTransparency=1,TextSize=16,AutomaticSize=Enum.AutomaticSize.XY,TextXAlignment=Enum.TextXAlignment.Left,
TextWrapped=true,LayoutOrder=1,TextTransparency=1,Parent=e.topbarItemContainer},{TextColor3='TabColor',FontFace='Font'})
end end local function e(f)f.topbarItem=f.window:Create('Frame',{Name=f.name,Size=UDim2.fromOffset(0,34),AutomaticSize=
Enum.AutomaticSize.X,BackgroundColor3=Color3.fromRGB(255,255,255),BorderSizePixel=0,BackgroundTransparency=1,Visible=
false,LayoutOrder=f.customOrder or 0,Parent=f.window.tabList})f.topbarItemInteract=f.window:Create('TextButton',{Active=
false,BackgroundTransparency=1,Size=UDim2.fromScale(1,1),BorderSizePixel=0,Text='',TextTransparency=1,Parent=f.
topbarItem})f.window:Create('UICorner',{Parent=f.topbarItem},{CornerRadius='PillCornerRadius'})f.topbarItemStroke=f.
window:Create('UIStroke',{ApplyStrokeMode=Enum.ApplyStrokeMode.Border,Color=Color3.fromRGB(255,255,255),Transparency=1,
Parent=f.topbarItem})c(f,f.topbarItem,f.topbarItemStroke)f.topbarItemContainer=f.window:Create('Frame',{Size=UDim2.
fromOffset(0,34),AutomaticSize=Enum.AutomaticSize.X,BackgroundTransparency=1,BorderSizePixel=0,Parent=f.topbarItem})f.
window:Create('UIPadding',{PaddingLeft=UDim.new(0,13),PaddingRight=UDim.new(0,14),Parent=f.topbarItemContainer})f.
topbarItemLayout=f.window:Create('UIListLayout',{Padding=UDim.new(0,6),FillDirection=Enum.FillDirection.Horizontal,
VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.Center,SortOrder=Enum.
SortOrder.LayoutOrder,Parent=f.topbarItemContainer})d(f,16,false)end local function f(g,h)g.topbarItem=g.window:Create(
'Frame',{Name=g.name,Size=UDim2.new(1,-h.rowInset*2,0,h.rowHeight),BackgroundColor3=Color3.fromRGB(255,255,255),
BorderSizePixel=0,BackgroundTransparency=1,Visible=false,LayoutOrder=g.customOrder or 0,Parent=g.window.tabList})g.
topbarItemInteract=g.window:Create('TextButton',{Active=false,BackgroundTransparency=1,Size=UDim2.fromScale(1,1),
BorderSizePixel=0,Text='',TextTransparency=1,Parent=g.topbarItem})g.window:Create('UICorner',{CornerRadius=UDim.new(0,h.
rowCornerRadius),Parent=g.topbarItem})g.topbarItemStroke=g.window:Create('UIStroke',{ApplyStrokeMode=Enum.
ApplyStrokeMode.Border,Color=Color3.fromRGB(255,255,255),Transparency=1,Parent=g.topbarItem})c(g,g.topbarItem,g.
topbarItemStroke)g.topbarItemShadow=g.window:Create('UIShadow',{BlurRadius=UDim.new(0,20),Color=Color3.fromRGB(255,255,
255),Offset=UDim2.new(0,0,0,-15),Spread=UDim2.new(0,10,0,-30),ZIndex=-1,Transparency=1,Parent=g.topbarItem})g.
topbarItemContainer=g.window:Create('Frame',{Size=UDim2.new(1,-h.rowPadding,0,24),Position=UDim2.new(0,h.rowPadding,0.5,
0),AnchorPoint=Vector2.new(0,0.5),BackgroundTransparency=1,BorderSizePixel=0,Parent=g.topbarItem})g.topbarItemLayout=g.
window:Create('UIListLayout',{Padding=UDim.new(0,h.rowContentSpacing),FillDirection=Enum.FillDirection.Horizontal,
VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.Left,SortOrder=Enum.
SortOrder.LayoutOrder,Parent=g.topbarItemContainer})d(g,h.rowIconSize,true)end function ai.build(g,h)if h.mode==
'sidebar'then f(g,h)else e(g)end end function ai.setRowCollapsed(g,h,i)if i.mode~='sidebar'or not g.topbarItem then
return end if g.topbarItemTitle then g.topbarItemTitle.Visible=not h end if g.topbarItemInitial then g.topbarItemInitial
.Visible=h end local j=if h then 0 else i.rowPadding g.topbarItemContainer.Size=UDim2.new(1,-j,0,24)g.
topbarItemContainer.Position=UDim2.new(0,j,0.5,0)g.topbarItemLayout.HorizontalAlignment=if h then Enum.
HorizontalAlignment.Center else Enum.HorizontalAlignment.Left end function ai.applyVisual(g,h,i)local j={[g.topbarItem]=
{BackgroundTransparency=h.background},[g.topbarItemStroke]={Transparency=h.stroke}}if g.topbarItemIcon then j[g.
topbarItemIcon]={ImageTransparency=h.content}end if g.topbarItemTitle then j[g.topbarItemTitle]={TextTransparency=h.
content}end if g.topbarItemInitial then j[g.topbarItemInitial]={TextTransparency=h.content}end if g.topbarItemShadow and
h.shadow then j[g.topbarItemShadow]={Transparency=h.shadow}end for k,l in j do if i then af.tweenService:Create(k,i,l):
Play()else for m,n in l do k[m]=n end end end end return ai end)()end,[30]=function()local aa,ab,ac=a(30)local ad return
(function(...)local ae={}ae.__index=ae ae.__type='Tag'local af=ab.Parent.Parent.utility local ag,ah,ai,b,c=ac(af.
variables),ac(af.functions),ac(af.image),Color3.fromRGB(255,175,15),TweenInfo.new(0.25,Enum.EasingStyle.Quint,Enum.
EasingDirection.Out)function ae.new(d,e)e=if typeof(e)=='table'then e else{}local f=setmetatable({window=assert(d,
'Missing argument #1 (Window expected)'),text=e.text or e.Text or e.title or e.Title,icon=e.icon or e.Icon,color=e.color
or e.Color or b},ae)assert(f.icon or(f.text and f.text~=''),'A Tag requires an icon, text, or both.')f.main=f.window:
Create('Frame',{Name='Tag',Size=UDim2.fromOffset(10,24),AutomaticSize=Enum.AutomaticSize.X,BackgroundColor3=f.color,
BorderSizePixel=0,LayoutOrder=e.order or e.Order or 0,BackgroundTransparency=1,Parent=f.window.tagContainer})f.window:
Create('UICorner',{CornerRadius=UDim.new(1,0),Parent=f.main})f.window:Create('UIPadding',{PaddingLeft=UDim.new(0,10),
PaddingRight=UDim.new(0,10),Parent=f.main})f.window:Create('UIListLayout',{Padding=UDim.new(0,5),FillDirection=Enum.
FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,Parent=f.
main})local g=ah.contrastColor(f.color)f.iconLabel=f.window:Create('ImageLabel',{Name='Icon',Image=f.icon or'',
ImageColor3=g,Size=UDim2.fromOffset(16,16),BackgroundTransparency=1,Visible=f.icon~=nil,ZIndex=5,ImageTransparency=1,
Parent=f.main})f.title=f.window:Create('TextLabel',{Name='Title',AnchorPoint=Vector2.new(0,0.5),Size=UDim2.fromOffset(10
,15),AutomaticSize=Enum.AutomaticSize.X,BackgroundTransparency=1,Text=f.text or'',TextColor3=g,TextSize=15,
TextXAlignment=Enum.TextXAlignment.Left,TextWrapped=true,RichText=true,Visible=f.text~=nil and f.text~='',LayoutOrder=1,
ZIndex=5,TextTransparency=1,Parent=f.main},{FontFace='Font'})f.window.tagContainer.Visible=true if not f.window.hidden
then f:_setShown(true,c)end return f end function ae._setShown(d,e,f)local g,h=if e then 0 else 1,if typeof(f)==
'TweenInfo'then f elseif f then c else nil if h then ag.tweenService:Create(d.main,h,{BackgroundTransparency=g}):Play()
ag.tweenService:Create(d.iconLabel,h,{ImageTransparency=g}):Play()ag.tweenService:Create(d.title,h,{TextTransparency=g})
:Play()else d.main.BackgroundTransparency=g d.iconLabel.ImageTransparency=g d.title.TextTransparency=g end end function
ae.SetColor(d,e)d.color=e local f=ah.contrastColor(e)ag.tweenService:Create(d.main,c,{BackgroundColor3=e}):Play()ag.
tweenService:Create(d.iconLabel,c,{ImageColor3=f}):Play()ag.tweenService:Create(d.title,c,{TextColor3=f}):Play()end
function ae.SetText(d,e)d.text=e d.title.Text=e or''d.title.Visible=e~=nil and e~=''end function ae.SetIcon(d,e)d.icon=e
ai.assign(d.iconLabel,'Image',e)d.iconLabel.Visible=e~=nil end function ae.Set(d,e)if e.color or e.Color then d:
SetColor(e.color or e.Color)end if e.text or e.Text or e.title or e.Title then d:SetText(e.text or e.Text or e.title or
e.Title)end if e.icon~=nil or e.Icon~=nil then d:SetIcon(e.icon or e.Icon)end end function ae.Remove(d)d.window:
DestroySubtree(d.main)local e=table.find(d.window.tags,d)if e then table.remove(d.window.tags,e)end if#d.window.tags==0
then d.window.tagContainer.Visible=false end end return ae end)()end,[31]=function()local aa,ab,ac=a(31)local ad return(
function(...)local ae={}ae.__index=ae ae.__type='Text'local af,ag,ah,ai,b=ac(ab.Parent.Parent.utility.moveable),ac(ab.
Parent.Parent.utility.locale),16,14,0.45 function ae.new(c,d)d=if typeof(d)=='table'then d else{}local e=setmetatable({
tab=assert(c,'Missing argument #1 (Tab expected)'),window=c.window,name=tostring(d.name or d.Name or''),text=tostring(d.
text or d.Text or''),icon=d.icon or d.Icon},ae)e.main=e.window:Create('Frame',{Size=UDim2.new(1,-20,0,0),AutomaticSize=
Enum.AutomaticSize.Y,BorderSizePixel=0,Name=if e.name~=''then e.name else'Text',BackgroundColor3=Color3.fromRGB(255,255,
255),BackgroundTransparency=1,Parent=e.tab.tabPage},{BackgroundTransparency='ElementTransparency'})e.stroke=e.window:
StyleElementBody(e.main)e.window:Create('UIPadding',{PaddingTop=UDim.new(0,14),PaddingBottom=UDim.new(0,14),PaddingLeft=
UDim.new(0,20),PaddingRight=UDim.new(0,20),Parent=e.main})e.window:Create('UIListLayout',{Padding=UDim.new(0,6),
SortOrder=Enum.SortOrder.LayoutOrder,Parent=e.main})e.titleRow=e.window:Create('Frame',{Name='Title',Size=UDim2.new(1,0,
0,0),AutomaticSize=Enum.AutomaticSize.Y,BorderSizePixel=0,BackgroundTransparency=1,LayoutOrder=1,Parent=e.main})e.window
:Create('UIListLayout',{FillDirection=Enum.FillDirection.Horizontal,Padding=UDim.new(0,6),SortOrder=Enum.SortOrder.
LayoutOrder,VerticalAlignment=Enum.VerticalAlignment.Top,Parent=e.titleRow})if e.icon then e.iconLabel=e.window:Create(
'ImageLabel',{Image=e.icon,Size=UDim2.fromOffset(16,16),BorderSizePixel=0,BackgroundTransparency=1,ImageTransparency=1,
Parent=e.titleRow},{ImageColor3='ContentColor'})end e.title=e.window:Create('TextLabel',{Text=ag.t(e.name),Size=UDim2.
new(1,if e.icon then-22 else 0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BorderSizePixel=0,BackgroundTransparency=1,
RichText=true,TextSize=ah,TextWrapped=true,TextXAlignment=Enum.TextXAlignment.Left,LayoutOrder=1,TextTransparency=1,
Parent=e.titleRow},{TextColor3='TitlingColor',FontFace='Font'})e.body=e.window:Create('TextLabel',{Text=ag.t(e.text),
Size=UDim2.new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BorderSizePixel=0,BackgroundTransparency=1,RichText=true,
TextSize=ai,TextWrapped=true,TextXAlignment=Enum.TextXAlignment.Left,LayoutOrder=2,TextTransparency=1,Parent=e.main},{
TextColor3='ContentColor',FontFace='Font'})e:_applyPresence()return e end function ae._applyPresence(c)c.titleRow.
Visible=c.name~=''or c.icon~=nil c.body.Visible=c.text~=''end function ae.Set(c,d)c.text=tostring(d)c.window:
_bindLocale(c.body,'Text',c.text)c:_applyPresence()end function ae.SetTitle(c,d)c.name=tostring(d)c.window:_bindLocale(c
.title,'Text',c.name)c:_applyPresence()end function ae._setShown(c,d,e)if d then c.window:_revealCommon(c,e)else c.
window:_hideCommon(c,e)end c.window:_reveal(c.body,{TextTransparency=if d then b else 1},e)end af(ae)return ae end)()end
,[32]=function()local aa,ab,ac=a(32)local ad return(function(...)local ae={}ae.__index=ae ae.__type='Toast'local af=ab.
Parent.Parent.utility local ag,ah,ai,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v=ac(af.variables),ac(af.functions),ac(af.
constants),ac(af.image),ac(af.HapticEngine),TweenInfo.new(0.6,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),
TweenInfo.new(0.6,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),TweenInfo.new(0.4,Enum.EasingStyle.Exponential,
Enum.EasingDirection.Out),TweenInfo.new(0.3,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),TweenInfo.new(0.6,
Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),24,32,18,18,10,28,12,8,140,320,6,UDim2.new(0.5,0,0.5,-180),UDim2.
new(0.5,0,0.5,180),UDim2.new(0.5,0,0.5,0)local function w(x)return math.clamp(#x*0.06+3,3,9)end local function x(y)if
type(y)=='number'then return'rbxassetid://'..tostring(y)end return y end function ae.new(y,z,A)z=if typeof(z)=='table'
then z else{}local B=setmetatable({window=assert(y,'Missing argument #1 (Window expected)'),title=z.title or z.Title or
'',subtitle=z.subtitle or z.Subtitle,icon=z.icon or z.Icon,avatar=z.avatar or z.Avatar,minWidth=z.minWidth or z.MinWidth
,subtitleAbove=z.subtitleAbove or z.SubtitleAbove or false,position=z.position or'Top',_hovered=false,_dismissed=false},
ae)B.duration=z.duration or z.Duration or w(B.title..(B.subtitle or''))local C=B.avatar~=nil and B.avatar~=0 local D=C
or(B.icon~=nil and B.icon~=0 and B.icon~='')B._iconImage=if C then b.avatar(B.avatar,function(E)if B.iconLabel and not B
._dismissed and B.main.Parent then b.assign(B.iconLabel,'Image',E)end end)elseif D then x(B.icon)else nil B._iconSize=if
C then j else i B._leftPad=if C then m else k B._rightPad=if C then n else l B._minWidth=math.clamp(B.minWidth or 0,q,r)
local E=B.subtitle~=nil and B.subtitle~=''B.main=B.window:Create('Frame',{Name='Toast',BackgroundTransparency=1,Size=
UDim2.new(0,0,0,0),BorderSizePixel=0,ZIndex=ai.zIndex.toast,Parent=A or B.window.toasts})B.window:Create('UIPadding',{
PaddingTop=UDim.new(0,p),Parent=B.main})B.body=B.window:Create('Frame',{BackgroundColor3=Color3.fromRGB(255,255,255),
Size=UDim2.new(1,0,1,0),Position=if B.position=='Bottom'then u else t,AnchorPoint=Vector2.new(0.5,0.5),Active=true,
BorderSizePixel=0,ZIndex=ai.zIndex.toast,BackgroundTransparency=1,Parent=B.main})B.window:Create('UIGradient',{Rotation=
270,Offset=Vector2.new(0,-0.1),Parent=B.body},{Color={'WindowColor',ah.toColorSequence}})B.window:Create('UICorner',{
CornerRadius=UDim.new(1,0),Parent=B.body})B.stroke=B.window:Create('UIStroke',{Transparency=1,Parent=B.body},{Color=
'SurfaceStroke'})B.shadow=B.window:CreateGlow(B.body,'ShadowColor',20,1)B.window:Create('UIPadding',{PaddingLeft=UDim.
new(0,B._leftPad),PaddingRight=UDim.new(0,B._rightPad),Parent=B.body})B.window:Create('UIListLayout',{FillDirection=Enum
.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.
Left,SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,o),Parent=B.body})if D then B.iconLabel=B.window:Create(
'ImageLabel',{Image=B._iconImage,Size=UDim2.fromOffset(B._iconSize,B._iconSize),BackgroundColor3=Color3.fromRGB(255,255,
255),BorderSizePixel=0,LayoutOrder=1,ZIndex=ai.zIndex.toastContent,BackgroundTransparency=1,ImageTransparency=1,Parent=B
.body},if C then nil else{ImageColor3='ContentColor'})B.window:Create('UICorner',{CornerRadius=UDim.new(1,0),Parent=B.
iconLabel})end B.container=B.window:Create('Frame',{AutomaticSize=Enum.AutomaticSize.X,Size=UDim2.fromOffset(0,E and 32
or 16),BackgroundTransparency=1,BorderSizePixel=0,LayoutOrder=2,ZIndex=ai.zIndex.toastContent,Parent=B.body})B.window:
Create('UIListLayout',{FillDirection=Enum.FillDirection.Vertical,VerticalAlignment=Enum.VerticalAlignment.Center,
SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,1),Parent=B.container})B.titleLabel=B.window:Create('TextLabel',
{Text=B.title,AutomaticSize=Enum.AutomaticSize.X,Size=UDim2.fromOffset(0,16),BackgroundTransparency=1,TextSize=16,
TextXAlignment=Enum.TextXAlignment.Left,LayoutOrder=if B.subtitleAbove then 2 else 1,ZIndex=ai.zIndex.toastContent,
TextTransparency=1,Parent=B.container},{TextColor3='ContentColor',FontFace='TitleFont'})if E then B.subtitleLabel=B.
window:Create('TextLabel',{Text=B.subtitle,AutomaticSize=Enum.AutomaticSize.X,Size=UDim2.fromOffset(0,14),
BackgroundTransparency=1,TextSize=14,TextXAlignment=Enum.TextXAlignment.Left,LayoutOrder=if B.subtitleAbove then 1 else
2,ZIndex=ai.zIndex.toastContent,TextTransparency=1,Parent=B.container},{TextColor3='ContentColor',FontFace='Font'})end B
.window._toastCount=(B.window._toastCount or 0)+1 B.main.LayoutOrder=-B.window._toastCount local F=B.window._liveToasts
if not F then F={}B.window._liveToasts=F end local G=F[B.main.Parent]if not G then G={}F[B.main.Parent]=G end B._live=G
table.insert(G,B)while#G>s do local H=table.remove(G,1)if H and H~=B then task.spawn(H._dismiss,H)end end B._connections
={B.window:Connect(B.body.MouseEnter,function()B._hovered=true end),B.window:Connect(B.body.MouseLeave,function()B.
_hovered=false end),B.window:Connect(B.body.InputBegan,function(H)if H.UserInputType==Enum.UserInputType.MouseButton1 or
H.UserInputType==Enum.UserInputType.Touch then B:_dismiss()end end)}task.spawn(function()B:_show()end)return B end
function ae._measure(y)local z,A=ah.textWidth(y.window.theme.TitleFont,16,y.title),if y.subtitleLabel then ah.textWidth(
y.window.theme.Font,14,y.subtitle)else 0 local B,C=math.max(z,A),if y.iconLabel then y._leftPad+y._iconSize+o else y.
_leftPad local D=math.clamp(C+B+y._rightPad,y._minWidth,r)if C+B+y._rightPad>r then local E=r-C-y._rightPad for F,G in{y
.titleLabel,y.subtitleLabel}do if G then G.AutomaticSize=Enum.AutomaticSize.None G.TextTruncate=Enum.TextTruncate.AtEnd
G.Size=UDim2.fromOffset(E,G.Size.Y.Offset)end end end local E=if y.subtitleLabel then 31 else 16 local F=math.max(E,if y
.iconLabel then y._iconSize else 0)+18 return D,F end function ae._show(y)if not y.main.Parent then return end c.notify(
)local z,A=y:_measure()if y._dismissed or not y.main.Parent then return end y.main.Size=UDim2.new(0,z,0,0)ag.
tweenService:Create(y.main,e,{Size=UDim2.new(0,z,0,A+p)}):Play()ag.tweenService:Create(y.body,d,{Position=v}):Play()ag.
tweenService:Create(y.body,f,{BackgroundTransparency=0}):Play()ag.tweenService:Create(y.stroke,f,{Transparency=0.9}):
Play()ag.tweenService:Create(y.shadow,g,{Transparency=0.6}):Play()ag.tweenService:Create(y.titleLabel,g,{
TextTransparency=0}):Play()task.wait(0.05)if y._dismissed or not y.main.Parent then return end if y.iconLabel then ag.
tweenService:Create(y.iconLabel,g,{BackgroundTransparency=0.95}):Play()ag.tweenService:Create(y.iconLabel,g,{
ImageTransparency=0}):Play()end task.wait(0.05)if y._dismissed or not y.main.Parent then return end if y.subtitleLabel
then ag.tweenService:Create(y.subtitleLabel,g,{TextTransparency=0.5}):Play()end local B=0 while B<y.duration and not y.
_dismissed and y.main.Parent do local C=task.wait()if not y._hovered then B+=C end end y:_dismiss()end function ae.
_dismiss(y)if y._dismissed then return end y._dismissed=true local z=y._live local A=z and table.find(z,y)if z and A
then table.remove(z,A)end if not y.main.Parent then return end ag.tweenService:Create(y.body,f,{BackgroundTransparency=1
}):Play()ag.tweenService:Create(y.stroke,f,{Transparency=1}):Play()ag.tweenService:Create(y.shadow,g,{Transparency=1}):
Play()ag.tweenService:Create(y.titleLabel,g,{TextTransparency=1}):Play()if y.subtitleLabel then ag.tweenService:Create(y
.subtitleLabel,g,{TextTransparency=1}):Play()end if y.iconLabel then ag.tweenService:Create(y.iconLabel,g,{
ImageTransparency=1,BackgroundTransparency=1}):Play()end ag.tweenService:Create(y.body,h,{Size=UDim2.new(1,-60,1,0)}):
Play()local B=ag.tweenService:Create(y.main,h,{Size=UDim2.new(0,y.main.Size.X.Offset,0,0)})B:Play()B.Completed:Wait()if
not y.main.Parent then return end for C,D in y._connections do y.window:Disconnect(D)end y.window:DestroySubtree(y.main)
end return ae end)()end,[33]=function()local aa,ab,ac=a(33)local ad return(function(...)local ae={}ae.__index=ae ae.
__type='Toggle'local af=ab.Parent.Parent.utility local ag,ah,ai,b,c,d=ac(af.variables),ac(af.functions),ac(af.moveable),
ac(af.lockable),ac(af.locale),ac(af.HapticEngine)function ae.new(e,f)f=if typeof(f)=='table'then f else{}local g=
setmetatable({tab=assert(e,'Missing argument #1 (Tab expected)'),window=e.window,name=f.name or f.Name or'Switch',icon=f
.icon or f.Icon,description=f.description or f.Description,forgetState=f.forgetState or f.ForgetState or e.forgetState,
compact=e.compact or false,flag=f.flag or f.Flag or(not(f.forgetState or f.ForgetState or e.forgetState)and ah.
deriveFlagFromName(f.name or f.Name or'Switch')or nil),callback=f.callback or f.Callback or function()end,value=if(f.
value or f.Value)~=nil then(f.value or f.Value)else false},ae)g.window:_registerControl(g)if g.compact then g:
_buildCompact()else g:_buildFull()end if g.description and not g.compact then g.descriptor=ac(ab.Parent.descriptor).new(
g.tab,{description=g.description})end return g end function ae._buildSwitch(e,f)local g=e.window e.functionContainer=g:
Create('Frame',{BorderSizePixel=0,Size=UDim2.fromOffset(50,21),BackgroundTransparency=1,Parent=f},{BackgroundColor3=
'ToggleTrack'})g:Create('UICorner',{CornerRadius=UDim.new(0,15),Parent=e.functionContainer})e.containerStroke=g:Create(
'UIStroke',{Transparency=1,Parent=e.functionContainer},{Color='SurfaceStroke'})e.indicator=g:Create('Frame',{
BorderSizePixel=0,Size=UDim2.fromOffset(25,17),Position=e.value and UDim2.new(1,-28,0.5,0)or UDim2.new(1,-47,0.5,0),
AnchorPoint=Vector2.new(0,0.5),BackgroundColor3=e.value and e.window.theme.AccentColor or e.window.theme.ToggleKnobOff,
BackgroundTransparency=1,Parent=e.functionContainer})g:Create('UICorner',{CornerRadius=UDim.new(1,0),Parent=e.indicator}
)e.indicatorStroke=g:Create('UIStroke',{Color=e.value and e.window.theme.AccentStroke or Color3.fromRGB(255,255,255),
Transparency=1,Parent=e.indicator})e.indicatorGlow=g:CreateGlow(e.indicator,'AccentColor',20,1)e.overlay=g:Create(
'Frame',{BorderSizePixel=0,Size=UDim2.fromScale(1,1),Position=UDim2.fromScale(0,0),AnchorPoint=Vector2.new(0,0),
BackgroundColor3=Color3.fromRGB(255,255,255),BackgroundTransparency=1,Parent=e.functionContainer},{Visible=
'DarkToggleOverlay'})g:Create('UICorner',{CornerRadius=UDim.new(0,15),Parent=e.overlay})e.overlayGradient=g:Create(
'UIGradient',{Rotation=90,Color=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(30,30,30)),
ColorSequenceKeypoint.new(1,Color3.fromRGB(30,30,30))},Transparency=NumberSequence.new{NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(1,0.35)},Parent=e.overlay})return e.functionContainer end function ae._performToggle(e)d.
click()e.value=not e.value e:_animateIndicator()e.window:_runGuarded(e,e.callback,e.value)e.window:_persist(e)end
function ae._buildFull(e)local f=e.window e.main=f:Create('Frame',{Size=UDim2.new(1,-20,0,41),BorderSizePixel=0,Name=e.
name,BackgroundColor3=Color3.fromRGB(255,255,255),BackgroundTransparency=1,Parent=e.tab.tabPage},{BackgroundTransparency
='ElementTransparency'})e.stroke=f:StyleElementBody(e.main)e.hoverOverlay=f:CreateHoverOverlay(e.main)e.container=f:
Create('Frame',{BorderSizePixel=0,Parent=e.main,Size=UDim2.new(0,170,0,16),Position=UDim2.new(0,20,0.5,0),AnchorPoint=
Vector2.new(0,0.5),BackgroundTransparency=1})e.containerLayout=f:Create('UIListLayout',{Padding=UDim.new(0,5),
FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.
HorizontalAlignment.Left,Parent=e.container})if e.icon then e.iconLabel=f:Create('ImageLabel',{Image=e.icon,Size=UDim2.
fromOffset(16,16),BorderSizePixel=0,BackgroundTransparency=1,ImageTransparency=1,Parent=e.container},{ImageColor3=
'ContentColor'})end e.title=f:Create('TextLabel',{Text=c.t(e.name),Size=UDim2.fromOffset(250,16),BorderSizePixel=0,
BackgroundTransparency=1,TextSize=16,AutomaticSize=Enum.AutomaticSize.X,TextXAlignment=Enum.TextXAlignment.Left,
TextWrapped=true,LayoutOrder=1,TextTransparency=1,Parent=e.container},{TextColor3='ContentColor',FontFace='Font'})e.
interact=f:Create('TextButton',{BackgroundTransparency=1,Size=UDim2.new(1,0,1,0),BorderSizePixel=0,Position=UDim2.
fromScale(1,0.5),AnchorPoint=Vector2.new(1,0.5),TextTransparency=1,ZIndex=10,Parent=e.main})e:_buildSwitch(e.main)e.
functionContainer.Position=UDim2.new(1,-15,0,20)e.functionContainer.AnchorPoint=Vector2.new(1,0.5)e.window:
_wireElementHover(e)e.window:ConnectFor(e,e.interact.MouseButton1Click,function()ag.tweenService:Create(e.stroke,
TweenInfo.new(0.25,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{Transparency=1}):Play()ag.tweenService:Create(e.
main,TweenInfo.new(0.6,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{Size=UDim2.new(1,-26,0,41)}):Play()e:
_performToggle()task.wait(0.11)ag.tweenService:Create(e.main,TweenInfo.new(0.25,Enum.EasingStyle.Exponential,Enum.
EasingDirection.Out),{Size=UDim2.new(1,-20,0,41)}):Play()ag.tweenService:Create(e.stroke,TweenInfo.new(0.25,Enum.
EasingStyle.Quint,Enum.EasingDirection.Out),{Transparency=e.window.theme.ElementStrokeTransparency}):Play()end)end
function ae._buildCompact(e)local f=e.window e.main,e.stroke,e.interact=f:_buildCompactRow(e.tab,e.name,10)e.
hoverOverlay=e.interact f:Create('UIPadding',{PaddingLeft=UDim.new(0,15),PaddingRight=UDim.new(0,15),Parent=e.interact})
f:Create('UIListLayout',{FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,
HorizontalFlex=Enum.UIFlexAlignment.SpaceBetween,Padding=UDim.new(0,10),Parent=e.interact})e.container=f:Create('Frame',
{AutomaticSize=Enum.AutomaticSize.X,Size=UDim2.fromOffset(0,16),BackgroundTransparency=1,BorderSizePixel=0,LayoutOrder=0
,Parent=e.interact})f:Create('UIFlexItem',{FlexMode=Enum.UIFlexMode.Shrink,Parent=e.container})f:Create('UIListLayout',{
Padding=UDim.new(0,5),FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,
HorizontalAlignment=Enum.HorizontalAlignment.Left,Parent=e.container})if e.icon then e.iconLabel=f:Create('ImageLabel',{
Image=e.icon,Size=UDim2.fromOffset(16,16),BorderSizePixel=0,BackgroundTransparency=1,LayoutOrder=0,ImageTransparency=1,
Parent=e.container},{ImageColor3='ContentColor'})end e.title=f:Create('TextLabel',{Text=c.t(e.name),Size=UDim2.
fromOffset(0,16),AutomaticSize=Enum.AutomaticSize.X,BorderSizePixel=0,BackgroundTransparency=1,TextSize=16,
TextXAlignment=Enum.TextXAlignment.Left,TextTruncate=Enum.TextTruncate.AtEnd,LayoutOrder=1,TextTransparency=1,Parent=e.
container},{TextColor3='ContentColor',FontFace='Font'})f:Create('UIFlexItem',{FlexMode=Enum.UIFlexMode.Shrink,Parent=e.
title})e:_buildSwitch(e.interact)e.functionContainer.LayoutOrder=1 e.window:_wireElementHover(e)e.window:ConnectFor(e,e.
interact.MouseButton1Click,function()ag.tweenService:Create(e.stroke,TweenInfo.new(0.25,Enum.EasingStyle.Quint,Enum.
EasingDirection.Out),{Transparency=1}):Play()e:_performToggle()task.wait(0.11)ag.tweenService:Create(e.stroke,TweenInfo.
new(0.25,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{Transparency=e.window.theme.ElementStrokeTransparency}):Play(
)end)end function ae._animateIndicator(e)local f=TweenInfo.new(0.6,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out
)if e.indicatorGlow then ag.tweenService:Create(e.indicatorGlow,f,{Transparency=e.value and e.window.theme.AccentGlow or
1}):Play()end if e.value then ag.tweenService:Create(e.indicator,f,{Position=UDim2.new(1,-28,0.5,0),BackgroundColor3=e.
window.theme.AccentColor,BackgroundTransparency=0}):Play()ag.tweenService:Create(e.indicatorStroke,f,{Color=e.window.
theme.AccentStroke,Transparency=0}):Play()else ag.tweenService:Create(e.indicator,f,{Position=UDim2.new(1,-47,0.5,0),
BackgroundColor3=e.window.theme.ToggleKnobOff,BackgroundTransparency=e.window.theme.ToggleKnobOffTransparency}):Play()ag
.tweenService:Create(e.indicatorStroke,f,{Color=Color3.fromRGB(255,255,255),Transparency=0.7}):Play()end end local e,f=
TweenInfo.new(0.6,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),TweenInfo.new(0.6,Enum.EasingStyle.Exponential,
Enum.EasingDirection.Out,0,false,0.35)function ae._setShown(g,h,i)local j=g.window if h then j:_revealCommon(g,i)j:
_reveal(g.indicator,{BackgroundColor3=g.value and j.theme.AccentColor or j.theme.ToggleKnobOff,BackgroundTransparency=g.
value and 0 or j.theme.ToggleKnobOffTransparency},i,e)j:_reveal(g.indicatorStroke,{Color=g.value and j.theme.
AccentStroke or Color3.fromRGB(255,255,255),Transparency=g.value and 0 or 0.7},i,e)j:_reveal(g.indicatorGlow,{
Transparency=g.value and j.theme.AccentGlow or 1},i,f)j:_reveal(g.overlay,{BackgroundTransparency=0},i,e)j:_reveal(g.
containerStroke,{Transparency=0.85},i,e)j:_reveal(g.functionContainer,{BackgroundTransparency=j.theme.
ToggleTrackTransparency},i,e)else j:_hideCommon(g,i)j:_reveal(g.indicator,{BackgroundTransparency=1},i,e)j:_reveal(g.
indicatorStroke,{Transparency=1},i,e)j:_reveal(g.indicatorGlow,{Transparency=1},i,f)j:_reveal(g.overlay,{
BackgroundTransparency=1},i,e)j:_reveal(g.containerStroke,{Transparency=1},i,e)j:_reveal(g.functionContainer,{
BackgroundTransparency=1},i,e)end end function ae._refreshTheme(g)local h,i,j=g.window.theme,TweenInfo.new(0.5,Enum.
EasingStyle.Quint,Enum.EasingDirection.Out),ag.tweenService j:Create(g.functionContainer,i,{BackgroundTransparency=h.
ToggleTrackTransparency}):Play()j:Create(g.indicator,i,{BackgroundColor3=g.value and h.AccentColor or h.ToggleKnobOff,
BackgroundTransparency=g.value and 0 or h.ToggleKnobOffTransparency}):Play()j:Create(g.indicatorStroke,i,{Color=g.value
and h.AccentStroke or Color3.fromRGB(255,255,255)}):Play()if g.indicatorGlow then j:Create(g.indicatorGlow,i,{
Transparency=g.value and h.AccentGlow or 1}):Play()end end function ae._minWidth(g)local h=90 if g.icon then h+=21 end h
+=ah.textWidth(g.window.theme.Font,16,c.resolve(g.name))return h end ai(ae)b(ae)function ae.Set(g,h,i)local j=g.value~=h
g.value=h if j then g:_animateIndicator()end if not i then g.window:_runGuarded(g,g.callback,g.value)g.window:_persist(g
)end end return ae end)()end,[34]=function()local aa,ab,ac=a(34)local ad return(function(...)local ae=ab.Parent.Parent.
utility local af,ag,ah,ai,b,c,d,e,f,g,h,i,j,k,l=ac(ae.image),ac(ae.functions),ac(ae.persistence),ac(ae.constants),ac(ae.
locale),ac(ae.log),ac(ae.HapticEngine),ac(ae.windowSizing),ac(ae.layouts),ac(ab.Parent.chrome),ac(ab.Parent.search),ac(
ab.Parent.sidebar),ac(ae.variables),ab.Parent.Parent.themes,{}l.__index=l local m,n,o,p,q=TweenInfo.new(0.4,Enum.
EasingStyle.Exponential,Enum.EasingDirection.Out),UDim2.fromOffset(185,50),UDim2.fromOffset(50,50),UDim2.new(0.5,0,0,20)
,UDim2.new(0.5,0,0,12)local r,s,t,u,v,w,x,y,z=UDim2.new(0.5,0,0,p.Y.Offset+n.Y.Offset+12),TweenInfo.new(0.2,Enum.
EasingStyle.Quint,Enum.EasingDirection.Out),320,41,0.55,0.55,0.04,8,2 local function A(B):UDim2 local C=j.workspace.
CurrentCamera return e.fit(C and C.ViewportSize,B)end local B,C={'TopLeftRadius','TopRightRadius','BottomLeftRadius',
'BottomRightRadius'},(function()return(pcall(function()local B=Instance.new'UICorner'B.TopLeftRadius=UDim.new(0,1)B:
Destroy()end))end)()local function D(E)return if E==false then f.top else f.sidebar end local E={WindowColor=true,
ElementGradient=true,ElementStrokeGradient=true,TabBackground=true,TabStroke=true,SliderProgress=true}local function F(G
,H)if E[G]and typeof(H)=='Color3'then return ColorSequence.new(H)end return H end local function G(H)return if typeof(H)
=='ColorSequence'then H.Keypoints[1].Value else H end local function H(I,J)local K=I._toastsTop if not K then return end
local L=if I._collapsedShown then r else q if not J or K.Position==L then K.Position=L return end j.tweenService:Create(
K,s,{Position=L}):Play()end local function I(J,K)local L=0.299*J.R+0.587*J.G+0.114*J.B local M=if L>0.5 then Color3.new(
0,0,0)else Color3.new(1,1,1)return J:Lerp(M,K)end local function J(K,L)if L.ElementGradient then local M=G(K.
ElementGradient)if L.ElementStroke==nil then K.ElementStroke=I(M,0.28)end if L.ElementStrokeGradient==nil then K.
ElementStrokeGradient=ColorSequence.new(I(M,0.4))end if L.ElementStrokeHover==nil then K.ElementStrokeHover=I(M,0.52)end
end if L.TabBackground and L.TabStroke==nil then K.TabStroke=ColorSequence.new(I(G(K.TabBackground),0.4))end end
local function K(L)if typeof(L)=='table'then return L elseif typeof(L)=='string'then local M=k:FindFirstChild(string.
lower(L))if M then return ac(M)end c.warn("Rayfield: unknown theme '"..L.."', using default")elseif L~=nil then c.warn
[[Rayfield: invalid theme (expected a built-in name or a theme table), using default]]end return ac(k.default)end
local function L(M)local N,O=table.clone(ac(k.default)),K(M)for P,Q in O do N[P]=F(P,Q)end if typeof(M)=='table'then J(N
,O)end local P=if typeof(M)=='table'then M else nil if not(P and(P.Font or P.font))then N.Font=j.brandFont(Enum.
FontWeight.Medium)end if not(P and(P.TitleFont or P.titleFont))then N.TitleFont=j.brandFont(Enum.FontWeight.SemiBold)end
return N end function l.new(M)M=if typeof(M)=='table'then M else{}if M.translations or M.Translations then b.register(M.
translations or M.Translations)end if M.translator or M.Translator then b.translator=M.translator or M.Translator end b.
setActive(M.locale or M.Locale or b.detect())local N=M.fallbackFont or M.FallbackFont if N then j.setFallbackFont(N)end
local O=M.sidebarLayout if O==nil then O=M.SidebarLayout end local P=D(O)local Q=setmetatable({name=M.name or M.Name or
'Rayfield Window',subheading=M.subtitle or M.Subtitle,layout=P,size=A(P.mode),instances={},connections={},icon=M.icon or
M.Icon,showName=M.showName or M.ShowName or'Rayfield',showIcon=M.showIcon or M.ShowIcon or ai.icons.rayfield,
showIconOnly=M.showIconOnly or M.ShowIconOnly or false,profileText=M.profile or M.Profile,resizable=not(M.resizable==
false or M.Resizable==false),themeProperties={},localeProperties={},tabs={},tabSections={},tags={},selectedTab=nil,theme
=L(M.theme or M.Theme),controls={},configuration=(function()local Q=M.configuration or M.Configuration if not Q then
return{}end return{autoSave=Q.autoSave or Q.AutoSave,autoLoad=Q.autoLoad or Q.AutoLoad,fileName=Q.fileName or Q.FileName
,customFolder=Q.customFolder or Q.CustomFolder}end)()},l)Q.Flags=setmetatable({},{__index=function(R,S)local T=Q.
controls[S]return T and T.value end,__newindex=function(R,S,T)local U=Q.controls[S]if not U then c.warn(
"Rayfield: no flag '"..tostring(S).."' to set")return end U:Set(T)end,__iter=function()local R return function()local S
R,S=next(Q.controls,R)if R then return R,S.value end return nil end end})Q.settings={toggleKeybind=Enum.KeyCode.K,
mouseOverride=true,keepOnScreen=true,welcomeToast=true,haptics=true,showProfile=true}Q.screenGui=Q:Create('ScreenGui',{
Name=j.httpService:GenerateGUID(false),IgnoreGuiInset=true,ResetOnSpawn=false,Enabled=true,DisplayOrder=ai.displayOrder.
window,ZIndexBehavior=Enum.ZIndexBehavior.Global,Parent=j.guiContainer})Q.main=Q:Create('Frame',{BackgroundColor3=Color3
.fromRGB(255,255,255),Name=Q.name,ZIndex=1,AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.new(0.5,0,0.5,0),Size=UDim2.
fromOffset((Q.size.X.Offset-50),0),BackgroundTransparency=1,Visible=false,Parent=Q.screenGui})Q.drag=ac(ab.Parent.drag).
new(Q)Q.windowCorner=Q:Create('UICorner',{Parent=Q.main},{CornerRadius='CornerRoundness'})Q.windowStroke=Q:Create(
'UIStroke',{Transparency=1,Parent=Q.main},{Color='SurfaceStroke'})Q.windowGradient=Q:Create('UIGradient',{Rotation=270,
Offset=Vector2.new(0,-0.1),Parent=Q.main},{Color={'WindowColor',ag.toColorSequence}})Q.bottomFade=Q:Create('Frame',{
BackgroundColor3=Color3.fromRGB(255,255,255),BorderSizePixel=0,AnchorPoint=Vector2.new(1,1),Position=UDim2.fromScale(1,1
),Size=Q.layout.fadeSize,ZIndex=ai.zIndex.bottomFade,BackgroundTransparency=1,Parent=Q.main})Q.bottomFadeCorner=Q:
_roundCorners(Q.bottomFade,Q.layout.fadeCorners)Q.bottomFadeGradient=Q:Create('UIGradient',{Rotation=270,Offset=Vector2.
new(0,0.2),Transparency=Q.layout.fadeTransparency,Parent=Q.bottomFade},{Color={'WindowColor',function(R)return
ColorSequence.new(ag.toColorSequence(R).Keypoints[1].Value)end}})Q.topbar=Q:Create('Frame',{BackgroundTransparency=1,
Size=UDim2.new(1,0,0,Q.layout.topbarHeight),Active=true,Parent=Q.main})Q.topContainer=Q:Create('Frame',{Size=UDim2.new(0
,300,0,24),Position=UDim2.new(0,25,0.5,0),AutomaticSize=Enum.AutomaticSize.Y,AnchorPoint=Vector2.new(0,0.5),
BackgroundTransparency=1,Parent=Q.topbar})Q.topContainerLayout=Q:Create('UIListLayout',{Padding=UDim.new(0,8),
FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.
HorizontalAlignment.Left,SortOrder=Enum.SortOrder.LayoutOrder,Parent=Q.topContainer})Q.titleContainer=Q:Create('Frame',{
Size=UDim2.fromOffset(50,24),Position=UDim2.new(0,25,0.5,0),AutomaticSize=Enum.AutomaticSize.XY,AnchorPoint=Vector2.new(
0,0.5),BackgroundTransparency=1,LayoutOrder=1,Parent=Q.topContainer})Q.titleContainerLayout=Q:Create('UIListLayout',{
Padding=UDim.new(0,3),FillDirection=Enum.FillDirection.Vertical,VerticalAlignment=Enum.VerticalAlignment.Center,
SortOrder=Enum.SortOrder.LayoutOrder,Parent=Q.titleContainer})if Q.name then Q.title=Q:Create('TextLabel',{Text=b.t(Q.
name),FontFace=j.brandFont(Enum.FontWeight.Medium),Size=UDim2.fromOffset(50,20),AutomaticSize=Enum.AutomaticSize.X,
BackgroundTransparency=1,TextSize=20,TextXAlignment=Enum.TextXAlignment.Left,TextWrapped=true,TextTransparency=1,Parent=
Q.titleContainer},{FontFace='Font',TextColor3='TitlingColor'})end if Q.icon then Q.topbarIcon=Q:Create('ImageLabel',{
Image=Q.icon,BackgroundTransparency=1,Size=UDim2.fromOffset(32,32),ImageTransparency=1,Parent=Q.topContainer},{
ImageColor3='TitlingColor'})end if Q.subheading then Q.subtitle=Q:Create('TextLabel',{Text=b.t(Q.subheading),Size=UDim2.
fromOffset(50,12),AutomaticSize=Enum.AutomaticSize.X,BackgroundTransparency=1,TextSize=12,TextXAlignment=Enum.
TextXAlignment.Left,TextWrapped=true,TextTransparency=1,Parent=Q.titleContainer},{TextColor3='TitlingColor',FontFace=
'Font'})end Q.tagContainer=Q:Create('Frame',{AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,25,0.5,0),Size=UDim2.
fromOffset(50,24),AutomaticSize=Enum.AutomaticSize.XY,BackgroundTransparency=1,LayoutOrder=2,Visible=false,Parent=Q.
topContainer})Q.tagContainerLayout=Q:Create('UIListLayout',{Padding=UDim.new(0,5),FillDirection=Enum.FillDirection.
Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,Parent=Q.tagContainer})Q
.windowShadow=Q:CreateGlow(Q.main,'ShadowColor',20,1)Q.elements=Q:Create('Frame',{Size=UDim2.new(1,0,1,-Q.layout.
chromeHeight),Position=UDim2.fromScale(1,1),AnchorPoint=Vector2.new(1,1),BackgroundColor3=Color3.fromRGB(255,255,255),
BorderSizePixel=0,BackgroundTransparency=1,ClipsDescendants=true,Parent=Q.main})if Q.layout.mode=='sidebar'then Q.
elementsCorner=Q:_roundCorners(Q.elements,Q.layout.cardCorners)Q.elementsStroke=Q:Create('UIStroke',{ApplyStrokeMode=
Enum.ApplyStrokeMode.Border,Transparency=1,Parent=Q.elements},{Color='SurfaceStroke'})Q:Create('UIGradient',{Rotation=Q.
layout.cardStrokeRotation,Transparency=Q.layout.cardStrokeTransparency,Parent=Q.elementsStroke})end Q.elementsLayout=Q:
Create('UIPageLayout',{Padding=UDim.new(0,0),FillDirection=Q.layout.pageDirection,VerticalAlignment=Enum.
VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,
ScrollWheelInputEnabled=false,GamepadInputEnabled=false,TouchInputEnabled=false,EasingStyle=Enum.EasingStyle.Exponential
,TweenTime=0.4,Parent=Q.elements})if Q.layout.mode=='sidebar'then i.build(Q,Q.layout)i.applyWidth(Q,f.railWidthFor(Q.
layout,Q.size.X.Offset))else Q.tabList=Q:Create('ScrollingFrame',{Name='Tabs',Active=true,Size=UDim2.new(1,0,0,Q.layout.
tabStripHeight),Position=UDim2.new(0.5,0,0,Q.layout.tabStripTop),AnchorPoint=Vector2.new(0.5,0),BackgroundTransparency=1
,AutomaticCanvasSize=Enum.AutomaticSize.X,CanvasSize=UDim2.new(0,0,0,0),ScrollBarThickness=0,ScrollBarImageTransparency=
1,ScrollingDirection=Enum.ScrollingDirection.X,Parent=Q.main})Q.tabListLayout=Q:Create('UIListLayout',{Padding=UDim.new(
0,7),FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=
Enum.HorizontalAlignment.Left,SortOrder=Enum.SortOrder.LayoutOrder,Parent=Q.tabList})Q:Create('UIPadding',{PaddingLeft=
UDim.new(0,22),PaddingRight=UDim.new(0,10),Parent=Q.tabList})end Q.actionContainer=Q:Create('Frame',{AnchorPoint=Vector2
.new(1,0.5),AutomaticSize=Enum.AutomaticSize.X,Size=UDim2.fromOffset(0,24),Position=UDim2.new(1,-20,0.5,0),
BackgroundTransparency=1,Parent=Q.topbar})Q.actionsListLayout=Q:Create('UIListLayout',{Padding=UDim.new(0,5),
FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.
HorizontalAlignment.Right,SortOrder=Enum.SortOrder.LayoutOrder,Parent=Q.actionContainer})Q.rfSettings=Q:CreateTab{name=
'Rayfield Settings',customOrder=1000,neglectSelector=true,forgetState=true}ac(ab.Parent.action).new(Q,{name='Close',icon
=ai.icons.close,order=1,callback=function()Q:ToggleHide()end})Q.minimiseAction=ac(ab.Parent.action).new(Q,{name=
'Minimise',icon=ai.icons.minimise,order=2,callback=function()Q:ToggleMinimise()end})Q.settingsAction=ac(ab.Parent.action
).new(Q,{name='Settings',icon=ai.icons.settings,order=3,linkedTab=Q.rfSettings,callback=function()Q.rfSettings:Select()
end})h.build(Q)Q:_applyRailWidth()Q.unloaded=false Q.minimised=false Q.hidden=true Q.animating=false Q._revealing=false
Q.hasShownOnce=false Q._collapsedShown=false Q:LoadSettings()if Q.layout.mode=='sidebar'then i.reflowProfile(Q)i.
setSubtitle(Q,Q.profileText)end d.setContainer(Q.screenGui)d.setEnabled(Q.settings.haptics)g.buildCollapsedFace(Q)Q:
_bindKeybind()Q:_bindMouseOverride()Q:_bindTopbarDrag()Q:_bindResize()Q:_watchViewport()Q:_buildSettingsUI()Q:
_syncLiveAnimation()return Q end function l._syncLiveAnimation(M)if not M.theme.LiveAnimation then M._liveAnimating=
false return end if M._liveAnimating then return end M._liveAnimating=true M._liveGeneration=(M._liveGeneration or 0)+1
local N=M._liveGeneration task.spawn(function()local O,P=true,TweenInfo.new(10,Enum.EasingStyle.Quint,Enum.
EasingDirection.Out)while M._liveGeneration==N and M._liveAnimating and not M.unloaded do local Q=j.tweenService:Create(
M.windowGradient,P,{Offset=Vector2.new(if O then 0.4 else-0.2,0),Rotation=(if O then 220 else 280)})M._liveTween=Q Q:
Play()Q.Completed:Wait()O=not O end if M._liveGeneration==N then M._liveAnimating=false M._liveTween=nil end end)end
function l.ChangeTheme(M,N)local O=if typeof(N)=='table'then N else L(N)for P,Q in O do M.theme[P]=F(P,Q)end if typeof(N
)=='table'then J(M.theme,O)end for P,Q in M.themeProperties do for R,S in Q do local T=if typeof(S)=='table'then S[2](M.
theme[S[1] ])else M.theme[S]if typeof(T)=='Color3'or typeof(T)=='number'then j.tweenService:Create(P,TweenInfo.new(0.5,
Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{[R]=T}):Play()else P[R]=T end end end if M.hidden then M.
_themeRefreshPending=true else M:_refreshElementThemes()end M:_syncLiveAnimation()end function l._refreshElementThemes(M
)for N,O in M.tabs do for P,Q in O.elements do if Q._refreshTheme then Q:_refreshTheme()end end end end function l.
CreateTab(M,N)assert(not M.unloaded,'Cannot create a tab on an unloaded window.')local O=ac(ab.Parent.tab).new(M,N)table
.insert(M.tabs,O)if not O.neglectSelector then local P=true for Q,R in M.tabs do if R~=O and not R.neglectSelector then
P=false break end end if P then O:Select(true)end if not M.hidden and not M.minimised then O.topbarItem.Visible=true O:
_applyVisual(if M.selectedTab==O then'selected'else'unselected',TweenInfo.new(0.4,Enum.EasingStyle.Quint,Enum.
EasingDirection.Out))end end return O end function l.CreateSection(M,N)assert(not M.unloaded,
'Cannot create a section on an unloaded window.')local O=ac(ab.Parent.tabSection).new(M,N)table.insert(M.tabSections,O)
if not O.inert and not M.hidden and not M.minimised then O:_setVisible(true)O:_setShown(true,TweenInfo.new(0.4,Enum.
EasingStyle.Quint,Enum.EasingDirection.Out))end return O end function l._setTabSectionsShown(M,N,O)for P,Q in M.
tabSections do Q:_setShown(N,O)end end function l._setTabSectionsVisible(M,N)for O,P in M.tabSections do P:_setVisible(N
)end end function l.CreateTag(M,N)assert(not M.unloaded,'Cannot create a tag on an unloaded window.')local O=ac(ab.
Parent.tag).new(M,N)table.insert(M.tags,O)return O end function l._registerControl(M,N)if not N.flag or N.flag==''or N.
forgetState then return end local O=N.flag if M.controls[O]then local P=2 while M.controls[O..P]do P+=1 end O=O..P c.
warn("Rayfield: duplicate config flag '"..N.flag.."', saving this one as '"..O..
"'. Set a unique flag to keep it stable across sessions.")end N.flag=O M.controls[O]=N return O end function l.
_restoreLate(M,N)if not M._loadedConfig or not N.flag or N.forgetState then return end local O=M._loading M._loading=
true ah.applyTo(N,M._loadedConfig[N.flag])M._loading=O end function l._persist(M,N)if N.flag and not N.forgetState and M
.configuration.autoSave and not M._loading then task.spawn(M.Save,M)end end function l._unregisterControl(M,N)if N.flag
and M.controls[N.flag]==N then M.controls[N.flag]=nil end end function l._keybindUsing(M,N,O)if typeof(N)~='EnumItem'or
N==Enum.KeyCode.Unknown then return nil end for P,Q in M.tabs do for R,S in Q.elements do if S~=O and S.__type==
'Keybind'and S.value==N then return S end end end return nil end function l.Notify(M,N)if M.unloaded then return end if
not M.notifications then M.notifications=M:Create('Frame',{Name='Notifications',Size=UDim2.new(0,300,0,800),Position=
UDim2.new(1,-20,1,-20),AnchorPoint=Vector2.new(1,1),BackgroundTransparency=1,Parent=M.screenGui})M:Create('UIListLayout'
,{FillDirection=Enum.FillDirection.Vertical,VerticalAlignment=Enum.VerticalAlignment.Bottom,HorizontalAlignment=Enum.
HorizontalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,0),Parent=M.notifications})end return
ac(ab.Parent.notification).new(M,N)end function l.Toast(M,N)if M.unloaded then return end N=if typeof(N)=='table'then N
else{}local O=N.position or N.Position or'Top'local P=typeof(O)~='string'or O:lower()~='bottom'N.position=if P then'Top'
else'Bottom'local Q=if P then'_toastsTop'else'_toastsBottom'local R=M[Q]if not R then R=M:Create('Frame',{Name='Toasts',
Size=UDim2.new(0,t,1,-24),Position=if P then q else UDim2.new(0.5,0,1,-12),AnchorPoint=if P then Vector2.new(0.5,0)else
Vector2.new(0.5,1),BackgroundTransparency=1,ZIndex=ai.zIndex.toast,Parent=M.screenGui})M:Create('UIListLayout',{
FillDirection=Enum.FillDirection.Vertical,VerticalAlignment=if P then Enum.VerticalAlignment.Top else Enum.
VerticalAlignment.Bottom,HorizontalAlignment=Enum.HorizontalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,
Padding=UDim.new(0,0),Parent=R})M[Q]=R if P then H(M,false)end end return ac(ab.Parent.toast).new(M,N,R)end function l.
Popup(M,N)if M.unloaded then return end return ac(ab.Parent.popup).new(M,N)end function l.Hide(M)if M.animating or M.
hidden then return end if M._searching then h.close(M,{showTabs=false,jumpTo=M.selectedTab and M.selectedTab.tabPage})
end if M._recordingKeybind then M._recordingKeybind:_stopRecording()end M.animating=true M._revealing=true M.hidden=true
M.collapsedInteract.Visible=false if M.minimised then M.minimised=false af.assign(M.minimiseAction.iconLabel,'Image',ai.
icons.minimise)end M._restorePosition=M.main.Position local N,O=M:_collapsedRect()local P,Q,R,S=TweenInfo.new(0.18,Enum.
EasingStyle.Quint,Enum.EasingDirection.Out),TweenInfo.new(0.35,Enum.EasingStyle.Exponential,Enum.EasingDirection.InOut),
TweenInfo.new(0.35,Enum.EasingStyle.Exponential,Enum.EasingDirection.InOut),TweenInfo.new(0.2,Enum.EasingStyle.Quint,
Enum.EasingDirection.Out)j.tweenService:Create(M.drag.dragCosmetic,P,{Size=UDim2.fromOffset(0,4),BackgroundTransparency=
1}):Play()task.delay(0.18,function()if not M.hidden then return end M.drag.drag.Visible=false end)M:_fadeSurfaces(false,
P)if M.title then j.tweenService:Create(M.title,P,{TextTransparency=1}):Play()end if M.subtitle then j.tweenService:
Create(M.subtitle,P,{TextTransparency=1}):Play()end if M.topbarIcon then j.tweenService:Create(M.topbarIcon,P,{
ImageTransparency=1}):Play()end for T,U in ipairs(M.actionContainer:GetChildren())do if U:IsA'Frame'then j.tweenService:
Create(U.ImageLabel,P,{ImageTransparency=1}):Play()end end for T,U in M.tags do U:_setShown(false,P)end for T,U in
pairs(M.tabs)do if not U.neglectSelector and U.topbarItem then U:_applyVisual('hidden',P)end end M:_setTabSectionsShown(
false,P)M:_fadeSelectedElementsOut()local T=j.tweenService:Create(M.main,Q,{Size=O,Position=N})T.Completed:Connect(
function()if M.unloaded or not M.hidden then return end M._collapsedShown=true H(M,true)M.collapsedInteract.Visible=true
M.animating=false M._revealing=false end)T:Play()j.tweenService:Create(M.windowCorner,R,{CornerRadius=UDim.new(1,0)}):
Play()task.delay(0.18,function()if not M.hidden then return end M.topbar.Visible=false M:_setContentVisible(false)g.
setCollapsedShown(M,true,S)end)end function l.ToggleHide(M)if M.animating then return end if M.hidden then M:Show()else
M:Hide()end end function l.ToggleMinimise(M)if M.animating or M.hidden then return end if M._searching then h.close(M,{
showTabs=true})end M.animating=true local N,O=TweenInfo.new(0.5,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),
TweenInfo.new(0.4,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out)if M.minimised then M.minimised=false af.assign(
M.minimiseAction.iconLabel,'Image',ai.icons.minimise)j.tweenService:Create(M.main,N,{Size=M.size}):Play()M:
_fadeSurfaces(true,O)j.tweenService:Create(M.drag.drag,N,{Position=UDim2.new(M.main.Position.X.Scale,M.main.Position.X.
Offset,M.main.Position.Y.Scale,M.main.Position.Y.Offset+M.size.Y.Offset/2+15)}):Play()task.delay(0.2,function()if M.
minimised or M.hidden then return end M:_setContentVisible(true)for P,Q in pairs(M.tabs)do if not Q.neglectSelector and
Q.topbarItem then Q.topbarItem.Visible=true Q:_applyVisual(if M.selectedTab==Q then'selected'else'unselected',O)end end
M:_setTabSectionsVisible(true)M:_setTabSectionsShown(true,O)M:_revealElements(0.035,0.4)end)task.delay(0.5,function()M.
animating=false end)else M.minimised=true af.assign(M.minimiseAction.iconLabel,'Image',ai.icons.maximise)M:
_fadeSelectedElementsOut()for P,Q in pairs(M.tabs)do if not Q.neglectSelector and Q.topbarItem then Q:_applyVisual(
'hidden',O)end end M:_setTabSectionsShown(false,O)task.delay(0.3,function()if not M.minimised then return end M:
_setContentVisible(false)for P,Q in pairs(M.tabs)do if not Q.neglectSelector and Q.topbarItem then Q.topbarItem.Visible=
false end end M:_setTabSectionsVisible(false)end)M:_fadeSurfaces(false,O)j.tweenService:Create(M.main,N,{Size=UDim2.
fromOffset(M.size.X.Offset,M.layout.topbarHeight)}):Play()j.tweenService:Create(M.drag.drag,N,{Position=UDim2.new(M.main
.Position.X.Scale,M.main.Position.X.Offset,M.main.Position.Y.Scale,M.main.Position.Y.Offset+M.layout.topbarHeight/2+15)}
):Play()task.delay(0.5,function()M.animating=false end)end end function l._syncDragBar(M)local N=M.drag and M.drag.drag
if not N then return end local O,P=M.main.Position,M.size.Y.Offset/2+15 N.Position=UDim2.new(O.X.Scale,O.X.Offset,O.Y.
Scale,O.Y.Offset+P)end function l._clampedPosition(M,N:UDim2):UDim2 if not M.settings or not M.settings.keepOnScreen
then return N end if N.X.Scale~=0 or N.Y.Scale~=0 then return N end local O,P,Q,R=M.screenGui.AbsoluteSize,M.size.X.
Offset/2,M.size.Y.Offset/2,8 local S,T=math.clamp(N.X.Offset,P+R,math.max(P+R,O.X-P-R)),math.clamp(N.Y.Offset,Q+R,math.
max(Q+R,O.Y-Q-R))if S==N.X.Offset and T==N.Y.Offset then return N end return UDim2.fromOffset(S,T)end function l.
_clampToScreen(M)M.main.Position=M:_clampedPosition(M.main.Position)end function l._applyWindowSize(M)if M.unloaded then
return end if M._userSized then if not(M.hidden or M.minimised or M.animating or M._revealing)then M:_clampToScreen()M:
_syncDragBar()end return end local N=A(M.layout.mode)local O=N~=M.size M.size=N M:_applyRailWidth()if M.hidden or M.
minimised or M.animating or M._revealing then M._pendingResize=M._pendingResize or O return end if not O and not M.
_pendingResize then return end M._pendingResize=false M.main.Size=N M:_clampToScreen()M:_syncDragBar()end function l.
_applyRailWidth(M)if M.layout.mode~='sidebar'then return end i.applyWidth(M,f.railWidthFor(M.layout,M.size.X.Offset))end
function l._watchViewport(M)local N,O:RBXScriptConnection?=false local function P()if N then return end N=true task.
defer(function()N=false M:_applyWindowSize()end)end local function Q()if O then M:Disconnect(O)O=nil end local R=j.
workspace.CurrentCamera if R then O=M:Connect(R:GetPropertyChangedSignal'ViewportSize',P)end P()end M:Connect(j.
workspace:GetPropertyChangedSignal'CurrentCamera',Q)Q()local R=0 M:Connect(j.runService.Heartbeat,function(S:number)R+=S
if R<z then return end R=0 M:_applyWindowSize()end)end function l._bindKeybind(M)M:Connect(j.userInputService.InputBegan
,function(N,O)if O or M._recordingKeybind then return end if N.KeyCode==M.settings.toggleKeybind or N.UserInputType==M.
settings.toggleKeybind then M:ToggleHide()end end)end function l._bindMouseOverride(M)local N=j.userInputService
local function O()return M.settings.mouseOverride and not M.hidden and not M.minimised end local function P()if not O()
then return end if N:IsMouseButtonPressed(Enum.UserInputType.MouseButton2)then return end if N.MouseBehavior~=Enum.
MouseBehavior.Default then N.MouseBehavior=Enum.MouseBehavior.Default end if not N.MouseIconEnabled then N.
MouseIconEnabled=true end end M:Connect(N:GetPropertyChangedSignal'MouseBehavior',P)M:Connect(N:GetPropertyChangedSignal
'MouseIconEnabled',P)M:Connect(N.InputEnded,function(Q)if Q.UserInputType==Enum.UserInputType.MouseButton2 then P()end
end)M._freeMouse=P end function l._bindTopbarDrag(M)local N,O,P,Q=j.userInputService,false,Vector2.zero,Vector2.zero if
M.screenGui and M.screenGui.IgnoreGuiInset then Q=j.guiService:GetGuiInset()end local function R()local S=N:
GetMouseLocation()+P+Q local T,U=S.X,S.Y if M.settings and M.settings.keepOnScreen then local V,W,X=M.main.AbsoluteSize,
M.screenGui.AbsoluteSize,8 local Y,Z=V.X/2,V.Y/2 T=math.clamp(T,Y+X,math.max(Y+X,W.X-Y-X))U=math.clamp(U,Z+X,math.max(Z+
X,W.Y-Z-X))end return UDim2.fromOffset(T,U)end local function S(T,U)for V,W in{M.tabList,M.actionContainer}do local X,Y=
W.AbsolutePosition,W.AbsoluteSize if T>=X.X and T<=X.X+Y.X and U>=X.Y and U<=X.Y+Y.Y then return true end end return
false end M:Connect(M.topbar.InputBegan,function(T,U)if U then return end local V=T.UserInputType.Name if V~=
'MouseButton1'and V~='Touch'then return end if S(T.Position.X,T.Position.Y)then return end if not M:_interactive()then
return end O=true if M.screenGui and M.screenGui.IgnoreGuiInset then Q=j.guiService:GetGuiInset()end P=M.main.
AbsolutePosition+M.main.AbsoluteSize*M.main.AnchorPoint-N:GetMouseLocation()end)M:Connect(N.InputEnded,function(T)local
U=T.UserInputType.Name if U=='MouseButton1'or U=='Touch'then O=false end end)M:Connect(N.WindowFocusReleased,function()O
=false end)M:Connect(j.runService.RenderStepped,function()if not O then return end if not M:_interactive()then O=false
return end M.main.Position=R()if M.drag and M.drag.drag then local T=M.main.Position M.drag.drag.Position=UDim2.new(T.X.
Scale,T.X.Offset,T.Y.Scale,T.Y.Offset+(M.main.Size.Y.Offset/2+15))end end)end function l._bindResize(M)if not M.
resizable then return end M.resize=ac(ab.Parent.resize).new(M)end function l._buildSettingsUI(M)M.rfSettings:
CreateSection{name='General'}M.rfSettings:CreateKeybind{name='Toggle Keybind',icon=ai.icons.search,value=M.settings.
toggleKeybind,isMenuToggle=true,onChanged=function(N)M.settings.toggleKeybind=N M:SaveSettings()end}M.rfSettings:
CreateToggle{name='Unlock cursor while open',description=
[[Unlocks the cursor while the menu is open so you can configure in FPS games that lock it.]],value=M.settings.
mouseOverride,callback=function(N)M.settings.mouseOverride=N M:SaveSettings()end}M.rfSettings:CreateToggle{name=
'Welcome toast',description=[[Shows a 'Signed in as' toast the first time you open the menu on a new account.]],value=M.
settings.welcomeToast,callback=function(N)M.settings.welcomeToast=N M:SaveSettings()end}M.rfSettings:CreateToggle{name=
'Haptics',description=[[A subtle tap as you interact, on devices that support haptics.]],value=M.settings.haptics,
callback=function(N)M.settings.haptics=N d.setEnabled(N)M:SaveSettings()end}M.rfSettings:CreateSection{name='Window'}if
M.layout.mode=='sidebar'and M.profile then M.rfSettings:CreateToggle{name='Show profile',description=
[[Shows your avatar and name at the base of the sidebar. Turn it off to keep them out of a stream or a screenshot.]],
value=M.settings.showProfile,callback=function(N)i.setProfileEnabled(M,N)M:SaveSettings()end}end M.rfSettings:
CreateToggle{name='Keep window on screen',description=
[[Stops the window being dragged off the edge of the screen and lost.]],value=M.settings.keepOnScreen,callback=function(
N)M.settings.keepOnScreen=N M:SaveSettings()end}M.rfSettings:CreateButton{name='Reset Window Position',callback=function
()j.tweenService:Create(M.main,TweenInfo.new(0.5,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{Position=UDim2.
new(0.5,0,0.5,0)}):Play()j.tweenService:Create(M.drag.drag,TweenInfo.new(0.5,Enum.EasingStyle.Exponential,Enum.
EasingDirection.Out),{Position=UDim2.new(0.5,0,0.5,M.size.Y.Offset/2+15)}):Play()end}if next(M.configuration)~=nil then
M.rfSettings:CreateSection{name='Configurations'}local N,O,P=(M:ListConfigs()[1])local function Q()local R=M:
ListConfigs()O:Refresh(R)if N and not table.find(R,N)then N=R[1]end if N then O:Set(N,true)end end O=M.rfSettings:
CreateDropdown{name='Saved Configurations',icon=ai.icons.config,options=M:ListConfigs(),value=N,placeholder=
'No saved configurations',callback=function(R)N=R end}P=M.rfSettings:CreateInput{name='Configuration Name',description=
[[Name a new configuration, or leave blank to overwrite the selected one.]],placeholder='e.g. PvP Loadout',clearOnFocus=
false}local R=M.rfSettings:CreateGroup()R:CreateButton{name='Save',icon=ai.icons.config,callback=function()local S=P.
value if S==''then S=N end if not S or S==''then M:Toast{title=b.resolve'Name your configuration first'}return end if M:
Save(S)then P:Set''N=S Q()M:Toast{title=b.resolve'Saved configuration',subtitle=S,icon=ai.icons.config}else M:Toast{
title=b.resolve"Couldn't save configuration",subtitle=S}end end}R:CreateButton{name='Load',callback=function()if not N
or N==''then M:Toast{title=b.resolve'Pick a configuration to load'}return end if M:_applyNamedConfig(N)then M:Toast{
title=b.resolve'Loaded configuration',subtitle=N}else M:Toast{title=b.resolve"Couldn't load configuration",subtitle=N}
end end}R:CreateButton{name='Delete',callback=function()local S=N if not S or S==''then M:Toast{title=b.resolve
'Pick a configuration to delete'}return end if M:DeleteConfig(S)then Q()M:Toast{title=b.resolve'Deleted configuration',
subtitle=S}else M:Toast{title=b.resolve"Couldn't delete configuration",subtitle=S}end end}end end function l.SetProfile(
M,N)M.profileText=N i.setSubtitle(M,N)end function l.SaveSettings(M)return ah.saveSettings(M)end function l.LoadSettings
(M)return ah.loadSettings(M)end function l._roundCorners(M,N,O)if not O or not C then return M:Create('UICorner',{Parent
=N},{CornerRadius='CornerRoundness'})end local P,Q={Parent=N},{}for R,S in B do P[S]=UDim.new(0,0)end for R,S in O do P[
S]=nil Q[S]='CornerRoundness'end return M:Create('UICorner',P,Q)end function l._setElementLocked(M,N,O,P)O=O==true local
Q=N.locked==true if Q==O and not(O and P)then return end N.locked=O if not N.lockScrim then M:_buildLockScrim(N)end
local R=TweenInfo.new(0.25,Enum.EasingStyle.Quint,Enum.EasingDirection.Out)if O then N.lockScrim.Visible=true end j.
tweenService:Create(N.lockScrim,R,{BackgroundTransparency=if O then v else 1}):Play()if not O then task.delay(R.Time,
function()if not N.locked and N.lockScrim then N.lockScrim.Visible=false end end)end local S=N.descriptor if not S then
return end if O then N._descriptionBefore=N._descriptionBefore or S.titleLabel.Text S.titleLabel.Text=b.resolve(P or
'This element is locked.')elseif N._descriptionBefore then S.titleLabel.Text=N._descriptionBefore N._descriptionBefore=
nil end j.tweenService:Create(S.titleLabel,R,{TextTransparency=if O then w else 0.7}):Play()end function l.
_buildLockScrim(M,N)N.lockScrim=M:Create('TextButton',{Name='ElementLock',Active=true,AutoButtonColor=false,Size=UDim2.
fromScale(1,1),BorderSizePixel=0,Text='',TextTransparency=1,ZIndex=ai.zIndex.elementLock,Visible=false,
BackgroundTransparency=1,Parent=N.main},{BackgroundColor3={'WindowColor',G}})M:Create('UICorner',{Parent=N.lockScrim},{
CornerRadius='ElementCornerRadius'})end function l._setContentVisible(M,N)M.elements.Visible=N M.tabList.Visible=N if M.
sidebar then M.sidebar.Visible=N end end function l._fadeSurfaces(M,N,O)local P={[M.windowShadow]={Transparency=if N
then 0.6 else 1},[M.windowStroke]={Transparency=if N then 0.95 else 1},[M.bottomFade]={BackgroundTransparency=if N then
0 else 1}}if M.elementsStroke then P[M.elements]={BackgroundTransparency=if N then M.layout.cardTransparency else 1}P[M.
elementsStroke]={Transparency=if N then 0 else 1}end for Q,R in P do if O then j.tweenService:Create(Q,O,R):Play()else
for S,T in R do Q[S]=T end end end i.setProfileShown(M,N,O)end function l._fadeSelectedElementsOut(M)if M.selectedTab
then for N,O in ipairs(M.selectedTab.elements)do O:_setShown(false,true)end end end function l._revealElements(M,N,O)for
P,Q in pairs(M.tabs)do if Q~=M.selectedTab then for R,S in ipairs(Q.elements)do S:_setShown(true,false)end end end local
P=M.selectedTab if not P then return end local Q=P.tabPage local R=Q.AbsolutePosition.Y local S,T,U=R+Q.
AbsoluteWindowSize.Y,math.floor(O/N),0 for V,W in ipairs(P.elements)do local X=W.main.AbsolutePosition.Y local Y=(X+W.
main.AbsoluteSize.Y)>R and X<S if Y then W:_setShown(true,true)U+=1 if U<=T then task.wait(N)end else W:_setShown(true,
false)end end end function l.Show(M)if M.animating or not M.hidden then return end M.animating=true M._revealing=true if
M.configuration.autoLoad and not M._autoLoaded then M._autoLoaded=true local N,O=pcall(M.Load,M)if not N then c.warn(
'Rayfield: Failed to load configuration - '..tostring(O))end end M.hidden=false M.minimised=false if M.
_themeRefreshPending then M._themeRefreshPending=false M:_refreshElementThemes()end M.collapsedInteract.Visible=false if
M._freeMouse then M._freeMouse()end if M.hasShownOnce then M:_quickRestore()else M.hasShownOnce=true M:_firstShow()end
end function l._quickRestore(M)local N=M:_clampedPosition(M._restorePosition or UDim2.new(0.5,0,0.5,0))M.
_restorePosition=N local O,P,Q=TweenInfo.new(0.35,Enum.EasingStyle.Exponential,Enum.EasingDirection.InOut),TweenInfo.
new(0.35,Enum.EasingStyle.Exponential,Enum.EasingDirection.InOut),TweenInfo.new(0.28,Enum.EasingStyle.Exponential,Enum.
EasingDirection.Out)g.setCollapsedShown(M,false,TweenInfo.new(0.15,Enum.EasingStyle.Quint,Enum.EasingDirection.Out))
local R=j.tweenService:Create(M.main,O,{Size=M.size,Position=N})R.Completed:Connect(function()if M.hidden or M.unloaded
then return end M._collapsedShown=false H(M,true)end)R:Play()j.tweenService:Create(M.windowCorner,P,{CornerRadius=M.
theme.CornerRoundness}):Play()task.delay(0.22,function()M.topbar.Visible=true M:_setContentVisible(true)M:_fadeSurfaces(
true,Q)if M.topbarIcon then j.tweenService:Create(M.topbarIcon,Q,{ImageTransparency=0}):Play()end if M.title then j.
tweenService:Create(M.title,Q,{TextTransparency=0}):Play()end if M.subtitle then j.tweenService:Create(M.subtitle,Q,{
TextTransparency=0.7}):Play()end for S,T in ipairs(M.actionContainer:GetChildren())do if T:IsA'Frame'then j.tweenService
:Create(T.ImageLabel,Q,{ImageTransparency=0.6}):Play()end end if M.settingsAction and M.selectedTab==M.rfSettings then j
.tweenService:Create(M.settingsAction.iconLabel,Q,{ImageTransparency=0.2}):Play()end for S,T in M.tags do T:_setShown(
true,Q)end for S,T in pairs(M.tabs)do if not T.neglectSelector and T.topbarItem then T.topbarItem.Visible=true T:
_applyVisual(if M.selectedTab==T then'selected'else'unselected',Q)end end M:_setTabSectionsVisible(true)M:
_setTabSectionsShown(true,Q)M:_revealElements(0.035,0.4)end)task.delay(0.22,function()M.drag.drag.Position=UDim2.new(N.X
.Scale,N.X.Offset,N.Y.Scale,N.Y.Offset+M.size.Y.Offset/2+15)M.drag.dragCosmetic.Size=UDim2.fromOffset(0,4)M.drag.
dragCosmetic.BackgroundTransparency=1 M.drag.drag.Visible=true j.tweenService:Create(M.drag.dragCosmetic,O,{Size=UDim2.
fromOffset(100,4),BackgroundTransparency=0.7}):Play()end)task.delay(0.6,function()M.animating=false M._revealing=false
end)end function l._firstShow(M)M:_setContentVisible(true)M.drag.drag.Visible=false M.main.Visible=true j.tweenService:
Create(M.main,TweenInfo.new(1,Enum.EasingStyle.Exponential,Enum.EasingDirection.InOut),{BackgroundTransparency=0,Size=M.
size}):Play()task.wait(0.85)M:_fadeSurfaces(true,TweenInfo.new(0.6,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out
))task.wait(0.3)if M.icon then j.tweenService:Create(M.topbarIcon,TweenInfo.new(0.6,Enum.EasingStyle.Exponential,Enum.
EasingDirection.Out),{ImageTransparency=0}):Play()end if M.title then j.tweenService:Create(M.title,TweenInfo.new(0.4,
Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{TextTransparency=0}):Play()end task.wait(0.1)if M.subtitle then
j.tweenService:Create(M.subtitle,TweenInfo.new(0.4,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{
TextTransparency=0.7}):Play()end for N,O in ipairs(M.actionContainer:GetChildren())do if O:IsA'Frame'then task.wait(0.02
)j.tweenService:Create(O.ImageLabel,TweenInfo.new(0.4,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{
ImageTransparency=0.6}):Play()end end for N,O in M.tags do O:_setShown(true,TweenInfo.new(0.4,Enum.EasingStyle.
Exponential,Enum.EasingDirection.Out))end task.wait(0.2)task.spawn(function()local N=TweenInfo.new(0.4,Enum.EasingStyle.
Quint,Enum.EasingDirection.Out)M:_setTabSectionsVisible(true)M:_setTabSectionsShown(true,N)local O=0 for P,Q in pairs(M.
tabs)do if not Q.neglectSelector then Q.topbarItem.Visible=true Q:_applyVisual(if M.selectedTab==Q then'selected'else
'unselected',N)Q:_spinGradients()O+=1 if O<=y then task.wait(x)end end end end)M:_revealElements(0.03,2)task.wait(1)M:
_syncDragBar()M.drag.drag.Visible=true j.tweenService:Create(M.drag.dragCosmetic,TweenInfo.new(0.6,Enum.EasingStyle.
Exponential,Enum.EasingDirection.Out),{BackgroundTransparency=0.7}):Play()j.tweenService:Create(M.drag.dragCosmetic,
TweenInfo.new(1,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{Size=UDim2.fromOffset(100,4)}):Play()M.animating
=false M._revealing=false local N=j.localPlayer if N and M.settings.welcomeToast and g.isNewUser()then M:Toast{title=N.
DisplayName,subtitle=b.resolve'Signed in as',subtitleAbove=true,avatar=N.UserId,minWidth=220}end end function l.GetPath(
M)return ah.getPath(M)end function l.Save(M,N)if N~=nil and(type(N)~='string'or N=='')then return false end return ah.
save(M,N)end function l.Load(M,N)if N~=nil and(type(N)~='string'or N=='')then return false end return ah.load(M,N)end
function l._applyNamedConfig(M,N)if not M:Load(N)then return false end local O,P=ah.getPath(M)M._loadedConfigPath=P M:
Save()return true end function l.ListConfigs(M)return ah.list(M)end function l.DeleteConfig(M,N)return ah.delete(M,N)end
function l.Get(M,N)local O=M.controls[N]return O and O.value end function l.Set(M,N,O)local P=M.controls[N]if not P then
return false end P:Set(O)return true end function l._jumpTo(M,N)if N then M.elementsLayout:JumpTo(N)end end function l.
Navigate(M,N)if N==nil then return end local O for P,Q in M.tabs do if Q==N or Q.name==N or Q.tabPage==N then O=Q break
end end if not O then return end O:Select()end function l.Create(M,N,O,P)assert(typeof(N)=='string',
'Invalid argument #1 (string expected)')local Q=Instance.new(N)if P and M.theme then for R,S in P do Q[R]=(if typeof(S)
=='table'then S[2](M.theme[S[1] ])else M.theme[S])end M.themeProperties[Q]=P end if O then for R,S in O do if b.isToken(
S)then M:_bindLocale(Q,R,b.sourceOf(S))else af.assign(Q,R,S)end end end table.insert(M.instances,Q)return Q end function
l._bindLocale(M,N,O,P)N[O]=b.resolve(P)local Q=M.localeProperties[N]if not Q then Q={}M.localeProperties[N]=Q end Q[O]=P
end function l.SetLocale(M,N)b.setActive(N)for O,P in M.localeProperties do for Q,R in P do O[Q]=b.resolve(R)end end end
function l.SetTranslator(M,N)b.translator=N end function l.RegisterTranslations(M,N)b.register(N)M:SetLocale(b.current)
end function l.CreateGlow(M,N,O,P,Q)local R={BlurRadius=UDim.new(0,P),Transparency=Q,ZIndex=-1,Parent=N}if typeof(O)==
'string'then return M:Create('UIShadow',R,{Color={O,function(S)return if typeof(S)=='ColorSequence'then S.Keypoints[1].
Value else S end}})end R.Color=O return M:Create('UIShadow',R)end function l._flashResult(M,N,O)local P=N.box if not P
then return end local Q,R,S,T,U,V=N.glow,N.boxStroke,O and ai.accent.on or M.theme.ErrorColor,O and ai.accent.onStroke
or M.theme.ErrorStrokeColor,TweenInfo.new(0.1,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),TweenInfo.new(0.45,Enum.
EasingStyle.Quint,Enum.EasingDirection.Out)j.tweenService:Create(P,U,{BackgroundColor3=S}):Play()if R then j.
tweenService:Create(R,U,{Color=T,Transparency=0.4}):Play()end if Q then j.tweenService:Create(Q,U,{Color=T,Transparency=
0.6}):Play()end N._flashToken=(N._flashToken or 0)+1 local W=N._flashToken task.delay(0.22,function()if N._flashToken~=W
then return end j.tweenService:Create(P,V,{BackgroundColor3=M.theme.FieldBackground}):Play()if R then j.tweenService:
Create(R,V,{Color=M.theme.SurfaceStroke,Transparency=0.85}):Play()end if Q then j.tweenService:Create(Q,V,{Color=M.theme
.FieldGlow,Transparency=N._glowIdle or 1}):Play()end end)end function l.CreateHoverOverlay(M,N)local O=M:Create('Frame',
{BackgroundColor3=Color3.fromRGB(255,255,255),BackgroundTransparency=1,Size=UDim2.fromScale(1,1),BorderSizePixel=0,
ZIndex=1,Parent=N})M:Create('UICorner',{Parent=O},{CornerRadius='ElementCornerRadius'})return O end function l.
_wireElementHover(M,N)local O,P=TweenInfo.new(0.25,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),M.theme M:
ConnectFor(N,N.main.MouseEnter,function()if not M:_interactive()then return end j.tweenService:Create(N.stroke,O,{
Transparency=P.ElementStrokeHoverTransparency,Color=P.ElementStrokeHover}):Play()j.tweenService:Create(N.title,O,{
TextColor3=P.ElementTextHoverColor}):Play()if N.hoverOverlay then j.tweenService:Create(N.hoverOverlay,O,{
BackgroundTransparency=0.97}):Play()end end)M:ConnectFor(N,N.main.MouseLeave,function()j.tweenService:Create(N.stroke,O,
{Transparency=P.ElementStrokeTransparency,Color=P.ElementStroke}):Play()j.tweenService:Create(N.title,O,{TextColor3=P.
ContentColor}):Play()if N.hoverOverlay then j.tweenService:Create(N.hoverOverlay,O,{BackgroundTransparency=1}):Play()end
end)end function l._runGuarded(M,N,O,...)if N.locked then return end local P=table.pack(...)task.spawn(function()local Q
,R=pcall(function()return O(table.unpack(P,1,P.n))end)if Q or N._errored then return end N._errored=true local S,T=N.
flashTarget or N.main,TweenInfo.new(0.25,Enum.EasingStyle.Quint,Enum.EasingDirection.Out)j.tweenService:Create(S,T,{
BackgroundColor3=M.theme.ErrorColor}):Play()j.tweenService:Create(N.stroke,T,{Color=M.theme.ErrorStrokeColor}):Play()if
N.title then N.title.Text=b.resolve'Error, log recorded in console.'end c.warn(`Rayfield encountered an error, with the callback for a {
N.__type} component named '{N.name}':`)c.print(R)task.wait(1)if N.title then N.title.Text=b.resolve(N.name)end j.
tweenService:Create(S,TweenInfo.new(0.4,Enum.EasingStyle.Quint,Enum.EasingDirection.In),{BackgroundColor3=Color3.
fromRGB(255,255,255)}):Play()j.tweenService:Create(N.stroke,TweenInfo.new(0.6,Enum.EasingStyle.Quint,Enum.
EasingDirection.Out),{Color=M.theme.ElementStroke}):Play()N._errored=false end)end function l.StyleElementBody(M,N)M:
Create('UIGradient',{Rotation=270,Parent=N},{Color='ElementGradient'})M:Create('UICorner',{Parent=N},{CornerRadius=
'ElementCornerRadius'})return M:Create('UIStroke',{Transparency=1,Parent=N},{Color='ElementStroke',Transparency=
'ElementStrokeTransparency'})end function l._buildCompactRow(M,N,O,P)local Q=M:Create('Frame',{Name=O,Size=UDim2.
fromOffset(0,u),AutomaticSize=Enum.AutomaticSize.X,ClipsDescendants=true,BackgroundColor3=Color3.fromRGB(255,255,255),
BorderSizePixel=0,BackgroundTransparency=1,Parent=N.tabPage},{BackgroundTransparency='ElementTransparency'})local R=M:
StyleElementBody(Q)M:Create('UIFlexItem',{FlexMode=Enum.UIFlexMode.Fill,Parent=Q})M:Create('UIListLayout',{FillDirection
=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalFlex=Enum.UIFlexAlignment.Fill,
Parent=Q})local S=M:Create('TextButton',{Text='',BackgroundColor3=Color3.fromRGB(255,255,255),BackgroundTransparency=1,
AutomaticSize=Enum.AutomaticSize.X,Size=UDim2.fromOffset(0,u),BorderSizePixel=0,TextTransparency=1,ZIndex=P or 1,Parent=
Q})M:Create('UICorner',{Parent=S},{CornerRadius='ElementCornerRadius'})return Q,R,S end function l.StyleElementPanel(M,N
)M:Create('UIGradient',{Rotation=270,Parent=N},{Color='ElementGradient'})M:Create('UICorner',{Parent=N},{CornerRadius=
'ElementCornerRadius'})local O=M:Create('UIStroke',{Color=Color3.fromRGB(255,255,255),Transparency=1,Parent=N})M:Create(
'UIGradient',{Rotation=270,Parent=O},{Color='ElementStrokeGradient'})return O end function l._reveal(M,N,O,P,Q)if not N
then return end if P then j.tweenService:Create(N,Q or m,O):Play()else for R,S in O do N[R]=S end end end function l.
_revealCommon(M,N,O)M:_reveal(N.stroke,{Transparency=M.theme.ElementStrokeTransparency},O)M:_reveal(N.title,{
TextTransparency=0},O)M:_reveal(N.main,{BackgroundTransparency=M.theme.ElementTransparency or 0},O)if N.iconLabel then M
:_reveal(N.iconLabel,{ImageTransparency=0},O)end if N.descriptor then M:_reveal(N.descriptor.titleLabel,{
TextTransparency=0.7},O)end end function l._hideCommon(M,N,O)M:_reveal(N.stroke,{Transparency=1},O)M:_reveal(N.title,{
TextTransparency=1},O)M:_reveal(N.main,{BackgroundTransparency=1},O)if N.iconLabel then M:_reveal(N.iconLabel,{
ImageTransparency=1},O)end if N.descriptor then M:_reveal(N.descriptor.titleLabel,{TextTransparency=1},O)end end
function l._collapsedRect(M)local N=if M.showIconOnly then o else n if M._collapsedPosition then return M.
_collapsedPosition,N end local O=UDim2.new(p.X.Scale,p.X.Offset,p.Y.Scale,p.Y.Offset+N.Y.Offset/2)return O,N end
function l._interactive(M)return not M.animating and not M.hidden end function l._settled(M)return not M.hidden and not
M._revealing end function l.Connect(M,N,O)local P=N:Connect(O)table.insert(M.connections,P)return P end function l.
ConnectFor(M,N,O,P)local Q=M:Connect(O,P)N.connections=N.connections or{}table.insert(N.connections,Q)return Q end
function l.Disconnect(M,N)if not N then return end local O=table.find(M.connections,N)if O then table.remove(M.
connections,O)end N:Disconnect()end function l.DestroySubtree(M,N)if not N then return end local O={[N]=true}for P,Q in
N:GetDescendants()do O[Q]=true end for P=#M.instances,1,-1 do local Q=M.instances[P]if O[Q]then table.remove(M.instances
,P)M.themeProperties[Q]=nil M.localeProperties[Q]=nil end end N:Destroy()end function l.DisconnectMany(M,N,O)if not O or
#O==0 then return end local P={}for Q,R in O do P[R]=true R:Disconnect()end local function Q(R)if not R then return end
local S=0 for T=1,#R do local U=R[T]if not P[U]then S+=1 R[S]=U end end for T=#R,S+1,-1 do R[T]=nil end end Q(M.
connections)if N and N~=M then Q(N.connections)end end function l.DestroySubtrees(M,N)if not N or#N==0 then return end
local O={}for P,Q in N do O[Q]=true for R,S in Q:GetDescendants()do O[S]=true end end local P=0 for Q=1,#M.instances do
local R=M.instances[Q]if O[R]then M.themeProperties[R]=nil M.localeProperties[R]=nil else P+=1 M.instances[P]=R end end
for Q=#M.instances,P+1,-1 do M.instances[Q]=nil end for Q,R in N do R:Destroy()end end function l.Unload(M)M.unloaded=
true d.teardown()d.releaseContainer(M.screenGui)if M._liveTween then M._liveTween:Cancel()M._liveTween=nil end for N=#M.
connections,1,-1 do M.connections[N]:Disconnect()end for N=#M.instances,1,-1 do M.instances[N]:Destroy()end table.clear(
M.connections)table.clear(M.instances)table.clear(M.themeProperties)table.clear(M.localeProperties)table.clear(M.
controls)table.clear(M.tabs)end return l end)()end,[36]=function()local aa,ab,ac=a(36)local ad return(function(...)
return{WindowColor=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(22,16,32)),ColorSequenceKeypoint.new(
0.9999,Color3.fromRGB(30,22,46)),ColorSequenceKeypoint.new(1,Color3.fromRGB(38,28,56))},ShadowColor=Color3.fromRGB(12,6,
22),ElementStroke=Color3.fromRGB(54,42,74),ElementGradient=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(
32,24,48)),ColorSequenceKeypoint.new(0.9999,Color3.fromRGB(36,28,54)),ColorSequenceKeypoint.new(1,Color3.fromRGB(36,28,
54))},ElementStrokeGradient=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(72,58,104)),
ColorSequenceKeypoint.new(0.9999,Color3.fromRGB(88,72,124)),ColorSequenceKeypoint.new(1,Color3.fromRGB(72,58,104))},
ElementStrokeHover=Color3.fromRGB(84,68,118),TabBackground=ColorSequence.new(Color3.fromRGB(54,42,80),Color3.fromRGB(34,
26,52)),TabStroke=ColorSequence.new(Color3.fromRGB(88,70,128),Color3.fromRGB(54,42,80)),SliderBackground=Color3.fromRGB(
46,36,68),SliderBackgroundHover=Color3.fromRGB(60,48,90),SliderProgress=ColorSequence.new(Color3.fromRGB(170,112,248),
Color3.fromRGB(138,80,224)),AccentColor=Color3.fromRGB(168,110,246),AccentStroke=Color3.fromRGB(200,154,255),
ToggleKnobOff=Color3.fromRGB(224,214,236),StatBackground=Color3.fromRGB(24,18,38),DropdownHighlight=Color3.fromRGB(168,
110,246),NeutralButton=Color3.fromRGB(46,36,68),NeutralButtonHover=Color3.fromRGB(60,48,90),NeutralButtonStroke=Color3.
fromRGB(140,116,190)}end)()end,[37]=function()local aa,ab,ac=a(37)local ad return(function(...)return{WindowColor=
ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(12,16,34)),ColorSequenceKeypoint.new(0.9999,Color3.fromRGB(
20,26,50)),ColorSequenceKeypoint.new(1,Color3.fromRGB(28,36,66))},ShadowColor=Color3.fromRGB(6,8,20),ElementStroke=
Color3.fromRGB(44,52,82),ElementGradient=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(26,32,58)),
ColorSequenceKeypoint.new(0.9999,Color3.fromRGB(30,38,66)),ColorSequenceKeypoint.new(1,Color3.fromRGB(30,38,66))},
ElementStrokeGradient=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(56,66,104)),ColorSequenceKeypoint.
new(0.9999,Color3.fromRGB(70,82,124)),ColorSequenceKeypoint.new(1,Color3.fromRGB(56,66,104))},ElementStrokeHover=Color3.
fromRGB(64,76,116),TabBackground=ColorSequence.new(Color3.fromRGB(48,58,92),Color3.fromRGB(30,38,64)),TabStroke=
ColorSequence.new(Color3.fromRGB(78,92,140),Color3.fromRGB(48,58,92)),SliderBackground=Color3.fromRGB(40,48,78),
SliderBackgroundHover=Color3.fromRGB(54,64,100),SliderProgress=ColorSequence.new(Color3.fromRGB(64,132,248),Color3.
fromRGB(42,104,224)),AccentColor=Color3.fromRGB(48,120,240),AccentStroke=Color3.fromRGB(96,164,255),ToggleKnobOff=Color3
.fromRGB(196,206,232),StatBackground=Color3.fromRGB(20,26,48),DropdownHighlight=Color3.fromRGB(48,120,240),NeutralButton
=Color3.fromRGB(40,48,78),NeutralButtonHover=Color3.fromRGB(54,64,100),NeutralButtonStroke=Color3.fromRGB(120,138,195)}
end)()end,[38]=function()local aa,ab,ac=a(38)local ad return(function(...)local ae=ac(ab.Parent.Parent.utility.variables
)return{CornerRoundness=UDim.new(0,20),WindowColor=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(10,10,10
)),ColorSequenceKeypoint.new(0.9999,Color3.fromRGB(25,25,25)),ColorSequenceKeypoint.new(1,Color3.fromRGB(35,35,35))},
ShadowColor=Color3.fromRGB(20,20,20),ElementStroke=Color3.fromRGB(35,35,35),ElementGradient=ColorSequence.new{
ColorSequenceKeypoint.new(0,Color3.fromRGB(30,30,30)),ColorSequenceKeypoint.new(0.9999,Color3.fromRGB(35,35,35)),
ColorSequenceKeypoint.new(1,Color3.fromRGB(35,35,35))},ElementStrokeGradient=ColorSequence.new{ColorSequenceKeypoint.
new(0,Color3.fromRGB(48,48,48)),ColorSequenceKeypoint.new(0.9999,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(1,
Color3.fromRGB(48,48,48))},TabColor=Color3.fromRGB(255,255,255),TabBackground=ColorSequence.new(Color3.fromRGB(50,50,50)
,Color3.fromRGB(35,35,35)),TabStroke=ColorSequence.new(Color3.fromRGB(95,95,95),Color3.fromRGB(50,50,50)),
SliderBackground=Color3.fromRGB(47,47,47),SliderBackgroundHover=Color3.fromRGB(60,60,60),SliderProgress=ColorSequence.
new(Color3.fromRGB(0,170,127),Color3.fromRGB(0,134,98)),SliderStroke=Color3.fromRGB(255,255,255),ActionColor=Color3.
fromRGB(255,255,255),TitleFont=ae.brandFont(Enum.FontWeight.SemiBold),Font=ae.brandFont(Enum.FontWeight.Medium),
ContentColor=Color3.fromRGB(255,255,255),LiveAnimation=false,DarkToggleOverlay=true,ElementTransparency=0,
ElementStrokeTransparency=0,ElementStrokeHoverTransparency=0,ElementStrokeHover=Color3.fromRGB(50,50,50),
ElementCornerRadius=UDim.new(0,12),ElementTextHoverColor=Color3.fromRGB(255,255,255),TitlingColor=Color3.fromRGB(255,255
,255),DropdownHighlight=Color3.fromRGB(255,255,255),AccentColor=Color3.fromRGB(23,153,110),AccentStroke=Color3.fromRGB(
32,201,144),AccentGlow=0.4,StatBackground=Color3.fromRGB(25,25,25),SliderHandle=Color3.fromRGB(255,255,255),
PillCornerRadius=UDim.new(1,0),ToggleTrack=Color3.fromRGB(0,0,0),ToggleTrackTransparency=0.9,ToggleKnobOff=Color3.
fromRGB(255,255,255),ToggleKnobOffTransparency=0.8,FieldBackground=Color3.fromRGB(255,255,255),FieldTransparency=0.9,
FieldGlow=Color3.fromRGB(255,255,255),PlaceholderColor=Color3.fromRGB(178,178,178),SurfaceStroke=Color3.fromRGB(255,255,
255),NeutralButton=Color3.fromRGB(38,38,38),NeutralButtonHover=Color3.fromRGB(54,54,54),NeutralButtonStroke=Color3.
fromRGB(255,255,255),ErrorColor=Color3.fromRGB(185,50,50),ErrorStrokeColor=Color3.fromRGB(240,75,75)}end)()end,[39]=
function()local aa,ab,ac=a(39)local ad return(function(...)return{WindowColor=ColorSequence.new{ColorSequenceKeypoint.
new(0,Color3.fromRGB(22,18,16)),ColorSequenceKeypoint.new(0.9999,Color3.fromRGB(32,27,23)),ColorSequenceKeypoint.new(1,
Color3.fromRGB(40,33,28))},ShadowColor=Color3.fromRGB(16,12,8),ElementStroke=Color3.fromRGB(54,46,40),ElementGradient=
ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(32,27,23)),ColorSequenceKeypoint.new(0.9999,Color3.fromRGB(
38,32,27)),ColorSequenceKeypoint.new(1,Color3.fromRGB(38,32,27))},ElementStrokeGradient=ColorSequence.new{
ColorSequenceKeypoint.new(0,Color3.fromRGB(72,62,52)),ColorSequenceKeypoint.new(0.9999,Color3.fromRGB(88,76,64)),
ColorSequenceKeypoint.new(1,Color3.fromRGB(72,62,52))},ElementStrokeHover=Color3.fromRGB(84,72,60),TabBackground=
ColorSequence.new(Color3.fromRGB(56,47,40),Color3.fromRGB(36,30,26)),TabStroke=ColorSequence.new(Color3.fromRGB(92,78,66
),Color3.fromRGB(56,47,40)),SliderBackground=Color3.fromRGB(48,40,34),SliderBackgroundHover=Color3.fromRGB(62,52,44),
SliderProgress=ColorSequence.new(Color3.fromRGB(244,152,44),Color3.fromRGB(220,110,24)),AccentColor=Color3.fromRGB(240,
142,40),AccentStroke=Color3.fromRGB(255,182,92),ToggleKnobOff=Color3.fromRGB(232,224,214),StatBackground=Color3.fromRGB(
26,21,18),DropdownHighlight=Color3.fromRGB(240,142,40),NeutralButton=Color3.fromRGB(48,40,34),NeutralButtonHover=Color3.
fromRGB(64,54,46),NeutralButtonStroke=Color3.fromRGB(150,128,104)}end)()end,[40]=function()local aa,ab,ac=a(40)local ad
return(function(...)local ae=ac(ab.Parent.Parent.utility.variables)return{WindowColor=ColorSequence.new{
ColorSequenceKeypoint.new(0,Color3.fromRGB(246,249,251)),ColorSequenceKeypoint.new(1,Color3.fromRGB(236,241,245))},
ShadowColor=Color3.fromRGB(116,124,132),LiveAnimation=false,ElementTransparency=0,ElementStroke=Color3.fromRGB(218,224,
228),ElementGradient=ColorSequence.new(Color3.fromRGB(255,255,255)),ElementStrokeGradient=ColorSequence.new(Color3.
fromRGB(224,230,234),Color3.fromRGB(232,238,242)),ElementStrokeTransparency=0.1,ElementStrokeHoverTransparency=0,
ElementStrokeHover=Color3.fromRGB(0,176,208),DarkToggleOverlay=false,TabColor=Color3.fromRGB(38,42,46),TabBackground=
ColorSequence.new(Color3.fromRGB(0,176,208),Color3.fromRGB(0,150,184)),TabStroke=ColorSequence.new(Color3.fromRGB(80,206
,230),Color3.fromRGB(0,160,196)),SliderBackground=Color3.fromRGB(224,230,234),SliderBackgroundHover=Color3.fromRGB(212,
220,224),SliderProgress=ColorSequence.new(Color3.fromRGB(0,182,214),Color3.fromRGB(0,146,182)),SliderStroke=Color3.
fromRGB(200,206,210),AccentColor=Color3.fromRGB(0,176,208),AccentStroke=Color3.fromRGB(96,210,232),AccentGlow=0.85,
StatBackground=Color3.fromRGB(255,255,255),SliderHandle=Color3.fromRGB(60,66,72),ToggleTrack=Color3.fromRGB(198,204,210)
,ToggleTrackTransparency=0,ToggleKnobOffTransparency=0.05,FieldBackground=Color3.fromRGB(224,230,234),FieldTransparency=
0,FieldGlow=Color3.fromRGB(148,154,160),PlaceholderColor=Color3.fromRGB(138,144,150),SurfaceStroke=Color3.fromRGB(204,
210,214),NeutralButton=Color3.fromRGB(224,230,234),NeutralButtonHover=Color3.fromRGB(212,220,224),NeutralButtonStroke=
Color3.fromRGB(242,246,248),ActionColor=Color3.fromRGB(68,74,80),TitlingColor=Color3.fromRGB(26,30,34),TitleFont=ae.
brandFont(Enum.FontWeight.SemiBold),Font=ae.brandFont(Enum.FontWeight.Medium),ContentColor=Color3.fromRGB(42,46,52),
ElementTextHoverColor=Color3.fromRGB(18,22,26),DropdownHighlight=Color3.fromRGB(0,176,208),ErrorColor=Color3.fromRGB(200
,60,55),ErrorStrokeColor=Color3.fromRGB(240,80,70)}end)()end,[41]=function()local aa,ab,ac=a(41)local ad return(function
(...)return{WindowColor=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(26,18,22)),ColorSequenceKeypoint.
new(0.9999,Color3.fromRGB(36,26,31)),ColorSequenceKeypoint.new(1,Color3.fromRGB(44,32,38))},ShadowColor=Color3.fromRGB(
18,10,14),ElementStroke=Color3.fromRGB(58,44,50),ElementGradient=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.
fromRGB(34,25,29)),ColorSequenceKeypoint.new(0.9999,Color3.fromRGB(40,30,34)),ColorSequenceKeypoint.new(1,Color3.
fromRGB(40,30,34))},ElementStrokeGradient=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(76,58,66)),
ColorSequenceKeypoint.new(0.9999,Color3.fromRGB(92,70,80)),ColorSequenceKeypoint.new(1,Color3.fromRGB(76,58,66))},
ElementStrokeHover=Color3.fromRGB(88,66,74),TabBackground=ColorSequence.new(Color3.fromRGB(62,46,53),Color3.fromRGB(38,
29,33)),TabStroke=ColorSequence.new(Color3.fromRGB(102,78,88),Color3.fromRGB(62,46,53)),SliderBackground=Color3.fromRGB(
50,38,44),SliderBackgroundHover=Color3.fromRGB(64,50,56),SliderProgress=ColorSequence.new(Color3.fromRGB(244,88,140),
Color3.fromRGB(220,60,116)),AccentColor=Color3.fromRGB(240,82,138),AccentStroke=Color3.fromRGB(255,134,178),
ToggleKnobOff=Color3.fromRGB(236,220,226),StatBackground=Color3.fromRGB(28,20,24),DropdownHighlight=Color3.fromRGB(240,
82,138),NeutralButton=Color3.fromRGB(50,38,44),NeutralButtonHover=Color3.fromRGB(64,50,56),NeutralButtonStroke=Color3.
fromRGB(170,122,140)}end)()end,[42]=function()local aa,ab,ac=a(42)local ad return(function(...)export type Theme=string|
{[string]:any}export type Translator=(source:string,localeId:string)->string?export type Translations={[string]:{[string
]:string}}export type WindowConfiguration={autoSave:boolean?,autoLoad:boolean?,fileName:string?,customFolder:string?}
export type WindowProps={name:string?,subtitle:string?,theme:Theme?,icon:(string|number)?,showName:string?,showIcon:(
string|number)?,showIconOnly:boolean?,sidebarLayout:boolean?,profile:string?,configuration:WindowConfiguration?,
fallbackFont:(Font|Enum.Font)?,locale:string?,translations:Translations?,translator:Translator?,changelog:{PopupBox}?}
export type TabProps={name:string?,icon:(string|number)?}export type TagProps={text:string?,title:string?,icon:(string|
number)?,color:Color3?,order:number?}export type SectionProps={name:string?,icon:(string|number)?}export type TextProps=
{name:string?,text:string?,icon:(string|number)?}export type DividerProps={text:string?,spacing:number?,line:boolean?}
export type GroupProps={direction:string?}export type ButtonProps={name:string?,description:string?,icon:(string|number)
?,callback:(()->())?}export type ToggleProps={name:string?,description:string?,icon:(string|number)?,flag:string?,value:
boolean?,forgetState:boolean?,callback:((value:boolean)->())?}export type SliderProps={name:string?,description:string?,
icon:(string|number)?,flag:string?,range:{number}?,increment:number?,value:number?,suffix:string?,minimal:boolean?,
forgetState:boolean?,callback:((value:number,dragging:boolean)->())?}export type DropdownProps={name:string?,description
:string?,icon:(string|number)?,flag:string?,options:{string}?,value:(string|{string})?,multiSelect:boolean?,placeholder:
string?,forgetState:boolean?,callback:((value:any)->())?}export type InputProps={name:string?,description:string?,icon:(
string|number)?,flag:string?,value:string?,placeholder:string?,numeric:boolean?,clearOnFocus:boolean?,forgetState:
boolean?,callback:((value:string)->())?}export type KeybindProps={name:string?,description:string?,icon:(string|number)?
,flag:string?,value:(EnumItem|string)?,forgetState:boolean?,isMenuToggle:boolean?,hold:boolean?,holdThreshold:number?,
callback:((value:EnumItem|boolean)->())?,onChanged:((key:EnumItem)->())?}export type ColorPickerProps={name:string?,
description:string?,icon:(string|number)?,flag:string?,color:Color3?,alpha:number?,forgetState:boolean?,callback:((value
:Color3,alpha:number)->())?}export type StatProps={name:string?,description:string?,icon:(string|number)?,prefix:string?
,suffix:string?,value:number?,display:string?,compact:boolean?,changeMode:string?,changeBaseline:string?,numberEasing:
boolean?}export type ProgressProps={name:string?,description:string?,icon:(string|number)?,range:{number}?,value:number?
,steps:number?,text:string?,format:((value:number,min:number,max:number)->string)?,showValue:boolean?,indeterminate:
boolean?}export type ConsoleProps={name:string?,description:string?,text:string?,height:number?,follow:boolean?,maxLines
:number?}export type NotifyProps={title:string?,content:string?,icon:(string|number)?,duration:number?}export type
ToastProps={title:string?,subtitle:string?,subtitleAbove:boolean?,icon:(string|number)?,avatar:number?,minWidth:number?,
duration:number?,position:'Top'|'Bottom'?}export type PopupBox={title:string?,description:string?,icon:(string|number)?}
export type PopupOption={text:string?,style:string?,callback:(()->())?}export type PopupProps={title:string?,subtitle:
string?,icon:(string|number)?,content:string?,boxes:{PopupBox}?,options:{PopupOption}?,dismissable:boolean?}export type
Moveable={MoveTo:(self:any,index:number)->(),MoveToTop:(self:any)->(),MoveToBottom:(self:any)->(),MoveUp:(self:any)->(),
MoveDown:(self:any)->()}export type Lockable={Lock:(self:any,reason:string?)->(),Unlock:(self:any)->(),IsLocked:(self:
any)->boolean}export type Button=Moveable&Lockable&{}export type Toggle=Moveable&Lockable&{value:boolean,Set:(self:
Toggle,value:boolean,skipCallback:boolean?)->()}export type Slider=Moveable&Lockable&{value:number,Set:(self:Slider,
value:number,skipCallback:boolean?)->()}export type Dropdown=Moveable&Lockable&{value:{string},Set:(self:Dropdown,value:
string|{string},skipCallback:boolean?)->(),Refresh:(self:Dropdown,options:{string})->(),Add:(self:Dropdown,option:string
)->(),Remove:(self:Dropdown,option:string)->()}export type Input=Moveable&Lockable&{value:string,Set:(self:Input,value:
string,skipCallback:boolean?)->()}export type Keybind=Moveable&Lockable&{value:EnumItem,Set:(self:Keybind,value:EnumItem
|string,skipChanged:boolean?)->()}export type ColorPicker=Moveable&Lockable&{value:Color3,alpha:number,Set:(self:
ColorPicker,value:Color3|string,skipCallback:boolean?)->(),SetAlpha:(self:ColorPicker,alpha:number,skipCallback:boolean?
)->()}export type Stat=Moveable&{value:number,Set:(self:Stat,value:number)->(),ResetBaseline:(self:Stat,value:number?)->
()}export type StatGroup=Moveable&{elements:{Stat}}export type Progress=Moveable&{value:number,Set:(self:Progress,value:
number)->(),Get:(self:Progress)->number,GetPercentage:(self:Progress)->number,SetRange:(self:Progress,min:number,max:
number)->(),SetText:(self:Progress,text:string?)->(),SetIndeterminate:(self:Progress,state:boolean)->(),Remove:(self:
Progress)->()}export type Console=Moveable&{Set:(self:Console,text:string)->(),Append:(self:Console,line:string)->(),
Clear:(self:Console)->(),Get:(self:Console)->string,Copy:(self:Console)->boolean,SetHeight:(self:Console,height:number
)->(),Remove:(self:Console)->()}export type Section=Moveable&{}export type TabSection={Remove:(self:TabSection)->()}
export type Text=Moveable&{name:string,text:string,Set:(self:Text,text:string)->(),SetTitle:(self:Text,title:string)->()
}export type Divider=Moveable&{text:string,Set:(self:Divider,text:string?)->()}export type Tag={Set:(self:Tag,props:
TagProps)->(),SetColor:(self:Tag,color:Color3)->(),SetText:(self:Tag,text:string?)->(),SetIcon:(self:Tag,icon:(string|
number)?)->(),Remove:(self:Tag)->()}export type Popup={Close:(self:Popup)->()}export type Group=Moveable&{CreateButton:(
self:Group,props:ButtonProps)->Button,CreateToggle:(self:Group,props:ToggleProps)->Toggle,CreateSwitch:(self:Group,props
:ToggleProps)->Toggle,CreateStat:(self:Group,props:StatProps|{StatProps})->Stat|StatGroup,CreateSlider:(self:Group,props
:SliderProps)->Slider,CreateDropdown:(self:Group,props:DropdownProps)->Dropdown?,CreateSection:(self:Group,props:
SectionProps)->Section?,CreateText:(self:Group,props:TextProps)->Text?,CreateDivider:(self:Group,props:DividerProps?)->
Divider?,CreateGroup:(self:Group,props:GroupProps?)->Group}export type Tab={Select:(self:Tab,noAnimation:boolean?)->(),
Deselect:(self:Tab,noAnimation:boolean?)->(),Remove:(self:Tab)->(),CreateButton:(self:Tab,props:ButtonProps)->Button,
CreateToggle:(self:Tab,props:ToggleProps)->Toggle,CreateSwitch:(self:Tab,props:ToggleProps)->Toggle,CreateSlider:(self:
Tab,props:SliderProps)->Slider,CreateDropdown:(self:Tab,props:DropdownProps)->Dropdown,CreateInput:(self:Tab,props:
InputProps)->Input,CreateKeybind:(self:Tab,props:KeybindProps)->Keybind,CreateColorPicker:(self:Tab,props:
ColorPickerProps)->ColorPicker,CreateStat:(self:Tab,props:StatProps|{StatProps})->Stat|StatGroup,CreateProgress:(self:
Tab,props:ProgressProps)->Progress,CreateConsole:(self:Tab,props:ConsoleProps)->Console,CreateSection:(self:Tab,props:
SectionProps)->Section,CreateText:(self:Tab,props:TextProps)->Text,CreateDivider:(self:Tab,props:DividerProps?)->Divider
,CreateGroup:(self:Tab,props:GroupProps?)->Group}export type Window={unloaded:boolean,Flags:{[string]:any},CreateTab:(
self:Window,props:TabProps)->Tab,CreateSection:(self:Window,props:SectionProps)->TabSection,CreateTag:(self:Window,props
:TagProps)->Tag,Notify:(self:Window,props:NotifyProps)->(),Toast:(self:Window,props:ToastProps)->(),Popup:(self:Window,
props:PopupProps)->Popup?,Show:(self:Window)->(),Hide:(self:Window)->(),ToggleHide:(self:Window)->(),ToggleMinimise:(
self:Window)->(),Navigate:(self:Window,tab:string|Tab)->(),ChangeTheme:(self:Window,theme:Theme)->(),SetLocale:(self:
Window,localeId:string)->(),SetTranslator:(self:Window,translator:Translator?)->(),RegisterTranslations:(self:Window,
translations:Translations)->(),Save:(self:Window,name:string?)->boolean,Load:(self:Window,name:string?)->boolean,
ListConfigs:(self:Window)->{string},DeleteConfig:(self:Window,name:string)->boolean,GetPath:(self:Window)->(string,
string),Get:(self:Window,flag:string)->any,Set:(self:Window,flag:string,value:any)->boolean,Unload:(self:Window)->()}
export type Rayfield={CreateWindow:(self:Rayfield,props:WindowProps)->Window}return{}end)()end,[44]=function()local aa,
ab,ac=a(44)local ad return(function(...)local ae,af=ac(ab.Parent.variables),{}af.enabled=false type HapticTypes={click:
Enum.HapticEffectType?,notify:Enum.HapticEffectType?}local ag:HapticTypes,ah,ai={},pcall(function()Instance.new
'HapticEffect':Destroy()return{click=Enum.HapticEffectType.UIHover,notify=Enum.HapticEffectType.UIClick}end)if ah then
ag=ai end local b:{[Enum.HapticEffectType]:Instance},c:Instance?={}function af.setContainer(d:Instance?)c=d end function
af.releaseContainer(d:Instance?)if d==nil or c==d then c=nil end end local function d():Instance if c and c.Parent then
return c end return ae.guiContainer end local function e(f:Enum.HapticEffectType):Instance?local g=b[f]if g and g.Parent
then return g end local h,i=pcall(Instance.new,'HapticEffect')if not h then return nil end local j=i::any j.Type=f local
k=pcall(function()i.Parent=d()end)if not k then i:Destroy()return nil end b[f]=i return i end local function f(g:Enum.
HapticEffectType?)if not g or not af.enabled then return end local h=e(g)if h then local i=h::any pcall(i.Play,h)end end
function af.click()f(ag.click)end function af.notify()f(ag.notify)end function af.setEnabled(g:boolean?)af.enabled=g and
true or false if not af.enabled then af.teardown()end end function af.teardown()for g,h in b do pcall(h.Destroy,h)b[g]=
nil end end return af end)()end,[45]=function()local aa,ab,ac=a(45)local ad return(function(...)local ae,af=ac(ab.Parent
.network),ac(ab.Parent.log)export type AssetId=number|string export type AssetDownloadUrl=string export type CacheKey=
AssetId export type ResolvedAsset=AssetId export type AssetRequestPayload={Url:string,Method:string}local ag={Enum={
AssetDownloadUrl={RobloxDownloadUrl='https://assetdelivery.roblox.com/v1/asset/?id=%d'::AssetDownloadUrl,
RoProxyDownloadUrl='https://assetdelivery.roproxy.com/v1/asset?id=%d'::AssetDownloadUrl}}}ag.__index=ag ag.__type=
'assetResolver'type AssetResolverState={contentCache:{[CacheKey]:string}?,contentCacheOrder:{CacheKey}?,
contentDownloadUrl:AssetDownloadUrl,pendingRequests:{[CacheKey]:{thread}}}export type AssetResolver=AssetResolverState&{
resolve:(self:AssetResolver,value:unknown)->ResolvedAsset?,getAssetContentFromUrl:(self:AssetResolver,url:string,
cacheKey:CacheKey?,forced:boolean?)->string?,getAssetContentFromId:(self:AssetResolver,id:AssetId,forced:boolean?)->
string?}local ah=8 function ag.new(ai:boolean?,b:AssetDownloadUrl?):AssetResolver local c:{[CacheKey]:string}?=if ai
then{}else nil local d=setmetatable({contentCache=c,contentCacheOrder=if ai then{}::{CacheKey}else nil,
contentDownloadUrl=b or ag.Enum.AssetDownloadUrl.RobloxDownloadUrl,pendingRequests={}}::AssetResolverState,ag)::any
return d end function ag.resolve(ai:AssetResolver,b:unknown):ResolvedAsset?if type(b)=='number'then return b end if
type(b)~='string'then return nil end if string.sub(b,1,11)=='rbxasset://'or string.sub(b,1,11)=='rbxthumb://'then return
b end local c=tonumber(string.match(b,'^rbxassetid://(%d+)$'))if c then return c end return nil end local function ai(b:
unknown):boolean if type(b)~='table'then return false end local c=b::{Body:unknown,StatusCode:unknown,Success:unknown}
local d=c.Body if type(d)~='string'or#d==0 then return false end if type(c.StatusCode)=='number'then local e=c.
StatusCode::number return e>=200 and e<300 end if type(c.Success)=='boolean'then return c.Success::boolean end return
false end function ag.getAssetContentFromUrl(b:AssetResolver,c:string,d:CacheKey?,e:boolean?):string?local f=b.
contentCache if d~=nil and f and not e then local g=f[d]if g then return g end end local g=b.pendingRequests if d~=nil
then local h=g[d]if h then table.insert(h,coroutine.running())return coroutine.yield()end g[d]={}end local h,i:string?=(
ae.getRequestFn())if not h then af.warn'No request function available to download asset content.'else local j,k=pcall(h,
{Url=c,Method='GET'}::AssetRequestPayload)if j and ai(k)then local l=(k::{Body:string}).Body i=l if d~=nil and f then
local m=b.contentCacheOrder if m and f[d]==nil then table.insert(m,d)local n=if#m>ah then table.remove(m,1)else nil if n
~=nil then f[n]=nil end end f[d]=l end elseif not e then af.warn('Failed to download asset content for url: '..tostring(
c))end end if d~=nil then local j=g[d]g[d]=nil if j then for k,l in j do coroutine.resume(l,i)end end end return i end
function ag.getAssetContentFromId(b:AssetResolver,c:AssetId,d:boolean?):string?local e=b:resolve(c)if not e or type(e)~=
'number'then af.warn('Invalid asset id: '..tostring(e))return nil end local f=string.format(b.contentDownloadUrl,e)
return b:getAssetContentFromUrl(f,e,d)end return ag end)()end,[46]=function()local aa,ab,ac=a(46)local ad return(
function(...)local ae={}function ae.contrastColor(af:Color3):Color3 local ag=0.299*af.R+0.587*af.G+0.114*af.B return if
ag>0.5 then Color3.fromRGB(0,0,0)else Color3.fromRGB(255,255,255)end function ae.toColorSequence(af:Color3|ColorSequence
):ColorSequence return if typeof(af)=='ColorSequence'then af else ColorSequence.new(af)end function ae.contrastText(af:
Color3):Color3 local ag=0.299*af.R+0.587*af.G+0.114*af.B return if ag>0.6 then Color3.fromRGB(20,20,20)else Color3.
fromRGB(255,255,255)end return ae end)()end,[47]=function()local aa,ab,ac=a(47)local ad return(function(...)local ae={}
ae.fontAsset='rbxassetid://12187365364'ae.pillResizeInfo=TweenInfo.new(0.4,Enum.EasingStyle.Exponential,Enum.
EasingDirection.Out)ae.icons={close=83277910885129,minimise=108115485663409,maximise=126976719314173,settings=
129180860773723,search=100604009889706,chevron=88479147175134,check=125626312718314,dot=91452555903853,colorpicker=
91452555903853,banner=111263549366178,config=125823673784681,rayfield=80387863064905}ae.accent={on=Color3.fromRGB(23,153
,110),onStroke=Color3.fromRGB(32,201,144)}ae.statAccents={positive={fill=ColorSequence.new(Color3.fromRGB(0,170,127),
Color3.fromRGB(0,134,98)),stroke=ColorSequence.new(Color3.fromRGB(0,213,156),Color3.fromRGB(0,189,135))},negative={fill=
ColorSequence.new(Color3.fromRGB(172,47,47),Color3.fromRGB(135,37,37)),stroke=ColorSequence.new(Color3.fromRGB(255,75,75
),Color3.fromRGB(244,67,67))},neutral={fill=ColorSequence.new(Color3.fromRGB(0,170,127),Color3.fromRGB(0,134,98)),stroke
=ColorSequence.new(Color3.fromRGB(0,213,156),Color3.fromRGB(0,189,135))}}ae.zIndex={elementLock=60,elementLockContent=65
,bottomFade=100,resize=110,notification=1500,drag=1000,toast=2000,toastContent=2001,restoreContent=100001,
restoreInteract=100002}ae.displayOrder={window=99999,banner=100000,popup=100001}return ae end)()end,[48]=function()local
aa,ab,ac=a(48)local ad return(function(...)local ae={}function ae.itemFromValue(af,ag)local ah,ai=pcall(function()return
af:FromValue(ag)end)if ah and ai then return ai end local b,c=pcall(function()return af:GetEnumItems()end)if not b then
return nil end for d,e in c do if e.Value==ag then return e end end return nil end return ae end)()end,[49]=function()
local aa,ab,ac=a(49)local ad return(function(...)local ae,af=ac(ab.Parent.services),{}local ag=ae.getService'RunService'
:IsStudio()local ah=not ag and typeof(writefile)=='function'and typeof(readfile)=='function'and typeof(isfile)==
'function'and typeof(isfolder)=='function'and typeof(makefolder)=='function'and typeof(listfiles)=='function'and typeof(
delfile)=='function'and typeof(delfolder)=='function'if ah then function af.writefile(ai:string,b:string)writefile(ai,b)
end function af.readfile(ai:string):string return readfile(ai)end if typeof(appendfile)=='function'then function af.
appendfile(ai:string,b:string)appendfile(ai,b)end end function af.isfile(ai:string):boolean return isfile(ai)end
function af.delfile(ai:string)delfile(ai)end function af.listfiles(ai:string):{string}return listfiles(ai)end function
af.makefolder(ai:string)makefolder(ai)end function af.isfolder(ai:string):boolean return isfolder(ai)end function af.
delfolder(ai:string)delfolder(ai)end elseif ag then local ai=Instance.new'Folder'ai.Name='Filesystem'ai.Parent=ae.
getService'ReplicatedStorage'local function b(c:string):{string}local d={}for e in string.gmatch(c,'[^/]+')do table.
insert(d,e)end return d end local function c(d:{string},e:boolean):Instance?local f:Instance=ai for g=1,#d-1 do local h=
f:FindFirstChild(d[g])if not h then if not e then return nil end local i=Instance.new'Folder'i.Name=d[g]i.Parent=f h=i
end f=h::Instance end return f end local function d(e:Instance?):StringValue?if e and e:IsA'StringValue'then return e
end return nil end function af.writefile(e:string,f:string)local g=b(e)assert(#g>0,'Invalid path')local h=c(g,true)
assert(h,'Invalid path')local i=g[#g]local j=h:FindFirstChild(i)local k=d(j)if k then k.Value=f else if j then j:
Destroy()end local l=Instance.new'StringValue'l.Name=i l.Value=f l.Parent=h end end function af.readfile(e:string):
string local f=b(e)assert(#f>0,'Invalid path')local g=c(f,false)assert(g,'File not found: '..e)local h=g:FindFirstChild(
f[#f])local i=d(h)assert(i,'File not found: '..e)return i.Value end function af.isfile(e:string):boolean local f=b(e)if#
f==0 then return false end local g=c(f,false)if not g then return false end return d(g:FindFirstChild(f[#f]))~=nil end
function af.listfiles(e:string):{string}local f,g:Instance=b(e),ai for h,i in f do local j=g:FindFirstChild(i)if not j
or not j:IsA'Folder'then error('Folder not found: '..e)end g=j end local h:{string}={}for i,j in g:GetChildren()do table
.insert(h,e..'/'..j.Name)end return h end function af.delfile(e:string)local f=b(e)assert(#f>0,'Invalid path')local g=c(
f,false)assert(g,'File not found: '..e)local h=g:FindFirstChild(f[#f])local i=d(h)assert(i,'File not found: '..e)i:
Destroy()end function af.makefolder(e:string)local f=b(e)if#f==0 then return end local g:Instance=ai for h,i in f do
local j=g:FindFirstChild(i)if not j then local k=Instance.new'Folder'k.Name=i k.Parent=g j=k end g=j::Instance end end
function af.isfolder(e:string):boolean local f=b(e)if#f==0 then return false end local g:Instance=ai for h,i in f do
local j=g:FindFirstChild(i)if not j or not j:IsA'Folder'then return false end g=j end return true end function af.
delfolder(e:string)local f=b(e)assert(#f>0,'Invalid path')local g=c(f,false)assert(g,'Folder not found: '..e)local h=g:
FindFirstChild(f[#f])assert(h and h:IsA'Folder','Folder not found: '..e)h:Destroy()end end if af.writefile and not af.
appendfile then function af.appendfile(ai:string,b:string)local c=if af.isfile(ai)then af.readfile(ai)else nil af.
writefile(ai,if c then c..b else b)end end function af.ensureFolder(ai:string)if not af.isfolder(ai)then af.makefolder(
ai)end end function af.ensureDir(ai:string)local b=''for c in string.gmatch(ai,'[^/]+')do b=if b==''then c else b..'/'..
c if not af.isfolder(b)then af.makefolder(b)end end end return af end)()end,[50]=function()local aa,ab,ac=a(50)local ad
return(function(...)local ae,af,ag,ah=ac(ab.Parent.filesystem),ac(ab.Parent.path),'Rayfield',{}ah.__index=ah export type
FileSystemManager={root:string,assets:string,getPath:(self:FileSystemManager,subpath:string?)->string,getAssetsFolder:(
self:FileSystemManager,subfolder:string?)->string,getRootFolder:(self:FileSystemManager)->string}function ah.new(ai:
string?):FileSystemManager local b=ai or ag local c=setmetatable({root=b,assets=b..'/Assets'},ah)::any pcall(ae.
ensureFolder,c.root)pcall(ae.ensureFolder,c.assets)return c end function ah.getPath(ai,b:string?):string return af.join(
ai.root,b)end function ah.getAssetsFolder(ai,b:string?):string if b then local c=af.join(ai.assets,b)pcall(ae.
ensureFolder,c)return c end return ai.assets end function ah.getRootFolder(ai):string return ai.root end return ah end)(
)end,[51]=function()local aa,ab,ac=a(51)local ad return(function(...)local ae,af,ag={},2166136261,16777619
local function ah(ai:string):number local b=af for c=1,#ai do b=bit32.bxor(b,string.byte(ai,c))local d=b%65536 local e=(
b-d)/65536 b=(((e*ag)%65536)*65536+d*ag)%4294967296 end return b end function ae.deriveFlagFromName(ai:string):string
local b=ai:gsub('(%S+)',function(b:string):string return b:sub(1,1):upper()..b:sub(2,-1)end):gsub('[^%w]','')if b==''and
ai~=''then return string.format('Flag%08x',ah(ai))end return b end return ae end)()end,[52]=function()local aa,ab,ac=a(
52)local ad return(function(...)local ae=ac(ab.Parent.services)local af,ag,ah,ai,b,c=ae.getService'HttpService',ae.
getService'RunService',ac(ab.Parent.filesystem),ac(ab.Parent.assetResolver),ac(ab.Parent.log),ac(ab.Parent.path)
local function d(e:unknown):string?local f,g=pcall(function()return af:JSONEncode(e)end)if f and type(g)=='string'then
return g else b.warn('Failed to encode JSON:',g)return nil end end local function e(f:string):unknown?local g,h=pcall(
function()return af:JSONDecode(f)end)if g then return h else b.warn('Failed to decode JSON:',h)return nil end end local
f={}f.__type='fontManager'export type FontFace={name:string,family:string,weight:number,style:string,assetId:string}
export type FontManifest={name:string,faces:{FontFace}}export type CachedFont={customId:number|string,manifest:
FontManifest,loadedFromDisk:boolean,variants:{[string]:Font}}export type FontCache={[number]:CachedFont}export type
FontResolverOptions={fallbackFont:Font?,saveToDisk:boolean?,skipCache:boolean?}type FontManagerState={_debug:boolean,
_pendingLoads:{[string]:{thread}},rootFolder:string,assetResolver:ai.AssetResolver,defaultOptions:FontResolverOptions,
fontCache:FontCache?}export type FontManager=FontManagerState&{resolve:(self:FontManager,id:number|string)->Font?,
loadFont:(self:FontManager,id:(number|string)?,fontWeight:Enum.FontWeight?,fontStyle:Enum.FontStyle?,saveToDisk:boolean?
,skipCache:boolean?)->Font?,getFontFromId:(self:FontManager,id:number|string)->Font?}export type fontManager=FontManager
local function g(h:unknown):FontManifest?local i=h::any if type(i)~='table'or type(i.name)~='string'or type(i.faces)~=
'table'then return nil end i.name=c.sanitizeFile(i.name)if#i.name==0 or#i.faces==0 then return nil end for j,k in i.
faces do if type(k)~='table'or type(k.name)~='string'or type(k.assetId)~='string'then return nil end k.name=c.
sanitizeFile(k.name)if#k.name==0 then return nil end end return i::FontManifest end local h={'\0\1\0\0','OTTO','true',
'ttcf','wOFF','wOF2'}local function i(j:string):boolean for k,l in h do if string.sub(j,1,#l)==l then return true end
end return false end local j=getfenv()local function k(l:Enum.FontWeight,m:Enum.FontStyle):string return tostring(l)..
'|'..tostring(m)end local function l(m:unknown):number?if type(m)=='number'then return m end if type(m)=='string'then
return tonumber(m)end return nil end function f.__index(m:FontManagerState,n:unknown):unknown local o=(f::any)[n]if o~=
nil then return o end local p=l(n)if not p then return nil end local q=m.fontCache if q then local r=q[p]if r then local
s=k(Enum.FontWeight.Regular,Enum.FontStyle.Normal)local t=r.variants and r.variants[s]if t then return t end for u,v in
pairs(r.variants or{})do return v end end end return nil end function f.new(m:string,n:boolean?,o:boolean?,p:ai.
AssetDownloadUrl?,q:FontResolverOptions?):FontManager local r=q or{saveToDisk=true,skipCache=not o or false,fallbackFont
=Font.fromEnum(Enum.Font.SourceSans)}local s=setmetatable({rootFolder=m,fontCache=if o then{}::FontCache else nil,
assetResolver=ai.new(o,p),defaultOptions=r,_debug=n or ag:IsStudio()or false,_pendingLoads={}}::FontManagerState,f)::any
pcall(ah.ensureFolder,m)return s end local function m(n:FontManager,o:number,p:Enum.FontWeight,q:Enum.FontStyle,r:string
):Font?local s=n.rootFolder..'/'..o..'.json'if typeof(ah.isfile)~='function'then return n.defaultOptions.fallbackFont
end local t,u:string?=false if ag:IsStudio()and n._debug then b.warn
[[Font manifest loading is not supported in Studio. Using default font manifest for testing.]]u=
[[{"name":"Inter","faces":[{"name":"Thin","weight":100,"style":"normal","assetId":"rbxassetid://12187277209"},{"name":"Extra Light","weight":200,"style":"normal","assetId":"rbxassetid://12187293441"},{"name":"Light","weight":300,"style":"normal","assetId":"rbxassetid://12187268450"},{"name":"Regular","weight":400,"style":"normal","assetId":"rbxassetid://12187266066"},{"name":"Medium","weight":500,"style":"normal","assetId":"rbxassetid://12187336822"},{"name":"Semi Bold","weight":600,"style":"normal","assetId":"rbxassetid://12187254443"},{"name":"Bold","weight":700,"style":"normal","assetId":"rbxassetid://12187275575"},{"name":"Extra Bold","weight":800,"style":"normal","assetId":"rbxassetid://12187267750"},{"name":"Black","weight":900,"style":"normal","assetId":"rbxassetid://12187359223"}]}]]
elseif ah.isfile(s)then local v,w=pcall(ah.readfile,s)u=v and w or nil else u=n.assetResolver:getAssetContentFromId(o,
false)t=u~=nil end local v:FontManifest?if u then local w,x=pcall(e,u)if w and x then v=g(x)else if n._debug then b.
warn('Failed to parse font manifest for font id: '..tostring(o)..'. Error: '..tostring(x))end end else return n.
defaultOptions.fallbackFont end if not v then if n._debug then b.warn('Font manifest is nil for font id: '..tostring(o))
end pcall(ah.delfile,s)return n.defaultOptions.fallbackFont end if t and u then pcall(ah.writefile,s,u)end local w,x=n.
rootFolder..'/'..v.name,true if not pcall(ah.ensureFolder,w)then return n.defaultOptions.fallbackFont end for y,z in
ipairs(v.faces)do local A=w..'/'..z.name:gsub(' ','-')..'.ttf'if ah.isfile(A)then local B,C=pcall(ah.readfile,A)if not B
or type(C)~='string'or not i(C)then pcall(ah.delfile,A)end end if not ah.isfile(A)then local B=n.assetResolver:resolve(z
.assetId)local C=if B~=nil then n.assetResolver:getAssetContentFromId(B,false)else nil if not C or not i(C)then x=false
if n._debug then b.warn('Font face content is missing or not a font for font id: '..tostring(o)..', face: '..z.name)end
continue end pcall(ah.writefile,A,C)end local B,C=pcall(j.getcustomasset,A)if B and type(C)=='string'then v.faces[y].
assetId=C if n._debug then b.print('Loaded font face for id: '..tostring(o)..', face: '..z.name)end else x=false if n.
_debug then b.warn('Failed to load font face for id: '..tostring(o)..', face: '..z.name)end end end if not x then return
n.defaultOptions.fallbackFont end local y=d(v)if not y or not pcall(ah.writefile,w..'/manifest.json',y)then return n.
defaultOptions.fallbackFont end local z,A=pcall(j.getcustomasset,w..'/manifest.json')if not z or not A then if n._debug
then b.warn('Failed to load font manifest for id: '..tostring(o))end return n.defaultOptions.fallbackFont end local B,C=
pcall(Font.new,A::any,p,q)if not B or not C then if n._debug then b.warn('Failed to load font for id: '..tostring(o))end
return n.defaultOptions.fallbackFont end local D=n.fontCache if D then D[o]={customId=A,manifest=v,loadedFromDisk=true,
variants={[r]=C}}if n._debug then b.print('Cached font for id: '..tostring(o))end end return C end function f.loadFont(n
:FontManager,o:(number|string)?,p:Enum.FontWeight?,q:Enum.FontStyle?,r:boolean?,s:boolean?):Font?if r==nil then r=n.
defaultOptions.saveToDisk end if s==nil then s=n.defaultOptions.skipCache end local t,u=p or Enum.FontWeight.Regular,q
or Enum.FontStyle.Normal local v,w=k(t,u),n.assetResolver:resolve(o)local x=l(w)if not x then b.warn('Invalid font id: '
..tostring(o))return n.defaultOptions.fallbackFont end local y=n.fontCache if y and not s then local z=y[x]if z then
local A=z.variants and z.variants[v]if A then if n._debug then b.print('Loaded font from cache for id: '..tostring(x))
end return A end local B,C=pcall(Font.new,z.customId::any,t,u)if B and C then z.variants=z.variants or{}z.variants[v]=C
if n._debug then b.print('Loaded font variant from cache for id: '..tostring(x))end return C else if n._debug then b.
warn('Failed to load font from cache for id: '..tostring(x))end y[x]=nil return n.defaultOptions.fallbackFont end end
end if not r then if n._debug then b.warn[[Font loading without saving to disk can be detected by Anti-cheats.]]end
return n.defaultOptions.fallbackFont end local z,A=n._pendingLoads,tostring(x)..'|'..v local B=z[A]if B then table.
insert(B,coroutine.running())return coroutine.yield()end z[A]={}local C,D=pcall(m,n,x,t,u,v)local E=if C then D else n.
defaultOptions.fallbackFont B=z[A]z[A]=nil if B then for F,G in B do coroutine.resume(G,E)end end return E end function
f.resolve(n:FontManager,o:number|string):Font?local p=l(o)if not p then return nil end local q=n.fontCache if q then
local r=q[p]if r then if n._debug then b.print('Resolved font for id: '..tostring(p))end for s,t in pairs(r.variants or{
})do return t end end end return nil end function f.getFontFromId(n:FontManager,o:number|string):Font?return n:resolve(o
)end return f end)()end,[53]=function()local aa,ab,ac=a(53)local ad return(function(...)local ae,af,ag,ah={},ac(ab.
Parent.textMetrics),ac(ab.Parent.colors),ac(ab.Parent.flagNames)ae.textWidth=af.textWidth ae.textHeight=af.textHeight ae
.deriveFlagFromName=ah.deriveFlagFromName ae.contrastColor=ag.contrastColor ae.toColorSequence=ag.toColorSequence ae.
contrastText=ag.contrastText return ae end)()end,[54]=function()local aa,ab,ac=a(54)local ad return(function(...)local
ae,af=ac(ab.Parent.imageCache),ac(ab.Parent.variables)type AvatarCallback=ae.AvatarCallback type PreloadCallback=ae.
PreloadCallback local ag={}ag.rewrites=ae.rewrites ag.onBlock=nil::((unknown)->())?type PendingProperties={[string]:
boolean}ag.pending={}::{[number]:{[Instance]:PendingProperties}}local ah,ai:{[string]:boolean}=false,{Image=true,
HoverImage=true,PressedImage=true}local function b(c:unknown):number?if type(c)=='number'then return c elseif type(c)==
'string'then return tonumber(string.match(c,'^rbxassetid://(%d+)$'))end return nil end local function c(d:unknown):
string if ag.onBlock then ag.onBlock(d)end return''end function ag.preload(d:PreloadCallback?):(boolean,number)ah=false
return ae.preload(function(e)ah=true table.clear(ag.pending)if d then d(e)end end)end function ag.avatar(d:number,e:
AvatarCallback?):string if not af.secureMode then return`rbxthumb://type=AvatarHeadShot&id={d}&w=48&h=48`end return ae.
avatar(d,e)end function ag.assign(d:Instance,e:string,f:unknown)local g=d::any if not ai[e]then g[e]=f return end g[e]=
ag.resolve(f)if af.secureMode and not ah then local h=b(f)if h and not ag.rewrites[h]then local i=ag.pending[h]if not i
then i=setmetatable({},{__mode='k'})::any ag.pending[h]=i end local j=i[d]if not j then j={}i[d]=j end j[e]=true end end
end ae.onCached=function(d:number)local e=ag.pending[d]if not e then return end local f=ag.rewrites[d]if f then for g,h
in e do if g.Parent then local i=g::any for j in h do i[j]=f end end end end ag.pending[d]=nil end function ag.resolve(d
:unknown):string if d==nil or d==0 or d==''then return''end if type(d)=='string'then if string.sub(d,1,11)==
'rbxasset://'then return d end if string.sub(d,1,11)=='rbxthumb://'then return if af.secureMode then c(d)else d end end
local e:number?if type(d)=='number'then e=d elseif type(d)=='string'then e=tonumber(string.match(d,
'^rbxassetid://(%d+)$'))end local f=if e then ag.rewrites[e]else nil if f then return f end if af.secureMode then return
c(d)end if type(d)=='number'then return'rbxassetid://'..d end if type(d)=='string'then return d end return c(d)end
return ag end)()end,[55]=function()local aa,ab,ac=a(55)local ad return(function(...)local ae,af,ag,ah=ac(ab.Parent.
filesystem),ac(ab.Parent.path),ac(ab.Parent.variables),ac(ab.Parent.constants)export type RewriteMap={[number]:string}
export type CacheSettledCallback=(failed:number)->()export type PreloadCallback=CacheSettledCallback export type
AvatarCallback=(uri:string)->()export type OnCachedCallback=(id:number)->()export type ThumbnailEntry={state:string?,
imageUrl:string?}export type ThumbnailResponse={data:{ThumbnailEntry}?}local ai,b,c,d,e,f,g,h:{[number]:string}={},ag.
fileSystemManager:getRootFolder(),ag.fileSystemManager:getAssetsFolder(),ag.assetResolver,
[[https://raw.githubusercontent.com/SiriusSoftwareLtd/rayfield-gen2/main/assets/]],48,
[[https://thumbnails.roblox.com/v1/users/avatar-headshot?userIds=%d&size=%dx%d&format=Png&isCircular=false]],{}for i,j
in ah.icons do local k=j::number h[k]=e..tostring(k)..'.png'end local i=0 for j in h do i+=1 end ai.rewrites={}::
RewriteMap ai.onCached=nil::OnCachedCallback?local j='\137PNG\r\n\26\n'local function k(l:string,m:string):string?if
type(getfenv().getcustomasset)~='function'or typeof(ae.isfile)~='function'then return nil end if not ae.isfile(l)then
pcall(ae.ensureFolder,b)pcall(ae.ensureFolder,c)local n=d:getAssetContentFromUrl(m,l,false)if not n or string.sub(n,1,8)
~=j then return nil end if not pcall(ae.writefile,l,n)then return nil end end local n,o=pcall(getfenv().getcustomasset,l
)return if n and type(o)=='string'then o else nil end local function l(m:number):string return af.join(c,'avatar_'..
tostring(m)..'.png')end local function m(n:string):string?local o,p=pcall(function()return ag.httpService:JSONDecode(n)
end)if not o or type(p)~='table'then return nil end local q=(p::ThumbnailResponse).data if type(q)~='table'then return
nil end local r=q[1]if type(r)~='table'then return nil end local s=r::ThumbnailEntry if s.state=='Completed'and type(s.
imageUrl)=='string'then return s.imageUrl end return nil end local function n(o:number):string?local p:string?for q=1,4
do local r=d:getAssetContentFromUrl(string.format(g,o,f,f),'avatar:'..tostring(o),q>1)if r then local s=m(r)if s then p=
s break end end if q<4 then task.wait(0.3)end end if not p then return nil end return k(l(o),p)end local o:{[number]:{
AvatarCallback}},p:{[number]:boolean}={},{}function ai.preload(q:PreloadCallback?):(boolean,number)local r=getfenv()if
type(r.getcustomasset)~='function'or typeof(ae.isfile)~='function'then if q then task.defer(q,i)end return false,i end
local s=ai.rewrites table.clear(s)local function t()if not q then return end local u=0 for v in h do if not s[v]then u+=
1 end end q(u)end local u,v,w=0,0,true for x,y in h do local z,A:string?=(af.join(c,tostring(x)..'.png'))if ae.isfile(z)
then local B,C=pcall(r.getcustomasset,z)A=if B and type(C)=='string'then C else nil end if A then s[x]=A else v+=1 u+=1
task.spawn(function()local B=k(z,y)if B then s[x]=B if ai.onCached then pcall(ai.onCached,x)end end u-=1 if u==0 and not
w then t()end end)end end w=false if u==0 then t()end return v==0,v end function ai.avatar(q:unknown,r:AvatarCallback?):
string if type(q)~='number'then return''end if typeof(ae.isfile)~='function'then return''end local s=l(q)if ae.isfile(s)
then local t,u=pcall(getfenv().getcustomasset,s)if t and type(u)=='string'then return u end end if p[q]then return''end
local t=o[q]if t then if r then table.insert(t,r)end return''end if r then o[q]={r}task.spawn(function()local u,v=n(q),o
[q]o[q]=nil if not u then p[q]=true return end if v then for w,x in v do pcall(x,u)end end end)end return''end return ai
end)()end,[56]=function()local aa,ab,ac=a(56)local ad return(function(...)local ae,af={},64 local ag,ah,ai=af-1,38,3
export type Mode='top'|'sidebar'export type Layout={mode:Mode,topbarHeight:number,chromeHeight:number,pageDirection:Enum
.FillDirection,fadeSize:UDim2,fadeTransparency:NumberSequence,fadeCorners:{string}?,tabStripTop:number?,tabStripHeight:
number?,railWidth:number?,railCollapsedWidth:number?,railCollapseBelow:number?,rowHeight:number?,rowCornerRadius:number?
,rowSpacing:number?,railPadding:number?,rowInset:number?,rowPadding:number?,rowContentSpacing:number?,rowIconSize:number
?,footerHeight:number?,avatarSize:number?,cardTransparency:number?,cardStrokeRotation:number?,cardStrokeTransparency:
NumberSequence?,cardCorners:{string}?}ae.top={mode='top'::Mode,topbarHeight=af,chromeHeight=ag+ah+ai,tabStripTop=ag,
tabStripHeight=ah,pageDirection=Enum.FillDirection.Horizontal,fadeSize=UDim2.new(1,0,-9.3E-2,100),fadeTransparency=
NumberSequence.new{NumberSequenceKeypoint.new(0,0),NumberSequenceKeypoint.new(0.4414,0),NumberSequenceKeypoint.new(
0.7007,0.631),NumberSequenceKeypoint.new(1,1)}}::Layout ae.sidebar={mode='sidebar'::Mode,topbarHeight=af,chromeHeight=af
,railWidth=219,railCollapsedWidth=64,railCollapseBelow=589,rowHeight=38,rowCornerRadius=14,rowSpacing=4,railPadding=17,
rowInset=15,rowPadding=10,rowContentSpacing=6,rowIconSize=20,footerHeight=60,avatarSize=34,pageDirection=Enum.
FillDirection.Vertical,cardTransparency=0.98,cardStrokeRotation=55,cardCorners={'TopLeftRadius','BottomRightRadius'},
cardStrokeTransparency=NumberSequence.new{NumberSequenceKeypoint.new(0,0.9),NumberSequenceKeypoint.new(0.128,0.95),
NumberSequenceKeypoint.new(0.414,0.985),NumberSequenceKeypoint.new(1,1)},fadeSize=UDim2.new(1,0,0,55),fadeTransparency=
NumberSequence.new{NumberSequenceKeypoint.new(0,0),NumberSequenceKeypoint.new(0.377,0),NumberSequenceKeypoint.new(1,1)},
fadeCorners={'BottomRightRadius'}}::Layout function ae.get(b:unknown):Layout?if b=='sidebar'then return ae.sidebar
elseif b=='top'then return ae.top end return nil end function ae.railWidthFor(b:Layout,c:number):number if b.mode~=
'sidebar'then return 0 end local d=b.railWidth::number if c<(b.railCollapseBelow::number)then return b.
railCollapsedWidth::number end return d end return ae end)()end,[57]=function()local aa,ab,ac=a(57)local ad return(
function(...)local ae,af,ag=ac(ab.Parent.variables),ac(ab.Parent.log),{}export type LocaleToken={[any]:string}export
type Translator=(source:string,localeId:string)->string?export type TranslationTables={[string]:{[string]:string}}ag.
strings={}::TranslationTables ag.current='en'ag.translator=nil::Translator?local ah={}local function ai(b:string):string
return string.match(b,'^(%a+)')or b end function ag.t(b:unknown):unknown if type(b)~='string'or b==''then return b end
return{[ah]=b}end function ag.isToken(b:unknown):boolean return type(b)=='table'and type((b::{[any]:unknown})[ah])==
'string'end function ag.sourceOf(b:LocaleToken):string return b[ah]end function ag.resolve(b:unknown):any if type(b)~=
'string'then return b end if ag.translator then local c,d=pcall(ag.translator,b,ag.current)if c and type(d)=='string'and
d~=''then return d end end local c=ag.strings[ag.current]if c and c[b]then return c[b]end local d=ag.strings[ai(ag.
current)]if d and d[b]then return d[b]end return b end function ag.register(b:TranslationTables?)if type(b)~='table'then
return end for c,d in b do if type(c)=='string'and type(d)=='table'then c=string.lower(c)local e=ag.strings[c]if not e
then e={}ag.strings[c]=e end for f,g in d do if type(f)=='string'and type(g)=='string'then e[f]=g else af.warn(`Rayfield: skipping a '{
c}' translation, entries must be string to string.`)end end end end end function ag.setActive(b:string?):string ag.
current=if type(b)=='string'and b~=''then string.lower(b)else'en'return ag.current end function ag.detect():string local
b=ae.localizationService.RobloxLocaleId if type(b)=='string'and b~=''then return string.lower(b)end return'en'end return
ag end)()end,[58]=function()local aa,ab,ac=a(58)local ad return(function(...)local function ae<T>(af:T):T local ag=af::
any function ag.Lock(ah,ai:string?)ah.window:_setElementLocked(ah,true,ai)end function ag.Unlock(ah)ah.window:
_setElementLocked(ah,false)end function ag.IsLocked(ah):boolean return ah.locked==true end return af end return ae end)(
)end,[59]=function()local aa,ab,ac=a(59)local ad return(function(...)local ae,af=ac(ab.Parent.runtime),{}type
SuppressPredicate=()->boolean local function ag():boolean return ae.secureMode end local ah:SuppressPredicate,ai:
SuppressPredicate?=ag function af.setSecureModeSource(b:SuppressPredicate?)ah=if type(b)=='function'then b else ag end
function af.setSuppressPredicate(b:SuppressPredicate?)ai=if type(b)=='function'then b else nil end local function b():
boolean if ai and ai()then return true end return ah()end function af.warn(...)if b()then return end warn(...)end
function af.print(...)if b()then return end print(...)end return af end)()end,[60]=function()local aa,ab,ac=a(60)local
ad return(function(...)local function ae<T>(af:T):T local ag=af::any function ag.MoveTo(ah,ai:number)ah.tab:
_moveElement(ah,ai)end function ag.MoveToTop(ah)ah.tab:_moveElement(ah,1)end function ag.MoveToBottom(ah)ah.tab:
_moveElement(ah,#ah.tab.elements)end function ag.MoveUp(ah)local ai=table.find(ah.tab.elements,ah)if ai then ah.tab:
_moveElement(ah,ai-1)end end function ag.MoveDown(ah)local ai=table.find(ah.tab.elements,ah)if ai then ah.tab:
_moveElement(ah,ai+1)end end return af end return ae end)()end,[61]=function()local aa,ab,ac=a(61)local ad return(
function(...)local ae={}ae.__index=ae export type RequestFn=(...any)->any function ae.getRequestFn(af:any?):RequestFn?af
=af or getfenv()return af.request or af.http_request or(af.http and af.http.request)or(af.syn and af.syn.request)or(af.
fluxus and af.fluxus.request)end return ae end)()end,[62]=function()local aa,ab,ac=a(62)local ad return(function(...)
local ae=ac(ab.Parent.variables)local af,ag=ae.textService,{}ag.__index=ag local ah=20 local function ai(b,c,d)local e=
Instance.new'GetTextBoundsParams'e.Text=d e.Font=b e.Size=c e.Width=math.huge local f,g=pcall(af.GetTextBoundsAsync,af,e
)return if f then g else Vector2.new(c*0.6,c)end local b={}local function c(d,e)local f=tostring(d.Family)..'|'..
tostring(d.Weight)..'|'..tostring(d.Style)..'|'..tostring(e)local g=b[f]if g then return g end local h,i={},0 for j=0,9
do local k=math.ceil(ai(d,e,tostring(j)).X)h[j]=k if k>i then i=k end end g={advance=h,maxWidth=i}b[f]=g return g end
function ag.new(d,e,f)f=f or{}local g=setmetatable({window=d,container=e,textSize=f.textSize or 16,transparency=f.
transparency or 1,duration=f.duration or 0.55,slots={},length=0},ag)g.roll=TweenInfo.new(g.duration,Enum.EasingStyle.
Quint,Enum.EasingDirection.Out)g.zIndex=math.max(e.ZIndex+1,6)g.height=math.ceil(g.textSize)local h=c(d.theme.Font,g.
textSize)g.advance=h.advance g.maxWidth=h.maxWidth d:Create('UIListLayout',{FillDirection=Enum.FillDirection.Horizontal,
VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=f.alignment or Enum.HorizontalAlignment.Left,
SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,0),Parent=e})return g end function ag._reel(d,e)local f=d.slots[
e]if f.reel then return f.reel end local g=d.window:Create('Frame',{Name='Reel',Size=UDim2.fromOffset(d.maxWidth,d.
height),BackgroundTransparency=1,BorderSizePixel=0,ClipsDescendants=true,ZIndex=d.zIndex,Parent=d.container})local h=d.
window:Create('Frame',{Size=UDim2.fromOffset(d.maxWidth,d.height),AnchorPoint=Vector2.new(0.5,0),Position=UDim2.new(0.5,
0,0,0),BackgroundTransparency=1,BorderSizePixel=0,ZIndex=d.zIndex,Parent=g})for i=0,ah-1 do d.window:Create('TextLabel',
{Text=tostring(i%10),Position=UDim2.fromOffset(0,i*d.height),Size=UDim2.fromOffset(d.maxWidth,d.height),
BackgroundTransparency=1,BorderSizePixel=0,TextSize=d.textSize,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=
Enum.TextYAlignment.Center,TextTransparency=d.transparency,ZIndex=d.zIndex,Parent=h},{TextColor3='ContentColor',FontFace
='Font'})end local i={cell=g,strip=h,digit=0,target=0,stripTween=nil,sizeTween=nil}f.reel=i return i end function ag.
_static(d,e)local f=d.slots[e]if f.static then return f.static end local g=d.window:Create('TextLabel',{Name='Static',
Size=UDim2.fromOffset(0,d.height),AutomaticSize=Enum.AutomaticSize.X,BackgroundTransparency=1,BorderSizePixel=0,TextSize
=d.textSize,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,TextTransparency=d.
transparency,ZIndex=d.zIndex,Parent=d.container},{TextColor3='ContentColor',FontFace='Font'})f.static=g return g end
local function d(e)if e.stripTween then e.stripTween:Cancel()e.stripTween=nil end if e.sizeTween then e.sizeTween:
Cancel()e.sizeTween=nil end end function ag._reelSnap(e,f,g)d(f)f.cell.Size=UDim2.fromOffset(e.advance[g],e.height)f.
strip.Position=UDim2.new(0.5,0,0,-g*e.height)f.digit=g f.target=g end function ag._reelRoll(e,f,g,h)if f.stripTween or f
.sizeTween then e:_reelSnap(f,f.target)end local i=f.digit if i==g then return end local j,k if h then j=i k=i+(g-i)%10
else j=i+10 k=j-(i-g)%10 end f.strip.Position=UDim2.new(0.5,0,0,-j*e.height)f.target=g local l,m=ae.tweenService:Create(
f.strip,e.roll,{Position=UDim2.new(0.5,0,0,-k*e.height)}),ae.tweenService:Create(f.cell,e.roll,{Size=UDim2.fromOffset(e.
advance[g],e.height)})f.stripTween=l f.sizeTween=m l.Completed:Connect(function(n)if n==Enum.PlaybackState.Completed and
f.stripTween==l then e:_reelSnap(f,g)end end)l:Play()m:Play()f.digit=g end function ag._putDigit(e,f,g,h,i)local j=e:
_reel(f)local k=not j.cell.Visible j.cell.Visible=true j.cell.LayoutOrder=-f if e.slots[f].static then e.slots[f].static
.Visible=false end if i and not k then e:_reelRoll(j,g,h)else e:_reelSnap(j,g)end end function ag._putStatic(e,f,g)local
h=e:_static(f)if not h.Visible then h.TextTransparency=e.transparency end h.Text=g h.Visible=true h.LayoutOrder=-f if e.
slots[f].reel then e.slots[f].reel.cell.Visible=false end end function ag._hide(e,f)local g=e.slots[f]if not g then
return end if g.reel then g.reel.cell.Visible=false end if g.static then g.static.Visible=false end end function ag.
_render(e,f,g,h)f=tostring(f)if f==e._lastText then return end e._lastText=f local i={}for j,k in utf8.codes(f)do table.
insert(i,utf8.char(k))end local j=#i for k=0,math.max(j,e.length)-1 do e.slots[k]=e.slots[k]or{}if k<j then local l=i[j-
k]if l:match'%d'then e:_putDigit(k,tonumber(l),h,g)else e:_putStatic(k,l)end else e:_hide(k)end end e.length=j end
function ag.to(e,f,g)e:_render(f,true,g)end function ag.snap(e,f)e:_render(f,false,true)end function ag.reveal(e,f,g,h)e
.transparency=f for i,j in e.slots do if j.static and j.static.Visible then e.window:_reveal(j.static,{TextTransparency=
f},g,h)end if j.reel then for k,l in j.reel.strip:GetChildren()do if l:IsA'TextLabel'then e.window:_reveal(l,{
TextTransparency=f},g,h)end end end end end function ag.setColor(e,f)e.color=f for g,h in e.slots do if h.static and h.
static.Visible then h.static.TextColor3=f end if h.reel then for i,j in h.reel.strip:GetChildren()do if j:IsA'TextLabel'
then j.TextColor3=f end end end end end return ag end)()end,[63]=function()local aa,ab,ac=a(63)local ad return(function(
...)type OrderedElement={main:GuiObject,descriptor:{main:GuiObject}?}local function ae(af:OrderedElement,ag:number)af.
main.LayoutOrder=ag if af.descriptor then af.descriptor.main.LayoutOrder=ag+1 end end return ae end)()end,[64]=function(
)local aa,ab,ac=a(64)local ad return(function(...)local ae={}function ae.join(af:string,ag:string?):string if not ag or
ag==''then return af end return af..'/'..ag end local function af(ag:string):string local ah repeat ah=ag ag=ag:gsub(
'%.%.','')until ag==ah return ag end function ae.sanitizeFolder(ag:unknown):string local ah=tostring(ag):gsub('\\','/'):
gsub('[:<>"|?*%c]','')ah=af(ah):gsub('/+','/')return(ah:gsub('^/+',''))end function ae.sanitizeFile(ag:unknown):string
local ah=tostring(ag):gsub('[/\\]',''):gsub('[:<>"|?*%c]','')return af(ah)end function ae.basename(ag:unknown):string
return tostring(ag):match'[^/\\]+$'or tostring(ag)end function ae.stripExtension(ag:unknown,ah:string?):string if ah and
ah~=''then local ai=tostring(ag)if ai:sub(-#ah)==ah then return ai:sub(1,-#ah-1)end return ai end local ai=tostring(ag):
match'^(.+)%.%w+$'return ai or tostring(ag)end return ae end)()end,[65]=function()local aa,ab,ac=a(65)local ad return(
function(...)local ae,af,ag={},ac(ab.Parent.persistenceConfig),ac(ab.Parent.persistenceSettings)ae.getPath=af.getPath ae
.save=af.save ae.load=af.load ae.applyTo=af.applyTo ae.list=af.list ae.delete=af.delete ae.getSettingsPath=ag.
getSettingsPath ae.saveSettings=ag.saveSettings ae.loadSettings=ag.loadSettings return ae end)()end,[66]=function()local
aa,ab,ac=a(66)local ad return(function(...)local ae,af,ag,ah,ai,b,c=ac(ab.Parent.variables),ac(ab.Parent.filesystem),ac(
ab.Parent.log),ac(ab.Parent.path),ac(ab.Parent.persistencePaths),ac(ab.Parent.persistenceWrite),{}type PersistedControl=
{value:unknown,flag:string?,_canBeNil:boolean?,_serialize:((PersistedControl)->unknown)?,_deserialize:((PersistedControl
,unknown)->())?,Set:(PersistedControl,unknown)->()}type ConfigWindow={controls:{[string]:PersistedControl},configuration
:{fileName:string?,customFolder:string?},name:string,_loading:boolean?,_loadedConfig:{[string]:unknown}?,
_loadedConfigPath:string?}function c.getPath(d:ConfigWindow,e:unknown?):(string?,string?)return ai.getConfigPath(d,e)end
function c.save(d:ConfigWindow,e:unknown?):boolean local f,g=c.getPath(d,e)if not f or not g then ag.warn(
"Rayfield: configuration name '"..tostring(e).."' has no usable characters")return false end if typeof(af.writefile)~=
'function'then return false end local h:{[string]:unknown}={}for i,j in d.controls do local k,l=pcall(function()local k=
j._serialize if k then return k(j)end return j.value end)if k then h[i]=l else ag.warn(
"Rayfield: Failed to serialize flag '"..tostring(i).."' - "..tostring(l))end end local i=d._loadedConfig if i and d.
_loadedConfigPath==g then for j,k in i do if d.controls[j]==nil then h[j]=k end end end local j,k=pcall(ae.httpService.
JSONEncode,ae.httpService,h)if not j then ag.warn('Rayfield: Failed to encode configuration - '..tostring(k))return
false end local l,m=pcall(function()b.write(f,g,k)end)if not l then ag.warn('Rayfield: Failed to save configuration - '
..tostring(m))return false end if d._loadedConfigPath==nil or d._loadedConfigPath==g then d._loadedConfig=h d.
_loadedConfigPath=g end return true end local function d(e:string):({[string]:unknown}?,string?)if not af.isfile(e)then
return nil,nil end local f,g=pcall(af.readfile,e)if not f or type(g)~='string'then ag.warn
'Rayfield: Failed to read configuration file'return nil,nil end local h,i=pcall(ae.httpService.JSONDecode,ae.httpService
,g)if not h or type(i)~='table'then return nil,g end return i::{[string]:unknown},g end local function e(f:string):
string local g=ah.stripExtension(f,'.rfld')local h,i=g..' (Incorrect Format).rfld',2 while i<=100 and af.isfile(h)do h=g
..' (Incorrect Format '..i..').rfld'i+=1 end return h end function c.load(f:ConfigWindow,g:unknown?):boolean local h,i=c
.getPath(f,g)if not h or not i then ag.warn("Rayfield: configuration name '"..tostring(g).."' has no usable characters")
return false end if typeof(af.isfile)~='function'then return false end local j,k=d(i)if not j and af.isfile(i)then local
l,m=d(b.tempPathFor(i))if l and m then j=l pcall(b.write,h,i,m)end end if not j then if k then ag.warn
[[Rayfield: Configuration file has an invalid format, backing up and resetting]]local l=e(i)pcall(function()af.
ensureDir(h)af.writefile(l,k)af.delfile(i)end)end return false end local l,m=j::{[string]:unknown},f._loading f._loading
=true local n,o=pcall(function()for n,o in f.controls do c.applyTo(o,l[n])end end)f._loading=m if not n then ag.warn(
'Rayfield: Failed to apply configuration - '..tostring(o))end f._loadedConfig=l f._loadedConfigPath=i return true end
function c.applyTo(f:PersistedControl,g:unknown)if g==nil and not f._canBeNil then return end local h,i=pcall(function()
local h=f._deserialize if h then h(f,g)else f:Set(g)end end)if not h then ag.warn("Rayfield: Failed to restore flag '"..
tostring(f.flag).."' - "..tostring(i))end end function c.list(f:ConfigWindow):{string}local g,h:{string}=c.getPath(f),{}
if not g then return h end local i,j=pcall(af.listfiles,g)if not i or type(j)~='table'then return h end for k,l in j do
local m=ah.basename(l)if m:sub(-5)=='.rfld'then local n=ah.stripExtension(m,'.rfld')if n and n~=''and not n:find
' %(Incorrect Format[^%)]*%)$'then table.insert(h,n)end end end table.sort(h)return h end function c.delete(f:
ConfigWindow,g:unknown):boolean if type(g)~='string'or g==''then return false end local h,i=c.getPath(f,g)if not i then
return false end if typeof(af.isfile)~='function'or not af.isfile(i)then return false end pcall(af.delfile,b.
tempPathFor(i))return(pcall(af.delfile,i))end return c end)()end,[67]=function()local aa,ab,ac=a(67)local ad return(
function(...)local ae,af,ag=ac(ab.Parent.variables),ac(ab.Parent.path),{}type ConfigWindow={configuration:{fileName:
string?,customFolder:string?},name:string}function ag.getConfigPath(ah:ConfigWindow,ai:unknown?):(string?,string?)local
b=ae.fileSystemManager:getPath'Configurations'if ah.configuration.customFolder then b=af.join(b,af.sanitizeFolder(ah.
configuration.customFolder))end if ai~=nil then local c=af.sanitizeFile(ai)if c==''then return nil,nil end return b,af.
join(b,c..'.rfld')end local c=af.sanitizeFile(ah.configuration.fileName or ah.name)if c==''then c=af.sanitizeFile(ah.
name)end if c==''then c='Configuration'end return b,af.join(b,c..'.rfld')end function ag.getSettingsPath():(string,
string)local ah=ae.fileSystemManager:getPath'Settings'return ah,af.join(ah,'rayfield.rfld')end return ag end)()end,[68]=
function()local aa,ab,ac=a(68)local ad return(function(...)local ae,af,ag,ah,ai,b=ac(ab.Parent.variables),ac(ab.Parent.
filesystem),ac(ab.Parent.persistencePaths),ac(ab.Parent.persistenceWrite),ac(ab.Parent.enums),{}type SettingsWindow={
settings:{toggleKeybind:EnumItem,mouseOverride:boolean,keepOnScreen:boolean,welcomeToast:boolean,haptics:boolean,
showProfile:boolean}}type DecodedSettings={toggleKeybind:{[number]:unknown}?,mouseOverride:unknown?,keepOnScreen:unknown
?,welcomeToast:unknown?,haptics:unknown?,showProfile:unknown?}function b.getSettingsPath():(string,string)return ag.
getSettingsPath()end function b.saveSettings(c:SettingsWindow):boolean local d,e=b.getSettingsPath()local f:{[string]:
unknown}={toggleKeybind={tostring(c.settings.toggleKeybind.EnumType),c.settings.toggleKeybind.Value}::{unknown},
mouseOverride=c.settings.mouseOverride,keepOnScreen=c.settings.keepOnScreen,welcomeToast=c.settings.welcomeToast,haptics
=c.settings.haptics,showProfile=c.settings.showProfile}local g,h=pcall(ae.httpService.JSONEncode,ae.httpService,f)if not
g then return false end local i=pcall(ah.write,d,e,h)if not i then return false end return true end local function c(d:
string):(DecodedSettings?,string?)local e=false pcall(function()e=af.isfile(d)end)if not e then return nil,nil end local
f,g=pcall(af.readfile,d)if not f or type(g)~='string'then return nil,nil end local h,i=pcall(ae.httpService.JSONDecode,
ae.httpService,g)if not h or type(i)~='table'then return nil,g end return i::DecodedSettings,g end function b.
loadSettings(d:SettingsWindow):boolean local e,f=b.getSettingsPath()local g=c(f)if not g then local h,i=c(ah.
tempPathFor(f))if h and i then g=h pcall(ah.write,e,f,i)end end if not g then return false end if g.toggleKeybind then
pcall(function()local h=tostring(g.toggleKeybind[1]):gsub('^Enum%.','')local i=(Enum::any)[h]if i then local j=ai.
itemFromValue(i,g.toggleKeybind[2])if j then d.settings.toggleKeybind=j end end end)end if type(g.mouseOverride)==
'boolean'then d.settings.mouseOverride=g.mouseOverride end if type(g.keepOnScreen)=='boolean'then d.settings.
keepOnScreen=g.keepOnScreen end if type(g.welcomeToast)=='boolean'then d.settings.welcomeToast=g.welcomeToast end if
type(g.haptics)=='boolean'then d.settings.haptics=g.haptics end if type(g.showProfile)=='boolean'then d.settings.
showProfile=g.showProfile end return true end return b end)()end,[69]=function()local aa,ab,ac=a(69)local ad return(
function(...)local ae,af,ag=ac(ab.Parent.filesystem),{},'.saving'function af.tempPathFor(ah:string):string return ah..ag
end function af.write(ah:string,ai:string,b:string)local c=af.tempPathFor(ai)ae.ensureDir(ah)ae.writefile(c,b)if ae.
readfile(c)~=b then error'parked copy did not write cleanly'end ae.writefile(ai,b)pcall(ae.delfile,c)end return af end)(
)end,[70]=function()local aa,ab,ac=a(70)local ad return(function(...)local ae=ac(ab.Parent.services)export type
RuntimeState={secureMode:boolean,coreGui:CoreGui,workspace:Workspace,runService:RunService,userInputService:
UserInputService,guiService:GuiService,localPlayer:Player?,tweenService:TweenService,httpService:HttpService,textService
:TextService,replicatedStorage:ReplicatedStorage,localizationService:LocalizationService,guiContainer:Instance}local af=
{}::RuntimeState af.secureMode=(function()if typeof(getgenv)~='function'then return false end local ag,ah=pcall(function
()return getgenv().RAYFIELD_SECURE end)return ag and ah==true end)()af.coreGui=ae.getService'CoreGui'::CoreGui af.
workspace=ae.getService'Workspace'::Workspace af.runService=ae.getService'RunService'::RunService af.userInputService=ae
.getService'UserInputService'::UserInputService af.guiService=ae.getService'GuiService'::GuiService af.localPlayer=(ae.
getService'Players'::Players).LocalPlayer af.tweenService=ae.getService'TweenService'::TweenService af.httpService=ae.
getService'HttpService'::HttpService af.textService=ae.getService'TextService'::TextService af.replicatedStorage=ae.
getService'ReplicatedStorage'::ReplicatedStorage af.localizationService=ae.getService'LocalizationService'::
LocalizationService af.guiContainer=(function():Instance if af.runService:IsStudio()then local ag=af.localPlayer if ag
then return ag.PlayerGui end return af.coreGui end if typeof(gethui)=='function'then local ag,ah=pcall(gethui)if ag and
ah then return ah end end return af.coreGui end)()return af end)()end,[71]=function()local aa,ab,ac=a(71)local ad return
(function(...)local ae={}function ae.getService(af)local ag=game:GetService(af)return if cloneref then cloneref(ag)else
ag end return ae end)()end,[72]=function()local aa,ab,ac=a(72)local ad return(function(...)local ae=ac(ab.Parent.
variables)local af,ag,ah:{[string]:number},ai,b=ae.textService,{},{},0,1024 local function c(d:GetTextBoundsParams):
unknown local e,f=pcall(function()return af:GetTextBoundsAsync(d)end)return if e then f else nil end local function d(e:
unknown,f:'X'|'Y'):number?if typeof(e)=='Vector2'then return if f=='X'then e.X else e.Y end if type(e)=='table'and type(
(e::any)[f])=='number'then return(e::any)[f]end return nil end function ag.textWidth(e:Font,f:number,g:any):number g=
tostring(g)local h=tostring(e.Family)..'|'..tostring(e.Weight)..'|'..tostring(e.Style)..'|'..tostring(f)..'|'..g local i
=ah[h]if i then return i end local j=Instance.new'GetTextBoundsParams'j.Text=g j.Font=e j.Size=f j.Width=math.huge local
k=d(c(j),'X')if not k then local l=utf8.len(g)or#g return math.ceil(f*0.55*l)end local l=math.ceil(k)if ai>=b then ah={}
ai=0 end ah[h]=l ai+=1 return l end function ag.textHeight(e:Font,f:number,g:any,h:number):number local i=Instance.new
'GetTextBoundsParams'i.Text=tostring(g)i.Font=e i.Size=f i.Width=h local j=d(c(i),'Y')return if j then math.ceil(j)else
f end return ag end)()end,[73]=function()local aa,ab,ac=a(73)local ad return(function(...)local ae,af,ag,ah,ai,b=ac(ab.
Parent.runtime),ac(ab.Parent.constants),ac(ab.Parent.log),ac(ab.Parent.filesystemManager),ac(ab.Parent.assetResolver),
ac(ab.Parent.fontManager)type RuntimeState=ae.RuntimeState type FileSystemManager=ah.FileSystemManager type
AssetResolver=ai.AssetResolver type FontManager=b.FontManager export type VariablesState=RuntimeState&{fallbackFont:Font
,fileSystemManager:FileSystemManager,assetResolver:AssetResolver,fontManager:FontManager,setFallbackFont:(font:Enum.Font
|Font)->(),brandFont:(weight:Enum.FontWeight?)->Font}local c=table.clone(ae)::VariablesState ag.setSecureModeSource(
function()return c.secureMode end)c.fallbackFont=Font.fromEnum(Enum.Font.BuilderSans)c.fileSystemManager=ah.new()c.
assetResolver=ai.new(true,ai.Enum.AssetDownloadUrl.RoProxyDownloadUrl)::AssetResolver c.fontManager=b.new(c.
fileSystemManager:getAssetsFolder'fonts',false,true,ai.Enum.AssetDownloadUrl.RoProxyDownloadUrl,{saveToDisk=true,
skipCache=false,fallbackFont=c.fallbackFont})::FontManager function c.setFallbackFont(d:Enum.Font|Font)if typeof(d)==
'EnumItem'then d=Font.fromEnum(d)end if typeof(d)=='Font'then c.fallbackFont=d c.fontManager.defaultOptions.fallbackFont
=d end end function c.brandFont(d:Enum.FontWeight?):Font if c.secureMode then return Font.new(c.fallbackFont.Family,d)
end return Font.new(af.fontAsset,d)end return c end)()end,[74]=function()local aa,ab,ac=a(74)local ad return(function(
...)local ae,af=ac(ab.Parent.layouts),{}export type Profile={defaultSize:Vector2,minSize:Vector2,maxOccupancyX:number,
maxOccupancyY:number?,marginFloorX:number,marginFloorY:number,topbarClearance:number?,maxAspectRatio:number,
minAspectRatio:number?,widthCompensation:number?,chromeHeight:number}local ag,ah=200,{top={defaultSize=Vector2.new(475,
500),minSize=Vector2.new(300,285),maxOccupancyX=0.86,topbarClearance=36,marginFloorX=24,marginFloorY=28,maxAspectRatio=
2.3,widthCompensation=130,chromeHeight=ae.top.chromeHeight}::Profile,sidebar={defaultSize=Vector2.new(685,450),minSize=
Vector2.new(560,350),maxOccupancyX=0.92,maxOccupancyY=0.8,marginFloorX=24,marginFloorY=28,maxAspectRatio=2.6,
minAspectRatio=1.2,chromeHeight=ae.sidebar.chromeHeight}::Profile}function af.profile(ai:ae.Mode?):Profile if ai==
'sidebar'then return ah.sidebar end return ah.top end function af.pageHeight(ai:number?,b:ae.Mode?):number local c=af.
profile(b)local d=if ai and ai>0 then ai else c.minSize.Y return math.max(d-c.chromeHeight,0)end local function ai(b:
Profile,c:number):number local d=c-b.marginFloorY if b.topbarClearance then d=math.min(d,c-b.topbarClearance*2)end if b.
maxOccupancyY then d=math.min(d,c*b.maxOccupancyY)end return d end local function b(c:number,d:number,e:number):number
return math.clamp((d-c)/(d-e),0,1)end local function c(d:Profile,e:number,f:number):UDim2 local g=math.floor(math.min(
math.clamp(f,d.minSize.Y,d.defaultSize.Y),f))local h=b(g,d.defaultSize.Y,d.minSize.Y)local i=math.max(d.defaultSize.X+(d
.widthCompensation::number)*h,d.minSize.X)return UDim2.fromOffset(math.floor(math.min(i,e,g*d.maxAspectRatio)),g)end
local function d(e:Profile,f:number,g:number):UDim2 local h,i=math.min(math.clamp(f,e.minSize.X,e.defaultSize.X),f),math
.min(math.clamp(g,e.minSize.Y,e.defaultSize.Y),g)i=math.floor(math.min(i,h/(e.minAspectRatio::number)))h=math.floor(math
.min(h,i*e.maxAspectRatio))return UDim2.fromOffset(h,i)end function af.fit(e:Vector2?,f:ae.Mode?):UDim2 local g=af.
profile(f)if not e or e.X<ag or e.Y<ag then return UDim2.fromOffset(g.defaultSize.X,g.defaultSize.Y)end local h,i=math.
min(e.X*g.maxOccupancyX,e.X-g.marginFloorX),ai(g,e.Y)if g.minAspectRatio then return d(g,h,i)end return c(g,h,i)end
function af.ceiling(e:Vector2?,f:ae.Mode?):Vector2 local g=af.profile(f)if not e or e.X<ag or e.Y<ag then return g.
defaultSize end local h,i=math.min(e.X*g.maxOccupancyX,e.X-g.marginFloorX),ai(g,e.Y)return Vector2.new(math.floor(h),
math.floor(i))end return af end)()end},{{1,2,{'Rayfield'},{{43,1,{'utility'},{{67,2,{'persistencePaths'}},{48,2,{'enums'
}},{56,2,{'layouts'}},{71,2,{'services'}},{53,2,{'functions'}},{58,2,{'lockable'}},{61,2,{'network'}},{54,2,{'image'}},{
72,2,{'textMetrics'}},{55,2,{'imageCache'}},{51,2,{'flagNames'}},{60,2,{'moveable'}},{74,2,{'windowSizing'}},{69,2,{
'persistenceWrite'}},{52,2,{'fontManager'}},{59,2,{'log'}},{70,2,{'runtime'}},{49,2,{'filesystem'}},{65,2,{'persistence'
}},{63,2,{'ordering'}},{68,2,{'persistenceSettings'}},{66,2,{'persistenceConfig'}},{64,2,{'path'}},{44,2,{'HapticEngine'
}},{62,2,{'odometer'}},{73,2,{'variables'}},{46,2,{'colors'}},{47,2,{'constants'}},{45,2,{'assetResolver'}},{57,2,{
'locale'}},{50,2,{'filesystemManager'}}}},{2,1,{'components'},{{6,2,{'chrome'}},{34,2,{'window'}},{33,2,{'toggle'}},{16,
2,{'input'}},{15,2,{'home'}},{31,2,{'text'}},{26,2,{'stat'}},{5,2,{'changelog'}},{13,2,{'gameInfo'}},{32,2,{'toast'}},{
23,2,{'section'}},{30,2,{'tag'}},{9,2,{'descriptor'}},{29,2,{'tabSelector'}},{10,2,{'divider'}},{12,2,{'dropdown'}},{18,
2,{'notification'}},{21,2,{'resize'}},{17,2,{'keybind'}},{28,2,{'tabSection'}},{19,2,{'popup'}},{25,2,{'slider'}},{24,2,
{'sidebar'}},{22,2,{'search'}},{7,2,{'colorpicker'}},{11,2,{'drag'}},{27,2,{'tab'}},{3,2,{'action'}},{20,2,{'progress'}}
,{8,2,{'console'}},{14,2,{'group'}},{4,2,{'button'}}}},{42,2,{'types'}},{35,1,{'themes'},{{39,2,{'ember'}},{36,2,{
'amethyst'}},{41,2,{'rose'}},{40,2,{'frost'}},{38,2,{'default'}},{37,2,{'cobalt'}}}}}}},'0.4.1','Rayfield',string,task,
setmetatable,error,next,table,unpack,coroutine,script,type,require,pcall,xpcall,tostring,tonumber,_VERSION local n,o,p,q
,r,s,t=b.insert,b.remove,b.freeze or function(n)return n end,d.wrap,ae.sub,ae.match,ae.gmatch if l and r(l,1,4)=='Lune'
then local u,v=h(g,'@lune/task')if u and v then af=v end end local u=af and af.defer local v,w,x,y,z,A,B,C,D=u or
function(v,...)q(v)(...)end,{[1]='Folder',[2]='ModuleScript',[3]='Script',[4]='LocalScript',[5]='StringValue'},{},{},{},
{},{},{},{}local E,F={GetFullName={{},function(E)local F,G=E.Name,E.Parent while G do F=G.Name..'.'..F G=G.Parent end
return F end},GetChildren={{},function(E)local F={}for G in ai,D[E]do n(F,G)end return F end},GetDescendants={{},
function(E)local F={}for G in ai,D[E]do n(F,G)for H,I in ai,G:GetDescendants()do n(F,I)end end return F end},
FindFirstChild={{'string','boolean?'},function(E,F,G)local H=D[E]for I in ai,H do if I.Name==F then return I end end if
G then for I in ai,H do return I:FindFirstChild(F,true)end end end},FindFirstAncestor={{'string'},function(E,F)local G=E
.Parent while G do if G.Name==F then return G end G=G.Parent end end},WaitForChild={{'string','number?'},function(E,F)
return E:FindFirstChild(F)end}},{}for G,H in ai,E do local I,J,K=H[1],H[2],{}for L,M in ai,I do local N,O=s(M,
'^([^%?]+)(%??)')K[L]={N,O}end F[G]=function(L,...)if not D[L]then ah("Expected ':' not '.' calling member function "..G
,2)end local M={...}for N,O in ai,K do local P=M[N]local Q,R,S=f(P),O[1],O[2]if P==nil and not S then ah('Argument '..P
..' missing or nil',3)end if R~='any'and Q~=R and not(Q=='nil'and S)then ah('Argument '..N..' expects type "'..R..
'", got "'..Q..'"',2)end end return J(L,...)end end local function G(H,I,J)local K,L=(ag({},{__mode='k'}))local function
M(N)ah(N..' is not a valid (virtual) member of '..H..' "'..I..'"',3)end local function N(O)ah(
'Unable to assign (virtual) property '..O..'. Property is read only',3)end local O,P={},{}P.__metatable=false P.__index=
function(Q,R)if R=='ClassName'then return H elseif R=='Name'then return I elseif R=='Parent'then return J elseif H==
'StringValue'and R=='Value'then return L else local S=F[R]if S then return S end end for S in ai,K do if S.Name==R then
return S end end M(R)end P.__newindex=function(Q,R,S)if R=='ClassName'then N(R)elseif R=='Name'then I=S elseif R==
'Parent'then if S==O then return end if J~=nil then D[J][O]=nil end J=S if S~=nil then D[S][O]=true end elseif H==
'StringValue'and R=='Value'then L=S else M(R)end end P.__tostring=function()return I end ag(O,P)D[O]=K if J~=nil then D[
J][O]=true end return O end local function H(I,J)local K,L,M,N=I[1],I[2],I[3],I[4]local O=w[L]local P=M and o(M,1)or O
local Q=G(O,P,J)x[K]=Q if M then for R,S in ai,M do Q[R]=S end end if N then for R,S in ai,N do H(S,Q)end end return Q
end local I=G('Folder','['..ad..']')for J,K in ai,ab do H(K,I)end for J,K in ai,aa do local L=x[J]y[L]=K z[L]=J local M=
L.ClassName if M=='LocalScript'or M=='Script'then n(B,L)end end local function J(K)local L,M=K.ClassName,A[K]if M and L
=='ModuleScript'then return c(M)end local N=y[K]local function O(P)local Q,R,S=nil,h(function()return debug.traceback(
nil,2)end)if R then Q=S end return{Message=P,Traceback=Q}end local function P(Q)local R,S=j(Q.Message),K:GetFullName()
local T,U=s(R,'[^:]+:(%d+): (.+)')local V if not T or not m then V=S..':*: '..(U or R)else T=k(T)local W=z[K]local X=m[W
]local Y=T-X+1 if Y<0 then Y='?'end V=S..':'..Y..': '..U end local W=Q.Traceback if W and W~=''then V=V..'\n'..W end
return V end if L=='LocalScript'or L=='Script'then local Q,R=i(N,O)if not Q then ah(P(R),0)end else local Q={i(N,O)}
local R=o(Q,1)if not R then local S=o(Q,1)ah(P(S),0)end A[K]=Q return c(Q)end end function a(K)local L=x[K]
local function M(N,...)local O={h(N,...)}local P=o(O,1)if not P then ah(O[1],3)end return c(O)end local N=p(ag({},{
__index=C,__newindex=function(N,O,P)C[O]=P end,__len=function()return#C end,__iter=function()return ai,C end}))local O,P
=p{version=ac,envname=ad,shared=N,script=e,require=g},L local function Q(R,...)local S,T,U=f(R),
'Attempted to call require with a non-ModuleScript','Attempted to call require with self'if S=='table'and D[R]then if R.
ClassName~='ModuleScript'then ah(T,2)elseif R==L then ah(U,2)end return J(R)elseif S=='string'and r(R,1,1)~='@'then if#R
==0 then ah('Attempted to call require with empty string',2)end local V=L if r(R,1,1)=='/'then V=I elseif r(R,1,2)=='./'
then R=r(R,3)end local W for X in t(R,'([^/]*)/?')do local Y=X if X=='..'then Y='Parent'end if Y~=''then local Z=V:
FindFirstChild(Y)if not Z then local _=V.Parent if _ then Z=_:FindFirstChild(Y)end end if Z then V=Z elseif X~=W and X~=
'init'and X~='init.server'and X~='init.client'then ah('Virtual script path "'..R..'" not found',2)end end W=X end if V.
ClassName~='ModuleScript'then ah(T,2)elseif V==L then ah(U,2)end return J(V)end return M(g,R,...)end return O,P,Q end
for K,L in ai,B do v(J,L)end return J(I:GetChildren()[1])
