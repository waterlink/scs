USE [SCSDataBase]
GO
/****** Object:  StoredProcedure [dbo].[getPupilFLF]    Script Date: 06/09/2008 14:52:18 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[getPupilFLF]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[getPupilFLF]
GO
/****** Object:  StoredProcedure [dbo].[getPupilFLF]    Script Date: 06/09/2008 14:52:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getPupilFLF]
	-- Add the parameters for the stored procedure here
	@pid varchar(50)	

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select flf from pupils where id=@pid
END

GO
GRANT EXECUTE ON [dbo].[getPupilFLF] TO [web]
GO
