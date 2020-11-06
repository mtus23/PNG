USE [master]
GO
/****** Object:  Database [PNG]    Script Date: 11/6/2020 10:31:36 AM ******/
CREATE DATABASE [PNG]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PNG', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\PNG.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'PNG_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\PNG_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [PNG] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PNG].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PNG] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PNG] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PNG] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PNG] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PNG] SET ARITHABORT OFF 
GO
ALTER DATABASE [PNG] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PNG] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PNG] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PNG] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PNG] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PNG] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PNG] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PNG] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PNG] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PNG] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PNG] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PNG] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PNG] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PNG] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PNG] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PNG] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PNG] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PNG] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PNG] SET  MULTI_USER 
GO
ALTER DATABASE [PNG] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PNG] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PNG] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PNG] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [PNG] SET DELAYED_DURABILITY = DISABLED 
GO
USE [PNG]
GO
/****** Object:  Table [dbo].[tblAccount]    Script Date: 11/6/2020 10:31:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblAccount](
	[email] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[userName] [varchar](50) NOT NULL,
	[statusID] [int] NOT NULL,
	[roleId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblCategory]    Script Date: 11/6/2020 10:31:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCategory](
	[categoryId] [uniqueidentifier] NOT NULL CONSTRAINT [DF__tblCatego__categ__1CF15040]  DEFAULT (newid()),
	[categoryName] [nvarchar](50) NOT NULL,
	[statusId] [int] NOT NULL,
 CONSTRAINT [PK__tblCateg__23CAF1D8E8A63AF9] PRIMARY KEY CLUSTERED 
(
	[categoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblOrder]    Script Date: 11/6/2020 10:31:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblOrder](
	[orderId] [uniqueidentifier] NOT NULL,
	[email] [varchar](50) NOT NULL,
	[totalPrice] [float] NOT NULL,
	[paymentType] [varchar](50) NOT NULL,
	[statusId] [int] NOT NULL,
	[orderDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[orderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblOrderDetail]    Script Date: 11/6/2020 10:31:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrderDetail](
	[orderDetailId] [uniqueidentifier] NOT NULL,
	[orderId] [uniqueidentifier] NOT NULL,
	[productId] [uniqueidentifier] NOT NULL,
	[price] [float] NOT NULL,
	[quantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[orderDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblProduct]    Script Date: 11/6/2020 10:31:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProduct](
	[productId] [uniqueidentifier] NOT NULL CONSTRAINT [DF__tblProduc__produ__286302EC]  DEFAULT (newid()),
	[productName] [nvarchar](max) NOT NULL,
	[quantity] [int] NOT NULL,
	[price] [float] NOT NULL,
	[categoryId] [uniqueidentifier] NOT NULL,
	[description] [nvarchar](max) NULL,
	[image] [nvarchar](max) NOT NULL,
	[statusId] [int] NOT NULL,
 CONSTRAINT [PK__tblProdu__2D10D16A0BDEE660] PRIMARY KEY CLUSTERED 
(
	[productId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblRole]    Script Date: 11/6/2020 10:31:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblRole](
	[roleId] [int] IDENTITY(1,1) NOT NULL,
	[roleName] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[roleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblStatus]    Script Date: 11/6/2020 10:31:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblStatus](
	[statusId] [int] IDENTITY(1,1) NOT NULL,
	[statusName] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[statusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[tblCategory] ([categoryId], [categoryName], [statusId]) VALUES (N'826a3bd5-8a9e-4f2e-a95e-7b28c35501aa', N'Trang sức vàng', 3)
INSERT [dbo].[tblCategory] ([categoryId], [categoryName], [statusId]) VALUES (N'baa8bd26-8893-4f18-acd2-ee32e7dc9b12', N'Watch', 3)
INSERT [dbo].[tblProduct] ([productId], [productName], [quantity], [price], [categoryId], [description], [image], [statusId]) VALUES (N'df698c8e-6036-4fe9-9015-9f50b5a417d3', N'Đồng Hồ Orient Nam FUNG2001D0 Dây Thép Không Gỉ 42mm', 100, 140, N'baa8bd26-8893-4f18-acd2-ee32e7dc9b12', N'', N'Đồng_Hồ_Orient_Nam_FUNG2001D0_Dây_Thép_Không_Gỉ_42mm_-_1.jpg', 3)
INSERT [dbo].[tblProduct] ([productId], [productName], [quantity], [price], [categoryId], [description], [image], [statusId]) VALUES (N'311052a2-100e-4c00-8b7f-ab2bc044cdcd', N'Đồng Hồ Casio Nữ LTP-E143DBL-5ADR Dây Da 30mm', 100, 120, N'baa8bd26-8893-4f18-acd2-ee32e7dc9b12', N'', N'LTP-E143DBL-5ADR_Desktop_1.jpg', 3)
INSERT [dbo].[tblProduct] ([productId], [productName], [quantity], [price], [categoryId], [description], [image], [statusId]) VALUES (N'bfb9debf-b571-4230-814f-adcdd875ccaf', N'Đồng Hồ Fossil Nữ ES4650 Dây Da 28mm', 100, 155, N'baa8bd26-8893-4f18-acd2-ee32e7dc9b12', N'', N'ES4650_Desktop_1.jpg', 3)
INSERT [dbo].[tblProduct] ([productId], [productName], [quantity], [price], [categoryId], [description], [image], [statusId]) VALUES (N'8d17d0d2-64a2-4f9e-880b-de24cef1e8b9', N'Đồng Hồ Fossil Nam FS5536 Dây Nhựa 44mm', 100, 100, N'baa8bd26-8893-4f18-acd2-ee32e7dc9b12', N'', N'dong-ho-nam-day-cao-su-fossil-fs5536.png', 3)
SET IDENTITY_INSERT [dbo].[tblStatus] ON 

INSERT [dbo].[tblStatus] ([statusId], [statusName]) VALUES (1, N'Active')
INSERT [dbo].[tblStatus] ([statusId], [statusName]) VALUES (2, N'Deactive')
INSERT [dbo].[tblStatus] ([statusId], [statusName]) VALUES (3, N'Available')
INSERT [dbo].[tblStatus] ([statusId], [statusName]) VALUES (4, N'Unavailable')
SET IDENTITY_INSERT [dbo].[tblStatus] OFF
ALTER TABLE [dbo].[tblOrder] ADD  DEFAULT (newsequentialid()) FOR [orderId]
GO
ALTER TABLE [dbo].[tblOrder] ADD  DEFAULT (getdate()) FOR [orderDate]
GO
ALTER TABLE [dbo].[tblOrderDetail] ADD  DEFAULT (newid()) FOR [orderDetailId]
GO
ALTER TABLE [dbo].[tblAccount]  WITH CHECK ADD FOREIGN KEY([roleId])
REFERENCES [dbo].[tblRole] ([roleId])
GO
ALTER TABLE [dbo].[tblAccount]  WITH CHECK ADD FOREIGN KEY([statusID])
REFERENCES [dbo].[tblStatus] ([statusId])
GO
ALTER TABLE [dbo].[tblCategory]  WITH CHECK ADD  CONSTRAINT [FK__tblCatego__statu__31EC6D26] FOREIGN KEY([statusId])
REFERENCES [dbo].[tblStatus] ([statusId])
GO
ALTER TABLE [dbo].[tblCategory] CHECK CONSTRAINT [FK__tblCatego__statu__31EC6D26]
GO
ALTER TABLE [dbo].[tblOrder]  WITH CHECK ADD FOREIGN KEY([email])
REFERENCES [dbo].[tblAccount] ([email])
GO
ALTER TABLE [dbo].[tblOrder]  WITH CHECK ADD FOREIGN KEY([statusId])
REFERENCES [dbo].[tblStatus] ([statusId])
GO
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD FOREIGN KEY([orderId])
REFERENCES [dbo].[tblOrder] ([orderId])
GO
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK__tblOrderD__produ__300424B4] FOREIGN KEY([productId])
REFERENCES [dbo].[tblProduct] ([productId])
GO
ALTER TABLE [dbo].[tblOrderDetail] CHECK CONSTRAINT [FK__tblOrderD__produ__300424B4]
GO
ALTER TABLE [dbo].[tblProduct]  WITH CHECK ADD  CONSTRAINT [FK__tblProduc__categ__32E0915F] FOREIGN KEY([categoryId])
REFERENCES [dbo].[tblCategory] ([categoryId])
GO
ALTER TABLE [dbo].[tblProduct] CHECK CONSTRAINT [FK__tblProduc__categ__32E0915F]
GO
ALTER TABLE [dbo].[tblProduct]  WITH CHECK ADD  CONSTRAINT [FK__tblProduc__statu__30F848ED] FOREIGN KEY([statusId])
REFERENCES [dbo].[tblStatus] ([statusId])
GO
ALTER TABLE [dbo].[tblProduct] CHECK CONSTRAINT [FK__tblProduc__statu__30F848ED]
GO
USE [master]
GO
ALTER DATABASE [PNG] SET  READ_WRITE 
GO
