_menuPool = NativeUI.CreatePool()

 Citizen.CreateThread(function()
     while true do
         Citizen.Wait(1)
        if _menuPool:IsAnyMenuOpen() then
         _menuPool:ProcessMenus()
        else
         Citizen.Wait(150)
        end
     end
end)

function openMainMenu()
    accounts, job, grade, identifier, loadout, inventory, group, loadout, weight, name = functions_getPlayerData()

    if data == nil then
        error("Player data is nil")
    end

     mainmenu = NativeUI.CreateMenu(locale("MainMenu:Title"), "",   Config.NativeUIMenuOptions.Position.X,
                    Config.NativeUIMenuOptions.Position.Y,
                    nil,
                    nil,
                    nil,
                    Config.NativeUIMenuOptions.Color.R,
                    Config.NativeUIMenuOptions.Color.G,
                    Config.NativeUIMenuOptions.Color.B,
                    Config.NativeUIMenuOptions.Color.A )
       if Config.NativeUIBanner ~= nil then
                    background = Sprite.New(
                        Config.NativeUIBanner[1],
                        Config.NativeUIBanner[2],
                        0,
                        0,
                        Config.NativeUIBanner[3] or 512,
                        Config.NativeUIBanner[4] or 128
                    )
                    mainmenu:SetBanner(background, true)
                end
    _menuPool:Add(mainmenu)
    _menuPool:RefreshIndex()
   _menuPool:MouseControlsEnabled(Config.NativeUIMenuOptions.MouseEnabled)
        _menuPool:MouseEdgeEnabled(Config.NativeUIMenuOptions.MouseEnabled)
        _menuPool:ControlDisablingEnabled(Config.NativeUIMenuOptions.CanMoveWhileMenuOpen)

        if Config.Menus.Inventory then
            local inventory = _menuPool:AddSubMenu(mainmenu, locale("Inventory:Title"), "", true, true)
            _menuPool:RefreshIndex()
            _menuPool:MouseControlsEnabled(Config.NativeUIMenuOptions.MouseEnabled)
            _menuPool:MouseEdgeEnabled(Config.NativeUIMenuOptions.MouseEnabled)
            _menuPool:ControlDisablingEnabled(Config.NativeUIMenuOptions.CanMoveWhileMenuOpen)
            if next(inventory) then 
              for k,v in pairs(inventory) do
                item = _menuPool:AddSubMenu(v.name, "", true, true)
                item.Item:RightLabel(v.amount .. "x")

                if v.usable then
                    usableitem = NativeUI.CreateItem(locale("Inventory:Use"), "")
                    item:AddItem(usableitem)
                    item.OnItemSelect = function(sender, item, index)
                        if item == usableitem then
                            TriggerServerEvent("esx_inventoryhud:useItem", v.name)
                        end
                    end

                end

                if v.canRemove then

                end
              end
              weight = _menuPool:AddSubMenu(locale("Inventory:Weight"), "", true, true)
                weight.Item:RightLabel(weight)
            else
                inventory.Item:Enabled(false)
            end
        end

   
end

