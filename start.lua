sudo_Monsters = dofile("sudo.lua")
https = require("ssl.https")
JSON = dofile("./libs/JSON.lua")
local Monsters_dev = io.open("Monsters_online.lua")
if Monsters_dev then
Monsters_on = {string.match(Monsters_dev:read('*all'), "^(.*)/(%d+)")}
local Monsters_file = io.open("sudo.lua", 'w')
Monsters_file:write("token = '" ..Monsters_on[1].."'\n\nsudo_add = "..Monsters_on[2].."" )
Monsters_file:close()
https.request("https://api.telegram.org/bot"..Monsters_on[1].."/sendMessage?chat_id="..Monsters_on[2].."&text=Bot_Tshake_is_start_new")
os.execute('cd .. && rm -rf .telegram-cli')
os.execute('rm -rf Monsters_online.lua')  
os.execute('./tg -s ./Monsters.lua $@ --bot='..Monsters_on[1])
end
function chack(tokenCk)
local getme = "https://api.telegram.org/bot" ..tokenCk.. '/getme'
local req = https.request(getme)
local data = JSON:decode(req)
if data.ok == true then
print("\27[31m✓ DONE\27[m \27[1;34m»»Now Send Sudo ID««\27[m")
local sudo_send  = io.read()
print("\27[31m✓ DONE\27[m")
local Monsters_file = io.open("sudo.lua", 'w')
tsheke_file:write("token = '" ..tokenCk.."'\n\nsudo_add = "..sudo_send.."" )
Monsters_file:close()
os.execute('cd .. && rm -fr .telegram-cli')
os.execute('cd && rm -fr .telegram-cli')
os.execute('./tg -s ./Monsters.lua $@ --bot='..tokenCk)
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
sudo_Monsters = dofile("sudo.lua")
local getme = "https://api.telegram.org/bot" ..token.. '/getme'
local req = https.request(getme)
local data = JSON:decode(req)
if data.ok == true then
os.execute('./tg -s ./Monsters.lua $@ --bot='..token)
else
print("\27[31mTOKEN Incorrect , Send Right TOKEN««\27[m")
local token_send = io.read()
chack(token_send)
end
end
