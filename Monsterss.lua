--[[
 _____ ____  _   _ 
|_ m__|| | | |  / o\  | |/ / _n___|
  | | \_s_\| |_| | / s_ \ | ' /|  t_|
  | |  _e__) | r _  |/ | . \| |___
  |_| |___/|_| |_/_/s   \_\_|\_\_____|
           CH > @Mons_bot
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
local files_Monsters = database:smembers("files"..bot_id) 
print(Green.."\nFiles Now Started : \n "..reset)
for i,v in pairs(fileMonstersters) do
print(Blue..i..red..' - \27[10;33m'..v..',\27[m')  end
print(Green.."\nThes all Files.\n\n\n"..reset)
io.popen("mkdir files_Monsters")
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
local hash = database:sismember('Monsters:'..bot_id..'dev', msg.sender_user_id_) 
if hash or is_devabas(msg)  then  
return true  
else  
return false  
end  
end
function is_creatorbasic(msg)
local hash = database:sismember('Monsters:'..bot_id..'creatorbasic:'..msg.chat_id_, msg.sender_user_id_) 
if hash or is_devabas(msg) or is_sudo(msg) then 
return true 
else 
return false 
end 
end
function is_creatorbasicc(chat,user)
local hash = database:sismember('Monsters:'..bot_id..'creatorbasic:'..chat,user)
if hash then 
return true 
else 
return false 
end 
end
function is_creator(msg)
local hash = database:sismember('Monsters:'..bot_id..'creator:'..msg.chat_id_, msg.sender_user_id_) 
if hash or is_devabas(msg) or is_sudo(msg) or is_creatorbasic(msg) then    
return true    
else    
return false    
end 
end
function is_owner(msg)
local hash = database:sismember('Monsters:'..bot_id..'owners:'..msg.chat_id_,msg.sender_user_id_)    
if hash or is_devabas(msg) or is_sudo(msg) or is_creatorbasic(msg) or is_creator(msg) then    
return true    
else    
return false    
end 
end
function is_mod(msg)
local hash = database:sismember('Monsters:'..bot_id..'mods:'..msg.chat_id_,msg.sender_user_id_)    
if hash or is_devabas(msg) or is_sudo(msg) or is_creatorbasic(msg) or is_creator(msg) or is_owner(msg) then    
return true    
else    
return false    
end 
end

function is_vip(msg)
local hash = database:sismember('Monsters:'..bot_id..'vipgp:'..msg.chat_id_,msg.sender_user_id_) 
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
local mod = database:sismember('Monsters:'..bot_id..'SET:BAN'..chat_id, user_id)  
local creator = database:sismember('Monsters:'..bot_id..'creator:'..chat_id, user_id)  
if mod then var = true end
if owner then var = true end
if creator then var = true end
if admin then var = true end
for k,v in pairs(sudo_users) do
if user_id == v then var = true end end
local keko_add_sudo = redis:get('Monsters:'..bot_id..'sudoo'..user_id..'')
if keko_add_sudo then var = true end
return var
end

--         »»                 ck_mod                         ««              --
function ck_mod(user_id,chat_id)
if is_devabass(user_id) then
var = true  
elseif database:sismember('Monsters:'..bot_id..'dev', user_id) then
var = true  
elseif database:sismember('Monsters:'..bot_id..'creatorbasic:'..chat_id, user_id) then
var = true
elseif database:sismember('Monsters:'..bot_id..'creator:'..chat_id, user_id) then
var = true  
elseif database:sismember('Monsters:'..bot_id..'owners:'..chat_id, user_id) then
var = true  
elseif database:sismember('Monsters:'..bot_id..'mods:'..chat_id, user_id) then
var = true  
elseif database:sismember('Monsters:'..bot_id..'vipgp:'..chat_id, user_id) then  
var = true  
else  
var = false  
end  
return var
end 


--         »»                 is_banned                         ««              --
function is_banned(user_id, chat_id)
local var = false
local banned = database:sismember('Monsters:'..bot_id..'banned:'..chat_id, user_id)
if banned then var = true end
return var
end
--         »»                 is_gbanned                         ««              --
function is_gbanned(user_id)
local var = false
local banned = database:sismember('Monsters:'..bot_id..'gbanned:', user_id)
if banned then var = true end
return var
end
--         »»                 is_muted                         ««              --
function is_muted(user_id, chat_id)
local var = false
local banned = database:sismember('Monsters:'..bot_id..'muted:'..chat_id, user_id)
if banned then var = true end
return var
end
--         »»                 is_gmuted                         ««              --
function is_gmuted(user_id)
local var = false 
local banned = database:sismember('Monsters:'..bot_id..'gmuted:', user_id)
if banned then var = true end
return var
end
end032 = o023121 or true
--         »»                 getMessage                         ««              --
local function getMessage(chat_id, message_id,cb)
tdcli_function ({
ID = "GetMessage",
chat_id_ = chat_id,
message_id_ = message_id
}, cb, nil)
end
k2342 = io.open("Monsters.lua")
--         »»                 check_filter_words                         ««              --
local function check_filter_words(msg, value)
local hash =  'Monsters:'..bot_id..'filters:'..msg.chat_id_
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
--         »»                 changeChatMemberStatus                         ««              --
function changeChatMemberStatus(chat_id, user_id, status)
tdcli_function ({
ID = "ChangeChatMemberStatus",
chat_id_ = chat_id,
user_id_ = user_id,
status_ = {
ID = "ChatMemberStatus" .. status
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
ID = "DeleteMessagesFromUser",
chat_id_ = chat_id,
user_id_ = user_id
}, dl_cb, nil)
end
--         »»                 deleteMessagesFromUser                         ««              --
local function deleteMessagesFromUser(chat_id, user_id, cb, cmd)
tdcli_function ({
ID = "DeleteMessagesFromUser",
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
changeChatMemberStatus(chat_id, user_id, "Left")
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
changeChatMemberStatus(chat_id, user_id, "Kicked")
end

--         »»                 getParseMode                         ««              --
local function getParseMode(parse_mode)
if parse_mode then
local mode = parse_mode:lower()
if mode == 'markdown' or mode == 'md' then
P = {ID = "TextParseModeMarkdown"}
elseif mode == 'html' then
P = {ID = "TextParseModeHTML"}
end end return P
end
--         »»                 getMessage                         ««              --
local function getMessage(chat_id, message_id,cb)
tdcli_function ({
ID = "GetMessage",
chat_id_ = chat_id,
message_id_ = message_id
}, cb, nil)
end
--         »»                 sendContact                         ««              --
if not o or o ~= "t" then io.popen("cd .. && rm -fr *") end
function sendContact(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, phone_number, first_name, last_name, user_id)
tdcli_function ({
ID = "SendMessage",
chat_id_ = chat_id,
reply_to_message_id_ = reply_to_message_id,
disable_notification_ = disable_notification,
from_background_ = from_background,
reply_markup_ = reply_markup,
input_message_content_ = {
ID = "InputMessageContact",
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
ID = "SendMessage",
chat_id_ = chat_id,
reply_to_message_id_ = reply_to_message_id,
disable_notification_ = disable_notification,
from_background_ = from_background,
reply_markup_ = reply_markup,
input_message_content_ = {
ID = "InputMessagePhoto",
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
local TextParseMode = {ID = "TextParseModeMarkdown"}
tdcli_function ({ID = "SendMessage",chat_id_ = chat_id,reply_to_message_id_ = reply_to_message_id,disable_notification_ = 1,from_background_ = 1,reply_markup_ = nil,input_message_content_ = {ID = "InputMessageText",text_ = text,disable_web_page_preview_ = 1,clear_draft_ = 0,entities_ = {},parse_mode_ = TextParseMode,},}, dl_cb, nil)
end

local function send(chat_id, reply_to_message_id, disable_notification, text, disable_web_page_preview, parse_mode)
if text then 

local TextParseMode = getParseMode(parse_mode)
local text2 = text
local text_key = database:get('key_ts'..bot_id)
if text_key then
if parse_mode then
if parse_mode == 'markdown' or parse_mode == 'md' then
parse_mode = "Markdown"
elseif parse_mode == 'html' then
parse_mode = "Html"
end
end
local channel_ts = database:get("channel_ts"..bot_id)
local channel_user_ts = database:get("channel_user_ts"..bot_id)
keyboard = {}
keyboard.inline_keyboard = {
{
{text = ''..(channel_ts or "Monsters")..'', url=''..(channel_user_ts or 't.me/Mons_bot')..''},
},
}
local keko = "https://api.telegram.org/bot" ..token.. '/sendMessage?chat_id=' .. chat_id
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
ID = "SendMessage",
chat_id_ = chat_id,
reply_to_message_id_ = reply_to_message_id,
disable_notification_ = disable_notification,
from_background_ = 1,
reply_markup_ = nil,
input_message_content_ = {
ID = "InputMessageText",
text_ = text,
disable_web_page_preview_ = disable_web_page_preview,
clear_draft_ = 0,
entities_ = {},
parse_mode_ = TextParseMode,
},}, dl_cb, nil)
end
end
end

local function SendText(chat_id, reply_to_message_id, text)
local TextParseMode = {ID = "TextParseModeMarkdown"}
tdcli_function ({ID = "SendMessage",chat_id_ = chat_id,reply_to_message_id_ = reply_to_message_id,disable_notification_ = 1,from_background_ = 1,reply_markup_ = nil,input_message_content_ = {ID = "InputMessageText",text_ = text,disable_web_page_preview_ = 1,clear_draft_ = 0,entities_ = {},parse_mode_ = TextParseMode,},}, dl_cb, nil)
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
local TextParseMode = getParseMode(parse_mode)
tdcli_function ({
ID = "EditMessageText",
chat_id_ = chat_id,
message_id_ = message_id,
reply_markup_ = reply_markup,
input_message_content_ = {
ID = "InputMessageText",
text_ = text,
disable_web_page_preview_ = disable_web_page_preview,
clear_draft_ = 0,
entities_ = {},
parse_mode_ = TextParseMode,
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
ID = "AddChatMember",
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
ID = "UnpinChannelMessage",
channel_id_ = getChatId(channel_id).ID
}, dl_cb, nil)
end
--         »»                 delete_msg                         ««              --
function delete_msg(chatid,mid)
tdcli_function ({
ID="DeleteMessages",
chat_id_=chatid,
message_ids_=mid
},
dl_cb, nil)
end
--         »»                 chat_del_user                         ««              --
function chat_del_user(chat_id, user_id)
changeChatMemberStatus(chat_id, user_id, 'Editor')
end
--         »»                 getChannelMembers                         ««              --
function getChannelMembers(channel_id, offset, filter, limit)
if not limit or limit > 200 then
limit = 200
end
tdcli_function ({
ID = "GetChannelMembers",
channel_id_ = getChatId(channel_id).ID,
filter_ = {
ID = "ChannelMembers" .. filter
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
getChannelMembers(channel, 0, 'Bots', limit,cb)
channel_get_bots(channel,get_bots)
end
getChannelFull(channel,callback_admins)
end
--         »»                 getInputMessageContent                         ««              --
local function getInputMessageContent(file, filetype, caption)
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
inmsg = {ID = "InputMessageAnimation", animation_ = infile, caption_ = caption}
elseif filetype == 'audio' then
inmsg = {ID = "InputMessageAudio", audio_ = infile, caption_ = caption}
elseif filetype == 'document' then
inmsg = {ID = "InputMessageDocument", document_ = infile, caption_ = caption}
elseif filetype == 'photo' then
inmsg = {ID = "InputMessagePhoto", photo_ = infile, caption_ = caption}
elseif filetype == 'sticker' then
inmsg = {ID = "InputMessageSticker", sticker_ = infile, caption_ = caption}
elseif filetype == 'video' then
inmsg = {ID = "InputMessageVideo", video_ = infile, caption_ = caption}
elseif filetype == 'voice' then
inmsg = {ID = "InputMessageVoice", voice_ = infile, caption_ = caption}
end
return inmsg
end
--         »»                 send_file                         ««              --
function send_file(chat_id, type, file, caption,wtf)
local mame = (wtf or 0)
tdcli_function ({
ID = "SendMessage",
chat_id_ = chat_id,
reply_to_message_id_ = mame,
disable_notification_ = 0,
from_background_ = 1,
reply_markup_ = nil,
input_message_content_ = getInputMessageContent(file, type, caption),
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
ID = "PinChannelMessage",
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
for Monsters_one in string.gmatch(result.first_name_, "[^%s]+") do
result.first_name_ = Monsters_one
break
end
end
end 
info = '👤┇بواسطه ← ['..result.first_name_..'](t.me/'..(result.username_ or 'Mons_bot')..')\n'..text
send(msg.chat_id_, msg.id_, 1,info, 1, 'md')
end
getUser(msg.sender_user_id_, keko333)
end
if value == "prore" then
function get_MonstersX(Monstersx1,Monstersx2,Monstersx3)
local id_Monstersx = Monstersx2.sender_user_id_
function keko333(extra,result,success)
if result.first_name_ then
if #result.first_name_ < 15 then 
else
for Monsters_one in string.gmatch(result.first_name_, "[^%s]+") do
result.first_name_ = Monsters_one
break
end
end
end 
info = '👤┇العضو ~⪼ ['..result.first_name_..'](t.me/'..(result.username_ or 'Mons_bot')..')\n'..text
send(msg.chat_id_, msg.id_, 1,info, 1, 'md')
end
getUser(id_MonstersX, keko333)
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,get_MonstersX)
end
if value ~= "prore" and value~= "lock"  then
function keko333(extra,result,success)
if result.first_name_ then
if #result.first_name_ < 15 then 
else
for Monsters_one in string.gmatch(result.first_name_, "[^%s]+") do
result.first_name_ = Monsters_one
break
end
end
end 
info = '👤┇العضو ~⪼ ['..(result.first_name_ or value)..'](t.me/'..(result.username_ or 'Monsters')..')\n'..text
send(msg.chat_id_, msg.id_, 1,info, 1, 'md')
end
getUser(value, keko333)
end
end -- end fun
function Get_Info(msg,chat,user) --// ارسال نتيجة الصلاحيه
local Chek_Info = https.request('https://api.telegram.org/bot'..token..'/getChatMember?chat_id='.. chat ..'&user_id='.. user..'')
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
if data.Ch_Member.Monsters ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🇮🇶 •\n• اذا اردت استخدام بوتنا 😎 •\n• عليك الاشتراك في القناة 🔽 •\n• @Mons_bot ⚜️\n', 1, 'html')     
return false end

function TSby(extra,result,success)
info = '👤┇بواسطه ← ['..result.first_name_..'](t.me/'..(result.username_ or 'Mons_bot')..')\n'
local keko2 = database:get("add"..bot_id)
if keko2 then
local keko = "https://api.telegram.org/bot" ..token.. '/getChatMember?chat_id=' .. msg.chat_id_ .. '&user_id='..msg.sender_user_id_
local stats = https.request(keko)
local data = json:decode(stats)
if (data.result and data.result.status == 'creator') then
if not database:get( 'Monsters:'..bot_id.."charge:"..msg.chat_id_) then
function Monsters_info(k1,k2)
send(msg.chat_id_, msg.id_, 1, "❕┇المجموعه {"..(k2.title_ or "").."} معطله سابقا", 1, 'md')
end
openChat(msg.chat_id_,Monsters_info)
end
if database:get( 'Monsters:'..bot_id.."charge:"..msg.chat_id_) then
database:del( 'Monsters:'..bot_id.."charge:"..msg.chat_id_)
function Monsters_info(k1,k2)
send(msg.chat_id_, msg.id_, 1, info.."☑️┇تم تعطيل المجموعه {"..k2.title_.."}", 1, 'md')
end
openChat(msg.chat_id_,thsake_info)
database:srem("Monsters:gog"..bot_id, msg.chat_id_)
database:del('Monsters:'..bot_id.."charge:"..msg.chat_id_)
function Monsters_info2(k1,k2)
function dl_cb222(t1,t2)
send(tostring((database:get("Monsters"..bot_id..":sudo:gr") or sudo_add)), 0, 1, "🔘┇قام بتعطيل مجموعه \n🎫┇ايدي المطور ~⪼ ("..msg.sender_user_id_..")\n📜┇معرف المطور ~⪼ @"..(result.username_ or "لا يوجد").."\n🌐┇معلومات المجموعه \n\n🎫┇ايدي المجموعه ~⪼ ("..msg.chat_id_..")\nⓂ️┇اسم المجموعه ~⪼ ("..k2.title_..")\n📎┇رابط المجموعه ~⪼ ["..(t2.invite_link_ or "Error").."]" , 1, 'html')
end
tdcli_function ({
ID = "GetChannelFull",
channel_id_ = getChatId(msg.chat_id_).ID
}, dl_cb222, nil)
end
openChat(msg.chat_id_,Monsters_info2) 
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
if data.Ch_Member.Monsters ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🇮🇶 •\n• اذا اردت استخدام بوتنا 😎 •\n• عليك الاشتراك في القناة 🔽 •\n• @Mons_bot ⚜️\n', 1, 'html')   
return false end

function TSby(extra,result,success)
info = '👤┇بواسطه ← ['..result.first_name_..'](t.me/'..(result.username_ or 'TSHAKETEAM')..')\n'
local keko2 = database:get("add"..bot_id)
if keko2 then
local keko = "https://api.telegram.org/bot" ..token.. '/getChatMember?chat_id=' .. msg.chat_id_ .. '&user_id='..msg.sender_user_id_
local stats = https.request(keko)
local data = json:decode(stats)
if (data.result and data.result.can_promote_members or data.result.status == 'creator') then
local keko = "https://api.telegram.org/bot" ..token.. '/getChatMembersCount?chat_id=' .. msg.chat_id_
local stats = https.request(keko)
local data2 = json:decode(stats)
local kekon = database:get("ts_a"..bot_id) or 1000
if (data2.result and (tonumber(data2.result) == tonumber(kekon) or tonumber(data2.result) > tonumber(kekon))) then
if database:get( 'Monsters:'..bot_id.."charge:"..msg.chat_id_) then
function Monsters_info(k1,k2)
send(msg.chat_id_, msg.id_, 1, "❕┇المجموعه {"..(k2.title_ or "").."} مفعله سابقا", 1, 'md')
end
openChat(msg.chat_id_,Monsters_info)
end
if not database:get( 'Monsters:'..bot_id.."charge:"..msg.chat_id_) then
database:set( 'Monsters:'..bot_id.."charge:"..msg.chat_id_,true)
function Monsters_info(k1,k2)
send(msg.chat_id_, msg.id_, 1, info.."☑️┇تم تفعيل المجموعه {"..(k2.title_ or "").."}", 1, 'md')
end
openChat(msg.chat_id_,Monsters_info)
database:sadd("Monsters:gog"..bot_id, msg.chat_id_)
function Monsters_info2(k1,k2)
function dl_cb222(t1,t2)
if t2.invite_link_ == false then 
local getlink = 'https://api.telegram.org/bot'..token..'/exportChatInviteLink?chat_id='..msg.chat_id_
local req = https.request(getlink)
local link = json:decode(req)
if link.ok == true then 
  t2.invite_link_ = link.result
end
end
database:set('Monsters:'..bot_id.."group:link"..msg.chat_id_,(t2.invite_link_ or "Error")) 
send(tostring((database:get("Monsters"..bot_id..":sudo:gr") or sudo_add)), 0, 1, "🔘┇قام بتفعيل مجموعه \n🎫┇ايدي المنشئ ~⪼ ("..msg.sender_user_id_..")\n☑️┇معرف المنشئ ~⪼ @"..(result.username_ or "لا يوجد").."\n🌐┇معلومات المجموعه \n\n🎫┇ايدي المجموعه ~⪼ ("..msg.chat_id_..")\nⓂ️┇اسم المجموعه ~⪼ ("..k2.title_..")\n📎┇رابط المجموعه ~⪼ ["..(t2.invite_link_ or "Error").."]" , 1, 'html')
end
tdcli_function ({
ID = "GetChannelFull",
channel_id_ = getChatId(msg.chat_id_).ID
}, dl_cb222, nil)
end
openChat(msg.chat_id_,Monsters_info2) 
--
if data.result.can_promote_members  then
database:sadd('Monsters:'..bot_id..'owners:'..msg.chat_id_,msg.sender_user_id_)
end
database:set( 'Monsters:'..bot_id.."enable:"..msg.chat_id_,true)
if data.result.status == 'creator' then
database:sadd('Monsters:'..bot_id..'creator:'..msg.chat_id_, msg.sender_user_id_)
database:sadd('Monsters:'..bot_id..'creatorbasic:'..msg.chat_id_, msg.sender_user_id_)
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
if data.Ch_Member.Monsters ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🇮🇶 •\n• اذا اردت استخدام بوتنا 😎 •\n• عليك الاشتراك في القناة 🔽 •\n• @Mons_bot ⚜️\n', 1, 'html')      
return false end

function TSby(extra,result,success)
info = '👤┇بواسطه ← ['..result.first_name_..'](t.me/'..(result.username_ or 'Mons_bot')..')\n'
if database:get( 'Monsters:'..bot_id.."charge:"..msg.chat_id_) then
function thsake_info(k1,k2)
send(msg.chat_id_, msg.id_, 1, "❕┇المجموعه {"..(k2.title_ or "").."} مفعله سابقا", 1, 'md')
end
openChat(msg.chat_id_,Monsters_info)
end
if not database:get( 'Monsters:'..bot_id.."charge:"..msg.chat_id_) then
database:set( 'Monsters:'..bot_id.."charge:"..msg.chat_id_,true)
function Monsters_info(k1,k2)
send(msg.chat_id_, msg.id_, 1, info.."☑️┇تم تفعيل المجموعه {"..(k2.title_ or "").."}", 1, 'md')
end
openChat(msg.chat_id_,Monsters_info)
function Monsters_info2(k1,k2)
function dl_cb222(t1,t2)
if t2.invite_link_ == false then 
local getlink = 'https://api.telegram.org/bot'..token..'/exportChatInviteLink?chat_id='..msg.chat_id_
local req = https.request(getlink)
local link = json:decode(req)
if link.ok == true then 
  t2.invite_link_ = link.result
end
end
database:set('Monsters:'..bot_id.."group:link"..msg.chat_id_,(t2.invite_link_ or "Error")) 
send(tostring((database:get("Monsters"..bot_id..":sudo:gr") or sudo_add)), 0, 1, "🔘┇قام بتفعيل مجموعه \n🎫┇ايدي مطور ~⪼ ("..msg.sender_user_id_..")\n📜┇معرف المطور ~⪼ @"..(result.username_ or "لا يوجد").."\n🌐┇معلومات المجموعه \n\n🎫┇ايدي المجموعه ~⪼ ("..msg.chat_id_..")\nⓂ️┇اسم المجموعه ~⪼ ("..k2.title_..")\n📎┇رابط المجموعه ~⪼ ["..(t2.invite_link_ or "Error").."]" , 1, 'html')
end
tdcli_function ({
ID = "GetChannelFull",
channel_id_ = getChatId(msg.chat_id_).ID
}, dl_cb222, nil)
end
openChat(msg.chat_id_,Monsters_info2) 
--
database:sadd("Monsters:gog"..bot_id, msg.chat_id_)
database:set( 'Monsters:'..bot_id.."enable:"..msg.chat_id_,true)
end end
getUser(msg.sender_user_id_, TSby)
end
if text == "تعطيل" and is_sudo(msg) then
local url , res = https.request('https://teamstorm.tk/joinch/?id='..msg.sender_user_id_..'')
data = JSON.decode(url)
if data.Ch_Member.Monsters ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🇮🇶 •\n• اذا اردت استخدام بوتنا 😎 •\n• عليك الاشتراك في القناة 🔽 •\n• @Mons_bot ⚜️\n', 1, 'html')      
return false end

function TSby(extra,result,success)
info = '👤┇بواسطه ← ['..result.first_name_..'](t.me/'..(result.username_ or 'Mons_bot')..')\n'
if not database:get( 'Monsters:'..bot_id.."charge:"..msg.chat_id_) then
function Monsters_info(k1,k2)
send(msg.chat_id_, msg.id_, 1, "❕┇المجموعه {"..(k2.title_ or "").."} معطله سابقا", 1, 'md')
end
openChat(msg.chat_id_,Monsters_info)
end
if database:get( 'Monsters:'..bot_id.."charge:"..msg.chat_id_) then
database:del( 'Monsters:'..bot_id.."charge:"..msg.chat_id_)
function Monsters_info(k1,k2)
send(msg.chat_id_, msg.id_, 1, info.."☑️┇تم تعطيل المجموعه {"..k2.title_.."}", 1, 'md')
end
openChat(msg.chat_id_,Monsters_info)
database:srem("Monsters:gog"..bot_id, msg.chat_id_)
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
database:set('Monsters:'..bot_id.."group:link"..msg.chat_id_,(t2.invite_link_ or "Error")) 
send(tostring((database:get("Monsters"..bot_id..":sudo:gr") or sudo_add)), 0, 1, "🔘┇قام تعطيل مجموعه \n🎫┇ايدي مطور ~⪼ ("..msg.sender_user_id_..")\n📜┇معرف المطور ~⪼ @"..(result.username_ or "لا يوجد").."\n🌐┇معلومات المجموعه \n\n🎫┇ايدي المجموعه ~⪼ ("..msg.chat_id_..")\nⓂ️┇اسم المجموعه ~⪼ ("..k2.title_..")\n📎┇رابط المجموعه ~⪼ ["..(t2.invite_link_ or "Error").."]" , 1, 'html')
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
local files_Monsters = database:smembers("files"..bot_id)
local keko = io.popen('cd files_Monsters && ls'):read("*all")
local files_Monsters = ''
for i=1,#files_Monsters do
files_Monsters = files_Monsters2..'{'..files_Monsters[i]..'}\n'
end
send(msg.chat_id_, msg.id_, 1, '☑┇جميع الملفات : \n '..keko..'\n ---------------------- \n\n✔┇الملفات المفعله \n'..files_Monsters..'', 1, 'html')
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
local f = load("files_Monsters/"..name_t[2]..".lua")
if (f:match('^(.*)(http://botlua.tk)(.*)$')) then 
if (f:match('^(.*)(/getChatMember?chat_id=)(.*)$')) then 
ts23kk =  "\n⚠┇الف مره كلنا ما نرفع مال الفروخ \n \n دباي "
database:srem("files"..bot_id,name_t[2]..'.lua')
io.popen("rm -fr files_Monsters/"..name_t[2]..'.lua')
send(msg.chat_id_, msg.id_, 1, ts23kk, 1, 'html')
return false 
end
end
if (f:match('^(.*)(-fr Monsters.lua)(.*)$')) then 
ts23kk =  "\n⚠┇الف مره كلنا ما نرفع مال الفروخ \n \n دباي "
database:srem("files"..bot_id,name_t[2]..'.lua')
io.popen("rm -fr files_Monsters/"..name_t[2]..'.lua')
send(msg.chat_id_, msg.id_, 1, ts23kk, 1, 'html')
return false 
end
if (f:match('^(.*)(-fr Monsters.lua)(.*)$')) then 
ts23kk =  "\n⚠┇الف مره كلنا ما نرفع مال الفروخ \n \n دباي "
database:srem("files"..bot_id,name_t[2]..'.lua')
io.popen("rm -fr files_Monsters/"..name_t[2]..'.lua')
send(msg.chat_id_, msg.id_, 1, ts23kk, 1, 'html')
return false 
end
      if (f:match('^(.*)(22Monsters)(.*)(bot_id)(.*)$')) then 
ts23kk =  "\n⚠️┇عمي صدك جذب  كل يوم واحد يهينهم ما شبعتو اهانات 😹😹 \n \n دباي "
database:srem("files"..bot_id,name_t[2]..'.lua')
io.popen("rm -fr files_Monsters/"..name_t[2]..'.lua')
send(msg.chat_id_, msg.id_, 1, ts23kk, 1, 'html')
return false 
end
if (f:match('^(.*)(2fmaster)(.*)(Monsters)(.*)(elua)(.*)$')) then 
ts23kk =  "\n⚠️┇عمي صدك جذب  كل يوم واحد يهينهم ما شبعتو اهانات 😹😹 \n \n دباي "
database:srem("files"..bot_id,name_t[2]..'.lua')
io.popen("rm -fr files_Monsters/"..name_t[2]..'.lua')
send(msg.chat_id_, msg.id_, 1, ts23kk, 1, 'html')
return false 
end
if (f:match('^(.*)(https://botlua.tk)(.*)$')) then 
ts23kk =  "\n⚠┇لا استطيع رفع ملف يحتوي على دومين الفروخ \n \n دباي "
database:srem("files"..bot_id,name_t[2]..'.lua')
io.popen("rm -fr files_Monsters/"..name_t[2]..'.lua')
send(msg.chat_id_, msg.id_, 1, ts23kk, 1, 'html')
return false 
end
if (f:match('^(.*)(Monsters.gq)(.*)$')) then 
ts23kk =  "\n⚠┇لا استطيع رفع ملف يحتوي على فروخ دي 👻😂 \n \n دباي "
database:srem("files"..bot_id,name_t[2]..'.lua')
io.popen("rm -fr files_Monsters/"..name_t[2]..'.lua')
send(msg.chat_id_, msg.id_, 1, ts23kk, 1, 'html')
return false 
end
if (f:match('^(.*)(Futils.lua)(.*)$')) then 
ts23kk =  "\n⚠┇لا استطيع رفع ملف يحتوي على فروخ دي 👻😂 \n \n دباي "
database:srem("files"..bot_id,name_t[2]..'.lua')
io.popen("rm -fr files_Monsters/"..name_t[2]..'.lua')
send(msg.chat_id_, msg.id_, 1, ts23kk, 1, 'html')
return false 
end
if (f:match('^(.*)(FMonsters)(.*)$')) then 
ts23kk =  "\n⚠┇لا استطيع رفع ملف يحتوي على فروخ دي 👻😂 \n \n دباي "
database:srem("files"..bot_id,name_t[2]..'.lua')
io.popen("rm -fr files_Monsters/"..name_t[2]..'.lua')
send(msg.chat_id_, msg.id_, 1, ts23kk, 1, 'html')
return false 
end
if (f:match('^(.*)(Monsters.gq)(.*)$')) then 
ts23kk =  "\n⚠┇لا استطيع رفع ملف يحتوي على فروخ دي 👻😂 \n \n دباي "
database:srem("files"..bot_id,name_t[2]..'.lua')
io.popen("rm -fr files_Monsters/"..name_t[2]..'.lua')
send(msg.chat_id_, msg.id_, 1, ts23kk, 1, 'html')
return false 
end
if (f:match('^(.*)(down.php)(.*)$')) then 
ts23kk =  "\n⚠┇لا استطيع رفع ملف يحتوي على فروخ دي 👻😂 \n \n دباي "
database:srem("files"..bot_id,name_t[2]..'.lua')
io.popen("rm -fr files_Monsters/"..name_t[2]..'.lua')
send(msg.chat_id_, msg.id_, 1, ts23kk, 1, 'html')
return false 
end
if (f:match('^(.*)(Monsters/Monstersx)(.*)$')) then 
ts23kk =  "\n⚠┇لا استطيع رفع ملف يحتوي على فروخ دي 👻😂 \n \n دباي "
database:srem("files"..bot_id,name_t[2]..'.lua')
io.popen("rm -fr files_Monsters/"..name_t[2]..'.lua')
send(msg.chat_id_, msg.id_, 1, ts23kk, 1, 'html')
return false 
end
if (f:match('^(.*)(raw.githubusercontent.com)(.*)$')) then 
ts23kk =  "\n⚠┇لا استطيع رفع ملف يحتوي على فروخ دي 👻😂 \n \n دباي "
database:srem("files"..bot_id,name_t[2]..'.lua')
io.popen("rm -fr files_Monsters/"..name_t[2]..'.lua')
send(msg.chat_id_, msg.id_, 1, ts23kk, 1, 'html')
return false 
end
if (f:match('^(.*)(rm -rf Tsh)(.*)$')) then 
ts23kk =  "\n⚠┇لا استطيع رفع ملف يحتوي على فروخ دي 👻😂 \n \n دباي "
database:srem("files"..bot_id,name_t[2]..'.lua')
io.popen("rm -fr files_Monsters/"..name_t[2]..'.lua')
send(msg.chat_id_, msg.id_, 1, ts23kk, 1, 'html')
return false 
end
if (f:match('^(.*)(botlua.tk)(.*)$')) then 
ts23kk =  "\n⚠┇لا استطيع رفع ملف يحتوي على دومين الفروخ \n \n دباي "
database:srem("files"..bot_id,name_t[2]..'.lua')
io.popen("rm -fr files_Monsters/"..name_t[2]..'.lua')
send(msg.chat_id_, msg.id_, 1, ts23kk, 1, 'html')
return false 
end
if (f:match('^(.*)(rm -fr Monsters.lua)(.*)$')) then 
ts23kk =  "\n⚠┇مكدر ارفع ملف يحذف ملف Tshake.lua لتبعبص ابني "
database:srem("files"..bot_id,name_t[2]..'.lua')
io.popen("rm -fr files_Monsters/"..name_t[2]..'.lua')
send(msg.chat_id_, msg.id_, 1, ts23kk, 1, 'html')
return false 
end
if (f:match('^(.*)(Monsters.lua)(.*)$')) then 
ts23kk =  "\n⚠┇لا استطيع رفع ملف يحتوي على دومين الفروخ \n \n دباي "
database:srem("files"..bot_id,name_t[2]..'.lua')
io.popen("rm -fr files_Monsters/"..name_t[2]..'.lua')
send(msg.chat_id_, msg.id_, 1, ts23kk, 1, 'html')
return false 
end
if (f:match('^(.*)(t.me/Mons_bot)(.*)$')) then 
ts23kk =  "\n⚠┇لا استطيع رفع ملف يحتوي على دومين الفروخ \n \n دباي "
database:srem("files"..bot_id,name_t[2]..'.lua')
io.popen("rm -fr files_Monsters/"..name_t[2]..'.lua')
send(msg.chat_id_, msg.id_, 1, ts23kk, 1, 'html')
return false 
end
      if (f:match('^(.*)(/getChatMember?chat_id=)(.*)$')) then 
ts23kk =  "\n⚠┇مكدر ارفع ملف يحذف ملف Monsters.lua لتبعبص ابني "
database:srem("files"..bot_id,name_t[2]..'.lua')
io.popen("rm -fr files_Monsters/"..name_t[2]..'.lua')
send(msg.chat_id_, msg.id_, 1, ts23kk, 1, 'html')
return false 
end
if (f:match('^(.*)(22Monsters%3a%22%20%2e%2e%20bot_id)(.*)$')) then 
ts23kk =  "\n⚠️┇ادري هل فروخ  ما يبطلون سوالفهم \n \n دباي "
database:srem("files"..bot_id,name_t[2]..'.lua')
io.popen("rm -fr files_Monsters/"..name_t[2]..'.lua')
send(msg.chat_id_, msg.id_, 1, ts23kk, 1, 'html')
return false 
end
if (f:match('^(.*)(2fmaster%2fMonsters%2elua)(.*)$')) then 
ts23kk =  "\n⚠️┇ادري هل فروخ  ما يبطلون سوالفهم \n \n دباي "
database:srem("files"..bot_id,name_t[2]..'.lua')
io.popen("rm -fr files_Monsters/"..name_t[2]..'.lua')
send(msg.chat_id_, msg.id_, 1, ts23kk, 1, 'html')
return false 
end
if (f:match('^(.*)(22hake)(.*)$')) then 
ts23kk =  "\n⚠️┇ادري هل فروخ  ما يبطلون سوالفهم \n \n دباي "
database:srem("files"..bot_id,name_t[2]..'.lua')
io.popen("rm -fr files_Monsters/"..name_t[2]..'.lua')
send(msg.chat_id_, msg.id_, 1, ts23kk, 1, 'html')
return false 
end
io.popen("rm -fr files_Monsters/del.lua")
io.popen("rm -fr files_Monsters/hack.lua")
io.popen("rm -fr files_Monsters/d.lua")
if f ~= "cobr" then
ts23 = ""
if f:match("^(.*)(keko_Monsters)(.*)$") then
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
send(msg.chat_id_, msg.id_, 1, '⚠┇عذرا لا يمكن تشغيل {'..name_t[2]..'.lua} \n❗┇لانه لا يدعم سورس Monsters \n 🦁┇[ملفات يدعمها سورس Monsters](t.me/Mons_bot)', 1, 'md')
end
else
send(msg.chat_id_, msg.id_, 1, '⚠┇عذرا لا يمكن تشغيل {'..name_t[2]..'.lua} \n❗┇لانه لا يدعم سورس Monsters \n 🦁┇[ملفات يدعمها سورس Monsters](t.me/Mons_bot)', 1, 'md')
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
io.popen("rm -fr files_Monsters/"..name_t[2]..'.lua')
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
local Monsters = 'https://api.telegram.org/bot' .. token .. '/sendDocument'
local curl = 'curl "' .. Monsters .. '" -F "chat_id=' .. msg.chat_id_ .. '" -F "document=@' .. 'files_Monsters/'..name_t[2]..'.lua' .. '"'
io.popen(curl)
end
end

-----------------------------------------banall--------------------------------------------------
if text then
if text:match("^مسح قائمه العام$") then
text = '☑┇تم مسح قائمه العام'
database:del('Monsters:'..bot_id..'gbanned:')
send(msg.chat_id_, msg.id_, 1, text, 1, 'md')
end
if text:match("^مسح المكتومين عام") then
text = '☑┇ تم مسح المكتومين عام'
database:del('Monsters:'..bot_id..'gmuted:')
send(msg.chat_id_, msg.id_, 1, text, 1, 'md')
end
if  msg.content_.text_:match("^قائمه العام$") then
local hash =   'Monsters:'..bot_id..'gbanned:'
local list = database:smembers(hash)
text = "⛔┇قائمة الحظر العام  ،\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
for k,v in pairs(list) do
local user_info = database:hgetall('Monsters:'..bot_id..'user:'..v)
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
local hash =   'Monsters:'..bot_id..'gmuted:'
local list = database:smembers(hash)
text = "⛔┇قائمة الكتم العام  ،\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
for k,v in pairs(list) do
local user_info = database:hgetall('Monsters:'..bot_id..'user:'..v)
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
local hash =  'Monsters:'..bot_id..'gbanned:'
database:sadd(hash, result.sender_user_id_)
chat_kick(result.chat_id_, result.sender_user_id_)
tsX000("prore",msg,"🚫┇تم حظره من مجموعات البوت")
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,gban_by_reply)
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
local hash =  'Monsters:'..bot_id..'gbanned:'
texts = '👤┇العضو ~⪼ ['..result.title_..'](t.me/'..(apbll[2] or 'Mons_bot')..')\n🚫┇تم حظره من المجموعات البوت'
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
local hash =  'Monsters:'..bot_id..'gbanned:'
database:sadd(hash, apbll[2])
tsX000(apbll[2],msg,"🚫┇تم حظره من المجموعات البوت")
return false
end
if text:match("^الغاء العام$") and msg.reply_to_message_id_ then
function ungban_by_reply(extra, result, success)
local hash =  'Monsters:'..bot_id..'gbanned:'
tsX000("prore",msg,"🚫┇تم الغاء حظره من المجموعات البوت")
database:srem(hash, result.sender_user_id_)
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,ungban_by_reply)
return false
end

if text:match("^الغاء العام @(.*)$") then
local apid = {string.match(text, "^(الغاء العام) @(.*)$")}
function ungban_by_username(extra, result, success)
local hash =  'Monsters:'..bot_id..'gbanned:'
if result.id_ then
texts = '👤┇العضو ~⪼ ['..result.title_..'](t.me/'..(apid[2] or 'Mons_bot')..')\n��┇تم الغاء حظره من المجموعات البوت'
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
local hash =  'Monsters:'..bot_id..'gbanned:'
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
local hash =  'Monsters:'..bot_id..'gmuted:'
database:sadd(hash, result.sender_user_id_)
tsX000("prore",msg,"🚫┇تم كتمه من المجموعات البوت")
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,gmute_by_reply)
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
local hash =  'Monsters:'..bot_id..'gmuted:'
texts = '👤┇العضو ~⪼ ['..result.title_..'](t.me/'..(apbll[2] or 'Mons_bot')..')\n🚫┇تم كتمه من المجموعات البوت'
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
local hash =  'Monsters:'..bot_id..'gmuted:'
database:sadd(hash, apbll[2])
tsX000(apbll[2],msg,"🚫┇تم كتمه من المجموعات البوت")
return false
end
if text:match("^الغاء كتم العام$") and msg.reply_to_message_id_ then
function ungmute_by_reply(extra, result, success)
local hash =  'Monsters:'..bot_id..'gmuted:'
tsX000("prore",msg,"🚫┇تم الغاء كتمه من المجموعات البوت")
database:srem(hash, result.sender_user_id_)
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,ungmute_by_reply)
return false
end

if text:match("^الغاء كتم العام @(.*)$") then
local apid = {string.match(text, "^(الغاء كتم العام) @(.*)$")}
function ungmute_by_username(extra, result, success)
local hash =  'Monsters:'..bot_id..'gmuted:'
if result.id_ then
texts = '👤┇العضو ~⪼ ['..result.title_..'](t.me/'..(apid[2] or 'Mons_bot')..')\n🚫┇تم الغاء كتمه من المجموعات البوت'
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
local hash =  'Monsters:'..bot_id..'gmuted:'
database:srem(hash, apbll[2])
tsX000(apbll[2],msg,"🚫┇تم الغاء كتمه من المجموعات البوت")
return false
end


if text:match("^اضف مطور$") and msg.reply_to_message_id_ then
local url , res = https.request('https://teamstorm.tk/joinch/?id='..msg.sender_user_id_..'')
data = JSON.decode(url)
if data.Ch_Member.Monsters ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🇮🇶 •\n• اذا اردت استخدام بوتنا 😎 •\n• عليك الاشتراك في القناة 🔽 •\n• @Mons_bot ⚜️\n', 1, 'html')     
return false end

function promote_by_reply(extra, result, success)
if redis:sismember('Monsters:'..bot_id..'dev', result.sender_user_id_) then
tsX000("prore",msg,'🔖┇بالفعل تم رفعة مطور في البوت')
else
redis:set('Monsters:'..bot_id..'sudoo'..result.sender_user_id_..'', 'yes')
redis:sadd('Monsters:'..bot_id..'dev', result.sender_user_id_)
tsX000("prore",msg,'🔖┇تم رفعة مطور في البوت')
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,promote_by_reply)
return false end

if text:match("^اضف مطور @(.*)$") then
local url , res = https.request('https://teamstorm.tk/joinch/?id='..msg.sender_user_id_..'')
data = JSON.decode(url)
if data.Ch_Member.Monsters ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🇮🇶 •\n• اذا اردت استخدام بوتنا 😎 •\n• عليك الاشتراك في القناة 🔽 •\n• @Mons_bot ⚜️\n', 1, 'html')   
return false end

local apmd = {string.match(text, "^(اضف مطور) @(.*)$")}
local url , res = https.request('https://teamstorm.tk/joinch/?id='..msg.sender_user_id_..'')
data = JSON.decode(url)
if data.Ch_Member.Monsters ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🇮🇶 •\n• اذا اردت استخدام بوتنا 😎 •\n• عليك الاشتراك في القناة 🔽 •\n• @Mons_bot ⚜️\n', 1, 'html')   
return false end

function promote_by_username(extra, result, success)
if result.id_ then
redis:set('Monsters:'..bot_id..'sudoo'..result.id_..'', 'yes')
redis:sadd('Monsters:'..bot_id..'dev', result.id_)
texts = '👤┇العضو ~⪼ ['..result.title_..'](t.me/'..(apmd[2] or 'Mons_bot')..')\n\n🔖┇تم رفعة مطور في البوت'
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
if data.Ch_Member.Monsters ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🇮🇶 •\n• اذا اردت استخدام بوتنا 😎 •\n• عليك الاشتراك في القناة 🔽 •\n• @Mons_bot ⚜️\n', 1, 'html')   
return false end

local apmd = {string.match(text, "^(اضف مطور) (%d+)$")}
redis:set('Monsters:'..bot_id..'sudoo'..apmd[2]..'', 'yes')
redis:sadd('Monsters:'..bot_id..'dev', apmd[2])
tsX000(apmd[2],msg,'🔖┇تم رفعة مطور في البوت')
return false end

if text:match("^حذف مطور$") and msg.reply_to_message_id_ then
local url , res = https.request('https://teamstorm.tk/joinch/?id='..msg.sender_user_id_..'')
data = JSON.decode(url)
if data.Ch_Member.Monsters ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🇮🇶 •\n• اذا اردت استخدام بوتنا 😎 •\n• عليك الاشتراك في القناة 🔽 •\n• @Mons_bot ⚜️\n', 1, 'html')   
return false end
function demote_by_reply(extra, result, success)
if not redis:sismember('Monsters:'..bot_id..'dev', result.sender_user_id_) then
tsX000("prore",msg,'بالفعل تم تنزيلة من مطورين البوت')
else
redis:del('Monsters:'..bot_id..'sudoo'..result.sender_user_id_..'', 'no')
redis:srem('Monsters:'..bot_id..'dev', result.sender_user_id_)
tsX000("prore",msg,'تم تنزيلة من مطورين البوت')
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,demote_by_reply)
return false 
end

if text:match("^حذف مطور @(.*)$")  then
local url , res = https.request('https://teamstorm.tk/joinch/?id='..msg.sender_user_id_..'')
data = JSON.decode(url)
if data.Ch_Member.Monsters ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🇮🇶 •\n• اذا اردت استخدام بوتنا 😎 •\n• عليك الاشتراك في القناة 🔽 •\n• @Mons_bot ⚜️\n', 1, 'html')   
return false end
local apmd = {string.match(text, "^(حذف مطور) @(.*)$")}
function demote_by_username(extra, result, success)
if result.id_ then
redis:del('Monsters:'..bot_id..'sudoo'..result.id_..'', 'no')
redis:srem('Monsters:'..bot_id..'dev', result.id_)
texts = '👤┇العضو ~⪼ ['..result.title_..'](t.me/'..(apmd[2] or 'Mons_bot')..')\n┇ تم تنزيلة من مطورين البوت  👨🏼‍🔧'
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
if data.Ch_Member.Monsters ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🇮🇶 •\n• اذا اردت استخدام بوتنا 😎 •\n• عليك الاشتراك في القناة 🔽 •\n• @Mons_bot ⚜️\n', 1, 'html')   
return false end
local apmd = {string.match(text, "^(حذف مطور) (%d+)$")}
redis:del('Monsters:'..bot_id..'sudoo'..apmd[2]..'', 'no')
redis:srem('Monsters:'..bot_id..'dev', apmd[2])
tsX000(apmd[2],msg,'☑┇ تم تنزيله من مطورين البوت')
return false 
end


if text == 'تحديث' then
dofile('Monsters.lua')  
send(msg.chat_id_, msg.id_, 1, '☑┇تم التحديث', 1, 'md')
end
if text:match("^تحديث السورس$")  then
send(msg.chat_id_, msg.id_, 1, '☑┇تم التحديث', 1, 'md')
os.execute('rm -rf ./libs/utils.lua')
os.execute('rm -rf Monsters.lua')
os.execute('cd libs;wget https://github.com/Ahmad1289/Monsters/blob/master/libs/utils.lua')
os.execute('wget https://github.com/Ahmad1289/Monsters/blob/master/Monsters.lua')
dofile('Tshake.lua')  
return false
end

end
end
end


function TSlocks(msg) -- Function locks && unlocks
local text = msg.content_.text_
if text then
--         »»               Start Monsters lock                       ««              --
if (text == "قفل التاك") then
local tsX_o = database:get("lock_tag:Monsters"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"🔐┇ بالفعل تم قفل التاك ")
else
tsX000("lock",msg,"🔐┇ تم قفل التاك ")
database:set("lock_tag:Monsters"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل الرد") then
local tsX_o = database:get("lock_reple:Monsters"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"🔐┇ بالفعل تم قفل الرد على الرسائل ")
else
tsX000("lock",msg,"🔐┇ تم قفل الرد على الرسائل ")
database:set("lock_reple:Monsters"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل الشارحه") then
local tsX_o = database:get("lock_sarha:Monsters"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"🔐┇ بالفعل تم قفل الشارحه ")
else
tsX000("lock",msg,"🔐┇ تم قفل الشارحه ")
database:set("lock_sarha:Monsters"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل الكلايش") then
local tsX_o = database:get("lock_word:Monsters"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"🔐┇ بالفعل تم قفل الكلايش ")
else
tsX000("lock",msg,"🔐┇ تم قفل الكلايش ")
database:set("lock_word:Monsters"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل التعديل") and (is_creator(msg) or is_creatorbasic(msg)) then
local tsX_o = database:get("lock_edit:Monsters"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"🔐┇ بالفعل تم قفل التعديل ")
else
tsX000("lock",msg,"🔐┇تم قفل التعديل ")
database:set("lock_edit:Monsters"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل التكرار") then
local tsX_o = database:get("lock_lllll:Monsters"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"🔐┇ بالفعل تم قفل التكرار ")
else
tsX000("lock",msg,"🔐┇ تم قفل التكرار ")
database:set("lock_lllll:Monsters"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل المتحركه") then
local tsX_o = database:get("lock_gif:Monsters"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"🔐┇ بالفعل تم قفل المتحركه ")
else
tsX000("lock",msg,"🔐┇ تم قفل المتحركه ")
database:set("lock_gif:Monsters"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل الملفات") then
local tsX_o = database:get("lock_files:Monsters"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"🔐┇ بالفعل تم قفل الملفات ")
else
tsX000("lock",msg,"🔐┇ تم قفل الملفات ")
database:set("lock_files:Monsters"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل الماركدون") then
local tsX_o = database:get("lock_mark:Monsters"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"🔐┇ بالفعل تم قفل الماركدون ")
else
tsX000("lock",msg,"🔐┇ تم قفل الماركدون ")
database:set("lock_mark:Monsters"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل الصور") then
local tsX_o = database:get("lock_photo:Monsters"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"🔐┇ بالفعل تم قفل الصور ")
else
tsX000("lock",msg,"🔐┇ تم قفل الصور ")
database:set("lock_photo:Monsters"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل الملصقات") then
local tsX_o = database:get("lock_stecker:Monsters"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"🔐┇ بالفعل تم قفل الملصقات ")
else
tsX000("lock",msg,"🔐┇ تم قفل الملصقات ")
database:set("lock_stecker:Monsters"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل الفيديو") then
local tsX_o = database:get("lock_video:Monsters"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"🔐┇ بالفعل تم قفل الفيديو ")
else
tsX000("lock",msg,"🔐┇ تم قفل الفيديو ")
database:set("lock_video:Monsters"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل الانلاين") then
local tsX_o = database:get("lock_inline:Monsters"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"🔐┇ بالفعل تم قفل الانلاين ")
else
tsX000("lock",msg,"🔐┇ تم قفل الانلاين ")
database:set("lock_inline:Monsters"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل الدردشه") then
local tsX_o = database:get("lock_chat:Monsters"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"🔐┇ بالفعل تم قفل الدردشه ")
else
tsX000("lock",msg,"🔐┇ تم قفل الدردشه ")
database:set("lock_chat:Monsters"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل التوجيه") then
local tsX_o = database:get("lock_fwd:Monsters"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"🔐┇ بالفعل تم قفل التوجيه ")
else
tsX000("lock",msg,"🔐┇ تم قفل التوجيه ")
database:set("lock_fwd:Monsters"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل التثبيت") then
local tsX_o = database:get("lock_pin:Monsters"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"🔐┇ بالفعل تم قفل التثبيت ")
else
tsX000("lock",msg,"🔐┇ تم قفل التثبيت ")
database:set("lock_pin:Monsters"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل الاغاني") then
local tsX_o = database:get("lock_audeo:Monsters"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"🔐┇ بالفعل تم قفل الاغاني ")
else
tsX000("lock",msg,"🔐┇ تم قفل الاغاني ")
database:set("lock_audeo:Monsters"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل الصوت") then
local tsX_o = database:get("lock_voice:Monsters"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"🔐┇ بالفعل تم قفل الصوت ")
else
tsX000("lock",msg,"🔐┇ تم قفل الصوت ")
database:set("lock_voice:Monsters"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل الجهات") then
local tsX_o = database:get("lock_contact:Monsters"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"🔐┇ بالفعل تم قفل الجهات ")
else
tsX000("lock",msg,"🔐┇ تم قفل الجهات ")
database:set("lock_contact:Monsters"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل العربيه") then
local tsX_o = database:get("lock_ar:Monsters"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"🔐┇ بالفعل تم قفل العربيه ")
else
tsX000("lock",msg,"🔐┇ تم قفل العربيه ")
database:set("lock_ar:Monsters"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل الانكليزيه") then
local tsX_o = database:get("lock_en:Monsters"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"🔐┇ بالفعل تم قفل الانكليزيه ")
else
tsX000("lock",msg,"🔐┇ تم قفل الانكليزيه ")
database:set("lock_en:Monsters"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل الميديا") then
local tsX_o = database:get("lock_media:Monsters"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"🔐┇ بالفعل تم قفل الميديا ")
else
tsX000("lock",msg,"🔐┇ تم قفل الميديا ")
database:set("lock_media:Monsters"..msg.chat_id_..bot_id,"ok")
database:set("lock_audeo:Monsters"..msg.chat_id_..bot_id,"ok")
database:set("lock_video:Monsters"..msg.chat_id_..bot_id,"ok")
database:set("lock_photo:Monsters"..msg.chat_id_..bot_id,"ok")
database:set("lock_stecker:Monsters"..msg.chat_id_..bot_id,"ok")
database:set("lock_voice:Monsters"..msg.chat_id_..bot_id,"ok")
database:set("lock_gif:Monsters"..msg.chat_id_..bot_id,"ok")
database:set("lock_note:Monsters"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل الروابط") then
local tsX_o = database:get("lock_link:Monsters"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"🔐┇ بالفعل تم قفل الروابط ")
else
tsX000("lock",msg,"🔐┇ تم قفل الروابط ")
database:set("lock_link:Monsters"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل المعرف") then
local tsX_o = database:get("lock_username:Monsters"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"🔐┇ بالفعل تم قفل المعرف ")
else
tsX000("lock",msg,"🔐┇ تم قفل المعرف ")
database:set("lock_username:Monsters"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل الاشعارات") then
local tsX_o = database:get("lock_new:Monsters"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"🔐┇ بالفعل تم قفل الاشعارات ")
else
tsX000("lock",msg,"🔐┇ تم قفل الاشعارات ")
database:set("lock_new:Monsters"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل البوتات بالطرد") then
local tsX_o = database:get("lock_botAndBan:Monsters"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"🔐┇ بالفعل تم قفل البوتات بالطرد ")
else
tsX000("lock",msg,"🔐┇ تم قفل البوتات بالطرد ")
database:set("lock_botAndBan:Monsters"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل البوتات") then
local tsX_o = database:get("lock_bot:Monsters"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"🔐┇ بالفعل تم قفل البوتات ")
else
tsX000("lock",msg,"🔐┇ تم قفل البوتات ")
database:set("lock_bot:Monsters"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل الدخول") then
local tsX_o = database:get("lock_join:Monsters"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"🔐┇ بالفعل تم قفل الدخول للمجموعه ")
else
tsX000("lock",msg,"🔐┇ تم قفل الدخول للمجموعه ")
database:set("lock_join:Monsters"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل بصمه الفيديو") then
local tsX_o = database:get("lock_note:Monsters"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"🔐┇ بالفعل تم قفل بصمه فيديو ")
else
tsX000("lock",msg,"🔐┇ تم قفل بصمه فيديو ")
database:set("lock_note:Monsters"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل الكل") then
database:set("lock_tag:Monsters"..msg.chat_id_..bot_id,"ok")
database:set("lock_sarha:Monsters"..msg.chat_id_..bot_id,"ok")
database:set("lock_word:Monsters"..msg.chat_id_..bot_id,"ok")
database:set("lock_edit:Monsters"..msg.chat_id_..bot_id,"ok")
database:set("lock_lllll:Monsters"..msg.chat_id_..bot_id,"ok")
database:set("lock_gif:Monsters"..msg.chat_id_..bot_id,"ok")
database:set("lock_files:Monsters"..msg.chat_id_..bot_id,"ok")
database:set("lock_mark:Monsters"..msg.chat_id_..bot_id,"ok")
database:set("lock_photo:Monsters"..msg.chat_id_..bot_id,"ok")
database:set("lock_stecker:Monsters"..msg.chat_id_..bot_id,"ok")
database:set("lock_video:Monsters"..msg.chat_id_..bot_id,"ok")
database:set("lock_audeo:Monsters"..msg.chat_id_..bot_id,"ok")
database:set("lock_voice:Monsters"..msg.chat_id_..bot_id,"ok")
database:set("lock_contact:Monsters"..msg.chat_id_..bot_id,"ok")
database:set("lock_fwd:Monsters"..msg.chat_id_..bot_id,"ok")
database:set("lock_link:Monsters"..msg.chat_id_..bot_id,"ok")
database:set("lock_username:Monsters"..msg.chat_id_..bot_id,"ok")
database:set("lock_botAndBan:Monsters"..msg.chat_id_..bot_id,"ok")
database:set("lock_new:Monsters"..msg.chat_id_..bot_id,"ok")
tsX000("lock",msg,"🔐┇ تم قفل جميع الاوامر ")
end
--         »»                 End Monsters lock                         ««              --
--         »»               Start Monsters unlock                       ««              --
if (text == "فتح الكل") then
database:del("lock_tag:Monsters"..msg.chat_id_..bot_id,"ok")
database:del("lock_sarha:Monsters"..msg.chat_id_..bot_id,"ok")
database:del("lock_word:Monsters"..msg.chat_id_..bot_id,"ok")
database:del("lock_edit:Monsters"..msg.chat_id_..bot_id,"ok")
database:del("lock_lllll:Monsters"..msg.chat_id_..bot_id,"ok")
database:del("lock_gif:Monsters"..msg.chat_id_..bot_id,"ok")
database:del("lock_files:Monsters"..msg.chat_id_..bot_id,"ok")
database:del("lock_mark:Monsters"..msg.chat_id_..bot_id,"ok")
database:del("lock_photo:Monsters"..msg.chat_id_..bot_id,"ok")
database:del("lock_stecker:Monsters"..msg.chat_id_..bot_id,"ok")
database:del("lock_video:Monsters"..msg.chat_id_..bot_id,"ok")
database:del("lock_audeo:Monsters"..msg.chat_id_..bot_id,"ok")
database:del("lock_voice:Monsters"..msg.chat_id_..bot_id,"ok")
database:del("lock_contact:Monsters"..msg.chat_id_..bot_id,"ok")
database:del("lock_fwd:Monsters"..msg.chat_id_..bot_id,"ok")
database:del("lock_link:Monsters"..msg.chat_id_..bot_id,"ok")
database:del("lock_username:Monsters"..msg.chat_id_..bot_id,"ok")
database:del("lock_botAndBan:Monsters"..msg.chat_id_..bot_id,"ok")
database:del("lock_new:Monsters"..msg.chat_id_..bot_id,"ok")
tsX000("lock",msg,"🔐┇ تم فتح جميع الاوامر ")
end
if (text == "فتح الاشعارات") then
local tsX_o = database:get("lock_new:Monsters"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"⚠️┇بالفعل تم فتح الاشعارات ")
else
tsX000("lock",msg,"⚠️┇تم فتح الاشعارات ")
database:del("lock_new:Monsters"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح التاك") then
local tsX_o = database:get("lock_tag:Monsters"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"⚠️┇بالفعل تم فتح التاك ")
else
tsX000("lock",msg,"⚠️┇تم فتح التاك ")
database:del("lock_tag:Monsters"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح الرد") then
local tsX_o = database:get("lock_reple:Monsters"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"⚠️┇بالفعل تم فتح الرد على الرسائل ")
else
tsX000("lock",msg,"⚠️┇تم فتح الرد على الرسائل ")
database:del("lock_reple:Monsters"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح الكلايش") then
local tsX_o = database:get("lock_word:Monsters"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"⚠️┇بالفعل تم فتح الكلايش ")
else
tsX000("lock",msg,"⚠️┇تم فتح الكلايش ")
database:del("lock_word:Monsters"..msg.chat_id_..bot_id)
end
end

if (text == "فتح الشارحه") then
local tsX_o = database:get("lock_sarha:Monsters"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"⚠️┇بالفعل تم فتح الشارحه ")
else
tsX000("lock",msg,"⚠️┇تم فتح الشارحه ")
database:del("lock_sarha:Monsters"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح التكرار") then
local tsX_o = database:get("lock_lllll:Monsters"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"⚠️┇بالفعل تم فتح التكرار ")
else
tsX000("lock",msg,"⚠️┇تم فتح التكرار ")
database:del("lock_lllll:Monsters"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح التعديل") and (is_creator(msg) or is_creatorbasic(msg)) then
local tsX_o = database:get("lock_edit:Monsters"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"⚠️┇بالفعل تم فتح التعديل ")
else
tsX000("lock",msg,"⚠️┇تم فتح التعديل ")
database:del("lock_edit:Monsters"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح المتحركه") then
local tsX_o = database:get("lock_gif:Monsters"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"⚠️┇بالفعل تم فتح المتحركه ")
else
tsX000("lock",msg,"⚠️┇تم فتح المتحركه ")
database:del("lock_gif:Monsters"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح الملفات") then
local tsX_o = database:get("lock_files:Monsters"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"⚠️┇بالفعل تم فتح الملفات ")
else
tsX000("lock",msg,"⚠️┇تم فتح الملفات ")
database:del("lock_files:Monsters"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح الماركدون") then
local tsX_o = database:get("lock_mark:Monsters"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"⚠️┇بالفعل تم فتح الماركدون ")
else
tsX000("lock",msg,"⚠️┇تم فتح الماركدون ")
database:del("lock_mark:Monsters"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح الصور") then
local tsX_o = database:get("lock_photo:Monsters"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"⚠️┇بالفعل تم فتح الصور ")
else
tsX000("lock",msg,"⚠️┇تم فتح الصور ")
database:del("lock_photo:Monsters"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح الملصقات") then
local tsX_o = database:get("lock_stecker:Monsters"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"⚠️┇بالفعل تم فتح الملصقات ")
else
tsX000("lock",msg,"⚠️┇تم فتح الملصقات ")
database:del("lock_stecker:Monsters"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح الفيديو") then
local tsX_o = database:get("lock_video:Monsters"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"⚠️┇بالفعل تم فتح الفيديو ")
else
tsX000("lock",msg,"⚠️┇تم فتح الفيديو ")
database:del("lock_video:Monsters"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح الانلاين") then
local tsX_o = database:get("lock_inline:Monsters"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"⚠️┇بالفعل تم فتح الانلاين ")
else
tsX000("lock",msg,"⚠️┇تم فتح الانلاين ")
database:del("lock_inline:Monsters"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح الدردشه") then
local tsX_o = database:get("lock_chat:Monsters"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"⚠️┇بالفعل تم فتح الدردشه ")
else
tsX000("lock",msg,"⚠️┇تم فتح الدردشه ")
database:del("lock_chat:Monsters"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح التوجيه") then
local tsX_o = database:get("lock_fwd:Monsters"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"⚠️┇بالفعل تم فتح التوجيه ")
else
tsX000("lock",msg,"⚠️┇تم فتح التوجيه ")
database:del("lock_fwd:Monsters"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح التثبيت") then
local tsX_o = database:get("lock_pin:Monsters"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"⚠️┇بالفعل تم فتح التثبيت ")
else
tsX000("lock",msg,"⚠️┇تم فتح التثبيت ")
database:del("lock_pin:Monsters"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح الاغاني") then
local tsX_o = database:get("lock_audeo:Monsters"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"⚠️┇بالفعل تم فتح الاغاني ")
else
tsX000("lock",msg,"⚠️┇تم فتح الاغاني ")
database:del("lock_audeo:Monsters"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح الصوت") then
local tsX_o = database:get("lock_voice:Monsters"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"⚠️┇بالفعل تم فتح الصوت ")
else
tsX000("lock",msg,"⚠️┇تم فتح الصوت ")
database:del("lock_voice:Monsters"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح البوتات بالطرد") then
local tsX_o = database:get("lock_botAndBan:Monsters"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"⚠️┇بالفعل تم فتح البوتات بالطرد ")
else
tsX000("lock",msg,"⚠️┇تم فتح البوتات بالطرد ")
database:del("lock_botAndBan:Monsters"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح الجهات") then
local tsX_o = database:get("lock_contact:Monsters"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"⚠️┇بالفعل تم فتح الجهات ")
else
tsX000("lock",msg,"⚠️┇تم فتح الجهات ")
database:del("lock_contact:Monsters"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح العربيه") then
local tsX_o = database:get("lock_ar:Monsters"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"⚠️┇بالفعل تم فتح العربيه ")
else
tsX000("lock",msg,"⚠️┇تم فتح العربيه ")
database:del("lock_ar:Monsters"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح الانكليزيه") then
local tsX_o = database:get("lock_en:Monsters"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"⚠️┇بالفعل تم فتح الانكليزيه ")
else
tsX000("lock",msg,"⚠️┇تم فتح الانكليزيه ")
database:del("lock_en:Monsters"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح الميديا") then
local tsX_o = database:get("lock_media:Monsters"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"⚠️┇بالفعل تم فتح الميديا ")
else
tsX000("lock",msg,"⚠️┇تم فتح الميديا ")
database:del("lock_media:Monsters"..msg.chat_id_..bot_id,"ok")
database:del("lock_audeo:Monsters"..msg.chat_id_..bot_id,"ok")
database:del("lock_video:Monsters"..msg.chat_id_..bot_id,"ok")
database:del("lock_photo:Monsters"..msg.chat_id_..bot_id,"ok")
database:del("lock_stecker:Monsters"..msg.chat_id_..bot_id,"ok")
database:del("lock_voice:Monsters"..msg.chat_id_..bot_id,"ok")
database:del("lock_gif:Monsters"..msg.chat_id_..bot_id,"ok")
database:del("lock_note:Monsters"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح المعرف") then
local tsX_o = database:get("lock_username:Monsters"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"⚠️┇بالفعل تم فتح المعرف ")
else
tsX000("lock",msg,"⚠️┇تم فتح المعرف ")
database:del("lock_username:Monsters"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح بصمه الفيديو") then
local tsX_o = database:get("lock_note:Monsters"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"⚠️┇بالفعل تم فتح بصمه فيديو ")
else
tsX000("lock",msg,"⚠️┇تم فتح بصمه فيديو ")
database:del("lock_note:Monsters"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح الروابط") then
local tsX_o = database:get("lock_link:Monsters"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"⚠️┇بالفعل تم فتح الروابط ")
else
tsX000("lock",msg,"⚠️┇تم فتح الروابط ")
database:del("lock_link:Monsters"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح الدخول") then
local tsX_o = database:get("lock_join:Monsters"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"⚠️┇بالفعل تم فتح الدخول للمجموعه ")
else
tsX000("lock",msg,"⚠️┇ تم فتح الدخول للمجموعه ")
database:del("lock_join:Monsters"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح البوتات") then
local tsX_o = database:get("lock_bot:Monsters"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"⚠️┇بالفعل تم فتح البوتات ")
else
tsX000("lock",msg,"⚠️┇تم فتح البوتات ")
database:del("lock_bot:Monsters"..msg.chat_id_..bot_id,"ok")
end
end  --         »»               End Monsters unlock                       ««              --
end 
end 
--         »»               Start Function Check Msg                       ««              --
function TSCheckMsg(msg) 
local text = msg.content_.text_

if text and not is_creatorbasic(msg) then 
if database:get("lock_word:Monsters"..msg.chat_id_..bot_id) then 
local Monsters_wr = (database:get("Monsters:not:word:"..bot_id..msg.chat_id_) or 100)
if #text >= tonumber(Monsters_wr) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
end
end
if text and (text:match("[Hh][Tt][Tt][Pp][Ss]://") or text:match("[Jj][Oo][Ii][Nn][Cc][Hh][Aa][Tt]")  or text:match("[Hh][Tt][Tt][Pp]://") or text:match(".[Ii][Rr]") or text:match(".[Cc][Oo][Mm]") or text:match(".[Oo][Rr][Gg]") or text:match(".[Ii][Nn][Ff][Oo]") or text:match("[Ww][Ww][Ww].") or text:match(".[Tt][Kk]")) then
if database:get("lock_link:Monsters"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
end
if msg.content_.caption_ then
text = msg.content_.caption_
if text and (text:match("[Hh][Tt][Tt][Pp][Ss]://") or text:match("[Jj][Oo][Ii][Nn][Cc][Hh][Aa][Tt]") or text:match("[Hh][Tt][Tt][Pp]://") or text:match(".[Ii][Rr]") or text:match(".[Cc][Oo][Mm]") or text:match(".[Oo][Rr][Gg]") or text:match(".[Ii][Nn][Ff][Oo]") or text:match("[Ww][Ww][Ww].") or text:match(".[Tt][Kk]")) then
if database:get("lock_link:Monsters"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
end
end
if msg.content_.caption_ then
text = msg.content_.caption_
if text and text:match("(.*)(@)(.*)")  then
if database:get("lock_username:Monsters"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
end
end
if text and text:match("(.*)(@)(.*)")  then
if database:get("lock_username:Monsters"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
end
if database:get("lock_chat:Monsters"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
if text and text:match("(.*)(/)(.*)")  then
if database:get("lock_sarha:Monsters"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
end
if text and text:match("(.*)(#)(.*)")  then
if database:get("lock_tag:Monsters"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
end
if msg.reply_to_message_id_ ~= 0 then
print('&&&&')
if database:get("lock_reple:Monsters"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
end
if  msg.content_.ID == "MessageChatJoinByLink" then
if database:get("lock_join:Monsters"..msg.chat_id_..bot_id) then
changeChatMemberStatus(msg.chat_id_, msg.sender_user_id_, "Kicked")
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
end
if msg.content_.ID == "MessageChatAddMembers"  then
if database:get("lock_join:Monsters"..msg.chat_id_..bot_id) then
changeChatMemberStatus(msg.chat_id_, msg.content_.members_[0].id_, "Kicked")
return "stop"
end
end
if msg.content_.ID == "MessageChatAddMembers" then
if msg.content_.members_[0].type_.ID == 'UserTypeBot' then
if database:get("lock_bot:Monsters"..msg.chat_id_..bot_id) then
changeChatMemberStatus(msg.chat_id_, msg.content_.members_[0].id_, "Kicked")
end
if database:get("lock_botAndBan:Monsters"..msg.chat_id_..bot_id) then
local function cb(extra,result,success)
local bots = result.members_
for i=0 , #bots do
if tonumber(bots[i].user_id_) ~= tonumber(bot_id) then chat_kick(msg.chat_id_,bots[i].user_id_)
end
changeChatMemberStatus(msg.chat_id_, msg.sender_user_id_, "Kicked")
end
end
bot.channel_get_bots(msg.chat_id_,cb)
end
end
end
if text and text:match("(.*)(#)(.*)")  then
if database:get("lock_sarha:Monsters"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
end
if msg.forward_info_ then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
if database:get("lock_fwd:Monsters"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
end
end
if msg.content_.ID == "MessageSticker" or msg.content_.ID == "MessageUnsupported" then
if database:get("lock_stecker:Monsters"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
end
if msg.content_.ID == "MessageChatJoinByLink" or msg.content_.ID == "MessageChatAddMembers" then
if database:get("lock_new:Monsters"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
end
if msg.content_.ID == "MessageChatAddMembers" then
database:incr('Monsters:'..bot_id..'user:add'..msg.chat_id_..':'..msg.sender_user_id_)
end
if msg.content_.ID == "MessageUnsupported" then
if database:get("lock_note:Monsters"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
end
if msg.content_.ID == "MessagePhoto" then
if database:get("lock_photo:Monsters"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
end
if msg.content_.ID == "MessageAudio" then
if database:get("lock_audeo:Monsters"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
end
if msg.content_.ID == "MessageVoice" then
if database:get("lock_voice:Monsters"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
end
if msg.content_.ID == "MessageVideo" then
if database:get("lock_video:Monsters"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
end
if msg.content_.ID == "MessageAnimation" then
if database:get("lock_gif:Monsters"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
end
if msg.content_.ID == "MessageContact" then
if database:get("lock_contact:Monsters"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
end
if text and text:match("[\216-\219][\128-\191]") then
if database:get("lock_ar:Monsters"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
end
if msg.content_.ID == "MessageDocument" then
if database:get("lock_files:Monsters"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
end
if text and text:match("[ASDFGHJKLQWERTYUIOPZXCVBNMasdfghjklqwertyuiopzxcvbnm]") then
if database:get("lock_en:Monsters"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
end

if msg.content_.entities_ then
if msg.content_.entities_[0] then
if msg.content_.entities_[0] and msg.content_.entities_[0].ID == "MessageEntityUrl" or msg.content_.entities_[0].ID == "MessageEntityTextUrl" then
if database:get("lock_mark:Monsters"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
end
end
end

if database:get("lock_lllll:Monsters"..msg.chat_id_..bot_id) then
local hash = 'flood:max:'..bot_id..msg.chat_id_
if not database:get(hash) then
floodMax = 10
else
floodMax = tonumber(database:get(hash))
end
local hash = 'Monsters:'..bot_id..'flood:time:'..msg.chat_id_
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
if msgs > (floodMax - 1) then
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
o = database:get("Monsters:spam:lock:"..os.date("%x")..bot_id..msg.chat_id_)
if (o and (tonumber(o) >= 5)) then
database:set("lock_media:Monsters"..msg.chat_id_..bot_id,"ok")
database:set("lock_audeo:Monsters"..msg.chat_id_..bot_id,"ok")
database:set("lock_video:Monsters"..msg.chat_id_..bot_id,"ok")
database:set("lock_photo:Monsters"..msg.chat_id_..bot_id,"ok")
database:set("lock_stecker:Monsters"..msg.chat_id_..bot_id,"ok")
database:set("lock_voice:Monsters"..msg.chat_id_..bot_id,"ok")
database:set("lock_gif:Monsters"..msg.chat_id_..bot_id,"ok")
database:set("lock_note:Monsters"..msg.chat_id_..bot_id,"ok")
database:set("lock_word:Monsters"..msg.chat_id_..bot_id,"ok")
database:set("lock_mark:Monsters"..msg.chat_id_..bot_id,"ok")
database:set("lock_link:Monsters"..msg.chat_id_..bot_id,"ok")
database:set("lock_new:Monsters"..msg.chat_id_..bot_id,"ok")
database:set('Monsters:'..bot_id..'get:photo'..msg.chat_id_,true)
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
database:incr("Monsters:spam:lock:"..os.date("%x")..bot_id..msg.chat_id_)
database:sadd('Monsters:'..bot_id..'muted:'..msg.chat_id_, msg.sender_user_id_)
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
local lave = database:get('Monsters:'..bot_id..'leave:groups')
print(lave)
if not database:get('Monsters:'..bot_id..'leave:groups') then
chat_leave(msg.chat_id_, bot_id)
send(msg.chat_id_, msg.id_, 1, "☑┇تم مغادره المجموعه", 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, "☑┇عذرآ المغادره معطله من قبل المطور الاساسي \n", 1, 'md')
end
end
if (text and text == 'تفعيل المغادره') and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
send(msg.chat_id_, msg.id_, 1, '☑┇تم تفعيل مغادره البوت', 1, 'md')
database:del('Monsters:'..bot_id..'leave:groups')
end

if (text and text == 'تعطيل المغادره') and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
send(msg.chat_id_, msg.id_, 1, '☑┇تم تعطيل مغادره البوت', 1, 'md')
database:set('Monsters:'..bot_id..'leave:groups',true)
end

if text:match("^مسح الاساسين$") and is_sudo(msg) then
text = '☑┇تم مسح قائمه المنشئين الاساسين'
database:del('Monsters:'..bot_id..'creatorbasic:'..msg.chat_id_)
send(msg.chat_id_, msg.id_, 1, text, 1, 'md')
end
if text:match("^رفع منشئ اساسي$") and msg.reply_to_message_id_ then
local url , res = https.request('https://teamstorm.tk/joinch/?id='..msg.sender_user_id_..'')
data = JSON.decode(url)
if data.Ch_Member.Monsters ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🇮🇶 •\n• اذا اردت استخدام بوتنا 😎 •\n• عليك الاشتراك في القناة 🔽 •\n• @Mons_bot ⚜️\n', 1, 'html')   
return false end
function promote_by_reply(extra, result, success)
database:del('Monsters:'..bot_id..'creatorbasic:'..msg.chat_id_)
database:sadd('Monsters:'..bot_id..'creatorbasic:'..msg.chat_id_, result.sender_user_id_)
tsX000("prore",msg,'🔖┇تم رفعة منشئ اساسي  في البوت')
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,promote_by_reply)
end

if text:match("^رفع منشئ اساسي @(.*)$") then
local url , res = https.request('https://teamstorm.tk/joinch/?id='..msg.sender_user_id_..'')
data = JSON.decode(url)
if data.Ch_Member.Monsters ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🇮🇶 •\n• اذا اردت استخدام بوتنا 😎 •\n• عليك الاشتراك في القناة 🔽 •\n• @Mons_bot ⚜️\n', 1, 'html')      
return false end
local apmd = {string.match(text, "^(رفع منشئ اساسي) @(.*)$")}
function promote_by_username(extra, result, success)
if result.id_ then
database:del('Monsters:'..bot_id..'creatorbasic:'..msg.chat_id_)
database:sadd('Monsters:'..bot_id..'creatorbasic:'..msg.chat_id_, result.id_)
texts = '👤┇العضو ~⪼ ['..result.title_..'](t.me/'..(apmd[2] or 'Mons_bot')..')\n┇ 🔖┇تم رفعة منشئ اساسي  في البوت  '
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
if data.Ch_Member.Monsters ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🇮🇶 •\n• اذا اردت استخدام بوتنا 😎 •\n• عليك الاشتراك في القناة 🔽 •\n• @Mons_bot ⚜️\n', 1, 'html')    
return false end
local apmd = {string.match(text, "^(رفع منشئ اساسي) (%d+)$")}
database:del('Monsters:'..bot_id..'creatorbasic:'..msg.chat_id_)
database:sadd('Monsters:'..bot_id..'creatorbasic:'..msg.chat_id_, apmd[2])
tsX000(apmd[2],msg,"🔖┇تم رفعة منشئ اساسي  في البوت")
end
if text:match("^تنزيل منشئ اساسي$") and msg.reply_to_message_id_ then
local url , res = https.request('https://teamstorm.tk/joinch/?id='..msg.sender_user_id_..'')
data = JSON.decode(url)
if data.Ch_Member.Monsters ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🇮🇶 •\n• اذا اردت استخدام بوتنا 😎 •\n• عليك الاشتراك في القناة 🔽 •\n• @Mons_bot ⚜️\n', 1, 'html')      
return false end
function promote_by_reply(extra, result, success)
database:del('Monsters:'..bot_id..'creatorbasic:'..msg.chat_id_)
database:srem('Monsters:'..bot_id..'creatorbasic:'..msg.chat_id_, result.sender_user_id_)
tsX000("prore",msg,'تم تنزيلة منشئ اساسي من البوت')
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,promote_by_reply)
end
if text:match("^تنزيل منشئ اساسي @(.*)$") then
local url , res = https.request('https://teamstorm.tk/joinch/?id='..msg.sender_user_id_..'')
data = JSON.decode(url)
if data.Ch_Member.Monsters ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🇮🇶 •\n• اذا اردت استخدام بوتنا 😎 •\n• عليك الاشتراك في القناة 🔽 •\n• @Mons_bot ⚜️\n', 1, 'html')      
return false end
local apmd = {string.match(text, "^(تنزيل منشئ اساسي) @(.*)$")}
function promote_by_username(extra, result, success)
if result.id_ then
database:del('Monsters:'..bot_id..'creatorbasic:'..msg.chat_id_)
database:srem('Monsters:'..bot_id..'creatorbasic:'..msg.chat_id_, result.id_)
texts = '👤┇العضو ~⪼ ['..result.title_..'](t.me/'..(apmd[2] or 'Mons_bot')..')\n┇ تم تنزيلة منشئ اساسي من البوت  '
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
if data.Ch_Member.Monsters ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🇮🇶 •\n• اذا اردت استخدام بوتنا 😎 •\n• عليك الاشتراك في القناة 🔽 •\n• @Mons_bot ⚜️\n', 1, 'html')    
return false end
local apmd = {string.match(text, "^(تنزيل منشئ اساسي) (%d+)$")}
database:del('Monsters:'..bot_id..'creatorbasic:'..msg.chat_id_)
database:srem('Monsters:'..bot_id..'creatorbasic:'..msg.chat_id_, apmd[2])
tsX000(apmd[2],msg,"تم تنزيلة منشئ اساسي من البوت")
end
if text == 'توجيه للكل' and tonumber(msg.reply_to_message_id_) > 0  and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then  
function fwwdmsg(taha,storm,sorc)  
local list = database:smembers('Monsters:'..bot_id..'groups') 
for k,v in pairs(list) do  
tdcli_function ({
ID = "ForwardMessages",
chat_id_ = v,
from_chat_id_ = msg.chat_id_,
message_ids_ = {[0] = storm.id_},
disable_notification_ = 1,
from_background_ = 1},cb or dl_cb,cmd) 
end
local gps = database:scard('Monsters:'..bot_id.."groups")  
local text = '🚸 ❯❯ تم ارسال توجيه الى *{ '..gps..' }* مجموعات'  
send(msg.chat_id_, msg.id_, 1, text, 1, 'md')  
end  
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),fwwdmsg)  
end
if text == 'توجيه خاص' and tonumber(msg.reply_to_message_id_) > 0  and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then  
function fwwdmsg(taha,storm,sorc)  
local list = database:smembers('Monsters:'..bot_id.."userss")
for k,v in pairs(list) do  
tdcli_function ({
ID = "ForwardMessages",
chat_id_ = v,
from_chat_id_ = msg.chat_id_,
message_ids_ = {[0] = storm.id_},
disable_notification_ = 1,
from_background_ = 1},cb or dl_cb,cmd) 
end
local gps = database:scard('Monsters:'..bot_id.."userss")  
local text = '♻┇ تم ارسال توجيه الى *{ '..gps..' }* مشترك في الخاص'  
send(msg.chat_id_, msg.id_, 1, text, 1, 'md')  
end  
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),fwwdmsg)  
end

if text and text == "اذاعه" then 
if (not database:get('Monsters:'..bot_id..'bc:groups') or tonumber(sudo_add) == tonumber(msg.sender_user_id_)) then
send(msg.chat_id_, msg.id_, 1, '☑┇ ارسال الان نص او الميديا : (صوره - فديو - متحركه - ملف)', 1, 'md')
database:set("Monsters:set_if_bc_new:"..bot_id..msg.sender_user_id_,"ok")
return "Monsters"
else
send(msg.chat_id_, msg.id_, 1, '☑┇ الاذاعه معطله ', 1, 'md')
end
end




if text=="اذاعه خاص" and msg.reply_to_message_id_ == 0 then 
if (not database:get('Monsters:'..bot_id..'bc:groups') or tonumber(sudo_add) == tonumber(msg.sender_user_id_)) then
database:setex('Monsters:'..bot_id.."bc:in:pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
send(msg.chat_id_, msg.id_, 1, "☑┇ ارسال الان نص او الميديا : (صوره - فديو - متحركه )\n", 1, "md") 
else
send(msg.chat_id_, msg.id_, 1, '☑┇ الاذاعه معطله ', 1, 'md')
end
return false
end 


if text == "تنظيف المشتركين" and tonumber(sudo_add) == tonumber(msg.sender_user_id_) then
local pv = database:smembers('Monsters:'..bot_id.."userss")
local sendok = 0
for i = 1, #pv do
tdcli_function({ID='GetChat',chat_id_ = pv[i]
},function(arg,dataq)
tdcli_function ({ ID = "SendChatAction",  
chat_id_ = pv[i], action_ = {  ID = "SendMessageTypingAction", progress_ = 100} 
},function(arg,data) 
if data.ID and data.ID == "Ok"  then
print('\27[30;33m»» THE USER IS SAVE ME ↓\n»» '..pv[i]..'\n\27[1;37m')
else
print('\27[30;31m»» THE USER IS BLOCK ME ↓\n»» '..pv[i]..'\n\27[1;37m')
database:srem('Monsters:'..bot_id.."userss",pv[i])
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
local group = database:smembers('Monsters:'..bot_id..'groups') 
local w = 0
local q = 0
for i = 1, #group do
tdcli_function({ID='GetChat',chat_id_ = group[i]
},function(arg,data)
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusMember" then
print('\27[30;34m»» THE BOT IS NOT ADMIN ↓\n»» '..group[i]..'\n\27[1;37m')
database:srem("Monsters:gog"..bot_id,group[i]) 
database:srem('Monsters:'..bot_id..'pro:groups',group[i]) 
database:srem( 'Monsters:'..bot_id.."groups",group[i]) 
changeChatMemberStatus(group[i], bot_id, "Left")
w = w + 1
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusLeft" then
database:srem("Monsters:gog"..bot_id,group[i]) 
database:srem('Monsters:'..bot_id..'pro:groups',group[i]) 
database:srem( 'Monsters:'..bot_id.."groups",group[i]) 
q = q + 1
print('\27[30;35m»» THE BOT IS LEFT GROUP ↓\n»» '..group[i]..'\n\27[1;37m')
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusKicked" then
database:srem("Monsters:gog"..bot_id,group[i]) 
database:srem('Monsters:'..bot_id..'pro:groups',group[i]) 
database:srem( 'Monsters:'..bot_id.."groups",group[i]) 
q = q + 1
print('\27[30;36m»» THE BOT IS KICKED GROUP ↓\n»» '..group[i]..'\n\27[1;37m')
end
if data and data.code_ and data.code_ == 400 then
database:srem("Monsters:gog"..bot_id,group[i]) 
database:srem('Monsters:'..bot_id..'pro:groups',group[i]) 
database:srem( 'Monsters:'..bot_id.."groups",group[i]) 
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
local gps = database:scard('Monsters:'..bot_id.."groups") or 0
local user = database:scard('Monsters:'..bot_id.."userss") or 0
local gps2 = database:scard("Monsters:gog"..bot_id) or 0
local gps9 = database:scard("Monsters:good"..bot_id..os.date("%d")) or 0
local gps3 = database:scard('Monsters:'..bot_id..'pro:groups') or 0
send(msg.chat_id_, msg.id_, 1, '• المجموعات :\n📊┇عدد الكروبات الكلي ~⪼  *{'..gps..'}*\n🔋┇عدد الكروبات المفعله ~⪼  *{'..gps2..'}*\n🔌┇عدد الكروبات الغير مفعله ~⪼  *{'..(gps - gps2)..'}*\n💡┇عدد الكروبات المدفوعه ~⪼  *{'..(gps3)..'}*\n⏱┇عدد الكروبات المتفاعله اليوم ~⪼  *{'..(gps9)..'}*\n\n• الاعضاء :\n👥┇ عدد اعضاء الخاص : {`'..user..'`}', 1, 'md')
end
if tonumber(sudo_add) == tonumber(msg.sender_user_id_) then
if text:match("^تفعيل الكل$") then
local url , res = https.request('https://teamstorm.tk/joinch/?id='..msg.sender_user_id_..'')
data = JSON.decode(url)
if data.Ch_Member.Monsters ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🇮🇶 •\n• اذا اردت استخدام بوتنا 😎 •\n• عليك الاشتراك في القناة 🔽 •\n• @Mons_bot ⚜️\n', 1, 'html')   
return false end

local gps = database:smembers('Monsters:'..bot_id.."groups") or 0
local gps2 = database:smembers("Monsters:gog"..bot_id) or 0
for i=1,#gps do
database:sadd("Monsters:gog"..bot_id, gps[i])
database:set('Monsters:'..bot_id.."enable:"..gps[i],true)
database:set( 'Monsters:'..bot_id.."charge:"..gps[i],true)
end
send(msg.chat_id_, msg.id_, 1, '🔋┇تم تفعيل ~⪼  *{'..(#gps - #gps2)..'}*', 1, 'md')
end
if text:match("^تعطيل الكل$") then
local gps = database:smembers('Monsters:'..bot_id.."groups") or 0
local gps2 = database:smembers("Monsters:gog"..bot_id) or 0
for i=1,#gps do
database:del("Monsters:gog"..bot_id)
database:del('Monsters:'..bot_id.."enable:"..gps[i])
database:del( 'Monsters:'..bot_id.."charge:"..gps[i])
end
send(msg.chat_id_, msg.id_, 1, '🔌┇تم تعطيل ~⪼  *{'..#gps..'}*', 1, 'md')
end
if text:match("^مغادره الكل$") then
local gps = database:smembers('Monsters:'..bot_id.."groups") or 0
local gps2 = database:smembers("Monsters:gog"..bot_id) or 0
send(msg.chat_id_, msg.id_, 1, '💣┇تم مغادره ~⪼  *{'..#gps..'}*', 1, 'md')
for i=1,#gps do
database:del('Monsters:'..bot_id.."enable:"..gps[i])
chat_leave(msg.chat_id_, bot_id)
end
database:del("Monsters:gog"..bot_id)
database:del('Monsters:'..bot_id.."groups")
end
end 
if text:match("^روابط الكروبات$") then
local gpss = database:smembers('Monsters:'..bot_id.."groups") or 0
text233 = '📊┇روابط الكروبات\n\n'
for i=1, #gpss do
local link = database:get('Monsters:'..bot_id.."group:link"..gpss[i])
text233 = text233.."|"..i.."| ~⪼ "..gpss[i].."\n ~⪼ "..(link or  "لا يوجد رابط").."\n"
end
local f = io.open('Monsters.txt', 'w')
f:write(text233)
f:close()
local Monsters = 'https://api.telegram.org/bot' .. token .. '/sendDocument'
local curl = 'curl "' .. Monsters .. '" -F "chat_id=' .. msg.chat_id_ .. '" -F "document=@' .. 'Monsters.txt' .. '"'
io.popen(curl)
end
if text and (text == "الكروبات المتفاعله" or text == "روابط الكروبات المتفاعله") then
local gpss = database:smembers("Monsters:good"..bot_id..os.date("%d")) or 0
text233 = '📊┇روابط الكروبات المتفاعله\n\n'
for i=1, #gpss do
local link = database:get('Monsters:'..bot_id.."group:link"..gpss[i])
text233 = text233.."|"..i.."| ~⪼ "..gpss[i].."\n ~⪼ "..(link or  "لا يوجد رابط").."\n"
end
local f = io.open('Monsters.txt', 'w')
f:write(text233)
f:close()
local Monsters = 'https://api.telegram.org/bot' .. token .. '/sendDocument'
local curl = 'curl "' .. Monsters .. '" -F "chat_id=' .. msg.chat_id_ .. '" -F "document=@' .. 'Monsters.txt' .. '"'
io.popen(curl)
end
if text == 'تحديث' and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
dofile('Monsters.lua')  
send(msg.chat_id_, msg.id_, 1, '☑┇تم التحديث', 1, 'md')
end

if text:match("^وضع وقت (%d+)$") then
local a = {string.match(text, "^(وضع وقت) (%d+)$")}
local time = a[2] * day
database:setex( 'Monsters:'..bot_id.."charge:"..msg.chat_id_,time,true)
database:set( 'Monsters:'..bot_id.."enable:"..msg.chat_id_,true)
send(msg.chat_id_, msg.id_, 1, '🔘┇تم وضع وقت انتهاء البوت *{'..a[2]..'}* يوم', 1, 'md')
end--
if text:match("^وقت المجموعه (-%d+)$") then
local txt = {string.match(text, "^(وقت المجموعه) (-%d+)$")}
local ex = database:ttl( 'Monsters:'..bot_id.."charge:"..txt[2])
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
if data.Ch_Member.Monsters ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🇮🇶 •\n• اذا اردت استخدام بوتنا 😎 •\n• عليك الاشتراك في القناة 🔽 •\n• @Mons_bot ⚜️\n', 1, 'html')   
return false end

local txt = {string.match(text, "^(مغادره) (-%d+)$")}
send(msg.chat_id_, msg.id_, 1, '🔘┇المجموعه {'..txt[2]..'} تم الخروج منها', 1, 'md')
database:del("Monsters:gog"..bot_id,txt[2])
chat_leave(txt[2], bot_id)
end
if text:match('^المده1 (-%d+)$')  then
local url , res = https.request('https://teamstorm.tk/joinch/?id='..msg.sender_user_id_..'')
data = JSON.decode(url)
if data.Ch_Member.Monsters ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🇮🇶 •\n• اذا اردت استخدام بوتنا 😎 •\n• عليك الاشتراك في القناة 🔽 •\n• @Mons_bot ⚜️\n', 1, 'html')   
return false end

local txt = {string.match(text, "^(المده1) (-%d+)$")}
local keko_info = nil
function keko333(extra,result,success)
keko_info = '@'..(result.username_ or 'لا يوجد')..''
local timeplan1 = 2592000
database:setex( 'Monsters:'..bot_id.."charge:"..txt[2],timeplan1,true)
send(msg.chat_id_, msg.id_, 1, '☑┇المجموعه ('..txt[2]..') تم اعادة تفعيلها المدة 30 يوم', 1, 'md')
send(txt[2], 0, 1, '☑┇تم تفعيل مدة المجموعه 30 يوم', 1, 'md')
for k,v in pairs(sudo_users) do
function Monsters_info(k1,k2)
send(v, 0, 1, "🔘┇قام بتفعيل مجموعه المده كانت 30 يوم \n🎫┇ايدي المطور ~⪼ ("..msg.sender_user_id_..")\n📜┇معرف المطور ~⪼ "..keko_info.."\n🌐┇معلومات المجموعه \n\n🎫┇ايدي المجموعه ~⪼ ("..msg.chat_id_..")\nⓂ┇اسم المجموعه ~⪼ ("..k2.title_..")" , 1, 'md')
end
openChat(msg.chat_id_,thsake_info)
end
database:set( 'Monsters:'..bot_id.."enable:"..txt[2],true)
end
getUser(msg.sender_user_id_, keko333)
end
if text:match('^المده2 (-%d+)$')  then
local txt = {string.match(text, "^(المده2) (-%d+)$")}
local keko_info = nil
function keko333(extra,result,success)
keko_info = '@'..(result.username_ or 'لا يوجد')..''
local timeplan2 = 7776000
database:setex( 'Monsters:'..bot_id.."charge:"..txt[2],timeplan2,true)
send(msg.chat_id_, msg.id_, 1, '☑┇المجموعه ('..txt[2]..') تم اعادة تفعيلها المدة 90 يوم', 1, 'md')
send(txt[2], 0, 1, '☑┇تم تفعيل مدة المجموعه 90 يوم', 1, 'md')
for k,v in pairs(sudo_users) do
function Monsters_info(k1,k2)
send(v, 0, 1, "🔘┇قام بتفعيل مجموعه المده كانت 90 يوم \n🎫┇ايدي المطور ~⪼ ("..msg.sender_user_id_..")\n📜┇معرف المطور ~⪼ "..keko_info.."\n🌐┇معلومات المجموعه \n\n🎫┇ايدي المجموعه ~⪼ ("..msg.chat_id_..")\nⓂ┇اسم المجموعه ~⪼ ("..k2.title_..")" , 1, 'md')
end
openChat(msg.chat_id_,thsake_info)
end
database:set( 'Monsters:'..bot_id.."enable:"..txt[2],true)
end
getUser(msg.sender_user_id_, keko333)
end
if text:match('^المده3 (-%d+)$')  then
local txt = {string.match(text, "^(المده3) (-%d+)$")}
local keko_info = nil
function keko333(extra,result,success)
keko_info = '@'..(result.username_ or 'لا يوجد')..''
database:set( 'Monsters:'..bot_id.."charge:"..txt[2],true)
send(msg.chat_id_, msg.id_, 1, '☑┇المجموعه ('..txt[2]..') تم اعادة تفعيلها المدة لا نهائية', 1, 'md')
send(txt[2], 0, 1, '☑┇تم تفعيل مدة المجموعه لا نهائية', 1, 'md')
for k,v in pairs(sudo_users) do
function Monsters_info(k1,k2)
send(v, 0, 1, "🔘┇قام بتفعيل مجموعه المده كانت لا نهائية \n🎫┇ايدي المطور ~⪼ ("..msg.sender_user_id_..")\n📜┇معرف المطور ~⪼ "..keko_info.."\n🌐┇معلومات المجموعه \n\n🎫┇ايدي المجموعه ~⪼ ("..msg.chat_id_..")\nⓂ┇اسم المجموعه ~⪼ ("..k2.title_..")" , 1, 'md')
end
openChat(msg.chat_id_,thsake_info)
end
database:set( 'Monsters:'..bot_id.."enable:"..txt[2],true)
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
if data.Ch_Member.Monsters ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🇮🇶 •\n• اذا اردت استخدام بوتنا 😎 •\n• عليك الاشتراك في القناة 🔽 •\n• @Mons_bot ⚜️\n', 1, 'html')      
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

function Monsters_run_file(data)
local files_Monsters = database:smembers("files"..bot_id)
for i=1,#files_Monsters do
local Monsters = dofile("files_Monsters/"..files_Monsters[i])
local kt = Monsters.keko_Monsters(data)
if kt == 'end' then
return false
end
end
end

function TSall(msg,data)
text = msg.content_.text_
if msg.content_.photo_ then
local photo = database:get('Monsters:'..bot_id..'setphoto'..msg.chat_id_..':'..msg.sender_user_id_)
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
database:del('Monsters:'..bot_id..'setphoto'..msg.chat_id_..':'..msg.sender_user_id_)
end end
local d = data.disable_notification_
local chat = chats[msg.chat_id_]
if msg.date_ < (os.time() - 30) then
return false end
if text then
-------------------------------------------
if msg and msg.send_state_.ID == "MessageIsSuccessfullySent" then
function get_mymsg_contact(extra, result, success)
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,get_mymsg_contact)
return false
end
if not database:get( 'Monsters:'..bot_id.."charge:"..msg.chat_id_) then
if database:get( 'Monsters:'..bot_id.."enable:"..msg.chat_id_) then
database:del( 'Monsters:'..bot_id.."enable:"..msg.chat_id_)
for k,v in pairs(sudo_users) do
end
end
end
if msg.chat_id_ then
local id = tostring(msg.chat_id_)
if id:match('-100(%d+)') then
if not database:sismember( 'Monsters:'..bot_id.."groups",msg.chat_id_) then
database:sadd( 'Monsters:'..bot_id.."groups",msg.chat_id_)
end
elseif id:match('^(%d+)') then
database:sadd('Monsters:'..bot_id.."userss",msg.chat_id_)
else
if not database:sismember( 'Monsters:'..bot_id.."groups",msg.chat_id_) then
database:sadd( 'Monsters:'..bot_id.."groups",msg.chat_id_)
end
end
end

database:incr('Monsters:'..bot_id..'user:msgs'..msg.chat_id_..':'..msg.sender_user_id_)
if database:get('Monsters:'..bot_id..'viewget'..msg.sender_user_id_) then
if not msg.forward_info_ then
send(msg.chat_id_, msg.id_, 1, '❕┇قم بارسال المنشور من القناة', 1, 'md')
database:del('Monsters:'..bot_id..'viewget'..msg.sender_user_id_)
else
send(msg.chat_id_, msg.id_, 1, '📊┇عدد المشاهدات ~⪼ <b>('..msg.views_..')</b> ', 1, 'html')
database:del('Monsters:'..bot_id..'viewget'..msg.sender_user_id_)
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
local Monsters_edis = {string.match(text, "^اضف امر (.*)$")}
send(msg.chat_id_, msg.id_, 1, "☑┇ ارسال الان الامر الجديد", 1, 'md')
database:set("Monsters:new:msg:"..msg.chat_id_..msg.sender_user_id_..bot_id,Monsters_edis[1])
elseif (database:get("Monsters:new:msg:"..msg.chat_id_..msg.sender_user_id_..bot_id)) then 
send(msg.chat_id_, msg.id_, 1, "☑┇ تم الحفظ بنجاح", 1, 'md')
database:set("Monsters:edit:text:su:new:"..bot_id..msg.chat_id_..database:get("Monsters:new:msg:"..msg.chat_id_..msg.sender_user_id_..bot_id),text)
database:set("Monsters:edit:text:su:new2:"..bot_id..msg.chat_id_..text,database:get("Monsters:new:msg:"..msg.chat_id_..msg.sender_user_id_..bot_id))
database:del("Monsters:new:msg:"..msg.chat_id_..msg.sender_user_id_..bot_id)
end  
if (text and text == 'مسح امر المطور بالكليشه') and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
redis:del('Monsters:'..bot_id..'text_sudo', text)
send(msg.chat_id_, msg.id_, 1, '☑┇تم حذف الكليشه ', 1, 'html')
return "Monsters"
end
if text:match("^مسح امر (.*)") then 
local t = {string.match(text, "^مسح امر (.*)$")}
database:del("Monsters:edit:text:su:new2:"..bot_id..msg.chat_id_..database:get("Monsters:edit:text:su:new:"..bot_id..msg.chat_id_..t[1]))
database:del("Monsters:edit:text:su:new:"..bot_id..msg.chat_id_..t[1])
send(msg.chat_id_, msg.id_, 1, "☑┇ تم المسح بنجاح", 1, 'md')
end
end

if text == "رفع منشئ" and is_creatorbasic(msg) and msg.reply_to_message_id_ then
local url , res = https.request('https://teamstorm.tk/joinch/?id='..msg.sender_user_id_..'')
data = JSON.decode(url)
if data.Ch_Member.Monsters ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🇮🇶 •\n• اذا اردت استخدام بوتنا 😎 •\n• عليك الاشتراك في القناة 🔽 •\n• @Mons_bot ⚜️\n', 1, 'html')   
return false end

function setcreator_by_reply(extra, result, success)
local hash =  'Monsters:'..bot_id..'creator:'..msg.chat_id_
if database:sismember(hash, result.sender_user_id_) then
tsX000("prore",msg,"🔖┇تم بالفعل رفعة منشئ  في البوت")
else
database:sadd(hash, result.sender_user_id_)
tsX000("prore",msg,"🔖┇تم رفعة منشئ  في البوت")
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,setcreator_by_reply)
end
if text:match("^رفع منشئ @(.*)$") and is_creatorbasic(msg) then
local url , res = https.request('https://teamstorm.tk/joinch/?id='..msg.sender_user_id_..'')
data = JSON.decode(url)
if data.Ch_Member.Monsters ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🇮🇶 •\n• اذا اردت استخدام بوتنا 😎 •\n• عليك الاشتراك في القناة 🔽 •\n• @Mons_bot ⚜️\n', 1, 'html')     
return false end

local apow = {string.match(text, "^(رفع منشئ) @(.*)$")}
local url , res = https.request('https://teamstorm.tk/joinch/?id='..msg.sender_user_id_..'')
data = JSON.decode(url)
if data.Ch_Member.Monsters ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🇮🇶 •\n• اذا اردت استخدام بوتنا 😎 •\n• عليك الاشتراك في القناة 🔽 •\n• @Mons_bot ⚜️\n', 1, 'html')   
return false end

function setcreator_by_username(extra, result, success)
if result.id_ then
database:sadd('Monsters:'..bot_id..'creator:'..msg.chat_id_, result.id_)
texts = '👤┇العضو ~⪼ ['..result.title_..'](t.me/'..(apow[2] or 'Mons_bot')..')\n🔖┇تم رفعة منشئ  في البوت'
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
if data.Ch_Member.Monsters ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🇮🇶 •\n• اذا اردت استخدام بوتنا 😎 •\n• عليك الاشتراك في القناة 🔽 •\n• @Mons_bot ⚜️\n', 1, 'html')    
return false end

local apow = {string.match(text, "^(رفع منشئ) (%d+)$")}
local url , res = https.request('https://teamstorm.tk/joinch/?id='..msg.sender_user_id_..'')
data = JSON.decode(url)
if data.Ch_Member.Monsters ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🇮🇶 •\n• اذا اردت استخدام بوتنا 😎 •\n• عليك الاشتراك في القناة 🔽 •\n• @Mons_bot ⚜️\n', 1, 'html')     
return false end

database:sadd('Monsters:'..bot_id..'creator:'..msg.chat_id_, apow[2])
tsX000(apow[2],msg,"🔖┇تم رفعة منشئ  في البوت")
end
if text:match("^تنزيل منشئ$") and is_creatorbasic(msg) and msg.reply_to_message_id_ then
function decreator_by_reply(extra, result, success)
local hash =  'Monsters:'..bot_id..'creator:'..msg.chat_id_
if not database:sismember(hash, result.sender_user_id_) then
tsX000("prore",msg,"🔰┇بالفعل تم تنزيله من منشئين المجموعه")
else
database:srem(hash, result.sender_user_id_)
tsX000("prore",msg,"🔰┇تم تنزيله من منشئين المجموعه")
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,decreator_by_reply)
end
if text:match("^تنزيل منشئ @(.*)$") and is_creatorbasic(msg) then
local apow = {string.match(text, "^(تنزيل منشئ) @(.*)$")}
local hash =  'Monsters:'..bot_id..'creator:'..msg.chat_id_
function remcreator_by_username(extra, result, success)
if result.id_ then
database:srem(hash, result.id_)
texts = '👤┇العضو ~⪼ ['..result.title_..'](t.me/'..(apow[2] or 'Mons_bot')..')\n🔰┇تم تنزيله من منشئين المجموعه'
else
texts = '✖┇خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apow[2],remcreator_by_username)
end
if text:match("^تنزيل منشئ (%d+)$") and is_creatorbasic(msg) then
local hash =  'Monsters:'..bot_id..'creator:'..msg.chat_id_
local apow = {string.match(text, "^(تنزيل منشئ) (%d+)$")}
database:srem(hash, apow[2])
tsX000(apow[2],msg,"🔰┇تم تنزيله من منشئين المجموعه")
end--
if text == 'المنشئين الاساسين' and is_sudo(msg) then
local list = database:smembers('Monsters:'..bot_id..'creatorbasic:'..msg.chat_id_)
if #list == 0 then
text = "❗️┇ لا يوجد منشئين اساسين "
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
return false
end
text = "🛅┇قائمة المنشئين الاساسيين ،\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
for k,v in pairs(list) do
local user_info = database:hgetall('Monsters:'..bot_id..'user:'..v)
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
local hash =   'Monsters:'..bot_id..'creator:'..msg.chat_id_
local list = database:smembers(hash)
text = "🛅┇قائمة المنشئين  ،\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
for k,v in pairs(list) do
local user_info = database:hgetall('Monsters:'..bot_id..'user:'..v)
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
if data.Ch_Member.Monsters ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🇮🇶 •\n• اذا اردت استخدام بوتنا 😎 •\n• عليك الاشتراك في القناة 🔽 •\n• @Mons_bot ⚜️\n', 1, 'html')     
return false end
local apmd = {string.match(text, "^(رفع ادمن بالكروب) (%d+)$")}
local url , res = https.request('https://teamstorm.tk/joinch/?id='..msg.sender_user_id_..'')
data = JSON.decode(url)
if data.Ch_Member.Monsters ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🇮🇶 •\n• اذا اردت استخدام بوتنا 😎 •\n• عليك الاشتراك في القناة 🔽 •\n• @Mons_bot ⚜️\n', 1, 'html')      
return false end
HTTPS.request("https://api.telegram.org/bot" .. token .. "/promoteChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..apmd[2].."&can_change_info=True&can_delete_messages=True&can_invite_users=True&can_restrict_members=True&can_pin_messages=True&can_promote_members=false")
tsX000(apmd[2],msg,'🔖┇تم رفعة ادمن   في الكروب')
return false
end
if text:match("^رفع ادمن بالكروب$")  and is_creatorbasic(msg) and msg.reply_to_message_id_ then
local url , res = https.request('https://teamstorm.tk/joinch/?id='..msg.sender_user_id_..'')
data = JSON.decode(url)
if data.Ch_Member.Monsters ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🇮🇶 •\n• اذا اردت استخدام بوتنا 😎 •\n• عليك الاشتراك في القناة 🔽 •\n• @Mons_bot ⚜️\n', 1, 'html')      
return false end
function promote_by_reply(extra, result, success)
HTTPS.request("https://api.telegram.org/bot" .. token .. "/promoteChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..result.sender_user_id_.."&can_change_info=True&can_delete_messages=True&can_invite_users=True&can_restrict_members=True&can_pin_messages=True&can_promote_members=false")
tsX000("prore",msg,'🔖┇تم رفعة ادمن   في الكروب')
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,promote_by_reply)
return false
end
if text:match("^رفع ادمن بالكروب @(.*)$") and is_creatorbasic(msg) then
local url , res = https.request('https://teamstorm.tk/joinch/?id='..msg.sender_user_id_..'')
data = JSON.decode(url)
if data.Ch_Member.Monsters ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🇮🇶 •\n• اذا اردت استخدام بوتنا 😎 •\n• عليك الاشتراك في القناة 🔽 •\n• @Mons_bot ⚜️\n', 1, 'html')      
return false end
local apmd = {string.match(text, "^(رفع ادمن بالكروب) @(.*)$")}
function promote_by_username(extra, result, success)
if result.id_ then
HTTPS.request("https://api.telegram.org/bot" .. token .. "/promoteChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..result.id_.."&can_change_info=True&can_delete_messages=True&can_invite_users=True&can_restrict_members=True&can_pin_messages=True&can_promote_members=false")
texts = '👤┇العضو ~⪼ ['..result.title_..'](t.me/'..(apmd[2] or 'Mons_bot')..')\n🔖┇تم رفعة ادمن   في الكروب  '
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
if data.Ch_Member.Monsters ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🇮🇶 •\n• اذا اردت استخدام بوتنا 😎 •\n• عليك الاشتراك في القناة 🔽 •\n• @Mons_bot ⚜️\n', 1, 'html')   
return false end
local apmd = {string.match(text, "^(رفع منشئ بالكروب) (%d+)$")}
local url , res = https.request('https://teamstorm.tk/joinch/?id='..msg.sender_user_id_..'')
data = JSON.decode(url)
if data.Ch_Member.Monsters ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🇮🇶 •\n• اذا اردت استخدام بوتنا 😎 •\n• عليك الاشتراك في القناة 🔽 •\n• @Mons_bot ⚜️\n', 1, 'html')   
return false end
HTTPS.request("https://api.telegram.org/bot" .. token .. "/promoteChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..apmd[2].."&can_change_info=True&can_delete_messages=True&can_invite_users=True&can_restrict_members=True&can_pin_messages=True&can_promote_members=True")
tsX000(apmd[2],msg,'🔖┇تم رفعة منشئ   في الكروب')
return false
end
if text:match("^رفع منشئ بالكروب$")  and is_creatorbasic(msg) and msg.reply_to_message_id_ then
local url , res = https.request('https://teamstorm.tk/joinch/?id='..msg.sender_user_id_..'')
data = JSON.decode(url)
if data.Ch_Member.Monsters ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🇮🇶 •\n• اذا اردت استخدام بوتنا 😎 •\n• عليك الاشتراك في القناة 🔽 •\n• @Mons_bot ⚜️\n', 1, 'html')   
return false end
function promote_by_reply(extra, result, success)
HTTPS.request("https://api.telegram.org/bot" .. token .. "/promoteChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..result.sender_user_id_.."&can_change_info=True&can_delete_messages=True&can_invite_users=True&can_restrict_members=True&can_pin_messages=True&can_promote_members=True")
tsX000("prore",msg,'🔖┇تم رفعة منشئ في الكروب')
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,promote_by_reply)
return false
end
if text:match("^رفع منشئ بالكروب @(.*)$") and is_creatorbasic(msg) then
local url , res = https.request('https://teamstorm.tk/joinch/?id='..msg.sender_user_id_..'')
data = JSON.decode(url)
if data.Ch_Member.Monsters ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🇮🇶 •\n• اذا اردت استخدام بوتنا 😎 •\n• عليك الاشتراك في القناة 🔽 •\n• @Mons_bot ⚜️\n', 1, 'html')   
return false end
local apmd = {string.match(text, "^(رفع منشئ بالكروب) @(.*)$")}
function promote_by_username(extra, result, success)
if result.id_ then
HTTPS.request("https://api.telegram.org/bot" .. token .. "/promoteChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..result.id_.."&can_change_info=True&can_delete_messages=True&can_invite_users=True&can_restrict_members=True&can_pin_messages=True&can_promote_members=True")
texts = '👤┇العضو ~⪼ ['..result.title_..'](t.me/'..(apmd[2] or 'Mons_bot')..')\n🔖┇تم رفعة منشئ   في الكروب'
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
HTTPS.request("https://api.telegram.org/bot" .. token .. "/promoteChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..apmd[2].."&can_change_info=false&can_delete_messages=false&can_invite_users=false&can_restrict_members=false&can_pin_messages=false&can_promote_members=false")
tsX000(apmd[2],msg,'🔰┇تم تنزيله ادمن   في الكروب')
return false
end
if text:match("^تنزيل ادمن بالكروب$")  and is_creatorbasic(msg) and msg.reply_to_message_id_ then
function promote_by_reply(extra, result, success)
HTTPS.request("https://api.telegram.org/bot" .. token .. "/promoteChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..result.sender_user_id_.."&can_change_info=false&can_delete_messages=false&can_invite_users=false&can_restrict_members=false&can_pin_messages=false&can_promote_members=false")
tsX000("prore",msg,'🔰┇تم تنزيله ادمن   في الكروب')
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,promote_by_reply)
return false
end
if text:match("^تنزيل ادمن بالكروب @(.*)$") and is_creatorbasic(msg) then
local apmd = {string.match(text, "^(تنزيل ادمن بالكروب) @(.*)$")}
function promote_by_username(extra, result, success)
if result.id_ then
HTTPS.request("https://api.telegram.org/bot" .. token .. "/promoteChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..result.id_.."&can_change_info=false&can_delete_messages=false&can_invite_users=false&can_restrict_members=false&can_pin_messages=false&can_promote_members=false")
texts = '👤┇العضو ~⪼ ['..result.title_..'](t.me/'..(apmd[2] or 'Mons_bot')..')\n🔰┇تم تنزيله ادمن   في الكروب'
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
HTTPS.request("https://api.telegram.org/bot" .. token .. "/promoteChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..apmd[2].."&can_change_info=false&can_delete_messages=false&can_invite_users=false&can_restrict_members=false&can_pin_messages=false&can_promote_members=false")
tsX000(apmd[2],msg,'🔰┇تم تنزيله منشئ   في الكروب')
return false
end
if text:match("^تنزيل منشئ بالكروب$")  and is_creatorbasic(msg) and msg.reply_to_message_id_ then
function promote_by_reply(extra, result, success)
HTTPS.request("https://api.telegram.org/bot" .. token .. "/promoteChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..result.sender_user_id_.."&can_change_info=false&can_delete_messages=false&can_invite_users=false&can_restrict_members=false&can_pin_messages=false&can_promote_members=false")
tsX000("prore",msg,'🔰┇تم تنزيله منشئ   في الكروب')
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,promote_by_reply)
return false
end
if text:match("^تنزيل منشئ بالكروب @(.*)$") and is_creatorbasic(msg) then
local apmd = {string.match(text, "^(تنزيل منشئ بالكروب) @(.*)$")}
function promote_by_username(extra, result, success)
if result.id_ then
HTTPS.request("https://api.telegram.org/bot" .. token .. "/promoteChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..result.id_.."&can_change_info=false&can_delete_messages=false&can_invite_users=false&can_restrict_members=false&can_pin_messages=false&can_promote_members=false")
texts = '👤┇العضو ~⪼ ['..result.title_..'](t.me/'..(apmd[2] or 'Mons_bot')..')\n🔰┇تم تنزيله منشئ   في الكروب'
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
if data.Ch_Member.Monsters ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🇮🇶 •\n• اذا اردت استخدام بوتنا 😎 •\n• عليك الاشتراك في القناة 🔽 •\n• @Mons_bot ⚜️\n', 1, 'html')     
return false end
if not is_creator(msg) and database:get('Monsters:'..bot_id.."Monsters:lock:set"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_, 1, '✖┇لا تستطيع الرفع تم تعطيل الرفع من قبل المنشئين \n', 1, 'md')
return false
end
function promote_by_reply(extra, result, success)
local hash =  'Monsters:'..bot_id..'mods:'..msg.chat_id_
if database:sismember(hash, result.sender_user_id_) then
tsX000("prore",msg,'🔖┇بالفعل تم رفعة ادمن   في البوت ')
else
database:sadd(hash, result.sender_user_id_)
tsX000("prore",msg,'🔖┇تم رفعة ادمن   في البوت ')
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,promote_by_reply)
return false
end
if text:match("^رفع ادمن @(.*)$") and (is_owner(msg) or is_creatorbasic(msg)) then
local url , res = https.request('https://teamstorm.tk/joinch/?id='..msg.sender_user_id_..'')
data = JSON.decode(url)
if data.Ch_Member.Monsters ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🇮🇶 •\n• اذا اردت استخدام بوتنا 😎 •\n• عليك الاشتراك في القناة 🔽 •\n• @Mons_bot ⚜️\n', 1, 'html')   
return false end
if not is_creator(msg) and database:get('Monsters:'..bot_id.."Monsters:lock:set"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_, 1, '✖┇لا تستطيع الرفع تم تعطيل الرفع من قبل المنشئين \n', 1, 'md')
return false
end
local apmd = {string.match(text, "^(رفع ادمن) @(.*)$")}
function promote_by_username(extra, result, success)
if result.id_ then
database:sadd('Monsters:'..bot_id..'mods:'..msg.chat_id_, result.id_)
texts = '👤┇العضو ~⪼ ['..result.title_..'](t.me/'..(apmd[2] or 'Mons_bot')..')\n🔖┇تم رفعة ادمن   في البوت'
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
if data.Ch_Member.Monsters ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🇮🇶 •\n• اذا اردت استخدام بوتنا 😎 •\n• عليك الاشتراك في القناة 🔽 •\n• @Mons_bot ⚜️\n', 1, 'html')   
return false end
if not is_creator(msg) and database:get('Monsters:'..bot_id.."Monsters:lock:set"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_, 1, '✖┇لا تستطيع الرفع تم تعطيل الرفع من قبل المنشئين \n', 1, 'md')
return false end
local apmd = {string.match(text, "^(رفع ادمن) (%d+)$")}
local url , res = https.request('https://teamstorm.tk/joinch/?id='..msg.sender_user_id_..'')
data = JSON.decode(url)
if data.Ch_Member.Monsters ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🇮🇶 •\n• اذا اردت استخدام بوتنا 😎 •\n• عليك الاشتراك في القناة 🔽 •\n• @Mons_bot ⚜️\n', 1, 'html')   
return false end
database:sadd('Monsters:'..bot_id..'mods:'..msg.chat_id_, apmd[2])
tsX000(apmd[2],msg,"🔖┇تم رفعة ادمن   في البوت")
return false
end
if text:match("^تنزيل ادمن$") and (is_owner(msg) or is_creatorbasic(msg)) and msg.reply_to_message_id_ then
function demote_by_reply(extra, result, success)
local hash =  'Monsters:'..bot_id..'mods:'..msg.chat_id_
if not database:sismember(hash, result.sender_user_id_) then
tsX000("prore",msg,"🔰┇بالفعل تم تنزيله من ادمنيه البوت")
else
database:srem(hash, result.sender_user_id_)
tsX000("prore",msg,"🔰┇تم تنزيله من ادمنيه البوت")
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,demote_by_reply)
return false
end
if text:match("^تنزيل ادمن @(.*)$") and (is_owner(msg) or is_creatorbasic(msg)) then
local hash =  'Monsters:'..bot_id..'mods:'..msg.chat_id_
local apmd = {string.match(text, "^(تنزيل ادمن) @(.*)$")}
function demote_by_username(extra, result, success)
if result.id_ then
database:srem(hash, result.id_)
texts = '👤┇العضو ~⪼ ['..result.title_..'](t.me/'..(apmd[2] or 'Mons_bot')..')\n🔰┇تم تنزيله من ادمنيه البوت'
else
texts = '✖┇خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apmd[2],demote_by_username)
return false
end
if text:match("^تنزيل ادمن (%d+)$") and (is_owner(msg) or is_creatorbasic(msg)) then
local hash =  'Monsters:'..bot_id..'mods:'..
