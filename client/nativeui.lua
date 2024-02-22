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

   
end

