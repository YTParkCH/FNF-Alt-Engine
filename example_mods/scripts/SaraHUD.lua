--SaraHUD (3.3) by Novikond

-- Settings --
local pref = {
    style ='modern', --classicTxt, --classicIcons, --modern

    songName = true,
    timer = true,
    iconPoz = true, --icons not moving and on corners of health bar
    hudMiss = true, --purple miss animation for some hud stuff
    HBoverlay = true, --health bar overlay
    timeBarr = false, --vanilla time bar (not a timer)
    hideInfo = false, --hide info at all
    botplHideInfo = true, --when you use botplay, it hide info
    infoBop = true, --"score text zoom on hit", but with new info
    extraInfo = false, --show your sicks, goods, bads and etc.
}
-- true or false guh --

-- don't touch
local hudStuff = {'scoreTxt', 'timeTxt', 'timeBar', 'timeBarBG', 'healthBarOverlay'}

function switchStyle() --styles stuff
    if pref.style == 'classicTxt' then
        setProperty('healthBar.y', downscroll and 68 or 655)

        setTextString('rating', 'Rating: ?'); setTextString('misses', 'Misses: 0'); setTextString('score', 'Score: 0')

        setProperty('rating.x', 15); setProperty('rating.y', downscroll and 20 or 678); setTextSize('rating', 20)
        setProperty('misses.x', 15); setProperty('misses.y', downscroll and 80 or 618); setTextSize('misses', 20)
        setProperty('score.x', 15); setProperty('score.y', downscroll and 50 or 648); setTextSize('score', 20)
    end

    if pref.style == 'classicIcons' then
        setProperty('healthBar.y', downscroll and 68 or 655)

        setProperty('rating.x', 52); setProperty('rating.y', downscroll and 22 or 669); setTextSize('rating', 20)
        setProperty('misses.x', 52); setProperty('misses.y', downscroll and 106 or 584); setTextSize('misses', 20)
        setProperty('score.x', 52); setProperty('score.y', downscroll and 64 or 628); setTextSize('score', 20)

        makeLuaSprite('ratingIcon', 'saraHUD/ratingIcon', 10, downscroll and 18 or 665); makeLuaSprite('missesIcon', 'saraHUD/missesIcon', 10, downscroll and 100 or 580); makeLuaSprite('scoreIcon', 'saraHUD/scoreIcon', 10, downscroll and 59 or 623)

        setObjectCamera('ratingIcon', 'hud', true); scaleObject('ratingIcon', 0.7, 0.7)
        setObjectCamera('missesIcon', 'hud', true); scaleObject('missesIcon', 0.7, 0.7)
        setObjectCamera('scoreIcon', 'hud', true); scaleObject('scoreIcon', 0.7, 0.7)

        addLuaSprite('ratingIcon'); addLuaSprite('missesIcon'); addLuaSprite('scoreIcon')
    end

    if pref.style == 'modern' then
        setProperty('healthBar.y', downscroll and 60 or 660); setProperty('healthBar.x', 110)

        setProperty('rating.x', 851); setProperty('rating.y', downscroll and 36 or 666); setTextSize('rating', 20)
        setProperty('misses.x', 851); setProperty('misses.y', downscroll and 86 or 616); setTextSize('misses', 20)
        setProperty('score.x', 961); setProperty('score.y', downscroll and 86 or 616); setTextSize('score', 20)

        makeLuaSprite('ratingIcon', 'saraHUD/ratingIcon', 810, downscroll and 30 or 660); makeLuaSprite('missesIcon', 'saraHUD/missesIcon', 810, downscroll and 81 or 610); makeLuaSprite('scoreIcon', 'saraHUD/scoreIcon', 920, downscroll and 81 or 610)

        setObjectCamera('ratingIcon', 'hud', true); scaleObject('ratingIcon', 0.7, 0.7)
        setObjectCamera('missesIcon', 'hud', true); scaleObject('missesIcon', 0.7, 0.7)
        setObjectCamera('scoreIcon', 'hud', true); scaleObject('scoreIcon', 0.7, 0.7)

        addLuaSprite('ratingIcon'); addLuaSprite('missesIcon'); addLuaSprite('scoreIcon')
    end
end

