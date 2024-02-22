function functions_GetAllData(source)
    xPlayer = ESX.GetPlayerFromId(source)
    accounts = xPlayer.getAccounts()
    job = xPlayer.job.name
    grade = xPlayer.job.grade
    identifier = xPlayer.getIdentifier()
    loadout = xPlayer.getLoadout()
    inventory = xPlayer.getInventory()
    group = xPlayer.getGroup()
    loadout = xPlayer.getLoadout()
    weight = xPlayer.getWeight()
    name = xPlayer.getName()
    return accounts, job, grade, identifier, loadout, inventory, group, loadout, weight, name
end