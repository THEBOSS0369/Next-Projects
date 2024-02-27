function love.load()
    myImage = love.graphics.newImage("pokemon/charizard.png")
    ash = love.graphics.newImage("sprites/ashone.png")
    snorlax = love.graphics.newImage("pokemon/snorlax.png")
    snorlax2 = love.graphics.newImage("pokemon/snorlax.png")
    articuno = love.graphics.newImage("pokemon/articuno.png")
    moltres = love.graphics.newImage("pokemon/moltres.png")
    zapdos = love.graphics.newImage("pokemon/zapdos.png")
    arceus = love.graphics.newImage("pokemon/arceus.png")
    giratina = love.graphics.newImage("pokemon/giratina.png")
    dialga = love.graphics.newImage("pokemon/dialga.png")
    palkia = love.graphics.newImage("pokemon/palkia.png")
    rayqauza = love.graphics.newImage("pokemon/rayquaza.png")
    oak = love.graphics.newImage("sprites/Oak.png")
    gary = love.graphics.newImage("sprites/Gary.png")
    smallgirl = love.graphics.newImage("sprites/girl.png")
    researcher = love.graphics.newImage("sprites/reasearcher.png")
    policeman = love.graphics.newImage("sprites/policeman.png")
    potionboy = love.graphics.newImage("sprites/potionboy.png")
    fighter = love.graphics.newImage("sprites/fighterkid.png")
    fatkid = love.graphics.newImage("sprites/fatkid.png")
    fightergirl = love.graphics.newImage("sprites/fightergirl.png")
    teamrocketgirl = love.graphics.newImage("sprites/teamrocketg.png")
    trainer = love.graphics.newImage("sprites/trainer.png")
    may = love.graphics.newImage("sprites/may.png")
    prof = love.graphics.newImage("sprites/prof.png")
    teamrocketboss = love.graphics.newImage("sprites/rocket.png")
    cameraman = love.graphics.newImage("sprites/cameraman.png")
    nursejoy = love.graphics.newImage("sprites/nursejoy.png")
    oldboy = love.graphics.newImage("sprites/oldboy.png")
    oldman = love.graphics.newImage("sprites/oldman.png")
    sailor = love.graphics.newImage("sprites/sailor.png")
    guardboy = love.graphics.newImage("sprites/guardboy.png")
    brock = love.graphics.newImage("sprites/brock.png")
    misty = love.graphics.newImage("sprites/Misty.png")
    pokeball = love.graphics.newImage("sprites/pokeball.png")

    pokemon = {}
    pokemon.x = 400
    pokemon.y = 725
    pokemon.sprite = love.graphics.newImage('pokemon/charizard.png')

    wf = require 'libraries/windfield'
    world = wf.newWorld(0, 0)

    camera = require 'libraries/camera'
    cam = camera()

    anim8 = require 'libraries/anim8'
    love.graphics.setDefaultFilter("nearest", "nearest")

    sti = require 'libraries/sti'
    gameMap = sti('map/rasta.lua')

    player = {}
    player.collider = world:newBSGRectangleCollider(340, 2030, 10, 25, 5)
    player.collider:setFixedRotation(true)
    player.x = 400
    player.y = 60
    player.speed = 40

    charizard = {}
    charizard.x = 320
    charizard.y = 2050
    charizard.speed = 50
    charizard.sprite = love.graphics.newImage('sprites/charizard.png')
    
    player.spriteSheet = love.graphics.newImage('sprites/player-sheet.png')
    player.grid = anim8.newGrid( 12, 18, player.spriteSheet:getWidth(), player.spriteSheet:getHeight() )

    player.animations = {}
    player.animations.down = anim8.newAnimation( player.grid('1-4', 1), 0.2 )
    player.animations.left = anim8.newAnimation( player.grid('1-4', 2), 0.2 )
    player.animations.right = anim8.newAnimation( player.grid('1-4', 3), 0.2 )
    player.animations.up = anim8.newAnimation( player.grid('1-4', 4), 0.2 )

    player.anim = player.animations.left

    background = love.graphics.newImage('map/rasta.png')

    walls = {}
    if gameMap.layers["Walls"] then
        for i, obj in pairs(gameMap.layers["Walls"].objects) do
            local wall = world:newRectangleCollider(obj.x, obj.y, obj.width, obj.height)
            wall:setType('static')
            table.insert(walls, wall)
        end
    end

    --animation 
    --for lugia
    frames = {}
    table.insert(frames, love.graphics.newImage("pokemon/lugya1.png"))
    table.insert(frames, love.graphics.newImage("pokemon/lugya2.png"))

    --I use a long name to avoid confusion with the variable named frames
    currentFrame = 1

    --for crystallix
    frames1 = {}
    table.insert(frames1, love.graphics.newImage("pokemon/crystallix1.png"))
    table.insert(frames1, love.graphics.newImage("pokemon/crystallix2.png"))
    currentFrame1 = 1

    --for gyarados
    frames2 = {}
    table.insert(frames2, love.graphics.newImage("pokemon/Gyarados1.png"))
    table.insert(frames2, love.graphics.newImage("pokemon/Gyarados2.png"))
    currentFrame2 = 1

    --groudon
    frames3 = {}
    table.insert(frames3, love.graphics.newImage("pokemon/groudon1.png"))
    table.insert(frames3, love.graphics.newImage("pokemon/groudon2.png"))
    currentFrame3 = 1

    --kyogre
    frames4 = {}
    table.insert(frames4, love.graphics.newImage("pokemon/kyogre.png"))
    table.insert(frames4, love.graphics.newImage("pokemon/kyogre2.png"))
    currentFrame4 = 1

    --moltres
    frames5 = {}
    table.insert(frames5, love.graphics.newImage("pokemon/molt1.png"))
    table.insert(frames5, love.graphics.newImage("pokemon/molt2.png"))
    currentFrame5 = 1

    --articuno
    frames6 = {}
    table.insert(frames6, love.graphics.newImage("pokemon/arti1.png"))
    table.insert(frames6, love.graphics.newImage("pokemon/arti2.png"))
    currentFrame6 = 1

    --zapdos
    frames7 = {}
    table.insert(frames7, love.graphics.newImage("pokemon/zap1.png"))
    table.insert(frames7, love.graphics.newImage("pokemon/zap2.png"))
    currentFrame7 = 1

    --mewtwo
    frames8 = {}
    table.insert(frames8, love.graphics.newImage("pokemon/mewtwo.png"))
    table.insert(frames8, love.graphics.newImage("pokemon/mewtwo2.png"))
    currentFrame8 = 1

    --ho oh
    frames9 = {}
    table.insert(frames9, love.graphics.newImage("pokemon/hooh1.png"))
    table.insert(frames9, love.graphics.newImage("pokemon/hooh2.png"))
    currentFrame9 = 1

    --arceus
    frames10 = {}
    table.insert(frames10, love.graphics.newImage("pokemon/arceus.png"))
    table.insert(frames10, love.graphics.newImage("pokemon/arceus2.png"))
    currentFrame10 = 1

    --giratina
    frames11 = {}
    table.insert(frames11, love.graphics.newImage("pokemon/giratina.png"))
    table.insert(frames11, love.graphics.newImage("pokemon/giratina2.png"))
    currentFrame11 = 1

    --dialga
    frames12 = {}
    table.insert(frames12, love.graphics.newImage("pokemon/Dialga.png"))
    table.insert(frames12, love.graphics.newImage("pokemon/Dialga2.png"))
    currentFrame12 = 1

    --palkia
    frames13 = {}
    table.insert(frames13, love.graphics.newImage("pokemon/Palkia.png"))
    table.insert(frames13, love.graphics.newImage("pokemon/Palkia2.png"))
    currentFrame13 = 1

    --animation end

    sounds = {}
    sounds.music = love.audio.newSource("sounds/Pallet Town.mp3", "stream")
    sounds.music:setLooping(true)

    sounds.music:play()
