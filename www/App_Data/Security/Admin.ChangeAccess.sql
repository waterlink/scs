USE [SCSDataBase]
GO
/****** Object:  StoredProcedure [dbo].[ChangeAccess]    Script Date: 06/12/2008 12:47:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ChangeAccess]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ChangeAccess]
GO
/****** Object:  StoredProcedure [dbo].[ChangeAccess]    Script Date: 06/12/2008 12:46:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ChangeAccess]
	-- Add the parameters for the stored procedure here
	@lg varchar(50),
	@newac int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update logins set access=@newac where login=@lg
END

GO
GRANT EXECUTE ON [dbo].[ChangeAccess] TO [SCSAdmin]
GO
