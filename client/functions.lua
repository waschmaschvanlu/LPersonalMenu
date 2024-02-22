function locale(msg)
    return Locale[Config.Locale][msg] or msg
end

function functions_GetAllData()
    return callback_getAllData()
end