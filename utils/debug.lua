function utils.log(block_header, text, output)
    minetest.log("action", "--------------------------" .. block_header .. "--------------------------")
    for i, o in ipairs(output) do
        local t = type(o)
        if t == "string" then
            minetest.log("action", text[i] .. ": " .. o)
        elseif t == "table" then
            minetest.log("action", text[i] .. ": " .. minetest.serialize(o))
        else
            minetest.log("action", text[i] .. ": " .. tostring(o))
        end
    end
    minetest.log("action", "-------------------------- SEPERATOR --------------------------")
end