end

function love.update(dt)

    local isMoving = false

    local vx = 0
    local vy = 0

    if love.keyboard.isDown("right") then
        vx = player.speed
        player.anim = player.animations.right
        isMoving = true
    end

    if love.keyboard.isDown("left") then
        vx = player.speed * -1
        player.anim = player.animations.left
        isMoving = true
    end

    if love.keyboard.isDown("down") then
        vy = player.speed
        player.anim = player.animations.down
        isMoving = true
    end

    if love.keyboard.isDown("up") then
        vy = player.speed * -1
        player.anim = player.animations.up
        isMoving = true
    end

    --animation
    --lugia
    currentFrame = currentFrame + 5.5 * dt
    if currentFrame >= 3 then
        currentFrame = 1
    end

    --crystallix
    currentFrame1 = currentFrame1 + 5.5 * dt
    if currentFrame1 >= 3 then
        currentFrame1 = 1
    end

    --gyarados
    currentFrame2 = currentFrame2 + 5.5 * dt
    if currentFrame2 >= 3 then
        currentFrame2 = 1
    end

    --groudon
    currentFrame3 = currentFrame3 + 5.5 * dt
    if currentFrame3 >= 3 then
        currentFrame3 = 1
    end

    --kyogre
    currentFrame4 = currentFrame4 + 5.5 * dt
    if currentFrame4 >= 3 then
        currentFrame4 = 1
    end

    --moltres
    currentFrame5 = currentFrame5 + 5.5 * dt
    if currentFrame5 >= 3 then
        currentFrame5 = 1
    end

    --articuno
    currentFrame6 = currentFrame6 + 5.5 * dt
    if currentFrame6 >= 3 then
        currentFrame6 = 1
    end

    --zapdos
    currentFrame7 = currentFrame7 + 5.5 * dt
    if currentFrame7 >= 3 then
        currentFrame7 = 1
    end

    --mewtwo
    currentFrame8 = currentFrame8 + 5.5 * dt
    if currentFrame8 >= 3 then
        currentFrame8 = 1
    end
    
    --hooh
    currentFrame9 = currentFrame9 + 5.5 * dt
    if currentFrame9 >= 3 then
        currentFrame9 = 1
    end

    --arceus
    currentFrame10 = currentFrame10 + 5.5 * dt
    if currentFrame10 >= 3 then
        currentFrame10 = 1
    end

    --giratina
    currentFrame11 = currentFrame11 + 5.5 * dt
    if currentFrame11 >= 3 then
        currentFrame11 = 1
    end

    --dialga
    currentFrame12 = currentFrame12 + 5.5 * dt
    if currentFrame12 >= 3 then
        currentFrame12 = 1
    end

    --palkia
    currentFrame13 = currentFrame13 + 5.5 * dt
    if currentFrame13 >= 3 then
        currentFrame13 = 1
    end

    --animation end
    
    -- update NPC position based on player's position
    local dx = player.x - charizard.x
    local dy = player.y - charizard.y
    local distance = math.sqrt(dx^2 + dy^2)

    if distance > 1.5 then
        -- Normalize the vector
        local nx = dx / distance
        local ny = dy / distance

        -- Update NPC position
        charizard.x = charizard.x + nx * charizard.speed * dt
        charizard.y = charizard.y + ny * charizard.speed * dt
    end

    --collider
    player.collider:setLinearVelocity(vx, vy)
    

    if isMoving == false then
        player.anim:gotoFrame(2)
    end

    world:update(dt)
    player.x = player.collider:getX()
    player.y = player.collider:getY()

    player.anim:update(dt)

    cam:lookAt(player.x, player.y)

    local w = love.graphics.getWidth()
    local h = love.graphics.getHeight()

    if cam.x < w/2 then
        cam.x = w/2
    end

    if cam.y < h/2 then
        cam.y = h/2
    end

    local mapW = gameMap.width * gameMap.tilewidth
    local mapH = gameMap.height * gameMap.tileheight

    if cam.x > (mapW - w/2) then
        cam.x = (mapW - w/2)
    end

    if cam.y > (mapH - h/2) then
        cam.y = (mapH - h/2)
    end