function songGuh() --song name
    if pref.style == 'classicTxt' or 'classicIcons' then
        makeLuaText('song', '' .. (songName), 2000, 1088, downscroll and 96 or 618)
        setTextAlignment('song', 'center'); setTextSize('song', 20)
    end
    if pref.style == 'modern' then
        makeLuaText('song', '' .. (songName), 2000, 1088, downscroll and 82 or 622)
        setTextAlignment('song', 'left'); setTextSize('song', 20)

        makeLuaSprite('songIcon', 'saraHUD/songIcon', 190, downscroll and 80 or 620)
        setObjectCamera('songIcon', 'hud'); scaleObject('songIcon', 0.5, 0.5)
        addLuaSprite('songIcon')
    end
    addLuaText('song')
end

function timerGuh() --timer
    if pref.style == 'classicTxt' or 'classicIcons' then
        makeLuaText('timer', '', 500, 388, downscroll and 30 or 678)
        setObjectCamera('timer', 'hud'); setTextAlignment('timer', 'center'); setTextSize('timer', 20)
    end
    if pref.style == 'modern' then
        makeLuaText('timer', '', 500, 70, downscroll and 82 or 622)
        setObjectCamera('timer', 'hud'); setTextAlignment('timer', 'right'); setTextSize('timer', 20)

        makeLuaSprite('timerIcon', 'saraHUD/timerIcon', 575, downscroll and 80 or 620)
        setObjectCamera('timerIcon', 'hud'); scaleObject('timerIcon', 0.5, 0.5)
        addLuaSprite('timerIcon')
    end
    addLuaText('timer')
end

function iconsGuh() --icons at corners of health bar
    if pref.style == 'classicTxt' or 'classicIcons' then
        setProperty('iconP1.x', screenWidth - 445)
        setProperty('iconP2.x', 285)
    end
    if pref.style == 'modern' then
        setProperty('iconP1.x', screenWidth - 680)
        setProperty('iconP2.x', 50)
    end
end

function HBoverlayGuh() --health bar overlay
    if pref.style == 'classicTxt' or 'classicIcons' then
        makeLuaSprite('healthBarOver', 'saraHUD/healthBarOver', 105, downscroll and 65 or 650)
        setObjectCamera('healthBarOver', 'hud'); setScrollFactor('healthBarOver', 0.9, 0.9); setProperty('healthBarOver.alpha', 0.5)
        setObjectOrder('healthBarOver', 2); setObjectOrder('healthBar', 1); setObjectOrder('healthBarBG', 0)
    end
    if pref.style == 'modern' then
        makeLuaSprite('healthBarOver', 'saraHUD/healthBarOver', 105, downscroll and 55 or 655)
        setObjectCamera('healthBarOver', 'hud'); setScrollFactor('healthBarOver', 0.9, 0.9); setProperty('healthBarOver.alpha', 0.5)
        setObjectOrder('healthBarOver', 2); setObjectOrder('healthBar', 1); setObjectOrder('healthBarBG', 0)
    end
    addLuaSprite('healthBarOver', true)
end

function hudMissGuh() --purple miss animation on health bar, icons and info icons
    setProperty('missesIcon.color', getColorFromHex('5f1ea4'))
	doTweenColor('missesIcon', 'missesIcon', 'FFFFFF', 0.3, 'linear')
	
	setProperty('scoreIcon.color', getColorFromHex('5f1ea4'))
	doTweenColor('scoreIcon', 'scoreIcon', 'FFFFFF', 0.3, 'linear')
	
    setProperty('ratingIcon.color', getColorFromHex('5f1ea4'))
	doTweenColor('ratingIcon', 'ratingIcon', 'FFFFFF', 0.3, 'linear')

	setProperty('healthBar.color', getColorFromHex('5f1ea4'))
	doTweenColor('healthBar', 'healthBar', 'FFFFFF', 0.3, 'linear')

	setProperty('iconP1.color', getColorFromHex('5f1ea4'))
	doTweenColor('iconP1', 'iconP1', 'FFFFFF', 0.3, 'linear')
end

function timeBarGuh() setProperty('timeBar.visible', true); setProperty('timeBarBG.visible', true) end --vanilla time bar

function hideInfoGuh() --hide info
    setProperty('score.visible', false); setProperty('rating.visible', false); setProperty('misses.visible', false)
    setProperty('scoreIcon.visible', false); setProperty('ratingIcon.visible', false); setProperty('missesIcon.visible', false)
end

