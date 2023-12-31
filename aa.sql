USE [master]
GO
/****** Object:  Database [BookingHotel]    Script Date: 6/27/2023 9:40:10 AM ******/
CREATE DATABASE [BookingHotel]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BookingHotel', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\BookingHotel.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BookingHotel_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\BookingHotel_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BookingHotel] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BookingHotel].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BookingHotel] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BookingHotel] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BookingHotel] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BookingHotel] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BookingHotel] SET ARITHABORT OFF 
GO
ALTER DATABASE [BookingHotel] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BookingHotel] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BookingHotel] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BookingHotel] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BookingHotel] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BookingHotel] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BookingHotel] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BookingHotel] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BookingHotel] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BookingHotel] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BookingHotel] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BookingHotel] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BookingHotel] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BookingHotel] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BookingHotel] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BookingHotel] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BookingHotel] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BookingHotel] SET RECOVERY FULL 
GO
ALTER DATABASE [BookingHotel] SET  MULTI_USER 
GO
ALTER DATABASE [BookingHotel] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BookingHotel] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BookingHotel] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BookingHotel] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BookingHotel] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BookingHotel] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [BookingHotel] SET QUERY_STORE = OFF
GO
USE [BookingHotel]
GO
/****** Object:  Table [dbo].[tblAccount]    Script Date: 6/27/2023 9:40:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAccount](
	[userId] [varchar](50) NOT NULL,
	[Password] [varchar](100) NULL,
	[RoleId] [int] NULL,
	[Status] [nvarchar](20) NULL,
 CONSTRAINT [PK__tblAccou__CB9A1CFF9A95CA60] PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblDiscount]    Script Date: 6/27/2023 9:40:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDiscount](
	[discountCode] [varchar](50) NOT NULL,
	[discountValue] [int] NULL,
	[existDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[discountCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblFeedBack]    Script Date: 6/27/2023 9:40:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblFeedBack](
	[roomNo] [int] NULL,
	[userId] [varchar](50) NULL,
	[value] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblHotel]    Script Date: 6/27/2023 9:40:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblHotel](
	[hotelId] [int] IDENTITY(0,1) NOT NULL,
	[hotelName] [nvarchar](50) NULL,
	[hotelAddress] [nvarchar](200) NULL,
	[Status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[hotelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrder]    Script Date: 6/27/2023 9:40:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrder](
	[orderId] [varchar](50) NOT NULL,
	[userId] [varchar](50) NULL,
	[orderDate] [date] NULL,
	[total] [float] NULL,
	[status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[orderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrderDetails]    Script Date: 6/27/2023 9:40:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrderDetails](
	[orderId] [varchar](50) NULL,
	[roomNo] [int] NULL,
	[hotelId] [int] NULL,
	[orderQuantity] [int] NULL,
	[night] [int] NULL,
	[checkIn] [nvarchar](50) NULL,
	[checkOut] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrderService]    Script Date: 6/27/2023 9:40:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrderService](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[orderId] [varchar](50) NULL,
	[serviceId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRole]    Script Date: 6/27/2023 9:40:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRole](
	[RoleId] [int] NOT NULL,
	[RoleName] [varchar](50) NULL,
 CONSTRAINT [PK__tblRole__8AFACE1A279BF2DB] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRoom]    Script Date: 6/27/2023 9:40:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRoom](
	[hotelId] [int] NULL,
	[roomNo] [int] IDENTITY(0,1) NOT NULL,
	[roomName] [varchar](50) NULL,
	[availableDate] [date] NULL,
	[quantity] [int] NULL,
	[typeId] [varchar](10) NULL,
	[roomPrice] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[roomNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblService]    Script Date: 6/27/2023 9:40:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblService](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
	[price] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblTypeRoom]    Script Date: 6/27/2023 9:40:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTypeRoom](
	[typeId] [varchar](10) NOT NULL,
	[typeName] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[typeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUser]    Script Date: 6/27/2023 9:40:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUser](
	[userId] [varchar](50) NULL,
	[Name] [nvarchar](50) NULL,
	[Email] [nvarchar](200) NULL,
	[PhoneNumber] [varchar](12) NULL
) ON [PRIMARY]
GO
INSERT [dbo].[tblAccount] ([userId], [Password], [RoleId], [Status]) VALUES (N'admin', N'8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 1, N'Active')
INSERT [dbo].[tblAccount] ([userId], [Password], [RoleId], [Status]) VALUES (N'Anh Tuan', N'Ha Tinh', 1, N'1')
INSERT [dbo].[tblAccount] ([userId], [Password], [RoleId], [Status]) VALUES (N'anhtuan', N'3bb5c5d087497ef38f6ff09afc8594a7ee104496da277aec7eacf59c1f79dee1', 2, N'Active')
INSERT [dbo].[tblAccount] ([userId], [Password], [RoleId], [Status]) VALUES (N'ngoctuan', N'3aa03ae2033a9672f1c29a06dbe91fab8fe62b604914e1ea2329809c690b206e', 2, N'Active')
INSERT [dbo].[tblAccount] ([userId], [Password], [RoleId], [Status]) VALUES (N'user', N'04f8996da763b7a969b1028ee3007569eaf3a635486ddab211d512c85b9df8fb', 2, N'Active')
INSERT [dbo].[tblAccount] ([userId], [Password], [RoleId], [Status]) VALUES (N'user1', N'1234', 2, N'Active')
GO
INSERT [dbo].[tblFeedBack] ([roomNo], [userId], [value]) VALUES (0, N'user', 4)
INSERT [dbo].[tblFeedBack] ([roomNo], [userId], [value]) VALUES (0, N'anhtuan', 3)
GO
SET IDENTITY_INSERT [dbo].[tblHotel] ON 

INSERT [dbo].[tblHotel] ([hotelId], [hotelName], [hotelAddress], [Status]) VALUES (0, N'Sona', N'Da Nang', 1)
INSERT [dbo].[tblHotel] ([hotelId], [hotelName], [hotelAddress], [Status]) VALUES (1, N'Anh Tuan', N'Ha Tinh', 1)
SET IDENTITY_INSERT [dbo].[tblHotel] OFF
GO
INSERT [dbo].[tblOrder] ([orderId], [userId], [orderDate], [total], [status]) VALUES (N'9AIbibLglH', N'anhtuan', CAST(N'2023-06-27' AS Date), 700300, 1)
INSERT [dbo].[tblOrder] ([orderId], [userId], [orderDate], [total], [status]) VALUES (N'Ku82SOFRcu', N'anhtuan', CAST(N'2023-06-27' AS Date), 800900, 1)
INSERT [dbo].[tblOrder] ([orderId], [userId], [orderDate], [total], [status]) VALUES (N'mKomH0fu04', N'anhtuan', CAST(N'2023-06-27' AS Date), 600, 1)
GO
INSERT [dbo].[tblOrderDetails] ([orderId], [roomNo], [hotelId], [orderQuantity], [night], [checkIn], [checkOut]) VALUES (N'Ku82SOFRcu', 0, 0, 3, 1, N'2023-06-28', N'2023-06-29')
INSERT [dbo].[tblOrderDetails] ([orderId], [roomNo], [hotelId], [orderQuantity], [night], [checkIn], [checkOut]) VALUES (N'mKomH0fu04', 0, 0, 2, 1, N'2023-06-28', N'2023-06-29')
INSERT [dbo].[tblOrderDetails] ([orderId], [roomNo], [hotelId], [orderQuantity], [night], [checkIn], [checkOut]) VALUES (N'9AIbibLglH', 0, 0, 1, 1, N'2023-06-30', N'2023-07-01')
GO
SET IDENTITY_INSERT [dbo].[tblOrderService] ON 

INSERT [dbo].[tblOrderService] ([id], [orderId], [serviceId]) VALUES (1, N'Ku82SOFRcu', 2)
INSERT [dbo].[tblOrderService] ([id], [orderId], [serviceId]) VALUES (2, N'Ku82SOFRcu', 3)
INSERT [dbo].[tblOrderService] ([id], [orderId], [serviceId]) VALUES (3, N'Ku82SOFRcu', 4)
INSERT [dbo].[tblOrderService] ([id], [orderId], [serviceId]) VALUES (5, N'mKomH0fu04', 1)
INSERT [dbo].[tblOrderService] ([id], [orderId], [serviceId]) VALUES (6, N'mKomH0fu04', 2)
SET IDENTITY_INSERT [dbo].[tblOrderService] OFF
GO
INSERT [dbo].[tblRole] ([RoleId], [RoleName]) VALUES (1, N'admin')
INSERT [dbo].[tblRole] ([RoleId], [RoleName]) VALUES (2, N'customer')
GO
SET IDENTITY_INSERT [dbo].[tblRoom] ON 

INSERT [dbo].[tblRoom] ([hotelId], [roomNo], [roomName], [availableDate], [quantity], [typeId], [roomPrice]) VALUES (0, 0, N'Delux', CAST(N'2022-03-19' AS Date), 5, N'1', 300)
INSERT [dbo].[tblRoom] ([hotelId], [roomNo], [roomName], [availableDate], [quantity], [typeId], [roomPrice]) VALUES (0, 8, N'Delux', NULL, 4, N'1', 156)
INSERT [dbo].[tblRoom] ([hotelId], [roomNo], [roomName], [availableDate], [quantity], [typeId], [roomPrice]) VALUES (0, 10, N'Delux', NULL, 7, N'1', 200)
SET IDENTITY_INSERT [dbo].[tblRoom] OFF
GO
SET IDENTITY_INSERT [dbo].[tblService] ON 

INSERT [dbo].[tblService] ([id], [name], [price]) VALUES (1, N'dọn phòng nhanh', 500000)
INSERT [dbo].[tblService] ([id], [name], [price]) VALUES (2, N'giặt ủi', 200000)
INSERT [dbo].[tblService] ([id], [name], [price]) VALUES (3, N'đánh giày', 100000)
INSERT [dbo].[tblService] ([id], [name], [price]) VALUES (4, N'massage', 500000)
INSERT [dbo].[tblService] ([id], [name], [price]) VALUES (5, N'buffet sáng', 1000000)
SET IDENTITY_INSERT [dbo].[tblService] OFF
GO
INSERT [dbo].[tblTypeRoom] ([typeId], [typeName]) VALUES (N'1', N'Stand')
GO
INSERT [dbo].[tblUser] ([userId], [Name], [Email], [PhoneNumber]) VALUES (N'user', N'Tuan', N'Silver.ak42@gmail.com', N'0982835899')
INSERT [dbo].[tblUser] ([userId], [Name], [Email], [PhoneNumber]) VALUES (N'admin', N'Anh Tuan', N'Silver.ak42@gmail.com', N'0982835899')
INSERT [dbo].[tblUser] ([userId], [Name], [Email], [PhoneNumber]) VALUES (N'anhtuan', N'Nguyễn Anh Tuấn', N'Silver.ak42@gmail.com', N'0982836899')
INSERT [dbo].[tblUser] ([userId], [Name], [Email], [PhoneNumber]) VALUES (N'ngoctuan', N'Ng?c Tu?n', N'a', N'12314')
GO
ALTER TABLE [dbo].[tblAccount]  WITH CHECK ADD  CONSTRAINT [FK__tblAccoun__RoleI__25869641] FOREIGN KEY([RoleId])
REFERENCES [dbo].[tblRole] ([RoleId])
GO
ALTER TABLE [dbo].[tblAccount] CHECK CONSTRAINT [FK__tblAccoun__RoleI__25869641]
GO
ALTER TABLE [dbo].[tblFeedBack]  WITH CHECK ADD FOREIGN KEY([roomNo])
REFERENCES [dbo].[tblRoom] ([roomNo])
GO
ALTER TABLE [dbo].[tblFeedBack]  WITH CHECK ADD  CONSTRAINT [FK__tblFeedBa__userI__31EC6D26] FOREIGN KEY([userId])
REFERENCES [dbo].[tblAccount] ([userId])
GO
ALTER TABLE [dbo].[tblFeedBack] CHECK CONSTRAINT [FK__tblFeedBa__userI__31EC6D26]
GO
ALTER TABLE [dbo].[tblOrder]  WITH CHECK ADD  CONSTRAINT [FK__tblOrder__userId__34C8D9D1] FOREIGN KEY([userId])
REFERENCES [dbo].[tblAccount] ([userId])
GO
ALTER TABLE [dbo].[tblOrder] CHECK CONSTRAINT [FK__tblOrder__userId__34C8D9D1]
GO
ALTER TABLE [dbo].[tblOrderDetails]  WITH CHECK ADD FOREIGN KEY([hotelId])
REFERENCES [dbo].[tblHotel] ([hotelId])
GO
ALTER TABLE [dbo].[tblOrderDetails]  WITH CHECK ADD FOREIGN KEY([orderId])
REFERENCES [dbo].[tblOrder] ([orderId])
GO
ALTER TABLE [dbo].[tblOrderDetails]  WITH CHECK ADD FOREIGN KEY([roomNo])
REFERENCES [dbo].[tblRoom] ([roomNo])
GO
ALTER TABLE [dbo].[tblOrderService]  WITH CHECK ADD FOREIGN KEY([orderId])
REFERENCES [dbo].[tblOrder] ([orderId])
GO
ALTER TABLE [dbo].[tblOrderService]  WITH CHECK ADD FOREIGN KEY([serviceId])
REFERENCES [dbo].[tblService] ([id])
GO
ALTER TABLE [dbo].[tblRoom]  WITH CHECK ADD FOREIGN KEY([hotelId])
REFERENCES [dbo].[tblHotel] ([hotelId])
GO
ALTER TABLE [dbo].[tblRoom]  WITH CHECK ADD FOREIGN KEY([typeId])
REFERENCES [dbo].[tblTypeRoom] ([typeId])
GO
ALTER TABLE [dbo].[tblUser]  WITH CHECK ADD  CONSTRAINT [FK__tblUser__userId__276EDEB3] FOREIGN KEY([userId])
REFERENCES [dbo].[tblAccount] ([userId])
GO
ALTER TABLE [dbo].[tblUser] CHECK CONSTRAINT [FK__tblUser__userId__276EDEB3]
GO
USE [master]
GO
ALTER DATABASE [BookingHotel] SET  READ_WRITE 
GO
