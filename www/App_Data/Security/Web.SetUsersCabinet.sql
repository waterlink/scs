USE [SCSDataBase]
GO
/****** Object:  StoredProcedure [dbo].[SetUsersCabinet]    Script Date: 06/09/2008 14:52:18 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SetUsersCabinet]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SetUsersCabinet]
GO
/****** Object:  StoredProcedure [dbo].[SetUsersCabinet]    Script Date: 06/09/2008 14:52:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SetUsersCabinet]
	-- Add the parameters for the stored procedure here
	@fstnm varchar(50),
	@lstnm varchar(50),
	@ftsnm varchar(50),
	@tlph varchar(50),
	@lg varchar(50)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update userscabinet set firstname=@fstnm, lastname=@lstnm, fathersname=@ftsnm, telephone=@tlph where login=@lg
END

GO
GRANT EXECUTE ON [dbo].[SetUsersCabinet] TO [web]
GO
