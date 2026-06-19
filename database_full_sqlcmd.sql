:setvar DatabaseName "WebsiteBanHangDB"

IF DB_ID(N'$(DatabaseName)') IS NULL
BEGIN
    CREATE DATABASE [$(DatabaseName)];
END;
GO

USE [$(DatabaseName)];
GO

SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
GO

:r .\database_schema.sql
:r .\database_seed.sql

PRINT N'Database WebsiteBanHangDB da duoc tao va nap du lieu mau.';
GO
