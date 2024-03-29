USE [SCSDataBase]
GO
/****** Object:  StoredProcedure [dbo].[CheckExistLogin]    Script Date: 06/09/2008 13:30:54 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CheckExistLogin]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[CheckExistLogin]
GO
/****** Object:  StoredProcedure [dbo].[CheckExistLogin]    Script Date: 06/09/2008 13:30:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CheckExistLogin] 
	-- Add the parameters for the stored procedure here
	@lg varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT COUNT(LOGIN) AS cnt FROM LOGINS WHERE (Login=@lg)
END

GO
GRANT EXECUTE ON [dbo].[CheckExistLogin] TO [web]
GO