end

function love.draw()
    love.graphics.draw(pokemon.sprite, pokemon.x, pokemon.y)
    cam:attach()
        
        gameMap:draw()
        gameMap:drawLayer(gameMap.layers["trees"])
        gameMap:drawLayer(gameMap.layers["ground"])
        
        player.anim:draw(player.spriteSheet, player.x, player.y, nil, 1.3, nil, 6, 9)
        --animation
        love.graphics.draw(frames[math.floor(currentFrame)],315, 2260, nil, 1)
        love.graphics.draw(frames1[math.floor(currentFrame1)], 120, 60, nil, 1.3)
        love.graphics.draw(frames2[math.floor(currentFrame2)], 610, 60, nil, 1.3)
        love.graphics.draw(frames3[math.floor(currentFrame3)], 480, 460, nil, 1.4)
        love.graphics.draw(frames4[math.floor(currentFrame4)], 560, 470, nil, 1.4)
        love.graphics.draw(frames5[math.floor(currentFrame5)], 370, 2230, nil, 1)
        love.graphics.draw(frames6[math.floor(currentFrame6)], 385, 2200, nil, 1)
        love.graphics.draw(frames7[math.floor(currentFrame7)], 355, 2205, nil, 1)
        love.graphics.draw(frames8[math.floor(currentFrame8)], 372, 2265, nil, 1)
        love.graphics.draw(frames9[math.floor(currentFrame9)], 405, 2260, nil, 1)
        love.graphics.draw(frames10[math.floor(currentFrame10)], 160, 1070, 0 , 1.5, 1.5)
        love.graphics.draw(frames11[math.floor(currentFrame11)], 260, 1080, 0 , 1, 1)
        love.graphics.draw(frames12[math.floor(currentFrame12)], 225, 1065, 0 , 1, 1)
        love.graphics.draw(frames13[math.floor(currentFrame13)], 225, 1100, 0 , 1, 1)

        --animation
        love.graphics.draw(snorlax2, 740, 355, 0 , 1, 1)
        love.graphics.draw(snorlax, 1, 910, 0 , 1, 1)
        love.graphics.draw(ash, 375, 2180, 0 , 1, 1)
        love.graphics.draw(oak, 395, 2177, 0 , 1, 1)
        love.graphics.draw(gary, 350, 2175, 0 , 1, 1)
        love.graphics.draw(smallgirl, 430, 1940, 0 , 1.1, 1.1)
        love.graphics.draw(researcher, 514, 2140, 0 , 1.1, 1.1)
        love.graphics.draw(policeman, 570, 1950, 0 , 1.1, 1.1)
        love.graphics.draw(potionboy, 270, 1715, 0 , 1.1, 1.1)
        love.graphics.draw(fighter, 580, 1540, 0 , 1.1, 1.1)
        love.graphics.draw(fatkid, 400, 1380, 0 , 1.1, 1.1)
        love.graphics.draw(fightergirl, 430, 1700, 0 , 1.1, 1.1)
        love.graphics.draw(teamrocketgirl, 270, 1320, 0 , 1.1, 1.1)
        love.graphics.draw(prof, 315, 1090, 0 , 1, 1.2)
        love.graphics.draw(trainer, 315, 1070, 0 , 1, 1.2)
        love.graphics.draw(may, 315, 1110, 0 , 1, 1.2)
        love.graphics.draw(teamrocketboss, 215, 1037, 0 , 1, 1.2)
        love.graphics.draw(cameraman, 270, 1043, 0 , 1, 1)
        love.graphics.draw(nursejoy, 480, 1070, 0 , 1.2, 1.2)
        love.graphics.draw(oldboy, 455, 950, 0 , 1, 1)
        love.graphics.draw(oldman, 290, 1043, 0 , 1, 1)
        love.graphics.draw(oldman, 365, 825, 0 , 1, 1)
        love.graphics.draw(policeman, 617, 815, 0 , 1.1, 1.1)
        love.graphics.draw(potionboy, 630, 955, 0 , 1.1, 1.1)
        love.graphics.draw(sailor, 425, 830, 0 , 1, 1)
        love.graphics.draw(policeman, 140, 890, 0 , 1, 1)
        love.graphics.draw(smallgirl, 345, 700, 0 , 1.1, 1.1)
        love.graphics.draw(potionboy, 510, 330, 0 , 1.1, 1.1)
        love.graphics.draw(nursejoy, 345, 445, 0 , 1, 1)
        love.graphics.draw(oldman, 595, 223, 0 , 1, 1)
        love.graphics.draw(policeman, 290, 155, 0 , 1.1, 1.1)
        love.graphics.draw(guardboy, 287, 300, 0 , 1.1, 1.1)
        love.graphics.draw(misty, 580, 74, 0 , 1, 1)
        love.graphics.draw(brock, 175, 74, 0 , 1, 1)
        love.graphics.draw(sailor, 210, 520, 0 , 1.1, 1.1)
        love.graphics.draw(pokeball, 575, 1800, 0 , 0.1, 0.1)
        love.graphics.draw(pokeball, 270, 1467, 0 , 0.1, 0.1)
        love.graphics.draw(pokeball, 190, 733, 0 , 0.1, 0.1)
        love.graphics.draw(charizard.sprite, charizard.x, charizard.y)
        --world:draw()
        
    cam:detach()

end