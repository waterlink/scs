USE [SCSDataBase]
GO
/****** Object:  StoredProcedure [dbo].[DeleteReadedMessages]    Script Date: 06/09/2008 15:08:32 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DeleteReadedMessages]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[DeleteReadedMessages]
GO
/****** Object:  StoredProcedure [dbo].[DeleteReadedMessages]    Script Date: 06/09/2008 15:08:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DeleteReadedMessages]
	-- Add the parameters for the stored procedure here
	@lg varchar(50)	

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select id as Номер, loginto as Получатель, loginfrom as Отправитель, message as Сообщение, statestring as Прочитано
	from activeuser where ((loginfrom=@lg)or(loginto=@lg))and(readed='true')
	delete activeuser where ((loginfrom=@lg)or(loginto=@lg))and(readed='true')
END

GO
GRANT EXECUTE ON [dbo].[DeleteReadedMessages] TO [web]
GO
