USE [master]
GO
/****** Object:  Login [web]    Script Date: 06/09/2008 13:02:39 ******/
DROP LOGIN [web]
GO
CREATE LOGIN [web] WITH PASSWORD=N'webpassword', DEFAULT_DATABASE=[SCSDataBase], CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
GO
USE [master]
GO
/****** Object:  User [web]    Script Date: 06/09/2008 13:05:18 ******/
DROP USER [web]
GO
CREATE USER [web] FOR LOGIN [web]
GO
USE [SCSDataBase]
GO
/****** Object:  User [web]    Script Date: 06/09/2008 13:05:57 ******/
DROP USER [web]
GO
CREATE USER [web] FOR LOGIN [web]
GO