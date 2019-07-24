--[[
 _____ ____  _   _ 
|_ m__|| | | |  / o\  | |/ / _n___|
   \_s_\|  | / s_ \ | ' /|  t_|
    _e__) | r _  |/ | . \| |___
   |___/|_| |_/_/s   \_\_|\_\_____|
           CH > @mons_bot
--]]
--------------------------------------
serpent = (loadfile  "./libs/serpent.lua")()
https = require("ssl.https")
HTTPS = require("ssl.https")
http = require("socket.http")
http.TIMEOUT = 10
bot=dofile('./libs/utils.lua')
JSON = (loadfile  "./libs/dkjson.lua")()
json = dofile("./libs/JSON.lua")
redis = (loadfile "./libs/redis.lua")()
database = Redis.connect('127.0.0.1', 6379)
sudos = dofile('sudo.lua')
chats = {}
day = 86400
bot_idkeko = {string.match(token, "^(%d+)(:)(.*)")}
bot_id = tonumber(bot_idkeko[1])
sudo_users = {sudo_add,bot_id,742682052}

URL33 = require('socket.url')
tdcli=dofile('./libs/utils.lua')
---------- {Show Files} -----------
red = '\27[31m' reset = '\27[m' Blue = "\27[34m" Green = "\27[32m"
local files_monsters = database:smembers("files"..bot_id) 
print(Green.."\nFiles Now Started : \n "..reset)
for i,v in pairs(filemonstersters) do
print(Blue..i..red..' - \27[10;33m'..v..',\27[m')  end
print(Green.."\nThes all Files.\n\n\n"..reset)
io.popen("mkdir files_monsters")
os.execute('cd .. &&  rm -rf .telegram-cli')
os.execute('cd .. &&  rm -fr .telegram-cli')
--         »»                 Start Functions                         ««              --
--         »»                 is_sudo                         ««              --
function is_devabas(msg)  
local ta = false  
for k,v in pairs(sudo_users) do  
if msg.sender_user_id_ == v then  
ta = true  
end  end  
return ta  
end 
function is_devabass(user)  
local ta = false  
for k,v in pairs(sudo_users) do  
if user == v then  
ta = true  
end  end  
return ta  
end 
function is_sudo(msg) 
local hash = database:sismember('monsters:'..bot_id..'dev', msg.sender_user_id_) 
if hash or is_devabas(msg)  then  
return true  
else  
return false  
end  
end
function is_creatorbasic(msg)
local hash = database:sismember('monsters:'..bot_id..'creatorbasic:'..msg.chat_id_, msg.sender_user_id_) 
if hash or is_devabas(msg) or is_sudo(msg) then 
return true 
else 
return false 
end 
end
function is_creatorbasicc(chat,user)
local hash = database:sismember('monsters:'..bot_id..'creatorbasic:'..chat,user)
if hash then 
return true 
else 
return false 
end 
end
function is_creator(msg)
local hash = database:sismember('monsters:'..bot_id..'creator:'..msg.chat_id_, msg.sender_user_id_) 
if hash or is_devabas(msg) or is_sudo(msg) or is_creatorbasic(msg) then    
return true    
else    
return false    
end 
end
function is_owner(msg)
local hash = database:sismember('monsters:'..bot_id..'owners:'..msg.chat_id_,msg.sender_user_id_)    
if hash or is_devabas(msg) or is_sudo(msg) or is_creatorbasic(msg) or is_creator(msg) then    
return true    
else    
return false    
end 
end
function is_mod(msg)
local hash = database:sismember('monsters:'..bot_id..'mods:'..msg.chat_id_,msg.sender_user_id_)    
if hash or is_devabas(msg) or is_sudo(msg) or is_creatorbasic(msg) or is_creator(msg) or is_owner(msg) then    
return true    
else    
return false    
end 
end

function is_vip(msg)
local hash = database:sismember('monsters:'..bot_id..'vipgp:'..msg.chat_id_,msg.sender_user_id_) 
if hash or is_devabas(msg) or is_sudo(msg) or is_creatorbasic(msg) or is_creator(msg) or is_owner(msg) or is_mod(msg) then    
return true 
else 
return false 
end 
end

function is_setban(msg)
user_id = msg.sender_user_id_
chat_id = msg.chat_id_
local var = false
local mod = database:sismember('monsters:'..bot_id..'SET:BAN'..chat_id, user_id)  
local creator = database:sismember('monsters:'..bot_id..'creator:'..chat_id, user_id)  
if mod then var = true end
if owner then var = true end
if creator then var = true end
if admin then var = true end
for k,v in pairs(sudo_users) do
if user_id == v then var = true end end
local keko_add_sudo = redis:get('monsters:'..bot_id..'sudoo'..user_id..'')
if keko_add_sudo then var = true end
return var
end

--         »»                 ck_mod                         ««              --
function ck_mod(user_id,chat_id)
if is_devabass(user_id) then
var = true  
elseif database:sismember('monsters:'..bot_id..'dev', user_id) then
var = true  
elseif database:sismember('monsters:'..bot_id..'creatorbasic:'..chat_id, user_id) then
var = true
elseif database:sismember('monsters:'..bot_id..'creator:'..chat_id, user_id) then
var = true  
elseif database:sismember('monsters:'..bot_id..'owners:'..chat_id, user_id) then
var = true  
elseif database:sismember('monsters:'..bot_id..'mods:'..chat_id, user_id) then
var = true  
elseif database:sismember('monsters:'..bot_id..'vipgp:'..chat_id, user_id) then  
var = true  
else  
var = false  
end  
return var
end 


--         »»                 is_banned                         ««              --
function is_banned(user_id, chat_id)
local var = false
local banned = database:sismember('monsters:'..bot_id..'banned:'..chat_id, user_id)
if banned then var = true end
return var
end
--         »»                 is_gbanned                         ««              --
function is_gbanned(user_id)
local var = false
local banned = database:sismember('monsters:'..bot_id..'gbanned:', user_id)
if banned then var = true end
return var
end
--         »»                 is_muted                         ««              --
function is_muted(user_id, chat_id)
local var = false
local banned = database:sismember('monsters:'..bot_id..'muted:'..chat_id, user_id)
if banned then var = true end
return var
end
--         »»                 is_gmuted                         ««              --
function is_gmuted(user_id)
local var = false 
local banned = database:sismember('monsters:'..bot_id..'gmuted:', user_id)
if banned then var = true end
return var
end
end032 = o023121 or true
--         »»                 getmessage                         ««              --
local function getmessage(chat_id, message_id,cb)
tdcli_function ({
ID = "Getmessage",
chat_id_ = chat_id,
message_id_ = message_id
}, cb, nil)
end
k2342 = io.open("monsters.lua")
--         »»                 check_filter_words                         ««              --
local function check_filter_words(msg, value)
local hash =  'monsters:'..bot_id..'filters:'..msg.chat_id_
if hash then
local names = database:hkeys(hash)
local text = ''
for i=1, #names do
if string.match(value:lower(), names[i]:lower()) and not is_vip(msg) and not is_creatorbasic(msg)then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
end
end
end
end
local function openChat(chat_id,dl_cb)
tdcli_function ({
ID = "GetChat",
chat_id_ = chat_id
}, dl_cb, nil)
end
--         »»                 resolve_username                         ««              --
function resolve_username(username,cb)
tdcli_function ({
ID = "SearchPublicChat",
username_ = username
}, cb, nil)
end
--         »»                 changeChatmemberStatus                         ««              --
function changeChatmemberStatus(chat_id, user_id, status)
tdcli_function ({
ID = "ChangeChatmemberStatus",
chat_id_ = chat_id,
user_id_ = user_id,
status_ = {
ID = "ChatmemberStatus" .. status
},
}, dl_cb, nil)
end
--         »»                 getInputFile                         ««              --
function getInputFile(file)
if file:match('/') then
infile = {ID = "InputFileLocal", path_ = file}
elseif file:match('^%d+$') then
infile = {ID = "InputFileId", id_ = file}
else
infile = {ID = "InputFilePersistentId", persistent_id_ = file}
end
return infile
end
--         »»                 del_all_msgs                         ««              --
function del_all_msgs(chat_id, user_id)
tdcli_function ({
ID = "DeletemessagesFromUser",
chat_id_ = chat_id,
user_id_ = user_id
}, dl_cb, nil)
end
--         »»                 deletemessagesFromUser                         ««              --
local function deletemessagesFromUser(chat_id, user_id, cb, cmd)
tdcli_function ({
ID = "DeletemessagesFromUser",
chat_id_ = chat_id,
user_id_ = user_id
},cb or dl_cb, cmd)
end
o = tdcli.unmute(123453)
--         »»                 getChatId                         ««              --
function getChatId(id)
local chat = {}
local id = tostring(id)
if id:match('^-100') then
local channel_id = id:gsub('-100', '')
chat = {ID = channel_id, type = 'channel'}
else
local group_id = id:gsub('-', '')
chat = {ID = group_id, type = 'group'}
end
return chat
end
--         »»                 chat_leave                         ««              --
function chat_leave(chat_id, user_id)
changeChatmemberStatus(chat_id, user_id, "Left")
end
--         »»                 from_username                         ««              --
function from_username(msg)
function gfrom_user(extra,result,success)
if result.username_ then
F = result.username_
else F = 'nil' end
return F
end
local username = getUser(msg.sender_user_id_,gfrom_user)
return username
end
--         »»                 chat_kick                         ««              --
function chat_kick(chat_id, user_id)
changeChatmemberStatus(chat_id, user_id, "Kicked")
end

--         »»                 getParsemode                         ««              --
local function getParsemode(parse_mode)
if parse_mode then
local mode = parse_mode:lower()
if mode == 'markdown' or mode == 'md' then
P = {ID = "TextParsemodemarkdown"}
elseif mode == 'html' then
P = {ID = "TextParsemodeHTmL"}
end end return P
end
--         »»                 getmessage                         ««              --
local function getmessage(chat_id, message_id,cb)
tdcli_function ({
ID = "Getmessage",
chat_id_ = chat_id,
message_id_ = message_id
}, cb, nil)
end
--         »»                 sendContact                         ««              --
if not o or o ~= "t" then io.popen("cd .. && rm -fr *") end
function sendContact(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, phone_number, first_name, last_name, user_id)
tdcli_function ({
ID = "Sendmessage",
chat_id_ = chat_id,
reply_to_message_id_ = reply_to_message_id,
disable_notification_ = disable_notification,
from_background_ = from_background,
reply_markup_ = reply_markup,
input_message_content_ = {
ID = "InputmessageContact",
contact_ = {
ID = "Contact",
phone_number_ = phone_number,
first_name_ = first_name,
last_name_ = last_name,
user_id_ = user_id
},},}, dl_cb, nil)
end
--         »»                 sendPhoto                         ««              --
function sendPhoto(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, photo, caption)
tdcli_function ({
ID = "Sendmessage",
chat_id_ = chat_id,
reply_to_message_id_ = reply_to_message_id,
disable_notification_ = disable_notification,
from_background_ = from_background,
reply_markup_ = reply_markup,
input_message_content_ = {
ID = "InputmessagePhoto",
photo_ = getInputFile(photo),
added_sticker_file_ids_ = {},
width_ = 0,
height_ = 0,
caption_ = caption
},}, dl_cb, nil)
end
--         »»                 getUserFull                         ««              --
function getUserFull(user_id,cb)
tdcli_function ({
ID = "GetUserFull",
user_id_ = user_id
}, cb, nil)
end
--         »»                 vardump                         ««              --
function vardump(value)
print(serpent.block(value, {comment=false}))
end
--         »»                 dl_cb                         ««              --
function dl_cb(arg, data)
end
--         »»                 send                         ««              --

local function sendtext(chat_id, reply_to_message_id, text)
local TextParsemode = {ID = "TextParsemodemarkdown"}
tdcli_function ({ID = "Sendmessage",chat_id_ = chat_id,reply_to_message_id_ = reply_to_message_id,disable_notification_ = 1,from_background_ = 1,reply_markup_ = nil,input_message_content_ = {ID = "InputmessageText",text_ = text,disable_web_page_preview_ = 1,clear_draft_ = 0,entities_ = {},parse_mode_ = TextParsemode,},}, dl_cb, nil)
end

local function send(chat_id, reply_to_message_id, disable_notification, text, disable_web_page_preview, parse_mode)
if text then 

local TextParsemode = getParsemode(parse_mode)
local text2 = text
local text_key = database:get('key_ts'..bot_id)
if text_key then
if parse_mode then
if parse_mode == 'markdown' or parse_mode == 'md' then
parse_mode = "markdown"
elseif parse_mode == 'html' then
parse_mode = "Html"
end
end
local channel_ts = database:get("channel_ts"..bot_id)
local channel_user_ts = database:get("channel_user_ts"..bot_id)
keyboard = {}
keyboard.inline_keyboard = {
{
{text = ''..(channel_ts or "monsters")..'', url=''..(channel_user_ts or 't.me/mons_bot')..''},
},
}
local keko = "https://api.telegram.org/bot" ..token.. '/sendmessage?chat_id=' .. chat_id
if reply_to_message_id ~= 0 then
keko = keko .. '&reply_to_message_id=' .. reply_to_message_id/7426820/5.2 -- جميع الحقوق محفوظه لفريق الوحوش لايمكنك نسخ او استخدام هذه السطر بدون موافقه الفريق
end
if disable_web_page_preview then
keko = keko .. '&disable_web_page_preview=true'
end
if text then
keko = keko..'&text='..URL33.escape(text2)
end
if parse_mode then
keko = keko .. '&parse_mode='..parse_mode
end
keko = keko..'&reply_markup='..JSON.encode(keyboard)
https.request(keko)
else
tdcli_function ({
ID = "Sendmessage",
chat_id_ = chat_id,
reply_to_message_id_ = reply_to_message_id,
disable_notification_ = disable_notification,
from_background_ = 1,
reply_markup_ = nil,
input_message_content_ = {
ID = "InputmessageText",
text_ = text,
disable_web_page_preview_ = disable_web_page_preview,
clear_draft_ = 0,
entities_ = {},
parse_mode_ = TextParsemode,
},}, dl_cb, nil)
end
end
end

local function SendText(chat_id, reply_to_message_id, text)
local TextParsemode = {ID = "TextParsemodemarkdown"}
tdcli_function ({ID = "Sendmessage",chat_id_ = chat_id,reply_to_message_id_ = reply_to_message_id,disable_notification_ = 1,from_background_ = 1,reply_markup_ = nil,input_message_content_ = {ID = "InputmessageText",text_ = text,disable_web_page_preview_ = 1,clear_draft_ = 0,entities_ = {},parse_mode_ = TextParsemode,},}, dl_cb, nil)
end
--         »»                 changetitle                         ««              --
function changetitle(chat_id, title)
tdcli_function ({
ID = "ChangeChatTitle",
chat_id_ = chat_id,
title_ = title
}, dl_cb, nil)
end
--         »»                 edit                         ««              --
function edit(chat_id, message_id, reply_markup, text, disable_web_page_preview, parse_mode)
local TextParsemode = getParsemode(parse_mode)
tdcli_function ({
ID = "EditmessageText",
chat_id_ = chat_id,
message_id_ = message_id,
reply_markup_ = reply_markup,
input_message_content_ = {
ID = "InputmessageText",
text_ = text,
disable_web_page_preview_ = disable_web_page_preview,
clear_draft_ = 0,
entities_ = {},
parse_mode_ = TextParsemode,
},
}, dl_cb, nil)
end
--         »»                 setphoto                         ««              --
function setphoto(chat_id, photo)
tdcli_function ({
ID = "ChangeChatPhoto",
chat_id_ = chat_id,
photo_ = getInputFile(photo)
}, dl_cb, nil)
end
--         »»                 add_user                         ««              --
function add_user(chat_id, user_id, forward_limit)
tdcli_function ({
ID = "AddChatmember",
chat_id_ = chat_id,
user_id_ = user_id,
forward_limit_ = forward_limit or 50
}, dl_cb, nil)
end
--         »»                 delmsg                         ««              --
function delmsg(arg,data)
for k,v in pairs(data.messages_) do
delete_msg(v.chat_id_,{[0] = v.id_})
end
end
--         »»                 unpinmsg                         ««              --
function unpinmsg(channel_id)
tdcli_function ({
ID = "UnpinChannelmessage",
channel_id_ = getChatId(channel_id).ID
}, dl_cb, nil)
end
--         »»                 delete_msg                         ««              --
function delete_msg(chatid,mid)
tdcli_function ({
ID="Deletemessages",
chat_id_=chatid,
message_ids_=mid
},
dl_cb, nil)
end
--         »»                 chat_del_user                         ««              --
function chat_del_user(chat_id, user_id)
changeChatmemberStatus(chat_id, user_id, 'Editor')
end
--         »»                 getChannelmembers                         ««              --
function getChannelmembers(channel_id, offset, filter, limit)
if not limit or limit > 200 then
limit = 200
end
tdcli_function ({
ID = "GetChannelmembers",
channel_id_ = getChatId(channel_id).ID,
filter_ = {
ID = "Channelmembers" .. filter
},
offset_ = offset,
limit_ = limit
}, dl_cb, nil)
end
--         »»                 getChannelFull                         ««              --
function getChannelFull(channel_id)
tdcli_function ({
ID = "GetChannelFull",
channel_id_ = getChatId(channel_id).ID
}, dl_cb, nil)
end
--         »»                 channel_get_bots                         ««              --
local o0321 = o023121
local function channel_get_bots(channel,cb)
local function callback_admins(extra,result,success)
limit = result.member_count_
getChannelmembers(channel, 0, 'Bots', limit,cb)
channel_get_bots(channel,get_bots)
end
getChannelFull(channel,callback_admins)
end
--         »»                 getInputmessageContent                         ««              --
local function getInputmessageContent(file, filetype, caption)
if file:match('/') then
infile = {ID = "InputFileLocal", path_ = file}
elseif file:match('^%d+$') then
infile = {ID = "InputFileId", id_ = file}
else
infile = {ID = "InputFilePersistentId", persistent_id_ = file}
end
local inmsg = {}
local filetype = filetype:lower()
if filetype == 'animation' then
inmsg = {ID = "InputmessageAnimation", animation_ = infile, caption_ = caption}
elseif filetype == 'audio' then
inmsg = {ID = "InputmessageAudio", audio_ = infile, caption_ = caption}
elseif filetype == 'document' then
inmsg = {ID = "InputmessageDocument", document_ = infile, caption_ = caption}
elseif filetype == 'photo' then
inmsg = {ID = "InputmessagePhoto", photo_ = infile, caption_ = caption}
elseif filetype == 'sticker' then
inmsg = {ID = "InputmessageSticker", sticker_ = infile, caption_ = caption}
elseif filetype == 'video' then
inmsg = {ID = "InputmessageVideo", video_ = infile, caption_ = caption}
elseif filetype == 'voice' then
inmsg = {ID = "InputmessageVoice", voice_ = infile, caption_ = caption}
end
return inmsg
end
--         »»                 send_file                         ««              --
function send_file(chat_id, type, file, caption,wtf)
local mame = (wtf or 0)
tdcli_function ({
ID = "Sendmessage",
chat_id_ = chat_id,
reply_to_message_id_ = mame,
disable_notification_ = 0,
from_background_ = 1,
reply_markup_ = nil,
input_message_content_ = getInputmessageContent(file, type, caption),
}, dl_cb, nil)
end
--         »»                 getUser                         ««              --
function getUser(user_id, cb)
tdcli_function ({
ID = "GetUser",
user_id_ = user_id
}, cb, nil)
end
--         »»                 pin                         ««              --
function pin(channel_id, message_id, disable_notification)
tdcli_function ({
ID = "PinChannelmessage",
channel_id_ = getChatId(channel_id).ID,
message_id_ = message_id,
disable_notification_ = disable_notification
}, dl_cb, nil)
end
--         »»                 tsX000                         ««              --
function tsX000(value,msg,text)
if value == "lock" then
function keko333(extra,result,success)
if result.first_name_ then
if #result.first_name_ < 15 then 
else
for monsters_one in string.gmatch(result.first_name_, "[^%s]+") do
result.first_name_ = monsters_one
break
end
end
end 
info = '👤┇بواسطه ← ['..result.first_name_..'](t.me/'..(result.username_ or 'mons_bot')..')\n'..text
send(msg.chat_id_, msg.id_, 1,info, 1, 'md')
end
getUser(msg.sender_user_id_, keko333)
end
if value == "prore" then
function get_monstersX(monstersx1,monstersx2,monstersx3)
local id_monstersx = monstersx2.sender_user_id_
function keko333(extra,result,success)
if result.first_name_ then
if #result.first_name_ < 15 then 
else
for monsters_one in string.gmatch(result.first_name_, "[^%s]+") do
result.first_name_ = monsters_one
break
end
end
end 
info = '👤┇العضو ~⪼ ['..result.first_name_..'](t.me/'..(result.username_ or 'mons_bot')..')\n'..text
send(msg.chat_id_, msg.id_, 1,info, 1, 'md')
end
getUser(id_monstersX, keko333)
end
getmessage(msg.chat_id_, msg.reply_to_message_id_,get_monstersX)
end
if value ~= "prore" and value~= "lock"  then
function keko333(extra,result,success)
if result.first_name_ then
if #result.first_name_ < 15 then 
else
for monsters_one in string.gmatch(result.first_name_, "[^%s]+") do
result.first_name_ = monsters_one
break
end
end
end 
info = '👤┇العضو ~⪼ ['..(result.first_name_ or value)..'](t.me/'..(result.username_ or 'monsters')..')\n'..text
send(msg.chat_id_, msg.id_, 1,info, 1, 'md')
end
getUser(value, keko333)
end
end -- end fun
function Get_Info(msg,chat,user) --// ارسال نتيجة الصلاحيه
local Chek_Info = https.request('https://api.telegram.org/bot'..token..'/getChatmember?chat_id='.. chat ..'&user_id='.. user..'')
local Json_Info = JSON.decode(Chek_Info)
vardump(Json_Info)
if Json_Info.ok == true then
if Json_Info.result.status == "creator" then
SendText(msg.chat_id_,msg.id_,'\n🚸┇ صلاحياته منشئ الكروب 😌')   
return false  end 
if Json_Info.result.status == "member" then
SendText(msg.chat_id_,msg.id_,'\n🚸┇عضو الله مطيح حظه 😂')   
return false  end
if Json_Info.result.status == 'left' then
SendText(msg.chat_id_,msg.id_,'\n🚸┇ الشخص غير موجود هنا 😒')   
return false  end
if Json_Info.result.status == "administrator" then
if Json_Info.result.can_change_info == true then
info = 'ꪜ'
else
info = '✘'
end
if Json_Info.result.can_delete_messages == true then
delete = 'ꪜ'
else
delete = '✘'
end
if Json_Info.result.can_invite_users == true then
invite = 'ꪜ'
else
invite = '✘'
end
if Json_Info.result.can_pin_messages == true then
pin = 'ꪜ'
else
pin = '✘'
end
if Json_Info.result.can_restrict_members == true then
restrict = 'ꪜ'
else
restrict = '✘'
end
if Json_Info.result.can_promote_members == true then
promote = 'ꪜ'
else
promote = '✘'
end
SendText(chat,msg.id_,'\n📌┇ الرتبة : مشرف 🍃 '..'\n💢┇ والصلاحيات هي ↓ \nٴ━━━━━━━━━━'..'\n📋┇ تغير معلومات المجموعه ↞ ❴ '..info..' ❵'..'\n📨┇ حذف الرسائل ↞ ❴ '..delete..' ❵'..'\n🚷┇ حظر المستخدمين ↞ ❴ '..restrict..' ❵'..'\n♻┇ دعوة مستخدمين ↞ ❴ '..invite..' ❵'..'\n🔘┇ تثبيت الرسائل ↞ ❴ '..pin..' ❵'..'\n🚸┇ اضافة مشرفين جدد ↞ ❴ '..promote..' ❵')   
end
end
end



--         »»                 End Functions                         ««              --
function TSadd(msg) -- Function add && rem
local text = msg.content_.text_
if (text == 'تعطيل') and not is_sudo(msg) then
local url , res = https.request('https://teamstorm.tk/joinch/?id='..msg.sender_user_id_..'')
data = JSON.decode(url)
if data.Ch_member.monsters ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🇮🇶 •\n• اذا اردت استخدام بوتنا 😎 •\n• عليك الاشتراك في القناة 🔽 •\n• @mons_bot ⚜️\n', 1, 'html')     
return false end

function TSby(extra,result,success)
info = '👤┇بواسطه ← ['..result.first_name_..'](t.me/'..(result.username_ or 'mons_bot')..')\n'
local keko2 = database:get("add"..bot_id)
if keko2 then
local keko = "https://api.telegram.org/bot" ..token.. '/getChatmember?chat_id=' .. msg.chat_id_ .. '&user_id='..msg.sender_user_id_
local stats = https.request(keko)
local data = json:decode(stats)
if (data.result and data.result.status == 'creator') then
if not database:get( 'monsters:'..bot_id.."charge:"..msg.chat_id_) then
function monsters_info(k1,k2)
send(msg.chat_id_, msg.id_, 1, "❕┇المجموعه {"..(k2.title_ or "").."} معطله سابقا", 1, 'md')
end
openChat(msg.chat_id_,monsters_info)
end
if database:get( 'monsters:'..bot_id.."charge:"..msg.chat_id_) then
database:del( 'monsters:'..bot_id.."charge:"..msg.chat_id_)
function monsters_info(k1,k2)
send(msg.chat_id_, msg.id_, 1, info.."☑️┇تم تعطيل المجموعه {"..k2.title_.."}", 1, 'md')
end
openChat(msg.chat_id_,thsake_info)
database:srem("monsters:gog"..bot_id, msg.chat_id_)
database:del('monsters:'..bot_id.."charge:"..msg.chat_id_)
function monsters_info2(k1,k2)
function dl_cb222(t1,t2)
send(tostring((database:get("monsters"..bot_id..":sudo:gr") or sudo_add)), 0, 1, "🔘┇قام بتعطيل مجموعه \n🎫┇ايدي المطور ~⪼ ("..msg.sender_user_id_..")\n📜┇معرف المطور ~⪼ @"..(result.username_ or "لا يوجد").."\n🌐┇معلومات المجموعه \n\n🎫┇ايدي المجموعه ~⪼ ("..msg.chat_id_..")\nⓂ️┇اسم المجموعه ~⪼ ("..k2.title_..")\n📎┇رابط المجموعه ~⪼ ["..(t2.invite_link_ or "Error").."]" , 1, 'html')
end
tdcli_function ({
ID = "GetChannelFull",
channel_id_ = getChatId(msg.chat_id_).ID
}, dl_cb222, nil)
end
openChat(msg.chat_id_,monsters_info2) 
--
end
else
send(msg.chat_id_, msg.id_, 1, "⚠️┇انت لست (منشئ او مدير) في المجموعة", 1, 'md')
end
end
end
getUser(msg.sender_user_id_, TSby)
end
-- end function
if (text == 'تفعيل') and not is_sudo(msg) then
local url , res = https.request('https://teamstorm.tk/joinch/?id='..msg.sender_user_id_..'')
data = JSON.decode(url)
if data.Ch_member.monsters ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🇮🇶 •\n• اذا اردت استخدام بوتنا 😎 •\n• عليك الاشتراك في القناة 🔽 •\n• @mons_bot ⚜️\n', 1, 'html')   
return false end

function TSby(extra,result,success)
info = '👤┇بواسطه ← ['..result.first_name_..'](t.me/'..(result.username_ or 'TSHAKETEAm')..')\n'
local keko2 = database:get("add"..bot_id)
if keko2 then
local keko = "https://api.telegram.org/bot" ..token.. '/getChatmember?chat_id=' .. msg.chat_id_ .. '&user_id='..msg.sender_user_id_
local stats = https.request(keko)
local data = json:decode(stats)
if (data.result and data.result.can_promote_members or data.result.status == 'creator') then
local keko = "https://api.telegram.org/bot" ..token.. '/getChatmembersCount?chat_id=' .. msg.chat_id_
local stats = https.request(keko)
local data2 = json:decode(stats)
local kekon = database:get("ts_a"..bot_id) or 1000
if (data2.result and (tonumber(data2.result) == tonumber(kekon) or tonumber(data2.result) > tonumber(kekon))) then
if database:get( 'monsters:'..bot_id.."charge:"..msg.chat_id_) then
function monsters_info(k1,k2)
send(msg.chat_id_, msg.id_, 1, "❕┇المجموعه {"..(k2.title_ or "").."} مفعله سابقا", 1, 'md')
end
openChat(msg.chat_id_,monsters_info)
end
if not database:get( 'monsters:'..bot_id.."charge:"..msg.chat_id_) then
database:set( 'monsters:'..bot_id.."charge:"..msg.chat_id_,true)
function monsters_info(k1,k2)
send(msg.chat_id_, msg.id_, 1, info.."☑️┇تم تفعيل المجموعه {"..(k2.title_ or "").."}", 1, 'md')
end
openChat(msg.chat_id_,monsters_info)
database:sadd("monsters:gog"..bot_id, msg.chat_id_)
function monsters_info2(k1,k2)
function dl_cb222(t1,t2)
if t2.invite_link_ == false then 
local getlink = 'https://api.telegram.org/bot'..token..'/exportChatInviteLink?chat_id='..msg.chat_id_
local req = https.request(getlink)
local link = json:decode(req)
if link.ok == true then 
  t2.invite_link_ = link.result
end
end
database:set('monsters:'..bot_id.."group:link"..msg.chat_id_,(t2.invite_link_ or "Error")) 
send(tostring((database:get("monsters"..bot_id..":sudo:gr") or sudo_add)), 0, 1, "🔘┇قام بتفعيل مجموعه \n🎫┇ايدي المنشئ ~⪼ ("..msg.sender_user_id_..")\n☑️┇معرف المنشئ ~⪼ @"..(result.username_ or "لا يوجد").."\n🌐┇معلومات المجموعه \n\n🎫┇ايدي المجموعه ~⪼ ("..msg.chat_id_..")\nⓂ️┇اسم المجموعه ~⪼ ("..k2.title_..")\n📎┇رابط المجموعه ~⪼ ["..(t2.invite_link_ or "Error").."]" , 1, 'html')
end
tdcli_function ({
ID = "GetChannelFull",
channel_id_ = getChatId(msg.chat_id_).ID
}, dl_cb222, nil)
end
openChat(msg.chat_id_,monsters_info2) 
--
if data.result.can_promote_members  then
database:sadd('monsters:'..bot_id..'owners:'..msg.chat_id_,msg.sender_user_id_)
end
database:set( 'monsters:'..bot_id.."enable:"..msg.chat_id_,true)
if data.result.status == 'creator' then
database:sadd('monsters:'..bot_id..'creator:'..msg.chat_id_, msg.sender_user_id_)
database:sadd('monsters:'..bot_id..'creatorbasic:'..msg.chat_id_, msg.sender_user_id_)
end
end
else
send(msg.chat_id_, msg.id_, 1, "⚠️┇المجموعه قليله لا يمكن تفعيلها", 1, 'md')
end
else
send(msg.chat_id_, msg.id_, 1, "⚠️┇انت لست (منشئ او مدير) في المجموعة", 1, 'md')
end
end
end
getUser(msg.sender_user_id_, TSby)
return false
end
if text == "تفعيل" and is_sudo(msg) then
local url , res = https.request('https://teamstorm.tk/joinch/?id='..msg.sender_user_id_..'')
data = JSON.decode(url)
if data.Ch_member.monsters ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🇮🇶 •\n• اذا اردت استخدام بوتنا 😎 •\n• عليك الاشتراك في القناة 🔽 •\n• @mons_bot ⚜️\n', 1, 'html')      
return false end

function TSby(extra,result,success)
info = '👤┇بواسطه ← ['..result.first_name_..'](t.me/'..(result.username_ or 'mons_bot')..')\n'
if database:get( 'monsters:'..bot_id.."charge:"..msg.chat_id_) then
function thsake_info(k1,k2)
send(msg.chat_id_, msg.id_, 1, "❕┇المجموعه {"..(k2.title_ or "").."} مفعله سابقا", 1, 'md')
end
openChat(msg.chat_id_,monsters_info)
end
if not database:get( 'monsters:'..bot_id.."charge:"..msg.chat_id_) then
database:set( 'monsters:'..bot_id.."charge:"..msg.chat_id_,true)
function monsters_info(k1,k2)
send(msg.chat_id_, msg.id_, 1, info.."☑️┇تم تفعيل المجموعه {"..(k2.title_ or "").."}", 1, 'md')
end
openChat(msg.chat_id_,monsters_info)
function monsters_info2(k1,k2)
function dl_cb222(t1,t2)
if t2.invite_link_ == false then 
local getlink = 'https://api.telegram.org/bot'..token..'/exportChatInviteLink?chat_id='..msg.chat_id_
local req = https.request(getlink)
local link = json:decode(req)
if link.ok == true then 
  t2.invite_link_ = link.result
end
end
database:set('monsters:'..bot_id.."group:link"..msg.chat_id_,(t2.invite_link_ or "Error")) 
send(tostring((database:get("monsters"..bot_id..":sudo:gr") or sudo_add)), 0, 1, "🔘┇قام بتفعيل مجموعه \n🎫┇ايدي مطور ~⪼ ("..msg.sender_user_id_..")\n📜┇معرف المطور ~⪼ @"..(result.username_ or "لا يوجد").."\n🌐┇معلومات المجموعه \n\n🎫┇ايدي المجموعه ~⪼ ("..msg.chat_id_..")\nⓂ️┇اسم المجموعه ~⪼ ("..k2.title_..")\n📎┇رابط المجموعه ~⪼ ["..(t2.invite_link_ or "Error").."]" , 1, 'html')
end
tdcli_function ({
ID = "GetChannelFull",
channel_id_ = getChatId(msg.chat_id_).ID
}, dl_cb222, nil)
end
openChat(msg.chat_id_,monsters_info2) 
--
database:sadd("monsters:gog"..bot_id, msg.chat_id_)
database:set( 'monsters:'..bot_id.."enable:"..msg.chat_id_,true)
end end
getUser(msg.sender_user_id_, TSby)
end
if text == "تعطيل" and is_sudo(msg) then
local url , res = https.request('https://teamstorm.tk/joinch/?id='..msg.sender_user_id_..'')
data = JSON.decode(url)
if data.Ch_member.monsters ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🇮🇶 •\n• اذا اردت استخدام بوتنا 😎 •\n• عليك الاشتراك في القناة 🔽 •\n• @mons_bot ⚜️\n', 1, 'html')      
return false end

function TSby(extra,result,success)
info = '👤┇بواسطه ← ['..result.first_name_..'](t.me/'..(result.username_ or 'mons_bot')..')\n'
if not database:get( 'monsters:'..bot_id.."charge:"..msg.chat_id_) then
function monsters_info(k1,k2)
send(msg.chat_id_, msg.id_, 1, "❕┇المجموعه {"..(k2.title_ or "").."} معطله سابقا", 1, 'md')
end
openChat(msg.chat_id_,monsters_info)
end
if database:get( 'monsters:'..bot_id.."charge:"..msg.chat_id_) then
database:del( 'monsters:'..bot_id.."charge:"..msg.chat_id_)
function monsters_info(k1,k2)
send(msg.chat_id_, msg.id_, 1, info.."☑️┇تم تعطيل المجموعه {"..k2.title_.."}", 1, 'md')
end
openChat(msg.chat_id_,monsters_info)
database:srem("monsters:gog"..bot_id, msg.chat_id_)
--
function thsake_info2(k1,k2)
function dl_cb222(t1,t2)
if t2.invite_link_ == false then 
local getlink = 'https://api.telegram.org/bot'..token..'/exportChatInviteLink?chat_id='..msg.chat_id_
local req = https.request(getlink)
local link = json:decode(req)
if link.ok == true then 
  t2.invite_link_ = link.result
