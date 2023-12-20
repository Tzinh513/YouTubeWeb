
use ASMjava4
go 
create proc sp_selectUsersLikedVideoByVideoHref (@videoHref varchar(50))
as begin
 select 
    u.id,  u.username, u.username,u.[password],  u.email, u.isAdmin, u.isActive
 from
 video v left join history h on v.id = h.videoId
 left join [user] u on h.userId = u.id
 where 
 v.href = @videoHref and u.isActive = 1 and v.isActive = 1 and h.isLiked = 1
 end