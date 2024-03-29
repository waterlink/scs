USE [SCSDataBase]
GO
/****** Object:  StoredProcedure [dbo].[getInMessages]    Script Date: 06/09/2008 15:08:32 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[getInMessages]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[getInMessages]
GO
/****** Object:  StoredProcedure [dbo].[getInMessages]    Script Date: 06/09/2008 15:08:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getInMessages]
	-- Add the parameters for the stored procedure here
	@lg varchar(50)	

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update activeuser set statestring='да' where (readed='true')and(loginto=@lg)
	update activeuser set statestring='нет' where (readed='false')and(loginto=@lg)
	select id as Номер, loginfrom as Отправитель, message as Сообщение, statestring as Прочитано
	from activeuser where loginto=@lg
	update activeuser set readed='true' where loginto=@lg
END

GO
GRANT EXECUTE ON [dbo].[getInMessages] TO [web]
GO
