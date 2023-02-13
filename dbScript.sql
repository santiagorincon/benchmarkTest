USE [master]
GO
/****** Object:  Database [BenchmarkTest]    Script Date: 2023-02-12 9:14:55 PM ******/
CREATE DATABASE [BenchmarkTest]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BenchmarkTest', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BenchmarkTest.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BenchmarkTest_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BenchmarkTest_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BenchmarkTest] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BenchmarkTest].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BenchmarkTest] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BenchmarkTest] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BenchmarkTest] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BenchmarkTest] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BenchmarkTest] SET ARITHABORT OFF 
GO
ALTER DATABASE [BenchmarkTest] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BenchmarkTest] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BenchmarkTest] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BenchmarkTest] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BenchmarkTest] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BenchmarkTest] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BenchmarkTest] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BenchmarkTest] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BenchmarkTest] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BenchmarkTest] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BenchmarkTest] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BenchmarkTest] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BenchmarkTest] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BenchmarkTest] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BenchmarkTest] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BenchmarkTest] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BenchmarkTest] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BenchmarkTest] SET RECOVERY FULL 
GO
ALTER DATABASE [BenchmarkTest] SET  MULTI_USER 
GO
ALTER DATABASE [BenchmarkTest] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BenchmarkTest] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BenchmarkTest] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BenchmarkTest] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BenchmarkTest] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BenchmarkTest] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'BenchmarkTest', N'ON'
GO
ALTER DATABASE [BenchmarkTest] SET QUERY_STORE = OFF
GO
USE [BenchmarkTest]
GO
/****** Object:  Table [dbo].[Games]    Script Date: 2023-02-12 9:14:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Games](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NULL,
	[PartialScore] [int] NULL,
	[FinalScore] [int] NULL,
	[WinnerUserId] [bigint] NULL,
 CONSTRAINT [PK_Games] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GameScores]    Script Date: 2023-02-12 9:14:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GameScores](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[GameId] [bigint] NOT NULL,
	[UserId] [bigint] NOT NULL,
	[Frame] [int] NOT NULL,
	[Score] [int] NOT NULL,
	[IsClosed] [bit] NOT NULL,
	[PendingRolls] [int] NOT NULL,
	[IsStrike] [bit] NOT NULL,
	[IsSpare] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GameUsers]    Script Date: 2023-02-12 9:14:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GameUsers](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[GameId] [bigint] NOT NULL,
	[UserId] [bigint] NOT NULL,
 CONSTRAINT [PK_GameUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rolls]    Script Date: 2023-02-12 9:14:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rolls](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[GameId] [bigint] NOT NULL,
	[Frame] [int] NOT NULL,
	[Counter] [int] NOT NULL,
	[PinsKnocked] [int] NOT NULL,
	[isStrike] [bit] NOT NULL,
	[isSpare] [bit] NOT NULL,
	[UserId] [bigint] NOT NULL,
 CONSTRAINT [PK_Rolls] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 2023-02-12 9:14:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Nickname] [nvarchar](max) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Games]  WITH CHECK ADD  CONSTRAINT [FK_GamesWinnerUserId] FOREIGN KEY([WinnerUserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Games] CHECK CONSTRAINT [FK_GamesWinnerUserId]
GO
ALTER TABLE [dbo].[GameScores]  WITH CHECK ADD FOREIGN KEY([GameId])
REFERENCES [dbo].[Games] ([Id])
GO
ALTER TABLE [dbo].[GameScores]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[GameUsers]  WITH CHECK ADD  CONSTRAINT [FK_GameUsersGameId] FOREIGN KEY([GameId])
REFERENCES [dbo].[Games] ([Id])
GO
ALTER TABLE [dbo].[GameUsers] CHECK CONSTRAINT [FK_GameUsersGameId]
GO
ALTER TABLE [dbo].[GameUsers]  WITH CHECK ADD  CONSTRAINT [FK_GameUsersUserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[GameUsers] CHECK CONSTRAINT [FK_GameUsersUserId]
GO
ALTER TABLE [dbo].[Rolls]  WITH CHECK ADD  CONSTRAINT [FK_RollsGameId] FOREIGN KEY([GameId])
REFERENCES [dbo].[Games] ([Id])
GO
ALTER TABLE [dbo].[Rolls] CHECK CONSTRAINT [FK_RollsGameId]
GO
ALTER TABLE [dbo].[Rolls]  WITH CHECK ADD  CONSTRAINT [FK_RollsUserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Rolls] CHECK CONSTRAINT [FK_RollsUserId]
GO
USE [master]
GO
ALTER DATABASE [BenchmarkTest] SET  READ_WRITE 
GO