function botplayHideGuh() --when you use botplay it hide info stuff
    if (botPlay) then
        setProperty('misses.visible', false); setProperty('rating.visible', false); setProperty('score.visible', false)
        setProperty('missesIcon.visible', false); setProperty('ratingIcon.visible', false); setProperty('scoreIcon.visible', false)
    else
        setProperty('misses.visible', true); setProperty('rating.visible', true); setProperty('score.visible', true)
        setProperty('missesIcon.visible', true); setProperty('ratingIcon.visible', true); setProperty('scoreIcon.visible', true)
    end
end

function infoBopGuh() --info bop effect, you can change some numbers
    setProperty('misses.scale.x', 0.9); setProperty('misses.scale.y', 1.05)
    setProperty('rating.scale.x', 0.9); setProperty('rating.scale.y', 1.05)
    setProperty('score.scale.x', 0.9); setProperty('score.scale.y', 1.05)

    doTweenX('MtextSizeX', 'misses.scale', 1, 0.1, 'linear'); doTweenY('MtextSizeY', 'misses.scale', 1, 0.1, 'linear')
    doTweenX('RtextSizeX', 'rating.scale', 1, 0.1, 'linear'); doTweenY('RtextSizeY', 'rating.scale', 1, 0.1, 'linear')
    doTweenX('StextSizeX', 'score.scale', 1, 0.1, 'linear'); doTweenY('StextSizeY', 'score.scale', 1, 0.1, 'linear')
end

function extraInfoGuh() --extra info, cuz someone needed it
    makeLuaText('sick','', 0, 15, 298); setTextSize('sick', 24)
	makeLuaText('good','', 0, 15, 328); setTextSize('good', 24)
	makeLuaText('bad','', 0, 15, 358); setTextSize('bad', 24)
	makeLuaText('shit','', 0, 15, 390); setTextSize('shit', 24)

    addLuaText('sick')
    addLuaText('good')
    addLuaText('bad')
    addLuaText('shit')

    setTextString('sick','Sicks: ' .. getProperty('sicks'))
	setTextString('good','Goods: ' ..getProperty('goods'))
	setTextString('bad','Bads: ' .. getProperty('bads'))
	setTextString('shit','Shits: ' .. getProperty('shits'))
end

function onCreatePost()
    for i = 1, 5 do setProperty(hudStuff[i] ..'.visible', false) end --this thing hide vanilla stuff
    
    makeLuaText('rating', ': ?'); makeLuaText('misses', ': 0'); makeLuaText('score', ': 0')
    switchStyle() --the thing that makes hud exist
    addLuaText('rating'); addLuaText('misses'); addLuaText('score')

    --preferences 1
    if pref.songName == true then songGuh() end
    if pref.timer == true then timerGuh() end
    if pref.HBoverlay == true then HBoverlayGuh() end
    if pref.timeBarr == true then timeBarGuh() end
    if pref.hideInfo == true then hideInfoGuh() end
end

function onUpdatePost()
    --make timer work
    local  timeElapsed = math.floor(getProperty('songTime')/1000)
    local  timeTotal = math.floor(getProperty('songLength')/1000)
    local timeElapsedFixed = string.format("%.2d:%.2d", timeElapsed/60%60, timeElapsed%60)
    local timeTotalFixed = string.format("%.2d:%.2d", timeTotal/60%60, timeTotal%60)
    setTextString('timer', timeElapsedFixed .. '/' .. timeTotalFixed)

    --preferences 2
    if pref.iconPoz == true then iconsGuh() end
    if pref.botplHideInfo == true then botplayHideGuh() end
    if pref.extraInfo == true then extraInfoGuh() end
end

function onRecalculateRating()
    --make info work
    if pref.style == 'modern' or 'classicIcons' then
        setTextString('misses', ': ' .. getProperty('songMisses'))
	    setTextString('rating', ': ' .. getProperty('ratingName') .. ' | ' .. string.format("%.2f%%", rating * 100) .. ' | ' .. getProperty('ratingFC'))
	    setTextString('score', ': ' .. score)
    end
    if pref.style == 'classicTxt' then
        setTextString('misses', 'Misses: ' .. getProperty('songMisses'))
	    setTextString('rating', 'Rating: ' .. getProperty('ratingName') .. ' | ' .. string.format("%.2f%%", rating * 100) .. ' | ' .. getProperty('ratingFC'))
	    setTextString('score', 'Score: ' .. score)
    end
end

--preferences 3 :sleeping:
function noteMiss() if pref.hudMiss == true then hudMissGuh() end end
function goodNoteHit() if pref.infoBop == true then infoBopGuh() end end