local player =class("player")
function player:ctor()
end
function player:init(node)
    --添加事件监听
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
function player:enter()
    
end
function player:entertransitionfinish()
    ----开启update函数 
    local function handler(interval)
         self:update(interval)
    end
    self.myScene:scheduleUpdateWithPriorityLua(handler,0)
end
function player:update(dt)
    
end
function player:exit()

end
function player:exittransitionstart()

end
function player:cleanup()

end
return player

