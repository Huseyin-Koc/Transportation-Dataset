USE [master]
GO
/****** Object:  Database [Data_Setleri]    Script Date: 8.08.2024 11:16:34 ******/
CREATE DATABASE [Data_Setleri]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'zzz', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\zzz.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'zzz_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\zzz_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Data_Setleri] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Data_Setleri].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Data_Setleri] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Data_Setleri] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Data_Setleri] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Data_Setleri] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Data_Setleri] SET ARITHABORT OFF 
GO
ALTER DATABASE [Data_Setleri] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Data_Setleri] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Data_Setleri] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Data_Setleri] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Data_Setleri] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Data_Setleri] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Data_Setleri] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Data_Setleri] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Data_Setleri] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Data_Setleri] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Data_Setleri] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Data_Setleri] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Data_Setleri] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Data_Setleri] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Data_Setleri] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Data_Setleri] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Data_Setleri] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Data_Setleri] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Data_Setleri] SET  MULTI_USER 
GO
ALTER DATABASE [Data_Setleri] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Data_Setleri] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Data_Setleri] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Data_Setleri] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Data_Setleri] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Data_Setleri] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Data_Setleri] SET QUERY_STORE = ON
GO
ALTER DATABASE [Data_Setleri] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Data_Setleri]
GO
/****** Object:  Table [dbo].[AIRPLANE]    Script Date: 8.08.2024 11:16:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AIRPLANE](
	[Aircraft_Type] [nvarchar](255) NOT NULL,
	[Max_Range] [int] NOT NULL,
	[High_Max_Speed] [int] NOT NULL,
	[Wingspan_Length] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Aircraft_Type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AIRPORT]    Script Date: 8.08.2024 11:16:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AIRPORT](
	[Airport_Name] [nvarchar](255) NOT NULL,
	[City] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Airport_Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BUS]    Script Date: 8.08.2024 11:16:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BUS](
	[Bus_ID] [int] NOT NULL,
	[Fuel_Type] [nvarchar](50) NOT NULL,
	[Number_of_Seats] [int] NOT NULL,
	[Transmission_Type] [nvarchar](50) NOT NULL,
	[Bus_Model] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Bus_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BUS_JOURNEY]    Script Date: 8.08.2024 11:16:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BUS_JOURNEY](
	[Journey_Id] [int] NOT NULL,
	[Bus_Id] [int] NOT NULL,
	[Arrival_Time] [time](7) NULL,
	[Arrival_Date] [date] NULL,
	[Arrival_Bus_Station] [nvarchar](255) NULL,
	[Departure_Time] [time](7) NOT NULL,
	[Departure_Date] [date] NOT NULL,
	[Departure_Station] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Journey_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BUS_STATION]    Script Date: 8.08.2024 11:16:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BUS_STATION](
	[Station_Name] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Station_Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BUS_STOPS]    Script Date: 8.08.2024 11:16:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BUS_STOPS](
	[Station_Name] [nvarchar](255) NOT NULL,
	[Bus_Journey_Id] [int] NOT NULL,
	[Arrival_Time] [time](7) NULL,
	[Arrival_Date] [date] NULL,
	[Departure_Time] [time](7) NULL,
	[Departure_Date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[Station_Name] ASC,
	[Bus_Journey_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CITIZEN_CARD]    Script Date: 8.08.2024 11:16:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CITIZEN_CARD](
	[Card_ID] [int] NOT NULL,
	[Money_Amount] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Card_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[COMPANY]    Script Date: 8.08.2024 11:16:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COMPANY](
	[Company_Name] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Company_Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FERRY]    Script Date: 8.08.2024 11:16:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FERRY](
	[Ferry_Id] [int] NOT NULL,
	[Fuel_Type] [nvarchar](50) NOT NULL,
	[Ferry_Type] [nvarchar](50) NOT NULL,
	[Seat_Count] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Ferry_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FERRY_JOURNEY]    Script Date: 8.08.2024 11:16:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FERRY_JOURNEY](
	[Journey_ID] [int] NOT NULL,
	[Ferry_ID] [int] NOT NULL,
	[Arrival_Time] [time](7) NOT NULL,
	[Arrival_Date] [date] NOT NULL,
	[Arrival_Port] [nvarchar](255) NOT NULL,
	[Departure_Time] [time](7) NOT NULL,
	[Departure_Date] [date] NOT NULL,
	[Departure_Port] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Journey_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FERRY_STOPS]    Script Date: 8.08.2024 11:16:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FERRY_STOPS](
	[Ferry_Journey_ID] [int] NOT NULL,
	[Port_Name] [nvarchar](255) NOT NULL,
	[Arrival_Time] [time](7) NOT NULL,
	[Arrival_Date] [date] NOT NULL,
	[Departure_Time] [time](7) NOT NULL,
	[Departure_Date] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Ferry_Journey_ID] ASC,
	[Port_Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HARBOR]    Script Date: 8.08.2024 11:16:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HARBOR](
	[Port_Name] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Port_Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HIGH_SPEED_TRAIN]    Script Date: 8.08.2024 11:16:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HIGH_SPEED_TRAIN](
	[Train_Number] [int] NOT NULL,
	[Train_Type] [nvarchar](50) NOT NULL,
	[Vagon_Type] [nvarchar](50) NOT NULL,
	[Seat_Count] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Train_Number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HIGH_SPEED_TRAIN_JOURNEY]    Script Date: 8.08.2024 11:16:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HIGH_SPEED_TRAIN_JOURNEY](
	[Journey_ID] [int] NOT NULL,
	[Train_Number] [int] NOT NULL,
	[Arrival_Time] [time](7) NOT NULL,
	[Arrival_Date] [time](7) NOT NULL,
	[Arrival_Station] [nvarchar](255) NOT NULL,
	[Departure_Time] [time](7) NOT NULL,
	[Departure_Date] [date] NOT NULL,
	[Departure_Station] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Journey_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HIGH_SPEED_TRAIN_STATION]    Script Date: 8.08.2024 11:16:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HIGH_SPEED_TRAIN_STATION](
	[Station_Name] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Station_Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HIGH_SPEED_TRAIN_STOPS]    Script Date: 8.08.2024 11:16:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HIGH_SPEED_TRAIN_STOPS](
	[HIGH_SPEED_TRAIN_Journey_ID] [int] NOT NULL,
	[Station_Name] [nvarchar](255) NOT NULL,
	[Arrival_Time] [time](7) NULL,
	[Arrival_Date] [date] NULL,
	[Departure_Time] [time](7) NULL,
	[Departure_Date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[HIGH_SPEED_TRAIN_Journey_ID] ASC,
	[Station_Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HISTORY]    Script Date: 8.08.2024 11:16:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HISTORY](
	[History_ID] [int] NOT NULL,
	[TC] [char](11) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[History_ID] ASC,
	[TC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JOURNEY]    Script Date: 8.08.2024 11:16:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JOURNEY](
	[Journey_Id] [int] NOT NULL,
	[Company_Name] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Journey_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LOCATIONS]    Script Date: 8.08.2024 11:16:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOCATIONS](
	[Location_Id] [int] NOT NULL,
	[Company_Name] [nvarchar](255) NOT NULL,
	[Address] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Location_Id] ASC,
	[Company_Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MARTI]    Script Date: 8.08.2024 11:16:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MARTI](
	[Marti_ID] [int] NOT NULL,
	[Battery] [int] NOT NULL,
	[Price] [decimal](10, 2) NOT NULL,
	[Location_X] [decimal](9, 6) NOT NULL,
	[Location_Y] [decimal](9, 6) NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Marti_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MARTI_JOURNEY]    Script Date: 8.08.2024 11:16:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MARTI_JOURNEY](
	[Journey_ID] [int] NOT NULL,
	[Marti_ID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Journey_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[METRO_JOURNEY]    Script Date: 8.08.2024 11:16:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[METRO_JOURNEY](
	[Journey_ID] [int] NOT NULL,
	[Train_Number] [int] NOT NULL,
	[Arrival_Time] [time](7) NOT NULL,
	[Arrival_Date] [time](7) NOT NULL,
	[Arrival_Station] [nvarchar](255) NOT NULL,
	[Departure_Time] [time](7) NOT NULL,
	[Departure_Date] [date] NOT NULL,
	[Departure_Station] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Journey_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[METRO_STATION]    Script Date: 8.08.2024 11:16:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[METRO_STATION](
	[Station_Name] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Station_Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[METRO_STOPS]    Script Date: 8.08.2024 11:16:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[METRO_STOPS](
	[Metro_Journey_ID] [int] NOT NULL,
	[Station_Name] [nvarchar](255) NOT NULL,
	[Arrival_Time] [time](7) NULL,
	[Arrival_Date] [date] NULL,
	[Departure_Time] [time](7) NULL,
	[Departure_Date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[Metro_Journey_ID] ASC,
	[Station_Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[METRO_TRAIN]    Script Date: 8.08.2024 11:16:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[METRO_TRAIN](
	[Train_Number] [int] NOT NULL,
	[Train_Type] [nvarchar](50) NOT NULL,
	[Vagon_Type] [nvarchar](50) NOT NULL,
	[Seat_Count] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Train_Number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PERSON]    Script Date: 8.08.2024 11:16:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PERSON](
	[Name] [nvarchar](50) NOT NULL,
	[Surname] [nvarchar](50) NOT NULL,
	[TC] [char](11) NOT NULL,
	[Gender] [nvarchar](10) NOT NULL,
	[Birth_Date] [date] NOT NULL,
	[Phone] [nvarchar](15) NULL,
	[Email] [nvarchar](100) NULL,
	[Card_ID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PLANE_JOURNEY]    Script Date: 8.08.2024 11:16:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PLANE_JOURNEY](
	[Journey_Id] [int] NOT NULL,
	[Aircraft_Type] [nvarchar](255) NOT NULL,
	[Arrival_Airport_Name] [nvarchar](255) NOT NULL,
	[Departure_Airport_Name] [nvarchar](255) NOT NULL,
	[Departure_Time] [time](7) NOT NULL,
	[Departure_Date] [date] NOT NULL,
	[Arrival_Time] [time](7) NOT NULL,
	[Arrival_Date] [date] NOT NULL,
	[Next_Journey_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Journey_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SEARCH_HISTORY]    Script Date: 8.08.2024 11:16:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SEARCH_HISTORY](
	[History_Id] [int] NOT NULL,
	[TC] [char](11) NOT NULL,
	[Journey_Id] [int] NOT NULL,
	[Search_Time] [time](7) NOT NULL,
	[Search_Date] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[History_Id] ASC,
	[TC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRANSACTION_HISTORY]    Script Date: 8.08.2024 11:16:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRANSACTION_HISTORY](
	[History_Id] [int] NOT NULL,
	[TC] [char](11) NOT NULL,
	[Transaction_Id] [int] NOT NULL,
	[Journey_Id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[History_Id] ASC,
	[TC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRANSACTIONS]    Script Date: 8.08.2024 11:16:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRANSACTIONS](
	[Transaction_Id] [int] NOT NULL,
	[TC] [char](11) NOT NULL,
	[Journey_Id] [int] NOT NULL,
	[Seat_Number] [int] NULL,
	[Total_Price] [decimal](10, 2) NOT NULL,
	[Scheduled_Arr_Date] [date] NULL,
	[Scheduled_Arr_Time] [time](7) NULL,
	[Scheduled_Dep_Date] [date] NULL,
	[Scheduled_Dep_Time] [time](7) NULL,
	[Ticket_Category] [nvarchar](50) NULL,
	[Departure_Place] [nvarchar](255) NULL,
	[Receive_Place] [nvarchar](255) NULL,
	[Departure_Place_X] [decimal](9, 6) NULL,
	[Departure_Place_Y] [decimal](9, 6) NULL,
	[Receive_Place_X] [decimal](9, 6) NULL,
	[Receive_Place_Y] [decimal](9, 6) NULL,
	[Pet] [bit] NULL,
	[Seat_Reservation] [bit] NULL,
	[Extra_Baggage_Charges] [decimal](10, 2) NULL,
	[Purchase_Date] [date] NOT NULL,
	[Purchase_Time] [time](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Transaction_Id] ASC,
	[TC] ASC,
	[Journey_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VEHICLE]    Script Date: 8.08.2024 11:16:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VEHICLE](
	[Vehicle_ID] [int] NOT NULL,
	[Model] [nvarchar](50) NOT NULL,
	[Fuel_Type] [nvarchar](50) NOT NULL,
	[Deposite_Fees] [decimal](10, 2) NOT NULL,
	[Car_Brand] [nvarchar](50) NOT NULL,
	[Car_Class] [nvarchar](50) NOT NULL,
	[Locations] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Vehicle_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VEHICLE_JOURNEY]    Script Date: 8.08.2024 11:16:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VEHICLE_JOURNEY](
	[Journey_Id] [int] NOT NULL,
	[Vehicle_Id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Journey_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[AIRPLANE] ([Aircraft_Type], [Max_Range], [High_Max_Speed], [Wingspan_Length]) VALUES (N'Airbus A320', 6100, 830, 34)
INSERT [dbo].[AIRPLANE] ([Aircraft_Type], [Max_Range], [High_Max_Speed], [Wingspan_Length]) VALUES (N'Airbus A380', 15200, 945, 80)
INSERT [dbo].[AIRPLANE] ([Aircraft_Type], [Max_Range], [High_Max_Speed], [Wingspan_Length]) VALUES (N'Boeing 737', 6500, 850, 35)
INSERT [dbo].[AIRPLANE] ([Aircraft_Type], [Max_Range], [High_Max_Speed], [Wingspan_Length]) VALUES (N'Boeing 777', 13500, 905, 61)
GO
INSERT [dbo].[AIRPORT] ([Airport_Name], [City]) VALUES (N'Adana Şakirpaşa Havalimanı', N'Adana')
INSERT [dbo].[AIRPORT] ([Airport_Name], [City]) VALUES (N'Ankara Esenboğa Havalimanı', N'Ankara')
INSERT [dbo].[AIRPORT] ([Airport_Name], [City]) VALUES (N'Antalya Havalimanı', N'Antalya')
INSERT [dbo].[AIRPORT] ([Airport_Name], [City]) VALUES (N'İstanbul Havalimanı', N'İstanbul')
INSERT [dbo].[AIRPORT] ([Airport_Name], [City]) VALUES (N'İzmir Adnan Menderes Havalimanı', N'İzmir')
INSERT [dbo].[AIRPORT] ([Airport_Name], [City]) VALUES (N'Sabiha Gökçen Havalimanı', N'İstanbul')
INSERT [dbo].[AIRPORT] ([Airport_Name], [City]) VALUES (N'Trabzon Havalimanı', N'Trabzon')
GO
INSERT [dbo].[BUS] ([Bus_ID], [Fuel_Type], [Number_of_Seats], [Transmission_Type], [Bus_Model]) VALUES (1, N'Dizel', 50, N'Manuel', N'Mercedes-Benz Travego')
INSERT [dbo].[BUS] ([Bus_ID], [Fuel_Type], [Number_of_Seats], [Transmission_Type], [Bus_Model]) VALUES (2, N'Dizel', 45, N'Otomatik', N'Setra S 417 HDH')
INSERT [dbo].[BUS] ([Bus_ID], [Fuel_Type], [Number_of_Seats], [Transmission_Type], [Bus_Model]) VALUES (3, N'Elektrikli', 30, N'Otomatik', N'Temsa Avenue Electron')
GO
INSERT [dbo].[BUS_JOURNEY] ([Journey_Id], [Bus_Id], [Arrival_Time], [Arrival_Date], [Arrival_Bus_Station], [Departure_Time], [Departure_Date], [Departure_Station]) VALUES (2001, 1, CAST(N'14:00:00' AS Time), CAST(N'2023-07-15' AS Date), N'Ankara AŞTİ', CAST(N'08:00:00' AS Time), CAST(N'2023-07-15' AS Date), N'İstanbul Otogarı')
INSERT [dbo].[BUS_JOURNEY] ([Journey_Id], [Bus_Id], [Arrival_Time], [Arrival_Date], [Arrival_Bus_Station], [Departure_Time], [Departure_Date], [Departure_Station]) VALUES (2002, 2, CAST(N'17:00:00' AS Time), CAST(N'2023-07-16' AS Date), N'İzmir Otogarı', CAST(N'09:00:00' AS Time), CAST(N'2023-07-16' AS Date), N'Ankara AŞTİ')
INSERT [dbo].[BUS_JOURNEY] ([Journey_Id], [Bus_Id], [Arrival_Time], [Arrival_Date], [Arrival_Bus_Station], [Departure_Time], [Departure_Date], [Departure_Station]) VALUES (2003, 3, CAST(N'13:30:00' AS Time), CAST(N'2023-07-17' AS Date), N'Antalya Otogarı', CAST(N'07:30:00' AS Time), CAST(N'2023-07-17' AS Date), N'İzmir Otogarı')
GO
INSERT [dbo].[BUS_STATION] ([Station_Name]) VALUES (N'Adana Otogarı')
INSERT [dbo].[BUS_STATION] ([Station_Name]) VALUES (N'Afyonkarahisar Otogarı')
INSERT [dbo].[BUS_STATION] ([Station_Name]) VALUES (N'Ankara AŞTİ')
INSERT [dbo].[BUS_STATION] ([Station_Name]) VALUES (N'Antalya Otogarı')
INSERT [dbo].[BUS_STATION] ([Station_Name]) VALUES (N'Aydın Otogarı')
INSERT [dbo].[BUS_STATION] ([Station_Name]) VALUES (N'Balıkesir Otogarı')
INSERT [dbo].[BUS_STATION] ([Station_Name]) VALUES (N'Burdur Otogarı')
INSERT [dbo].[BUS_STATION] ([Station_Name]) VALUES (N'Bursa Otogarı')
INSERT [dbo].[BUS_STATION] ([Station_Name]) VALUES (N'Çanakkale Otogarı')
INSERT [dbo].[BUS_STATION] ([Station_Name]) VALUES (N'Denizli Otogarı')
INSERT [dbo].[BUS_STATION] ([Station_Name]) VALUES (N'Diyarbakır Otogarı')
INSERT [dbo].[BUS_STATION] ([Station_Name]) VALUES (N'Edirne Otogarı')
INSERT [dbo].[BUS_STATION] ([Station_Name]) VALUES (N'Erzurum Otogarı')
INSERT [dbo].[BUS_STATION] ([Station_Name]) VALUES (N'Gaziantep Otogarı')
INSERT [dbo].[BUS_STATION] ([Station_Name]) VALUES (N'Gebze Otogarı')
INSERT [dbo].[BUS_STATION] ([Station_Name]) VALUES (N'İstanbul Otogarı')
INSERT [dbo].[BUS_STATION] ([Station_Name]) VALUES (N'İzmir Otogarı')
INSERT [dbo].[BUS_STATION] ([Station_Name]) VALUES (N'Kayseri Otogarı')
INSERT [dbo].[BUS_STATION] ([Station_Name]) VALUES (N'Kocaeli Otogarı')
INSERT [dbo].[BUS_STATION] ([Station_Name]) VALUES (N'Konya Otogarı')
INSERT [dbo].[BUS_STATION] ([Station_Name]) VALUES (N'Mersin Otogarı')
INSERT [dbo].[BUS_STATION] ([Station_Name]) VALUES (N'Muğla Otogarı')
INSERT [dbo].[BUS_STATION] ([Station_Name]) VALUES (N'Sakarya Otogarı')
INSERT [dbo].[BUS_STATION] ([Station_Name]) VALUES (N'Samsun Otogarı')
INSERT [dbo].[BUS_STATION] ([Station_Name]) VALUES (N'Sivas Otogarı')
INSERT [dbo].[BUS_STATION] ([Station_Name]) VALUES (N'Trabzon Otogarı')
INSERT [dbo].[BUS_STATION] ([Station_Name]) VALUES (N'Uşak Otogarı')
INSERT [dbo].[BUS_STATION] ([Station_Name]) VALUES (N'Van Otogarı')
GO
INSERT [dbo].[BUS_STOPS] ([Station_Name], [Bus_Journey_Id], [Arrival_Time], [Arrival_Date], [Departure_Time], [Departure_Date]) VALUES (N'Afyonkarahisar Otogarı', 2002, CAST(N'13:00:00' AS Time), CAST(N'2023-07-16' AS Date), CAST(N'13:15:00' AS Time), CAST(N'2023-07-16' AS Date))
INSERT [dbo].[BUS_STOPS] ([Station_Name], [Bus_Journey_Id], [Arrival_Time], [Arrival_Date], [Departure_Time], [Departure_Date]) VALUES (N'Aydın Otogarı', 2003, CAST(N'08:00:00' AS Time), CAST(N'2023-07-17' AS Date), CAST(N'08:15:00' AS Time), CAST(N'2023-07-17' AS Date))
INSERT [dbo].[BUS_STOPS] ([Station_Name], [Bus_Journey_Id], [Arrival_Time], [Arrival_Date], [Departure_Time], [Departure_Date]) VALUES (N'Burdur Otogarı', 2003, CAST(N'11:00:00' AS Time), CAST(N'2023-07-17' AS Date), CAST(N'11:15:00' AS Time), CAST(N'2023-07-17' AS Date))
INSERT [dbo].[BUS_STOPS] ([Station_Name], [Bus_Journey_Id], [Arrival_Time], [Arrival_Date], [Departure_Time], [Departure_Date]) VALUES (N'Denizli Otogarı', 2003, CAST(N'09:30:00' AS Time), CAST(N'2023-07-17' AS Date), CAST(N'09:45:00' AS Time), CAST(N'2023-07-17' AS Date))
INSERT [dbo].[BUS_STOPS] ([Station_Name], [Bus_Journey_Id], [Arrival_Time], [Arrival_Date], [Departure_Time], [Departure_Date]) VALUES (N'Gebze Otogarı', 2001, CAST(N'09:30:00' AS Time), CAST(N'2023-07-15' AS Date), CAST(N'09:45:00' AS Time), CAST(N'2023-07-15' AS Date))
INSERT [dbo].[BUS_STOPS] ([Station_Name], [Bus_Journey_Id], [Arrival_Time], [Arrival_Date], [Departure_Time], [Departure_Date]) VALUES (N'Kocaeli Otogarı', 2001, CAST(N'10:30:00' AS Time), CAST(N'2023-07-15' AS Date), CAST(N'10:45:00' AS Time), CAST(N'2023-07-15' AS Date))
INSERT [dbo].[BUS_STOPS] ([Station_Name], [Bus_Journey_Id], [Arrival_Time], [Arrival_Date], [Departure_Time], [Departure_Date]) VALUES (N'Konya Otogarı', 2002, CAST(N'10:30:00' AS Time), CAST(N'2023-07-16' AS Date), CAST(N'10:45:00' AS Time), CAST(N'2023-07-16' AS Date))
INSERT [dbo].[BUS_STOPS] ([Station_Name], [Bus_Journey_Id], [Arrival_Time], [Arrival_Date], [Departure_Time], [Departure_Date]) VALUES (N'Sakarya Otogarı', 2001, CAST(N'11:30:00' AS Time), CAST(N'2023-07-15' AS Date), CAST(N'11:45:00' AS Time), CAST(N'2023-07-15' AS Date))
INSERT [dbo].[BUS_STOPS] ([Station_Name], [Bus_Journey_Id], [Arrival_Time], [Arrival_Date], [Departure_Time], [Departure_Date]) VALUES (N'Uşak Otogarı', 2002, CAST(N'15:00:00' AS Time), CAST(N'2023-07-16' AS Date), CAST(N'15:15:00' AS Time), CAST(N'2023-07-16' AS Date))
GO
INSERT [dbo].[CITIZEN_CARD] ([Card_ID], [Money_Amount]) VALUES (0, CAST(0.00 AS Decimal(10, 2)))
INSERT [dbo].[CITIZEN_CARD] ([Card_ID], [Money_Amount]) VALUES (1, CAST(10000.00 AS Decimal(10, 2)))
INSERT [dbo].[CITIZEN_CARD] ([Card_ID], [Money_Amount]) VALUES (2, CAST(15000.50 AS Decimal(10, 2)))
INSERT [dbo].[CITIZEN_CARD] ([Card_ID], [Money_Amount]) VALUES (4, CAST(25000.75 AS Decimal(10, 2)))
INSERT [dbo].[CITIZEN_CARD] ([Card_ID], [Money_Amount]) VALUES (5, CAST(30000.00 AS Decimal(10, 2)))
INSERT [dbo].[CITIZEN_CARD] ([Card_ID], [Money_Amount]) VALUES (7, CAST(40000.00 AS Decimal(10, 2)))
INSERT [dbo].[CITIZEN_CARD] ([Card_ID], [Money_Amount]) VALUES (8, CAST(45000.50 AS Decimal(10, 2)))
INSERT [dbo].[CITIZEN_CARD] ([Card_ID], [Money_Amount]) VALUES (9, CAST(50000.00 AS Decimal(10, 2)))
INSERT [dbo].[CITIZEN_CARD] ([Card_ID], [Money_Amount]) VALUES (10, CAST(55000.75 AS Decimal(10, 2)))
INSERT [dbo].[CITIZEN_CARD] ([Card_ID], [Money_Amount]) VALUES (11, CAST(60000.00 AS Decimal(10, 2)))
INSERT [dbo].[CITIZEN_CARD] ([Card_ID], [Money_Amount]) VALUES (12, CAST(65000.25 AS Decimal(10, 2)))
INSERT [dbo].[CITIZEN_CARD] ([Card_ID], [Money_Amount]) VALUES (13, CAST(70000.00 AS Decimal(10, 2)))
INSERT [dbo].[CITIZEN_CARD] ([Card_ID], [Money_Amount]) VALUES (14, CAST(75000.50 AS Decimal(10, 2)))
INSERT [dbo].[CITIZEN_CARD] ([Card_ID], [Money_Amount]) VALUES (15, CAST(80000.00 AS Decimal(10, 2)))
INSERT [dbo].[CITIZEN_CARD] ([Card_ID], [Money_Amount]) VALUES (16, CAST(85000.75 AS Decimal(10, 2)))
INSERT [dbo].[CITIZEN_CARD] ([Card_ID], [Money_Amount]) VALUES (17, CAST(90000.00 AS Decimal(10, 2)))
INSERT [dbo].[CITIZEN_CARD] ([Card_ID], [Money_Amount]) VALUES (18, CAST(95000.25 AS Decimal(10, 2)))
INSERT [dbo].[CITIZEN_CARD] ([Card_ID], [Money_Amount]) VALUES (19, CAST(100000.00 AS Decimal(10, 2)))
INSERT [dbo].[CITIZEN_CARD] ([Card_ID], [Money_Amount]) VALUES (20, CAST(105000.50 AS Decimal(10, 2)))
INSERT [dbo].[CITIZEN_CARD] ([Card_ID], [Money_Amount]) VALUES (21, CAST(110000.00 AS Decimal(10, 2)))
INSERT [dbo].[CITIZEN_CARD] ([Card_ID], [Money_Amount]) VALUES (31, CAST(20000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[COMPANY] ([Company_Name]) VALUES (N'AnadoluJet')
INSERT [dbo].[COMPANY] ([Company_Name]) VALUES (N'Avis Araç Kiralama')
INSERT [dbo].[COMPANY] ([Company_Name]) VALUES (N'Enterprise Araç Kiralama')
INSERT [dbo].[COMPANY] ([Company_Name]) VALUES (N'Garenta Araç Kiralama')
INSERT [dbo].[COMPANY] ([Company_Name]) VALUES (N'İDO')
INSERT [dbo].[COMPANY] ([Company_Name]) VALUES (N'İzban')
INSERT [dbo].[COMPANY] ([Company_Name]) VALUES (N'Kamil Koç')
INSERT [dbo].[COMPANY] ([Company_Name]) VALUES (N'Martı İstanbul')
INSERT [dbo].[COMPANY] ([Company_Name]) VALUES (N'Metro Turizm')
INSERT [dbo].[COMPANY] ([Company_Name]) VALUES (N'NO NAME')
INSERT [dbo].[COMPANY] ([Company_Name]) VALUES (N'Pegasus Havayolları')
INSERT [dbo].[COMPANY] ([Company_Name]) VALUES (N'TCDD')
INSERT [dbo].[COMPANY] ([Company_Name]) VALUES (N'Türk Hava Yolları')
INSERT [dbo].[COMPANY] ([Company_Name]) VALUES (N'Ulusoy Seyahat')
GO
INSERT [dbo].[FERRY] ([Ferry_Id], [Fuel_Type], [Ferry_Type], [Seat_Count]) VALUES (1, N'Dizel', N'Yolcu Feribotu', 300)
INSERT [dbo].[FERRY] ([Ferry_Id], [Fuel_Type], [Ferry_Type], [Seat_Count]) VALUES (2, N'Elektrik', N'Araba Feribotu', 100)
INSERT [dbo].[FERRY] ([Ferry_Id], [Fuel_Type], [Ferry_Type], [Seat_Count]) VALUES (3, N'Dizel-Elektrik Hibrit', N'Hızlı Feribot', 200)
GO
INSERT [dbo].[FERRY_JOURNEY] ([Journey_ID], [Ferry_ID], [Arrival_Time], [Arrival_Date], [Arrival_Port], [Departure_Time], [Departure_Date], [Departure_Port]) VALUES (4001, 1, CAST(N'12:00:00' AS Time), CAST(N'2023-08-01' AS Date), N'Bandırma Limanı', CAST(N'09:00:00' AS Time), CAST(N'2023-08-01' AS Date), N'İstanbul Limanı')
INSERT [dbo].[FERRY_JOURNEY] ([Journey_ID], [Ferry_ID], [Arrival_Time], [Arrival_Date], [Arrival_Port], [Departure_Time], [Departure_Date], [Departure_Port]) VALUES (4002, 2, CAST(N'11:30:00' AS Time), CAST(N'2023-08-02' AS Date), N'Gökçeada Limanı', CAST(N'10:00:00' AS Time), CAST(N'2023-08-02' AS Date), N'Çanakkale Limanı')
INSERT [dbo].[FERRY_JOURNEY] ([Journey_ID], [Ferry_ID], [Arrival_Time], [Arrival_Date], [Arrival_Port], [Departure_Time], [Departure_Date], [Departure_Port]) VALUES (4003, 3, CAST(N'11:00:00' AS Time), CAST(N'2023-08-03' AS Date), N'Alanya Limanı', CAST(N'08:00:00' AS Time), CAST(N'2023-08-03' AS Date), N'Mersin Limanı')
GO
INSERT [dbo].[FERRY_STOPS] ([Ferry_Journey_ID], [Port_Name], [Arrival_Time], [Arrival_Date], [Departure_Time], [Departure_Date]) VALUES (4001, N'Çanakkale Limanı', CAST(N'11:00:00' AS Time), CAST(N'2023-08-01' AS Date), CAST(N'11:15:00' AS Time), CAST(N'2023-08-01' AS Date))
INSERT [dbo].[FERRY_STOPS] ([Ferry_Journey_ID], [Port_Name], [Arrival_Time], [Arrival_Date], [Departure_Time], [Departure_Date]) VALUES (4001, N'Tekirdağ Limanı', CAST(N'10:00:00' AS Time), CAST(N'2023-08-01' AS Date), CAST(N'10:15:00' AS Time), CAST(N'2023-08-01' AS Date))
INSERT [dbo].[FERRY_STOPS] ([Ferry_Journey_ID], [Port_Name], [Arrival_Time], [Arrival_Date], [Departure_Time], [Departure_Date]) VALUES (4002, N'Giresun Limanı', CAST(N'10:30:00' AS Time), CAST(N'2023-08-02' AS Date), CAST(N'10:45:00' AS Time), CAST(N'2023-08-02' AS Date))
INSERT [dbo].[FERRY_STOPS] ([Ferry_Journey_ID], [Port_Name], [Arrival_Time], [Arrival_Date], [Departure_Time], [Departure_Date]) VALUES (4002, N'Samsun Limanı', CAST(N'11:30:00' AS Time), CAST(N'2023-08-02' AS Date), CAST(N'11:45:00' AS Time), CAST(N'2023-08-02' AS Date))
INSERT [dbo].[FERRY_STOPS] ([Ferry_Journey_ID], [Port_Name], [Arrival_Time], [Arrival_Date], [Departure_Time], [Departure_Date]) VALUES (4003, N'Bodrum Limanı', CAST(N'10:30:00' AS Time), CAST(N'2023-08-03' AS Date), CAST(N'10:45:00' AS Time), CAST(N'2023-08-03' AS Date))
INSERT [dbo].[FERRY_STOPS] ([Ferry_Journey_ID], [Port_Name], [Arrival_Time], [Arrival_Date], [Departure_Time], [Departure_Date]) VALUES (4003, N'Fethiye Limanı', CAST(N'09:30:00' AS Time), CAST(N'2023-08-03' AS Date), CAST(N'09:45:00' AS Time), CAST(N'2023-08-03' AS Date))
GO
INSERT [dbo].[HARBOR] ([Port_Name]) VALUES (N'Alanya Limanı')
INSERT [dbo].[HARBOR] ([Port_Name]) VALUES (N'Aliağa Limanı')
INSERT [dbo].[HARBOR] ([Port_Name]) VALUES (N'Antalya Limanı')
INSERT [dbo].[HARBOR] ([Port_Name]) VALUES (N'Bandırma Limanı')
INSERT [dbo].[HARBOR] ([Port_Name]) VALUES (N'Bodrum Limanı')
INSERT [dbo].[HARBOR] ([Port_Name]) VALUES (N'Çanakkale Limanı')
INSERT [dbo].[HARBOR] ([Port_Name]) VALUES (N'Fethiye Limanı')
INSERT [dbo].[HARBOR] ([Port_Name]) VALUES (N'Giresun Limanı')
INSERT [dbo].[HARBOR] ([Port_Name]) VALUES (N'Gökçeada Limanı')
INSERT [dbo].[HARBOR] ([Port_Name]) VALUES (N'İstanbul Limanı')
INSERT [dbo].[HARBOR] ([Port_Name]) VALUES (N'İzmir Alsancak Limanı')
INSERT [dbo].[HARBOR] ([Port_Name]) VALUES (N'Kuşadası Limanı')
INSERT [dbo].[HARBOR] ([Port_Name]) VALUES (N'Mersin Limanı')
INSERT [dbo].[HARBOR] ([Port_Name]) VALUES (N'Rize Limanı')
INSERT [dbo].[HARBOR] ([Port_Name]) VALUES (N'Samsun Limanı')
INSERT [dbo].[HARBOR] ([Port_Name]) VALUES (N'Tekirdağ Limanı')
INSERT [dbo].[HARBOR] ([Port_Name]) VALUES (N'Trabzon Limanı')
GO
INSERT [dbo].[HIGH_SPEED_TRAIN] ([Train_Number], [Train_Type], [Vagon_Type], [Seat_Count]) VALUES (1, N'Elektrikli', N'Yataklı', 200)
INSERT [dbo].[HIGH_SPEED_TRAIN] ([Train_Number], [Train_Type], [Vagon_Type], [Seat_Count]) VALUES (2, N'Elektrikli', N'Yemekli', 180)
INSERT [dbo].[HIGH_SPEED_TRAIN] ([Train_Number], [Train_Type], [Vagon_Type], [Seat_Count]) VALUES (3, N'Dizel', N'Kompartıman', 160)
INSERT [dbo].[HIGH_SPEED_TRAIN] ([Train_Number], [Train_Type], [Vagon_Type], [Seat_Count]) VALUES (4, N'Dizel', N'Yataklı', 200)
INSERT [dbo].[HIGH_SPEED_TRAIN] ([Train_Number], [Train_Type], [Vagon_Type], [Seat_Count]) VALUES (5, N'Hibrit', N'Yemekli', 180)
GO
INSERT [dbo].[HIGH_SPEED_TRAIN_JOURNEY] ([Journey_ID], [Train_Number], [Arrival_Time], [Arrival_Date], [Arrival_Station], [Departure_Time], [Departure_Date], [Departure_Station]) VALUES (6001, 1, CAST(N'11:00:00' AS Time), CAST(N'00:00:00' AS Time), N'Sivas Gar', CAST(N'08:30:00' AS Time), CAST(N'2023-10-01' AS Date), N'Ankara Gar')
INSERT [dbo].[HIGH_SPEED_TRAIN_JOURNEY] ([Journey_ID], [Train_Number], [Arrival_Time], [Arrival_Date], [Arrival_Station], [Departure_Time], [Departure_Date], [Departure_Station]) VALUES (6002, 2, CAST(N'14:00:00' AS Time), CAST(N'00:00:00' AS Time), N'İstanbul Pendik Gar', CAST(N'11:00:00' AS Time), CAST(N'2023-10-02' AS Date), N'Eskişehir Gar')
INSERT [dbo].[HIGH_SPEED_TRAIN_JOURNEY] ([Journey_ID], [Train_Number], [Arrival_Time], [Arrival_Date], [Arrival_Station], [Departure_Time], [Departure_Date], [Departure_Station]) VALUES (6003, 3, CAST(N'12:00:00' AS Time), CAST(N'00:00:00' AS Time), N'Ankara Gar', CAST(N'09:00:00' AS Time), CAST(N'2023-10-03' AS Date), N'Konya Gar')
GO
INSERT [dbo].[HIGH_SPEED_TRAIN_STATION] ([Station_Name]) VALUES (N'Ankara Gar')
INSERT [dbo].[HIGH_SPEED_TRAIN_STATION] ([Station_Name]) VALUES (N'Arifiye Gar')
INSERT [dbo].[HIGH_SPEED_TRAIN_STATION] ([Station_Name]) VALUES (N'Balıkesir Gar')
INSERT [dbo].[HIGH_SPEED_TRAIN_STATION] ([Station_Name]) VALUES (N'Bilecik Gar')
INSERT [dbo].[HIGH_SPEED_TRAIN_STATION] ([Station_Name]) VALUES (N'Bozüyük Gar')
INSERT [dbo].[HIGH_SPEED_TRAIN_STATION] ([Station_Name]) VALUES (N'Eryaman Gar')
INSERT [dbo].[HIGH_SPEED_TRAIN_STATION] ([Station_Name]) VALUES (N'Eskişehir Gar')
INSERT [dbo].[HIGH_SPEED_TRAIN_STATION] ([Station_Name]) VALUES (N'Gebze Gar')
INSERT [dbo].[HIGH_SPEED_TRAIN_STATION] ([Station_Name]) VALUES (N'İstanbul Halkalı Gar')
INSERT [dbo].[HIGH_SPEED_TRAIN_STATION] ([Station_Name]) VALUES (N'İstanbul Pendik Gar')
INSERT [dbo].[HIGH_SPEED_TRAIN_STATION] ([Station_Name]) VALUES (N'İzmir Gar')
INSERT [dbo].[HIGH_SPEED_TRAIN_STATION] ([Station_Name]) VALUES (N'İzmit Gar')
INSERT [dbo].[HIGH_SPEED_TRAIN_STATION] ([Station_Name]) VALUES (N'Kırıkkale Gar')
INSERT [dbo].[HIGH_SPEED_TRAIN_STATION] ([Station_Name]) VALUES (N'Konya Gar')
INSERT [dbo].[HIGH_SPEED_TRAIN_STATION] ([Station_Name]) VALUES (N'Polatlı Gar')
INSERT [dbo].[HIGH_SPEED_TRAIN_STATION] ([Station_Name]) VALUES (N'Sincan Gar')
INSERT [dbo].[HIGH_SPEED_TRAIN_STATION] ([Station_Name]) VALUES (N'Sivas Gar')
GO
INSERT [dbo].[HIGH_SPEED_TRAIN_STOPS] ([HIGH_SPEED_TRAIN_Journey_ID], [Station_Name], [Arrival_Time], [Arrival_Date], [Departure_Time], [Departure_Date]) VALUES (6001, N'Arifiye Gar', CAST(N'10:30:00' AS Time), CAST(N'2023-10-01' AS Date), CAST(N'10:35:00' AS Time), CAST(N'2023-10-01' AS Date))
INSERT [dbo].[HIGH_SPEED_TRAIN_STOPS] ([HIGH_SPEED_TRAIN_Journey_ID], [Station_Name], [Arrival_Time], [Arrival_Date], [Departure_Time], [Departure_Date]) VALUES (6001, N'Bozüyük Gar', CAST(N'09:45:00' AS Time), CAST(N'2023-10-01' AS Date), CAST(N'09:50:00' AS Time), CAST(N'2023-10-01' AS Date))
INSERT [dbo].[HIGH_SPEED_TRAIN_STOPS] ([HIGH_SPEED_TRAIN_Journey_ID], [Station_Name], [Arrival_Time], [Arrival_Date], [Departure_Time], [Departure_Date]) VALUES (6001, N'Polatlı Gar', CAST(N'09:00:00' AS Time), CAST(N'2023-10-01' AS Date), CAST(N'09:05:00' AS Time), CAST(N'2023-10-01' AS Date))
INSERT [dbo].[HIGH_SPEED_TRAIN_STOPS] ([HIGH_SPEED_TRAIN_Journey_ID], [Station_Name], [Arrival_Time], [Arrival_Date], [Departure_Time], [Departure_Date]) VALUES (6002, N'Bilecik Gar', CAST(N'11:45:00' AS Time), CAST(N'2023-10-02' AS Date), CAST(N'11:50:00' AS Time), CAST(N'2023-10-02' AS Date))
INSERT [dbo].[HIGH_SPEED_TRAIN_STOPS] ([HIGH_SPEED_TRAIN_Journey_ID], [Station_Name], [Arrival_Time], [Arrival_Date], [Departure_Time], [Departure_Date]) VALUES (6002, N'Gebze Gar', CAST(N'13:00:00' AS Time), CAST(N'2023-10-02' AS Date), CAST(N'13:05:00' AS Time), CAST(N'2023-10-02' AS Date))
INSERT [dbo].[HIGH_SPEED_TRAIN_STOPS] ([HIGH_SPEED_TRAIN_Journey_ID], [Station_Name], [Arrival_Time], [Arrival_Date], [Departure_Time], [Departure_Date]) VALUES (6002, N'İzmit Gar', CAST(N'13:45:00' AS Time), CAST(N'2023-10-02' AS Date), CAST(N'13:50:00' AS Time), CAST(N'2023-10-02' AS Date))
INSERT [dbo].[HIGH_SPEED_TRAIN_STOPS] ([HIGH_SPEED_TRAIN_Journey_ID], [Station_Name], [Arrival_Time], [Arrival_Date], [Departure_Time], [Departure_Date]) VALUES (6003, N'Eryaman Gar', CAST(N'11:20:00' AS Time), CAST(N'2023-10-03' AS Date), CAST(N'11:25:00' AS Time), CAST(N'2023-10-03' AS Date))
INSERT [dbo].[HIGH_SPEED_TRAIN_STOPS] ([HIGH_SPEED_TRAIN_Journey_ID], [Station_Name], [Arrival_Time], [Arrival_Date], [Departure_Time], [Departure_Date]) VALUES (6003, N'Kırıkkale Gar', CAST(N'09:45:00' AS Time), CAST(N'2023-10-03' AS Date), CAST(N'09:50:00' AS Time), CAST(N'2023-10-03' AS Date))
INSERT [dbo].[HIGH_SPEED_TRAIN_STOPS] ([HIGH_SPEED_TRAIN_Journey_ID], [Station_Name], [Arrival_Time], [Arrival_Date], [Departure_Time], [Departure_Date]) VALUES (6003, N'Sincan Gar', CAST(N'10:45:00' AS Time), CAST(N'2023-10-03' AS Date), CAST(N'10:50:00' AS Time), CAST(N'2023-10-03' AS Date))
GO
INSERT [dbo].[JOURNEY] ([Journey_Id], [Company_Name]) VALUES (0, N'NO NAME')
INSERT [dbo].[JOURNEY] ([Journey_Id], [Company_Name]) VALUES (1001, N'Türk Hava Yolları')
INSERT [dbo].[JOURNEY] ([Journey_Id], [Company_Name]) VALUES (1002, N'Türk Hava Yolları')
INSERT [dbo].[JOURNEY] ([Journey_Id], [Company_Name]) VALUES (1003, N'Pegasus Havayolları')
INSERT [dbo].[JOURNEY] ([Journey_Id], [Company_Name]) VALUES (1004, N'AnadoluJet')
INSERT [dbo].[JOURNEY] ([Journey_Id], [Company_Name]) VALUES (2001, N'Metro Turizm')
INSERT [dbo].[JOURNEY] ([Journey_Id], [Company_Name]) VALUES (2002, N'Ulusoy Seyahat')
INSERT [dbo].[JOURNEY] ([Journey_Id], [Company_Name]) VALUES (2003, N'Kamil Koç')
INSERT [dbo].[JOURNEY] ([Journey_Id], [Company_Name]) VALUES (3001, N'Enterprise Araç Kiralama')
INSERT [dbo].[JOURNEY] ([Journey_Id], [Company_Name]) VALUES (3002, N'Garenta Araç Kiralama')
INSERT [dbo].[JOURNEY] ([Journey_Id], [Company_Name]) VALUES (3003, N'Avis Araç Kiralama')
INSERT [dbo].[JOURNEY] ([Journey_Id], [Company_Name]) VALUES (4001, N'İDO')
INSERT [dbo].[JOURNEY] ([Journey_Id], [Company_Name]) VALUES (4002, N'İDO')
INSERT [dbo].[JOURNEY] ([Journey_Id], [Company_Name]) VALUES (4003, N'İDO')
INSERT [dbo].[JOURNEY] ([Journey_Id], [Company_Name]) VALUES (5001, N'İzban')
INSERT [dbo].[JOURNEY] ([Journey_Id], [Company_Name]) VALUES (5002, N'İzban')
INSERT [dbo].[JOURNEY] ([Journey_Id], [Company_Name]) VALUES (5003, N'İzban')
INSERT [dbo].[JOURNEY] ([Journey_Id], [Company_Name]) VALUES (6001, N'TCDD')
INSERT [dbo].[JOURNEY] ([Journey_Id], [Company_Name]) VALUES (6002, N'TCDD')
INSERT [dbo].[JOURNEY] ([Journey_Id], [Company_Name]) VALUES (6003, N'TCDD')
INSERT [dbo].[JOURNEY] ([Journey_Id], [Company_Name]) VALUES (7001, N'Martı İstanbul')
INSERT [dbo].[JOURNEY] ([Journey_Id], [Company_Name]) VALUES (7002, N'Martı İstanbul')
INSERT [dbo].[JOURNEY] ([Journey_Id], [Company_Name]) VALUES (7003, N'Martı İstanbul')
GO
INSERT [dbo].[LOCATIONS] ([Location_Id], [Company_Name], [Address]) VALUES (0, N'NO NAME', N'------------')
INSERT [dbo].[LOCATIONS] ([Location_Id], [Company_Name], [Address]) VALUES (1, N'Türk Hava Yolları', N'Yeşilköy Mah., Bakırköy, İstanbul')
INSERT [dbo].[LOCATIONS] ([Location_Id], [Company_Name], [Address]) VALUES (2, N'Pegasus Havayolları', N'Kurtköy Mah., Pendik, İstanbul')
INSERT [dbo].[LOCATIONS] ([Location_Id], [Company_Name], [Address]) VALUES (3, N'AnadoluJet', N'Akyurt Mah., Ankara')
INSERT [dbo].[LOCATIONS] ([Location_Id], [Company_Name], [Address]) VALUES (4, N'Metro Turizm', N'Esentepe Mah., Şişli, İstanbul')
INSERT [dbo].[LOCATIONS] ([Location_Id], [Company_Name], [Address]) VALUES (5, N'Ulusoy Seyahat', N'Ulus Mah., Altındağ, Ankara')
INSERT [dbo].[LOCATIONS] ([Location_Id], [Company_Name], [Address]) VALUES (6, N'Kamil Koç', N'Konak Mah., Konak, İzmir')
INSERT [dbo].[LOCATIONS] ([Location_Id], [Company_Name], [Address]) VALUES (7, N'Enterprise Araç Kiralama', N'Seyhan Mah., Adana')
INSERT [dbo].[LOCATIONS] ([Location_Id], [Company_Name], [Address]) VALUES (8, N'Enterprise Araç Kiralama', N'Bornova Mah., İzmir')
INSERT [dbo].[LOCATIONS] ([Location_Id], [Company_Name], [Address]) VALUES (11, N'Garenta Araç Kiralama', N'Konyaaltı Mah., Antalya')
INSERT [dbo].[LOCATIONS] ([Location_Id], [Company_Name], [Address]) VALUES (12, N'Garenta Araç Kiralama', N'Osmangazi Mah., Bursa')
INSERT [dbo].[LOCATIONS] ([Location_Id], [Company_Name], [Address]) VALUES (13, N'Avis Araç Kiralama', N'Bağlar Mah., Diyarbakır')
INSERT [dbo].[LOCATIONS] ([Location_Id], [Company_Name], [Address]) VALUES (14, N'Avis Araç Kiralama', N'Çukurova Mah., Adana')
INSERT [dbo].[LOCATIONS] ([Location_Id], [Company_Name], [Address]) VALUES (15, N'Avis Araç Kiralama', N'Melikgazi Mah., Kayseri')
INSERT [dbo].[LOCATIONS] ([Location_Id], [Company_Name], [Address]) VALUES (16, N'İDO', N'Yenikapı Feribot Terminali, Fatih, İstanbul')
INSERT [dbo].[LOCATIONS] ([Location_Id], [Company_Name], [Address]) VALUES (17, N'İzban', N'Alsancak Garı, Konak, İzmir')
INSERT [dbo].[LOCATIONS] ([Location_Id], [Company_Name], [Address]) VALUES (18, N'TCDD', N'Ankara Garı, Altındağ, Ankara')
INSERT [dbo].[LOCATIONS] ([Location_Id], [Company_Name], [Address]) VALUES (19, N'Martı İstanbul', N'Beyoğlu, İstanbul')
GO
INSERT [dbo].[MARTI] ([Marti_ID], [Battery], [Price], [Location_X], [Location_Y], [Type]) VALUES (1, 85, CAST(15.00 AS Decimal(10, 2)), CAST(38.419200 AS Decimal(9, 6)), CAST(27.128720 AS Decimal(9, 6)), N'Standart Scooter')
INSERT [dbo].[MARTI] ([Marti_ID], [Battery], [Price], [Location_X], [Location_Y], [Type]) VALUES (2, 90, CAST(18.00 AS Decimal(10, 2)), CAST(39.933365 AS Decimal(9, 6)), CAST(32.859742 AS Decimal(9, 6)), N'Standart Scooter')
INSERT [dbo].[MARTI] ([Marti_ID], [Battery], [Price], [Location_X], [Location_Y], [Type]) VALUES (3, 75, CAST(16.50 AS Decimal(10, 2)), CAST(41.008238 AS Decimal(9, 6)), CAST(28.978359 AS Decimal(9, 6)), N'Standart Scooter')
GO
INSERT [dbo].[MARTI_JOURNEY] ([Journey_ID], [Marti_ID]) VALUES (7001, 1)
INSERT [dbo].[MARTI_JOURNEY] ([Journey_ID], [Marti_ID]) VALUES (7002, 2)
INSERT [dbo].[MARTI_JOURNEY] ([Journey_ID], [Marti_ID]) VALUES (7003, 3)
GO
INSERT [dbo].[METRO_JOURNEY] ([Journey_ID], [Train_Number], [Arrival_Time], [Arrival_Date], [Arrival_Station], [Departure_Time], [Departure_Date], [Departure_Station]) VALUES (5001, 101, CAST(N'09:20:00' AS Time), CAST(N'00:00:00' AS Time), N'Çankaya Metro İstasyonu', CAST(N'08:30:00' AS Time), CAST(N'2023-09-01' AS Date), N'Konak Metro İstasyonu')
INSERT [dbo].[METRO_JOURNEY] ([Journey_ID], [Train_Number], [Arrival_Time], [Arrival_Date], [Arrival_Station], [Departure_Time], [Departure_Date], [Departure_Station]) VALUES (5002, 102, CAST(N'10:30:00' AS Time), CAST(N'00:00:00' AS Time), N'Bölge Metro İstasyonu', CAST(N'10:00:00' AS Time), CAST(N'2023-09-02' AS Date), N'Halkapınar Metro İstasyonu')
INSERT [dbo].[METRO_JOURNEY] ([Journey_ID], [Train_Number], [Arrival_Time], [Arrival_Date], [Arrival_Station], [Departure_Time], [Departure_Date], [Departure_Station]) VALUES (5003, 103, CAST(N'12:20:00' AS Time), CAST(N'00:00:00' AS Time), N'Poligon Metro İstasyonu', CAST(N'11:30:00' AS Time), CAST(N'2023-09-03' AS Date), N'Fahrettin Altay Metro İstasyonu')
GO
INSERT [dbo].[METRO_STATION] ([Station_Name]) VALUES (N'Bornova Metro İstasyonu')
INSERT [dbo].[METRO_STATION] ([Station_Name]) VALUES (N'Bölge Metro İstasyonu')
INSERT [dbo].[METRO_STATION] ([Station_Name]) VALUES (N'Çankaya Metro İstasyonu')
INSERT [dbo].[METRO_STATION] ([Station_Name]) VALUES (N'Evka-3 Metro İstasyonu')
INSERT [dbo].[METRO_STATION] ([Station_Name]) VALUES (N'Fahrettin Altay Metro İstasyonu')
INSERT [dbo].[METRO_STATION] ([Station_Name]) VALUES (N'Göztepe Metro İstasyonu')
INSERT [dbo].[METRO_STATION] ([Station_Name]) VALUES (N'Halkapınar Metro İstasyonu')
INSERT [dbo].[METRO_STATION] ([Station_Name]) VALUES (N'Hilal Metro İstasyonu')
INSERT [dbo].[METRO_STATION] ([Station_Name]) VALUES (N'Karşıyaka Metro İstasyonu')
INSERT [dbo].[METRO_STATION] ([Station_Name]) VALUES (N'Konak Metro İstasyonu')
INSERT [dbo].[METRO_STATION] ([Station_Name]) VALUES (N'Poligon Metro İstasyonu')
INSERT [dbo].[METRO_STATION] ([Station_Name]) VALUES (N'Şirinyer Metro İstasyonu')
INSERT [dbo].[METRO_STATION] ([Station_Name]) VALUES (N'Üçkuyular Metro İstasyonu')
INSERT [dbo].[METRO_STATION] ([Station_Name]) VALUES (N'Üçyol Metro İstasyonu')
GO
INSERT [dbo].[METRO_STOPS] ([Metro_Journey_ID], [Station_Name], [Arrival_Time], [Arrival_Date], [Departure_Time], [Departure_Date]) VALUES (5001, N'Bornova Metro İstasyonu', CAST(N'08:40:00' AS Time), CAST(N'2023-09-01' AS Date), CAST(N'08:42:00' AS Time), CAST(N'2023-09-01' AS Date))
INSERT [dbo].[METRO_STOPS] ([Metro_Journey_ID], [Station_Name], [Arrival_Time], [Arrival_Date], [Departure_Time], [Departure_Date]) VALUES (5001, N'Halkapınar Metro İstasyonu', CAST(N'09:05:00' AS Time), CAST(N'2023-09-01' AS Date), CAST(N'09:07:00' AS Time), CAST(N'2023-09-01' AS Date))
INSERT [dbo].[METRO_STOPS] ([Metro_Journey_ID], [Station_Name], [Arrival_Time], [Arrival_Date], [Departure_Time], [Departure_Date]) VALUES (5001, N'Üçyol Metro İstasyonu', CAST(N'08:50:00' AS Time), CAST(N'2023-09-01' AS Date), CAST(N'08:52:00' AS Time), CAST(N'2023-09-01' AS Date))
INSERT [dbo].[METRO_STOPS] ([Metro_Journey_ID], [Station_Name], [Arrival_Time], [Arrival_Date], [Departure_Time], [Departure_Date]) VALUES (5002, N'Çankaya Metro İstasyonu', CAST(N'10:10:00' AS Time), CAST(N'2023-09-02' AS Date), CAST(N'10:12:00' AS Time), CAST(N'2023-09-02' AS Date))
INSERT [dbo].[METRO_STOPS] ([Metro_Journey_ID], [Station_Name], [Arrival_Time], [Arrival_Date], [Departure_Time], [Departure_Date]) VALUES (5002, N'Evka-3 Metro İstasyonu', CAST(N'10:30:00' AS Time), CAST(N'2023-09-02' AS Date), CAST(N'10:32:00' AS Time), CAST(N'2023-09-02' AS Date))
INSERT [dbo].[METRO_STOPS] ([Metro_Journey_ID], [Station_Name], [Arrival_Time], [Arrival_Date], [Departure_Time], [Departure_Date]) VALUES (5002, N'Fahrettin Altay Metro İstasyonu', CAST(N'10:20:00' AS Time), CAST(N'2023-09-02' AS Date), CAST(N'10:22:00' AS Time), CAST(N'2023-09-02' AS Date))
INSERT [dbo].[METRO_STOPS] ([Metro_Journey_ID], [Station_Name], [Arrival_Time], [Arrival_Date], [Departure_Time], [Departure_Date]) VALUES (5002, N'Karşıyaka Metro İstasyonu', CAST(N'10:40:00' AS Time), CAST(N'2023-09-02' AS Date), CAST(N'10:42:00' AS Time), CAST(N'2023-09-02' AS Date))
INSERT [dbo].[METRO_STOPS] ([Metro_Journey_ID], [Station_Name], [Arrival_Time], [Arrival_Date], [Departure_Time], [Departure_Date]) VALUES (5003, N'Bölge Metro İstasyonu', CAST(N'11:50:00' AS Time), CAST(N'2023-09-03' AS Date), CAST(N'11:52:00' AS Time), CAST(N'2023-09-03' AS Date))
INSERT [dbo].[METRO_STOPS] ([Metro_Journey_ID], [Station_Name], [Arrival_Time], [Arrival_Date], [Departure_Time], [Departure_Date]) VALUES (5003, N'Göztepe Metro İstasyonu', CAST(N'12:10:00' AS Time), CAST(N'2023-09-03' AS Date), CAST(N'12:12:00' AS Time), CAST(N'2023-09-03' AS Date))
INSERT [dbo].[METRO_STOPS] ([Metro_Journey_ID], [Station_Name], [Arrival_Time], [Arrival_Date], [Departure_Time], [Departure_Date]) VALUES (5003, N'Karşıyaka Metro İstasyonu', CAST(N'11:40:00' AS Time), CAST(N'2023-09-03' AS Date), CAST(N'11:42:00' AS Time), CAST(N'2023-09-03' AS Date))
INSERT [dbo].[METRO_STOPS] ([Metro_Journey_ID], [Station_Name], [Arrival_Time], [Arrival_Date], [Departure_Time], [Departure_Date]) VALUES (5003, N'Şirinyer Metro İstasyonu', CAST(N'12:00:00' AS Time), CAST(N'2023-09-03' AS Date), CAST(N'12:02:00' AS Time), CAST(N'2023-09-03' AS Date))
GO
INSERT [dbo].[METRO_TRAIN] ([Train_Number], [Train_Type], [Vagon_Type], [Seat_Count]) VALUES (101, N'Yeraltı Metrosu', N'Standart', 200)
INSERT [dbo].[METRO_TRAIN] ([Train_Number], [Train_Type], [Vagon_Type], [Seat_Count]) VALUES (102, N'Hafif Raylı Sistem', N'Standart', 150)
INSERT [dbo].[METRO_TRAIN] ([Train_Number], [Train_Type], [Vagon_Type], [Seat_Count]) VALUES (103, N'Yeraltı Metrosu', N'Ekspres', 180)
GO
INSERT [dbo].[PERSON] ([Name], [Surname], [TC], [Gender], [Birth_Date], [Phone], [Email], [Card_ID]) VALUES (N'NO NAME', N'----', N'00000000000', N'----', CAST(N'1999-01-01' AS Date), N'----', N'----', 0)
INSERT [dbo].[PERSON] ([Name], [Surname], [TC], [Gender], [Birth_Date], [Phone], [Email], [Card_ID]) VALUES (N'Ali', N'Yılmaz', N'12345678901', N'Erkek', CAST(N'1980-01-01' AS Date), N'05001112233', N'ali.yilmaz@example.com', 1)
INSERT [dbo].[PERSON] ([Name], [Surname], [TC], [Gender], [Birth_Date], [Phone], [Email], [Card_ID]) VALUES (N'Ayşe', N'Demir', N'12345678902', N'Kadın', CAST(N'1985-02-02' AS Date), N'05001112234', N'ayse.demir@example.com', 2)
INSERT [dbo].[PERSON] ([Name], [Surname], [TC], [Gender], [Birth_Date], [Phone], [Email], [Card_ID]) VALUES (N'Ahmet', N'Kaya', N'12345678903', N'Erkek', CAST(N'1990-03-03' AS Date), N'05001112235', N'ahmet.kaya@example.com', 31)
INSERT [dbo].[PERSON] ([Name], [Surname], [TC], [Gender], [Birth_Date], [Phone], [Email], [Card_ID]) VALUES (N'Elif', N'Çelik', N'12345678904', N'Kadın', CAST(N'1995-04-04' AS Date), N'05001112236', N'elif.celik@example.com', 4)
INSERT [dbo].[PERSON] ([Name], [Surname], [TC], [Gender], [Birth_Date], [Phone], [Email], [Card_ID]) VALUES (N'Mehmet', N'Öztürk', N'12345678905', N'Erkek', CAST(N'1992-05-05' AS Date), N'05001112237', N'mehmet.ozturk@example.com', 5)
INSERT [dbo].[PERSON] ([Name], [Surname], [TC], [Gender], [Birth_Date], [Phone], [Email], [Card_ID]) VALUES (N'Zeynep', N'Koç', N'12345678906', N'Kadın', CAST(N'1988-06-06' AS Date), N'05001112238', N'zeynep.koc@example.com', 0)
INSERT [dbo].[PERSON] ([Name], [Surname], [TC], [Gender], [Birth_Date], [Phone], [Email], [Card_ID]) VALUES (N'Emre', N'Aydın', N'12345678907', N'Erkek', CAST(N'1983-07-07' AS Date), N'05001112239', N'emre.aydin@example.com', 7)
INSERT [dbo].[PERSON] ([Name], [Surname], [TC], [Gender], [Birth_Date], [Phone], [Email], [Card_ID]) VALUES (N'Selin', N'Can', N'12345678908', N'Kadın', CAST(N'1996-08-08' AS Date), N'05001112240', N'selin.can@example.com', 8)
INSERT [dbo].[PERSON] ([Name], [Surname], [TC], [Gender], [Birth_Date], [Phone], [Email], [Card_ID]) VALUES (N'Kerem', N'Yıldırım', N'12345678909', N'Erkek', CAST(N'1981-09-09' AS Date), N'05001112241', N'kerem.yildirim@example.com', 9)
INSERT [dbo].[PERSON] ([Name], [Surname], [TC], [Gender], [Birth_Date], [Phone], [Email], [Card_ID]) VALUES (N'Aslı', N'Kara', N'12345678910', N'Kadın', CAST(N'1993-10-10' AS Date), N'05001112242', N'asli.kara@example.com', 10)
INSERT [dbo].[PERSON] ([Name], [Surname], [TC], [Gender], [Birth_Date], [Phone], [Email], [Card_ID]) VALUES (N'Burak', N'Çetin', N'12345678911', N'Erkek', CAST(N'1994-11-11' AS Date), N'05001112243', N'burak.cetin@example.com', 11)
INSERT [dbo].[PERSON] ([Name], [Surname], [TC], [Gender], [Birth_Date], [Phone], [Email], [Card_ID]) VALUES (N'Seda', N'Akar', N'12345678912', N'Kadın', CAST(N'1987-12-12' AS Date), N'05001112244', N'seda.akar@example.com', 12)
INSERT [dbo].[PERSON] ([Name], [Surname], [TC], [Gender], [Birth_Date], [Phone], [Email], [Card_ID]) VALUES (N'Caner', N'Tezcan', N'12345678913', N'Erkek', CAST(N'1982-01-13' AS Date), N'05001112245', N'caner.tezcan@example.com', 13)
INSERT [dbo].[PERSON] ([Name], [Surname], [TC], [Gender], [Birth_Date], [Phone], [Email], [Card_ID]) VALUES (N'Melis', N'Uzun', N'12345678914', N'Kadın', CAST(N'1991-02-14' AS Date), N'05001112246', N'melis.uzun@example.com', 14)
INSERT [dbo].[PERSON] ([Name], [Surname], [TC], [Gender], [Birth_Date], [Phone], [Email], [Card_ID]) VALUES (N'Oğuz', N'Kurt', N'12345678915', N'Erkek', CAST(N'1989-03-15' AS Date), N'05001112247', N'oguz.kurt@example.com', 15)
INSERT [dbo].[PERSON] ([Name], [Surname], [TC], [Gender], [Birth_Date], [Phone], [Email], [Card_ID]) VALUES (N'Leyla', N'Güneş', N'12345678916', N'Kadın', CAST(N'1997-04-16' AS Date), N'05001112248', N'leyla.gunes@example.com', 16)
INSERT [dbo].[PERSON] ([Name], [Surname], [TC], [Gender], [Birth_Date], [Phone], [Email], [Card_ID]) VALUES (N'Murat', N'Şahin', N'12345678917', N'Erkek', CAST(N'1984-05-17' AS Date), N'05001112249', N'murat.sahin@example.com', 17)
INSERT [dbo].[PERSON] ([Name], [Surname], [TC], [Gender], [Birth_Date], [Phone], [Email], [Card_ID]) VALUES (N'Esra', N'Yıldız', N'12345678918', N'Kadın', CAST(N'1986-06-18' AS Date), N'05001112250', N'esra.yildiz@example.com', 18)
INSERT [dbo].[PERSON] ([Name], [Surname], [TC], [Gender], [Birth_Date], [Phone], [Email], [Card_ID]) VALUES (N'Furkan', N'Özdemir', N'12345678919', N'Erkek', CAST(N'1995-07-19' AS Date), N'05001112251', N'furkan.ozdemir@example.com', 19)
INSERT [dbo].[PERSON] ([Name], [Surname], [TC], [Gender], [Birth_Date], [Phone], [Email], [Card_ID]) VALUES (N'Deniz', N'Arslan', N'12345678920', N'Kadın', CAST(N'1998-08-20' AS Date), N'05001112252', N'deniz.arslan@example.com', 20)
INSERT [dbo].[PERSON] ([Name], [Surname], [TC], [Gender], [Birth_Date], [Phone], [Email], [Card_ID]) VALUES (N'Sinan', N'Kılıç', N'12345678921', N'Erkek', CAST(N'1999-09-21' AS Date), N'05001112253', N'sinan.kilic@example.com', 21)
GO
INSERT [dbo].[PLANE_JOURNEY] ([Journey_Id], [Aircraft_Type], [Arrival_Airport_Name], [Departure_Airport_Name], [Departure_Time], [Departure_Date], [Arrival_Time], [Arrival_Date], [Next_Journey_ID]) VALUES (1001, N'Boeing 737', N'Ankara Esenboğa Havalimanı', N'İstanbul Havalimanı', CAST(N'08:00:00' AS Time), CAST(N'2023-07-15' AS Date), CAST(N'09:15:00' AS Time), CAST(N'2013-11-02' AS Date), 1002)
INSERT [dbo].[PLANE_JOURNEY] ([Journey_Id], [Aircraft_Type], [Arrival_Airport_Name], [Departure_Airport_Name], [Departure_Time], [Departure_Date], [Arrival_Time], [Arrival_Date], [Next_Journey_ID]) VALUES (1002, N'Boeing 737', N'İzmir Adnan Menderes Havalimanı', N'Ankara Esenboğa Havalimanı', CAST(N'10:00:00' AS Time), CAST(N'2023-07-15' AS Date), CAST(N'11:25:00' AS Time), CAST(N'2023-07-15' AS Date), NULL)
INSERT [dbo].[PLANE_JOURNEY] ([Journey_Id], [Aircraft_Type], [Arrival_Airport_Name], [Departure_Airport_Name], [Departure_Time], [Departure_Date], [Arrival_Time], [Arrival_Date], [Next_Journey_ID]) VALUES (1003, N'Airbus A380', N'Adana Şakirpaşa Havalimanı', N'Antalya Havalimanı', CAST(N'13:30:00' AS Time), CAST(N'2023-07-16' AS Date), CAST(N'14:45:00' AS Time), CAST(N'2023-07-16' AS Date), NULL)
INSERT [dbo].[PLANE_JOURNEY] ([Journey_Id], [Aircraft_Type], [Arrival_Airport_Name], [Departure_Airport_Name], [Departure_Time], [Departure_Date], [Arrival_Time], [Arrival_Date], [Next_Journey_ID]) VALUES (1004, N'Airbus A380', N'Trabzon Havalimanı', N'Sabiha Gökçen Havalimanı', CAST(N'16:00:00' AS Time), CAST(N'2023-07-17' AS Date), CAST(N'17:50:00' AS Time), CAST(N'2023-07-17' AS Date), NULL)
GO
INSERT [dbo].[SEARCH_HISTORY] ([History_Id], [TC], [Journey_Id], [Search_Time], [Search_Date]) VALUES (1, N'12345678901', 1001, CAST(N'08:00:00' AS Time), CAST(N'2023-07-09' AS Date))
INSERT [dbo].[SEARCH_HISTORY] ([History_Id], [TC], [Journey_Id], [Search_Time], [Search_Date]) VALUES (2, N'12345678901', 2002, CAST(N'09:00:00' AS Time), CAST(N'2023-07-08' AS Date))
INSERT [dbo].[SEARCH_HISTORY] ([History_Id], [TC], [Journey_Id], [Search_Time], [Search_Date]) VALUES (3, N'12345678902', 3002, CAST(N'10:00:00' AS Time), CAST(N'2023-07-07' AS Date))
INSERT [dbo].[SEARCH_HISTORY] ([History_Id], [TC], [Journey_Id], [Search_Time], [Search_Date]) VALUES (4, N'12345678902', 4003, CAST(N'11:00:00' AS Time), CAST(N'2023-07-06' AS Date))
INSERT [dbo].[SEARCH_HISTORY] ([History_Id], [TC], [Journey_Id], [Search_Time], [Search_Date]) VALUES (5, N'12345678903', 5003, CAST(N'12:00:00' AS Time), CAST(N'2023-07-05' AS Date))
INSERT [dbo].[SEARCH_HISTORY] ([History_Id], [TC], [Journey_Id], [Search_Time], [Search_Date]) VALUES (6, N'12345678903', 6001, CAST(N'13:00:00' AS Time), CAST(N'2023-07-04' AS Date))
INSERT [dbo].[SEARCH_HISTORY] ([History_Id], [TC], [Journey_Id], [Search_Time], [Search_Date]) VALUES (7, N'12345678904', 7001, CAST(N'14:00:00' AS Time), CAST(N'2023-07-03' AS Date))
INSERT [dbo].[SEARCH_HISTORY] ([History_Id], [TC], [Journey_Id], [Search_Time], [Search_Date]) VALUES (8, N'12345678904', 1002, CAST(N'15:00:00' AS Time), CAST(N'2023-07-02' AS Date))
INSERT [dbo].[SEARCH_HISTORY] ([History_Id], [TC], [Journey_Id], [Search_Time], [Search_Date]) VALUES (9, N'12345678905', 2001, CAST(N'16:00:00' AS Time), CAST(N'2023-07-01' AS Date))
INSERT [dbo].[SEARCH_HISTORY] ([History_Id], [TC], [Journey_Id], [Search_Time], [Search_Date]) VALUES (10, N'12345678905', 3003, CAST(N'17:00:00' AS Time), CAST(N'2023-06-30' AS Date))
INSERT [dbo].[SEARCH_HISTORY] ([History_Id], [TC], [Journey_Id], [Search_Time], [Search_Date]) VALUES (11, N'12345678906', 4002, CAST(N'18:00:00' AS Time), CAST(N'2023-06-29' AS Date))
INSERT [dbo].[SEARCH_HISTORY] ([History_Id], [TC], [Journey_Id], [Search_Time], [Search_Date]) VALUES (12, N'12345678906', 5002, CAST(N'19:00:00' AS Time), CAST(N'2023-06-28' AS Date))
INSERT [dbo].[SEARCH_HISTORY] ([History_Id], [TC], [Journey_Id], [Search_Time], [Search_Date]) VALUES (13, N'12345678907', 6002, CAST(N'08:30:00' AS Time), CAST(N'2023-06-27' AS Date))
INSERT [dbo].[SEARCH_HISTORY] ([History_Id], [TC], [Journey_Id], [Search_Time], [Search_Date]) VALUES (14, N'12345678907', 7002, CAST(N'09:30:00' AS Time), CAST(N'2023-06-26' AS Date))
INSERT [dbo].[SEARCH_HISTORY] ([History_Id], [TC], [Journey_Id], [Search_Time], [Search_Date]) VALUES (15, N'12345678908', 1003, CAST(N'10:30:00' AS Time), CAST(N'2023-06-25' AS Date))
INSERT [dbo].[SEARCH_HISTORY] ([History_Id], [TC], [Journey_Id], [Search_Time], [Search_Date]) VALUES (16, N'12345678908', 2003, CAST(N'11:30:00' AS Time), CAST(N'2023-06-24' AS Date))
INSERT [dbo].[SEARCH_HISTORY] ([History_Id], [TC], [Journey_Id], [Search_Time], [Search_Date]) VALUES (17, N'12345678909', 3001, CAST(N'12:30:00' AS Time), CAST(N'2023-06-23' AS Date))
INSERT [dbo].[SEARCH_HISTORY] ([History_Id], [TC], [Journey_Id], [Search_Time], [Search_Date]) VALUES (18, N'12345678909', 4001, CAST(N'13:30:00' AS Time), CAST(N'2023-06-22' AS Date))
INSERT [dbo].[SEARCH_HISTORY] ([History_Id], [TC], [Journey_Id], [Search_Time], [Search_Date]) VALUES (19, N'12345678910', 5001, CAST(N'14:30:00' AS Time), CAST(N'2023-06-21' AS Date))
INSERT [dbo].[SEARCH_HISTORY] ([History_Id], [TC], [Journey_Id], [Search_Time], [Search_Date]) VALUES (20, N'12345678910', 6003, CAST(N'15:30:00' AS Time), CAST(N'2023-06-20' AS Date))
INSERT [dbo].[SEARCH_HISTORY] ([History_Id], [TC], [Journey_Id], [Search_Time], [Search_Date]) VALUES (21, N'12345678911', 7003, CAST(N'16:30:00' AS Time), CAST(N'2023-06-19' AS Date))
INSERT [dbo].[SEARCH_HISTORY] ([History_Id], [TC], [Journey_Id], [Search_Time], [Search_Date]) VALUES (22, N'12345678911', 1001, CAST(N'08:15:00' AS Time), CAST(N'2023-06-18' AS Date))
INSERT [dbo].[SEARCH_HISTORY] ([History_Id], [TC], [Journey_Id], [Search_Time], [Search_Date]) VALUES (23, N'12345678912', 2002, CAST(N'09:15:00' AS Time), CAST(N'2023-06-17' AS Date))
INSERT [dbo].[SEARCH_HISTORY] ([History_Id], [TC], [Journey_Id], [Search_Time], [Search_Date]) VALUES (24, N'12345678912', 3002, CAST(N'10:15:00' AS Time), CAST(N'2023-06-16' AS Date))
INSERT [dbo].[SEARCH_HISTORY] ([History_Id], [TC], [Journey_Id], [Search_Time], [Search_Date]) VALUES (25, N'12345678913', 4003, CAST(N'11:15:00' AS Time), CAST(N'2023-06-15' AS Date))
INSERT [dbo].[SEARCH_HISTORY] ([History_Id], [TC], [Journey_Id], [Search_Time], [Search_Date]) VALUES (26, N'12345678913', 5003, CAST(N'12:15:00' AS Time), CAST(N'2023-06-14' AS Date))
INSERT [dbo].[SEARCH_HISTORY] ([History_Id], [TC], [Journey_Id], [Search_Time], [Search_Date]) VALUES (27, N'12345678914', 6001, CAST(N'13:15:00' AS Time), CAST(N'2023-06-13' AS Date))
INSERT [dbo].[SEARCH_HISTORY] ([History_Id], [TC], [Journey_Id], [Search_Time], [Search_Date]) VALUES (28, N'12345678914', 7001, CAST(N'14:15:00' AS Time), CAST(N'2023-06-12' AS Date))
INSERT [dbo].[SEARCH_HISTORY] ([History_Id], [TC], [Journey_Id], [Search_Time], [Search_Date]) VALUES (29, N'12345678915', 1002, CAST(N'15:15:00' AS Time), CAST(N'2023-06-11' AS Date))
INSERT [dbo].[SEARCH_HISTORY] ([History_Id], [TC], [Journey_Id], [Search_Time], [Search_Date]) VALUES (30, N'12345678915', 2001, CAST(N'16:15:00' AS Time), CAST(N'2023-06-10' AS Date))
INSERT [dbo].[SEARCH_HISTORY] ([History_Id], [TC], [Journey_Id], [Search_Time], [Search_Date]) VALUES (31, N'12345678916', 3003, CAST(N'17:15:00' AS Time), CAST(N'2023-06-09' AS Date))
INSERT [dbo].[SEARCH_HISTORY] ([History_Id], [TC], [Journey_Id], [Search_Time], [Search_Date]) VALUES (32, N'12345678916', 4002, CAST(N'18:15:00' AS Time), CAST(N'2023-06-08' AS Date))
INSERT [dbo].[SEARCH_HISTORY] ([History_Id], [TC], [Journey_Id], [Search_Time], [Search_Date]) VALUES (33, N'12345678917', 5002, CAST(N'19:15:00' AS Time), CAST(N'2023-06-07' AS Date))
INSERT [dbo].[SEARCH_HISTORY] ([History_Id], [TC], [Journey_Id], [Search_Time], [Search_Date]) VALUES (34, N'12345678917', 6002, CAST(N'08:45:00' AS Time), CAST(N'2023-06-06' AS Date))
INSERT [dbo].[SEARCH_HISTORY] ([History_Id], [TC], [Journey_Id], [Search_Time], [Search_Date]) VALUES (35, N'12345678918', 7002, CAST(N'09:45:00' AS Time), CAST(N'2023-06-05' AS Date))
INSERT [dbo].[SEARCH_HISTORY] ([History_Id], [TC], [Journey_Id], [Search_Time], [Search_Date]) VALUES (36, N'12345678918', 1003, CAST(N'10:45:00' AS Time), CAST(N'2023-06-04' AS Date))
INSERT [dbo].[SEARCH_HISTORY] ([History_Id], [TC], [Journey_Id], [Search_Time], [Search_Date]) VALUES (37, N'12345678919', 2003, CAST(N'11:45:00' AS Time), CAST(N'2023-06-03' AS Date))
INSERT [dbo].[SEARCH_HISTORY] ([History_Id], [TC], [Journey_Id], [Search_Time], [Search_Date]) VALUES (38, N'12345678919', 3001, CAST(N'12:45:00' AS Time), CAST(N'2023-06-02' AS Date))
INSERT [dbo].[SEARCH_HISTORY] ([History_Id], [TC], [Journey_Id], [Search_Time], [Search_Date]) VALUES (39, N'12345678920', 4001, CAST(N'13:45:00' AS Time), CAST(N'2023-06-01' AS Date))
INSERT [dbo].[SEARCH_HISTORY] ([History_Id], [TC], [Journey_Id], [Search_Time], [Search_Date]) VALUES (40, N'12345678920', 5001, CAST(N'14:45:00' AS Time), CAST(N'2023-05-31' AS Date))
INSERT [dbo].[SEARCH_HISTORY] ([History_Id], [TC], [Journey_Id], [Search_Time], [Search_Date]) VALUES (41, N'12345678921', 6003, CAST(N'15:45:00' AS Time), CAST(N'2023-05-30' AS Date))
INSERT [dbo].[SEARCH_HISTORY] ([History_Id], [TC], [Journey_Id], [Search_Time], [Search_Date]) VALUES (42, N'12345678921', 7003, CAST(N'16:45:00' AS Time), CAST(N'2023-05-29' AS Date))
INSERT [dbo].[SEARCH_HISTORY] ([History_Id], [TC], [Journey_Id], [Search_Time], [Search_Date]) VALUES (43, N'12345678901', 1004, CAST(N'08:30:00' AS Time), CAST(N'2023-05-28' AS Date))
INSERT [dbo].[SEARCH_HISTORY] ([History_Id], [TC], [Journey_Id], [Search_Time], [Search_Date]) VALUES (44, N'12345678902', 2002, CAST(N'09:30:00' AS Time), CAST(N'2023-05-27' AS Date))
INSERT [dbo].[SEARCH_HISTORY] ([History_Id], [TC], [Journey_Id], [Search_Time], [Search_Date]) VALUES (45, N'12345678903', 3001, CAST(N'10:30:00' AS Time), CAST(N'2023-05-26' AS Date))
INSERT [dbo].[SEARCH_HISTORY] ([History_Id], [TC], [Journey_Id], [Search_Time], [Search_Date]) VALUES (46, N'12345678904', 4002, CAST(N'11:30:00' AS Time), CAST(N'2023-05-25' AS Date))
INSERT [dbo].[SEARCH_HISTORY] ([History_Id], [TC], [Journey_Id], [Search_Time], [Search_Date]) VALUES (47, N'12345678905', 5003, CAST(N'12:30:00' AS Time), CAST(N'2023-05-24' AS Date))
INSERT [dbo].[SEARCH_HISTORY] ([History_Id], [TC], [Journey_Id], [Search_Time], [Search_Date]) VALUES (48, N'12345678906', 6001, CAST(N'13:30:00' AS Time), CAST(N'2023-05-23' AS Date))
INSERT [dbo].[SEARCH_HISTORY] ([History_Id], [TC], [Journey_Id], [Search_Time], [Search_Date]) VALUES (49, N'12345678907', 7003, CAST(N'14:30:00' AS Time), CAST(N'2023-05-22' AS Date))
INSERT [dbo].[SEARCH_HISTORY] ([History_Id], [TC], [Journey_Id], [Search_Time], [Search_Date]) VALUES (50, N'12345678908', 1002, CAST(N'15:30:00' AS Time), CAST(N'2023-05-21' AS Date))
INSERT [dbo].[SEARCH_HISTORY] ([History_Id], [TC], [Journey_Id], [Search_Time], [Search_Date]) VALUES (51, N'12345678909', 2003, CAST(N'16:30:00' AS Time), CAST(N'2023-05-20' AS Date))
INSERT [dbo].[SEARCH_HISTORY] ([History_Id], [TC], [Journey_Id], [Search_Time], [Search_Date]) VALUES (52, N'12345678910', 3001, CAST(N'17:30:00' AS Time), CAST(N'2023-05-19' AS Date))
INSERT [dbo].[SEARCH_HISTORY] ([History_Id], [TC], [Journey_Id], [Search_Time], [Search_Date]) VALUES (53, N'12345678911', 4002, CAST(N'18:30:00' AS Time), CAST(N'2023-05-18' AS Date))
INSERT [dbo].[SEARCH_HISTORY] ([History_Id], [TC], [Journey_Id], [Search_Time], [Search_Date]) VALUES (54, N'12345678912', 5003, CAST(N'19:30:00' AS Time), CAST(N'2023-05-17' AS Date))
INSERT [dbo].[SEARCH_HISTORY] ([History_Id], [TC], [Journey_Id], [Search_Time], [Search_Date]) VALUES (55, N'12345678913', 6001, CAST(N'08:00:00' AS Time), CAST(N'2023-05-16' AS Date))
INSERT [dbo].[SEARCH_HISTORY] ([History_Id], [TC], [Journey_Id], [Search_Time], [Search_Date]) VALUES (56, N'12345678914', 7002, CAST(N'09:00:00' AS Time), CAST(N'2023-05-15' AS Date))
INSERT [dbo].[SEARCH_HISTORY] ([History_Id], [TC], [Journey_Id], [Search_Time], [Search_Date]) VALUES (57, N'12345678915', 1002, CAST(N'10:00:00' AS Time), CAST(N'2023-05-14' AS Date))
INSERT [dbo].[SEARCH_HISTORY] ([History_Id], [TC], [Journey_Id], [Search_Time], [Search_Date]) VALUES (58, N'12345678916', 2003, CAST(N'11:00:00' AS Time), CAST(N'2023-05-13' AS Date))
INSERT [dbo].[SEARCH_HISTORY] ([History_Id], [TC], [Journey_Id], [Search_Time], [Search_Date]) VALUES (59, N'12345678917', 3001, CAST(N'12:00:00' AS Time), CAST(N'2023-05-12' AS Date))
INSERT [dbo].[SEARCH_HISTORY] ([History_Id], [TC], [Journey_Id], [Search_Time], [Search_Date]) VALUES (60, N'12345678918', 4003, CAST(N'13:00:00' AS Time), CAST(N'2023-05-11' AS Date))
GO
INSERT [dbo].[TRANSACTIONS] ([Transaction_Id], [TC], [Journey_Id], [Seat_Number], [Total_Price], [Scheduled_Arr_Date], [Scheduled_Arr_Time], [Scheduled_Dep_Date], [Scheduled_Dep_Time], [Ticket_Category], [Departure_Place], [Receive_Place], [Departure_Place_X], [Departure_Place_Y], [Receive_Place_X], [Receive_Place_Y], [Pet], [Seat_Reservation], [Extra_Baggage_Charges], [Purchase_Date], [Purchase_Time]) VALUES (0, N'00000000000', 0, 0, CAST(0.00 AS Decimal(10, 2)), CAST(N'1999-01-01' AS Date), CAST(N'23:59:00' AS Time), CAST(N'1999-01-01' AS Date), CAST(N'23:59:00' AS Time), N'-----', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(0.00 AS Decimal(10, 2)), CAST(N'1999-01-01' AS Date), CAST(N'23:59:00' AS Time))
INSERT [dbo].[TRANSACTIONS] ([Transaction_Id], [TC], [Journey_Id], [Seat_Number], [Total_Price], [Scheduled_Arr_Date], [Scheduled_Arr_Time], [Scheduled_Dep_Date], [Scheduled_Dep_Time], [Ticket_Category], [Departure_Place], [Receive_Place], [Departure_Place_X], [Departure_Place_Y], [Receive_Place_X], [Receive_Place_Y], [Pet], [Seat_Reservation], [Extra_Baggage_Charges], [Purchase_Date], [Purchase_Time]) VALUES (1, N'12345678901', 1001, 12, CAST(200.00 AS Decimal(10, 2)), CAST(N'2023-07-15' AS Date), CAST(N'11:25:00' AS Time), CAST(N'2023-07-15' AS Date), CAST(N'08:00:00' AS Time), N'Ekonomi', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(0.00 AS Decimal(10, 2)), CAST(N'2023-07-10' AS Date), CAST(N'14:00:00' AS Time))
INSERT [dbo].[TRANSACTIONS] ([Transaction_Id], [TC], [Journey_Id], [Seat_Number], [Total_Price], [Scheduled_Arr_Date], [Scheduled_Arr_Time], [Scheduled_Dep_Date], [Scheduled_Dep_Time], [Ticket_Category], [Departure_Place], [Receive_Place], [Departure_Place_X], [Departure_Place_Y], [Receive_Place_X], [Receive_Place_Y], [Pet], [Seat_Reservation], [Extra_Baggage_Charges], [Purchase_Date], [Purchase_Time]) VALUES (2, N'12345678902', 2001, 3, CAST(150.00 AS Decimal(10, 2)), CAST(N'2023-07-15' AS Date), CAST(N'14:00:00' AS Time), CAST(N'2023-07-15' AS Date), CAST(N'08:00:00' AS Time), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, CAST(N'2023-07-11' AS Date), CAST(N'15:00:00' AS Time))
INSERT [dbo].[TRANSACTIONS] ([Transaction_Id], [TC], [Journey_Id], [Seat_Number], [Total_Price], [Scheduled_Arr_Date], [Scheduled_Arr_Time], [Scheduled_Dep_Date], [Scheduled_Dep_Time], [Ticket_Category], [Departure_Place], [Receive_Place], [Departure_Place_X], [Departure_Place_Y], [Receive_Place_X], [Receive_Place_Y], [Pet], [Seat_Reservation], [Extra_Baggage_Charges], [Purchase_Date], [Purchase_Time]) VALUES (3, N'12345678903', 3001, NULL, CAST(1000.00 AS Decimal(10, 2)), CAST(N'2023-07-17' AS Date), CAST(N'14:00:00' AS Time), CAST(N'2023-07-15' AS Date), CAST(N'09:00:00' AS Time), NULL, N'Seyhan Mah., Adana', N'Bornova Mah., İzmir', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-07-12' AS Date), CAST(N'16:00:00' AS Time))
INSERT [dbo].[TRANSACTIONS] ([Transaction_Id], [TC], [Journey_Id], [Seat_Number], [Total_Price], [Scheduled_Arr_Date], [Scheduled_Arr_Time], [Scheduled_Dep_Date], [Scheduled_Dep_Time], [Ticket_Category], [Departure_Place], [Receive_Place], [Departure_Place_X], [Departure_Place_Y], [Receive_Place_X], [Receive_Place_Y], [Pet], [Seat_Reservation], [Extra_Baggage_Charges], [Purchase_Date], [Purchase_Time]) VALUES (4, N'12345678904', 4001, 3, CAST(100.00 AS Decimal(10, 2)), CAST(N'2023-08-01' AS Date), CAST(N'12:00:00' AS Time), CAST(N'2023-08-01' AS Date), CAST(N'09:00:00' AS Time), N'Ekonomi', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, CAST(N'2023-07-10' AS Date), CAST(N'17:00:00' AS Time))
INSERT [dbo].[TRANSACTIONS] ([Transaction_Id], [TC], [Journey_Id], [Seat_Number], [Total_Price], [Scheduled_Arr_Date], [Scheduled_Arr_Time], [Scheduled_Dep_Date], [Scheduled_Dep_Time], [Ticket_Category], [Departure_Place], [Receive_Place], [Departure_Place_X], [Departure_Place_Y], [Receive_Place_X], [Receive_Place_Y], [Pet], [Seat_Reservation], [Extra_Baggage_Charges], [Purchase_Date], [Purchase_Time]) VALUES (5, N'12345678905', 5001, NULL, CAST(30.00 AS Decimal(10, 2)), CAST(N'2023-09-01' AS Date), CAST(N'09:20:00' AS Time), CAST(N'2023-09-01' AS Date), CAST(N'08:30:00' AS Time), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-09-01' AS Date), CAST(N'08:30:00' AS Time))
INSERT [dbo].[TRANSACTIONS] ([Transaction_Id], [TC], [Journey_Id], [Seat_Number], [Total_Price], [Scheduled_Arr_Date], [Scheduled_Arr_Time], [Scheduled_Dep_Date], [Scheduled_Dep_Time], [Ticket_Category], [Departure_Place], [Receive_Place], [Departure_Place_X], [Departure_Place_Y], [Receive_Place_X], [Receive_Place_Y], [Pet], [Seat_Reservation], [Extra_Baggage_Charges], [Purchase_Date], [Purchase_Time]) VALUES (6, N'12345678906', 6001, 3, CAST(250.00 AS Decimal(10, 2)), CAST(N'2023-10-01' AS Date), CAST(N'11:00:00' AS Time), CAST(N'2023-10-01' AS Date), CAST(N'08:30:00' AS Time), N'Ekonomi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(11.00 AS Decimal(10, 2)), CAST(N'2023-07-13' AS Date), CAST(N'10:00:00' AS Time))
INSERT [dbo].[TRANSACTIONS] ([Transaction_Id], [TC], [Journey_Id], [Seat_Number], [Total_Price], [Scheduled_Arr_Date], [Scheduled_Arr_Time], [Scheduled_Dep_Date], [Scheduled_Dep_Time], [Ticket_Category], [Departure_Place], [Receive_Place], [Departure_Place_X], [Departure_Place_Y], [Receive_Place_X], [Receive_Place_Y], [Pet], [Seat_Reservation], [Extra_Baggage_Charges], [Purchase_Date], [Purchase_Time]) VALUES (7, N'12345678907', 7001, NULL, CAST(20.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(41.008238 AS Decimal(9, 6)), CAST(28.978359 AS Decimal(9, 6)), CAST(38.419200 AS Decimal(9, 6)), CAST(27.128720 AS Decimal(9, 6)), NULL, NULL, NULL, CAST(N'2023-07-14' AS Date), CAST(N'11:00:00' AS Time))
INSERT [dbo].[TRANSACTIONS] ([Transaction_Id], [TC], [Journey_Id], [Seat_Number], [Total_Price], [Scheduled_Arr_Date], [Scheduled_Arr_Time], [Scheduled_Dep_Date], [Scheduled_Dep_Time], [Ticket_Category], [Departure_Place], [Receive_Place], [Departure_Place_X], [Departure_Place_Y], [Receive_Place_X], [Receive_Place_Y], [Pet], [Seat_Reservation], [Extra_Baggage_Charges], [Purchase_Date], [Purchase_Time]) VALUES (8, N'12345678908', 1003, 15, CAST(220.00 AS Decimal(10, 2)), CAST(N'2023-07-16' AS Date), CAST(N'14:45:00' AS Time), CAST(N'2023-07-16' AS Date), CAST(N'13:30:00' AS Time), N'Business', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(0.00 AS Decimal(10, 2)), CAST(N'2023-07-11' AS Date), CAST(N'12:00:00' AS Time))
INSERT [dbo].[TRANSACTIONS] ([Transaction_Id], [TC], [Journey_Id], [Seat_Number], [Total_Price], [Scheduled_Arr_Date], [Scheduled_Arr_Time], [Scheduled_Dep_Date], [Scheduled_Dep_Time], [Ticket_Category], [Departure_Place], [Receive_Place], [Departure_Place_X], [Departure_Place_Y], [Receive_Place_X], [Receive_Place_Y], [Pet], [Seat_Reservation], [Extra_Baggage_Charges], [Purchase_Date], [Purchase_Time]) VALUES (9, N'12345678909', 2002, 5, CAST(160.00 AS Decimal(10, 2)), CAST(N'2023-07-16' AS Date), CAST(N'17:00:00' AS Time), CAST(N'2023-07-16' AS Date), CAST(N'09:00:00' AS Time), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, CAST(N'2023-07-12' AS Date), CAST(N'13:00:00' AS Time))
INSERT [dbo].[TRANSACTIONS] ([Transaction_Id], [TC], [Journey_Id], [Seat_Number], [Total_Price], [Scheduled_Arr_Date], [Scheduled_Arr_Time], [Scheduled_Dep_Date], [Scheduled_Dep_Time], [Ticket_Category], [Departure_Place], [Receive_Place], [Departure_Place_X], [Departure_Place_Y], [Receive_Place_X], [Receive_Place_Y], [Pet], [Seat_Reservation], [Extra_Baggage_Charges], [Purchase_Date], [Purchase_Time]) VALUES (10, N'12345678910', 3002, NULL, CAST(1450.00 AS Decimal(10, 2)), CAST(N'2023-07-18' AS Date), CAST(N'17:00:00' AS Time), CAST(N'2023-07-16' AS Date), CAST(N'10:00:00' AS Time), NULL, N'Konyaaltı Mah., Antalya', N'Konyaaltı Mah., Antalya', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-07-13' AS Date), CAST(N'14:00:00' AS Time))
INSERT [dbo].[TRANSACTIONS] ([Transaction_Id], [TC], [Journey_Id], [Seat_Number], [Total_Price], [Scheduled_Arr_Date], [Scheduled_Arr_Time], [Scheduled_Dep_Date], [Scheduled_Dep_Time], [Ticket_Category], [Departure_Place], [Receive_Place], [Departure_Place_X], [Departure_Place_Y], [Receive_Place_X], [Receive_Place_Y], [Pet], [Seat_Reservation], [Extra_Baggage_Charges], [Purchase_Date], [Purchase_Time]) VALUES (11, N'12345678911', 4002, 5, CAST(120.00 AS Decimal(10, 2)), CAST(N'2023-08-02' AS Date), CAST(N'11:30:00' AS Time), CAST(N'2023-08-02' AS Date), CAST(N'10:00:00' AS Time), N'Business', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, CAST(N'2023-07-11' AS Date), CAST(N'16:00:00' AS Time))
INSERT [dbo].[TRANSACTIONS] ([Transaction_Id], [TC], [Journey_Id], [Seat_Number], [Total_Price], [Scheduled_Arr_Date], [Scheduled_Arr_Time], [Scheduled_Dep_Date], [Scheduled_Dep_Time], [Ticket_Category], [Departure_Place], [Receive_Place], [Departure_Place_X], [Departure_Place_Y], [Receive_Place_X], [Receive_Place_Y], [Pet], [Seat_Reservation], [Extra_Baggage_Charges], [Purchase_Date], [Purchase_Time]) VALUES (12, N'12345678912', 5002, NULL, CAST(35.00 AS Decimal(10, 2)), CAST(N'2023-09-02' AS Date), CAST(N'10:30:00' AS Time), CAST(N'2023-09-02' AS Date), CAST(N'10:00:00' AS Time), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-09-02' AS Date), CAST(N'10:00:00' AS Time))
INSERT [dbo].[TRANSACTIONS] ([Transaction_Id], [TC], [Journey_Id], [Seat_Number], [Total_Price], [Scheduled_Arr_Date], [Scheduled_Arr_Time], [Scheduled_Dep_Date], [Scheduled_Dep_Time], [Ticket_Category], [Departure_Place], [Receive_Place], [Departure_Place_X], [Departure_Place_Y], [Receive_Place_X], [Receive_Place_Y], [Pet], [Seat_Reservation], [Extra_Baggage_Charges], [Purchase_Date], [Purchase_Time]) VALUES (13, N'12345678913', 6002, 5, CAST(270.00 AS Decimal(10, 2)), CAST(N'2023-10-02' AS Date), CAST(N'14:00:00' AS Time), CAST(N'2023-10-02' AS Date), CAST(N'11:00:00' AS Time), N'Ekonomi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(3.65 AS Decimal(10, 2)), CAST(N'2023-07-14' AS Date), CAST(N'10:00:00' AS Time))
INSERT [dbo].[TRANSACTIONS] ([Transaction_Id], [TC], [Journey_Id], [Seat_Number], [Total_Price], [Scheduled_Arr_Date], [Scheduled_Arr_Time], [Scheduled_Dep_Date], [Scheduled_Dep_Time], [Ticket_Category], [Departure_Place], [Receive_Place], [Departure_Place_X], [Departure_Place_Y], [Receive_Place_X], [Receive_Place_Y], [Pet], [Seat_Reservation], [Extra_Baggage_Charges], [Purchase_Date], [Purchase_Time]) VALUES (14, N'12345678914', 7002, NULL, CAST(25.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(39.920770 AS Decimal(9, 6)), CAST(32.854110 AS Decimal(9, 6)), CAST(39.933365 AS Decimal(9, 6)), CAST(32.859742 AS Decimal(9, 6)), NULL, NULL, NULL, CAST(N'2023-07-15' AS Date), CAST(N'12:00:00' AS Time))
INSERT [dbo].[TRANSACTIONS] ([Transaction_Id], [TC], [Journey_Id], [Seat_Number], [Total_Price], [Scheduled_Arr_Date], [Scheduled_Arr_Time], [Scheduled_Dep_Date], [Scheduled_Dep_Time], [Ticket_Category], [Departure_Place], [Receive_Place], [Departure_Place_X], [Departure_Place_Y], [Receive_Place_X], [Receive_Place_Y], [Pet], [Seat_Reservation], [Extra_Baggage_Charges], [Purchase_Date], [Purchase_Time]) VALUES (15, N'12345678915', 1004, 22, CAST(230.00 AS Decimal(10, 2)), CAST(N'2023-07-17' AS Date), CAST(N'17:50:00' AS Time), CAST(N'2023-07-17' AS Date), CAST(N'16:00:00' AS Time), N'Ekonomi', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(0.00 AS Decimal(10, 2)), CAST(N'2023-07-12' AS Date), CAST(N'13:00:00' AS Time))
INSERT [dbo].[TRANSACTIONS] ([Transaction_Id], [TC], [Journey_Id], [Seat_Number], [Total_Price], [Scheduled_Arr_Date], [Scheduled_Arr_Time], [Scheduled_Dep_Date], [Scheduled_Dep_Time], [Ticket_Category], [Departure_Place], [Receive_Place], [Departure_Place_X], [Departure_Place_Y], [Receive_Place_X], [Receive_Place_Y], [Pet], [Seat_Reservation], [Extra_Baggage_Charges], [Purchase_Date], [Purchase_Time]) VALUES (16, N'12345678916', 2003, 7, CAST(170.00 AS Decimal(10, 2)), CAST(N'2023-07-17' AS Date), CAST(N'13:30:00' AS Time), CAST(N'2023-07-17' AS Date), CAST(N'07:30:00' AS Time), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, CAST(N'2023-07-13' AS Date), CAST(N'15:00:00' AS Time))
INSERT [dbo].[TRANSACTIONS] ([Transaction_Id], [TC], [Journey_Id], [Seat_Number], [Total_Price], [Scheduled_Arr_Date], [Scheduled_Arr_Time], [Scheduled_Dep_Date], [Scheduled_Dep_Time], [Ticket_Category], [Departure_Place], [Receive_Place], [Departure_Place_X], [Departure_Place_Y], [Receive_Place_X], [Receive_Place_Y], [Pet], [Seat_Reservation], [Extra_Baggage_Charges], [Purchase_Date], [Purchase_Time]) VALUES (17, N'12345678917', 3003, NULL, CAST(1400.00 AS Decimal(10, 2)), CAST(N'2023-07-19' AS Date), CAST(N'13:30:00' AS Time), CAST(N'2023-07-17' AS Date), CAST(N'11:00:00' AS Time), NULL, N'Bağlar Mah., Diyarbakır', N'Çukurova Mah., Adana', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-07-14' AS Date), CAST(N'16:00:00' AS Time))
INSERT [dbo].[TRANSACTIONS] ([Transaction_Id], [TC], [Journey_Id], [Seat_Number], [Total_Price], [Scheduled_Arr_Date], [Scheduled_Arr_Time], [Scheduled_Dep_Date], [Scheduled_Dep_Time], [Ticket_Category], [Departure_Place], [Receive_Place], [Departure_Place_X], [Departure_Place_Y], [Receive_Place_X], [Receive_Place_Y], [Pet], [Seat_Reservation], [Extra_Baggage_Charges], [Purchase_Date], [Purchase_Time]) VALUES (18, N'12345678918', 4003, 7, CAST(110.00 AS Decimal(10, 2)), CAST(N'2023-08-03' AS Date), CAST(N'11:00:00' AS Time), CAST(N'2023-08-03' AS Date), CAST(N'08:00:00' AS Time), N'Ekonomi', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, CAST(N'2023-07-12' AS Date), CAST(N'17:00:00' AS Time))
INSERT [dbo].[TRANSACTIONS] ([Transaction_Id], [TC], [Journey_Id], [Seat_Number], [Total_Price], [Scheduled_Arr_Date], [Scheduled_Arr_Time], [Scheduled_Dep_Date], [Scheduled_Dep_Time], [Ticket_Category], [Departure_Place], [Receive_Place], [Departure_Place_X], [Departure_Place_Y], [Receive_Place_X], [Receive_Place_Y], [Pet], [Seat_Reservation], [Extra_Baggage_Charges], [Purchase_Date], [Purchase_Time]) VALUES (19, N'12345678919', 5003, NULL, CAST(40.00 AS Decimal(10, 2)), CAST(N'2023-09-03' AS Date), CAST(N'12:20:00' AS Time), CAST(N'2023-09-03' AS Date), CAST(N'11:30:00' AS Time), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-09-03' AS Date), CAST(N'11:30:00' AS Time))
INSERT [dbo].[TRANSACTIONS] ([Transaction_Id], [TC], [Journey_Id], [Seat_Number], [Total_Price], [Scheduled_Arr_Date], [Scheduled_Arr_Time], [Scheduled_Dep_Date], [Scheduled_Dep_Time], [Ticket_Category], [Departure_Place], [Receive_Place], [Departure_Place_X], [Departure_Place_Y], [Receive_Place_X], [Receive_Place_Y], [Pet], [Seat_Reservation], [Extra_Baggage_Charges], [Purchase_Date], [Purchase_Time]) VALUES (20, N'12345678920', 6003, 7, CAST(280.00 AS Decimal(10, 2)), CAST(N'2023-10-03' AS Date), CAST(N'12:00:00' AS Time), CAST(N'2023-10-03' AS Date), CAST(N'09:00:00' AS Time), N'Business', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), CAST(N'2023-07-15' AS Date), CAST(N'11:00:00' AS Time))
INSERT [dbo].[TRANSACTIONS] ([Transaction_Id], [TC], [Journey_Id], [Seat_Number], [Total_Price], [Scheduled_Arr_Date], [Scheduled_Arr_Time], [Scheduled_Dep_Date], [Scheduled_Dep_Time], [Ticket_Category], [Departure_Place], [Receive_Place], [Departure_Place_X], [Departure_Place_Y], [Receive_Place_X], [Receive_Place_Y], [Pet], [Seat_Reservation], [Extra_Baggage_Charges], [Purchase_Date], [Purchase_Time]) VALUES (21, N'12345678921', 7003, NULL, CAST(30.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(38.418850 AS Decimal(9, 6)), CAST(27.128720 AS Decimal(9, 6)), CAST(41.008238 AS Decimal(9, 6)), CAST(28.978359 AS Decimal(9, 6)), NULL, NULL, NULL, CAST(N'2023-07-16' AS Date), CAST(N'13:00:00' AS Time))
GO
INSERT [dbo].[VEHICLE] ([Vehicle_ID], [Model], [Fuel_Type], [Deposite_Fees], [Car_Brand], [Car_Class], [Locations]) VALUES (1, N'Civic', N'Benzin', CAST(500.00 AS Decimal(10, 2)), N'Honda', N'Sedan', N'Bornova Mah., İzmir')
INSERT [dbo].[VEHICLE] ([Vehicle_ID], [Model], [Fuel_Type], [Deposite_Fees], [Car_Brand], [Car_Class], [Locations]) VALUES (2, N'Corolla', N'Dizel', CAST(600.00 AS Decimal(10, 2)), N'Toyota', N'Sedan', N'Konyaaltı Mah., Antalya')
INSERT [dbo].[VEHICLE] ([Vehicle_ID], [Model], [Fuel_Type], [Deposite_Fees], [Car_Brand], [Car_Class], [Locations]) VALUES (3, N'Model S', N'Elektrik', CAST(1000.00 AS Decimal(10, 2)), N'Tesla', N'Sedan', N'Çukurova Mah., Adana')
GO
INSERT [dbo].[VEHICLE_JOURNEY] ([Journey_Id], [Vehicle_Id]) VALUES (3001, 1)
INSERT [dbo].[VEHICLE_JOURNEY] ([Journey_Id], [Vehicle_Id]) VALUES (3002, 2)
INSERT [dbo].[VEHICLE_JOURNEY] ([Journey_Id], [Vehicle_Id]) VALUES (3003, 3)
GO
ALTER TABLE [dbo].[JOURNEY] ADD  DEFAULT ('NO NAME') FOR [Company_Name]
GO
ALTER TABLE [dbo].[LOCATIONS] ADD  DEFAULT ('NO NAME') FOR [Company_Name]
GO
ALTER TABLE [dbo].[PERSON] ADD  DEFAULT ((0)) FOR [Card_ID]
GO
ALTER TABLE [dbo].[SEARCH_HISTORY] ADD  DEFAULT ('00000000000') FOR [TC]
GO
ALTER TABLE [dbo].[SEARCH_HISTORY] ADD  DEFAULT ((0)) FOR [Journey_Id]
GO
ALTER TABLE [dbo].[TRANSACTION_HISTORY] ADD  DEFAULT ('00000000000') FOR [TC]
GO
ALTER TABLE [dbo].[TRANSACTION_HISTORY] ADD  DEFAULT ((0)) FOR [Transaction_Id]
GO
ALTER TABLE [dbo].[TRANSACTION_HISTORY] ADD  DEFAULT ((0)) FOR [Journey_Id]
GO
ALTER TABLE [dbo].[TRANSACTIONS] ADD  DEFAULT ('00000000000') FOR [TC]
GO
ALTER TABLE [dbo].[TRANSACTIONS] ADD  DEFAULT ((0)) FOR [Journey_Id]
GO
ALTER TABLE [dbo].[BUS_JOURNEY]  WITH CHECK ADD FOREIGN KEY([Arrival_Bus_Station])
REFERENCES [dbo].[BUS_STATION] ([Station_Name])
GO
ALTER TABLE [dbo].[BUS_JOURNEY]  WITH CHECK ADD FOREIGN KEY([Bus_Id])
REFERENCES [dbo].[BUS] ([Bus_ID])
GO
ALTER TABLE [dbo].[BUS_JOURNEY]  WITH CHECK ADD FOREIGN KEY([Departure_Station])
REFERENCES [dbo].[BUS_STATION] ([Station_Name])
GO
ALTER TABLE [dbo].[BUS_JOURNEY]  WITH CHECK ADD FOREIGN KEY([Journey_Id])
REFERENCES [dbo].[JOURNEY] ([Journey_Id])
GO
ALTER TABLE [dbo].[BUS_STOPS]  WITH CHECK ADD FOREIGN KEY([Bus_Journey_Id])
REFERENCES [dbo].[BUS_JOURNEY] ([Journey_Id])
GO
ALTER TABLE [dbo].[BUS_STOPS]  WITH CHECK ADD FOREIGN KEY([Station_Name])
REFERENCES [dbo].[BUS_STATION] ([Station_Name])
GO
ALTER TABLE [dbo].[FERRY_JOURNEY]  WITH CHECK ADD FOREIGN KEY([Arrival_Port])
REFERENCES [dbo].[HARBOR] ([Port_Name])
GO
ALTER TABLE [dbo].[FERRY_JOURNEY]  WITH CHECK ADD FOREIGN KEY([Departure_Port])
REFERENCES [dbo].[HARBOR] ([Port_Name])
GO
ALTER TABLE [dbo].[FERRY_JOURNEY]  WITH CHECK ADD FOREIGN KEY([Ferry_ID])
REFERENCES [dbo].[FERRY] ([Ferry_Id])
GO
ALTER TABLE [dbo].[FERRY_JOURNEY]  WITH CHECK ADD FOREIGN KEY([Journey_ID])
REFERENCES [dbo].[JOURNEY] ([Journey_Id])
GO
ALTER TABLE [dbo].[FERRY_STOPS]  WITH CHECK ADD FOREIGN KEY([Ferry_Journey_ID])
REFERENCES [dbo].[FERRY_JOURNEY] ([Journey_ID])
GO
ALTER TABLE [dbo].[FERRY_STOPS]  WITH CHECK ADD FOREIGN KEY([Port_Name])
REFERENCES [dbo].[HARBOR] ([Port_Name])
GO
ALTER TABLE [dbo].[HIGH_SPEED_TRAIN_JOURNEY]  WITH CHECK ADD FOREIGN KEY([Arrival_Station])
REFERENCES [dbo].[HIGH_SPEED_TRAIN_STATION] ([Station_Name])
GO
ALTER TABLE [dbo].[HIGH_SPEED_TRAIN_JOURNEY]  WITH CHECK ADD FOREIGN KEY([Departure_Station])
REFERENCES [dbo].[HIGH_SPEED_TRAIN_STATION] ([Station_Name])
GO
ALTER TABLE [dbo].[HIGH_SPEED_TRAIN_JOURNEY]  WITH CHECK ADD FOREIGN KEY([Journey_ID])
REFERENCES [dbo].[JOURNEY] ([Journey_Id])
GO
ALTER TABLE [dbo].[HIGH_SPEED_TRAIN_JOURNEY]  WITH CHECK ADD FOREIGN KEY([Train_Number])
REFERENCES [dbo].[HIGH_SPEED_TRAIN] ([Train_Number])
GO
ALTER TABLE [dbo].[HIGH_SPEED_TRAIN_STOPS]  WITH CHECK ADD FOREIGN KEY([HIGH_SPEED_TRAIN_Journey_ID])
REFERENCES [dbo].[HIGH_SPEED_TRAIN_JOURNEY] ([Journey_ID])
GO
ALTER TABLE [dbo].[HIGH_SPEED_TRAIN_STOPS]  WITH CHECK ADD FOREIGN KEY([Station_Name])
REFERENCES [dbo].[HIGH_SPEED_TRAIN_STATION] ([Station_Name])
GO
ALTER TABLE [dbo].[JOURNEY]  WITH CHECK ADD FOREIGN KEY([Company_Name])
REFERENCES [dbo].[COMPANY] ([Company_Name])
ON UPDATE CASCADE
ON DELETE SET DEFAULT
GO
ALTER TABLE [dbo].[LOCATIONS]  WITH CHECK ADD FOREIGN KEY([Company_Name])
REFERENCES [dbo].[COMPANY] ([Company_Name])
ON UPDATE CASCADE
ON DELETE SET DEFAULT
GO
ALTER TABLE [dbo].[MARTI_JOURNEY]  WITH CHECK ADD FOREIGN KEY([Journey_ID])
REFERENCES [dbo].[JOURNEY] ([Journey_Id])
GO
ALTER TABLE [dbo].[MARTI_JOURNEY]  WITH CHECK ADD FOREIGN KEY([Marti_ID])
REFERENCES [dbo].[MARTI] ([Marti_ID])
GO
ALTER TABLE [dbo].[METRO_JOURNEY]  WITH CHECK ADD FOREIGN KEY([Arrival_Station])
REFERENCES [dbo].[METRO_STATION] ([Station_Name])
GO
ALTER TABLE [dbo].[METRO_JOURNEY]  WITH CHECK ADD FOREIGN KEY([Departure_Station])
REFERENCES [dbo].[METRO_STATION] ([Station_Name])
GO
ALTER TABLE [dbo].[METRO_JOURNEY]  WITH CHECK ADD FOREIGN KEY([Journey_ID])
REFERENCES [dbo].[JOURNEY] ([Journey_Id])
GO
ALTER TABLE [dbo].[METRO_JOURNEY]  WITH CHECK ADD FOREIGN KEY([Train_Number])
REFERENCES [dbo].[METRO_TRAIN] ([Train_Number])
GO
ALTER TABLE [dbo].[METRO_STOPS]  WITH CHECK ADD FOREIGN KEY([Metro_Journey_ID])
REFERENCES [dbo].[METRO_JOURNEY] ([Journey_ID])
GO
ALTER TABLE [dbo].[METRO_STOPS]  WITH CHECK ADD FOREIGN KEY([Station_Name])
REFERENCES [dbo].[METRO_STATION] ([Station_Name])
GO
ALTER TABLE [dbo].[PERSON]  WITH CHECK ADD FOREIGN KEY([Card_ID])
REFERENCES [dbo].[CITIZEN_CARD] ([Card_ID])
ON UPDATE CASCADE
ON DELETE SET DEFAULT
GO
ALTER TABLE [dbo].[PLANE_JOURNEY]  WITH CHECK ADD FOREIGN KEY([Aircraft_Type])
REFERENCES [dbo].[AIRPLANE] ([Aircraft_Type])
GO
ALTER TABLE [dbo].[PLANE_JOURNEY]  WITH CHECK ADD FOREIGN KEY([Arrival_Airport_Name])
REFERENCES [dbo].[AIRPORT] ([Airport_Name])
GO
ALTER TABLE [dbo].[PLANE_JOURNEY]  WITH CHECK ADD FOREIGN KEY([Departure_Airport_Name])
REFERENCES [dbo].[AIRPORT] ([Airport_Name])
GO
ALTER TABLE [dbo].[PLANE_JOURNEY]  WITH CHECK ADD FOREIGN KEY([Journey_Id])
REFERENCES [dbo].[JOURNEY] ([Journey_Id])
GO
ALTER TABLE [dbo].[PLANE_JOURNEY]  WITH CHECK ADD FOREIGN KEY([Next_Journey_ID])
REFERENCES [dbo].[PLANE_JOURNEY] ([Journey_Id])
GO
ALTER TABLE [dbo].[SEARCH_HISTORY]  WITH CHECK ADD FOREIGN KEY([Journey_Id])
REFERENCES [dbo].[JOURNEY] ([Journey_Id])
ON UPDATE CASCADE
ON DELETE SET DEFAULT
GO
ALTER TABLE [dbo].[SEARCH_HISTORY]  WITH CHECK ADD FOREIGN KEY([TC])
REFERENCES [dbo].[PERSON] ([TC])
ON UPDATE CASCADE
ON DELETE SET DEFAULT
GO
ALTER TABLE [dbo].[TRANSACTION_HISTORY]  WITH CHECK ADD FOREIGN KEY([Transaction_Id], [TC], [Journey_Id])
REFERENCES [dbo].[TRANSACTIONS] ([Transaction_Id], [TC], [Journey_Id])
ON UPDATE CASCADE
ON DELETE SET DEFAULT
GO
ALTER TABLE [dbo].[TRANSACTIONS]  WITH CHECK ADD FOREIGN KEY([Journey_Id])
REFERENCES [dbo].[JOURNEY] ([Journey_Id])
ON UPDATE CASCADE
ON DELETE SET DEFAULT
GO
ALTER TABLE [dbo].[TRANSACTIONS]  WITH CHECK ADD FOREIGN KEY([TC])
REFERENCES [dbo].[PERSON] ([TC])
ON UPDATE CASCADE
ON DELETE SET DEFAULT
GO
ALTER TABLE [dbo].[VEHICLE_JOURNEY]  WITH CHECK ADD FOREIGN KEY([Journey_Id])
REFERENCES [dbo].[JOURNEY] ([Journey_Id])
GO
ALTER TABLE [dbo].[VEHICLE_JOURNEY]  WITH CHECK ADD FOREIGN KEY([Vehicle_Id])
REFERENCES [dbo].[VEHICLE] ([Vehicle_ID])
GO
ALTER TABLE [dbo].[BUS_JOURNEY]  WITH CHECK ADD CHECK  (([Journey_Id]>=(2000) AND [Journey_Id]<(3000)))
GO
ALTER TABLE [dbo].[CITIZEN_CARD]  WITH CHECK ADD CHECK  (([Money_Amount]>=(0)))
GO
ALTER TABLE [dbo].[FERRY_JOURNEY]  WITH CHECK ADD CHECK  (([Journey_Id]>=(4000) AND [Journey_Id]<(5000)))
GO
ALTER TABLE [dbo].[HIGH_SPEED_TRAIN_JOURNEY]  WITH CHECK ADD CHECK  (([Journey_Id]>=(6000) AND [Journey_Id]<(7000)))
GO
ALTER TABLE [dbo].[MARTI]  WITH CHECK ADD CHECK  (([Battery]>=(0) AND [Battery]<=(100)))
GO
ALTER TABLE [dbo].[MARTI_JOURNEY]  WITH CHECK ADD CHECK  (([Journey_Id]>=(7000) AND [Journey_Id]<(8000)))
GO
ALTER TABLE [dbo].[METRO_JOURNEY]  WITH CHECK ADD CHECK  (([Journey_Id]>=(5000) AND [Journey_Id]<(6000)))
GO
ALTER TABLE [dbo].[PLANE_JOURNEY]  WITH CHECK ADD CHECK  (([Journey_Id]>=(1000) AND [Journey_Id]<(2000)))
GO
ALTER TABLE [dbo].[VEHICLE_JOURNEY]  WITH CHECK ADD CHECK  (([Journey_Id]>=(3000) AND [Journey_Id]<(4000)))
GO
USE [master]
GO
ALTER DATABASE [Data_Setleri] SET  READ_WRITE 
GO
