USE [SCSDataBase]
GO
/****** Object:  StoredProcedure [dbo].[getOutMessages]    Script Date: 06/09/2008 15:08:32 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[getOutMessages]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[getOutMessages]
GO
/****** Object:  StoredProcedure [dbo].[getOutMessages]    Script Date: 06/09/2008 15:08:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getOutMessages]
	-- Add the parameters for the stored procedure here
	@lg varchar(50)	

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update activeuser set statestring='да' where (readed='true')and(loginfrom=@lg)
	update activeuser set statestring='нет' where (readed='false')and(loginfrom=@lg)
	select id as Номер, loginto as Получатель, message as Сообщение, statestring as Прочитано
	from activeuser where loginfrom=@lg
END

GO
GRANT EXECUTE ON [dbo].[getOutMessages] TO [web]
GO
