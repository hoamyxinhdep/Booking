USE [master]
GO
/****** Object:  Database [BookingHotel]    Script Date: 6/25/2023 12:28:55 AM ******/
CREATE DATABASE [BookingHotel]
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
EXEC sys.sp_db_vardecimal_storage_format N'BookingHotel', N'ON'
GO
ALTER DATABASE [BookingHotel] SET QUERY_STORE = OFF
GO
USE [BookingHotel]
GO
/****** Object:  Table [dbo].[tblAccount]    Script Date: 6/25/2023 12:28:56 AM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblDiscount]    Script Date: 6/25/2023 12:28:56 AM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblFeedBack]    Script Date: 6/25/2023 12:28:56 AM ******/
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
/****** Object:  Table [dbo].[tblHotel]    Script Date: 6/25/2023 12:28:56 AM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrder]    Script Date: 6/25/2023 12:28:56 AM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrderDetails]    Script Date: 6/25/2023 12:28:56 AM ******/
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
/****** Object:  Table [dbo].[tblOrderService]    Script Date: 6/25/2023 12:28:56 AM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRole]    Script Date: 6/25/2023 12:28:56 AM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRoom]    Script Date: 6/25/2023 12:28:56 AM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblService]    Script Date: 6/25/2023 12:28:56 AM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblTypeRoom]    Script Date: 6/25/2023 12:28:56 AM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUser]    Script Date: 6/25/2023 12:28:56 AM ******/
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
INSERT [dbo].[tblAccount] ([userId], [Password], [RoleId], [Status]) VALUES (N'anhtuan', N'3bb5c5d087497ef38f6ff09afc8594a7ee104496da277aec7eacf59c1f79dee1', 2, N'Active')
INSERT [dbo].[tblAccount] ([userId], [Password], [RoleId], [Status]) VALUES (N'ngoctuan', N'3aa03ae2033a9672f1c29a06dbe91fab8fe62b604914e1ea2329809c690b206e', 2, N'Active')
INSERT [dbo].[tblAccount] ([userId], [Password], [RoleId], [Status]) VALUES (N'user', N'04f8996da763b7a969b1028ee3007569eaf3a635486ddab211d512c85b9df8fb', 2, N'Active')
INSERT [dbo].[tblAccount] ([userId], [Password], [RoleId], [Status]) VALUES (N'user1', N'1234', 2, N'Active')
GO
INSERT [dbo].[tblFeedBack] ([roomNo], [userId], [value]) VALUES (0, N'user', 4)
GO
SET IDENTITY_INSERT [dbo].[tblHotel] ON 

INSERT [dbo].[tblHotel] ([hotelId], [hotelName], [hotelAddress], [Status]) VALUES (0, N'Sona', N'Da Nang', 1)
SET IDENTITY_INSERT [dbo].[tblHotel] OFF
GO
INSERT [dbo].[tblRole] ([RoleId], [RoleName]) VALUES (1, N'admin')
INSERT [dbo].[tblRole] ([RoleId], [RoleName]) VALUES (2, N'customer')
GO
SET IDENTITY_INSERT [dbo].[tblRoom] ON 

INSERT [dbo].[tblRoom] ([hotelId], [roomNo], [roomName], [availableDate], [quantity], [typeId], [roomPrice]) VALUES (0, 0, N'Delux', CAST(N'2022-03-19' AS Date), 5, N'1', 200)
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
INSERT [dbo].[tblUser] ([userId], [Name], [Email], [PhoneNumber]) VALUES (N'ngoctuan', N'Đặng Ngọc Tuấn', N'jipihe2558@cmeinbox.com', N'0982836899')
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
