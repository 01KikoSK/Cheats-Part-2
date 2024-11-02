local gg = require("gg")

function main()
    local menu = gg.choice({
        "Increase Money",
        "Max Troops",
        "Unlock All Levels",
        "Exit"
    }, nil, "World Conqueror 4 Cheat Menu")

    if menu == 1 then
        increaseMoney()
    elseif menu == 2 then
        maxTroops()
    elseif menu == 3 then
        unlockLevels()
    elseif menu == 4 then
        os.exit()
    end
end

function increaseMoney()
    gg.clearResults()
    gg.searchNumber("1000", gg.TYPE_DWORD) -- Change this to the current money value
    local results = gg.getResults(1)
    if results[1] then
        gg.editAll("999999999", gg.TYPE_DWORD) -- Set to a high value
        gg.toast("Money increased!")
    else
        gg.toast("Money not found!")
    end
end

function maxTroops()
    gg.clearResults()
    gg.searchNumber("10", gg.TYPE_DWORD) -- Change this to the current troop limit
    local results = gg.getResults(1)
    if results[1] then
        gg.editAll("999", gg.TYPE_DWORD) -- Set to max troops
        gg.toast("Troops maxed!")
    else
        gg.toast("Troop limit not found!")
    end
end

function unlockLevels()
    gg.clearResults()
    gg.searchNumber("0", gg.TYPE_DWORD) -- Assuming locked levels are represented by 0
    local results = gg.getResults(10)
    if results then
        for i = 1, #results do
            results[i].value = 1 -- Unlock level
        end
        gg.setValues(results)
        gg.toast("All levels unlocked!")
    else
        gg.toast("No locked levels found!")
    end
end

while true do
    if gg.isVisible(true) then
        gg.setVisible(false)
        main()
    end
end