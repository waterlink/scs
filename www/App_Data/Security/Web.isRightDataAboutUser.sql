USE [SCSDataBase]
GO
/****** Object:  StoredProcedure [dbo].[isRightDataAboutUser]    Script Date: 06/09/2008 13:46:19 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[isRightDataAboutUser]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[isRightDataAboutUser]
GO
/****** Object:  StoredProcedure [dbo].[isRightDataAboutUser]    Script Date: 06/09/2008 13:46:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[isRightDataAboutUser]
	-- Add the parameters for the stored procedure here
	@lg varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select count(login) as cnt from userscabinet where (login=@lg)
END

GO
GRANT EXECUTE ON [dbo].[isRightDataAboutUser] TO [web]
GO
