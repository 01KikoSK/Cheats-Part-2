local gg = require("gg")

function main()
    local menu = gg.choice({
        "Increase Gold",
        "Increase Gems",
        "Max Dragon Health",
        "Unlock All Dragons",
        "Exit"
    }, nil, "Dragon Mania Legends Cheat Menu")

    if menu == 1 then
        increaseGold()
    elseif menu == 2 then
        increaseGems()
    elseif menu == 3 then
        maxDragonHealth()
    elseif menu == 4 then
        unlockDragons()
    elseif menu == 5 then
        os.exit()
    end
end

function increaseGold()
    gg.clearResults()
    gg.searchNumber("1000", gg.TYPE_DWORD) -- Change this to the current gold value
    local results = gg.getResults(1)
    if results[1] then
        gg.editAll("999999999", gg.TYPE_DWORD) -- Set to a high value
        gg.toast("Gold increased!")
    else
        gg.toast("Gold not found!")
    end
end

function increaseGems()
    gg.clearResults()
    gg.searchNumber("10", gg.TYPE_DWORD) -- Change this to the current gems value
    local results = gg.getResults(1)
    if results[1] then
        gg.editAll("999999999", gg.TYPE_DWORD) -- Set to a high value
        gg.toast("Gems increased!")
    else
        gg.toast("Gems not found!")
    end
end

function maxDragonHealth()
    gg.clearResults()
    gg.searchNumber("100", gg.TYPE_DWORD) -- Change this to the current dragon health value
    local results = gg.getResults(1)
    if results[1] then
        gg.editAll("999", gg.TYPE_DWORD) -- Set to max health
        gg.toast("Dragon health maxed!")
    else
        gg.toast("Dragon health not found!")
    end
end

function unlockDragons()
    gg.clearResults()
    gg.searchNumber("0", gg.TYPE_DWORD) -- Assuming locked dragons are represented by 0
    local results = gg.getResults(10)
    if results then
        for i = 1, #results do
            results[i].value = 1 -- Unlock dragon
        end
        gg.setValues(results)
        gg.toast("All dragons unlocked!")
    else
        gg.toast("No locked dragons found!")
    end
end

while true do
    if gg.isVisible(true) then
        gg.setVisible(false)
        main()
    end
end