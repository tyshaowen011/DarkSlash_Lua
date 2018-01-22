local playScene =class("ScenePlay")
local foeGroupClass = require('classes/foeGroup')
local plyayerClass = require("classes/player")
local playerFXClass = require('classes/playerFX')
function playScene:ctor()
  self:onCreate()
end
function playScene:initData()
   --self.frameCount = 0
   -- self.foeGroup = self.myScene:getChildByName('Canvas'):getChildByName('root'):getChildByName('foeGroup')
end
function playScene:onCreate()
    --创建场景 添加事件监听
    self.creatorReader = creator.CreatorReader:createWithFilename ('scenes/PlayGame.ccreator')
    self.creatorReader:setup()
    self.myScene = self.creatorReader:getSceneGraph()
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
  self.myScene:registerScriptHandler(onSceneEvent)
  local foegropNode = self.myScene:getChildByName('Canvas'):getChildByName('root'):getChildByName('foeGroup')
 
  local foegrop = foeGroupClass.create()
  foegrop:init(foegropNode)

  local playerNode = foegropNode:getChildByName('player')
  local player = plyayerClass.create()
  player:init(playerNode)

  local playerFXNode = self.myScene:getChildByName('Canvas'):getChildByName('root'):getChildByName('playerFX')
  local playerFX = playerFXClass.create()
  playerFX:init(playerFXNode)


  cc.Director:getInstance():replaceScene (self.myScene)
end
function playScene:enter(foeGroup)
    
end
function playScene:entertransitionfinish()
    ----开启update函数 
    local function handler(interval)
         self:update(interval)
    end
    self:initData()
    self.myScene:scheduleUpdateWithPriorityLua(handler,0)
end
function playScene:update(dt)
--    if(self.frameCount % 6 == 0) then


--    end
end
function playScene:exit()

end
function playScene:exittransitionstart()

end
function playScene:cleanup()

end
return playScene