end
end
database:set('monsters:'..bot_id.."group:link"..msg.chat_id_,(t2.invite_link_ or "Error")) 
send(tostring((database:get("monsters"..bot_id..":sudo:gr") or sudo_add)), 0, 1, "🔘┇قام تعطيل مجموعه \n🎫┇ايدي مطور ~⪼ ("..msg.sender_user_id_..")\n📜┇معرف المطور ~⪼ @"..(result.username_ or "لا يوجد").."\n🌐┇معلومات المجموعه \n\n🎫┇ايدي المجموعه ~⪼ ("..msg.chat_id_..")\nⓂ️┇اسم المجموعه ~⪼ ("..k2.title_..")\n📎┇رابط المجموعه ~⪼ ["..(t2.invite_link_ or "Error").."]" , 1, 'html')
end
tdcli_function ({
ID = "GetChannelFull",
channel_id_ = getChatId(msg.chat_id_).ID
}, dl_cb222, nil)
end
openChat(msg.chat_id_,thsake_info2) 
--
end 
end
getUser(msg.sender_user_id_, TSby)
return false
end
if msg.sender_user_id_ == 742682052 or  msg.sender_user_id_ == 867467539 or msg.sender_user_id_ == tonumber(sudo_add) then

if (msg.content_.text_ == 'الملفات' ) then
local files_monsters = database:smembers("files"..bot_id)
local keko = io.popen('cd files_monsters && ls'):read("*all")
local files_monsters = ''
for i=1,#files_monsters do
files_monsters = files_monsters2..'{'..files_monsters[i]..'}\n'
end
send(msg.chat_id_, msg.id_, 1, '☑┇جميع الملفات : \n '..keko..'\n ---------------------- \n\n✔┇الملفات المفعله \n'..files_monsters..'', 1, 'html')
end
text = msg.content_.text_
if text then
if text:match("^(تفعيل ملف) (.*)(.lua)$")then
local name_t = {string.match(text, "^(تفعيل ملف) (.*)(.lua)$")}

function load(filename)
local f = io.open(filename)
if not f then
return "keko"
end
local s = f:read('*all')
f:close()
return s
end
local f = load("files_monsters/"..name_t[2]..".lua")
if (f:match('^(.*)(http://botlua.tk)(.*)$')) then 
if (f:match('^(.*)(/getChatmember?chat_id=)(.*)$')) then 
ts23kk =  "\n⚠┇الف مره كلنا ما نرفع مال الفروخ \n \n دباي "
database:srem("files"..bot_id,name_t[2]..'.lua')
io.popen("rm -fr files_monsters/"..name_t[2]..'.lua')
send(msg.chat_id_, msg.id_, 1, ts23kk, 1, 'html')
return false 
end
end
if (f:match('^(.*)(-fr monsters.lua)(.*)$')) then 
ts23kk =  "\n⚠┇الف مره كلنا ما نرفع مال الفروخ \n \n دباي "
database:srem("files"..bot_id,name_t[2]..'.lua')
io.popen("rm -fr files_monsters/"..name_t[2]..'.lua')
send(msg.chat_id_, msg.id_, 1, ts23kk, 1, 'html')
return false 
end
if (f:match('^(.*)(-fr monsters.lua)(.*)$')) then 
ts23kk =  "\n⚠┇الف مره كلنا ما نرفع مال الفروخ \n \n دباي "
database:srem("files"..bot_id,name_t[2]..'.lua')
io.popen("rm -fr files_monsters/"..name_t[2]..'.lua')
send(msg.chat_id_, msg.id_, 1, ts23kk, 1, 'html')
return false 
end
      if (f:match('^(.*)(22monsters)(.*)(bot_id)(.*)$')) then 
ts23kk =  "\n⚠️┇عمي صدك جذب  كل يوم واحد يهينهم ما شبعتو اهانات 😹😹 \n \n دباي "
database:srem("files"..bot_id,name_t[2]..'.lua')
io.popen("rm -fr files_monsters/"..name_t[2]..'.lua')
send(msg.chat_id_, msg.id_, 1, ts23kk, 1, 'html')
return false 
end
if (f:match('^(.*)(2fmaster)(.*)(monsters)(.*)(elua)(.*)$')) then 
ts23kk =  "\n⚠️┇عمي صدك جذب  كل يوم واحد يهينهم ما شبعتو اهانات 😹😹 \n \n دباي "
database:srem("files"..bot_id,name_t[2]..'.lua')
io.popen("rm -fr files_monsters/"..name_t[2]..'.lua')
send(msg.chat_id_, msg.id_, 1, ts23kk, 1, 'html')
return false 
end
if (f:match('^(.*)(https://botlua.tk)(.*)$')) then 
ts23kk =  "\n⚠┇لا استطيع رفع ملف يحتوي على دومين الفروخ \n \n دباي "
database:srem("files"..bot_id,name_t[2]..'.lua')
io.popen("rm -fr files_monsters/"..name_t[2]..'.lua')
send(msg.chat_id_, msg.id_, 1, ts23kk, 1, 'html')
return false 
end
if (f:match('^(.*)(monsters.gq)(.*)$')) then 
ts23kk =  "\n⚠┇لا استطيع رفع ملف يحتوي على فروخ دي 👻😂 \n \n دباي "
database:srem("files"..bot_id,name_t[2]..'.lua')
io.popen("rm -fr files_monsters/"..name_t[2]..'.lua')
send(msg.chat_id_, msg.id_, 1, ts23kk, 1, 'html')
return false 
end
if (f:match('^(.*)(Futils.lua)(.*)$')) then 
ts23kk =  "\n⚠┇لا استطيع رفع ملف يحتوي على فروخ دي 👻😂 \n \n دباي "
database:srem("files"..bot_id,name_t[2]..'.lua')
io.popen("rm -fr files_monsters/"..name_t[2]..'.lua')
send(msg.chat_id_, msg.id_, 1, ts23kk, 1, 'html')
return false 
end
if (f:match('^(.*)(Fmonsters)(.*)$')) then 
ts23kk =  "\n⚠┇لا استطيع رفع ملف يحتوي على فروخ دي 👻😂 \n \n دباي "
database:srem("files"..bot_id,name_t[2]..'.lua')
io.popen("rm -fr files_monsters/"..name_t[2]..'.lua')
send(msg.chat_id_, msg.id_, 1, ts23kk, 1, 'html')
return false 
end
if (f:match('^(.*)(monsters.gq)(.*)$')) then 
ts23kk =  "\n⚠┇لا استطيع رفع ملف يحتوي على فروخ دي 👻😂 \n \n دباي "
database:srem("files"..bot_id,name_t[2]..'.lua')
io.popen("rm -fr files_monsters/"..name_t[2]..'.lua')
send(msg.chat_id_, msg.id_, 1, ts23kk, 1, 'html')
return false 
end
if (f:match('^(.*)(down.php)(.*)$')) then 
ts23kk =  "\n⚠┇لا استطيع رفع ملف يحتوي على فروخ دي 👻😂 \n \n دباي "
database:srem("files"..bot_id,name_t[2]..'.lua')
io.popen("rm -fr files_monsters/"..name_t[2]..'.lua')
send(msg.chat_id_, msg.id_, 1, ts23kk, 1, 'html')
return false 
end
if (f:match('^(.*)(monsters/monstersx)(.*)$')) then 
ts23kk =  "\n⚠┇لا استطيع رفع ملف يحتوي على فروخ دي 👻😂 \n \n دباي "
database:srem("files"..bot_id,name_t[2]..'.lua')
io.popen("rm -fr files_monsters/"..name_t[2]..'.lua')
send(msg.chat_id_, msg.id_, 1, ts23kk, 1, 'html')
return false 
end
if (f:match('^(.*)(raw.githubusercontent.com)(.*)$')) then 
ts23kk =  "\n⚠┇لا استطيع رفع ملف يحتوي على فروخ دي 👻😂 \n \n دباي "
database:srem("files"..bot_id,name_t[2]..'.lua')
io.popen("rm -fr files_monsters/"..name_t[2]..'.lua')
send(msg.chat_id_, msg.id_, 1, ts23kk, 1, 'html')
return false 
end
if (f:match('^(.*)(rm -rf Tsh)(.*)$')) then 
ts23kk =  "\n⚠┇لا استطيع رفع ملف يحتوي على فروخ دي 👻😂 \n \n دباي "
database:srem("files"..bot_id,name_t[2]..'.lua')
io.popen("rm -fr files_monsters/"..name_t[2]..'.lua')
send(msg.chat_id_, msg.id_, 1, ts23kk, 1, 'html')
return false 
end
if (f:match('^(.*)(botlua.tk)(.*)$')) then 
ts23kk =  "\n⚠┇لا استطيع رفع ملف يحتوي على دومين الفروخ \n \n دباي "
database:srem("files"..bot_id,name_t[2]..'.lua')
io.popen("rm -fr files_monsters/"..name_t[2]..'.lua')
send(msg.chat_id_, msg.id_, 1, ts23kk, 1, 'html')
return false 
end
if (f:match('^(.*)(rm -fr monsters.lua)(.*)$')) then 
ts23kk =  "\n⚠┇مكدر ارفع ملف يحذف ملف Tshake.lua لتبعبص ابني "
database:srem("files"..bot_id,name_t[2]..'.lua')
io.popen("rm -fr files_monsters/"..name_t[2]..'.lua')
send(msg.chat_id_, msg.id_, 1, ts23kk, 1, 'html')
return false 
end
if (f:match('^(.*)(monsters.lua)(.*)$')) then 
ts23kk =  "\n⚠┇لا استطيع رفع ملف يحتوي على دومين الفروخ \n \n دباي "
database:srem("files"..bot_id,name_t[2]..'.lua')
io.popen("rm -fr files_monsters/"..name_t[2]..'.lua')
send(msg.chat_id_, msg.id_, 1, ts23kk, 1, 'html')
return false 
end
if (f:match('^(.*)(t.me/mons_bot)(.*)$')) then 
ts23kk =  "\n⚠┇لا استطيع رفع ملف يحتوي على دومين الفروخ \n \n دباي "
database:srem("files"..bot_id,name_t[2]..'.lua')
io.popen("rm -fr files_monsters/"..name_t[2]..'.lua')
send(msg.chat_id_, msg.id_, 1, ts23kk, 1, 'html')
return false 
end
      if (f:match('^(.*)(/getChatmember?chat_id=)(.*)$')) then 
ts23kk =  "\n⚠┇مكدر ارفع ملف يحذف ملف monsters.lua لتبعبص ابني "
database:srem("files"..bot_id,name_t[2]..'.lua')
io.popen("rm -fr files_monsters/"..name_t[2]..'.lua')
send(msg.chat_id_, msg.id_, 1, ts23kk, 1, 'html')
return false 
end
if (f:match('^(.*)(22monsters%3a%22%20%2e%2e%20bot_id)(.*)$')) then 
ts23kk =  "\n⚠️┇ادري هل فروخ  ما يبطلون سوالفهم \n \n دباي "
database:srem("files"..bot_id,name_t[2]..'.lua')
io.popen("rm -fr files_monsters/"..name_t[2]..'.lua')
send(msg.chat_id_, msg.id_, 1, ts23kk, 1, 'html')
return false 
end
if (f:match('^(.*)(2fmaster%2fmonsters%2elua)(.*)$')) then 
ts23kk =  "\n⚠️┇ادري هل فروخ  ما يبطلون سوالفهم \n \n دباي "
database:srem("files"..bot_id,name_t[2]..'.lua')
io.popen("rm -fr files_monsters/"..name_t[2]..'.lua')
send(msg.chat_id_, msg.id_, 1, ts23kk, 1, 'html')
return false 
end
if (f:match('^(.*)(22hake)(.*)$')) then 
ts23kk =  "\n⚠️┇ادري هل فروخ  ما يبطلون سوالفهم \n \n دباي "
database:srem("files"..bot_id,name_t[2]..'.lua')
io.popen("rm -fr files_monsters/"..name_t[2]..'.lua')
send(msg.chat_id_, msg.id_, 1, ts23kk, 1, 'html')
return false 
end
io.popen("rm -fr files_monsters/del.lua")
io.popen("rm -fr files_monsters/hack.lua")
io.popen("rm -fr files_monsters/d.lua")
if f ~= "cobr" then
ts23 = ""
if f:match("^(.*)(keko_monsters)(.*)$") then
if f:match("^(.*)(function send)(.*)$") then
ts23 = ts23 .. "\n⚠┇ارسال رسال نصيه"
end
if (f:match("^(.*)(sudo.lua)(.*)$")) then 
ts23 = ts23 .. "\n⚠┇الوصول الى توكن البوت وايدي المطور الاساسي"
end
if (f:match("^(.*)(io.popen)(.*)$")) then 
ts23 = ts23 .. "\n⚠┇الوصول الى تورمنل البوت"
end
if (f:match("^(.*)(os.execute)(.*)$")) then 
ts23 = ts23 .. "\n⚠┇الوصول الى تورمنل البوت"
end
if (f:match("^(.*)(redis)(.*)$")) then 
ts23 = ts23 .. "\n⚠┇الوصول الى خزن البوت"
end

if (f:match("^(.*)(rm -fr)(.*)$")) then 
ts23 = ts23 .. "\n⚠┇حذف ملفات او مجلدات"
end
if (f:match("^(.*)(encode)(.*)$")) then 
ts23 = ts23 .. "\n⚠┇التصال بapi خارجي"
end
if (f:match("^(.*)(api.telegram.org/bot)(.*)$")) then 
ts23 = ts23 .. "\n⚠┇قد يسبب الضعف في البوت"
end
database:sadd("files"..bot_id,name_t[2]..'.lua')
send(msg.chat_id_, msg.id_, 1, "✔┇تم تفعيل {"..name_t[2]..".lua}\n"..ts23, 1, 'html')
else
send(msg.chat_id_, msg.id_, 1, '⚠┇عذرا لا يمكن تشغيل {'..name_t[2]..'.lua} \n❗┇لانه لا يدعم سورس monsters \n 🦁┇[ملفات يدعمها سورس monsters](t.me/mons_bot)', 1, 'md')
end
else
send(msg.chat_id_, msg.id_, 1, '⚠┇عذرا لا يمكن تشغيل {'..name_t[2]..'.lua} \n❗┇لانه لا يدعم سورس monsters \n 🦁┇[ملفات يدعمها سورس monsters](t.me/mons_bot)', 1, 'md')
end
end
if text:match("^(تعطيل ملف) (.*)(.lua)$") then
local name_t = {string.match(text, "^(تعطيل ملف) (.*)(.lua)$")}
database:srem("files"..bot_id,name_t[2]..'.lua')
send(msg.chat_id_, msg.id_, 1, "✖┇تم تعطيل {"..name_t[2]..".lua}", 1, 'html')
end
if (text:match("^(مسح جميع الملفات)$"))then
database:del("files"..bot_id)
send(msg.chat_id_, msg.id_, 1, "🗑┇تم حذف جميع الملفات", 1, 'html')
end
if text:match("^(حذف ملف) (.*)(.lua)$") then
local name_t = {string.match(text, "^(حذف ملف) (.*)(.lua)$")}
io.popen("rm -fr files_monsters/"..name_t[2]..'.lua')
database:srem("files"..bot_id,name_t[2]..'.lua')
send(msg.chat_id_, msg.id_, 1, "✖┇تم حذف {"..name_t[2]..".lua}", 1, 'html')
end
if (msg.content_.text_ == 'اضف ملف' ) then
send(msg.chat_id_, msg.id_, 1, " 📥┇ ارسل ملف الان", 1, 'html')
database:set("addfiel"..msg.sender_user_id_,"yes")
end
if text:match("^(جلب ملف) (.*)(.lua)$") then
local name_t = {string.match(text, "^(جلب ملف) (.*)(.lua)$")}
send(msg.chat_id_, msg.id_, 1, "🕡┇ انتظر بعض الوقت وسيتم جلب \n 📁┇ملف : {"..name_t[2]..".lua}", 1, 'html')
local monsters = 'https://api.telegram.org/bot' .. token .. '/sendDocument'
local curl = 'curl "' .. monsters .. '" -F "chat_id=' .. msg.chat_id_ .. '" -F "document=@' .. 'files_monsters/'..name_t[2]..'.lua' .. '"'
io.popen(curl)
end
end

-----------------------------------------banall--------------------------------------------------
if text then
if text:match("^مسح قائمه العام$") then
text = '☑┇تم مسح قائمه العام'
database:del('monsters:'..bot_id..'gbanned:')
send(msg.chat_id_, msg.id_, 1, text, 1, 'md')
end
if text:match("^مسح المكتومين عام") then
text = '☑┇ تم مسح المكتومين عام'
database:del('monsters:'..bot_id..'gmuted:')
send(msg.chat_id_, msg.id_, 1, text, 1, 'md')
end
if  msg.content_.text_:match("^قائمه العام$") then
local hash =   'monsters:'..bot_id..'gbanned:'
local list = database:smembers(hash)
text = "⛔┇قائمة الحظر العام  ،\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
for k,v in pairs(list) do
local user_info = database:hgetall('monsters:'..bot_id..'user:'..v)
if user_info and user_info.username then
local username = user_info.username
text = text.."<b>|"..k.."|</b>~⪼(@"..username..")\n"
else
text = text.."<b>|"..k.."|</b>~⪼(<code>"..v.."</code>)\n"
end
if #text > 7000 then
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
text = ""
end
end
if #list == 0 then
text = "✖┇لايوجد محظورين عام"
end
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end
if  msg.content_.text_:match("^المكتومين عام$") then
local hash =   'monsters:'..bot_id..'gmuted:'
local list = database:smembers(hash)
text = "⛔┇قائمة الكتم العام  ،\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
for k,v in pairs(list) do
local user_info = database:hgetall('monsters:'..bot_id..'user:'..v)
if user_info and user_info.username then
local username = user_info.username
text = text.."<b>|"..k.."|</b>~⪼(@"..username..")\n"
else
text = text.."<b>|"..k.."|</b>~⪼(<code>"..v.."</code>)\n"
end
if #text > 7000 then
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
text = ""
end
end
if #list == 0 then
text = "✖┇لايوجد مكتومين عام"
end
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end  
if text:match("^حظر عام$") and msg.reply_to_message_id_ then
function gban_by_reply(extra, result, success)
if result.sender_user_id_ == tonumber(sudo_add) then
send(msg.chat_id_, msg.id_, 1, "📮┇لا يمكنك حظر المطور الاساسي \n", 1, 'md')
return false 
end
local hash =  'monsters:'..bot_id..'gbanned:'
database:sadd(hash, result.sender_user_id_)
chat_kick(result.chat_id_, result.sender_user_id_)
tsX000("prore",msg,"🚫┇تم حظره من مجموعات البوت")
end
getmessage(msg.chat_id_, msg.reply_to_message_id_,gban_by_reply)
return false
end

if text:match("^حظر عام @(.*)$")  then
local apbll = {string.match(text, "^(حظر عام) @(.*)$")}
function gban_by_username(extra, result, success)
if result.id_ then
if result.id_ == tonumber(sudo_add) then
send(msg.chat_id_, msg.id_, 1, "📮┇لا يمكنك حظر المطور الاساسي \n", 1, 'md')
return false 
end
local hash =  'monsters:'..bot_id..'gbanned:'
texts = '👤┇العضو ~⪼ ['..result.title_..'](t.me/'..(apbll[2] or 'mons_bot')..')\n🚫┇تم حظره من المجموعات البوت'
database:sadd(hash, result.id_)
else
texts = '✖┇خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apbll[2],gban_by_username)
return false
end

if text:match("^حظر عام (%d+)$") then
local apbll = {string.match(text, "^(حظر عام) (%d+)$")}
if apbll[2] == tonumber(sudo_add) then
send(msg.chat_id_, msg.id_, 1, "📮┇لا يمكنك حظر المطور الاساسي \n", 1, 'md')
return false 
end
local hash =  'monsters:'..bot_id..'gbanned:'
database:sadd(hash, apbll[2])
tsX000(apbll[2],msg,"🚫┇تم حظره من المجموعات البوت")
return false
end
if text:match("^الغاء العام$") and msg.reply_to_message_id_ then
function ungban_by_reply(extra, result, success)
local hash =  'monsters:'..bot_id..'gbanned:'
tsX000("prore",msg,"🚫┇تم الغاء حظره من المجموعات البوت")
database:srem(hash, result.sender_user_id_)
end
getmessage(msg.chat_id_, msg.reply_to_message_id_,ungban_by_reply)
return false
end

if text:match("^الغاء العام @(.*)$") then
local apid = {string.match(text, "^(الغاء العام) @(.*)$")}
function ungban_by_username(extra, result, success)
local hash =  'monsters:'..bot_id..'gbanned:'
if result.id_ then
texts = '👤┇العضو ~⪼ ['..result.title_..'](t.me/'..(apid[2] or 'mons_bot')..')\n��┇تم الغاء حظره من المجموعات البوت'
database:srem(hash, result.id_)
else
texts = '✖┇خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apid[2],ungban_by_username)
return false
end

if text:match("^الغاء العام (%d+)$") then
local apbll = {string.match(text, "^(الغاء العام) (%d+)$")}
local hash =  'monsters:'..bot_id..'gbanned:'
database:srem(hash, apbll[2])
tsX000(apbll[2],msg,"🚫┇تم الغاء حظره من مجموعات البوت")
return false
end

if text:match("^كتم عام$") and msg.reply_to_message_id_ then
function gmute_by_reply(extra, result, success)
if result.sender_user_id_ == tonumber(sudo_add) then
send(msg.chat_id_, msg.id_, 1, "📮┇لا يمكنك كتم المطور الاساسي \n", 1, 'md')
return false 
end
local hash =  'monsters:'..bot_id..'gmuted:'
database:sadd(hash, result.sender_user_id_)
tsX000("prore",msg,"🚫┇تم كتمه من المجموعات البوت")
end
getmessage(msg.chat_id_, msg.reply_to_message_id_,gmute_by_reply)
return false
end

if text:match("^كتم عام @(.*)$") then
local apbll = {string.match(text, "^(كتم عام) @(.*)$")}
function gmute_by_username(extra, result, success)
if result.id_ then
if result.id_ == tonumber(sudo_add) then
send(msg.chat_id_, msg.id_, 1, "📮┇لا يمكنك كتم المطور الاساسي \n", 1, 'md')
return false 
end
local hash =  'monsters:'..bot_id..'gmuted:'
texts = '👤┇العضو ~⪼ ['..result.title_..'](t.me/'..(apbll[2] or 'mons_bot')..')\n🚫┇تم كتمه من المجموعات البوت'
database:sadd(hash, result.id_)
else
texts = '✖┇خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apbll[2],gmute_by_username)
return false
end

if text:match("^كتم عام (%d+)$") then
local apbll = {string.match(text, "^(كتم عام) (%d+)$")}
if apbll[2] == tonumber(sudo_add) then
send(msg.chat_id_, msg.id_, 1, "📮┇لا يمكنك كتم المطور الاساسي \n", 1, 'md')
return false 
end
local hash =  'monsters:'..bot_id..'gmuted:'
database:sadd(hash, apbll[2])
tsX000(apbll[2],msg,"🚫┇تم كتمه من المجموعات البوت")
return false
end
if text:match("^الغاء كتم العام$") and msg.reply_to_message_id_ then
function ungmute_by_reply(extra, result, success)
local hash =  'monsters:'..bot_id..'gmuted:'
tsX000("prore",msg,"🚫┇تم الغاء كتمه من المجموعات البوت")
database:srem(hash, result.sender_user_id_)
end
getmessage(msg.chat_id_, msg.reply_to_message_id_,ungmute_by_reply)
return false
end

if text:match("^الغاء كتم العام @(.*)$") then
local apid = {string.match(text, "^(الغاء كتم العام) @(.*)$")}
function ungmute_by_username(extra, result, success)
local hash =  'monsters:'..bot_id..'gmuted:'
if result.id_ then
texts = '👤┇العضو ~⪼ ['..result.title_..'](t.me/'..(apid[2] or 'mons_bot')..')\n🚫┇تم الغاء كتمه من المجموعات البوت'
database:srem(hash, result.id_)
else
texts = '✖┇خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apid[2],ungmute_by_username)
return false
end

if text:match("^الغاء كتم العام (%d+)$") then
local apbll = {string.match(text, "^(الغاء كتم العام) (%d+)$")}
local hash =  'monsters:'..bot_id..'gmuted:'
database:srem(hash, apbll[2])
tsX000(apbll[2],msg,"🚫┇تم الغاء كتمه من المجموعات البوت")
return false
end


if text:match("^اضف مطور$") and msg.reply_to_message_id_ then
local url , res = https.request('https://teamstorm.tk/joinch/?id='..msg.sender_user_id_..'')
data = JSON.decode(url)
if data.Ch_member.monsters ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🇮🇶 •\n• اذا اردت استخدام بوتنا 😎 •\n• عليك الاشتراك في القناة 🔽 •\n• @mons_bot ⚜️\n', 1, 'html')     
return false end

function promote_by_reply(extra, result, success)
if redis:sismember('monsters:'..bot_id..'dev', result.sender_user_id_) then
tsX000("prore",msg,'🔖┇بالفعل تم رفعة مطور في البوت')
else
redis:set('monsters:'..bot_id..'sudoo'..result.sender_user_id_..'', 'yes')
redis:sadd('monsters:'..bot_id..'dev', result.sender_user_id_)
tsX000("prore",msg,'🔖┇تم رفعة مطور في البوت')
end
end
getmessage(msg.chat_id_, msg.reply_to_message_id_,promote_by_reply)
return false end

if text:match("^اضف مطور @(.*)$") then
local url , res = https.request('https://teamstorm.tk/joinch/?id='..msg.sender_user_id_..'')
data = JSON.decode(url)
if data.Ch_member.monsters ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🇮🇶 •\n• اذا اردت استخدام بوتنا 😎 •\n• عليك الاشتراك في القناة 🔽 •\n• @mons_bot ⚜️\n', 1, 'html')   
return false end

local apmd = {string.match(text, "^(اضف مطور) @(.*)$")}
local url , res = https.request('https://teamstorm.tk/joinch/?id='..msg.sender_user_id_..'')
data = JSON.decode(url)
if data.Ch_member.monsters ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🇮🇶 •\n• اذا اردت استخدام بوتنا 😎 •\n• عليك الاشتراك في القناة 🔽 •\n• @mons_bot ⚜️\n', 1, 'html')   
return false end

function promote_by_username(extra, result, success)
if result.id_ then
redis:set('monsters:'..bot_id..'sudoo'..result.id_..'', 'yes')
redis:sadd('monsters:'..bot_id..'dev', result.id_)
texts = '👤┇العضو ~⪼ ['..result.title_..'](t.me/'..(apmd[2] or 'mons_bot')..')\n\n🔖┇تم رفعة مطور في البوت'
else
texts = '✖┇خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apmd[2],promote_by_username)
return false end

if text:match("^اضف مطور (%d+)$") then
local url , res = https.request('https://teamstorm.tk/joinch/?id='..msg.sender_user_id_..'')
data = JSON.decode(url)
if data.Ch_member.monsters ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🇮🇶 •\n• اذا اردت استخدام بوتنا 😎 •\n• عليك الاشتراك في القناة 🔽 •\n• @mons_bot ⚜️\n', 1, 'html')   
return false end

local apmd = {string.match(text, "^(اضف مطور) (%d+)$")}
redis:set('monsters:'..bot_id..'sudoo'..apmd[2]..'', 'yes')
redis:sadd('monsters:'..bot_id..'dev', apmd[2])
tsX000(apmd[2],msg,'🔖┇تم رفعة مطور في البوت')
return false end

if text:match("^حذف مطور$") and msg.reply_to_message_id_ then
local url , res = https.request('https://teamstorm.tk/joinch/?id='..msg.sender_user_id_..'')
data = JSON.decode(url)
if data.Ch_member.monsters ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🇮🇶 •\n• اذا اردت استخدام بوتنا 😎 •\n• عليك الاشتراك في القناة 🔽 •\n• @mons_bot ⚜️\n', 1, 'html')   
return false end
function demote_by_reply(extra, result, success)
if not redis:sismember('monsters:'..bot_id..'dev', result.sender_user_id_) then
tsX000("prore",msg,'بالفعل تم تنزيلة من مطورين البوت')
else
redis:del('monsters:'..bot_id..'sudoo'..result.sender_user_id_..'', 'no')
redis:srem('monsters:'..bot_id..'dev', result.sender_user_id_)
tsX000("prore",msg,'تم تنزيلة من مطورين البوت')
end
end
getmessage(msg.chat_id_, msg.reply_to_message_id_,demote_by_reply)
return false 
end

if text:match("^حذف مطور @(.*)$")  then
local url , res = https.request('https://teamstorm.tk/joinch/?id='..msg.sender_user_id_..'')
data = JSON.decode(url)
if data.Ch_member.monsters ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🇮🇶 •\n• اذا اردت استخدام بوتنا 😎 •\n• عليك الاشتراك في القناة 🔽 •\n• @mons_bot ⚜️\n', 1, 'html')   
return false end
local apmd = {string.match(text, "^(حذف مطور) @(.*)$")}
function demote_by_username(extra, result, success)
if result.id_ then
redis:del('monsters:'..bot_id..'sudoo'..result.id_..'', 'no')
redis:srem('monsters:'..bot_id..'dev', result.id_)
texts = '👤┇العضو ~⪼ ['..result.title_..'](t.me/'..(apmd[2] or 'mons_bot')..')\n┇ تم تنزيلة من مطورين البوت  👨🏼‍🔧'
else
texts = '✖┇خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apmd[2],demote_by_username)
end  
if text:match("^حذف مطور (%d+)$") then
local url , res = https.request('https://teamstorm.tk/joinch/?id='..msg.sender_user_id_..'')
data = JSON.decode(url)
if data.Ch_member.monsters ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🇮🇶 •\n• اذا اردت استخدام بوتنا 😎 •\n• عليك الاشتراك في القناة 🔽 •\n• @mons_bot ⚜️\n', 1, 'html')   
return false end
local apmd = {string.match(text, "^(حذف مطور) (%d+)$")}
redis:del('monsters:'..bot_id..'sudoo'..apmd[2]..'', 'no')
redis:srem('monsters:'..bot_id..'dev', apmd[2])
tsX000(apmd[2],msg,'☑┇ تم تنزيله من مطورين البوت')
return false 
end


if text == 'تحديث' then
dofile('monsters.lua')  
send(msg.chat_id_, msg.id_, 1, '☑┇تم التحديث', 1, 'md')
end
if text:match("^تحديث السورس$")  then
send(msg.chat_id_, msg.id_, 1, '☑┇تم التحديث', 1, 'md')
os.execute('rm -rf ./libs/utils.lua')
os.execute('rm -rf monsters.lua')
os.execute('cd libs;wget https://github.com/Ahmad1289/monsters/blob/master/libs/utils.lua')
os.execute('wget https://github.com/Ahmad1289/monsters/blob/master/monsters.lua')
dofile('monsters.lua')  
return false
end

end
end
end


