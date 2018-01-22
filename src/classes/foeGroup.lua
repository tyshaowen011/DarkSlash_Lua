local foeGroup =class("foeGroup")
function foeGroup:ctor()
end
function foeGroup:initData()
    self.frameCount = 0
end
function foeGroup:init(node)
    --创建场景 添加事件监听
    self.node = node
    local function onSceneEvent(event)  
        if event == "enter" then
           self:enter()
        elseif event == "enterTransitionFinish" then
            
           self:entertransitionfinish()

        elseif event == "exit" then

           self:exit()

        elseif event == "exitTransitionStart" then

           self:exittransitionstart()

        elseif event == "cleanup" then

           self:cleanup()

        end
    end
    node:registerScriptHandler(onSceneEvent)
end
function foeGroup:enter()
end
function foeGroup:entertransitionfinish()
    ----开启update函数 
    local function handler(interval)
         self:update(interval)
    end
    self:initData()
    self.node:scheduleUpdateWithPriorityLua(handler,0)
    
    local test ={}
    local child =self.node:getChildByName('player')
    
    for k, v in pairs(getmetatable(child)) do
       table.insert(test,k)
    end
    table.sort(test,function(a,b)
        return  a<b
    end)
    for k,v in pairs(test) do
        print(v,getmetatable(self.node)[v])
    end
end
function foeGroup:update(dt)
    if(self.frameCount % 6 == 0) then
       self:sortChildByY()
    end
end
function foeGroup:sortChildByY()
     local listChild ={}
     local listToSort = self.node:getChildren()
     for k,v in ipairs(listToSort) do
        table.insert(listChild,v)
     end
     table.sort(listChild,function (a, b)
         return b.y - a.y;
     end)
     for k,v in ipairs(listToSort) do
         local node = v;
--         print(node:isVisible())
         --node.setSiblingIndex(i);
         if (node:isVisible()) then
             --node.setSiblingIndex(i);
         end
     end
end
function foeGroup:exit()

end
function foeGroup:exittransitionstart()

end
function foeGroup:cleanup()

end
return foeGroup

