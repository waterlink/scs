USE [SCSDataBase]
GO
/****** Object:  StoredProcedure [dbo].[CreateNewMessage]    Script Date: 06/09/2008 12:59:19 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CreateNewMessage]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[CreateNewMessage]
GO
/****** Object:  StoredProcedure [dbo].[CreateNewMessage]    Script Date: 06/09/2008 12:59:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateNewMessage]
	
	(
		@lg varchar(50),
		@p1 varchar(50),
		@p2 varchar(Max)
	)
AS
begin
	SET NOCOUNT ON 
	insert into activeuser(loginfrom, loginto, message, readed) values(@lg, @p1, @p2, 'false')
    update activeuser set statestring='да' where (readed='true')and(loginfrom=@lg)
    update activeuser set statestring='нет' where (readed='false')and(loginfrom=@lg)
    select id as Номер, loginto as Получатель, message as Сообщение, statestring as Прочитано
    from activeuser where loginfrom=@lg
end

GO
GRANT EXECUTE ON [dbo].[CreateNewMessage] TO [web]
GO
GRANT EXECUTE ON [dbo].[CreateNewMessage] TO [SCSAdmin]
GO


