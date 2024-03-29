USE [SCSDataBase]
GO
/****** Object:  StoredProcedure [dbo].[isRightLoginAndPassword]    Script Date: 06/09/2008 13:25:40 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[isRightLoginAndPassword]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[isRightLoginAndPassword]
GO
/****** Object:  StoredProcedure [dbo].[isRightLoginAndPassword]    Script Date: 06/09/2008 13:25:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[isRightLoginAndPassword] 
	-- Add the parameters for the stored procedure here
	@lg varchar(50),
	@pwd varchar(MAX)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT COUNT(LOGIN) AS cnt FROM LOGINS WHERE (Login=@lg)and(Cripted=@pwd)
END

GO
GRANT EXECUTE ON [dbo].[isRightLoginAndPassword] TO [web]
GO
