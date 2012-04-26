USE [SCSDataBase]
GO
/****** Object:  StoredProcedure [dbo].[NewMessagesReadedAlready]    Script Date: 06/09/2008 12:59:19 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NewMessagesReadedAlready]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[NewMessagesReadedAlready]
GO
/****** Object:  StoredProcedure [dbo].[NewMessagesReadedAlready]    Script Date: 06/09/2008 12:59:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NewMessagesReadedAlready]
	
	(
		@lg varchar(50)
	)
AS
begin
	SET NOCOUNT ON 
	update activeuser set readed='true' where loginto=@lg
end

GO
GRANT EXECUTE ON [dbo].[NewMessagesReadedAlready] TO [web]
GO