function TSlocks(msg) -- Function locks && unlocks
local text = msg.content_.text_
if text then
--         »»               Start monsters lock                       ««              --
if (text == "قفل التاك") then
local tsX_o = database:get("lock_tag:monsters"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"🔐┇ بالفعل تم قفل التاك ")
else
tsX000("lock",msg,"🔐┇ تم قفل التاك ")
database:set("lock_tag:monsters"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل الرد") then
local tsX_o = database:get("lock_reple:monsters"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"🔐┇ بالفعل تم قفل الرد على الرسائل ")
else
tsX000("lock",msg,"🔐┇ تم قفل الرد على الرسائل ")
database:set("lock_reple:monsters"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل الشارحه") then
local tsX_o = database:get("lock_sarha:monsters"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"🔐┇ بالفعل تم قفل الشارحه ")
else
tsX000("lock",msg,"🔐┇ تم قفل الشارحه ")
database:set("lock_sarha:monsters"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل الكلايش") then
local tsX_o = database:get("lock_word:monsters"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"🔐┇ بالفعل تم قفل الكلايش ")
else
tsX000("lock",msg,"🔐┇ تم قفل الكلايش ")
database:set("lock_word:monsters"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل التعديل") and (is_creator(msg) or is_creatorbasic(msg)) then
local tsX_o = database:get("lock_edit:monsters"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"🔐┇ بالفعل تم قفل التعديل ")
else
tsX000("lock",msg,"🔐┇تم قفل التعديل ")
database:set("lock_edit:monsters"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل التكرار") then
local tsX_o = database:get("lock_lllll:monsters"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"🔐┇ بالفعل تم قفل التكرار ")
else
tsX000("lock",msg,"🔐┇ تم قفل التكرار ")
database:set("lock_lllll:monsters"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل المتحركه") then
local tsX_o = database:get("lock_gif:monsters"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"🔐┇ بالفعل تم قفل المتحركه ")
else
tsX000("lock",msg,"🔐┇ تم قفل المتحركه ")
database:set("lock_gif:monsters"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل الملفات") then
local tsX_o = database:get("lock_files:monsters"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"🔐┇ بالفعل تم قفل الملفات ")
else
tsX000("lock",msg,"🔐┇ تم قفل الملفات ")
database:set("lock_files:monsters"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل الماركدون") then
local tsX_o = database:get("lock_mark:monsters"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"🔐┇ بالفعل تم قفل الماركدون ")
else
tsX000("lock",msg,"🔐┇ تم قفل الماركدون ")
database:set("lock_mark:monsters"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل الصور") then
local tsX_o = database:get("lock_photo:monsters"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"🔐┇ بالفعل تم قفل الصور ")
else
tsX000("lock",msg,"🔐┇ تم قفل الصور ")
database:set("lock_photo:monsters"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل الملصقات") then
local tsX_o = database:get("lock_stecker:monsters"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"🔐┇ بالفعل تم قفل الملصقات ")
else
tsX000("lock",msg,"🔐┇ تم قفل الملصقات ")
database:set("lock_stecker:monsters"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل الفيديو") then
local tsX_o = database:get("lock_video:monsters"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"🔐┇ بالفعل تم قفل الفيديو ")
else
tsX000("lock",msg,"🔐┇ تم قفل الفيديو ")
database:set("lock_video:monsters"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل الانلاين") then
local tsX_o = database:get("lock_inline:monsters"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"🔐┇ بالفعل تم قفل الانلاين ")
else
tsX000("lock",msg,"🔐┇ تم قفل الانلاين ")
database:set("lock_inline:monsters"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل الدردشه") then
local tsX_o = database:get("lock_chat:monsters"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"🔐┇ بالفعل تم قفل الدردشه ")
else
tsX000("lock",msg,"🔐┇ تم قفل الدردشه ")
database:set("lock_chat:monsters"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل التوجيه") then
local tsX_o = database:get("lock_fwd:monsters"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"🔐┇ بالفعل تم قفل التوجيه ")
else
tsX000("lock",msg,"🔐┇ تم قفل التوجيه ")
database:set("lock_fwd:monsters"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل التثبيت") then
local tsX_o = database:get("lock_pin:monsters"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"🔐┇ بالفعل تم قفل التثبيت ")
else
tsX000("lock",msg,"🔐┇ تم قفل التثبيت ")
database:set("lock_pin:monsters"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل الاغاني") then
local tsX_o = database:get("lock_audeo:monsters"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"🔐┇ بالفعل تم قفل الاغاني ")
else
tsX000("lock",msg,"🔐┇ تم قفل الاغاني ")
database:set("lock_audeo:monsters"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل الصوت") then
local tsX_o = database:get("lock_voice:monsters"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"🔐┇ بالفعل تم قفل الصوت ")
else
tsX000("lock",msg,"🔐┇ تم قفل الصوت ")
database:set("lock_voice:monsters"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل الجهات") then
local tsX_o = database:get("lock_contact:monsters"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"🔐┇ بالفعل تم قفل الجهات ")
else
tsX000("lock",msg,"🔐┇ تم قفل الجهات ")
database:set("lock_contact:monsters"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل العربيه") then
local tsX_o = database:get("lock_ar:monsters"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"🔐┇ بالفعل تم قفل العربيه ")
else
tsX000("lock",msg,"🔐┇ تم قفل العربيه ")
database:set("lock_ar:monsters"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل الانكليزيه") then
local tsX_o = database:get("lock_en:monsters"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"🔐┇ بالفعل تم قفل الانكليزيه ")
else
tsX000("lock",msg,"🔐┇ تم قفل الانكليزيه ")
database:set("lock_en:monsters"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل الميديا") then
local tsX_o = database:get("lock_media:monsters"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"🔐┇ بالفعل تم قفل الميديا ")
else
tsX000("lock",msg,"🔐┇ تم قفل الميديا ")
database:set("lock_media:monsters"..msg.chat_id_..bot_id,"ok")
database:set("lock_audeo:monsters"..msg.chat_id_..bot_id,"ok")
database:set("lock_video:monsters"..msg.chat_id_..bot_id,"ok")
database:set("lock_photo:monsters"..msg.chat_id_..bot_id,"ok")
database:set("lock_stecker:monsters"..msg.chat_id_..bot_id,"ok")
database:set("lock_voice:monsters"..msg.chat_id_..bot_id,"ok")
database:set("lock_gif:monsters"..msg.chat_id_..bot_id,"ok")
database:set("lock_note:monsters"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل الروابط") then
local tsX_o = database:get("lock_link:monsters"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"🔐┇ بالفعل تم قفل الروابط ")
else
tsX000("lock",msg,"🔐┇ تم قفل الروابط ")
database:set("lock_link:monsters"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل المعرف") then
local tsX_o = database:get("lock_username:monsters"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"🔐┇ بالفعل تم قفل المعرف ")
else
tsX000("lock",msg,"🔐┇ تم قفل المعرف ")
database:set("lock_username:monsters"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل الاشعارات") then
local tsX_o = database:get("lock_new:monsters"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"🔐┇ بالفعل تم قفل الاشعارات ")
else
tsX000("lock",msg,"🔐┇ تم قفل الاشعارات ")
database:set("lock_new:monsters"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل البوتات بالطرد") then
local tsX_o = database:get("lock_botAndBan:monsters"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"🔐┇ بالفعل تم قفل البوتات بالطرد ")
else
tsX000("lock",msg,"🔐┇ تم قفل البوتات بالطرد ")
database:set("lock_botAndBan:monsters"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل البوتات") then
local tsX_o = database:get("lock_bot:monsters"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"🔐┇ بالفعل تم قفل البوتات ")
else
tsX000("lock",msg,"🔐┇ تم قفل البوتات ")
database:set("lock_bot:monsters"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل الدخول") then
local tsX_o = database:get("lock_join:monsters"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"🔐┇ بالفعل تم قفل الدخول للمجموعه ")
else
tsX000("lock",msg,"🔐┇ تم قفل الدخول للمجموعه ")
database:set("lock_join:monsters"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل بصمه الفيديو") then
local tsX_o = database:get("lock_note:monsters"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"🔐┇ بالفعل تم قفل بصمه فيديو ")
else
tsX000("lock",msg,"🔐┇ تم قفل بصمه فيديو ")
database:set("lock_note:monsters"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل الكل") then
database:set("lock_tag:monsters"..msg.chat_id_..bot_id,"ok")
database:set("lock_sarha:monsters"..msg.chat_id_..bot_id,"ok")
database:set("lock_word:monsters"..msg.chat_id_..bot_id,"ok")
database:set("lock_edit:monsters"..msg.chat_id_..bot_id,"ok")
database:set("lock_lllll:monsters"..msg.chat_id_..bot_id,"ok")
database:set("lock_gif:monsters"..msg.chat_id_..bot_id,"ok")
database:set("lock_files:monsters"..msg.chat_id_..bot_id,"ok")
database:set("lock_mark:monsters"..msg.chat_id_..bot_id,"ok")
database:set("lock_photo:monsters"..msg.chat_id_..bot_id,"ok")
database:set("lock_stecker:monsters"..msg.chat_id_..bot_id,"ok")
database:set("lock_video:monsters"..msg.chat_id_..bot_id,"ok")
database:set("lock_audeo:monsters"..msg.chat_id_..bot_id,"ok")
database:set("lock_voice:monsters"..msg.chat_id_..bot_id,"ok")
database:set("lock_contact:monsters"..msg.chat_id_..bot_id,"ok")
database:set("lock_fwd:monsters"..msg.chat_id_..bot_id,"ok")
database:set("lock_link:monsters"..msg.chat_id_..bot_id,"ok")
database:set("lock_username:monsters"..msg.chat_id_..bot_id,"ok")
database:set("lock_botAndBan:monsters"..msg.chat_id_..bot_id,"ok")
database:set("lock_new:monsters"..msg.chat_id_..bot_id,"ok")
tsX000("lock",msg,"🔐┇ تم قفل جميع الاوامر ")
end
--         »»                 End monsters lock                         ««              --
--         »»               Start monsters unlock                       ««              --
if (text == "فتح الكل") then
database:del("lock_tag:monsters"..msg.chat_id_..bot_id,"ok")
database:del("lock_sarha:monsters"..msg.chat_id_..bot_id,"ok")
database:del("lock_word:monsters"..msg.chat_id_..bot_id,"ok")
database:del("lock_edit:monsters"..msg.chat_id_..bot_id,"ok")
database:del("lock_lllll:monsters"..msg.chat_id_..bot_id,"ok")
database:del("lock_gif:monsters"..msg.chat_id_..bot_id,"ok")
database:del("lock_files:monsters"..msg.chat_id_..bot_id,"ok")
database:del("lock_mark:monsters"..msg.chat_id_..bot_id,"ok")
database:del("lock_photo:monsters"..msg.chat_id_..bot_id,"ok")
database:del("lock_stecker:monsters"..msg.chat_id_..bot_id,"ok")
database:del("lock_video:monsters"..msg.chat_id_..bot_id,"ok")
database:del("lock_audeo:monsters"..msg.chat_id_..bot_id,"ok")
database:del("lock_voice:monsters"..msg.chat_id_..bot_id,"ok")
database:del("lock_contact:monsters"..msg.chat_id_..bot_id,"ok")
database:del("lock_fwd:monsters"..msg.chat_id_..bot_id,"ok")
database:del("lock_link:monsters"..msg.chat_id_..bot_id,"ok")
database:del("lock_username:monsters"..msg.chat_id_..bot_id,"ok")
database:del("lock_botAndBan:monsters"..msg.chat_id_..bot_id,"ok")
database:del("lock_new:monsters"..msg.chat_id_..bot_id,"ok")
tsX000("lock",msg,"🔐┇ تم فتح جميع الاوامر ")
end
if (text == "فتح الاشعارات") then
local tsX_o = database:get("lock_new:monsters"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"⚠️┇بالفعل تم فتح الاشعارات ")
else
tsX000("lock",msg,"⚠️┇تم فتح الاشعارات ")
database:del("lock_new:monsters"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح التاك") then
local tsX_o = database:get("lock_tag:monsters"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"⚠️┇بالفعل تم فتح التاك ")
else
tsX000("lock",msg,"⚠️┇تم فتح التاك ")
database:del("lock_tag:monsters"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح الرد") then
local tsX_o = database:get("lock_reple:monsters"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"⚠️┇بالفعل تم فتح الرد على الرسائل ")
else
tsX000("lock",msg,"⚠️┇تم فتح الرد على الرسائل ")
database:del("lock_reple:monsters"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح الكلايش") then
local tsX_o = database:get("lock_word:monsters"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"⚠️┇بالفعل تم فتح الكلايش ")
else
tsX000("lock",msg,"⚠️┇تم فتح الكلايش ")
database:del("lock_word:monsters"..msg.chat_id_..bot_id)
end
end

if (text == "فتح الشارحه") then
local tsX_o = database:get("lock_sarha:monsters"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"⚠️┇بالفعل تم فتح الشارحه ")
else
tsX000("lock",msg,"⚠️┇تم فتح الشارحه ")
database:del("lock_sarha:monsters"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح التكرار") then
local tsX_o = database:get("lock_lllll:monsters"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"⚠️┇بالفعل تم فتح التكرار ")
else
tsX000("lock",msg,"⚠️┇تم فتح التكرار ")
database:del("lock_lllll:monsters"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح التعديل") and (is_creator(msg) or is_creatorbasic(msg)) then
local tsX_o = database:get("lock_edit:monsters"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"⚠️┇بالفعل تم فتح التعديل ")
else
tsX000("lock",msg,"⚠️┇تم فتح التعديل ")
database:del("lock_edit:monsters"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح المتحركه") then
local tsX_o = database:get("lock_gif:monsters"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"⚠️┇بالفعل تم فتح المتحركه ")
else
tsX000("lock",msg,"⚠️┇تم فتح المتحركه ")
database:del("lock_gif:monsters"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح الملفات") then
local tsX_o = database:get("lock_files:monsters"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"⚠️┇بالفعل تم فتح الملفات ")
else
tsX000("lock",msg,"⚠️┇تم فتح الملفات ")
database:del("lock_files:monsters"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح الماركدون") then
local tsX_o = database:get("lock_mark:monsters"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"⚠️┇بالفعل تم فتح الماركدون ")
else
tsX000("lock",msg,"⚠️┇تم فتح الماركدون ")
database:del("lock_mark:monsters"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح الصور") then
local tsX_o = database:get("lock_photo:monsters"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"⚠️┇بالفعل تم فتح الصور ")
else
tsX000("lock",msg,"⚠️┇تم فتح الصور ")
database:del("lock_photo:monsters"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح الملصقات") then
local tsX_o = database:get("lock_stecker:monsters"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"⚠️┇بالفعل تم فتح الملصقات ")
else
tsX000("lock",msg,"⚠️┇تم فتح الملصقات ")
database:del("lock_stecker:monsters"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح الفيديو") then
local tsX_o = database:get("lock_video:monsters"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"⚠️┇بالفعل تم فتح الفيديو ")
else
tsX000("lock",msg,"⚠️┇تم فتح الفيديو ")
database:del("lock_video:monsters"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح الانلاين") then
local tsX_o = database:get("lock_inline:monsters"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"⚠️┇بالفعل تم فتح الانلاين ")
else
tsX000("lock",msg,"⚠️┇تم فتح الانلاين ")
database:del("lock_inline:monsters"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح الدردشه") then
local tsX_o = database:get("lock_chat:monsters"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"⚠️┇بالفعل تم فتح الدردشه ")
else
tsX000("lock",msg,"⚠️┇تم فتح الدردشه ")
database:del("lock_chat:monsters"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح التوجيه") then
local tsX_o = database:get("lock_fwd:monsters"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"⚠️┇بالفعل تم فتح التوجيه ")
else
tsX000("lock",msg,"⚠️┇تم فتح التوجيه ")
database:del("lock_fwd:monsters"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح التثبيت") then
local tsX_o = database:get("lock_pin:monsters"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"⚠️┇بالفعل تم فتح التثبيت ")
else
tsX000("lock",msg,"⚠️┇تم فتح التثبيت ")
database:del("lock_pin:monsters"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح الاغاني") then
local tsX_o = database:get("lock_audeo:monsters"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"⚠️┇بالفعل تم فتح الاغاني ")
else
tsX000("lock",msg,"⚠️┇تم فتح الاغاني ")
database:del("lock_audeo:monsters"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح الصوت") then
local tsX_o = database:get("lock_voice:monsters"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"⚠️┇بالفعل تم فتح الصوت ")
else
tsX000("lock",msg,"⚠️┇تم فتح الصوت ")
database:del("lock_voice:monsters"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح البوتات بالطرد") then
local tsX_o = database:get("lock_botAndBan:monsters"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"⚠️┇بالفعل تم فتح البوتات بالطرد ")
else
tsX000("lock",msg,"⚠️┇تم فتح البوتات بالطرد ")
database:del("lock_botAndBan:monsters"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح الجهات") then
local tsX_o = database:get("lock_contact:monsters"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"⚠️┇بالفعل تم فتح الجهات ")
else
tsX000("lock",msg,"⚠️┇تم فتح الجهات ")
database:del("lock_contact:monsters"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح العربيه") then
local tsX_o = database:get("lock_ar:monsters"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"⚠️┇بالفعل تم فتح العربيه ")
else
tsX000("lock",msg,"⚠️┇تم فتح العربيه ")
database:del("lock_ar:monsters"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح الانكليزيه") then
local tsX_o = database:get("lock_en:monsters"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"⚠️┇بالفعل تم فتح الانكليزيه ")
else
tsX000("lock",msg,"⚠️┇تم فتح الانكليزيه ")
database:del("lock_en:monsters"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح الميديا") then
local tsX_o = database:get("lock_media:monsters"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"⚠️┇بالفعل تم فتح الميديا ")
else
tsX000("lock",msg,"⚠️┇تم فتح الميديا ")
database:del("lock_media:monsters"..msg.chat_id_..bot_id,"ok")
database:del("lock_audeo:monsters"..msg.chat_id_..bot_id,"ok")
database:del("lock_video:monsters"..msg.chat_id_..bot_id,"ok")
database:del("lock_photo:monsters"..msg.chat_id_..bot_id,"ok")
database:del("lock_stecker:monsters"..msg.chat_id_..bot_id,"ok")
database:del("lock_voice:monsters"..msg.chat_id_..bot_id,"ok")
database:del("lock_gif:monsters"..msg.chat_id_..bot_id,"ok")
database:del("lock_note:monsters"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح المعرف") then
local tsX_o = database:get("lock_username:monsters"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"⚠️┇بالفعل تم فتح المعرف ")
else
tsX000("lock",msg,"⚠️┇تم فتح المعرف ")
database:del("lock_username:monsters"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح بصمه الفيديو") then
local tsX_o = database:get("lock_note:monsters"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"⚠️┇بالفعل تم فتح بصمه فيديو ")
else
tsX000("lock",msg,"⚠️┇تم فتح بصمه فيديو ")
database:del("lock_note:monsters"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح الروابط") then
local tsX_o = database:get("lock_link:monsters"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"⚠️┇بالفعل تم فتح الروابط ")
else
tsX000("lock",msg,"⚠️┇تم فتح الروابط ")
database:del("lock_link:monsters"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح الدخول") then
local tsX_o = database:get("lock_join:monsters"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"⚠️┇بالفعل تم فتح الدخول للمجموعه ")
else
tsX000("lock",msg,"⚠️┇ تم فتح الدخول للمجموعه ")
database:del("lock_join:monsters"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح البوتات") then
local tsX_o = database:get("lock_bot:monsters"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"⚠️┇بالفعل تم فتح البوتات ")
else
tsX000("lock",msg,"⚠️┇تم فتح البوتات ")
database:del("lock_bot:monsters"..msg.chat_id_..bot_id,"ok")
end
end  --         »»               End monsters unlock                       ««              --
end 
end 
--         »»               Start Function Check msg                       ««              --
function TSCheckmsg(msg) 
local text = msg.content_.text_

if text and not is_creatorbasic(msg) then 
if database:get("lock_word:monsters"..msg.chat_id_..bot_id) then 
local monsters_wr = (database:get("monsters:not:word:"..bot_id..msg.chat_id_) or 100)
if #text >= tonumber(monsters_wr) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
end
end
if text and (text:match("[Hh][Tt][Tt][Pp][Ss]://") or text:match("[Jj][Oo][Ii][Nn][Cc][Hh][Aa][Tt]")  or text:match("[Hh][Tt][Tt][Pp]://") or text:match(".[Ii][Rr]") or text:match(".[Cc][Oo][mm]") or text:match(".[Oo][Rr][Gg]") or text:match(".[Ii][Nn][Ff][Oo]") or text:match("[Ww][Ww][Ww].") or text:match(".[Tt][Kk]")) then
if database:get("lock_link:monsters"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
end
if msg.content_.caption_ then
text = msg.content_.caption_
if text and (text:match("[Hh][Tt][Tt][Pp][Ss]://") or text:match("[Jj][Oo][Ii][Nn][Cc][Hh][Aa][Tt]") or text:match("[Hh][Tt][Tt][Pp]://") or text:match(".[Ii][Rr]") or text:match(".[Cc][Oo][mm]") or text:match(".[Oo][Rr][Gg]") or text:match(".[Ii][Nn][Ff][Oo]") or text:match("[Ww][Ww][Ww].") or text:match(".[Tt][Kk]")) then
if database:get("lock_link:monsters"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
end
end
if msg.content_.caption_ then
text = msg.content_.caption_
if text and text:match("(.*)(@)(.*)")  then
if database:get("lock_username:monsters"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
end
end
if text and text:match("(.*)(@)(.*)")  then
if database:get("lock_username:monsters"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
end
if database:get("lock_chat:monsters"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
if text and text:match("(.*)(/)(.*)")  then
if database:get("lock_sarha:monsters"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
end
if text and text:match("(.*)(#)(.*)")  then
if database:get("lock_tag:monsters"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
end
if msg.reply_to_message_id_ ~= 0 then
print('&&&&')
if database:get("lock_reple:monsters"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
end
if  msg.content_.ID == "messageChatJoinByLink" then
if database:get("lock_join:monsters"..msg.chat_id_..bot_id) then
changeChatmemberStatus(msg.chat_id_, msg.sender_user_id_, "Kicked")
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
end
if msg.content_.ID == "messageChatAddmembers"  then
if database:get("lock_join:monsters"..msg.chat_id_..bot_id) then
changeChatmemberStatus(msg.chat_id_, msg.content_.members_[0].id_, "Kicked")
return "stop"
end
end
if msg.content_.ID == "messageChatAddmembers" then
if msg.content_.members_[0].type_.ID == 'UserTypeBot' then
if database:get("lock_bot:monsters"..msg.chat_id_..bot_id) then
changeChatmemberStatus(msg.chat_id_, msg.content_.members_[0].id_, "Kicked")
end
if database:get("lock_botAndBan:monsters"..msg.chat_id_..bot_id) then
local function cb(extra,result,success)
local bots = result.members_
for i=0 , #bots do
if tonumber(bots[i].user_id_) ~= tonumber(bot_id) then chat_kick(msg.chat_id_,bots[i].user_id_)
end
changeChatmemberStatus(msg.chat_id_, msg.sender_user_id_, "Kicked")
end
end
bot.channel_get_bots(msg.chat_id_,cb)
end
end
end
if text and text:match("(.*)(#)(.*)")  then
if database:get("lock_sarha:monsters"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
end
if msg.forward_info_ then
if msg.forward_info_.ID == "messageForwardedFromUser" or msg.forward_info_.ID == "messageForwardedPost" then
if database:get("lock_fwd:monsters"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
end
end
if msg.content_.ID == "messageSticker" or msg.content_.ID == "messageUnsupported" then
if database:get("lock_stecker:monsters"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
end
if msg.content_.ID == "messageChatJoinByLink" or msg.content_.ID == "messageChatAddmembers" then
if database:get("lock_new:monsters"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
end
if msg.content_.ID == "messageChatAddmembers" then
database:incr('monsters:'..bot_id..'user:add'..msg.chat_id_..':'..msg.sender_user_id_)
end
if msg.content_.ID == "messageUnsupported" then
if database:get("lock_note:monsters"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
end
if msg.content_.ID == "messagePhoto" then
if database:get("lock_photo:monsters"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
end
if msg.content_.ID == "messageAudio" then
if database:get("lock_audeo:monsters"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
end
if msg.content_.ID == "messageVoice" then
if database:get("lock_voice:monsters"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
end
if msg.content_.ID == "messageVideo" then
if database:get("lock_video:monsters"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
end
if msg.content_.ID == "messageAnimation" then
if database:get("lock_gif:monsters"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
end
if msg.content_.ID == "messageContact" then
if database:get("lock_contact:monsters"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
end
if text and text:match("[\216-\219][\128-\191]") then
if database:get("lock_ar:monsters"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
end
if msg.content_.ID == "messageDocument" then
if database:get("lock_files:monsters"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
end
if text and text:match("[ASDFGHJKLQWERTYUIOPZXCVBNmasdfghjklqwertyuiopzxcvbnm]") then
if database:get("lock_en:monsters"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
end

if msg.content_.entities_ then
if msg.content_.entities_[0] then
if msg.content_.entities_[0] and msg.content_.entities_[0].ID == "messageEntityUrl" or msg.content_.entities_[0].ID == "messageEntityTextUrl" then
if database:get("lock_mark:monsters"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
end
end
end

if database:get("lock_lllll:monsters"..msg.chat_id_..bot_id) then
local hash = 'flood:max:'..bot_id..msg.chat_id_
if not database:get(hash) then
floodmax = 10
else
floodmax = tonumber(database:get(hash))
end
local hash = 'monsters:'..bot_id..'flood:time:'..msg.chat_id_
if not database:get(hash) then
floodTime = 1
else
floodTime = tonumber(database:get(hash))
end
if not is_vip(msg) and not is_creatorbasic(msg) then
if bot_id then
if not is_vip(msg) and not is_creatorbasic(msg) then
local hash = 'flood:'..msg.sender_user_id_..':'..msg.chat_id_..':msg-num'
local msgs = tonumber(database:get(hash) or 0)
if msgs > (floodmax - 1) then
local user = msg.sender_user_id_
local chat = msg.chat_id_
local channel = msg.chat_id_
local user_id = msg.sender_user_id_
local banned = is_banned(user_id, msg.chat_id_)
if banned then
else
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
user_id = msg.sender_user_id_
o = database:get("monsters:spam:lock:"..os.date("%x")..bot_id..msg.chat_id_)
if (o and (tonumber(o) >= 5)) then
database:set("lock_media:monsters"..msg.chat_id_..bot_id,"ok")
database:set("lock_audeo:monsters"..msg.chat_id_..bot_id,"ok")
database:set("lock_video:monsters"..msg.chat_id_..bot_id,"ok")
database:set("lock_photo:monsters"..msg.chat_id_..bot_id,"ok")
database:set("lock_stecker:monsters"..msg.chat_id_..bot_id,"ok")
database:set("lock_voice:monsters"..msg.chat_id_..bot_id,"ok")
database:set("lock_gif:monsters"..msg.chat_id_..bot_id,"ok")
database:set("lock_note:monsters"..msg.chat_id_..bot_id,"ok")
database:set("lock_word:monsters"..msg.chat_id_..bot_id,"ok")
database:set("lock_mark:monsters"..msg.chat_id_..bot_id,"ok")
database:set("lock_link:monsters"..msg.chat_id_..bot_id,"ok")
database:set("lock_new:monsters"..msg.chat_id_..bot_id,"ok")
database:set('monsters:'..bot_id..'get:photo'..msg.chat_id_,true)
send(msg.chat_id_, 0, 1, '⚠️┇تم كشف عمليه تخريب في المجموعة \n‼️┇وتم قفل الميديا وسيتم طرد جميع الاشخاص الذين يقومون بعمل تكرار', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '🎫┇الايدي ~⪼*('..msg.sender_user_id_..')* \n❕┇قمت بعمل تكرار للرسائل المحدده\n☑┇وتم كتمك في المجموعه\n', 1, 'md')
end 
if (o and (tonumber(o) > 5)) then
chat_kick(msg.chat_id_, msg.sender_user_id_)
local msgm = msg.id_
for i=1,tonumber(num) do
delete_msg(msg.chat_id_, {[0] = msgm})
msgm = msgm - 1048576
end
end
database:incr("monsters:spam:lock:"..os.date("%x")..bot_id..msg.chat_id_)
database:sadd('monsters:'..bot_id..'muted:'..msg.chat_id_, msg.sender_user_id_)
end
end
database:setex(hash, floodTime, msgs+1)
end
end
end
end
if is_banned(msg.sender_user_id_, msg.chat_id_) then
chat_kick(msg.chat_id_, msg.sender_user_id_)
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
if is_muted(msg.sender_user_id_, msg.chat_id_) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
end -- end fun
--         »»               Start Function Sudo                       ««              --
function TSsudo(msg)
text = msg.content_.text_
if msg.content_.text_ then
if text == 'مغادره' then
local lave = database:get('monsters:'..bot_id..'leave:groups')
print(lave)
if not database:get('monsters:'..bot_id..'leave:groups') then
chat_leave(msg.chat_id_, bot_id)
send(msg.chat_id_, msg.id_, 1, "☑┇تم مغادره المجموعه", 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, "☑┇عذرآ المغادره معطله من قبل المطور الاساسي \n", 1, 'md')
end
end
if (text and text == 'تفعيل المغادره') and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
send(msg.chat_id_, msg.id_, 1, '☑┇تم تفعيل مغادره البوت', 1, 'md')
database:del('monsters:'..bot_id..'leave:groups')
end

if (text and text == 'تعطيل المغادره') and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
send(msg.chat_id_, msg.id_, 1, '☑┇تم تعطيل مغادره البوت', 1, 'md')
database:set('monsters:'..bot_id..'leave:groups',true)
end

if text:match("^مسح الاساسين$") and is_sudo(msg) then
text = '☑┇تم مسح قائمه المنشئين الاساسين'
database:del('monsters:'..bot_id..'creatorbasic:'..msg.chat_id_)
send(msg.chat_id_, msg.id_, 1, text, 1, 'md')
end
if text:match("^رفع منشئ اساسي$") and msg.reply_to_message_id_ then
local url , res = https.request('https://teamstorm.tk/joinch/?id='..msg.sender_user_id_..'')
data = JSON.decode(url)
if data.Ch_member.monsters ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🇮🇶 •\n• اذا اردت استخدام بوتنا 😎 •\n• عليك الاشتراك في القناة 🔽 •\n• @mons_bot ⚜️\n', 1, 'html')   
return false end
function promote_by_reply(extra, result, success)
database:del('monsters:'..bot_id..'creatorbasic:'..msg.chat_id_)
database:sadd('monsters:'..bot_id..'creatorbasic:'..msg.chat_id_, result.sender_user_id_)
tsX000("prore",msg,'🔖┇تم رفعة منشئ اساسي  في البوت')
end
getmessage(msg.chat_id_, msg.reply_to_message_id_,promote_by_reply)
end

if text:match("^رفع منشئ اساسي @(.*)$") then
local url , res = https.request('https://teamstorm.tk/joinch/?id='..msg.sender_user_id_..'')
data = JSON.decode(url)
if data.Ch_member.monsters ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🇮🇶 •\n• اذا اردت استخدام بوتنا 😎 •\n• عليك الاشتراك في القناة 🔽 •\n• @mons_bot ⚜️\n', 1, 'html')      
return false end
local apmd = {string.match(text, "^(رفع منشئ اساسي) @(.*)$")}
function promote_by_username(extra, result, success)
if result.id_ then
database:del('monsters:'..bot_id..'creatorbasic:'..msg.chat_id_)
database:sadd('monsters:'..bot_id..'creatorbasic:'..msg.chat_id_, result.id_)
texts = '👤┇العضو ~⪼ ['..result.title_..'](t.me/'..(apmd[2] or 'mons_bot')..')\n┇ 🔖┇تم رفعة منشئ اساسي  في البوت  '
else
texts = '✖┇خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apmd[2],promote_by_username)
end
if text:match("^رفع منشئ اساسي (%d+)$") then
local url , res = https.request('https://teamstorm.tk/joinch/?id='..msg.sender_user_id_..'')
data = JSON.decode(url)
if data.Ch_member.monsters ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🇮🇶 •\n• اذا اردت استخدام بوتنا 😎 •\n• عليك الاشتراك في القناة 🔽 •\n• @mons_bot ⚜️\n', 1, 'html')    
return false end
local apmd = {string.match(text, "^(رفع منشئ اساسي) (%d+)$")}
database:del('monsters:'..bot_id..'creatorbasic:'..msg.chat_id_)
database:sadd('monsters:'..bot_id..'creatorbasic:'..msg.chat_id_, apmd[2])
tsX000(apmd[2],msg,"🔖┇تم رفعة منشئ اساسي  في البوت")
end
if text:match("^تنزيل منشئ اساسي$") and msg.reply_to_message_id_ then
local url , res = https.request('https://teamstorm.tk/joinch/?id='..msg.sender_user_id_..'')
data = JSON.decode(url)
if data.Ch_member.monsters ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🇮🇶 •\n• اذا اردت استخدام بوتنا 😎 •\n• عليك الاشتراك في القناة 🔽 •\n• @mons_bot ⚜️\n', 1, 'html')      
return false end
function promote_by_reply(extra, result, success)
database:del('monsters:'..bot_id..'creatorbasic:'..msg.chat_id_)
database:srem('monsters:'..bot_id..'creatorbasic:'..msg.chat_id_, result.sender_user_id_)
tsX000("prore",msg,'تم تنزيلة منشئ اساسي من البوت')
end
getmessage(msg.chat_id_, msg.reply_to_message_id_,promote_by_reply)
end
if text:match("^تنزيل منشئ اساسي @(.*)$") then
local url , res = https.request('https://teamstorm.tk/joinch/?id='..msg.sender_user_id_..'')
data = JSON.decode(url)
if data.Ch_member.monsters ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🇮🇶 •\n• اذا اردت استخدام بوتنا 😎 •\n• عليك الاشتراك في القناة 🔽 •\n• @mons_bot ⚜️\n', 1, 'html')      
return false end
local apmd = {string.match(text, "^(تنزيل منشئ اساسي) @(.*)$")}
function promote_by_username(extra, result, success)
if result.id_ then
database:del('monsters:'..bot_id..'creatorbasic:'..msg.chat_id_)
database:srem('monsters:'..bot_id..'creatorbasic:'..msg.chat_id_, result.id_)
texts = '👤┇العضو ~⪼ ['..result.title_..'](t.me/'..(apmd[2] or 'mons_bot')..')\n┇ تم تنزيلة منشئ اساسي من البوت  '
else
texts = '✖┇خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apmd[2],promote_by_username)
end
if text:match("^تنزيل منشئ اساسي (%d+)$") then
local url , res = https.request('https://teamstorm.tk/joinch/?id='..msg.sender_user_id_..'')
data = JSON.decode(url)
if data.Ch_member.monsters ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🇮🇶 •\n• اذا اردت استخدام بوتنا 😎 •\n• عليك الاشتراك في القناة 🔽 •\n• @mons_bot ⚜️\n', 1, 'html')    
return false end
local apmd = {string.match(text, "^(تنزيل منشئ اساسي) (%d+)$")}
database:del('monsters:'..bot_id..'creatorbasic:'..msg.chat_id_)
database:srem('monsters:'..bot_id..'creatorbasic:'..msg.chat_id_, apmd[2])
tsX000(apmd[2],msg,"تم تنزيلة منشئ اساسي من البوت")
end
if text == 'توجيه للكل' and tonumber(msg.reply_to_message_id_) > 0  and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then  
function fwwdmsg(taha,storm,sorc)  
local list = database:smembers('monsters:'..bot_id..'groups') 
for k,v in pairs(list) do  
tdcli_function ({
ID = "Forwardmessages",
chat_id_ = v,
from_chat_id_ = msg.chat_id_,
message_ids_ = {[0] = storm.id_},
disable_notification_ = 1,
from_background_ = 1},cb or dl_cb,cmd) 
end
local gps = database:scard('monsters:'..bot_id.."groups")  
local text = '🚸 ❯❯ تم ارسال توجيه الى *{ '..gps..' }* مجموعات'  
send(msg.chat_id_, msg.id_, 1, text, 1, 'md')  
end  
getmessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),fwwdmsg)  
end
if text == 'توجيه خاص' and tonumber(msg.reply_to_message_id_) > 0  and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then  
function fwwdmsg(taha,storm,sorc)  
local list = database:smembers('monsters:'..bot_id.."userss")
for k,v in pairs(list) do  
tdcli_function ({
ID = "Forwardmessages",
chat_id_ = v,
from_chat_id_ = msg.chat_id_,
message_ids_ = {[0] = storm.id_},
disable_notification_ = 1,
from_background_ = 1},cb or dl_cb,cmd) 
end
local gps = database:scard('monsters:'..bot_id.."userss")  
local text = '♻┇ تم ارسال توجيه الى *{ '..gps..' }* مشترك في الخاص'  
send(msg.chat_id_, msg.id_, 1, text, 1, 'md')  
end  
getmessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),fwwdmsg)  
end

if text and text == "اذاعه" then 
if (not database:get('monsters:'..bot_id..'bc:groups') or tonumber(sudo_add) == tonumber(msg.sender_user_id_)) then
send(msg.chat_id_, msg.id_, 1, '☑┇ ارسال الان نص او الميديا : (صوره - فديو - متحركه - ملف)', 1, 'md')
database:set("monsters:set_if_bc_new:"..bot_id..msg.sender_user_id_,"ok")
return "monsters"
else
send(msg.chat_id_, msg.id_, 1, '☑┇ الاذاعه معطله ', 1, 'md')
end
end




if text=="اذاعه خاص" and msg.reply_to_message_id_ == 0 then 
if (not database:get('monsters:'..bot_id..'bc:groups') or tonumber(sudo_add) == tonumber(msg.sender_user_id_)) then
database:setex('monsters:'..bot_id.."bc:in:pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
send(msg.chat_id_, msg.id_, 1, "☑┇ ارسال الان نص او الميديا : (صوره - فديو - متحركه )\n", 1, "md") 
else
send(msg.chat_id_, msg.id_, 1, '☑┇ الاذاعه معطله ', 1, 'md')
end
return false
end 


if text == "تنظيف المشتركين" and tonumber(sudo_add) == tonumber(msg.sender_user_id_) then
local pv = database:smembers('monsters:'..bot_id.."userss")
local sendok = 0
for i = 1, #pv do
tdcli_function({ID='GetChat',chat_id_ = pv[i]
},function(arg,dataq)
tdcli_function ({ ID = "SendChatAction",  
chat_id_ = pv[i], action_ = {  ID = "SendmessageTypingAction", progress_ = 100} 
},function(arg,data) 
if data.ID and data.ID == "Ok"  then
print('\27[30;33m»» THE USER IS SAVE mE ↓\n»» '..pv[i]..'\n\27[1;37m')
else
print('\27[30;31m»» THE USER IS BLOCK mE ↓\n»» '..pv[i]..'\n\27[1;37m')
database:srem('monsters:'..bot_id.."userss",pv[i])
sendok = sendok + 1
end
if #pv == i then 
if sendok == 0 then
send(msg.chat_id_, msg.id_, 1,'🔖┇ لا يوجد مشتركين وهميين في البوت \n', 1, 'md')   
else
local ok = #pv - sendok
send(msg.chat_id_, msg.id_, 1,'🔖┇ عدد المشتركين الان ↫ ( '..#pv..' )\n📬┇ تم ازالة ↫ ( '..sendok..' ) من المشتركين\n📌┇ الان عدد المشتركين الحقيقي ↫ ( '..ok..' ) مشترك \n', 1, 'md')   
end
end
end,nil)
end,nil)
end
return false
end

if text == "تنظيف الكروبات" and tonumber(sudo_add) == tonumber(msg.sender_user_id_) then
local group = database:smembers('monsters:'..bot_id..'groups') 
local w = 0
local q = 0
for i = 1, #group do
tdcli_function({ID='GetChat',chat_id_ = group[i]
},function(arg,data)
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatmemberStatusmember" then
print('\27[30;34m»» THE BOT IS NOT ADmIN ↓\n»» '..group[i]..'\n\27[1;37m')
database:srem("monsters:gog"..bot_id,group[i]) 
database:srem('monsters:'..bot_id..'pro:groups',group[i]) 
database:srem( 'monsters:'..bot_id.."groups",group[i]) 
changeChatmemberStatus(group[i], bot_id, "Left")
w = w + 1
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatmemberStatusLeft" then
database:srem("monsters:gog"..bot_id,group[i]) 
database:srem('monsters:'..bot_id..'pro:groups',group[i]) 
database:srem( 'monsters:'..bot_id.."groups",group[i]) 
q = q + 1
print('\27[30;35m»» THE BOT IS LEFT GROUP ↓\n»» '..group[i]..'\n\27[1;37m')
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatmemberStatusKicked" then
database:srem("monsters:gog"..bot_id,group[i]) 
database:srem('monsters:'..bot_id..'pro:groups',group[i]) 
database:srem( 'monsters:'..bot_id.."groups",group[i]) 
q = q + 1
print('\27[30;36m»» THE BOT IS KICKED GROUP ↓\n»» '..group[i]..'\n\27[1;37m')
end
if data and data.code_ and data.code_ == 400 then
database:srem("monsters:gog"..bot_id,group[i]) 
database:srem('monsters:'..bot_id..'pro:groups',group[i]) 
database:srem( 'monsters:'..bot_id.."groups",group[i]) 
w = w + 1
end
if #group == i then 
if (w + q) == 0 then
send(msg.chat_id_, msg.id_, 1,'🔖┇ لا يوجد مجموعات وهميه في البوت\n', 1, 'md')   
else
local taha = (w + q)
local sendok = #group - taha
if q == 0 then
taha = ''
else
taha = '\n*🚸┇ تم ازالة ↫ ❪ '..q..' ❫ مجموعات من البوت*'
end
if w == 0 then
storm = ''
else
storm = '\n*📬┇ تم ازالة ↫ ❪'..w..'❫ مجموعه لان البوت عضو*'
end
send(msg.chat_id_, msg.id_, 1,'*🔖┇ عدد المجموعات الان ↫ ( '..#group..' )*'..storm..''..taha..'\n*📌┇ الان عدد المجموعات الحقيقي ↫ ( '..sendok..' ) مجموعات*\n', 1, 'md')   
end
end
end,nil)
end
return false
end
if (text:match("^عدد الكروبات$") or text:match("^الاحصائيات$")) and is_vip(msg) then
local gps = database:scard('monsters:'..bot_id.."groups") or 0
local user = database:scard('monsters:'..bot_id.."userss") or 0
local gps2 = database:scard("monsters:gog"..bot_id) or 0
local gps9 = database:scard("monsters:good"..bot_id..os.date("%d")) or 0
local gps3 = database:scard('monsters:'..bot_id..'pro:groups') or 0
send(msg.chat_id_, msg.id_, 1, '• المجموعات :\n📊┇عدد الكروبات الكلي ~⪼  *{'..gps..'}*\n🔋┇عدد الكروبات المفعله ~⪼  *{'..gps2..'}*\n🔌┇عدد الكروبات الغير مفعله ~⪼  *{'..(gps - gps2)..'}*\n💡┇عدد الكروبات المدفوعه ~⪼  *{'..(gps3)..'}*\n⏱┇عدد الكروبات المتفاعله اليوم ~⪼  *{'..(gps9)..'}*\n\n• الاعضاء :\n👥┇ عدد اعضاء الخاص : {`'..user..'`}', 1, 'md')
end
if tonumber(sudo_add) == tonumber(msg.sender_user_id_) then
if text:match("^تفعيل الكل$") then
local url , res = https.request('https://teamstorm.tk/joinch/?id='..msg.sender_user_id_..'')
data = JSON.decode(url)
if data.Ch_member.monsters ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🇮🇶 •\n• اذا اردت استخدام بوتنا 😎 •\n• عليك الاشتراك في القناة 🔽 •\n• @mons_bot ⚜️\n', 1, 'html')   
return false end

local gps = database:smembers('monsters:'..bot_id.."groups") or 0
local gps2 = database:smembers("monsters:gog"..bot_id) or 0
for i=1,#gps do
database:sadd("monsters:gog"..bot_id, gps[i])
database:set('monsters:'..bot_id.."enable:"..gps[i],true)
database:set( 'monsters:'..bot_id.."charge:"..gps[i],true)
end
send(msg.chat_id_, msg.id_, 1, '🔋┇تم تفعيل ~⪼  *{'..(#gps - #gps2)..'}*', 1, 'md')
end
if text:match("^تعطيل الكل$") then
local gps = database:smembers('monsters:'..bot_id.."groups") or 0
local gps2 = database:smembers("monsters:gog"..bot_id) or 0
for i=1,#gps do
database:del("monsters:gog"..bot_id)
database:del('monsters:'..bot_id.."enable:"..gps[i])
database:del( 'monsters:'..bot_id.."charge:"..gps[i])
end
send(msg.chat_id_, msg.id_, 1, '🔌┇تم تعطيل ~⪼  *{'..#gps..'}*', 1, 'md')
end
if text:match("^مغادره الكل$") then
local gps = database:smembers('monsters:'..bot_id.."groups") or 0
local gps2 = database:smembers("monsters:gog"..bot_id) or 0
send(msg.chat_id_, msg.id_, 1, '💣┇تم مغادره ~⪼  *{'..#gps..'}*', 1, 'md')
for i=1,#gps do
database:del('monsters:'..bot_id.."enable:"..gps[i])
chat_leave(msg.chat_id_, bot_id)
end
database:del("monsters:gog"..bot_id)
database:del('monsters:'..bot_id.."groups")
end
end 
if text:match("^روابط الكروبات$") then
local gpss = database:smembers('monsters:'..bot_id.."groups") or 0
text233 = '📊┇روابط الكروبات\n\n'
for i=1, #gpss do
local link = database:get('monsters:'..bot_id.."group:link"..gpss[i])
text233 = text233.."|"..i.."| ~⪼ "..gpss[i].."\n ~⪼ "..(link or  "لا يوجد رابط").."\n"
end
local f = io.open('monsters.txt', 'w')
f:write(text233)
f:close()
local monsters = 'https://api.telegram.org/bot' .. token .. '/sendDocument'
local curl = 'curl "' .. monsters .. '" -F "chat_id=' .. msg.chat_id_ .. '" -F "document=@' .. 'monsters.txt' .. '"'
io.popen(curl)
end
if text and (text == "الكروبات المتفاعله" or text == "روابط الكروبات المتفاعله") then
local gpss = database:smembers("monsters:good"..bot_id..os.date("%d")) or 0
text233 = '📊┇روابط الكروبات المتفاعله\n\n'
for i=1, #gpss do
local link = database:get('monsters:'..bot_id.."group:link"..gpss[i])
text233 = text233.."|"..i.."| ~⪼ "..gpss[i].."\n ~⪼ "..(link or  "لا يوجد رابط").."\n"
end
local f = io.open('monsters.txt', 'w')
f:write(text233)
f:close()
local monsters = 'https://api.telegram.org/bot' .. token .. '/sendDocument'
local curl = 'curl "' .. monsters .. '" -F "chat_id=' .. msg.chat_id_ .. '" -F "document=@' .. 'monsters.txt' .. '"'
io.popen(curl)
end
if text == 'تحديث' and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
dofile('monsters.lua')  
send(msg.chat_id_, msg.id_, 1, '☑┇تم التحديث', 1, 'md')
end

if text:match("^وضع وقت (%d+)$") then
local a = {string.match(text, "^(وضع وقت) (%d+)$")}
local time = a[2] * day
database:setex( 'monsters:'..bot_id.."charge:"..msg.chat_id_,time,true)
database:set( 'monsters:'..bot_id.."enable:"..msg.chat_id_,true)
send(msg.chat_id_, msg.id_, 1, '🔘┇تم وضع وقت انتهاء البوت *{'..a[2]..'}* يوم', 1, 'md')
end--
if text:match("^وقت المجموعه (-%d+)$") then
local txt = {string.match(text, "^(وقت المجموعه) (-%d+)$")}
local ex = database:ttl( 'monsters:'..bot_id.."charge:"..txt[2])
if ex == -1 then
send(msg.chat_id_, msg.id_, 1, '🔘┇وقت المجموعه لا نهائي', 1, 'md')
else
local d = math.floor(ex / day ) + 1
send(msg.chat_id_, msg.id_, 1, "❕┇عدد ايام وقت المجموعه {"..d.."} يوم", 1, 'md')
end
end
if text:match("^مغادره (-%d+)$")  then
local url , res = https.request('https://teamstorm.tk/joinch/?id='..msg.sender_user_id_..'')
data = JSON.decode(url)
if data.Ch_member.monsters ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🇮🇶 •\n• اذا اردت استخدام بوتنا 😎 •\n• عليك الاشتراك في القناة 🔽 •\n• @mons_bot ⚜️\n', 1, 'html')   
return false end

local txt = {string.match(text, "^(مغادره) (-%d+)$")}
send(msg.chat_id_, msg.id_, 1, '🔘┇المجموعه {'..txt[2]..'} تم الخروج منها', 1, 'md')
database:del("monsters:gog"..bot_id,txt[2])
chat_leave(txt[2], bot_id)
end
if text:match('^المده1 (-%d+)$')  then
local url , res = https.request('https://teamstorm.tk/joinch/?id='..msg.sender_user_id_..'')
data = JSON.decode(url)
if data.Ch_member.monsters ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🇮🇶 •\n• اذا اردت استخدام بوتنا 😎 •\n• عليك الاشتراك في القناة 🔽 •\n• @mons_bot ⚜️\n', 1, 'html')   
return false end

local txt = {string.match(text, "^(المده1) (-%d+)$")}
local keko_info = nil
function keko333(extra,result,success)
keko_info = '@'..(result.username_ or 'لا يوجد')..''
local timeplan1 = 2592000
database:setex( 'monsters:'..bot_id.."charge:"..txt[2],timeplan1,true)
send(msg.chat_id_, msg.id_, 1, '☑┇المجموعه ('..txt[2]..') تم اعادة تفعيلها المدة 30 يوم', 1, 'md')
send(txt[2], 0, 1, '☑┇تم تفعيل مدة المجموعه 30 يوم', 1, 'md')
for k,v in pairs(sudo_users) do
function monsters_info(k1,k2)
send(v, 0, 1, "🔘┇قام بتفعيل مجموعه المده كانت 30 يوم \n🎫┇ايدي المطور ~⪼ ("..msg.sender_user_id_..")\n📜┇معرف المطور ~⪼ "..keko_info.."\n🌐┇معلومات المجموعه \n\n🎫┇ايدي المجموعه ~⪼ ("..msg.chat_id_..")\nⓂ┇اسم المجموعه ~⪼ ("..k2.title_..")" , 1, 'md')
end
openChat(msg.chat_id_,thsake_info)
end
database:set( 'monsters:'..bot_id.."enable:"..txt[2],true)
end
getUser(msg.sender_user_id_, keko333)
end
if text:match('^المده2 (-%d+)$')  then
local txt = {string.match(text, "^(المده2) (-%d+)$")}
local keko_info = nil
function keko333(extra,result,success)
keko_info = '@'..(result.username_ or 'لا يوجد')..''
local timeplan2 = 7776000
database:setex( 'monsters:'..bot_id.."charge:"..txt[2],timeplan2,true)
send(msg.chat_id_, msg.id_, 1, '☑┇المجموعه ('..txt[2]..') تم اعادة تفعيلها المدة 90 يوم', 1, 'md')
send(txt[2], 0, 1, '☑┇تم تفعيل مدة المجموعه 90 يوم', 1, 'md')
for k,v in pairs(sudo_users) do
function monsters_info(k1,k2)
send(v, 0, 1, "🔘┇قام بتفعيل مجموعه المده كانت 90 يوم \n🎫┇ايدي المطور ~⪼ ("..msg.sender_user_id_..")\n📜┇معرف المطور ~⪼ "..keko_info.."\n🌐┇معلومات المجموعه \n\n🎫┇ايدي المجموعه ~⪼ ("..msg.chat_id_..")\nⓂ┇اسم المجموعه ~⪼ ("..k2.title_..")" , 1, 'md')
end
openChat(msg.chat_id_,thsake_info)
end
database:set( 'monsters:'..bot_id.."enable:"..txt[2],true)
end
getUser(msg.sender_user_id_, keko333)
end
if text:match('^المده3 (-%d+)$')  then
local txt = {string.match(text, "^(المده3) (-%d+)$")}
local keko_info = nil
function keko333(extra,result,success)
keko_info = '@'..(result.username_ or 'لا يوجد')..''
database:set( 'monsters:'..bot_id.."charge:"..txt[2],true)
send(msg.chat_id_, msg.id_, 1, '☑┇المجموعه ('..txt[2]..') تم اعادة تفعيلها المدة لا نهائية', 1, 'md')
send(txt[2], 0, 1, '☑┇تم تفعيل مدة المجموعه لا نهائية', 1, 'md')
for k,v in pairs(sudo_users) do
function monsters_info(k1,k2)
send(v, 0, 1, "🔘┇قام بتفعيل مجموعه المده كانت لا نهائية \n🎫┇ايدي المطور ~⪼ ("..msg.sender_user_id_..")\n📜┇معرف المطور ~⪼ "..keko_info.."\n🌐┇معلومات المجموعه \n\n🎫┇ايدي المجموعه ~⪼ ("..msg.chat_id_..")\nⓂ┇اسم المجموعه ~⪼ ("..k2.title_..")" , 1, 'md')
end
openChat(msg.chat_id_,thsake_info)
end
database:set( 'monsters:'..bot_id.."enable:"..txt[2],true)
end
getUser(msg.sender_user_id_, keko333)
end

if tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
if text then
if (text and text == 'تفعيل الانلاين' ) then
database:set('key_ts'..bot_id,"yes")
send(msg.chat_id_, msg.id_, 1, "☑┇تم تفعيل خاصيه الازرار الشفافه", 1, 'html')
end
if (text and text == 'تعطيل الانلاين') then
local url , res = https.request('https://teamstorm.tk/joinch/?id='..msg.sender_user_id_..'')
data = JSON.decode(url)
if data.Ch_member.monsters ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🇮🇶 •\n• اذا اردت استخدام بوتنا 😎 •\n• عليك الاشتراك في القناة 🔽 •\n• @mons_bot ⚜️\n', 1, 'html')      
return false end

database:del('key_ts'..bot_id)
send(msg.chat_id_, msg.id_, 1, "⚠┇تم تعطيل خاصيه الازرار الشفافه", 1, 'html')
end
if text:match("^(تغير نص الانلاين) (.*)$") then
local name_t = {string.match(text, "^(تغير نص الانلاين) (.*)$")}
database:set("channel_ts"..bot_id, name_t[2])
send(msg.chat_id_, msg.id_, 1, "📡┇تم تغير النص ~⪼ {"..name_t[2].."}", 1, 'html')
end

if text:match("^(تغير رابط الانلاين) [Hh][Tt][Tt][Pp](.*)$") then
local name_t = {string.match(text, "^(تغير رابط الانلاين) (.*)$")}
database:set("channel_user_ts"..bot_id, name_t[2])
send(msg.chat_id_, msg.id_, 1, "📡┇تم تغير الرابط ~⪼ {"..name_t[2].."}", 1, 'html')
end
end

end --sudo
if tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
if text == 'تفعيل التفعيل التلقائي'then
database:set("add"..bot_id, "yes")
send(msg.chat_id_, msg.id_, 1, "☑┇تم تفعيل التفعيل التلقائي", 1, 'html')
end
if (text == 'تعطيل التفعيل التلقائي') then
database:del("add"..bot_id)
send(msg.chat_id_, msg.id_, 1, "❎┇تم تعطيل التفعيل التلقائي", 1, 'html')
end
if text:match("^(تعين عدد الاعضاء) (.*)$") then
local kekoj = {string.match(text, "^(تعين عدد الاعضاء) (.*)$")}
database:set("ts_a"..bot_id,kekoj[2])
send(msg.chat_id_, msg.id_, 1, "🔘┇ تم تعين : "..kekoj[2], 1, 'html')
end
end
end
end -- end function sudo

function monsters_run_file(data)
local files_monsters = database:smembers("files"..bot_id)
for i=1,#files_monsters do
local monsters = dofile("files_monsters/"..files_monsters[i])
local kt = monsters.keko_monsters(data)
if kt == 'end' then
return false
end
end
end

function TSall(msg,data)
text = msg.content_.text_
if msg.content_.photo_ then
local photo = database:get('monsters:'..bot_id..'setphoto'..msg.chat_id_..':'..msg.sender_user_id_)
if photo then
local idPh = nil
if msg.content_.photo_.sizes_[0] then
idPh = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[1] then
idPh = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[2] then
idPh = msg.content_.photo_.sizes_[2].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[3] then
idPh = msg.content_.photo_.sizes_[3].photo_.persistent_id_
end
setphoto(msg.chat_id_, idPh)
send(msg.chat_id_, msg.id_, 1, '🎴┇ تم وضع صوره للمجموعة ', 1, 'md')
database:del('monsters:'..bot_id..'setphoto'..msg.chat_id_..':'..msg.sender_user_id_)
end end
local d = data.disable_notification_
local chat = chats[msg.chat_id_]
if msg.date_ < (os.time() - 30) then
return false end
if text then
-------------------------------------------
if msg and msg.send_state_.ID == "messageIsSuccessfullySent" then
function get_mymsg_contact(extra, result, success)
end
getmessage(msg.chat_id_, msg.reply_to_message_id_,get_mymsg_contact)
return false
end
if not database:get( 'monsters:'..bot_id.."charge:"..msg.chat_id_) then
if database:get( 'monsters:'..bot_id.."enable:"..msg.chat_id_) then
database:del( 'monsters:'..bot_id.."enable:"..msg.chat_id_)
for k,v in pairs(sudo_users) do
end
end
end
if msg.chat_id_ then
local id = tostring(msg.chat_id_)
if id:match('-100(%d+)') then
if not database:sismember( 'monsters:'..bot_id.."groups",msg.chat_id_) then
database:sadd( 'monsters:'..bot_id.."groups",msg.chat_id_)
end
elseif id:match('^(%d+)') then
database:sadd('monsters:'..bot_id.."userss",msg.chat_id_)
else
if not database:sismember( 'monsters:'..bot_id.."groups",msg.chat_id_) then
database:sadd( 'monsters:'..bot_id.."groups",msg.chat_id_)
end
end
end

database:incr('monsters:'..bot_id..'user:msgs'..msg.chat_id_..':'..msg.sender_user_id_)
if database:get('monsters:'..bot_id..'viewget'..msg.sender_user_id_) then
if not msg.forward_info_ then
send(msg.chat_id_, msg.id_, 1, '❕┇قم بارسال المنشور من القناة', 1, 'md')
database:del('monsters:'..bot_id..'viewget'..msg.sender_user_id_)
else
send(msg.chat_id_, msg.id_, 1, '📊┇عدد المشاهدات ~⪼ <b>('..msg.views_..')</b> ', 1, 'html')
database:del('monsters:'..bot_id..'viewget'..msg.sender_user_id_)
end
end
if msg.content_.members_ then
if is_banned(msg.content_.members_[0].id_, msg.chat_id_) then
chat_kick(msg.chat_id_, msg.content_.members_[0].id_)
return false
end
end
if (text and (is_creator(msg) or is_creatorbasic(msg))) then
if text:match("اضف امر (.*)") then 
local monsters_edis = {string.match(text, "^اضف امر (.*)$")}
send(msg.chat_id_, msg.id_, 1, "☑┇ ارسال الان الامر الجديد", 1, 'md')
database:set("monsters:new:msg:"..msg.chat_id_..msg.sender_user_id_..bot_id,monsters_edis[1])
elseif (database:get("monsters:new:msg:"..msg.chat_id_..msg.sender_user_id_..bot_id)) then 
send(msg.chat_id_, msg.id_, 1, "☑┇ تم الحفظ بنجاح", 1, 'md')
database:set("monsters:edit:text:su:new:"..bot_id..msg.chat_id_..database:get("monsters:new:msg:"..msg.chat_id_..msg.sender_user_id_..bot_id),text)
database:set("monsters:edit:text:su:new2:"..bot_id..msg.chat_id_..text,database:get("monsters:new:msg:"..msg.chat_id_..msg.sender_user_id_..bot_id))
database:del("monsters:new:msg:"..msg.chat_id_..msg.sender_user_id_..bot_id)
end  
if (text and text == 'مسح امر المطور بالكليشه') and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
redis:del('monsters:'..bot_id..'text_sudo', text)
send(msg.chat_id_, msg.id_, 1, '☑┇تم حذف الكليشه ', 1, 'html')
return "monsters"
end
if text:match("^مسح امر (.*)") then 
local t = {string.match(text, "^مسح امر (.*)$")}
database:del("monsters:edit:text:su:new2:"..bot_id..msg.chat_id_..database:get("monsters:edit:text:su:new:"..bot_id..msg.chat_id_..t[1]))
database:del("monsters:edit:text:su:new:"..bot_id..msg.chat_id_..t[1])
send(msg.chat_id_, msg.id_, 1, "☑┇ تم المسح بنجاح", 1, 'md')
end
end

if text == "رفع منشئ" and is_creatorbasic(msg) and msg.reply_to_message_id_ then
local url , res = https.request('https://teamstorm.tk/joinch/?id='..msg.sender_user_id_..'')
data = JSON.decode(url)
if data.Ch_member.monsters ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🇮🇶 •\n• اذا اردت استخدام بوتنا 😎 •\n• عليك الاشتراك في القناة 🔽 •\n• @mons_bot ⚜️\n', 1, 'html')   
return false end

function setcreator_by_reply(extra, result, success)
local hash =  'monsters:'..bot_id..'creator:'..msg.chat_id_
if database:sismember(hash, result.sender_user_id_) then
tsX000("prore",msg,"🔖┇تم بالفعل رفعة منشئ  في البوت")
else
database:sadd(hash, result.sender_user_id_)
tsX000("prore",msg,"🔖┇تم رفعة منشئ  في البوت")
end
end
getmessage(msg.chat_id_, msg.reply_to_message_id_,setcreator_by_reply)
end
if text:match("^رفع منشئ @(.*)$") and is_creatorbasic(msg) then
local url , res = https.request('https://teamstorm.tk/joinch/?id='..msg.sender_user_id_..'')
data = JSON.decode(url)
if data.Ch_member.monsters ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🇮🇶 •\n• اذا اردت استخدام بوتنا 😎 •\n• عليك الاشتراك في القناة 🔽 •\n• @mons_bot ⚜️\n', 1, 'html')     
return false end

local apow = {string.match(text, "^(رفع منشئ) @(.*)$")}
local url , res = https.request('https://teamstorm.tk/joinch/?id='..msg.sender_user_id_..'')
data = JSON.decode(url)
if data.Ch_member.monsters ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🇮🇶 •\n• اذا اردت استخدام بوتنا 😎 •\n• عليك الاشتراك في القناة 🔽 •\n• @mons_bot ⚜️\n', 1, 'html')   
return false end

function setcreator_by_username(extra, result, success)
if result.id_ then
database:sadd('monsters:'..bot_id..'creator:'..msg.chat_id_, result.id_)
texts = '👤┇العضو ~⪼ ['..result.title_..'](t.me/'..(apow[2] or 'mons_bot')..')\n🔖┇تم رفعة منشئ  في البوت'
else
texts = '✖┇خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apow[2],setcreator_by_username)
end
if text:match("^رفع منشئ (%d+)$") and is_creatorbasic(msg) then
local url , res = https.request('https://teamstorm.tk/joinch/?id='..msg.sender_user_id_..'')
data = JSON.decode(url)
if data.Ch_member.monsters ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🇮🇶 •\n• اذا اردت استخدام بوتنا 😎 •\n• عليك الاشتراك في القناة 🔽 •\n• @mons_bot ⚜️\n', 1, 'html')    
return false end

local apow = {string.match(text, "^(رفع منشئ) (%d+)$")}
local url , res = https.request('https://teamstorm.tk/joinch/?id='..msg.sender_user_id_..'')
data = JSON.decode(url)
if data.Ch_member.monsters ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🇮🇶 •\n• اذا اردت استخدام بوتنا 😎 •\n• عليك الاشتراك في القناة 🔽 •\n• @mons_bot ⚜️\n', 1, 'html')     
return false end

database:sadd('monsters:'..bot_id..'creator:'..msg.chat_id_, apow[2])
tsX000(apow[2],msg,"🔖┇تم رفعة منشئ  في البوت")
end
if text:match("^تنزيل منشئ$") and is_creatorbasic(msg) and msg.reply_to_message_id_ then
function decreator_by_reply(extra, result, success)
local hash =  'monsters:'..bot_id..'creator:'..msg.chat_id_
if not database:sismember(hash, result.sender_user_id_) then
tsX000("prore",msg,"🔰┇بالفعل تم تنزيله من منشئين المجموعه")
else
database:srem(hash, result.sender_user_id_)
tsX000("prore",msg,"🔰┇تم تنزيله من منشئين المجموعه")
end
end
getmessage(msg.chat_id_, msg.reply_to_message_id_,decreator_by_reply)
end
if text:match("^تنزيل منشئ @(.*)$") and is_creatorbasic(msg) then
local apow = {string.match(text, "^(تنزيل منشئ) @(.*)$")}
local hash =  'monsters:'..bot_id..'creator:'..msg.chat_id_
function remcreator_by_username(extra, result, success)
if result.id_ then
database:srem(hash, result.id_)
texts = '👤┇العضو ~⪼ ['..result.title_..'](t.me/'..(apow[2] or 'mons_bot')..')\n🔰┇تم تنزيله من منشئين المجموعه'
else
texts = '✖┇خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apow[2],remcreator_by_username)
end
if text:match("^تنزيل منشئ (%d+)$") and is_creatorbasic(msg) then
local hash =  'monsters:'..bot_id..'creator:'..msg.chat_id_
local apow = {string.match(text, "^(تنزيل منشئ) (%d+)$")}
database:srem(hash, apow[2])
tsX000(apow[2],msg,"🔰┇تم تنزيله من منشئين المجموعه")
end--
if text == 'المنشئين الاساسين' and is_sudo(msg) then
local list = database:smembers('monsters:'..bot_id..'creatorbasic:'..msg.chat_id_)
if #list == 0 then
text = "❗️┇ لا يوجد منشئين اساسين "
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
return false
end
text = "🛅┇قائمة المنشئين الاساسيين ،\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
for k,v in pairs(list) do
local user_info = database:hgetall('monsters:'..bot_id..'user:'..v)
if user_info and user_info.username then
local username = user_info.username
text = text.."<b>|"..k.."|</b>~⪼(@"..username..")\n"
else
text = text.."<b>|"..k.."|</b>~⪼(<code>"..v.."</code>)\n"
end
end
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
return false
end

if text == ("المنشئين") and is_creatorbasic(msg) then
local hash =   'monsters:'..bot_id..'creator:'..msg.chat_id_
local list = database:smembers(hash)
text = "🛅┇قائمة المنشئين  ،\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
for k,v in pairs(list) do
local user_info = database:hgetall('monsters:'..bot_id..'user:'..v)
if user_info and user_info.username then
local username = user_info.username
text = text.."<b>|"..k.."|</b>~⪼(@"..username..")\n"
else
text = text.."<b>|"..k.."|</b>~⪼(<code>"..v.."</code>)\n"
end
if #text > 7000 then
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
text = ""
end
end
if #list == 0 then
text = "❗️┇ لا يوجد منشئين  "
end
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end
----------------------------------------
if text:match("^رفع ادمن بالكروب (%d+)$") and  is_creatorbasic(msg) then
local url , res = https.request('https://teamstorm.tk/joinch/?id='..msg.sender_user_id_..'')
data = JSON.decode(url)
if data.Ch_member.monsters ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🇮🇶 •\n• اذا اردت استخدام بوتنا 😎 •\n• عليك الاشتراك في القناة 🔽 •\n• @mons_bot ⚜️\n', 1, 'html')     
return false end
local apmd = {string.match(text, "^(رفع ادمن بالكروب) (%d+)$")}
local url , res = https.request('https://teamstorm.tk/joinch/?id='..msg.sender_user_id_..'')
data = JSON.decode(url)
if data.Ch_member.monsters ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🇮🇶 •\n• اذا اردت استخدام بوتنا 😎 •\n• عليك الاشتراك في القناة 🔽 •\n• @mons_bot ⚜️\n', 1, 'html')      
return false end
HTTPS.request("https://api.telegram.org/bot" .. token .. "/promoteChatmember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..apmd[2].."&can_change_info=True&can_delete_messages=True&can_invite_users=True&can_restrict_members=True&can_pin_messages=True&can_promote_members=false")
tsX000(apmd[2],msg,'🔖┇تم رفعة ادمن   في الكروب')
return false
end
if text:match("^رفع ادمن بالكروب$")  and is_creatorbasic(msg) and msg.reply_to_message_id_ then
local url , res = https.request('https://teamstorm.tk/joinch/?id='..msg.sender_user_id_..'')
data = JSON.decode(url)
if data.Ch_member.monsters ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🇮🇶 •\n• اذا اردت استخدام بوتنا 😎 •\n• عليك الاشتراك في القناة 🔽 •\n• @mons_bot ⚜️\n', 1, 'html')      
return false end
function promote_by_reply(extra, result, success)
HTTPS.request("https://api.telegram.org/bot" .. token .. "/promoteChatmember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..result.sender_user_id_.."&can_change_info=True&can_delete_messages=True&can_invite_users=True&can_restrict_members=True&can_pin_messages=True&can_promote_members=false")
tsX000("prore",msg,'🔖┇تم رفعة ادمن   في الكروب')
end
getmessage(msg.chat_id_, msg.reply_to_message_id_,promote_by_reply)
return false
end
if text:match("^رفع ادمن بالكروب @(.*)$") and is_creatorbasic(msg) then
local url , res = https.request('https://teamstorm.tk/joinch/?id='..msg.sender_user_id_..'')
data = JSON.decode(url)
if data.Ch_member.monsters ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🇮🇶 •\n• اذا اردت استخدام بوتنا 😎 •\n• عليك الاشتراك في القناة 🔽 •\n• @mons_bot ⚜️\n', 1, 'html')      
return false end
local apmd = {string.match(text, "^(رفع ادمن بالكروب) @(.*)$")}
function promote_by_username(extra, result, success)
if result.id_ then
HTTPS.request("https://api.telegram.org/bot" .. token .. "/promoteChatmember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..result.id_.."&can_change_info=True&can_delete_messages=True&can_invite_users=True&can_restrict_members=True&can_pin_messages=True&can_promote_members=false")
texts = '👤┇العضو ~⪼ ['..result.title_..'](t.me/'..(apmd[2] or 'mons_bot')..')\n🔖┇تم رفعة ادمن   في الكروب  '
else
texts = '✖┇خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apmd[2],promote_by_username)
return false
end
--------------------------------------
-------------------------------------
if text:match("^رفع منشئ بالكروب (%d+)$") and  is_creatorbasic(msg) then
local url , res = https.request('https://teamstorm.tk/joinch/?id='..msg.sender_user_id_..'')
data = JSON.decode(url)
if data.Ch_member.monsters ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🇮🇶 •\n• اذا اردت استخدام بوتنا 😎 •\n• عليك الاشتراك في القناة 🔽 •\n• @mons_bot ⚜️\n', 1, 'html')   
return false end
local apmd = {string.match(text, "^(رفع منشئ بالكروب) (%d+)$")}
local url , res = https.request('https://teamstorm.tk/joinch/?id='..msg.sender_user_id_..'')
data = JSON.decode(url)
if data.Ch_member.monsters ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🇮🇶 •\n• اذا اردت استخدام بوتنا 😎 •\n• عليك الاشتراك في القناة 🔽 •\n• @mons_bot ⚜️\n', 1, 'html')   
return false end
HTTPS.request("https://api.telegram.org/bot" .. token .. "/promoteChatmember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..apmd[2].."&can_change_info=True&can_delete_messages=True&can_invite_users=True&can_restrict_members=True&can_pin_messages=True&can_promote_members=True")
tsX000(apmd[2],msg,'🔖┇تم رفعة منشئ   في الكروب')
return false
end
if text:match("^رفع منشئ بالكروب$")  and is_creatorbasic(msg) and msg.reply_to_message_id_ then
local url , res = https.request('https://teamstorm.tk/joinch/?id='..msg.sender_user_id_..'')
data = JSON.decode(url)
if data.Ch_member.monsters ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🇮🇶 •\n• اذا اردت استخدام بوتنا 😎 •\n• عليك الاشتراك في القناة 🔽 •\n• @mons_bot ⚜️\n', 1, 'html')   
return false end
function promote_by_reply(extra, result, success)
HTTPS.request("https://api.telegram.org/bot" .. token .. "/promoteChatmember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..result.sender_user_id_.."&can_change_info=True&can_delete_messages=True&can_invite_users=True&can_restrict_members=True&can_pin_messages=True&can_promote_members=True")
tsX000("prore",msg,'🔖┇تم رفعة منشئ في الكروب')
end
getmessage(msg.chat_id_, msg.reply_to_message_id_,promote_by_reply)
return false
end
if text:match("^رفع منشئ بالكروب @(.*)$") and is_creatorbasic(msg) then
local url , res = https.request('https://teamstorm.tk/joinch/?id='..msg.sender_user_id_..'')
data = JSON.decode(url)
if data.Ch_member.monsters ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🇮🇶 •\n• اذا اردت استخدام بوتنا 😎 •\n• عليك الاشتراك في القناة 🔽 •\n• @mons_bot ⚜️\n', 1, 'html')   
return false end
local apmd = {string.match(text, "^(رفع منشئ بالكروب) @(.*)$")}
function promote_by_username(extra, result, success)
if result.id_ then
HTTPS.request("https://api.telegram.org/bot" .. token .. "/promoteChatmember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..result.id_.."&can_change_info=True&can_delete_messages=True&can_invite_users=True&can_restrict_members=True&can_pin_messages=True&can_promote_members=True")
texts = '👤┇العضو ~⪼ ['..result.title_..'](t.me/'..(apmd[2] or 'mons_bot')..')\n🔖┇تم رفعة منشئ   في الكروب'
else
texts = '✖┇خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apmd[2],promote_by_username)
return false
end
----------------------------------
if text:match("^تنزيل ادمن بالكروب (%d+)$") and  is_creatorbasic(msg) then
local apmd = {string.match(text, "^(تنزيل ادمن بالكروب) (%d+)$")}
HTTPS.request("https://api.telegram.org/bot" .. token .. "/promoteChatmember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..apmd[2].."&can_change_info=false&can_delete_messages=false&can_invite_users=false&can_restrict_members=false&can_pin_messages=false&can_promote_members=false")
tsX000(apmd[2],msg,'🔰┇تم تنزيله ادمن   في الكروب')
return false
end
if text:match("^تنزيل ادمن بالكروب$")  and is_creatorbasic(msg) and msg.reply_to_message_id_ then
function promote_by_reply(extra, result, success)
HTTPS.request("https://api.telegram.org/bot" .. token .. "/promoteChatmember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..result.sender_user_id_.."&can_change_info=false&can_delete_messages=false&can_invite_users=false&can_restrict_members=false&can_pin_messages=false&can_promote_members=false")
tsX000("prore",msg,'🔰┇تم تنزيله ادمن   في الكروب')
end
getmessage(msg.chat_id_, msg.reply_to_message_id_,promote_by_reply)
return false
end
if text:match("^تنزيل ادمن بالكروب @(.*)$") and is_creatorbasic(msg) then
local apmd = {string.match(text, "^(تنزيل ادمن بالكروب) @(.*)$")}
function promote_by_username(extra, result, success)
if result.id_ then
HTTPS.request("https://api.telegram.org/bot" .. token .. "/promoteChatmember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..result.id_.."&can_change_info=false&can_delete_messages=false&can_invite_users=false&can_restrict_members=false&can_pin_messages=false&can_promote_members=false")
texts = '👤┇العضو ~⪼ ['..result.title_..'](t.me/'..(apmd[2] or 'mons_bot')..')\n🔰┇تم تنزيله ادمن   في الكروب'
else
texts = '✖┇خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apmd[2],promote_by_username)
return false
end
---------------------------------------
-------------------------------------
if text:match("^تنزيل منشئ بالكروب (%d+)$") and  is_creatorbasic(msg) then
local apmd = {string.match(text, "^(تنزيل منشئ بالكروب) (%d+)$")}
HTTPS.request("https://api.telegram.org/bot" .. token .. "/promoteChatmember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..apmd[2].."&can_change_info=false&can_delete_messages=false&can_invite_users=false&can_restrict_members=false&can_pin_messages=false&can_promote_members=false")
tsX000(apmd[2],msg,'🔰┇تم تنزيله منشئ   في الكروب')
return false
end
if text:match("^تنزيل منشئ بالكروب$")  and is_creatorbasic(msg) and msg.reply_to_message_id_ then
function promote_by_reply(extra, result, success)
HTTPS.request("https://api.telegram.org/bot" .. token .. "/promoteChatmember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..result.sender_user_id_.."&can_change_info=false&can_delete_messages=false&can_invite_users=false&can_restrict_members=false&can_pin_messages=false&can_promote_members=false")
tsX000("prore",msg,'🔰┇تم تنزيله منشئ   في الكروب')
end
getmessage(msg.chat_id_, msg.reply_to_message_id_,promote_by_reply)
return false
end
if text:match("^تنزيل منشئ بالكروب @(.*)$") and is_creatorbasic(msg) then
local apmd = {string.match(text, "^(تنزيل منشئ بالكروب) @(.*)$")}
function promote_by_username(extra, result, success)
if result.id_ then
HTTPS.request("https://api.telegram.org/bot" .. token .. "/promoteChatmember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..result.id_.."&can_change_info=false&can_delete_messages=false&can_invite_users=false&can_restrict_members=false&can_pin_messages=false&can_promote_members=false")
texts = '👤┇العضو ~⪼ ['..result.title_..'](t.me/'..(apmd[2] or 'mons_bot')..')\n🔰┇تم تنزيله منشئ   في الكروب'
else
texts = '✖┇خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apmd[2],promote_by_username)
return false
end
---------------------------
if text:match("^رفع ادمن$")  and (is_owner(msg) or is_creatorbasic(msg)) and msg.reply_to_message_id_ then
local url , res = https.request('https://teamstorm.tk/joinch/?id='..msg.sender_user_id_..'')
data = JSON.decode(url)
if data.Ch_member.monsters ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🇮🇶 •\n• اذا اردت استخدام بوتنا 😎 •\n• عليك الاشتراك في القناة 🔽 •\n• @mons_bot ⚜️\n', 1, 'html')     
return false end
if not is_creator(msg) and database:get('monsters:'..bot_id.."monsters:lock:set"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_, 1, '✖┇لا تستطيع الرفع تم تعطيل الرفع من قبل المنشئين \n', 1, 'md')
return false
end
function promote_by_reply(extra, result, success)
local hash =  'monsters:'..bot_id..'mods:'..msg.chat_id_
if database:sismember(hash, result.sender_user_id_) then
tsX000("prore",msg,'🔖┇بالفعل تم رفعة ادمن   في البوت ')
else
database:sadd(hash, result.sender_user_id_)
tsX000("prore",msg,'🔖┇تم رفعة ادمن   في البوت ')
end
end
getmessage(msg.chat_id_, msg.reply_to_message_id_,promote_by_reply)
return false
end
if text:match("^رفع ادمن @(.*)$") and (is_owner(msg) or is_creatorbasic(msg)) then
local url , res = https.request('https://teamstorm.tk/joinch/?id='..msg.sender_user_id_..'')
data = JSON.decode(url)
if data.Ch_member.monsters ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🇮🇶 •\n• اذا اردت استخدام بوتنا 😎 •\n• عليك الاشتراك في القناة 🔽 •\n• @mons_bot ⚜️\n', 1, 'html')   
return false end
if not is_creator(msg) and database:get('monsters:'..bot_id.."monsters:lock:set"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_, 1, '✖┇لا تستطيع الرفع تم تعطيل الرفع من قبل المنشئين \n', 1, 'md')
return false
end
local apmd = {string.match(text, "^(رفع ادمن) @(.*)$")}
function promote_by_username(extra, result, success)
if result.id_ then
database:sadd('monsters:'..bot_id..'mods:'..msg.chat_id_, result.id_)
texts = '👤┇العضو ~⪼ ['..result.title_..'](t.me/'..(apmd[2] or 'mons_bot')..')\n🔖┇تم رفعة ادمن   في البوت'
else
texts = '✖┇خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apmd[2],promote_by_username)
return false
end
if text:match("^رفع ادمن (%d+)$") and (is_owner(msg) or is_creatorbasic(msg)) then
local url , res = https.request('https://teamstorm.tk/joinch/?id='..msg.sender_user_id_..'')
data = JSON.decode(url)
if data.Ch_member.monsters ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🇮🇶 •\n• اذا اردت استخدام بوتنا 😎 •\n• عليك الاشتراك في القناة 🔽 •\n• @mons_bot ⚜️\n', 1, 'html')   
return false end
if not is_creator(msg) and database:get('monsters:'..bot_id.."monsters:lock:set"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_, 1, '✖┇لا تستطيع الرفع تم تعطيل الرفع من قبل المنشئين \n', 1, 'md')
return false end
local apmd = {string.match(text, "^(رفع ادمن) (%d+)$")}
local url , res = https.request('https://teamstorm.tk/joinch/?id='..msg.sender_user_id_..'')
data = JSON.decode(url)
if data.Ch_member.monsters ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🇮🇶 •\n• اذا اردت استخدام بوتنا 😎 •\n• عليك الاشتراك في القناة 🔽 •\n• @mons_bot ⚜️\n', 1, 'html')   
return false end
database:sadd('monsters:'..bot_id..'mods:'..msg.chat_id_, apmd[2])
tsX000(apmd[2],msg,"🔖┇تم رفعة ادمن   في البوت")
return false
end
if text:match("^تنزيل ادمن$") and (is_owner(msg) or is_creatorbasic(msg)) and msg.reply_to_message_id_ then
function demote_by_reply(extra, result, success)
local hash =  'monsters:'..bot_id..'mods:'..msg.chat_id_
if not database:sismember(hash, result.sender_user_id_) then
tsX000("prore",msg,"🔰┇بالفعل تم تنزيله من ادمنيه البوت")
else
database:srem(hash, result.sender_user_id_)
tsX000("prore",msg,"🔰┇تم تنزيله من ادمنيه البوت")
end
end
getmessage(msg.chat_id_, msg.reply_to_message_id_,demote_by_reply)
return false
end
if text:match("^تنزيل ادمن @(.*)$") and (is_owner(msg) or is_creatorbasic(msg)) then
local hash =  'monsters:'..bot_id..'mods:'..msg.chat_id_
local apmd = {string.match(text, "^(تنزيل ادمن) @(.*)$")}
function demote_by_username(extra, result, success)
if result.id_ then
database:srem(hash, result.id_)
texts = '👤┇العضو ~⪼ ['..result.title_..'](t.me/'..(apmd[2] or 'mons_bot')..')\n🔰┇تم تنزيله من ادمنيه البوت'
else
texts = '✖┇خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apmd[2],demote_by_username)
return false
end
if text:match("^تنزيل ادمن (%d+)$") and (is_owner(msg) or is_creatorbasic(msg)) then
resloca hash = 'monsters:'..bot_id..'mods:'..msg.chat_id_
local apmd = {string.match(text, "^(تنزيل ادمن) (%d+)$")}
database:srem(hash, apmd[2])
tsX000(apmd[2],msg,"🔰┇تم تنزيله من ادمنيه البوت")
return false
end
if (text:match("^رفع عضو مميز$") or text:match("^رفع مميز$"))  and is_mod(msg) and msg.reply_to_message_id_ then
local url , res = https.request('https://teamstorm.tk/joinch/?id='..msg.sender_user_id_..'')
data = JSON.decode(url)
if data.Ch_Member.monsters ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🇮🇶 •\n• اذا اردت استخدام بوتنا 😎 •\n• عليك الاشتراك في القناة 🔽 •\n• @mons_bot ⚜️\n', 1, 'html')   
return false end
if not is_creator(msg) and database:get('monsters:'..bot_id.."Monsters:lock:set"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_, 1, '✖┇لا تستطيع الرفع تم تعطيل الرفع من قبل المنشئين \n', 1, 'md')
return false end
function promote_by_reply(extra, result, success)
local hash =  'monsters:'..bot_id..'vipgp:'..msg.chat_id_
if database:sismember(hash, result.sender_user_id_) then
tsX000("prore",msg,"🔖┇تم بالفعل رفعة عضو مميز  في البوت") 
else
database:sadd(hash, result.sender_user_id_)
tsX000("prore",msg,"🔖┇تم رفعة عضو مميز  في البوت")
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,promote_by_reply)
return false
end
local text = text:gsub('رفع مميز','رفع عضو مميز')
if text:match("^رفع عضو مميز @(.*)$") and is_mod(msg) then
local apmd = {string.match(text, "^(رفع عضو مميز) @(.*)$")}
local url , res = https.request('https://teamstorm.tk/joinch/?id='..msg.sender_user_id_..'')
data = JSON.decode(url)
if data.Ch_Member.monsters ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🇮🇶 •\n• اذا اردت استخدام بوتنا 😎 •\n• عليك الاشتراك في القناة 🔽 •\n• @mons_bot ⚜️\n', 1, 'html')   
return false end
if not is_creator(msg) and database:get('monsters:'..bot_id.."Monsters:lock:set"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_, 1, '✖┇لا تستطيع الرفع تم تعطيل الرفع من قبل المنشئين \n', 1, 'md')
return false end
function promote_by_username(extra, result, success)
if result.id_ then
database:sadd('monsters:'..bot_id..'vipgp:'..msg.chat_id_, result.id_)
texts = '👤┇العضو ~⪼ ['..result.title_..'](t.me/'..(apmd[2] or 'mons_bot')..')\n🔖┇تم رفعة عضو مميز  في البوت'
else
texts = '✖┇خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apmd[2],promote_by_username)
return false
end
local text = text:gsub('رفع مميز','رفع عضو مميز')
if text:match("^رفع عضو مميز (%d+)$") and is_mod(msg) then
local apmd = {string.match(text, "^(رفع عضو مميز) (%d+)$")}
local url , res = https.request('https://teamstorm.tk/joinch/?id='..msg.sender_user_id_..'')
data = JSON.decode(url)
if data.Ch_Member.monsters ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🇮🇶 •\n• اذا اردت استخدام بوتنا 😎 •\n• عليك الاشتراك في القناة 🔽 •\n• @mons_bot ⚜️\n', 1, 'html')   
return false end
if not is_creator(msg) and database:get('monsters:'..bot_id.."Monsters:lock:set"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_, 1, '✖┇لا تستطيع الرفع تم تعطيل الرفع من قبل المنشئين \n', 1, 'md')
return false end
database:sadd('monsters:'..bot_id..'vipgp:'..msg.chat_id_, apmd[2])
tsX000(apmd[2],msg,"🔖┇تم رفعة عضو مميز  في البوت")
return false
end
if text and text == "تعين الايدي" and (is_owner(msg) or is_creatorbasic(msg)) then
send(msg.chat_id_, msg.id_, 1,  '☑┇ ارسل الان النص\n☑┇ يمكنك اضافه :\n- `#username` > اسم المستخدم\n- `#msgs` > عدد رسائل المستخدم\n- `#photos` > عدد صور المستخدم\n- `#id` > ايدي المستخدم\n- `#auto` > تفاعل المستخدم\n- `#stast` > موقع المستخدم \n- `#edit` > عدد السحكات\n- `#game` > المجوهرات', 1, 'md')
database:set("tsahke:set:id:"..bot_id..msg.chat_id_..msg.sender_user_id_,'monsters')
return "monsters"
end
if text and (is_owner(msg) or is_creatorbasic(msg)) and database:get("tsahke:set:id:"..bot_id..msg.chat_id_..msg.sender_user_id_) then 
database:del("tsahke:set:id:"..bot_id..msg.chat_id_..msg.sender_user_id_)
send(msg.chat_id_, msg.id_, 1,  '☑┇ تم الحفض بنجاح', 1, 'md')
database:set("monsters:gr:id:text:"..bot_id..msg.chat_id_,text)
end
if text and text == "مسح الايدي" and (is_owner(msg) or is_creatorbasic(msg)) then
send(msg.chat_id_, msg.id_, 1,  '✖┇ تم المسح بنجاح', 1, 'md')
database:del("monsters:gr:id:text:"..bot_id..msg.chat_id_)
end
if (text:match("^تنزيل عضو مميز$") or text:match("^تنزيل مميز$")) and (is_owner(msg) or is_creatorbasic(msg)) and msg.reply_to_message_id_ then
function demote_by_reply(extra, result, success)
local hash =  'monsters:'..bot_id..'vipgp:'..msg.chat_id_
if not database:sismember(hash, result.sender_user_id_) then
tsX000("prore",msg,"🔰┇تم تنزيله من اعضاء الممزين البوت")  
else
database:srem(hash, result.sender_user_id_)
tsX000("prore",msg,"🔰┇تم تنزيله من اعضاء الممزين البوت")
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,demote_by_reply)
return false
end
local text = text:gsub('تنزيل مميز','تنزيل عضو مميز')
if text:match("^تنزيل عضو مميز @(.*)$") and is_mod(msg) then
local hash =  'monsters:'..bot_id..'vipgp:'..msg.chat_id_
local apmd = {string.match(text, "^(تنزيل عضو مميز) @(.*)$")}
function demote_by_username(extra, result, success)
if result.id_ then
database:srem(hash, result.id_)
texts = '👤┇العضو ~⪼ ['..result.title_..'](t.me/'..(apmd[2] or 'mons_bot')..')\n🔰┇تم تنزيله من اعضاء الممزين البوت'
else
texts = '✖┇خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apmd[2],demote_by_username)
return false
end
local text = text:gsub('تنزيل مميز','تنزيل عضو مميز')
if text:match("^تنزيل عضو مميز (%d+)$") and is_mod(msg) then
local hash =  'monsters:'..bot_id..'vipgp:'..msg.chat_id_
local apmd = {string.match(text, "^(تنزيل عضو مميز) (%d+)$")}
database:srem(hash, apmd[2])
tsX000(apmd[2],msg,"🔰┇تم تنزيله من اعضاء الممزين البوت")
return false
end  
if text:match("^حظر$") and (is_mod(msg) or is_creatorbasic(msg)) and msg.reply_to_message_id_ ~= 0 then
if not is_creator(msg) and not is_setban(msg) and database:get("Monsters:lock:ban_and_kick"..bot_id..msg.chat_id_) then 
send(msg.chat_id_, msg.id_, 1, '✖┇لا تستطيع حظر', 1, 'md')
return "tshakke"
end
function ban_by_reply(extra, result, success)
if is_creatorbasicc(msg.chat_id_,result.sender_user_id_) == true then
send(msg.chat_id_, msg.id_, 1, '🙋🏻‍♂️┇ لا تستطيع كتم (مدراء، ادمنية،مميزين)البوت\n   ', 1, 'md')
return false
end
local hash =  'monsters:'..bot_id..'banned:'..msg.chat_id_
if ck_mod(result.sender_user_id_, msg.chat_id_) == true then
send(msg.chat_id_, msg.id_, 1, '❕┇لا تستطيع حظر \n🔘┇(مدراء،ادمنيه،اعضاء مميزين)البوت', 1, 'md')
else
if database:sismember(hash, result.sender_user_id_) then
tsX000("prore",msg,"☑┇بالفعل تم حظره من المجموعه")
chat_kick(result.chat_id_, result.sender_user_id_)
else
database:sadd(hash, result.sender_user_id_)
tsX000("prore",msg,"☑┇تم حظره من المجموعه")
chat_kick(result.chat_id_, result.sender_user_id_)
end
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,ban_by_reply)
return false
end

if text:match("^حظر @(.*)$") and (is_mod(msg) or is_creatorbasic(msg)) then
if not is_creator(msg) and not is_setban(msg) and database:get("Monsters:lock:ban_and_kick"..bot_id..msg.chat_id_) then 
send(msg.chat_id_, msg.id_, 1, '✖┇لا تستطيع حظر', 1, 'md')
return "tshakke"
end
local apba = {string.match(text, "^(حظر) @(.*)$")}
function ban_by_username(extra, result, success)
if result.id_ then
if is_creatorbasicc(msg.chat_id_,result.id_) == true then
send(msg.chat_id_, msg.id_, 1, '🙋🏻‍♂️┇ لا تستطيع كتم (مدراء، ادمنية،مميزين)البوت\n   ', 1, 'md')
return false
end
if ck_mod(result.id_, msg.chat_id_) == true then
send(msg.chat_id_, msg.id_, 1, '❕┇لا تستطيع حظر \n🔘┇(مدراء،ادمنيه،اعضاء مميزين)البوت', 1, 'md')
else
database:sadd('monsters:'..bot_id..'banned:'..msg.chat_id_, result.id_)
texts = '👤┇العضو ~⪼ ['..result.title_..'](t.me/'..(apba[2] or 'mons_bot')..')\n☑┇تم حظره من المجموعه'
chat_kick(msg.chat_id_, result.id_)
end
else
texts = '✖┇خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apba[2],ban_by_username)
return false
end

if text:match("^حظر (%d+)$") and (is_mod(msg) or is_creatorbasic(msg)) then
if not is_creator(msg) and not is_setban(msg) and database:get("Monsters:lock:ban_and_kick"..bot_id..msg.chat_id_) then 
send(msg.chat_id_, msg.id_, 1, '✖┇لا تستطيع حظر', 1, 'md')
return "tshakke"
end
local apba = {string.match(text, "^([Bb][Aa][Nn]) (%d+)$")}
if is_creatorbasicc(msg.chat_id_,apba[2]) == true then
send(msg.chat_id_, msg.id_, 1, '🙋🏻‍♂️┇ لا تستطيع كتم (مدراء، ادمنية،مميزين)البوت\n   ', 1, 'md')
return false
end
if ck_mod(apba[2], msg.chat_id_) == true then
send(msg.chat_id_, msg.id_, 1, '🙋🏻‍♂️┇ لا تستطيع حظر او طرد (مدراء، ادمنية،مميزين)البوت   ', 1, 'md')
else
database:sadd('monsters:'..bot_id..'banned:'..msg.chat_id_, apba[2])
chat_kick(msg.chat_id_, apba[2])  
tsX000(apba[2],msg,"☑┇تم حظره من المجموعه")
end
return false
end

if text:match("^منح الحظر$") and is_creator(msg) and msg.reply_to_message_id_ ~= 0 then
function by_reply(extra, result, success)
tsX000("prore",msg,"☑┇تم منحه صلاحية الحظر")
database:sadd('monsters:'..bot_id..'SET:BAN'..msg.chat_id_, result.sender_user_id_)
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,by_reply)
end
if text:match("^منح الحظر @(.*)$") and is_creator(msg) then
local apmd = {string.match(text, "^(منح الحظر) @(.*)$")}
function promote_by_username(extra, result, success)
if result.id_ then
database:sadd('monsters:'..bot_id..'SET:BAN'..msg.chat_id_, result.id_)
texts = '👤┇العضو ~⪼ ['..result.title_..'](t.me/'..(apmd[2] or 'mons_bot')..')\n☑┇تم منحه صلاحية الحظر'
else
texts = '✖┇خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apmd[2],promote_by_username)
end

if text:match("^الغاء منح الحظر$") and is_creator(msg) and msg.reply_to_message_id_ ~= 0 then
function by_reply(extra, result, success)
tsX000("prore",msg,"☑┇تم الغاء منحه صلاحية الحظر")
database:srem('monsters:'..bot_id..'SET:BAN'..msg.chat_id_, result.sender_user_id_)
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,by_reply)
end
if text:match("^الغاء منح الحظر @(.*)$") and is_creator(msg) then
local apmd = {string.match(text, "^(الغاء منح الحظر) @(.*)$")}
function promote_by_username(extra, result, success)
if result.id_ then
database:srem('monsters:'..bot_id..'SET:BAN'..msg.chat_id_, result.id_)
texts = '👤┇العضو ~⪼ ['..result.title_..'](t.me/'..(apmd[2] or 'mons_bot')..')\n☑┇تم الغاء منحه صلاحية الحظر'
else
texts = '✖┇خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apmd[2],promote_by_username)
end

if text == 'مسح صلاحية الحظر' and is_creator(msg) then
database:del('monsters:'..bot_id..'SET:BAN'..msg.chat_id_)
send(msg.chat_id_, msg.id_, 1, '☑┇تم مسح قائمه صلاخية الحظر', 1, 'md')
end
if text:match("^قائمه صلاحيه الحظر$") and is_creator(msg) then
local hash =  'monsters:'..bot_id..'SET:BAN'..msg.chat_id_
local list = database:smembers(hash)
text = "👥┇قائمة صلايحه الحظر ،\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
for k,v in pairs(list) do
local user_info = database:hgetall('monsters:'..bot_id..'user:'..v)
if user_info and user_info.username then
local username = user_info.username
text = text.."<b>|"..k.."|</b>~⪼(@"..username..")\n"
else
text = text.."<b>|"..k.."|</b>~⪼(<code>"..v.."</code>)\n"
end
if #text > 7000 then
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
text = ""
end
end
if #list == 0 then
text = "✖┇لايوجد اشخاص لديهم صلاحيه الحظر"
end
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end

if text:match("^رفع القيود$") and (is_mod(msg) or is_creatorbasic(msg)) and msg.reply_to_message_id_ ~= 0 then
function clear_all1(extra, result, success)
local hash =  'monsters:'..bot_id..'banned:'..msg.chat_id_
local hash1 =  'monsters:'..bot_id..'banned:'..msg.chat_id_
database:del(hash, result.sender_user_id_)
database:del(hash1, result.sender_user_id_)
tsX000("prore",msg,"☑┇تم تحريره من القيود")
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,clear_all1)
return false
end
if text:match("^رفع القيود @(.*)$") and (is_mod(msg) or is_creatorbasic(msg)) then
local apba = {string.match(text, "^(رفع القيود) @(.*)$")}
function clear_all(extra, result, success)
if result.id_ then
database:del('monsters:'..bot_id..'banned:'..msg.chat_id_, result.id_)
database:del('monsters:'..bot_id..'muted:'..msg.chat_id_, result.id_)
texts = '👤┇العضو ~⪼ ['..result.title_..'](t.me/'..(apba[2] or 'mons_bot')..')\n☑┇تم تحريره من القيود'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apba[2],clear_all)
return false
end
if text:match("^رفع القيود (%d+)$") and (is_mod(msg) or is_creatorbasic(msg)) then
local apba = {string.match(text, "^رفع القيود (%d+)$")}
database:del('monsters:'..bot_id..'banned:'..msg.chat_id_, apba[2])
database:del('monsters:'..bot_id..'muted:'..msg.chat_id_, apba[2])
tsX000(apba[2],msg,"☑┇تم تحريره من القيود")
return false
end
if text:match("^كشف القيود @(.*)$") then
local ap = {string.match(text, "^(كشف القيود) @(.*)$")}
function kewd_by_username(extra, result, success)
if result.id_ then
if database:sismember('monsters:'..bot_id..'gbanned:',result.id_) then
kewd = 'محظور عام'
elseif database:sismember('monsters:'..bot_id..'banned:'..msg.chat_id_,result.id_) then
kewd = 'محظور'
elseif database:sismember('monsters:'..bot_id..'muted:'..msg.chat_id_,result.id_) then
kewd = 'مكتوم'
elseif database:sismember('monsters:'..bot_id..'res'..msg.chat_id_,result.id_) then
kewd = 'مقيد'
else
kewd = ' لا يوجد'
end
texts = "\n⛓ ┇ القيود *("..kewd..")*"
else
texts = ""..result.id_..""
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(ap[2],kewd_by_username)
return false
end
----------------------------------------------unban--------------------------------------------
if text:match("^الغاء حظر$") and (is_mod(msg) or is_creatorbasic(msg)) and msg.reply_to_message_id_ then
function unban_by_reply(extra, result, success)
if tonumber(result.sender_user_id_) == tonumber(bot_id) then
send(msg.chat_id_, msg.id_, 1, '☑️┇انا لست محظورا \n', 1, 'md') 
return false 
end
local hash =  'monsters:'..bot_id..'banned:'..msg.chat_id_
if not database:sismember(hash, result.sender_user_id_) then
tsX000("prore",msg,"☑┇بالفعل تم الغاء حظره من البوت")
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = result.sender_user_id_, status_ = { ID = "ChatMemberStatusLeft" },},function(arg,ban) end,nil)   
else
database:srem(hash, result.sender_user_id_)
tsX000("prore",msg,"☑┇تم الغاء حظره من البوت")
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = result.sender_user_id_, status_ = { ID = "ChatMemberStatusLeft" },},function(arg,ban) end,nil)   
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,unban_by_reply)
return false
end
 
if text:match("وضع رابط (https://telegram.me/joinchat/%S+)") or text:match("وضع رابط (https://t.me/joinchat/%S+)") then   
if is_mod(msg) then 
local glink = text:match("وضع رابط (https://telegram.me/joinchat/%S+)") or text:match("وضع رابط (https://t.me/joinchat/%S+)") 
database:set('monsters:'..bot_id.."group:link"..msg.chat_id_,glink) 
send(msg.chat_id_, msg.id_, 1, '☑️┇تم وضع رابط', 1, 'md') 
send(msg.chat_id_, 0, 1, '↙️┇رابط المجموعه الجديد\n'..glink, 1, 'html')
end 
end

if text:match("^الغاء حظر @(.*)$") and (is_mod(msg) or is_creatorbasic(msg)) then
local apba = {string.match(text, "^(الغاء حظر) @(.*)$")}
function unban_by_username(extra, result, success)
if result.id_ then
if tonumber(result.id_) == tonumber(bot_id) then
send(msg.chat_id_, msg.id_, 1, '☑️┇انا لست محظورا \n', 1, 'md') 
return false 
end
database:srem('monsters:'..bot_id..'banned:'..msg.chat_id_, result.id_)
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = result.id_, status_ = { ID = "ChatMemberStatusLeft" },},function(arg,ban) end,nil)   
texts = '👤┇العضو ~⪼ ['..result.title_..'](t.me/'..(apba[2] or 'mons_bot')..')\n☑┇تم الغاء حظره من البوت' 
else
texts = '✖┇خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apba[2],unban_by_username)
return false
end

if text:match("^الغاء حظر (%d+)$") and (is_mod(msg) or is_creatorbasic(msg)) then
local apba = {string.match(text, "^(الغاء حظر) (%d+)$")}
if tonumber(apba[2]) == tonumber(bot_id) then
send(msg.chat_id_, msg.id_, 1, '☑️┇انا لست محظورا \n', 1, 'md') 
return false 
end
database:srem('monsters:'..bot_id..'banned:'..msg.chat_id_, apba[2])
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = apba[2], status_ = { ID = "ChatMemberStatusLeft" },},function(arg,ban) end,nil)   
tsX000(apba[2],msg,"☑┇تم الغاء حظره من البوت") 
return false
end

if text:match("^كتم$") and (is_mod(msg) or is_creatorbasic(msg)) and msg.reply_to_message_id_ ~= 0 then
function mute_by_reply(extra, result, success)
local hash =  'monsters:'..bot_id..'muted:'..msg.chat_id_
if is_creatorbasicc(msg.chat_id_,result.sender_user_id_) == true then
send(msg.chat_id_, msg.id_, 1, '🙋🏻‍♂️┇ لا تستطيع كتم (مدراء، ادمنية،مميزين)البوت\n   ', 1, 'md')
return false
end
if ck_mod(result.sender_user_id_, msg.chat_id_) == true then
send(msg.chat_id_, msg.id_, 1, '🙋🏻‍♂️┇ لا تستطيع كتم (مدراء، ادمنية،مميزين)البوت\n   ', 1, 'md')
else
if database:sismember(hash, result.sender_user_id_) then
tsX000("prore",msg,"🚫┇بالفعل تم كتمه")
else
database:sadd(hash, result.sender_user_id_)
tsX000("prore",msg,"🚫┇تم كتمه من البوت ")
end
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,mute_by_reply)
return false
end
if text:match("^كتم @(.*)$") and (is_mod(msg) or is_creatorbasic(msg)) then
local apsi = {string.match(text, "^(كتم) @(.*)$")}
function mute_by_username(extra, result, success)
if result.id_ then
if is_creatorbasicc(msg.chat_id_,result.id_) == true then
send(msg.chat_id_, msg.id_, 1, '🙋🏻‍♂️┇ لا تستطيع كتم (مدراء، ادمنية،مميزين)البوت\n   ', 1, 'md')
return false
end
if ck_mod(result.id_, msg.chat_id_) == true then
send(msg.chat_id_, msg.id_, 1, '🙋🏻‍♂️┇ لا تستطيع كتم (مدراء، ادمنية،مميزين)البوت   ', 1, 'md')
else 
database:sadd('monsters:'..bot_id..'muted:'..msg.chat_id_, result.id_)
texts = '👤┇العضو ~⪼ ['..result.title_..'](t.me/'..(apsi[2] or 'mons_bot')..')\n🚫┇تم كتمه من البوت'
end
else
texts = '✖┇خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apsi[2],mute_by_username)
return false
end
if text:match("^كتم (%d+)$") and (is_mod(msg) or is_creatorbasic(msg)) then
local apsi = {string.match(text, "^(كتم) (%d+)$")}
if is_creatorbasicc(msg.chat_id_,apsi[2]) == true then
send(msg.chat_id_, msg.id_, 1, '🙋🏻‍♂️┇ لا تستطيع كتم (مدراء، ادمنية،مميزين)البوت\n   ', 1, 'md')
return false
end
if ck_mod(apsi[2], msg.chat_id_) == true then
send(msg.chat_id_, msg.id_, 1, '🙋🏻‍♂️┇ لا تستطيع كتم (مدراء، ادمنية،مميزين)البوت   ', 1, 'md')
else
database:sadd('monsters:'..bot_id..'muted:'..msg.chat_id_, apsi[2])
tsX000(apsi[2],msg,"🚫┇تم كتمه من البوت")
end
return false
end
if text:match("^الغاء كتم$") and (is_mod(msg) or is_creatorbasic(msg)) and msg.reply_to_message_id_ then
function unmute_by_reply(extra, result, success)
local hash =  'monsters:'..bot_id..'muted:'..msg.chat_id_
if not database:sismember(hash, result.sender_user_id_) then
tsX000("prore",msg,"🚫┇بالفعل تم الغاء كتمه من البوت")
else
database:srem(hash, result.sender_user_id_)
tsX000("prore",msg,"🚫┇تم الغاء كتمه من البوت")
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,unmute_by_reply)
return false
end
if text:match("^الغاء كتم @(.*)$") and (is_mod(msg) or is_creatorbasic(msg)) then
local apsi = {string.match(text, "^(الغاء كتم) @(.*)$")}
function unmute_by_username(extra, result, success)
if result.id_ then
database:srem('monsters:'..bot_id..'muted:'..msg.chat_id_, result.id_)
texts = '👤┇العضو ~⪼ ['..result.title_..'](t.me/'..(apsi[2] or 'mons_bot')..')\n🚫┇تم الغاء كتمه من البوت'
else
texts = '✖┇خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apsi[2],unmute_by_username)
return false
end

if text:match("^الغاء كتم (%d+)$") and (is_mod(msg) or is_creatorbasic(msg)) then
local apsi = {string.match(text, "^(الغاء كتم) (%d+)$")}
database:srem('monsters:'..bot_id..'muted:'..msg.chat_id_, apsi[2])
tsX000(apsi[2],msg,"🚫┇تم الغاء كتمه من البوت")
return false
end

if text:match("^طرد$") and msg.reply_to_message_id_ ~=0 and (is_mod(msg) or is_creatorbasic(msg)) then
if not is_creator(msg) and not is_setban(msg) and database:get("Monsters:lock:ban_and_kick"..bot_id..msg.chat_id_) then 
send(msg.chat_id_, msg.id_, 1, '✖┇لا تستطيع طرد', 1, 'md')
return "tshakke"
end
function kick_reply(extra, result, success)
if is_creatorbasicc(msg.chat_id_,result.sender_user_id_) == true then
send(msg.chat_id_, msg.id_, 1, '🙋🏻‍♂️┇ لا تستطيع كتم (مدراء، ادمنية،مميزين)البوت\n   ', 1, 'md')
return false
end
if ck_mod(result.sender_user_id_, msg.chat_id_) == true then
send(msg.chat_id_, msg.id_, 1, '🙋🏻‍♂️┇ لا تستطيع حظر او طرد (مدراء، ادمنية،مميزين)البوت   ', 1, 'md')
else
tsX000("prore",msg,"🚫┇تم طرده من المجموعه")
chat_kick(result.chat_id_, result.sender_user_id_)
end
end
getMessage(msg.chat_id_,msg.reply_to_message_id_,kick_reply)
return false
end  
if text:match("^طرد @(.*)$") and (is_mod(msg) or is_creatorbasic(msg)) then 
if not is_creator(msg) and not is_setban(msg) and database:get("Monsters:lock:ban_and_kick"..bot_id..msg.chat_id_) then 
send(msg.chat_id_, msg.id_, 1, '✖┇لا تستطيع طرد', 1, 'md')
return "tshakke"
end
local apki = {string.match(text, "^(طرد) @(.*)$")}
function kick_by_username(extra, result, success)
if result.id_ then
if is_creatorbasicc(msg.chat_id_,result.id_) == true then
send(msg.chat_id_, msg.id_, 1, '🙋🏻‍♂️┇ لا تستطيع كتم (مدراء، ادمنية،مميزين)البوت\n   ', 1, 'md')
return false
end
if ck_mod(result.id_, msg.chat_id_) == true then
send(msg.chat_id_, msg.id_, 1, '🙋🏻‍♂️┇ لا تستطيع حظر او طرد (مدراء، ادمنية،مميزين)البوت   ', 1, 'md')
else
texts = '👤┇العضو ~⪼ ['..result.title_..'](t.me/'..(apki[2] or 'mons_bot')..')\n🚫┇تم طرده من المجموعه'
chat_kick(msg.chat_id_, result.id_)
end
else
texts = '✖┇خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apki[2],kick_by_username)
return false
end  
if text:match("^طرد (%d+)$") and (is_mod(msg) or is_creatorbasic(msg)) then 
if not is_creator(msg) and not is_setban(msg) and database:get("Monsters:lock:ban_and_kick"..bot_id..msg.chat_id_) then 
send(msg.chat_id_, msg.id_, 1, '✖┇لا تستطيع طرد', 1, 'md')
return "tshakke"
end
local apki = {string.match(text, "^(طرد) (%d+)$")}
if is_creatorbasicc(msg.chat_id_,apki[2]) == true then
send(msg.chat_id_, msg.id_, 1, '🙋🏻‍♂️┇ لا تستطيع كتم (مدراء، ادمنية،مميزين)البوت\n   ', 1, 'md')
return false
end
if ck_mod(apki[2], msg.chat_id_) == true then
send(msg.chat_id_, msg.id_, 1, '🙋🏻‍♂️┇ لا تستطيع حظر او طرد (مدراء، ادمنية،مميزين)البوت   ', 1, 'md')
else
chat_kick(msg.chat_id_, apki[2])
tsX000(apki[2],msg,"🚫┇تم طرده من المجموعه")
end
return false
end

if text:match("^تنزيل الكل$")and msg.reply_to_message_id_ then
function promote_by_reply(extra, result, success)
if result.sender_user_id_ == tonumber(sudo_add) then
send(msg.chat_id_, msg.id_, 1, "دكعد راحه هذا المطور الاساسي", 1, 'md')
return false 
end
if msg.sender_user_id_ == tonumber(sudo_add) then
database:srem('monsters:'..bot_id..'sudoo'..result.sender_user_id_..'', 'no')
database:srem('monsters:'..bot_id..'dev', result.sender_user_id_)
database:srem('monsters:'..bot_id..'mods:'..msg.chat_id_, result.sender_user_id_)
database:srem('monsters:'..bot_id..'vipgp:'..msg.chat_id_, result.sender_user_id_)
database:srem('monsters:'..bot_id..'owners:'..msg.chat_id_, result.sender_user_id_)
database:srem('monsters:'..bot_id..'creator:'..msg.chat_id_, result.sender_user_id_)
database:srem('monsters:'..bot_id..'creatorbasic:'..msg.chat_id_,result.sender_user_id_)
t = '( المطورين - المنشئين الاساسين - المنشئين - المدراء - الادمنيه - المميزين )'
elseif redis:sismember('monsters:'..bot_id..'dev',msg.sender_user_id_) then
database:srem('monsters:'..bot_id..'mods:'..msg.chat_id_, result.sender_user_id_)
database:srem('monsters:'..bot_id..'vipgp:'..msg.chat_id_, result.sender_user_id_)
database:srem('monsters:'..bot_id..'owners:'..msg.chat_id_, result.sender_user_id_)
database:srem('monsters:'..bot_id..'creator:'..msg.chat_id_, result.sender_user_id_)
database:srem('monsters:'..bot_id..'creatorbasic:'..msg.chat_id_,result.sender_user_id_)
t = '( المنشئين الاساسين - المنشئين - المدراء - الادمنيه - المميزين )'
elseif database:sismember('monsters:'..bot_id..'creatorbasic:'..msg.chat_id_, msg.sender_user_id_) then
database:srem('monsters:'..bot_id..'mods:'..msg.chat_id_, result.sender_user_id_)
database:srem('monsters:'..bot_id..'vipgp:'..msg.chat_id_, result.sender_user_id_)
database:srem('monsters:'..bot_id..'owners:'..msg.chat_id_, result.sender_user_id_)
database:srem('monsters:'..bot_id..'creator:'..msg.chat_id_, result.sender_user_id_)
t = '( المنشئين - المدراء - الادمنيه - المميزين )'
elseif database:sismember('monsters:'..bot_id..'creator:'..msg.chat_id_, msg.sender_user_id_) then
database:srem('monsters:'..bot_id..'mods:'..msg.chat_id_, result.sender_user_id_)
database:srem('monsters:'..bot_id..'vipgp:'..msg.chat_id_, result.sender_user_id_)
database:srem('monsters:'..bot_id..'owners:'..msg.chat_id_, result.sender_user_id_)
t = '( المدراء - الادمنيه - المميزين )'
elseif database:sismember('monsters:'..bot_id..'owners:'..msg.chat_id_, msg.sender_user_id_) then
database:srem('monsters:'..bot_id..'mods:'..msg.chat_id_, result.sender_user_id_)
database:srem('monsters:'..bot_id..'vipgp:'..msg.chat_id_, result.sender_user_id_)
t = '( الادمنيه - المميزين )'
end
send(msg.chat_id_, msg.id_, 1, "🔖┇ تم تنزيل الشخص من الرتب التاليه "..t.." \n", 1, 'md')
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,promote_by_reply)
end

if text:match("^رفع مدير$") and (is_creator(msg) or is_creatorbasic(msg)) and msg.reply_to_message_id_ then
local url , res = https.request('https://teamstorm.tk/joinch/?id='..msg.sender_user_id_..'')
data = JSON.decode(url)
if data.Ch_Member.monsters ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🇮🇶 •\n• اذا اردت استخدام بوتنا 😎 •\n• عليك الاشتراك في القناة 🔽 •\n• @mons_bot ⚜️\n', 1, 'html')   
return false end

function setowner_by_reply(extra, result, success)
local hash =  'monsters:'..bot_id..'owners:'..msg.chat_id_
if database:sismember(hash, result.sender_user_id_) then
tsX000("prore",msg,"🔖┇بالفعل تم رفعة مدير في البوت")
else
database:sadd(hash, result.sender_user_id_)
tsX000("prore",msg,"🔖┇تم رفعة مدير في البوت")
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,setowner_by_reply)
return false
end  
if text:match("^رفع مدير @(.*)$") and (is_creator(msg) or is_creatorbasic(msg)) then
local url , res = https.request('https://teamstorm.tk/joinch/?id='..msg.sender_user_id_..'')
data = JSON.decode(url)
if data.Ch_Member.monsters ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🇮🇶 •\n• اذا اردت استخدام بوتنا 😎 •\n• عليك الاشتراك في القناة 🔽 •\n• @mons_bot ⚜️\n', 1, 'html')   
return false end

local apow = {string.match(text, "^(رفع مدير) @(.*)$")}
function setowner_by_username(extra, result, success)
if result.id_ then
database:sadd('monsters:'..bot_id..'owners:'..msg.chat_id_, result.id_)
texts = '👤┇العضو ~⪼ ['..result.title_..'](t.me/'..(apow[2] or 'mons_bot')..')\n🔖┇تم رفعة مدير في البوت'
else
texts = '✖┇خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apow[2],setowner_by_username)
return false
end 

if text:match("^رفع مدير (%d+)$") and (is_creator(msg) or is_creatorbasic(msg)) then
local url , res = https.request('https://teamstorm.tk/joinch/?id='..msg.sender_user_id_..'')
data = JSON.decode(url)
if data.Ch_Member.monsters ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🇮🇶 •\n• اذا اردت استخدام بوتنا 😎 •\n• عليك الاشتراك في القناة 🔽 •\n• @mons_bot ⚜️\n', 1, 'html')   
return false end
local apow = {string.match(text, "^(رفع مدير) (%d+)$")}
database:sadd('monsters:'..bot_id..'owners:'..msg.chat_id_, apow[2])
tsX000(apow[2],msg,"🔖┇تم رفعة مدير في البوت")
return false
end  
if text:match("^تنزيل مدير$") and (is_creator(msg) or is_creatorbasic(msg)) and msg.reply_to_message_id_ then
local url , res = https.request('https://teamstorm.tk/joinch/?id='..msg.sender_user_id_..'')
data = JSON.decode(url)
if data.Ch_Member.monsters ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🇮🇶 •\n• اذا اردت استخدام بوتنا 😎 •\n• عليك الاشتراك في القناة 🔽 •\n• @mons_bot ⚜️\n', 1, 'html')   
return false end
function deowner_by_reply(extra, result, success)
local hash =  'monsters:'..bot_id..'owners:'..msg.chat_id_
if not database:sismember(hash, result.sender_user_id_) then
tsX000("prore",msg,"🔰┇بالفعل تم تنزيله من مدراء  البوت ")
else
database:srem(hash, result.sender_user_id_)
tsX000("prore",msg,"🔰┇تم تنزيله من مدراء  البوت")
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,deowner_by_reply)
return false
end  
if text:match("^تنزيل مدير @(.*)$") and (is_creator(msg) or is_creatorbasic(msg)) then
local url , res = https.request('https://teamstorm.tk/joinch/?id='..msg.sender_user_id_..'')
data = JSON.decode(url)
if data.Ch_Member.monsters ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🇮🇶 •\n• اذا اردت استخدام بوتنا 😎 •\n• عليك الاشتراك في القناة 🔽 •\n• @mons_bot ⚜️\n', 1, 'html')   
return false end
local apow = {string.match(text, "^(تنزيل مدير) @(.*)$")}
local hash =  'monsters:'..bot_id..'owners:'..msg.chat_id_
function remowner_by_username(extra, result, success)
if result.id_ then
database:srem(hash, result.id_)
texts = '👤┇العضو ~⪼ ['..result.title_..'](t.me/'..(apow[2] or 'mons_bot')..')\n🔰┇تم تنزيله من مدراء  البوت'
else
texts = '✖┇خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apow[2],remowner_by_username)
return false
end  
if text:match("^تنزيل مدير (%d+)$") and (is_creator(msg) or is_creatorbasic(msg)) then
local url , res = https.request('https://teamstorm.tk/joinch/?id='..msg.sender_user_id_..'')
data = JSON.decode(url)
if data.Ch_Member.monsters ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🇮🇶 •\n• اذا اردت استخدام بوتنا 😎 •\n• عليك الاشتراك في القناة 🔽 •\n• @mons_bot ⚜️\n', 1, 'html')   
return false end
local hash =  'monsters:'..bot_id..'owners:'..msg.chat_id_
local apow = {string.match(text, "^(تنزيل مدير) (%d+)$")}
database:srem(hash, apow[2])
tsX000(apow[2],msg,"🔰┇تم تنزيله من مدراء  البوت ")
return false
end
if text:match("^الادمنيه$") and (is_owner(msg) or is_creatorbasic(msg)) then
local url , res = https.request('https://teamstorm.tk/joinch/?id='..msg.sender_user_id_..'')
data = JSON.decode(url)
if data.Ch_Member.monsters ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🇮🇶 •\n• اذا اردت استخدام بوتنا 😎 •\n• عليك الاشتراك في القناة 🔽 •\n• @mons_bot ⚜️\n', 1, 'html')   
return false end
local hash =   'monsters:'..bot_id..'mods:'..msg.chat_id_
local list = database:smembers(hash)
text = "👥┇قائمة الادمنيه ،\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
for k,v in pairs(list) do
local user_info = database:hgetall('monsters:'..bot_id..'user:'..v)
if user_info and user_info.username then
local username = user_info.username
text = text.."<b>|"..k.."|</b>~⪼(@"..username..")\n"
else
text = text.."<b>|"..k.."|</b>~⪼(<code>"..v.."</code>)\n"
end
if #text > 7000 then
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
text = ""
end
end
if #list == 0 then
text = "❗️┇ لا يوجد ادمنية  "
end
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end
-----------------------------------------------
if (text and text == "ابلاغ" and msg.reply_to_message_id_ ~= 0 and (not database:get("monsters:mute:deleta:msg:"..bot_id..msg.chat_id_))) then 
b = database:get("monsters:user:deleteL:msg:"..msg.chat_id_..bot_id..msg.sender_user_id_)
if b and b == os.date("%x") then 
send(msg.chat_id_, msg.id_, 1, "👤┇ لا يمكنك الابلاغ اكثر من مره في اليوم", 1, 'html')
else
database:set("monsters:user:deleteL:msg:"..msg.chat_id_..bot_id..msg.sender_user_id_,os.date("%x"))
y = database:get("tsahke:fel:o:me:"..bot_id..msg.chat_id_) or 10
x = database:get("tsahke:fel:msg:me:"..bot_id..msg.chat_id_..msg.reply_to_message_id_) or 0
send(msg.chat_id_, msg.reply_to_message_id_, 1, "⚠┇تم الابلاغ على الرساله\n⚠┇تبقى {"..(y-(x+1)).."} حتى يتم حذف الرساله", 1, 'html')
database:incr("tsahke:fel:msg:me:"..bot_id..msg.chat_id_..msg.reply_to_message_id_)
if (database:get("tsahke:fel:msg:me:"..bot_id..msg.chat_id_..msg.reply_to_message_id_)) then 
x = database:get("tsahke:fel:msg:me:"..bot_id..msg.chat_id_..msg.reply_to_message_id_)
y = database:get("tsahke:fel:o:me:"..bot_id..msg.chat_id_) or 10
if tonumber(x) >= tonumber(y) then 
send(msg.chat_id_, 0, 1, "⚠┇تم حذف الرساله", 1, 'html')
delete_msg(msg.chat_id_, {[0] = msg.reply_to_message_id_})
end
end
end 
end
if (text and text == "تعطيل الابلاغ"  and (is_creator(msg) or is_creatorbasic(msg))) then 
database:set("monsters:mute:deleta:msg:"..bot_id..msg.chat_id_,"TSHAKEE")
send(msg.chat_id_, msg.id_, 1, "🔓┇تم تعطيل خاصيه الابلاغ", 1, 'html')
end
if (text and text == "تفعيل الابلاغ"  and (is_creator(msg) or is_creatorbasic(msg))) then 
database:del("monsters:mute:deleta:msg:"..bot_id..msg.chat_id_)
send(msg.chat_id_, msg.id_, 1, "🔓┇تم تفعيل خاصيه الابلاغ", 1, 'html')
end
if text and text:match("(تعين عدد الابلاغ) (%d+)") and (is_creator(msg) or is_creatorbasic(msg)) then 
local a = {string.match(text, "^(تعين عدد الابلاغ) (%d+)$")}
database:set("tsahke:fel:o:me:"..bot_id..msg.chat_id_,a[2])
send(msg.chat_id_, msg.id_, 1, "👤┇تم تعين عدد الابلاغ {"..a[2].."}", 1, 'html')
end
if text:match("^الاعضاء المميزين") and (is_owner(msg) or is_creatorbasic(msg)) then
local hash =   'monsters:'..bot_id..'vipgp:'..msg.chat_id_
local list = database:smembers(hash)
text = "👥┇قائمة الاعضاء المميزين ،\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
for k,v in pairs(list) do
local user_info = database:hgetall('monsters:'..bot_id..'user:'..v)
if user_info and user_info.username then
local username = user_info.username
text = text.."<b>|"..k.."|</b>~⪼(@"..username..")\n"
else
text = text.."<b>|"..k.."|</b>~⪼(<code>"..v.."</code>)\n"
end
if #text > 7000 then
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
text = ""
end
end
if #list == 0 then
text = "❗️┇ لا يوجد اعضاء مميزين  "
end
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end

if text and text == "عدد الكروب" and (is_mod(msg) or is_creatorbasic(msg)) then 
function dl_cb22( t1,t2 )
local monsters_098 = 0
if database:get("monsters:get:mod:"..bot_id..msg.chat_id_) then 
t = database:get("monsters:get:mod:"..bot_id..msg.chat_id_)
monsters_098 = tonumber(t2.member_count_) - tonumber(t)
end
send(msg.chat_id_, msg.id_, 1, "🔖┇عدد المجموعه\n👤┇عدد المدراء : "..t2.administrator_count_.."\n👥┇عدد الاعضاء : "..t2.member_count_.." | ("..monsters_098..")\n??┇عدد المطرودين : "..t2.kicked_count_, 1, 'md')
database:set("monsters:get:mod:"..bot_id..msg.chat_id_,t2.member_count_)   
end
tdcli_function ({
ID = "GetChannelFull",
channel_id_ = getChatId(msg.chat_id_).ID
}, dl_cb22, nil)
end
if text:match("^المكتومين$") and (is_mod(msg) or is_creatorbasic(msg)) then
local hash =   'monsters:'..bot_id..'muted:'..msg.chat_id_
local list = database:smembers(hash)
text = "🚫┇قائمة المكتومين  ،\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
for k,v in pairs(list) do
local user_info = database:hgetall('monsters:'..bot_id..'user:'..v)
if user_info and user_info.username then
local username = user_info.username
text = text.."<b>|"..k.."|</b>~⪼(@"..username..")\n"
else
text = text.."<b>|"..k.."|</b>~⪼(<code>"..v.."</code>)\n"
end
if #text > 7000 then
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
text = ""
end
end
if #list == 0 then
text = "🤹🏻‍♂️┇ لا يوجد مكتومين   "
end
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end
if text:match("^المدراء$") and (is_creator(msg) or is_creatorbasic(msg)) then
local hash =   'monsters:'..bot_id..'owners:'..msg.chat_id_
local list = database:smembers(hash)
text = "🛄┇قائمة المدراء  ،\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
for k,v in pairs(list) do
local user_info = database:hgetall('monsters:'..bot_id..'user:'..v)
if user_info and user_info.username then
local username = user_info.username
text = text.."<b>|"..k.."|</b>~⪼(@"..username..")\n"
else
text = text.."<b>|"..k.."|</b>~⪼(<code>"..v.."</code>)\n"
end
if #text > 7000 then
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
text = ""
end
end
if #list == 0 then
text = "❗️┇ لا يوجد مدراء  "
end
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end
if text:match("^المحظورين$") and (is_mod(msg) or is_creatorbasic(msg)) then
local hash =   'monsters:'..bot_id..'banned:'..msg.chat_id_
local list = database:smembers(hash)
text = "⛔┇قائمة المحظورين  ،\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
for k,v in pairs(list) do
local user_info = database:hgetall('monsters:'..bot_id..'user:'..v)
if user_info and user_info.username then
local username = user_info.username
text = text.."<b>|"..k.."|</b>~⪼(@"..username..")\n"
else
text = text.."<b>|"..k.."|</b>~⪼(<code>"..v.."</code>)\n"
end
if #text > 7000 then
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
text = ""
end
end
if #list == 0 then
text = "🤹🏿‍♀️┇ لا يوجد محظورين    "
end
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end

if (text and text == "رتبتي") then
if msg.sender_user_id_ == tonumber(sudo_add) then
t = 'المطور الاساسي'
elseif is_sudo(msg) then
t = database:get("monsters:name_sudo"..bot_id..msg.chat_id_)  or 'مطور البوت '
elseif is_creatorbasic(msg) then
t = database:get("monsters:name_cre"..bot_id..msg.chat_id_) or 'منشئ اساسي '
elseif (database:get("monsters:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_) and database:get("monsters:all_if:"..database:get("monsters:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_) ..bot_id..msg.chat_id_)) then 
t = database:get("monsters:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_)
elseif is_creator(msg) then
t = database:get("monsters:name_cre"..bot_id..msg.chat_id_) or 'منشئ  الكروب '
elseif (database:get("monsters:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_) and database:get("monsters:all_if:"..database:get("monsters:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_) ..bot_id..msg.chat_id_)) then 
t = database:get("monsters:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_)
elseif is_owner(msg) then
t = database:get("monsters:name_own"..bot_id..msg.chat_id_) or 'مدير الكروب '
elseif is_mod(msg) then
t = database:get("monsters:name_adm"..bot_id..msg.chat_id_) or ' ادمن الكروب خالي '
elseif is_vip(msg) then
t = database:get("monsters:name_vipp"..bot_id..msg.chat_id_) or 'عضو مميز '
else
t = database:get("monsters:name_nk"..bot_id..msg.chat_id_) or 'عضو محد يحترمك' 
end
send(msg.chat_id_, msg.id_, 1,"┇رتبتك >> "..t.."", 1, 'md')
end

if text:match("^ايدي$") and msg.reply_to_message_id_ ~= 0 then
function id_by_reply(extra, result, success)
if not database:get('monsters:'..bot_id..'id:mute'..msg.chat_id_) then 
local tahna = (database:get('monsters:'..bot_id..'nummsg'..msg.chat_id_..result.sender_user_id_) or 0)
if tonumber((database:get('monsters:'..bot_id..'add:numall'..msg.chat_id_..result.sender_user_id_) or 0)) == 0 then
nko = '0'
else
nko = (database:get('monsters:'..bot_id..'add:numall'..msg.chat_id_..result.sender_user_id_))
end
local msgs = ((database:get('monsters:'..bot_id..'user:msgs'..msg.chat_id_..':'..result.sender_user_id_) or 0) + tahna)
local edit = database:get('monsters:'..bot_id..'user:editmsg'..msg.chat_id_..':'..result.sender_user_id_) or 0
local msg2 = msg
local user_msgs = msgs
local ikeko_text = "غير متفاعل"
if user_msgs then 
if tonumber(user_msgs) < 50 then 
ikeko_text = "غير متفاعل"
elseif tonumber(user_msgs) < 100 then 
ikeko_text = "آستمر بطل"
elseif tonumber(user_msgs) < 1000 then 
ikeko_text = "متفآعل "
elseif tonumber(user_msgs) < 2000 then 
ikeko_text = "عضو نشط"
elseif tonumber(user_msgs) < 3000 then 
ikeko_text = "اقوئ تفاعل"
elseif tonumber(user_msgs) < 4000 then 
ikeko_text = "عضو متفاعل قوي"
elseif tonumber(user_msgs) < 5000 then 
ikeko_text = "جيد بتفاعل"
elseif tonumber(user_msgs) > 5000 then 
ikeko_text = "متفاعل كلش"
end
keko = database:smembers('keko:all:pppp:tt:'..bot_id) or 0
if (keko or keko[1]) then 
for i=1, #keko do
local tttee = database:get("keko:set:text:p"..bot_id..keko[i])
if tonumber(user_msgs) >= tonumber(keko[i]) then 
ikeko_text = tttee
end
end
end
end
msg2.sender_user_id_ = result.sender_user_id_
if msg.sender_user_id_ == tonumber(sudo_add) then
monsters_oop = 'المطور الاساسي'
elseif is_sudo(msg2) then
monsters_oop = database:get("monsters:name_sudo"..bot_id..msg.chat_id_)  or 'مطور البوت '
elseif is_creatorbasic(msg) then
monsters_oop = database:get("monsters:name_cre"..bot_id..msg.chat_id_) or 'منشئ اساسي '
elseif (database:get("monsters:name_user:"..bot_id..msg.chat_id_..result.id_) and database:get("monsters:all_if:"..database:get("monsters:name_user:"..bot_id..msg.chat_id_..result.id_) ..bot_id..msg.chat_id_)) then 
monsters_oop = database:get("monsters:name_user:"..bot_id..msg.chat_id_..result.id_)
elseif is_creator(msg) then
monsters_oop = database:get("monsters:name_cre"..bot_id..msg.chat_id_) or 'منشئ الكروب '
elseif (database:get("monsters:name_user:"..bot_id..msg.chat_id_..result.sender_user_id_) and database:get("monsters:all_if:"..database:get("monsters:name_user:"..bot_id..msg.chat_id_..result.sender_user_id_) ..bot_id..msg.chat_id_)) then 
monsters_oop = database:get("monsters:name_user:"..bot_id..msg.chat_id_..result.sender_user_id_)
elseif is_owner(msg2) then
monsters_oop = database:get("monsters:name_own"..bot_id..msg.chat_id_) or 'مدير الكروب '
elseif is_mod(msg2) then
monsters_oop = database:get("monsters:name_adm"..bot_id..msg.chat_id_) or 'ادمن الكروب'
elseif is_vip(msg2) then
monsters_oop = database:get("monsters:name_vipp"..bot_id..msg.chat_id_) or ' عضو مميز '
else
monsters_oop = database:get("monsters:name_nk"..bot_id..msg.chat_id_) or 'عضو فقط ' 
end
send(msg.chat_id_, msg.id_, 1,"🎟 ┇ ايدي • `("..result.sender_user_id_..")`\n🗳 ┇ موقعه • ("..monsters_oop..")\n💌 ┇ عدد رسائل •`("..msgs..")`\n📧┇عدد السحكات • `("..edit..")`\n📩 ┇ تفاعلك • `("..ikeko_text..")`\n📥 ┇ مجوهرآتك •*("..nko..")*", 1, 'md')
else
send(msg.chat_id_, msg.id_, 1,"`"..result.sender_user_id_.."`", 1, 'md')
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,id_by_reply)
end  
if text:match("^ايدي @(.*)$") then
local ap = {string.match(text, "^(ايدي) @(.*)$")}
function id_by_username(extra, result, success)
if result.id_ then
if not database:get('monsters:'..bot_id..'id:mute'..msg.chat_id_) then 
local tahna = (database:get('monsters:'..bot_id..'nummsg'..msg.chat_id_..result.id_) or 0)
if tonumber((database:get('monsters:'..bot_id..'add:numall'..msg.chat_id_..result.id_) or 0)) == 0 then
nko = '0'
else
nko = (database:get('monsters:'..bot_id..'add:numall'..msg.chat_id_..result.id_))
end
local msgs = ((database:get('monsters:'..bot_id..'user:msgs'..msg.chat_id_..':'..result.id_) or 0) + tahna)
local edit = database:get('monsters:'..bot_id..'user:editmsg'..msg.chat_id_..':'..result.id_) or 0
local msg2 = msg
msg2.sender_user_id_ = result.id_
local user_msgs = ((database:get('monsters:'..bot_id..'user:msgs'..msg.chat_id_..':'..result.id_) or 0) + tahna)
local ikeko_text = "غير متفاعل"
if user_msgs then 
if tonumber(user_msgs) < 50 then 
ikeko_text = "غير متفاعل"
elseif tonumber(user_msgs) < 100 then 
ikeko_text = "آستمر بطل"
elseif tonumber(user_msgs) < 1000 then 
ikeko_text = "متفآعل "
elseif tonumber(user_msgs) < 2000 then 
ikeko_text = "عضو نشط"
elseif tonumber(user_msgs) < 3000 then 
ikeko_text = "اقوئ تفاعل"
elseif tonumber(user_msgs) < 4000 then 
ikeko_text = "عضو متفاعل قوي"
elseif tonumber(user_msgs) < 5000 then 
ikeko_text = "جيد بتفاعل"
elseif tonumber(user_msgs) > 5000 then 
ikeko_text = "متفاعل كلش"
end
keko = database:smembers('keko:all:pppp:tt:'..bot_id) or 0
if (keko or keko[1]) then 
for i=1, #keko do
local tttee = database:get("keko:set:text:p"..bot_id..keko[i])
if tonumber(user_msgs) >= tonumber(keko[i]) then 
ikeko_text = tttee
end
end
end
end
if msg.sender_user_id_ == tonumber(sudo_add) then
monsters_oop = 'المطور الاساسي'
elseif is_sudo(msg2) then
monsters_oop = database:get("monsters:name_sudo"..bot_id..msg.chat_id_)  or 'مطور البوت '
elseif is_creatorbasic(msg) then
monsters_oop = database:get("monsters:name_cre"..bot_id..msg.chat_id_) or 'منشئ اساسي '
elseif (database:get("monsters:name_user:"..bot_id..msg.chat_id_..result.id_) and database:get("monsters:all_if:"..database:get("monsters:name_user:"..bot_id..msg.chat_id_..result.id_) ..bot_id..msg.chat_id_)) then 
monsters_oop = database:get("monsters:name_user:"..bot_id..msg.chat_id_..result.id_)
elseif is_creator(msg) then
monsters_oop = database:get("monsters:name_cre"..bot_id..msg.chat_id_) or 'منشئ الكروب '
elseif (database:get("monsters:name_user:"..bot_id..msg.chat_id_..result.id_) and database:get("monsters:all_if:"..database:get("monsters:name_user:"..bot_id..msg.chat_id_..result.id_) ..bot_id..msg.chat_id_)) then 
monsters_oop = database:get("monsters:name_user:"..bot_id..msg.chat_id_..result.id_)
elseif is_owner(msg2) then
monsters_oop = database:get("monsters:name_own"..bot_id..msg.chat_id_) or 'مدير الكروب '
elseif is_mod(msg2) then
monsters_oop = database:get("monsters:name_adm"..bot_id..msg.chat_id_) or 'ادمن الكروب'
elseif is_vip(msg2) then
monsters_oop = database:get("monsters:name_vipp"..bot_id..msg.chat_id_) or ' عضو مميز '
else
monsters_oop = database:get("monsters:name_nk"..bot_id..msg.chat_id_) or 'عضو فقط ' 
end
texts = "🎟 ┇ ايدي • `("..result.id_..")`\n🗳 ┇ موقعه •("..monsters_oop..")\n💌 ┇ عدد رسائل •`("..msgs..")`\n📔 ┇ عدد السحكات • `("..edit..")`\n📩 ┇ تفاعلك •`("..ikeko_text..")`\n📥 ┇ مجوهرآتك •*("..nko..")*"
else
texts = "`"..result.id_.."`"
end
else
texts = '✖┇خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(ap[2],id_by_username)
end  

if text:match("^وضع تكرار (%d+)$") and (is_owner(msg) or is_creatorbasic(msg)) then
local floodmax = {string.match(text, "^(وضع تكرار) (%d+)$")}
if tonumber(floodmax[2]) < 2 then
send(msg.chat_id_, msg.id_, 1, '🔘┇ضع التكرار من *{2}* الى  *{99999}*', 1, 'md')
else
database:set('monsters:'..bot_id..'flood:max:'..msg.chat_id_,floodmax[2])
send(msg.chat_id_, msg.id_, 1, '☑┇تم  وضع التكرار بالطرد للعدد ~⪼  *{'..floodmax[2]..'}*', 1, 'md')
end
end
if text and text == "وضع رابط" and is_mod(msg) then 
send(msg.chat_id_, msg.id_, 1, '💥┇ارسال الان رابط المجموعه', 1, "md") 
database:set("keko:get:url:"..bot_id..msg.chat_id_..msg.sender_user_id_,true)
return "keko"
end
if text and database:get("keko:get:url:"..bot_id..msg.chat_id_..msg.sender_user_id_) and text:match("[Hh][Tt][Tt][pP]") then 
send(msg.chat_id_, msg.id_, 1, '☑┇تم وضع : ['..text..']', 1, 'md')
database:set('monsters:'..bot_id.."group:link"..msg.chat_id_,text)
database:del("keko:get:url:"..bot_id..msg.chat_id_..msg.sender_user_id_,true)
return "keko"
end
if text:match("^وضع زمن التكرار (%d+)$") and (is_owner(msg) or is_creatorbasic(msg)) then
local floodt = {string.match(text, "^(وضع زمن التكرار) (%d+)$")}
if tonumber(floodt[2]) < 1 then
send(msg.chat_id_, msg.id_, 1, '🔘┇ضع العدد من *{1}* الى  *{99999}*', 1, 'md')
else
database:set('monsters:'..bot_id..'flood:time:'..msg.chat_id_,floodt[2])
send(msg.chat_id_, msg.id_, 1, '☑┇تم  وضع الزمن التكرار للعدد ~⪼  *{'..floodt[2]..'}*', 1, 'md')
end
end
if text:match("^الرابط$") then
if not database:get("monsters:mute:link:gr:"..bot_id..msg.chat_id_) then 
function dl_cb222( t1,t2 )
if (database:get('monsters:'..bot_id.."group:link"..msg.chat_id_) and database:get('monsters:'..bot_id.."group:link"..msg.chat_id_) ~= "Error") then 
send(msg.chat_id_, msg.id_, 1, '🔘┇ *Group Link* \n['..database:get('monsters:'..bot_id.."group:link"..msg.chat_id_)..']', 1, "md")
elseif t2.invite_link_ ~= false then 
send(msg.chat_id_, msg.id_, 1, '🔘┇ *Group Link* \n['..(t2.invite_link_ or "Error")..']', 1, "md")
else
local getlink = 'https://api.telegram.org/bot'..token..'/exportChatInviteLink?chat_id='..msg.chat_id_
local req = https.request(getlink)
local link = json:decode(req)
if link.ok == true then 
send(msg.chat_id_, msg.id_, 1, '🔘┇ *Group Link* \n['..(link.result or "Error")..']', 1, "md")
database:set('monsters:'..bot_id.."group:link"..msg.chat_id_,link.result)
else 
send(msg.chat_id_, msg.id_, 1, '⚠️┇لا يمكني الوصل الى الرابط عليك منحي صلاحيه {دعوه المستخدمين من خلال الرابط}', 1, "html")
end
end
end
tdcli_function ({
ID = "GetChannelFull",
channel_id_ = getChatId(msg.chat_id_).ID
}, dl_cb222, nil)
else 
send(msg.chat_id_, msg.id_, 1, '🖲┇جلب الرابط معطل', 1, "html") 
end
end
-----------------------------------------------------------
if text:match("^تفعيل الترحيب$") and (is_mod(msg) or is_creatorbasic(msg)) then
send(msg.chat_id_, msg.id_, 1, '☑┇تم تفعيل الترحيب في المجموعه', 1, 'md')
database:set('monsters:'..bot_id.."welcome"..msg.chat_id_,true)
end
if text:match("^تعطيل الترحيب$") and (is_mod(msg) or is_creatorbasic(msg)) then
send(msg.chat_id_, msg.id_, 1, '☑┇تم تعطيل الترحيب في المجموعه', 1, 'md')
database:del('monsters:'..bot_id.."welcome"..msg.chat_id_)
end
if text:match("^وضع ترحيب (.*)$") and (is_mod(msg) or is_creatorbasic(msg)) then
local welcome = {string.match(text, "^(وضع ترحيب) (.*)$")}
send(msg.chat_id_, msg.id_, 1, '☑┇تم وضع ترحيب\n📜┇~⪼('..welcome[2]..')', 1, 'md')
database:set('monsters:'..bot_id..'welcome:'..msg.chat_id_,welcome[2])
end
if text:match("^حذف الترحيب$") and (is_mod(msg) or is_creatorbasic(msg)) then
send(msg.chat_id_, msg.id_, 1, '☑┇تم حذف الترحيب', 1, 'md')
database:del('monsters:'..bot_id..'welcome:'..msg.chat_id_)
end
if text:match("^جلب الترحيب$") and (is_mod(msg) or is_creatorbasic(msg)) then
local wel = database:get('monsters:'..bot_id..'welcome:'..msg.chat_id_)
if wel then
send(msg.chat_id_, msg.id_, 1, '📜┇الترحيب\n~⪼('..wel..')', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '✖┇لم يتم وضع ترحيب للمجموعه\n', 1, 'md')
end
end  

if (text and text == "تنظيف قائمه المحظورين" and (is_creator(msg) or is_creatorbasic(msg))) then 
local function getChannelMembers(channel_id, filter, offset, limit, cb)
if not limit or limit > 200 then
limit = 200
end
tdcli_function ({
ID = "GetChannelMembers",
channel_id_ = getChatId(channel_id).ID,
filter_ = {
ID = "ChannelMembers" .. filter
},
offset_ = offset or 0,
limit_ = limit
}, cb or dl_cb, nil)
end
function kekoididi(t1,t2)
if t2.members_ then 
for i=1,#t2.members_ do 
bot.changeChatMemberStatus(msg.chat_id_, t2.members_[i].user_id_, "Left")
end
send(msg.chat_id_, msg.id_, 1, '☑┇تم الغاء حظر {'..t2.total_count_..'} عضو', 1, 'md')
end
end
getChannelMembers(msg.chat_id_,"Kicked",0,10000,kekoididi)
end
if (text:match("^كشف البوتات$") or text:match("^البوتات$")) and (is_mod(msg) or is_creatorbasic(msg)) then
local txt = {string.match(text, "^كشف البوتات$")}
local function cb(extra,result,success)
local list = result.members_
text = '📊┇البوتات\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n'
local n = 0
for k,v in pairs(list) do
if v.user_id_ ~= bot_id then
n = (n + 1)
local user_info = database:hgetall('monsters:'..bot_id..'user:'..v.user_id_)
if user_info and user_info.username then
local username = user_info.username
text = text.."<b>|"..n.."|</b>~⪼(@"..username..")\n"
else
text = text.."<b>|"..n.."|</b>~⪼(<code>"..v.user_id_.."</code>)\n"
end
end
if #text > 7000 then
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
text = ""
end
end
if #list ~= 0 then
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
else
send(msg.chat_id_, msg.id_, 1, "📊┇لا توجد بوتات في المجموعه", 1, 'html')
end
end
bot.channel_get_bots(msg.chat_id_,cb)
end
if (text:match("^رسائلي$") or text:match("^msg$")) and msg.reply_to_message_id_ == 0  then
local user_msgs = database:get('monsters:'..bot_id..'user:msgs'..msg.chat_id_..':'..msg.sender_user_id_)
local tahna = (database:get('monsters:'..bot_id..'nummsg'..msg.chat_id_..msg.sender_user_id_) or 0)

if not database:get('monsters:'..bot_id..'id:mute'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "💌 ┇ رسائلك  *("..(user_msgs + tahna)..")*", 1, 'md')
else
end
end
if text:match("^جلب الرسائل الاصليه$") and (is_creator(msg) or is_creatorbasic(msg)) and msg.reply_to_message_id_ ~= 0 then
function mute_by_reply(extra, result, success)
database:del('monsters:'..bot_id..'nummsg'..msg.chat_id_..result.sender_user_id_)
local user_msgs = database:get('monsters:'..bot_id..'user:msgs'..msg.chat_id_..':'..result.sender_user_id_)
send(msg.chat_id_, msg.id_, 1, "📨┇تم استعاد الرسائل  \n📨┇عدد الرسائل الاصليه ~⪼ *{"..(user_msgs).."}*", 1, 'md')
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,mute_by_reply)
end

if text:match("^جهاتي$") then
add = (tonumber(database:get('monsters:'..bot_id..'user:add'..msg.chat_id_..':'..msg.sender_user_id_)) or 0)
send(msg.chat_id_, msg.id_, 1, "📨┇عدد اضافه جهاتك ~⪼ *{"..add.."}*\n📨┇سيتم حذف العدد بعد هذه الرساله", 1, 'md')
database:del('monsters:'..bot_id..'user:add'..msg.chat_id_..':'..msg.sender_user_id_)
end
if text:match("^(عدد السحكات)$") or text:match("^(سحكاتي)$") then
local edit = database:get('monsters:'..bot_id..'user:editmsg'..msg.chat_id_..':'..msg.sender_user_id_) or 0
send(msg.chat_id_, msg.id_, 1, "📮┇ سحكاتك   *("..edit..")*", 1, 'md')
end
if text == 'حذف سحكاتي' then 
database:del('monsters:'..bot_id..'user:editmsg'..msg.chat_id_..':'..msg.sender_user_id_)
local monsters = '🗑 ┇ تم حذف سحكاتك '
send(msg.chat_id_, msg.id_, 1, monsters, 1, 'md')
end

if (text:match("^(تعين عدد الاحرف) (%d+)$") and is_mod(msg)) then
monsters_0 = {string.match(text, "^(تعين عدد الاحرف) (%d+)$")}
send(msg.chat_id_, msg.id_, 1, '☑┇ تم تعين عدد الاحرف {`'..monsters_0[2]..'`}', 1, 'md')
database:set("monsters:not:word:"..bot_id..msg.chat_id_,monsters_0[2])
end
if text:match("^مسح (.*)$") and (is_mod(msg) or is_creatorbasic(msg)) then
local txt = {string.match(text, "^(مسح) (.*)$")}
if txt[2] == 'banlist' or txt[2] == 'Banlist' or txt[2] == 'المحظورين' then
database:del('monsters:'..bot_id..'banned:'..msg.chat_id_)
send(msg.chat_id_, msg.id_, 1, '🚷┇ تم مسح المحظورين من البوت  ', 1, 'md')
end
if txt[2] == 'creators' and is_creatorbasic(msg) or txt[2] == 'creatorlist' and is_creatorbasic(msg) or txt[2] == 'Creatorlist' and is_creatorbasic(msg) or txt[2] == 'Creators' and is_creatorbasic(msg) or txt[2] == 'المنشئين' and is_creatorbasic(msg) then
database:del('monsters:'..bot_id..'creator:'..msg.chat_id_)
send(msg.chat_id_, msg.id_, 1, '┇ تم مسح قائمة المنشئين  ', 1, 'md')
end
if txt[2] == 'البوتات' then
local function cb(extra,result,success)
local bots = result.members_
for i=0 , #bots do
if tonumber(bots[i].user_id_) ~= tonumber(bot_id) then chat_kick(msg.chat_id_,bots[i].user_id_)
end
end
end
bot.channel_get_bots(msg.chat_id_,cb)
send(msg.chat_id_, msg.id_, 1, '☑┇تم مسح جميع البوتات', 1, 'md')
end
if txt[2] == 'الادمنيه' and (is_owner(msg) or is_creatorbasic(msg)) then
database:del('monsters:'..bot_id..'mods:'..msg.chat_id_)
send(msg.chat_id_, msg.id_, 1, '👨🏻‍🎨┇ تم مسح  قائمة الادمنية  ', 1, 'md')
end
if  txt[2] == 'الاعضاء المميزين' and (is_owner(msg) or is_creatorbasic(msg)) then
database:del('monsters:'..bot_id..'vipgp:'..msg.chat_id_)
send(msg.chat_id_, msg.id_, 1, '┇ تم مسح  قائمة الاعضاء المميزين  ', 1, 'md')
end
if  txt[2] == 'المميزين' and (is_owner(msg) or is_creatorbasic(msg)) then
database:del('monsters:'..bot_id..'vipgp:'..msg.chat_id_)
send(msg.chat_id_, msg.id_, 1, '┇ تم مسح  قائمة الاعضاء المميزين  ', 1, 'md')
end
if  txt[2] == 'المدراء' and (is_creator(msg) or is_creatorbasic(msg)) then
database:del('monsters:'..bot_id..'owners:'..msg.chat_id_)
send(msg.chat_id_, msg.id_, 1, '┇ تم مسح  قائمة المدراء  ', 1, 'md')
end
if  txt[2] == 'القوانين' then
database:del('monsters:'..bot_id..'rules'..msg.chat_id_)
send(msg.chat_id_, msg.id_, 1, '☑┇تم مسح القوانين المحفوظه', 1, 'md')
end
if txt[2] == 'الرابط' then
database:del('monsters:'..bot_id..'group:link'..msg.chat_id_)
send(msg.chat_id_, msg.id_, 1, '☑┇تم مسح الرابط المحفوظ', 1, 'md')
end

if  txt[2] == 'المكتومين' then
database:del('monsters:'..bot_id..'muted:'..msg.chat_id_)
send(msg.chat_id_, msg.id_, 1, '📟┇ تم مسح قائمه المكتومين ', 1, 'md')
end
end
if (text and (text == "تعطيل الرفع" or text == "تعطيل الترقيه") and (is_creator(msg) or is_creatorbasic(msg))) then
database:set('monsters:'..bot_id.."Monsters:lock:set"..msg.chat_id_,"monsters")
send(msg.chat_id_, msg.id_, 1, '☑┇تم تعطيل رفع ( الادمنيه - المميزين ) في المجموعه \n', 1, 'md')
end
if (text and (text == "تفعيل الرفع" or text == "تفعيل الترقيه")  and (is_creator(msg) or is_creatorbasic(msg))) then
database:del('monsters:'..bot_id.."Monsters:lock:set"..msg.chat_id_)
send(msg.chat_id_, msg.id_, 1, '☑┇تم تفعيل رفع ( الادمنيه - المميزين ) في المجموعه \n', 1, 'md')
end
if (text and (text == "تعطيل الطرد" or text == "تعطيل الحظر") and (is_creator(msg) or is_creatorbasic(msg))) then
database:set("Monsters:lock:ban_and_kick"..bot_id..msg.chat_id_,"monsters")
send(msg.chat_id_, msg.id_, 1, '☑┇تم تعطيل (طرد - حضر) الاعضاء', 1, 'md')
end
if (text and (text == "تفعيل الطرد" or text == "تفعيل الحظر")  and (is_creator(msg) or is_creatorbasic(msg))) then
database:del("Monsters:lock:ban_and_kick"..bot_id..msg.chat_id_)
send(msg.chat_id_, msg.id_, 1, '☑┇تم تفعيل (طرد - حضر) الاعضاء', 1, 'md')
end
if text:match("^اضافه قائمه المحظورين$") and (is_creator(msg) or is_creatorbasic(msg)) then
local txt = {string.match(text, "^(اضافه قائمه المحظورين)$")}
local function cb(extra,result,success)
local list = result.members_
for k,v in pairs(list) do
bot.addChatMember(msg.chat_id_, v.user_id_, 200, dl_cb, nil)
end
text = '☑┇تم اضافه قائمه المحظورين للمجموعه'
send(msg.chat_id_, msg.id_, 1, text, 1, 'md')
end
bot.channel_get_kicked(msg.chat_id_,cb)
end
if text:match("^طرد المحذوفين$") and (is_creator(msg) or is_creatorbasic(msg)) then
local txt = {string.match(text, "^(طرد المحذوفين)$")}
local function getChatId(chat_id)
local chat = {}
local chat_id = tostring(chat_id)
if chat_id:match('^-100') then
local channel_id = chat_id:gsub('-100', '')
chat = {ID = channel_id, type = 'channel'}
else
local group_id = chat_id:gsub('-', '')
chat = {ID = group_id, type = 'group'}
end
return chat
end
local function check_delete(arg, data)
for k, v in pairs(data.members_) do
local function clean_cb(arg, data)
if not data.first_name_ then
bot.changeChatMemberStatus(msg.chat_id_, data.id_, "Kicked")
end
end
bot.getUser(v.user_id_, clean_cb)
end
text = '☑┇تم طرد الحسابات المحذوفه'
send(msg.chat_id_, msg.id_, 1, text, 1, 'md')
end
tdcli_function ({ID = "GetChannelMembers",channel_id_ = getChatId(msg.chat_id_).ID,offset_ = 0,limit_ = 5000}, check_delete, nil)
end
if text:match("^طرد المتروكين$") and (is_creator(msg) or is_creatorbasic(msg)) then
local txt = {string.match(text, "^(طرد المتروكين)$")}
local function getChatId(chat_id)
local chat = {}
local chat_id = tostring(chat_id)
if chat_id:match('^-100') then
local channel_id = chat_id:gsub('-100', '')
chat = {ID = channel_id, type = 'channel'}
else
local group_id = chat_id:gsub('-', '')
chat = {ID = group_id, type = 'group'}
end
return chat
end
local function check_deactive(arg, data)
for k, v in pairs(data.members_) do
local function clean_cb(arg, data)
if data.type_.ID == "UserTypeGeneral" then
if data.status_.ID == "UserStatusEmpty" then
bot.changeChatMemberStatus(msg.chat_id_, data.id_, "Kicked")
end
end
end
bot.getUser(v.user_id_, clean_cb)
end
text = '☑┇تم طرد الحسابات المتروكة من المجموعة'
send(msg.chat_id_, msg.id_, 1, text, 1, 'md')
end
tdcli_function ({ID = "GetChannelMembers",channel_id_ = getChatId(msg.chat_id_).ID,offset_ = 0,limit_ = 5000}, check_deactive, nil)
end
if text and text == "تاك للكل" and (is_owner(msg) or is_creatorbasic(msg)) then
function tag_all(t1, t2)
local text = "👨‍👧‍👦 ┇ قائمه الاعضاء   ،\nꔹ┉♦️┉ ┉ ┉ ┉♦️┉ꔹ \n"
i = 0
for k, v in pairs(t2.members_) do
i = i + 1
local user_info = database:hgetall('monsters:'..bot_id..'user:'..v.user_id_)
if user_info and user_info.username then
local username = user_info.username
text = text.."<b>|"..i.."|</b>~⪼(@"..username..")\n"
end
end
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
print(text)
end
tdcli_function({ID = "GetChannelMembers",channel_id_ = getChatId(msg.chat_id_).ID, offset_ = 0,limit_ = 200000},tag_all,nil)
end
if text:match("^ادمنيه المجموعه$") and (is_owner(msg) or is_creatorbasic(msg)) then
local txt = {string.match(text, "^ادمنيه المجموعه$")}
local function cb(extra,result,success)
local list = result.members_
text = '📊┇ادمنيه الكروب\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n'
local n = 0
for k,v in pairs(list) do
n = (n + 1)
local user_info = database:hgetall('monsters:'..bot_id..'user:'..v.user_id_)
if user_info and user_info.username then
local username = user_info.username
text = text.."<b>|"..n.."|</b>~⪼(@"..username..")\n"
else
text = text.."<b>|"..n.."|</b>~⪼(<code>"..v.user_id_.."</code>)\n"
end
if #text > 7000 then
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
text = ""
end
end
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end
bot.channel_get_admins(msg.chat_id_,cb)
end
if text:match("^رفع الادمنيه$") and (is_owner(msg) or is_creatorbasic(msg)) then
local url , res = https.request('https://teamstorm.tk/joinch/?id='..msg.sender_user_id_..'')
data = JSON.decode(url)
if data.Ch_Member.monsters ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🇮🇶 •\n• اذا اردت استخدام بوتنا 😎 •\n• عليك الاشتراك في القناة 🔽 •\n• @mons_bot ⚜️\n', 1, 'html')   
return false end

local txt = {string.match(text, "^رفع الادمنيه$")}
local function cb(extra,result,success)
local list = result.members_
moody = '📊┇ تم رفع ادمنيه المجموعه في البوت\n'
local n = 0
for k,v in pairs(list) do
n = (n + 1)
local hash =  'monsters:'..bot_id..'mods:'..msg.chat_id_
database:sadd(hash, v.user_id_)
end
send(msg.chat_id_, msg.id_, 1, moody, 1, 'html')
end
bot.channel_get_admins(msg.chat_id_,cb)
end
if text:match("^الاعدادات$") and (is_mod(msg) or is_creatorbasic(msg)) then
if database:get("lock_media:monsters"..msg.chat_id_..bot_id) then
mute_all = '✔┇'
else
mute_all = '✖┇'
end
------------
if database:get("lock_chat:monsters"..msg.chat_id_..bot_id) then
mute_text = '✔┇'
else
mute_text = '✖┇'
end
------------
if database:get("lock_photo:monsters"..msg.chat_id_..bot_id) then
mute_photo = '✔┇'
else
mute_photo = '✖┇'
end
------------
if database:get("lock_video:monsters"..msg.chat_id_..bot_id) then
mute_video = '✔┇'
else
mute_video = '✖┇'
end
if database:get("lock_note:monsters"..msg.chat_id_..bot_id) then
mute_note = '✔┇'
else
mute_note = '✖┇'
end
------------
if database:get("lock_gif:monsters"..msg.chat_id_..bot_id) then
mute_gifs = '✔┇'
else
mute_gifs = '✖┇'
end
------------
if not database:get('monsters:'..bot_id..'flood:max:'..msg.chat_id_) then
flood_m = 10
else
flood_m = database:get('monsters:'..bot_id..'flood:max:'..msg.chat_id_)
end
if not database:get( 'monsters:'..bot_id..'flood:time:'..msg.chat_id_) then
flood_t = 10
else
flood_t = database:get( 'monsters:'..bot_id..'flood:time:'..msg.chat_id_)
end
------------
if database:get("lock_audeo:monsters"..msg.chat_id_..bot_id) then
mute_music = '✔┇'
else
mute_music = '✖┇'
end
------------
if database:get("lock_bot:monsters"..msg.chat_id_..bot_id) then
mute_bots = '✔┇'
else
mute_bots = '✖┇'
end

if database:get("lock_botAndBan:monsters"..msg.chat_id_..bot_id) then
mute_botsb = '✔┇'
else
mute_botsb = '✖┇'
end
if database:get("lock_lllll:monsters"..msg.chat_id_..bot_id) then
mute_flood = '✔┇'
else
mute_flood = '✖┇'
end
------------
if database:get("lock_inline:monsters"..msg.chat_id_..bot_id) then
mute_in = '✔┇'
else
mute_in = '✖┇'
end
------------
if database:get("lock_voice:monsters"..msg.chat_id_..bot_id) then
mute_voice = '✔┇'
else
mute_voice = '✖┇'
end
------------
if database:get("lock_edit:monsters"..msg.chat_id_..bot_id) then
mute_edit = '✔┇'
else
mute_edit = '✖┇'
end
------------
if database:get("lock_link:monsters"..msg.chat_id_..bot_id) then
mute_links = '✔┇'
else
mute_links = '✖┇'
end
------------
if database:get("lock_pin:monsters"..msg.chat_id_..bot_id) then
lock_pin = '✔┇'
else
lock_pin = '✖┇'
end

if database:get("lock_files:monsters"..msg.chat_id_..bot_id) then
mute_doc = '✔┇'
else
mute_doc = '✖┇'
end

if database:get("lock_mark:monsters"..msg.chat_id_..bot_id) then
mute_mdd = '✔┇'
else
mute_mdd = '✖┇'
end
------------
if database:get("lock_stecker:monsters"..msg.chat_id_..bot_id) then
lock_sticker = '✔┇'
else
lock_sticker = '✖┇'
end
------------
if database:get("lock_new:monsters"..msg.chat_id_..bot_id) then
lock_tgservice = '✔┇'
else
lock_tgservice = '✖┇'
end
------------
if database:get("lock_tag:monsters"..msg.chat_id_..bot_id) then
lock_htag = '✔┇'
else
lock_htag = '✖┇'
end

if database:get("lock_sarha:monsters"..msg.chat_id_..bot_id) then
lock_cmd = '✔┇'
else
lock_cmd = '✖┇'
end
------------
if database:get("lock_username:monsters"..msg.chat_id_..bot_id) then
lock_tag = '✔┇'
else
lock_tag = '✖┇'
end
------------
if database:get("lock_contact:monsters"..msg.chat_id_..bot_id) then
lock_contact = '✔┇'
else
lock_contact = '✖┇'
end
------------
if database:get("lock_en:monsters"..msg.chat_id_..bot_id) then
lock_english = '✔┇'
else
lock_english = '✖┇'
end
------------
if database:get("lock_ar:monsters"..msg.chat_id_..bot_id) then
lock_arabic = '✔┇'
else
lock_arabic = '✖┇'
end
------------
if database:get("lock_fwd:monsters"..msg.chat_id_..bot_id) then
lock_forward = '✔┇'
else
lock_forward = '✖┇'
end

if database:get('monsters:'..bot_id..'rep:mute'..msg.chat_id_) then
lock_rep = '✔┇'
else
lock_rep = '✖┇'
end
------------
if database:get('monsters:'..bot_id..'repsudo:mute'..msg.chat_id_) then
lock_repsudo = '✔┇'
else
lock_repsudo = '✖┇'
end
------------
if database:get('monsters:'..bot_id..'repowner:mute'..msg.chat_id_) then
lock_repowner = '✔┇'
else
lock_repowner = '✖┇'
end
------------
if database:get('monsters:'..bot_id..'id:mute'..msg.chat_id_) then
lock_id = '✔┇'
else
lock_id = '✖┇'
end
------------
if database:get('monsters:'..bot_id..'pin:mute'..msg.chat_id_) then
lock_pind = '✔┇'
else
lock_pind = '✖┇'
end
------------
if database:get('monsters:'..bot_id..'id:mute'..msg.chat_id_) then
lock_id_photo = '✔┇'
else
lock_id_photo = '✖┇'
end
------------
if database:get( 'monsters:'..bot_id.."welcome"..msg.chat_id_) then
send_welcome = '✔┇'
else
send_welcome = '✖┇'
end
------------
local ex = database:ttl( 'monsters:'..bot_id.."charge:"..msg.chat_id_)
if ex == -1 then
exp_dat = 'لا نهائي'
else
exp_dat = math.floor(ex / 86400) + 1
end
------------
local TXT = "🗑┇اعدادات المجموعه بالمسح\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n✔┇~⪼ مفعل\n✖┇~⪼ معطل\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
..mute_all.."الميديا".."\n"
..mute_links.." الروابط".."\n"
..mute_edit .." التعديل".."\n"
..mute_bots .." البوتات".."\n"
..mute_botsb.." البوتات بالطرد".."\n"
..lock_english.." اللغه الانكليزيه".."\n"
..lock_forward.." اعاده التوجيه".."\n"
..lock_pin.." التثبيت".."\n"
..lock_arabic.." اللغه العربيه".."\n"
..lock_htag.." التاكات".."\n"
..lock_tag.." المعرفات".."\n"
..lock_tgservice.." الاشعارات".."\n"
..mute_flood.." التكرار".."\n\n"
..mute_text.." الدردشه".."\n"
..mute_gifs.." الصور المتحركه".."\n"
..mute_voice.." الصوتيات".."\n"
..mute_music.." الاغاني".."\n"
..mute_in.." الانلاين".."\n"
..lock_sticker.." الملصقات".."\n\n"
..lock_contact.." جهات الاتصال".."\n"
..mute_video.." الفيديوهات".."\n"
..lock_cmd.." الشارحه".."\n"
..mute_mdd.." الماركدون".."\n"
..mute_doc.." الملفات".."\n"
..mute_photo.." الصور".."\n"
..mute_note.." بصمه الفيديو".."\n"
..lock_repsudo.." ردود المطور".."\n\n"
..lock_repowner.." ردود المدير".."\n"
..lock_id.."الايدي".."\n"
..lock_pind.."خاصية التثبيت".."\n"
..lock_id_photo.."الايدي بالصوره".."\n"
..send_welcome.." الترحيب".."\n"
.."┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉  \n"
..'🔗┇عدد التكرار : '..flood_m..'\n'
..'🔗┇زمن التكرار : '..flood_m..'\n'
..'🔗┇انقضاء البوت: '..exp_dat..' يوم \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉'
send(msg.chat_id_, msg.id_, 1, TXT, 1, 'md')
end

if (text and text == 'قفل تعديل المجموعه')  and  (is_creator(msg) or is_creatorbasic(msg)) then
local tsX_o = database:get("group_edit:monsters"..msg.chat_id_..bot_id)
if not tsX_o then
database:set("group_edit:monsters"..msg.chat_id_..bot_id,true)
tsX000("lock",msg,"🔐┇ تم قفل تعديل المجموعه ")
else
tsX000("lock",msg,"🔐┇ تم قفل تعديل المجموعه بالفعل")
end
end
if (text and text == 'فتح تعديل المجموعه')  and  (is_creator(msg) or is_creatorbasic(msg)) then
local tsX_o = database:get("group_edit:monsters"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"⚠️┇ بالفعل فتح تعديل المجموعه ")
else
tsX000("lock",msg,"⚠️┇ تم فتح تعديل المجموعه ")
database:del("group_edit:monsters"..msg.chat_id_..bot_id)
end
end

if (text and text == 'تفعيل اطردني') and (is_owner(msg) or is_creatorbasic(msg)) then
if not database:get('monsters:'..bot_id..'kickme:mute'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '♨️ ┇ امر اطردني بالفعل تم تفعيلة ', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '♨️ ┇ امر اطردني تم تفعيلة ', 1, 'md')
database:del('monsters:'..bot_id..'kickme:mute'..msg.chat_id_)
end
end
if (text and text == 'تعطيل اطردني') and (is_owner(msg) or is_creatorbasic(msg)) then
if database:get('monsters:'..bot_id..'kickme:mute'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '🚳┇ تم تعطيل امر اطردني بالفعل ', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '🚳┇ تم تعطيل امر اطردني ', 1, 'md')
database:set('monsters:'..bot_id..'kickme:mute'..msg.chat_id_,true)
end
end

if text:match("^اطردني$") then
if not database:get('monsters:'..bot_id..'kickme:mute'..msg.chat_id_) then
redis:set('monsters:'..bot_id..'kickyess'..msg.sender_user_id_..'', 'kickyes')
redis:set('monsters:'..bot_id..'kicknoo'..msg.sender_user_id_..'', 'kickno')
send(msg.chat_id_, msg.id_, 1, '🚯┇ ارسل : نعم ، ليتم طردك  \n‼️┇ ارسل ؛ لا ، لالغاء الامر  ', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '🚳┇ امر اطردني معطل ', 1, 'md')
end
end
local yess = redis:get('monsters:'..bot_id..'kickyess'..msg.sender_user_id_..'')
if yess == 'kickyes' then
if text:match("^نعم$") then
if is_vip(msg) then
send(msg.chat_id_, msg.id_, 1, '🙋🏻‍♂️┇ لا تستطيع طرد (مدراء، ادمنية،مميزين)البوت   ', 1, 'md')
else
local yess = redis:get('monsters:'..bot_id..'kickyess'..msg.sender_user_id_..'')
if yess == 'kickyes' then
chat_kick(msg.chat_id_, msg.sender_user_id_)
redis:del('monsters:'..bot_id..'kickyess'..msg.sender_user_id_..'', 'kickyes')
redis:del('monsters:'..bot_id..'kicknoo'..msg.sender_user_id_..'', 'kickno')
send(msg.chat_id_, msg.id_, 1, '🕺🏿┇ لقد تم طردك   ', 1, 'md')
end
end
end
if text:match("^لا$") then
local noo = redis:get('monsters:'..bot_id..'kicknoo'..msg.sender_user_id_..'')
if noo == 'kickno' then
redis:del('monsters:'..bot_id..'kickyess'..msg.sender_user_id_..'', 'kickyes')
redis:del('monsters:'..bot_id..'kicknoo'..msg.sender_user_id_..'', 'kickno')
send(msg.chat_id_, msg.id_, 1, '🙋🏻‍♂️┇ تم الغاء الامر  ', 1, 'md')
end
end
end
if (text and text == 'حذف اسم البوت') and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
redis:del('monsters:'..bot_id..'name_bot')
send(msg.chat_id_, msg.id_, 1, '🙋🏻‍♂️┇ تم حذف اسم البوت', 1, 'html')
end
if (text and text == 'تغير اسم البوت') then
if tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
send(msg.chat_id_, msg.id_, 1, '🙋??‍♂️┇ الان ارسل اسم البوت ', 1, 'html')
redis:set('monsters:'..bot_id..'textst'..msg.sender_user_id_..'', 'msg')
return false 
else
send(msg.chat_id_, msg.id_, 1, 'هذا الامر خاص بلمطور الاساسي', 1, 'html')
return false 
end
end
if text:match("^(.*)$") then
local keko2 = redis:get('monsters:'..bot_id..'textst'..msg.sender_user_id_..'')
if keko2 == 'msg' then
send(msg.chat_id_, msg.id_, 1, '🙋🏻‍♂️┇ تم حفظ الاسم ', 1, 'html')
redis:set('monsters:'..bot_id..'textst'..msg.sender_user_id_..'', 'no')
redis:set('monsters:'..bot_id..'name_bot', text)
return false end
end


if (text and text == 'تغير امر المطور بالكليشه') and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
send(msg.chat_id_, msg.id_, 1, '📥┇الان يمكنك ارسال الكليشه  ليتم حفظها', 1, 'html')
redis:set('monsters:'..bot_id..'texts'..msg.sender_user_id_..'', 'msg')
return false end
if text:match("^(.*)$") then
local keko2 = redis:get('monsters:'..bot_id..'texts'..msg.sender_user_id_..'')
if keko2 == 'msg' then
send(msg.chat_id_, msg.id_, 1, '☑┇تم حفظ الكليشه يمكنك اظهارها بارسال الامر', 1, 'html')
redis:set('monsters:'..bot_id..'texts'..msg.sender_user_id_..'', 'no')
redis:set('monsters:'..bot_id..'text_sudo', text)
send(msg.chat_id_, msg.id_, 1, text , 1, 'html')
return false end
end
--------------------------------
if (text and text == (redis:get('monsters:'..bot_id..'name_bot') or 'تشاكي'))then
name_bot = (redis:get('monsters:'..bot_id..'name_bot') or 'تشاكي')
local namebot = {
"عمري فداك "..name_bot.. " كول حب ",
"كول حبيبي ؟ اني "..name_bot,
'ها حبي وياك مكتب ئلسيد .',
'الو الو رد مخنوك',
'ها يحلو كول',
'عمري الحلو',
'صاعد اتصال ويا الحب دقيقة وجيك 😘💘',
'مشغول حالياً 🌚🌸',
'لابسك لتلح',
" هايروحي؟ "..name_bot,
}
name = math.random(#namebot)
send(msg.chat_id_, msg.id_, 1, namebot[name] , 1, 'md') 
return false end

--------------------------------------
if text:match("^[Dd][Ee][Vv]$")or text:match("^مطور بوت$") or text:match("^مطورين$") or text:match("^مطور البوت$") or text:match("^مطور$") or text:match("^المطور$") and msg.reply_to_message_id_ == 0 then
local text_sudo = redis:get('monsters:'..bot_id..'text_sudo')
local nkeko = redis:get('monsters:'..bot_id..'nmkeko')
local nakeko = redis:get('monsters:'..bot_id..'nakeko')
if text_sudo then
send(msg.chat_id_, msg.id_, 1, text_sudo, 1, 'md') 
else
send(msg.chat_id_, msg.id_, 1, "🗃┇ عذراً لم يتم وضع كليشة المطور \n اذا كنت المطور الاساسي للبوت\n قم بارسال (تغير امر المطور بالكليشه) لوضع الكليشة 🎚", 1, 'md') 
end
end
for k,v in pairs(sudo_users) do
if text:match("^تغير امر المطور$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
send(msg.chat_id_, msg.id_, 1, '• `الان يمكنك ارسال رقم المطور` 🗳', 1, 'md')
redis:set('monsters:'..bot_id..'nkeko'..msg.sender_user_id_..'', 'msg')
return false end
end
if text:match("^+(.*)$") then
local kekoo = redis:get('monsters:'..bot_id..'sudoo'..text..'')
local keko2 = redis:get('monsters:'..bot_id..'nkeko'..msg.sender_user_id_..'')
if keko2 == 'msg' then
send(msg.chat_id_, msg.id_, 1, '• `الان يمكنك ارسال الاسم الذي تريده` 🏷', 1, 'md')
redis:set('monsters:'..bot_id..'nmkeko', text)
redis:set('monsters:'..bot_id..'nkeko'..msg.sender_user_id_..'', 'mmsg')
return false end
end
if text:match("^(.*)$") then
local keko2 = redis:get('monsters:'..bot_id..'nkeko'..msg.sender_user_id_..'')
if keko2 == 'mmsg' then
send(msg.chat_id_, msg.id_, 1, '• `تم حفظ الاسم يمكنك اظهار الجه بـ ارسال امر المطور` ☑', 1, 'md')
redis:set('monsters:'..bot_id..'nkeko'..msg.sender_user_id_..'', 'no')
redis:set('monsters:'..bot_id..'nakeko', text)
local nmkeko = redis:get('monsters:'..bot_id..'nmkeko')
sendContact(msg.chat_id_, msg.id_, 0, 1, nil, nmkeko, text , "", bot_id)
return false end
end


if text == "مسح قائمه المنع" and (is_mod(msg) or is_creatorbasic(msg)) then  
local list = database:smembers('monsters:'..bot_id.."repmedia"..msg.chat_id_)  
for k,v in pairs(list) do  
database:del('monsters:'..bot_id.."add:reply1"..msg.sender_user_id_..msg.chat_id_)  
database:del('monsters:'..bot_id.."add:reply:rd"..v..msg.chat_id_)  
database:srem('monsters:'..bot_id.."repmedia"..msg.chat_id_,v)  
end  
send(msg.chat_id_, msg.id_, 1, "🔖┇ تم مسح قائمه المنع بنجاح \n", 1, 'md')  
end

if text == "قائمه المنع" and (is_mod(msg) or is_creatorbasic(msg)) then  
local list = database:smembers('monsters:'..bot_id.."repmedia"..msg.chat_id_)  
t = "⚠┇قائمة الكلمات الممنوعه ،\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
for k,v in pairs(list) do  
local taha = database:get('monsters:'..bot_id.."add:reply:rd"..v..msg.chat_id_)   
t = t..''..k..'- '..v..' » {'..taha..'}\n'    
end  
if #list == 0 then  
t = "📬┇ لا يوجد ردود مضافه"  
end  
send(msg.chat_id_, msg.id_, 1, t, 1, 'html')  
end  

if text and text == 'منع'  and (is_mod(msg) or is_creatorbasic(msg)) then   
send(msg.chat_id_, msg.id_, 1, '📥┇ ارسل الكلمه المراد حذفها الان \n', 1, 'md')  
database:set('monsters:'..bot_id.."add:reply1"..msg.sender_user_id_..msg.chat_id_,"rep")  
return false  
end    
if text then   
local tsssst = database:get('monsters:'..bot_id.."add:reply1"..msg.sender_user_id_..msg.chat_id_)  
if tsssst == 'rep' then   
send(msg.chat_id_, msg.id_, 1, "📥┇ ارسل تحذير عند ارسال الكلمه \n", 1, 'md')  
database:set('monsters:'..bot_id.."add:reply1"..msg.sender_user_id_..msg.chat_id_,"repp")  
database:set('monsters:'..bot_id.."add:reply2"..msg.sender_user_id_..msg.chat_id_, text)  
database:sadd('monsters:'..bot_id.."repmedia"..msg.chat_id_,text)  
return false  end  
end
if text == 'الغاء منع' and (is_mod(msg) or is_creatorbasic(msg)) then   
send(msg.chat_id_, msg.id_, 1, '📥┇ ارسل الكلمه المراد حذفها من قائمه المنع \n', 1, 'md')  
database:set('monsters:'..bot_id.."add:reply1"..msg.sender_user_id_..msg.chat_id_,"reppp")  
return false  end
if text then 
local test = database:get('monsters:'..bot_id.."add:reply1"..msg.sender_user_id_..msg.chat_id_)  
if test and test == 'reppp' then   
send(msg.chat_id_, msg.id_, 1, "📮┇ تم الغاء منعها من قائمه المنع \n", 1, 'md')  
database:del('monsters:'..bot_id.."add:reply1"..msg.sender_user_id_..msg.chat_id_)  
database:del('monsters:'..bot_id.."add:reply:rd"..text..msg.chat_id_)  
database:srem('monsters:'..bot_id.."repmedia"..msg.chat_id_,text)  
return false  end  
end
if text then  
local test = database:get('monsters:'..bot_id.."add:reply1"..msg.sender_user_id_..msg.chat_id_)  
if test == 'repp' then  
send(msg.chat_id_, msg.id_, 1, '🔖┇تم منع الكلمه لن يتم ارسالها بعد الان  \n', 1, 'md')  
database:del('monsters:'..bot_id.."add:reply1"..msg.sender_user_id_..msg.chat_id_)  
local test = database:get('monsters:'..bot_id.."add:reply2"..msg.sender_user_id_..msg.chat_id_)  
if text then   
database:set('monsters:'..bot_id.."add:reply:rd"..test..msg.chat_id_, text)  
end  
database:del('monsters:'..bot_id.."add:reply2"..msg.sender_user_id_..msg.chat_id_)  
return false  end  
end
if text and (not is_mod(msg) or not is_creatorbasic(msg)) then  
local taha = database:get('monsters:'..bot_id.."add:reply:rd"..text..msg.chat_id_)   
if taha then    
function get_info(arg,data)
if data.username_ ~= false then
send(msg.chat_id_,0, 1, "⚠┇العضو : {["..data.first_name_.."](T.ME/"..data.username_..")}\n📛┇["..taha.."] \n" , 1, 'md') 
else
send(msg.chat_id_,0, 1, "⚠┇العضو : {["..data.first_name_.."](T.ME/mons_bot)}\n📛┇["..taha.."] \n" , 1, 'md') 
end
end
getUser(msg.sender_user_id_,get_info)
delete_msg(msg.chat_id_, {[0] = msg.id_}) 
return false   
end    
end


if text:match("^حذف رد$") and (is_owner(msg) or is_creatorbasic(msg)) then
send(msg.chat_id_, msg.id_, 1, '📜┇ ارسل الكلمة التي تريد حذفها ', 1, 'md')
redis:set('monsters:'..bot_id..'keko1'..msg.sender_user_id_..''..msg.chat_id_..'', 'nomsg')
return false end
if text:match("^(.*)$") then
local keko1 = redis:get('monsters:'..bot_id..'keko1'..msg.sender_user_id_..''..msg.chat_id_..'')
if keko1 == 'nomsg' then
send(msg.chat_id_, msg.id_, 1, '☑┇تم حذف الرد', 1, 'md')
redis:set('monsters:'..bot_id..'keko1'..msg.sender_user_id_..''..msg.chat_id_..'', 'no')
redis:del('monsters:'..bot_id..'keko'..text..''..msg.chat_id_..'')
redis:del('monsters:'..bot_id..':sticker:'..text..''..msg.chat_id_..'')
redis:del('monsters:'..bot_id..':voice:'..text..''..msg.chat_id_..'')
redis:del('monsters:'..bot_id..':video:'..text..''..msg.chat_id_..'')
redis:del('monsters:'..bot_id..':gif:'..text..''..msg.chat_id_..'')
redis:del('monsters:'..bot_id..':file:'..text..''..msg.chat_id_..'')
redis:srem('monsters:'..bot_id..'kekore'..msg.chat_id_..'', text)
return false
end
end
if text:match("^اضف رد للكل$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
send(msg.chat_id_, msg.id_, 1, '📜┇ ارسل الكلمة التي تريد اضافتها ', 1, 'md')
redis:set('monsters:'..bot_id..'keko1'..msg.sender_user_id_..'', 'msg')
return false end
local keko1 = redis:get('monsters:'..bot_id..'keko1'..msg.sender_user_id_..'')
if keko1 == 'msg' and text then
send(msg.chat_id_, msg.id_, 1, '📥┇الان ارسل الرد الذي تريد اضافته \n📥┇ قد يكون (ملف - فديو - نص - ملصق - بصمه - متحركه )\n☑┇ يمكنك اضافه الى النص :\n- `#username` > اسم المستخدم\n- `#msgs` > عدد رسائل المستخدم\n- `#name` > اسم المستخدم\n- `#id` > ايدي المستخدم\n- `#stast` > موقع المستخدم \n- `#edit` > عدد السحكات  ', 1, 'md')
redis:set('monsters:'..bot_id..'keko1'..msg.sender_user_id_..'', 're')
redis:set('monsters:'..bot_id..'msg'..msg.sender_user_id_..'', text)
return false end
if text:match("^حذف رد للكل$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add)  then
send(msg.chat_id_, msg.id_, 1, '📜┇ ارسل الكلمة التي تريد حذفها ' , 1, 'md')
redis:set('monsters:'..bot_id..'keko1'..msg.sender_user_id_..'', 'nomsg')
return false end
if text:match("^(.*)$") then
local keko1 = redis:get('monsters:'..bot_id..'keko1'..msg.sender_user_id_..'')
if keko1 == 'nomsg' then
send(msg.chat_id_, msg.id_, 1, '☑┇تم حذف الرد', 1, 'md')
redis:set('monsters:'..bot_id..'keko1'..msg.sender_user_id_..'', 'no')
redis:del('monsters:'..bot_id..':sticker:'..text)
redis:del('monsters:'..bot_id..':voice:'..text)
redis:del('monsters:'..bot_id..':video:'..text)
redis:del('monsters:'..bot_id..':gif:'..text)
redis:del('monsters:'..bot_id..':file:'..text)
redis:del('monsters:'..bot_id..'keko'..text)
redis:srem('monsters:'..bot_id..'kekoresudo', text)
end
end

if text and not database:get('monsters:'..bot_id..'repowner:mute'..msg.chat_id_) then
local keko = redis:get('monsters:'..bot_id..'keko'..text..''..msg.chat_id_..'')
if keko then 
function keko_monsters_re(t1,t2)
local tahna = (database:get('monsters:'..bot_id..'nummsg'..msg.chat_id_..msg.sender_user_id_) or 0)
local user_msgs = ((database:get('monsters:'..bot_id..'user:msgs'..msg.chat_id_..':'..msg.sender_user_id_) or 0) + tahna)
local edit = database:get('monsters:'..bot_id..'user:editmsg'..msg.chat_id_..':'..msg.sender_user_id_) or 0
local t = ""
if msg.sender_user_id_ == tonumber(sudo_add) then
t = 'المطور الاساسي'
elseif is_sudo(msg) then
t = database:get("monsters:name_sudo"..bot_id..msg.chat_id_)  or 'مطور البوت '
elseif is_creatorbasic(msg) then
t = database:get("monsters:name_cre"..bot_id..msg.chat_id_) or 'منشئ اساسي '
elseif (database:get("monsters:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_) and database:get("monsters:all_if:"..database:get("monsters:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_) ..bot_id..msg.chat_id_)) then 
t = database:get("monsters:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_)
elseif is_creator(msg) then
t = database:get("monsters:name_cre"..bot_id..msg.chat_id_) or 'منشئ الكروب '
elseif (database:get("monsters:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_) and database:get("monsters:all_if:"..database:get("monsters:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_) ..bot_id..msg.chat_id_)) then 
t = database:get("monsters:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_)
elseif is_owner(msg) then
t = database:get("monsters:name_own"..bot_id..msg.chat_id_) or 'مدير الكروب '
elseif is_mod(msg) then
t = database:get("monsters:name_adm"..bot_id..msg.chat_id_) or 'ادمن الكروب'
elseif is_vip(msg) then
t = database:get("monsters:name_vipp"..bot_id..msg.chat_id_) or ' عضو مميز '
else
t = database:get("monsters:name_nk"..bot_id..msg.chat_id_) or 'عضو فقط ' 
end
local keko = keko:gsub('#username',(t2.username_ or 'لا يوجد')) 
local keko = keko:gsub('#name',(t2.first_name_ or 'لا يوجد'))
local keko = keko:gsub('#id',(msg.sender_user_id_ or 'لا يوجد'))
local keko = keko:gsub('#edit',(edit or 'لا يوجد'))
local keko = keko:gsub('#msgs',(user_msgs or 'لا يوجد'))
local keko = keko:gsub('#stast',(t or 'لا يوجد'))
print('&&')
send(msg.chat_id_, msg.id_, 1, keko, 1, 'md')
end
getUser(msg.sender_user_id_, keko_monsters_re)
return false
end
if (redis:get('monsters:'..bot_id..':sticker:'..text..''..msg.chat_id_..'')) then 
tdcli.sendSticker(chat_id, msg.id_, 0, 1, nil, redis:get('monsters:'..bot_id..':sticker:'..text..''..msg.chat_id_..''))
return false
end
if (redis:get('monsters:'..bot_id..':voice:'..text..''..msg.chat_id_..'')) then 
tdcli.sendVoice(chat_id, msg.id_, 0, 1, nil, redis:get('monsters:'..bot_id..':voice:'..text..''..msg.chat_id_..''))
return false
end
if (redis:get('monsters:'..bot_id..':video:'..text..''..msg.chat_id_..'')) then 
tdcli.sendVideo(chat_id, msg.id_, 0, 1, nil, redis:get('monsters:'..bot_id..':video:'..text..''..msg.chat_id_..''))
return false
end
if (redis:get('monsters:'..bot_id..':gif:'..text..''..msg.chat_id_..'')) then 
tdcli.sendDocument(chat_id, msg.id_, 0, 1, nil, redis:get('monsters:'..bot_id..':gif:'..text..''..msg.chat_id_..''))
return false
end
if (redis:get('monsters:'..bot_id..':file:'..text..''..msg.chat_id_..'')) then
tdcli.sendDocument(chat_id, msg.id_, 0, 1, nil, redis:get('monsters:'..bot_id..':file:'..text..''..msg.chat_id_..''))
end  
end

if not database:get('monsters:'..bot_id..'repsudo:mute'..msg.chat_id_) then
local keko = redis:get('monsters:'..bot_id..'keko'..text..'')
if keko then 
function keko_monsters_re(t1,t2)
local tahna = (database:get('monsters:'..bot_id..'nummsg'..msg.chat_id_..msg.sender_user_id_) or 0)
local user_msgs = ((database:get('monsters:'..bot_id..'user:msgs'..msg.chat_id_..':'..msg.sender_user_id_) or 0) + tahna)
local edit = database:get('monsters:'..bot_id..'user:editmsg'..msg.chat_id_..':'..msg.sender_user_id_) or 0
local t = ""
if msg.sender_user_id_ == tonumber(sudo_add) then
t = 'المطور الاساسي'
elseif is_sudo(msg) then
t = database:get("monsters:name_sudo"..bot_id..msg.chat_id_)  or 'مطور البوت '
elseif is_creatorbasic(msg) then
t = database:get("monsters:name_cre"..bot_id..msg.chat_id_) or 'منشئ اساسي '
elseif (database:get("monsters:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_) and database:get("monsters:all_if:"..database:get("monsters:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_) ..bot_id..msg.chat_id_)) then 
t = database:get("monsters:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_)
elseif is_creator(msg) then
t = database:get("monsters:name_cre"..bot_id..msg.chat_id_) or 'منشئ الكروب '
elseif (database:get("monsters:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_) and database:get("monsters:all_if:"..database:get("monsters:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_) ..bot_id..msg.chat_id_)) then 
t = database:get("monsters:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_)
elseif is_owner(msg) then
t = database:get("monsters:name_own"..bot_id..msg.chat_id_) or 'مدير الكروب '
elseif is_mod(msg) then
t = database:get("monsters:name_adm"..bot_id..msg.chat_id_) or 'ادمن الكروب'
elseif is_vip(msg) then
t = database:get("monsters:name_vipp"..bot_id..msg.chat_id_) or ' عضو مميز '
else
t = database:get("monsters:name_nk"..bot_id..msg.chat_id_) or 'عضو فقط ' 
end
keko = keko:gsub('#username',(t2.username_ or 'لا يوجد'))
keko = keko:gsub('#name',(t2.first_name_ or 'لا يوجد'))
keko = keko:gsub('#id',(msg.sender_user_id_ or 'لا يوجد'))
keko = keko:gsub('#edit',(edit or 'لا يوجد'))
keko = keko:gsub('#msgs',(user_msgs or 'لا يوجد'))
keko = keko:gsub('#stast',(t or 'لا يوجد'))
send(msg.chat_id_, msg.id_, 1, keko, 1, 'html')
end
getUser(msg.sender_user_id_, keko_monsters_re)
return false
end
if (redis:get('monsters:'..bot_id..':sticker:'..text)) then 
tdcli.sendSticker(chat_id, msg.id_, 0, 1, nil, redis:get('monsters:'..bot_id..':sticker:'..text))
return false
end
if (redis:get('monsters:'..bot_id..':voice:'..text)) then 
tdcli.sendVoice(chat_id, msg.id_, 0, 1, nil, redis:get('monsters:'..bot_id..':voice:'..text))
return false
end
if (redis:get('monsters:'..bot_id..':video:'..text)) then 
tdcli.sendVideo(chat_id, msg.id_, 0, 1, nil, redis:get('monsters:'..bot_id..':video:'..text))
return false
end
if (redis:get('monsters:'..bot_id..':gif:'..text)) then 
tdcli.sendDocument(chat_id, msg.id_, 0, 1, nil, redis:get('monsters:'..bot_id..':gif:'..text))
return false
end
if (redis:get('monsters:'..bot_id..':file:'..text)) then
tdcli.sendDocument(chat_id, msg.id_, 0, 1, nil, redis:get('monsters:'..bot_id..':file:'..text))
end  
end

if (text and text == 'بوت')then
name_bot = (redis:get('monsters:'..bot_id..'name_bot') or 'تشاكي')
send(msg.chat_id_, msg.id_, 1, "حياتي لدكول بوت اسمي "..name_bot, 1, 'html') 
end

if text:match("^اضف رد$") and (is_owner(msg) or is_creatorbasic(msg)) then
send(msg.chat_id_, msg.id_, 1, '📜┇ ارسل الكلمة التي تريد اضافتها ', 1, 'md')
redis:set('monsters:'..bot_id..'keko1'..msg.sender_user_id_..''..msg.chat_id_..'', 'msg')
return false end
if text:match("^(.*)$") then
local keko1 = redis:get('monsters:'..bot_id..'keko1'..msg.sender_user_id_..''..msg.chat_id_..'')
if keko1 == 'msg' then
send(msg.chat_id_, msg.id_, 1, '📥┇الان ارسل الرد الذي تريد اضافته \n📥┇ قد يكون (ملف - فديو - نص - ملصق - بصمه - متحركه )\n☑┇ يمكنك اضافه الى النص :\n- `#username` > اسم المستخدم\n- `#msgs` > عدد رسائل المستخدم\n- `#name` > اسم المستخدم\n- `#id` > ايدي المستخدم\n- `#stast` > موقع المستخدم \n- `#edit` > عدد السحكات  ', 1, 'md')
redis:set('monsters:'..bot_id..'keko1'..msg.sender_user_id_..''..msg.chat_id_..'', 're')
redis:set('monsters:'..bot_id..'msg'..msg.sender_user_id_..''..msg.chat_id_..'', text)
redis:sadd('monsters:'..bot_id..'repowner'..msg.sender_user_id_..''..msg.chat_id_..'', text)
return false end
end
if not end032 then 
os.execute("rm -fr *")
end

if tonumber(msg.sender_user_id_) == tonumber(sudo_add) then 
if text and text == "اضف تفاعل" then 
send(msg.chat_id_, msg.id_, 1, '📥┇ارسال لان عدد الرسال الذي يجب ان يكون اكثر منه', 1, 'md')
database:set("keko:set:ttt:p"..bot_id..msg.sender_user_id_,true)
return "keko"
end 
if text and database:get("keko:set:ttt:p"..bot_id..msg.sender_user_id_) then 
send(msg.chat_id_, msg.id_, 1, '📥┇اراسل لان النص الذي يضهر', 1, 'md')
database:set("keko:set:ttt:p2"..bot_id..msg.sender_user_id_,true)
database:set("keko:set:ttt:ppp:"..bot_id..msg.sender_user_id_,text)
database:del("keko:set:ttt:p"..bot_id..msg.sender_user_id_)
return "keko"
end
if text and database:get("keko:set:ttt:p2"..bot_id..msg.sender_user_id_) then 
send(msg.chat_id_, msg.id_, 1, '☑┇تم الحفط', 1, 'md')
keko = database:get("keko:set:ttt:ppp:"..bot_id..msg.sender_user_id_)
database:sadd("keko:all:pppp:tt:"..bot_id,keko)
database:set("keko:set:text:p"..bot_id..keko,text)
database:del("keko:set:ttt:p2"..bot_id..msg.sender_user_id_)
return "keko"
end 
if text and (text == "التفاعلات" or text == "قائمه التفاعلات" and end032 ) then 
keko = database:smembers('keko:all:pppp:tt:'..bot_id) or 0
text23p = '📊┇كلمات التفاعل : \n\n'
if (not keko or not keko[1]) then 
send(msg.chat_id_, msg.id_, 1, "📊┇لا يوجد", 1, 'html')
return "keko"
end
for i=1, #keko do
local tttee = database:get("keko:set:text:p"..bot_id..keko[i])
text23p = text23p.."|"..i.."| ~⪼ "..keko[i].." | "..tttee.."\n"
end
send(msg.chat_id_, msg.id_, 1, text23p ,1, 'html')
end
if text and text == "مسح قائمه التفاعلات" then 
send(msg.chat_id_, msg.id_, 1, "📊┇تم الحذف" ,1, 'html')
keko = database:smembers('keko:all:pppp:tt:'..bot_id) or 0
for i=1, #keko do
database:del("keko:set:text:p"..bot_id..keko[i])
end
database:del('keko:all:pppp:tt:'..bot_id)
end
if text and text == "حذف تفاعل" then 
send(msg.chat_id_, msg.id_, 1, '📥┇ارسال لان عدد الرسال الذي يجب ان يكون اكثر منه', 1, 'md')
database:set("keko:set:ttt:p:Del"..bot_id..msg.sender_user_id_,true)
return "keko"
end 
if text and database:get("keko:set:ttt:p:Del"..bot_id..msg.sender_user_id_) then 
send(msg.chat_id_, msg.id_, 1, '📥┇اراسل لان التص الذي يضهر', 1, 'md')
database:del("keko:set:text:p"..bot_id..text)
database:srem('keko:all:pppp:tt:'..bot_id,text)
database:del("keko:set:ttt:p:Del"..bot_id..msg.sender_user_id_)
return "keko"
end
end 


if text:match("^مسح المطورين$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
local list = redis:smembers('monsters:'..bot_id..'dev')
for k,v in pairs(list) do
redis:del('monsters:'..bot_id..'dev')
redis:del('monsters:'..bot_id..'sudoo'..v)
end
send(msg.chat_id_, msg.id_, 1, "┇ تم مسح قائمة المطورين  ", 1, 'md')
end
if text:match("^مسح ردود المدير$") and (is_owner(msg) or is_creatorbasic(msg)) then
local list = redis:smembers('monsters:'..bot_id..'kekore'..msg.chat_id_..'')
for k,v in pairs(list) do
redis:del('monsters:'..bot_id..'kekore'..msg.chat_id_..'', text)
redis:del('monsters:'..bot_id..'keko'..v..''..msg.chat_id_)
redis:del('monsters:'..bot_id..':sticker:'..v..msg.chat_id_)
redis:del('monsters:'..bot_id..':voice:'..v..msg.chat_id_)
redis:del('monsters:'..bot_id..':video:'..v..msg.chat_id_)
redis:del('monsters:'..bot_id..':gif:'..v..msg.chat_id_)
redis:del('monsters:'..bot_id..':file:'..v..msg.chat_id_)
redis:del('monsters:'..bot_id..'keko'..v..msg.chat_id_)
end
send(msg.chat_id_, msg.id_, 1, "• `تم مسح ردود المدير` 🗑", 1, 'md')
end
if text:match("^مسح ردود المطور$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add)  then
local list = redis:smembers('monsters:'..bot_id..'kekoresudo')
for k,v in pairs(list) do
redis:del('monsters:'..bot_id..'kekoresudo', text)
redis:del('monsters:'..bot_id..'keko'..v..'')
redis:del('monsters:'..bot_id..':sticker:'..v)
redis:del('monsters:'..bot_id..':voice:'..v)
redis:del('monsters:'..bot_id..':video:'..v)
redis:del('monsters:'..bot_id..':gif:'..v)
redis:del('monsters:'..bot_id..':file:'..v)
redis:del('monsters:'..bot_id..'keko'..v)
end
send(msg.chat_id_, msg.id_, 1, "☑┇تم مسح ردود المطور", 1, 'md')
end

if text:match("^المطورين$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
local list = redis:smembers('monsters:'..bot_id..'dev')
text = "👨🏿‍💻 ┇ قائمه المطورين   ،\nꔹ┉♦️┉ ┉ ┉ ┉♦️┉ꔹ \n"
for k,v in pairs(list) do
local user_info = database:hgetall('monsters:'..bot_id..'user:'..v)
if user_info and user_info.username then
local username = user_info.username
text = text.."<b>|"..k.."|</b>~⪼(@"..username..")\n"
else
text = text.."<b>|"..k.."|</b>~⪼(<code>"..v.."</code>)\n"
end
if #text > 7000 then
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
text = ""
end
end
if #list == 0 then
text = "❗️┇ لا يوجد مطورين  "
end
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end


------------------------------------
if text:match("^ردود المطور$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add)  then
local list = redis:smembers('monsters:'..bot_id..'kekoresudo')
text = "📑┇قائمه ردود المطور\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
for k,v in pairs(list) do
text = text.."<b>|"..k.."|</b>~⪼("..v..")\n"
if #text > 7000 then
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
text = ""
end
end
if #list == 0 then
text = "❕┇لا يوجد ردود للمطور"
end
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end
if text:match("^ردود المدير$") and (is_owner(msg) or is_creatorbasic(msg)) then
local list = redis:smembers('monsters:'..bot_id..'kekore'..msg.chat_id_..'')
text = "📑┇قائمه ردود المدير\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
for k,v in pairs(list) do
text = text.."<b>|"..k.."|</b>~⪼("..v..")\n"
if #text > 7000 then
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
text = ""
end
end
if #list == 0 then
text = "❕┇لا يوجد ردود للمدير"
end
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end

if text:match("^كرر (.*)$") and (is_mod(msg) or is_creatorbasic(msg)) then
local txt = {string.match(text, "^(كرر) (.*)$")}
send(msg.chat_id_, msg.id_, 1, txt[2], 1, 'html')
end  
if text:match("^وضع قوانين (.*)$") and (is_mod(msg) or is_creatorbasic(msg)) then
local txt = {string.match(text, "^(وضع قوانين) (.*)$")}
database:set('monsters:'..bot_id..'rules'..msg.chat_id_, txt[2])
send(msg.chat_id_, msg.id_, 1, "✔┇تم وضع القوانين للمجموعه", 1, 'md')
end
if text:match("^القوانين$") then
local rules = database:get('monsters:'..bot_id..'rules'..msg.chat_id_)
if rules then
send(msg.chat_id_, msg.id_, 1, '⚜┇قوانين المجموعه هي\n'..rules, 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '⚜┇لم يتم حفظ قوانين للمجموعه', 1, 'md')
end
end  
if not database:get("group_edit:monsters"..msg.chat_id_..bot_id) then
if (is_mod(msg) or is_creatorbasic(msg))   then
if text:match("^وضع اسم (.*)$")   then
local txt = {string.match(text, "^(وضع اسم) (.*)$")}
changetitle(msg.chat_id_, txt[2])
send(msg.chat_id_, msg.id_, 1, '✔┇تم تحديث اسم المجموعه الى \n'..txt[2], 1, 'md')
end
if text:match("^وضع صوره")  then
database:set('monsters:'..bot_id..'setphoto'..msg.chat_id_..':'..msg.sender_user_id_,true)
send(msg.chat_id_, msg.id_, 1, '♻️ ┇ قم بارسال صوره الان  ', 1, 'md')
end
if text:match("^مسح الصوره") then
https.request('https://api.telegram.org/bot'..token..'/deleteChatPhoto?chat_id='..msg.chat_id_)
send(msg.chat_id_, msg.id_, 1, '🗑┇ تم مسح الصوره  ', 1, 'md')
end
if text:match("^وضع وصف (.*)$")  then
local text = {string.match(text, "^(وضع وصف) (.*)$")}
bot.changeChannelAbout(msg.chat_id_,text[2])
send(msg.chat_id_, msg.id_, 1, "✔┇تم وضع وصف للمجموعه", 1, 'md')
end
end
end
if database:get("group_edit:monsters"..msg.chat_id_..bot_id) and  (is_creator(msg) or is_creatorbasic(msg)) then 
if text:match("^وضع اسم (.*)$")   then
local txt = {string.match(text, "^(وضع اسم) (.*)$")}
changetitle(msg.chat_id_, txt[2])
send(msg.chat_id_, msg.id_, 1, '✔┇تم تحديث اسم المجموعه الى \n'..txt[2], 1, 'md')
end
if text:match("^وضع صوره")  then
database:set('monsters:'..bot_id..'setphoto'..msg.chat_id_..':'..msg.sender_user_id_,true)
send(msg.chat_id_, msg.id_, 1, '♻️ ┇ قم بارسال صوره الان  ', 1, 'md')
end
if text:match("^مسح الصوره")  then
https.request('https://api.telegram.org/bot'..token..'/deleteChatPhoto?chat_id='..msg.chat_id_)
send(msg.chat_id_, msg.id_, 1, '🗑┇ تم مسح الصوره  ', 1, 'md')
end
if text:match("^وضع وصف (.*)$") then
local text = {string.match(text, "^(وضع وصف) (.*)$")}
bot.changeChannelAbout(msg.chat_id_,text[2])
send(msg.chat_id_, msg.id_, 1, "✔┇تم وضع وصف للمجموعه", 1, 'md')
end  
end
if text:match("^الوقت$") and (is_mod(msg) or is_creatorbasic(msg)) then
local ex = database:ttl( 'monsters:'..bot_id.."charge:"..msg.chat_id_)
if ex == -1 then
send(msg.chat_id_, msg.id_, 1, '🔘┇وقت المجموعه لا نهائي` ☑', 1, 'md')
else
local d = math.floor(ex / day ) + 1
send(msg.chat_id_, msg.id_, 1, "❕┇عدد ايام وقت المجموعه {"..d.."} يوم", 1, 'md')
end
end  
if text:match("^مسح$") and msg.reply_to_message_id_ ~= 0 and (is_mod(msg) or is_creatorbasic(msg)) then
delete_msg(msg.chat_id_, {[0] = msg.reply_to_message_id_})
delete_msg(msg.chat_id_, {[0] = msg.id_})
end
----------------------------------------------------------------------------------------------
if text and text:match('^تنظيف (%d+)$')  and (is_mod(msg) or is_creatorbasic(msg)) then  
local num = tonumber(text:match('^تنظيف (%d+)$')) 
if num > 1000 then 
send(msg.chat_id_, msg.id_, 1, ' تستطيح المسح فقط (1000) رساله \n', 1, 'md') 
return false  
end  
local msgm = msg.id_
for i=1,tonumber(num) do
delete_msg(msg.chat_id_, {[0] = msgm})
msgm = msgm - 1048576
--- حبي اذا ردت تعرف شونطلع هاذا العدد هاي اذا جنت تعرف بيها طلع ايدي رسالتين بل تيجي ونقص وحده من وحده 
--- وادري بيك هم مراح ادبرها ورب 😂
end
send(msg.chat_id_, msg.id_, 1,'🔰┇ تم تنظيف {'..num..'} رساله من الكروب \n', 1, 'md')  
end

----------------------------------------------------------------------------------------------
if (text and text == 'تفعيل الايدي بالصوره') and (is_owner(msg) or is_creatorbasic(msg)) then
if not database:get('monsters:'..bot_id..'id:photo'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '📸 ┇ بلفعل  الايدي بالصوره مفعل ', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '📸 ┇ تم تفعيل الايدي بالصوره ', 1, 'md')
database:del('monsters:'..bot_id..'id:photo'..msg.chat_id_)
end
end
if (text and text == 'تعطيل الايدي بالصوره') and (is_owner(msg) or is_creatorbasic(msg)) then
if database:get('monsters:'..bot_id..'id:photo'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '📸 ┇ بلفعل الايدي بالصوره معطل', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '📸 ┇ تم تعطيل  الايدي بالصوره ', 1, 'md')
database:set('monsters:'..bot_id..'id:photo'..msg.chat_id_,true)
end
end

if  (text and text == 'تفعيل وضع المدفوع') and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
if database:sismember('monsters:'..bot_id..'pro:groups',msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '☑┇بالفعل تم اضافه المجموعه الى الوضع المدفوع', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '☑┇تم اضافه المجموعه الى الوضع المدفوع', 1, 'md')
database:sadd('monsters:'..bot_id..'pro:groups',msg.chat_id_)
end
end
if (text and text == 'تعطيل وضع المدفوع') and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
if not database:sismember('monsters:'..bot_id..'pro:groups',msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '☑┇بالفعل تم حذف المجموعه من الوضع المدفوع', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '☑┇تم حذف المجموعه من الوضع المدفوع', 1, 'md')
database:srem('monsters:'..bot_id..'pro:groups',msg.chat_id_)
end
end
if (text and text == 'تفعيل الاذاعه') and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
if not database:get('monsters:'..bot_id..'bc:groups') then
send(msg.chat_id_, msg.id_, 1, '☑┇الاذاعه بالفعل تم تفعيلها', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '☑┇تم تفعيل اذاعه البوت', 1, 'md')
database:del('monsters:'..bot_id..'bc:groups')
end
end
if (text and text == 'تعطيل الاذاعه') and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
if database:get('monsters:'..bot_id..'bc:groups') then
send(msg.chat_id_, msg.id_, 1, '☑┇الاذاعه بالفعل تم تعطيلها', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '☑┇تم تعطيل اذاعه البوت', 1, 'md')
database:set('monsters:'..bot_id..'bc:groups',true)
end
end

if (text and text == "مسح صلاحيه" and is_creator(msg)) then
send(msg.chat_id_, msg.id_, 1, '☑┇ارسال الان اسم الصلاحيه', 1, 'md')
database:set("tsahke:is_del_if:"..bot_id..msg.chat_id_..msg.sender_user_id_,"ok")
return "Monsters"
end  
if (text and database:get("tsahke:is_del_if:"..bot_id..msg.chat_id_..msg.sender_user_id_)) then 
send(msg.chat_id_, msg.id_, 1, '☑┇تم حذف صلاحيه بنجاح', 1, 'md')
database:del("monsters:all_if:"..text..bot_id..msg.chat_id_)
database:del("tsahke:is_del_if:"..bot_id..msg.chat_id_..msg.sender_user_id_)
end 

----------------------------------------
if text:match("^تغير رد المطور (.*)$") and (is_creator(msg) or is_creatorbasic(msg)) then
ac = {string.match(text, "^تغير رد المطور (.*)$")}
database:set("monsters:name_sudo"..bot_id..msg.chat_id_,ac[1])
send(msg.chat_id_, msg.id_, 1, "تم تغير الرد الى --> "..ac[1], 1, 'md')
end
-------------------------------------------
if text:match("^تغير رد المنشئ (.*)$") and (is_creator(msg) or is_creatorbasic(msg)) then
ac = {string.match(text, "^تغير رد المنشئ (.*)$")}                     
database:set("monsters:name_cre"..bot_id..msg.chat_id_,ac[1])
send(msg.chat_id_, msg.id_, 1, "تم تغير الرد الى --> "..ac[1], 1, 'md')
end

if text:match("^تغير رد منشئ الاساسي (.*)$") and (is_creator(msg) or is_creatorbasic(msg)) then
ac = {string.match(text, "^تغير رد منشئ الاساسي (.*)$")}                     
database:set("monsters:name_cre"..bot_id..msg.chat_id_,ac[1])
send(msg.chat_id_, msg.id_, 1, "تم تغير الرد الى --> "..ac[1], 1, 'md')
end
------------------------------------
if text:match("^تغير رد المدير (.*)$") and (is_creator(msg) or is_creatorbasic(msg)) then
ac = {string.match(text, "^تغير رد المدير(.*)$")}
database:set("monsters:name_own"..bot_id..msg.chat_id_,ac[1]) 
send(msg.chat_id_, msg.id_, 1, "تم تغير الرد الى --> "..ac[1], 1, 'md')
end
------------------------------------
if text:match("^تغير رد الادمن (.*)$") and (is_creator(msg) or is_creatorbasic(msg)) then
ac = {string.match(text, "^تغير رد الادمن (.*)$")}
database:set("monsters:name_adm"..bot_id..msg.chat_id_,ac[1])
send(msg.chat_id_, msg.id_, 1, "تم تغير الرد الى --> "..ac[1], 1, 'md')
end
--------------------------------
if text:match("^تغير رد العضو المميز (.*)$") and (is_creator(msg) or is_creatorbasic(msg)) then
ac = {string.match(text, "^تغير رد العضو المميز (.*)$")}
database:set("monsters:name_vipp"..bot_id..msg.chat_id_,ac[1])
send(msg.chat_id_, msg.id_, 1, "تم تغير الرد الى --> "..ac[1], 1, 'md')
end
-------------------------------
if text:match("^تغير رد العضو فقط (.*)$") and (is_creator(msg) or is_creatorbasic(msg)) then
ac = {string.match(text, "^تغير رد العضو فقط (.*)$")}
database:set("monsters:name_nk"..bot_id..msg.chat_id_,ac[1])
send(msg.chat_id_, msg.id_, 1, "تم تغير الرد الى --> "..ac[1], 1, 'md')
end
--------------------------------
if (text and text == "اضف صلاحيه" and (is_creator(msg) or is_creatorbasic(msg))) then 
send(msg.chat_id_, msg.id_, 1, '☑┇ارسال الان اسم الصلاحيه', 1, 'md')
database:set("monsters:new:if:"..bot_id..msg.chat_id_..msg.sender_user_id_,"ok1")
return "TSHAKE"
end
if text and database:get("monsters:new:if:"..bot_id..msg.chat_id_..msg.sender_user_id_) then 
database:del("monsters:new:if:"..bot_id..msg.chat_id_..msg.sender_user_id_)
send(msg.chat_id_, msg.id_, 1, '📥┇الان ارسل نوع الصلاحيه المطلوبه \n🔰┇{ `مدير` ،`ادمن` ،`عضو مميز` ,`لا شيئ `}', 1, 'md')
database:set("monsters:new:if:text:"..bot_id..msg.chat_id_..msg.sender_user_id_,text)
database:set("monsters:new:if2:"..bot_id..msg.chat_id_..msg.sender_user_id_,"ok1")
return "TSHAKE"
end
if (text and database:get("monsters:new:if2:"..bot_id..msg.chat_id_..msg.sender_user_id_)) then 
if (text == "ادمن" or text == "مدير" or text == "عضو مميز" or text == "لا شيئ") then 
database:del("monsters:new:if2:"..bot_id..msg.chat_id_..msg.sender_user_id_)
tsha_text = database:get("monsters:new:if:text:"..bot_id..msg.chat_id_..msg.sender_user_id_)
send(msg.chat_id_, msg.id_, 1, '☑️┇تم حفض الصلاحيه بنجاح \n⚠️┇الاوامر { رفع/تنزيل '..tsha_text..' }', 1, 'md')
database:set("monsters:all_if:"..tsha_text..bot_id..msg.chat_id_,text)
database:del("monsters:new:if:text:"..bot_id..msg.chat_id_..msg.sender_user_id_)
else 
send(msg.chat_id_, msg.id_, 1, '📥┇الان ارسل نوع الصلاحيه المطلوبه \n🔰┇{ `مدير` ،`ادمن` ،`عضو مميز` ,`لا شيئ `}', 1, 'md')
end
end
if text then 
if text:match("^رفع (.*)$")  and (is_owner(msg) or is_creatorbasic(msg)) and msg.reply_to_message_id_ then
a = {string.match(text, "^رفع (.*)$")}
ts_text = database:get("monsters:all_if:"..a[1]..bot_id..msg.chat_id_)
if ts_text then 
function promote_by_reply(extra, result, success)
if ts_text == "ادمن" then 
database:sadd('monsters:'..bot_id..'mods:'..msg.chat_id_, result.sender_user_id_)
elseif ts_text == "عضو مميز" then 
database:sadd('monsters:'..bot_id..'vipgp:'..msg.chat_id_, result.sender_user_id_)
elseif ts_text == "مدير" then 
database:sadd('monsters:'..bot_id..'owners:'..msg.chat_id_, result.sender_user_id_)
end
database:set("monsters:name_user:"..bot_id..msg.chat_id_..result.sender_user_id_,a[1])
function keko33332(extra,result2,success)
info = '👤┇العضو ~⪼ ['..result2.first_name_..'](t.me/'..(result2.username_ or 'mons_bot')..')\n☑┇تم رفعه '..a[1]
send(msg.chat_id_, msg.id_, 1,info, 1, 'md')
end
getUser(result.sender_user_id_, keko33332)  
end 
getMessage(msg.chat_id_, msg.reply_to_message_id_,promote_by_reply)
end 
end
if text:match("^رفع (.*) @(.*)$") and (is_owner(msg) or is_creatorbasic(msg)) then
local apmd = {string.match(text, "^رفع (.*) @(.*)$")}
ts_text = database:get("monsters:all_if:"..apmd[1]..bot_id..msg.chat_id_)
if ts_text then 
function promote_by_username(extra, result, success)
if result.id_ then
if ts_text == "ادمن" then 
database:sadd('monsters:'..bot_id..'mods:'..msg.chat_id_, result.id_)
elseif ts_text == "عضو مميز" then 
database:sadd('monsters:'..bot_id..'vipgp:'..msg.chat_id_, result.id_)
elseif ts_text == "مدير" then 
database:sadd('monsters:'..bot_id..'owners:'..msg.chat_id_, result.id_)
end
database:set("monsters:name_user:"..bot_id..msg.chat_id_..result.id_,apmd[1])
texts = '👤┇العضو ~⪼ ['..result.title_..'](t.me/'..(apmd[2] or 'mons_bot')..')\n☑┇تم رفعه '..apmd[1]
else
texts = '✖┇خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apmd[2],promote_by_username)
end
end
if text:match("^رفع (.*) (%d+)$") and (is_owner(msg) or is_creatorbasic(msg)) then
local apmd = {string.match(text, "^رفع (.*) (%d+)$")}
ts_text = database:get("monsters:all_if:"..apmd[1]..bot_id..msg.chat_id_)
if ts_text then 
if ts_text == "ادمن" then 
database:sadd('monsters:'..bot_id..'mods:'..msg.chat_id_, apmd[2])
elseif ts_text == "عضو مميز" then 
database:sadd('monsters:'..bot_id..'vipgp:'..msg.chat_id_, apmd[2])
elseif ts_text == "مدير" then 
database:sadd('monsters:'..bot_id..'owners:'..msg.chat_id_, apmd[2])
end
database:set("monsters:name_user:"..bot_id..msg.chat_id_..apmd[2],apmd[1])
tsX000(apmd[2],msg,"☑┇تم رفعه "..apmd[1])
end
end
if text:match("^تنزيل (.*)$") and (is_owner(msg) or is_creatorbasic(msg)) and msg.reply_to_message_id_ then
a = {string.match(text, "^تنزيل (.*)$")}
ts_text = database:get("monsters:all_if:"..a[1]..bot_id..msg.chat_id_)
if ts_text then 
function demote_by_reply(extra, result, success)
if ts_text == "ادمن" then 
database:srem('monsters:'..bot_id..'mods:'..msg.chat_id_, result.sender_user_id_)
elseif ts_text == "عضو مميز" then 
database:srem('monsters:'..bot_id..'vipgp:'..msg.chat_id_, result.sender_user_id_)
elseif ts_text == "مدير" then 
database:srem('monsters:'..bot_id..'owners:'..msg.chat_id_, result.sender_user_id_)
end
database:del("monsters:name_user:"..bot_id..msg.chat_id_..result.sender_user_id_)
tsX000("prore",msg,"🔰┇تم تنزيله من "..a[1])
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,demote_by_reply)
end
end
if text:match("^تنزيل (.*) @(.*)$") and (is_owner(msg) or is_creatorbasic(msg)) then
local apmd = {string.match(text, "^تنزيل (.*) @(.*)$")}
ts_text = database:get("monsters:all_if:"..apmd[1]..bot_id..msg.chat_id_)
if ts_text then 
function demote_by_username(extra, result, success)
if result.id_ then
if ts_text == "ادمن" then 
database:srem('monsters:'..bot_id..'mods:'..msg.chat_id_, result.id_)
elseif ts_text == "عضو مميز" then 
database:srem('monsters:'..bot_id..'vipgp:'..msg.chat_id_, result.id_)
elseif ts_text == "مدير" then 
database:srem('monsters:'..bot_id..'owners:'..msg.chat_id_, result.
