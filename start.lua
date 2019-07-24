sudo_monsters = dofile("sudo.lua")
https = require("ssl.https")
JSON = dofile("./libs/JSON.lua")
local monsters_dev = io.open("monsters_online.lua")
if monsters_dev then
monsters_on = {string.match(monsters_dev:read('*all'), "^(.*)/(%d+)")}
local monsters_file = io.open("sudo.lua", 'w')
monsters_file:write("token = '" ..monsters_on[1].."'\n\nsudo_add = "..monsters_on[2].."" )
monsters_file:close()
https.request("https://api.telegram.org/bot"..monsters_on[1].."/sendMessage?chat_id="..monsters_on[2].."&text=Bot_Tshake_is_start_new")
os.execute('cd .. && rm -rf .telegram-cli')
os.execute('rm -rf monsters_online.lua')  
os.execute('./tg -s ./monsters.lua $@ --bot='..monsters_on[1])
end
function chack(tokenCk)
local getme = "https://api.telegram.org/bot" ..tokenCk.. '/getme'
local req = https.request(getme)
local data = JSON:decode(req)
if data.ok == true then
print("\27[31m✓ DONE\27[m \27[1;34m»»Now Send Sudo ID««\27[m")
local sudo_send  = io.read()
print("\27[31m✓ DONE\27[m")
local monsters_file = io.open("sudo.lua", 'w')
tsheke_file:write("token = '" ..tokenCk.."'\n\nsudo_add = "..sudo_send.."" )
monsters_file:close()
os.execute('cd .. && rm -fr .telegram-cli')
os.execute('cd && rm -fr .telegram-cli')
os.execute('./tg -s ./monsters.lua $@ --bot='..tokenCk)
else
print("\27[31m»»This TOKEN Incorrect , Send Right TOKEN««\27[m")
local token_send = io.read()
chack(token_send)
end
end
os.execute('cd .. && rm -rf .telegram-cli')
if token and token == "TOKEN" then 
print("\27[1;34m»»Send Your Bot TOKEN««\27[m")
local token_send = io.read()
chack(token_send)
else 
os.execute('cd .. && rm -fr .telegram-cli')
os.execute('cd && rm -fr .telegram-cli')
sudo_monsters = dofile("sudo.lua")
local getme = "https://api.telegram.org/bot" ..token.. '/getme'
local req = https.request(getme)
local data = JSON:decode(req)
if data.ok == true then
os.execute('./tg -s ./monsters.lua $@ --bot='..token)
else
print("\27[31mTOKEN Incorrect , Send Right TOKEN««\27[m")
local token_send = io.read()
chack(token_send)
end
end
