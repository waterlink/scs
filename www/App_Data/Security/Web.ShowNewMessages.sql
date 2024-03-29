USE [SCSDataBase]
GO
/****** Object:  StoredProcedure [dbo].[ShowNewMessages]    Script Date: 06/09/2008 12:59:19 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ShowNewMessages]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ShowNewMessages]
GO
/****** Object:  StoredProcedure [dbo].[ShowNewMessages]    Script Date: 06/09/2008 12:59:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ShowNewMessages]
	
	(
		@lg varchar(50)
	)
AS
begin
	SET NOCOUNT ON 
	select id as Номер, loginfrom as Отправитель, message as Сообщение from activeuser where (loginto=@lg) and (readed='false')
end

GO
GRANT EXECUTE ON [dbo].[ShowNewMessages] TO [web]
GO


