 




-- Кляцк Кляцк и готово!
-- настройки 
IMGUR_IMAGES = IMGUR_IMAGES  or {}
IMGUR_IMAGES.isVis = true  
IMGUR_IMAGES.Size = {400,400}
IMGUR_IMAGES.Point = {5,5}
IMGUR_IMAGES.BCloseSize = {20,20}
IMGUR_IMAGES.isFocus = false 
-- настройки 
function isValidWind()
     return  (IMGUR_IMAGES.isVis == true) and IsValid(IMGUR_IMAGES.wind) == true 
end

function Create()
    -- Тут мы создаем новое окно 
    if(IsValid(IMGUR_IMAGES.wind)) then       
        IMGUR_IMAGES.wind:Hide()
    end      
    if(IMGUR_IMAGES.isVis == false) then
        return 
    end
    local SizeBClose_Y = IMGUR_IMAGES.BCloseSize[2]
    IMGUR_IMAGES.wind = vgui.Create("DFrame")  
    IMGUR_IMAGES.wind:SetSize(unpack(IMGUR_IMAGES.Size)) 
    IMGUR_IMAGES.wind:SetPos(unpack(IMGUR_IMAGES.Point)) 
    IMGUR_IMAGES.wind:SetTitle(" ") 
    IMGUR_IMAGES.wind:ShowCloseButton(false)
    IMGUR_IMAGES.wind.Paint=function(self,w,h) end        
    IMGUR_IMAGES.Panel=vgui.Create("DHTML",IMGUR_IMAGES.wind)  
    IMGUR_IMAGES.Panel:SetAlpha(200) 
    IMGUR_IMAGES.Panel:SetPos(-8,-8) 
    IMGUR_IMAGES.Panel:SetSize(IMGUR_IMAGES.Size[1],IMGUR_IMAGES.Size[2]- 25)	
    IMGUR_IMAGES.Panel.Paint=function(self,w,h) end
    IMGUR_IMAGES.Panel.DoClick = function()				
        if(IsValid(IMGUR_IMAGES.wind) and IMGUR_IMAGES.wind != NULL ) then
            IMGUR_IMAGES.wind:Close()
        end
    end
end

hook.Add("OnPlayerChat","OpenImgurImg",function( play, text , isTeam , isDead)
    if(GetCharString( 1 , text) == "!") then 
        if(IsImgur(text)) then            
            if((IMGUR_IMAGES.isVis == true)) then
                if(not IsValid(IMGUR_IMAGES.wind)) then
                    Create()
                end             
                IMGUR_IMAGES.Panel:SetHTML( RetHtmlImg(text)) 
                IMGUR_IMAGES.Panel:UpdateHTMLTexture()
                if(IMGUR_IMAGES.isFocus) then
                    IMGUR_IMAGES.wind:MakePopup()
                end        
                timer.Simple(5,function()
                    if(IsValid(IMGUR_IMAGES.wind) and IMGUR_IMAGES.wind != NULL ) then
                        IMGUR_IMAGES.wind:Close()
                    end
                end)
                LogPrint(play , text)
            end          
        end       
    end 
end)
-- Комманды 
concommand.Add( "imgur_size", function( ply, cmd, args, str )   
    IMGUR_IMAGES.Size = { tonumber(args[1]) , tonumber(args[2])  }
    if(IsValid(IMGUR_IMAGES.wind) and IMGUR_IMAGES.wind != NULL ) then
        IMGUR_IMAGES.wind:SetSize(unpack(IMGUR_IMAGES.Size)) 
    end                   
end )
concommand.Add( "imgur_pos", function( ply, cmd, args, str )      
    IMGUR_IMAGES.Point = { tonumber(args[1]) , tonumber(args[2])  }
    if(IsValid(IMGUR_IMAGES.wind) and IMGUR_IMAGES.wind != NULL ) then
        IMGUR_IMAGES.wind:SetPos(unpack(IMGUR_IMAGES.Point)) 
    end                   
end )
concommand.Add( "imgur_vis", function( ply, cmd, args, str )      
    IMGUR_IMAGES.isVis = !IMGUR_IMAGES.isVis                 
end )
concommand.Add( "imgur_focus", function( ply, cmd, args, str )      
    IMGUR_IMAGES.isFocus = !IMGUR_IMAGES.isFocus   
end )
concommand.Add( "imgur_reset", function( ply, cmd, args, str )      
    IMGUR_IMAGES = IMGUR_IMAGES or {}
    IMGUR_IMAGES.isVis = true  
    IMGUR_IMAGES.Size = {400,400}
    IMGUR_IMAGES.Point = {5,5}
    IMGUR_IMAGES.BCloseSize = {20,20}
    IMGUR_IMAGES.isFocus = false 
    if(IsValid(IMGUR_IMAGES.wind) and IMGUR_IMAGES.wind != NULL ) then
        IMGUR_IMAGES.wind:SetPos(unpack(IMGUR_IMAGES.Point)) 
        IMGUR_IMAGES.wind:SetSize(unpack(IMGUR_IMAGES.Size))         
    end   
end )