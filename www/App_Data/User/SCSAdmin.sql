USE [master]
GO
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'SCSAdmin')
DROP USER [SCSAdmin]
GO
IF  EXISTS (SELECT * FROM sys.server_principals WHERE name = N'SCSAdmin')
DROP LOGIN [SCSAdmin]
GO
USE [SCSDataBase]
GO
/****** Object:  User [SCSAdmin]    Script Date: 06/12/2008 11:44:49 ******/
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'SCSAdmin')
DROP USER [SCSAdmin]
GO
USE [master]
GO
CREATE LOGIN [SCSAdmin] WITH PASSWORD=N'DefaultPassword', DEFAULT_DATABASE=[SCSDataBase], CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
GO
USE [master]
GO
CREATE USER [SCSAdmin] FOR LOGIN [SCSAdmin]
GO
USE [SCSDataBase]
GO
CREATE USER [SCSAdmin] FOR LOGIN [SCSAdmin]
GO
USE [SCSDataBase]
GO
EXEC sp_addrolemember N'db_owner', N'SCSAdmin'
GO
