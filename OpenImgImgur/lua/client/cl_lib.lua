

function LogPrint(Player , text )    
    MsgC(Color(33,255,0) ,"[Imgur][" ,Color(153,0,255), Player:Name() , Color(33,255,0) , "]\n  [url][" .. text .. "]\n")
end 
function GetCharString( id , text)
   return  string.Left(text, id )
end
function IsImgur(url)
    -- https://i.imgur.com/hburzhd.png
    return string.StartWith(url, "!https://i.imgur.com/")
end

function RetHtmlImg(url) 
    local HTML = 
    [[
        <div style="
            background-image: url(%s);
            background-repeat: no-repeat;
            background-size: contain;
            background-position: top left;
            width: 100%%;
            height: 100%%;">
        </div>
    ]]
    return HTML:format(string.sub(url,2,string.len(url)))
end



















