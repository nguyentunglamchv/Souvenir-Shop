USE [master]
GO
/****** Object:  Database [giadinhthoxinh]    Script Date: 5/26/2023 10:20:13 PM ******/
CREATE DATABASE [giadinhthoxinh]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'giadinhthoxinh', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\giadinhthoxinh.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'giadinhthoxinh_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\giadinhthoxinh_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [giadinhthoxinh] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [giadinhthoxinh].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [giadinhthoxinh] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [giadinhthoxinh] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [giadinhthoxinh] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [giadinhthoxinh] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [giadinhthoxinh] SET ARITHABORT OFF 
GO
ALTER DATABASE [giadinhthoxinh] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [giadinhthoxinh] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [giadinhthoxinh] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [giadinhthoxinh] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [giadinhthoxinh] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [giadinhthoxinh] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [giadinhthoxinh] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [giadinhthoxinh] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [giadinhthoxinh] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [giadinhthoxinh] SET  ENABLE_BROKER 
GO
ALTER DATABASE [giadinhthoxinh] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [giadinhthoxinh] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [giadinhthoxinh] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [giadinhthoxinh] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [giadinhthoxinh] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [giadinhthoxinh] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [giadinhthoxinh] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [giadinhthoxinh] SET RECOVERY FULL 
GO
ALTER DATABASE [giadinhthoxinh] SET  MULTI_USER 
GO
ALTER DATABASE [giadinhthoxinh] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [giadinhthoxinh] SET DB_CHAINING OFF 
GO
ALTER DATABASE [giadinhthoxinh] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [giadinhthoxinh] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [giadinhthoxinh] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [giadinhthoxinh] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'giadinhthoxinh', N'ON'
GO
ALTER DATABASE [giadinhthoxinh] SET QUERY_STORE = OFF
GO
USE [giadinhthoxinh]
GO
/****** Object:  Table [dbo].[tblCategory]    Script Date: 5/26/2023 10:20:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCategory](
	[PK_iCategoryID] [int] IDENTITY(1,1) NOT NULL,
	[sCategoryName] [nvarchar](60) NULL,
 CONSTRAINT [PK__tblCateg__1CEB1EFB7725771C] PRIMARY KEY CLUSTERED 
(
	[PK_iCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCheckinDetail]    Script Date: 5/26/2023 10:20:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCheckinDetail](
	[PK_iCheckinDetailID] [int] IDENTITY(1,1) NOT NULL,
	[FK_iImportOrderID] [int] NOT NULL,
	[FK_iProductID] [int] NULL,
	[iQuatity] [int] NULL,
	[fPrice] [float] NULL,
 CONSTRAINT [PK__tblCheck__74ECEDDEF3DEC773] PRIMARY KEY CLUSTERED 
(
	[PK_iCheckinDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCheckoutDetail]    Script Date: 5/26/2023 10:20:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCheckoutDetail](
	[PK_iCheckoutDetailID] [int] IDENTITY(1,1) NOT NULL,
	[FK_iOrderID] [int] NOT NULL,
	[FK_iProductID] [int] NULL,
	[iQuantity] [int] NULL,
	[fPrice] [float] NULL,
 CONSTRAINT [PK__tblCheck__AA0F9D73CFC6D13F] PRIMARY KEY CLUSTERED 
(
	[PK_iCheckoutDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblImage]    Script Date: 5/26/2023 10:20:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblImage](
	[PK_iImageID] [int] IDENTITY(1,1) NOT NULL,
	[FK_iProductID] [int] NOT NULL,
	[sImage] [nvarchar](250) NULL,
 CONSTRAINT [PK__tblImage__2309338E88158E3D] PRIMARY KEY CLUSTERED 
(
	[PK_iImageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblImportMaterial]    Script Date: 5/26/2023 10:20:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblImportMaterial](
	[PK_iImportMaterialID] [int] IDENTITY(1,1) NOT NULL,
	[FK_iImportOrderID] [int] NOT NULL,
	[FK_iMaterialID] [int] NOT NULL,
	[iQuatity] [int] NULL,
	[fPrice] [float] NULL,
 CONSTRAINT [PK_tblImportMaterial] PRIMARY KEY CLUSTERED 
(
	[PK_iImportMaterialID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblImportOrder]    Script Date: 5/26/2023 10:20:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblImportOrder](
	[PK_iImportOrderID] [int] IDENTITY(1,1) NOT NULL,
	[FK_iAccountID] [int] NOT NULL,
	[FK_iSupplierID] [int] NOT NULL,
	[dtDateAdded] [datetime] NULL,
	[sDeliver] [nvarchar](80) NULL,
	[iState] [int] NULL,
 CONSTRAINT [PK__tblImpor__804C7A8B512FB969] PRIMARY KEY CLUSTERED 
(
	[PK_iImportOrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblMaterColor]    Script Date: 5/26/2023 10:20:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMaterColor](
	[PK_iMaterColorID] [int] IDENTITY(1,1) NOT NULL,
	[FK_iMaterialID] [int] NOT NULL,
	[sMaterColor] [nvarchar](40) NULL,
 CONSTRAINT [PK_tblMaterColor] PRIMARY KEY CLUSTERED 
(
	[PK_iMaterColorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblMaterial]    Script Date: 5/26/2023 10:20:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMaterial](
	[PK_iMaterialID] [int] IDENTITY(1,1) NOT NULL,
	[sMaterialName] [nvarchar](50) NULL,
	[sDescribe] [nvarchar](200) NULL,
	[iQuatity] [int] NULL,
	[sUnit] [nvarchar](20) NULL,
 CONSTRAINT [PK_tblMaterial] PRIMARY KEY CLUSTERED 
(
	[PK_iMaterialID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblMaterPriceImport]    Script Date: 5/26/2023 10:20:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMaterPriceImport](
	[PK_iMaterPriceImportID] [int] IDENTITY(1,1) NOT NULL,
	[FK_iMaterialID] [int] NOT NULL,
	[fMaterPriceImport] [float] NULL,
	[dtStartDay] [datetime] NULL,
	[dtEndDay] [datetime] NULL,
 CONSTRAINT [PK_tblMaterPriceImport] PRIMARY KEY CLUSTERED 
(
	[PK_iMaterPriceImportID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblMaterSize]    Script Date: 5/26/2023 10:20:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMaterSize](
	[PK_iMaterSizeID] [int] IDENTITY(1,1) NOT NULL,
	[FK_iMaterialID] [int] NOT NULL,
	[sMaterSize] [nvarchar](20) NULL,
 CONSTRAINT [PK_tblMaterSize] PRIMARY KEY CLUSTERED 
(
	[PK_iMaterSizeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrder]    Script Date: 5/26/2023 10:20:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrder](
	[PK_iOrderID] [int] IDENTITY(1,1) NOT NULL,
	[FK_iAccountID] [int] NOT NULL,
	[sCustomerName] [nvarchar](50) NULL,
	[sCustomerPhone] [varchar](15) NULL,
	[sDeliveryAddress] [nvarchar](150) NULL,
	[dInvoidDate] [datetime] NOT NULL,
	[sBiller] [nvarchar](50) NULL,
	[iDeliveryMethod] [int] NULL,
	[fSurcharge] [float] NULL,
	[iPaid] [int] NULL,
	[sState] [nvarchar](50) NULL,
	[iTotal] [int] NULL,
 CONSTRAINT [PK__tblOrder__3261310A653333D7] PRIMARY KEY CLUSTERED 
(
	[PK_iOrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPermission]    Script Date: 5/26/2023 10:20:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPermission](
	[PK_iPermissionID] [int] IDENTITY(1,1) NOT NULL,
	[sPermissionName] [nvarchar](50) NULL,
	[iState] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_iPermissionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProduct]    Script Date: 5/26/2023 10:20:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProduct](
	[PK_iProductID] [int] IDENTITY(1,1) NOT NULL,
	[FK_iCategoryID] [int] NOT NULL,
	[FK_iPromoteID] [int] NOT NULL,
	[sProductName] [nvarchar](200) NULL,
	[sDescribe] [nvarchar](1000) NULL,
	[fPrice] [float] NULL,
	[sColor] [nvarchar](40) NULL,
	[sSize] [nvarchar](20) NULL,
	[sImage] [nvarchar](250) NULL,
	[sUnit] [nvarchar](20) NULL,
	[iQuantity] [int] NULL,
 CONSTRAINT [PK__tblProdu__2980F3B84306DD52] PRIMARY KEY CLUSTERED 
(
	[PK_iProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProductColor]    Script Date: 5/26/2023 10:20:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProductColor](
	[PK_iProductColorID] [int] IDENTITY(1,1) NOT NULL,
	[FK_iProductID] [int] NOT NULL,
	[sProductColor] [nvarchar](40) NULL,
 CONSTRAINT [PK_tblProductColor] PRIMARY KEY CLUSTERED 
(
	[PK_iProductColorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProductPrice]    Script Date: 5/26/2023 10:20:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProductPrice](
	[PK_iProductPriceID] [int] IDENTITY(1,1) NOT NULL,
	[FK_iProductID] [int] NOT NULL,
	[fPrice] [float] NULL,
	[dtStartDay] [datetime] NULL,
	[dtEndDay] [datetime] NULL,
 CONSTRAINT [PK_tblProductPrice] PRIMARY KEY CLUSTERED 
(
	[PK_iProductPriceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProductSize]    Script Date: 5/26/2023 10:20:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProductSize](
	[PK_iProductSizeID] [int] IDENTITY(1,1) NOT NULL,
	[FK_iProductID] [int] NOT NULL,
	[sSizeName] [nvarchar](20) NULL,
 CONSTRAINT [PK_tblProductSize] PRIMARY KEY CLUSTERED 
(
	[PK_iProductSizeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPromote]    Script Date: 5/26/2023 10:20:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPromote](
	[PK_iPromoteID] [int] IDENTITY(1,1) NOT NULL,
	[sPromoteName] [nvarchar](200) NULL,
	[sPromoteRate] [float] NULL,
	[dtStartDay] [datetime] NULL,
	[dtEndDay] [datetime] NULL,
 CONSTRAINT [PK__tblPromo__498845A71A5830E3] PRIMARY KEY CLUSTERED 
(
	[PK_iPromoteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblReview]    Script Date: 5/26/2023 10:20:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblReview](
	[PK_iReviewID] [int] IDENTITY(1,1) NOT NULL,
	[FK_iProductID] [int] NOT NULL,
	[FK_iAccountID] [int] NOT NULL,
	[iStarRating] [int] NULL,
	[dtReviewTime] [datetime] NULL,
 CONSTRAINT [PK__tblRevie__7180705F11601E83] PRIMARY KEY CLUSTERED 
(
	[PK_iReviewID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblSupplier]    Script Date: 5/26/2023 10:20:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSupplier](
	[PK_iSupplierID] [int] IDENTITY(1,1) NOT NULL,
	[sSupplierName] [nvarchar](200) NULL,
	[sPhone] [varchar](15) NULL,
	[sEmail] [varchar](50) NULL,
	[sAddress] [nvarchar](250) NULL,
 CONSTRAINT [PK__tblSuppl__C051541594A08A37] PRIMARY KEY CLUSTERED 
(
	[PK_iSupplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUser]    Script Date: 5/26/2023 10:20:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUser](
	[PK_iAccountID] [int] IDENTITY(1,1) NOT NULL,
	[FK_iPermissionID] [int] NOT NULL,
	[sEmail] [varchar](50) NULL,
	[sPass] [nvarchar](50) NULL,
	[sUserName] [nvarchar](50) NULL,
	[sPhone] [varchar](15) NULL,
	[sAddress] [nvarchar](150) NULL,
	[iState] [int] NULL,
 CONSTRAINT [PK__tblUser__A8653C89B0130405] PRIMARY KEY CLUSTERED 
(
	[PK_iAccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tblCategory] ON 

INSERT [dbo].[tblCategory] ([PK_iCategoryID], [sCategoryName]) VALUES (1, N'Tất cả')
INSERT [dbo].[tblCategory] ([PK_iCategoryID], [sCategoryName]) VALUES (2, N'Hoa len')
INSERT [dbo].[tblCategory] ([PK_iCategoryID], [sCategoryName]) VALUES (3, N'Thú bông')
INSERT [dbo].[tblCategory] ([PK_iCategoryID], [sCategoryName]) VALUES (4, N'Mũ len')
INSERT [dbo].[tblCategory] ([PK_iCategoryID], [sCategoryName]) VALUES (5, N'Khăn len')
INSERT [dbo].[tblCategory] ([PK_iCategoryID], [sCategoryName]) VALUES (7, N'Túi Xách')
INSERT [dbo].[tblCategory] ([PK_iCategoryID], [sCategoryName]) VALUES (8, N'Váy len')
SET IDENTITY_INSERT [dbo].[tblCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[tblCheckinDetail] ON 

INSERT [dbo].[tblCheckinDetail] ([PK_iCheckinDetailID], [FK_iImportOrderID], [FK_iProductID], [iQuatity], [fPrice]) VALUES (1, 1, 1, 5, 160000)
INSERT [dbo].[tblCheckinDetail] ([PK_iCheckinDetailID], [FK_iImportOrderID], [FK_iProductID], [iQuatity], [fPrice]) VALUES (2, 1, 2, 6, 140000)
INSERT [dbo].[tblCheckinDetail] ([PK_iCheckinDetailID], [FK_iImportOrderID], [FK_iProductID], [iQuatity], [fPrice]) VALUES (1002, 1, 3, 17, 150000)
INSERT [dbo].[tblCheckinDetail] ([PK_iCheckinDetailID], [FK_iImportOrderID], [FK_iProductID], [iQuatity], [fPrice]) VALUES (1004, 2, 2, 15, 160000)
INSERT [dbo].[tblCheckinDetail] ([PK_iCheckinDetailID], [FK_iImportOrderID], [FK_iProductID], [iQuatity], [fPrice]) VALUES (1005, 2, 3, 9, 140000)
INSERT [dbo].[tblCheckinDetail] ([PK_iCheckinDetailID], [FK_iImportOrderID], [FK_iProductID], [iQuatity], [fPrice]) VALUES (1006, 1, 1, 5, 300000)
SET IDENTITY_INSERT [dbo].[tblCheckinDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[tblCheckoutDetail] ON 

INSERT [dbo].[tblCheckoutDetail] ([PK_iCheckoutDetailID], [FK_iOrderID], [FK_iProductID], [iQuantity], [fPrice]) VALUES (1, 1, 1, 4, 200000)
INSERT [dbo].[tblCheckoutDetail] ([PK_iCheckoutDetailID], [FK_iOrderID], [FK_iProductID], [iQuantity], [fPrice]) VALUES (2, 1, 2, 3, 190000)
INSERT [dbo].[tblCheckoutDetail] ([PK_iCheckoutDetailID], [FK_iOrderID], [FK_iProductID], [iQuantity], [fPrice]) VALUES (1003, 2, 2, 3, 220000)
INSERT [dbo].[tblCheckoutDetail] ([PK_iCheckoutDetailID], [FK_iOrderID], [FK_iProductID], [iQuantity], [fPrice]) VALUES (1004, 2, 3, 5, 210000)
INSERT [dbo].[tblCheckoutDetail] ([PK_iCheckoutDetailID], [FK_iOrderID], [FK_iProductID], [iQuantity], [fPrice]) VALUES (1005, 14, 1, 2, 350000)
INSERT [dbo].[tblCheckoutDetail] ([PK_iCheckoutDetailID], [FK_iOrderID], [FK_iProductID], [iQuantity], [fPrice]) VALUES (1006, 14, 5, 1, 190000)
INSERT [dbo].[tblCheckoutDetail] ([PK_iCheckoutDetailID], [FK_iOrderID], [FK_iProductID], [iQuantity], [fPrice]) VALUES (1007, 15, 4, 2, 200000)
INSERT [dbo].[tblCheckoutDetail] ([PK_iCheckoutDetailID], [FK_iOrderID], [FK_iProductID], [iQuantity], [fPrice]) VALUES (1008, 15, 2, 1, 70000)
INSERT [dbo].[tblCheckoutDetail] ([PK_iCheckoutDetailID], [FK_iOrderID], [FK_iProductID], [iQuantity], [fPrice]) VALUES (1009, 16, 4, 1, 200000)
INSERT [dbo].[tblCheckoutDetail] ([PK_iCheckoutDetailID], [FK_iOrderID], [FK_iProductID], [iQuantity], [fPrice]) VALUES (1010, 17, 3, 1, 300000)
INSERT [dbo].[tblCheckoutDetail] ([PK_iCheckoutDetailID], [FK_iOrderID], [FK_iProductID], [iQuantity], [fPrice]) VALUES (1011, 17, 2, 1, 70000)
INSERT [dbo].[tblCheckoutDetail] ([PK_iCheckoutDetailID], [FK_iOrderID], [FK_iProductID], [iQuantity], [fPrice]) VALUES (1012, 18, 4, 1, 200000)
INSERT [dbo].[tblCheckoutDetail] ([PK_iCheckoutDetailID], [FK_iOrderID], [FK_iProductID], [iQuantity], [fPrice]) VALUES (1013, 18, 8, 1, 160000)
INSERT [dbo].[tblCheckoutDetail] ([PK_iCheckoutDetailID], [FK_iOrderID], [FK_iProductID], [iQuantity], [fPrice]) VALUES (1014, 18, 10, 1, 160000)
INSERT [dbo].[tblCheckoutDetail] ([PK_iCheckoutDetailID], [FK_iOrderID], [FK_iProductID], [iQuantity], [fPrice]) VALUES (1015, 19, 3, 1, 300000)
INSERT [dbo].[tblCheckoutDetail] ([PK_iCheckoutDetailID], [FK_iOrderID], [FK_iProductID], [iQuantity], [fPrice]) VALUES (1016, 19, 7, 1, 200000)
INSERT [dbo].[tblCheckoutDetail] ([PK_iCheckoutDetailID], [FK_iOrderID], [FK_iProductID], [iQuantity], [fPrice]) VALUES (1017, 20, 3, 2, 300000)
INSERT [dbo].[tblCheckoutDetail] ([PK_iCheckoutDetailID], [FK_iOrderID], [FK_iProductID], [iQuantity], [fPrice]) VALUES (1018, 20, 4, 1, 200000)
INSERT [dbo].[tblCheckoutDetail] ([PK_iCheckoutDetailID], [FK_iOrderID], [FK_iProductID], [iQuantity], [fPrice]) VALUES (1019, 21, 3, 1, 300000)
INSERT [dbo].[tblCheckoutDetail] ([PK_iCheckoutDetailID], [FK_iOrderID], [FK_iProductID], [iQuantity], [fPrice]) VALUES (1020, 21, 1, 1, 350000)
INSERT [dbo].[tblCheckoutDetail] ([PK_iCheckoutDetailID], [FK_iOrderID], [FK_iProductID], [iQuantity], [fPrice]) VALUES (1021, 22, 3, 1, 300000)
INSERT [dbo].[tblCheckoutDetail] ([PK_iCheckoutDetailID], [FK_iOrderID], [FK_iProductID], [iQuantity], [fPrice]) VALUES (1022, 23, 2, 1, 70000)
INSERT [dbo].[tblCheckoutDetail] ([PK_iCheckoutDetailID], [FK_iOrderID], [FK_iProductID], [iQuantity], [fPrice]) VALUES (1023, 24, 2, 1, 70000)
INSERT [dbo].[tblCheckoutDetail] ([PK_iCheckoutDetailID], [FK_iOrderID], [FK_iProductID], [iQuantity], [fPrice]) VALUES (1024, 25, 7, 1, 200000)
INSERT [dbo].[tblCheckoutDetail] ([PK_iCheckoutDetailID], [FK_iOrderID], [FK_iProductID], [iQuantity], [fPrice]) VALUES (1025, 26, 10, 1, 160000)
INSERT [dbo].[tblCheckoutDetail] ([PK_iCheckoutDetailID], [FK_iOrderID], [FK_iProductID], [iQuantity], [fPrice]) VALUES (1026, 27, 2, 1, 70000)
SET IDENTITY_INSERT [dbo].[tblCheckoutDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[tblImage] ON 

INSERT [dbo].[tblImage] ([PK_iImageID], [FK_iProductID], [sImage]) VALUES (2, 1, N'/Data/563282be3254f50aac45.jpg')
INSERT [dbo].[tblImage] ([PK_iImageID], [FK_iProductID], [sImage]) VALUES (1002, 1, N'/Data/309011360_2481749058626201_926817814432895443_n.jpg')
INSERT [dbo].[tblImage] ([PK_iImageID], [FK_iProductID], [sImage]) VALUES (1003, 2, N'/Data/311454669_2506007806200326_1742919981966582397_n.jpg')
INSERT [dbo].[tblImage] ([PK_iImageID], [FK_iProductID], [sImage]) VALUES (1004, 2, N'/Data/311266970_2506007776200329_8672871418517302720_n.jpg')
INSERT [dbo].[tblImage] ([PK_iImageID], [FK_iProductID], [sImage]) VALUES (1005, 2, N'/Data/307937840_2476132112521229_6930776927136825750_n.jpg')
SET IDENTITY_INSERT [dbo].[tblImage] OFF
GO
SET IDENTITY_INSERT [dbo].[tblImportMaterial] ON 

INSERT [dbo].[tblImportMaterial] ([PK_iImportMaterialID], [FK_iImportOrderID], [FK_iMaterialID], [iQuatity], [fPrice]) VALUES (1, 1, 1, 4, 30000)
INSERT [dbo].[tblImportMaterial] ([PK_iImportMaterialID], [FK_iImportOrderID], [FK_iMaterialID], [iQuatity], [fPrice]) VALUES (2, 1, 2, 3, 20000)
INSERT [dbo].[tblImportMaterial] ([PK_iImportMaterialID], [FK_iImportOrderID], [FK_iMaterialID], [iQuatity], [fPrice]) VALUES (3, 1, 3, 6, 35000)
INSERT [dbo].[tblImportMaterial] ([PK_iImportMaterialID], [FK_iImportOrderID], [FK_iMaterialID], [iQuatity], [fPrice]) VALUES (4, 2, 1, 7, 39000)
INSERT [dbo].[tblImportMaterial] ([PK_iImportMaterialID], [FK_iImportOrderID], [FK_iMaterialID], [iQuatity], [fPrice]) VALUES (5, 2, 2, 5, 36000)
INSERT [dbo].[tblImportMaterial] ([PK_iImportMaterialID], [FK_iImportOrderID], [FK_iMaterialID], [iQuatity], [fPrice]) VALUES (6, 2, 3, 6, 33000)
SET IDENTITY_INSERT [dbo].[tblImportMaterial] OFF
GO
SET IDENTITY_INSERT [dbo].[tblImportOrder] ON 

INSERT [dbo].[tblImportOrder] ([PK_iImportOrderID], [FK_iAccountID], [FK_iSupplierID], [dtDateAdded], [sDeliver], [iState]) VALUES (1, 1, 1, CAST(N'2023-02-24T02:30:00.000' AS DateTime), N'Tú Anh', NULL)
INSERT [dbo].[tblImportOrder] ([PK_iImportOrderID], [FK_iAccountID], [FK_iSupplierID], [dtDateAdded], [sDeliver], [iState]) VALUES (2, 2, 2, CAST(N'2023-02-24T12:30:00.000' AS DateTime), N'Mỹ Hoa', NULL)
INSERT [dbo].[tblImportOrder] ([PK_iImportOrderID], [FK_iAccountID], [FK_iSupplierID], [dtDateAdded], [sDeliver], [iState]) VALUES (3, 1, 1, CAST(N'2023-02-20T14:30:00.000' AS DateTime), N'Ý Lan', NULL)
INSERT [dbo].[tblImportOrder] ([PK_iImportOrderID], [FK_iAccountID], [FK_iSupplierID], [dtDateAdded], [sDeliver], [iState]) VALUES (5, 1, 1, CAST(N'2023-02-24T02:30:00.000' AS DateTime), N'Tuấn Anh', NULL)
INSERT [dbo].[tblImportOrder] ([PK_iImportOrderID], [FK_iAccountID], [FK_iSupplierID], [dtDateAdded], [sDeliver], [iState]) VALUES (6, 6, 3, CAST(N'2023-02-24T02:30:00.000' AS DateTime), N'Trung Kiên', NULL)
INSERT [dbo].[tblImportOrder] ([PK_iImportOrderID], [FK_iAccountID], [FK_iSupplierID], [dtDateAdded], [sDeliver], [iState]) VALUES (7, 1, 1, CAST(N'2023-04-21T06:51:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[tblImportOrder] ([PK_iImportOrderID], [FK_iAccountID], [FK_iSupplierID], [dtDateAdded], [sDeliver], [iState]) VALUES (8, 1, 1, CAST(N'2023-04-21T06:52:00.000' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[tblImportOrder] OFF
GO
SET IDENTITY_INSERT [dbo].[tblMaterColor] ON 

INSERT [dbo].[tblMaterColor] ([PK_iMaterColorID], [FK_iMaterialID], [sMaterColor]) VALUES (1, 1, N'Đỏ')
INSERT [dbo].[tblMaterColor] ([PK_iMaterColorID], [FK_iMaterialID], [sMaterColor]) VALUES (4, 1, N'Vàng ')
INSERT [dbo].[tblMaterColor] ([PK_iMaterColorID], [FK_iMaterialID], [sMaterColor]) VALUES (5, 1, N'Xanh')
INSERT [dbo].[tblMaterColor] ([PK_iMaterColorID], [FK_iMaterialID], [sMaterColor]) VALUES (6, 2, N'Đỏ')
INSERT [dbo].[tblMaterColor] ([PK_iMaterColorID], [FK_iMaterialID], [sMaterColor]) VALUES (7, 2, N'Vàng')
INSERT [dbo].[tblMaterColor] ([PK_iMaterColorID], [FK_iMaterialID], [sMaterColor]) VALUES (8, 2, N'Xanh')
INSERT [dbo].[tblMaterColor] ([PK_iMaterColorID], [FK_iMaterialID], [sMaterColor]) VALUES (9, 4, N'Đỏ')
INSERT [dbo].[tblMaterColor] ([PK_iMaterColorID], [FK_iMaterialID], [sMaterColor]) VALUES (10, 4, N'Vàng')
INSERT [dbo].[tblMaterColor] ([PK_iMaterColorID], [FK_iMaterialID], [sMaterColor]) VALUES (11, 4, N'Xanh')
SET IDENTITY_INSERT [dbo].[tblMaterColor] OFF
GO
SET IDENTITY_INSERT [dbo].[tblMaterial] ON 

INSERT [dbo].[tblMaterial] ([PK_iMaterialID], [sMaterialName], [sDescribe], [iQuatity], [sUnit]) VALUES (1, N'Len milk cotton 125gr', NULL, 6, N'cuộn')
INSERT [dbo].[tblMaterial] ([PK_iMaterialID], [sMaterialName], [sDescribe], [iQuatity], [sUnit]) VALUES (2, N'Len milk cotton 50gr', NULL, 5, N'cuộn')
INSERT [dbo].[tblMaterial] ([PK_iMaterialID], [sMaterialName], [sDescribe], [iQuatity], [sUnit]) VALUES (3, N'Hộp mắt thú', NULL, 2, N'hộp')
INSERT [dbo].[tblMaterial] ([PK_iMaterialID], [sMaterialName], [sDescribe], [iQuatity], [sUnit]) VALUES (4, N'Len sợi dệt', NULL, 6, N'cuộn')
INSERT [dbo].[tblMaterial] ([PK_iMaterialID], [sMaterialName], [sDescribe], [iQuatity], [sUnit]) VALUES (5, N'bó kẽm cành 0.5mm', N'Bó kẽm cành làm cánh hoa', 1, N'bó')
INSERT [dbo].[tblMaterial] ([PK_iMaterialID], [sMaterialName], [sDescribe], [iQuatity], [sUnit]) VALUES (6, N'bó kẽm cành 0.5mm', N'Bó kẽm cành làm cánh hoa', 8, N'bó')
SET IDENTITY_INSERT [dbo].[tblMaterial] OFF
GO
SET IDENTITY_INSERT [dbo].[tblMaterPriceImport] ON 

INSERT [dbo].[tblMaterPriceImport] ([PK_iMaterPriceImportID], [FK_iMaterialID], [fMaterPriceImport], [dtStartDay], [dtEndDay]) VALUES (1, 1, 300000, CAST(N'2023-02-24T21:30:00.000' AS DateTime), CAST(N'2023-04-10T21:30:00.000' AS DateTime))
INSERT [dbo].[tblMaterPriceImport] ([PK_iMaterPriceImportID], [FK_iMaterialID], [fMaterPriceImport], [dtStartDay], [dtEndDay]) VALUES (2, 1, 28000, CAST(N'2023-04-21T07:05:00.000' AS DateTime), CAST(N'2023-04-21T07:05:00.000' AS DateTime))
INSERT [dbo].[tblMaterPriceImport] ([PK_iMaterPriceImportID], [FK_iMaterialID], [fMaterPriceImport], [dtStartDay], [dtEndDay]) VALUES (3, 1, 29000, CAST(N'2023-04-01T00:00:00.000' AS DateTime), CAST(N'2023-04-10T00:00:00.000' AS DateTime))
INSERT [dbo].[tblMaterPriceImport] ([PK_iMaterPriceImportID], [FK_iMaterialID], [fMaterPriceImport], [dtStartDay], [dtEndDay]) VALUES (4, 1, 7, CAST(N'2023-04-21T07:05:00.000' AS DateTime), CAST(N'2023-04-21T07:05:00.000' AS DateTime))
INSERT [dbo].[tblMaterPriceImport] ([PK_iMaterPriceImportID], [FK_iMaterialID], [fMaterPriceImport], [dtStartDay], [dtEndDay]) VALUES (5, 1, 7, CAST(N'2023-04-21T07:05:00.000' AS DateTime), CAST(N'2023-04-21T07:05:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[tblMaterPriceImport] OFF
GO
SET IDENTITY_INSERT [dbo].[tblMaterSize] ON 

INSERT [dbo].[tblMaterSize] ([PK_iMaterSizeID], [FK_iMaterialID], [sMaterSize]) VALUES (1, 1, N'Nhỏ')
INSERT [dbo].[tblMaterSize] ([PK_iMaterSizeID], [FK_iMaterialID], [sMaterSize]) VALUES (2, 1, N'Vừa')
INSERT [dbo].[tblMaterSize] ([PK_iMaterSizeID], [FK_iMaterialID], [sMaterSize]) VALUES (4, 1, N'To')
INSERT [dbo].[tblMaterSize] ([PK_iMaterSizeID], [FK_iMaterialID], [sMaterSize]) VALUES (5, 2, N'Nhỏ')
INSERT [dbo].[tblMaterSize] ([PK_iMaterSizeID], [FK_iMaterialID], [sMaterSize]) VALUES (6, 2, N'Vừa')
INSERT [dbo].[tblMaterSize] ([PK_iMaterSizeID], [FK_iMaterialID], [sMaterSize]) VALUES (7, 2, N'To')
SET IDENTITY_INSERT [dbo].[tblMaterSize] OFF
GO
SET IDENTITY_INSERT [dbo].[tblOrder] ON 

INSERT [dbo].[tblOrder] ([PK_iOrderID], [FK_iAccountID], [sCustomerName], [sCustomerPhone], [sDeliveryAddress], [dInvoidDate], [sBiller], [iDeliveryMethod], [fSurcharge], [iPaid], [sState], [iTotal]) VALUES (1, 1, N'Nguyễn Lan', N'0943854535', N'Hà Nội', CAST(N'2020-04-01T00:00:00.000' AS DateTime), N'Tuấn Anh', 1, 20000, 1, NULL, 10000000)
INSERT [dbo].[tblOrder] ([PK_iOrderID], [FK_iAccountID], [sCustomerName], [sCustomerPhone], [sDeliveryAddress], [dInvoidDate], [sBiller], [iDeliveryMethod], [fSurcharge], [iPaid], [sState], [iTotal]) VALUES (2, 2, N'Thu Phương', N'0343253248', N'Hải Dương', CAST(N'2023-04-04T00:00:00.000' AS DateTime), N'Ngọc', 1, 25000, 1, NULL, 10000000)
INSERT [dbo].[tblOrder] ([PK_iOrderID], [FK_iAccountID], [sCustomerName], [sCustomerPhone], [sDeliveryAddress], [dInvoidDate], [sBiller], [iDeliveryMethod], [fSurcharge], [iPaid], [sState], [iTotal]) VALUES (3, 3, N'Đức Dương', N'0346364645', N'Bắc Ninh', CAST(N'2023-04-06T20:11:00.000' AS DateTime), N'Ngọc', 1, 16000, 1, NULL, 10000000)
INSERT [dbo].[tblOrder] ([PK_iOrderID], [FK_iAccountID], [sCustomerName], [sCustomerPhone], [sDeliveryAddress], [dInvoidDate], [sBiller], [iDeliveryMethod], [fSurcharge], [iPaid], [sState], [iTotal]) VALUES (4, 4, N'Thùy Anh', N'0346364645', N'Hà Nội', CAST(N'2023-04-07T00:00:00.000' AS DateTime), N'Ngọc', 0, 16000, 1, NULL, 10000000)
INSERT [dbo].[tblOrder] ([PK_iOrderID], [FK_iAccountID], [sCustomerName], [sCustomerPhone], [sDeliveryAddress], [dInvoidDate], [sBiller], [iDeliveryMethod], [fSurcharge], [iPaid], [sState], [iTotal]) VALUES (5, 1, N'Lan Phương', N'0987656765', N'Hà Nội', CAST(N'2023-04-21T07:28:00.000' AS DateTime), N'Nam', 1, 0, 0, NULL, 10000000)
INSERT [dbo].[tblOrder] ([PK_iOrderID], [FK_iAccountID], [sCustomerName], [sCustomerPhone], [sDeliveryAddress], [dInvoidDate], [sBiller], [iDeliveryMethod], [fSurcharge], [iPaid], [sState], [iTotal]) VALUES (6, 1, N'Khánh', N'0987656765', N'Hà Giang', CAST(N'2023-04-21T07:28:00.000' AS DateTime), N'Nam', 1, 0, 0, NULL, 10000000)
INSERT [dbo].[tblOrder] ([PK_iOrderID], [FK_iAccountID], [sCustomerName], [sCustomerPhone], [sDeliveryAddress], [dInvoidDate], [sBiller], [iDeliveryMethod], [fSurcharge], [iPaid], [sState], [iTotal]) VALUES (7, 1, N'Khánh', N'0987656765', N'Hà Nội', CAST(N'2023-04-21T07:28:00.000' AS DateTime), N'Nam', 1, 0, 1, NULL, 10000000)
INSERT [dbo].[tblOrder] ([PK_iOrderID], [FK_iAccountID], [sCustomerName], [sCustomerPhone], [sDeliveryAddress], [dInvoidDate], [sBiller], [iDeliveryMethod], [fSurcharge], [iPaid], [sState], [iTotal]) VALUES (8, 1, N'Khánh ', N'0987656765', N'Hà Giang', CAST(N'2023-04-21T07:24:00.000' AS DateTime), N'Hùng', 1, 0, 1, NULL, 10000000)
INSERT [dbo].[tblOrder] ([PK_iOrderID], [FK_iAccountID], [sCustomerName], [sCustomerPhone], [sDeliveryAddress], [dInvoidDate], [sBiller], [iDeliveryMethod], [fSurcharge], [iPaid], [sState], [iTotal]) VALUES (10, 1008, N'12', N'3333', N'44444444412121', CAST(N'2023-04-21T16:01:30.997' AS DateTime), N'Linh', 0, 0, 0, N'0', 10000000)
INSERT [dbo].[tblOrder] ([PK_iOrderID], [FK_iAccountID], [sCustomerName], [sCustomerPhone], [sDeliveryAddress], [dInvoidDate], [sBiller], [iDeliveryMethod], [fSurcharge], [iPaid], [sState], [iTotal]) VALUES (11, 1008, N'adasd', N'12131201', N'âbbs', CAST(N'2023-04-21T16:06:16.867' AS DateTime), N'Linh', 1, 0, 0, N'0', 10000000)
INSERT [dbo].[tblOrder] ([PK_iOrderID], [FK_iAccountID], [sCustomerName], [sCustomerPhone], [sDeliveryAddress], [dInvoidDate], [sBiller], [iDeliveryMethod], [fSurcharge], [iPaid], [sState], [iTotal]) VALUES (12, 1008, N'Dat Amazon', N'0985846590', N'123121a', CAST(N'2023-04-21T16:06:42.863' AS DateTime), N'Linh', 0, 0, 0, N'0', 10000000)
INSERT [dbo].[tblOrder] ([PK_iOrderID], [FK_iAccountID], [sCustomerName], [sCustomerPhone], [sDeliveryAddress], [dInvoidDate], [sBiller], [iDeliveryMethod], [fSurcharge], [iPaid], [sState], [iTotal]) VALUES (14, 1008, N'duc tesst', N'121212141', N'duc_test', CAST(N'2023-04-21T16:28:52.457' AS DateTime), N'Linh', 1, 0, 0, N'0', 10000000)
INSERT [dbo].[tblOrder] ([PK_iOrderID], [FK_iAccountID], [sCustomerName], [sCustomerPhone], [sDeliveryAddress], [dInvoidDate], [sBiller], [iDeliveryMethod], [fSurcharge], [iPaid], [sState], [iTotal]) VALUES (15, 1008, N'test 2 ', N'21212121', N'test 2', CAST(N'2023-04-21T16:31:46.063' AS DateTime), N'Linh', 0, 0, 0, N'0', 10000000)
INSERT [dbo].[tblOrder] ([PK_iOrderID], [FK_iAccountID], [sCustomerName], [sCustomerPhone], [sDeliveryAddress], [dInvoidDate], [sBiller], [iDeliveryMethod], [fSurcharge], [iPaid], [sState], [iTotal]) VALUES (16, 1013, N'Nguyễn Tùng Lâm', N')392228502', N'Hà Nộ', CAST(N'2023-04-22T15:26:55.370' AS DateTime), NULL, 1, 0, 0, NULL, 10000000)
INSERT [dbo].[tblOrder] ([PK_iOrderID], [FK_iAccountID], [sCustomerName], [sCustomerPhone], [sDeliveryAddress], [dInvoidDate], [sBiller], [iDeliveryMethod], [fSurcharge], [iPaid], [sState], [iTotal]) VALUES (17, 1013, N'Nguyễn Tùng Lâm', N'0392228502', N'Hà Nội', CAST(N'2023-04-22T15:53:49.723' AS DateTime), N'Dat', NULL, 370000, NULL, N'Đã hủy', 10000000)
INSERT [dbo].[tblOrder] ([PK_iOrderID], [FK_iAccountID], [sCustomerName], [sCustomerPhone], [sDeliveryAddress], [dInvoidDate], [sBiller], [iDeliveryMethod], [fSurcharge], [iPaid], [sState], [iTotal]) VALUES (18, 1013, N'Nguyễn Tùng Lâm', N'12345', N'Hà Nội', CAST(N'2023-04-22T15:58:07.253' AS DateTime), N'Dat', 1, 520000, 0, N'Hoàn thành', 10000000)
INSERT [dbo].[tblOrder] ([PK_iOrderID], [FK_iAccountID], [sCustomerName], [sCustomerPhone], [sDeliveryAddress], [dInvoidDate], [sBiller], [iDeliveryMethod], [fSurcharge], [iPaid], [sState], [iTotal]) VALUES (19, 1013, N'Nguyễn Tùng Lâm 123', N'0392228502', N'Bắc Ninh', CAST(N'2023-04-22T23:13:25.247' AS DateTime), N'Dat', 1, 500000, 0, N'Đã hủy', 10000000)
INSERT [dbo].[tblOrder] ([PK_iOrderID], [FK_iAccountID], [sCustomerName], [sCustomerPhone], [sDeliveryAddress], [dInvoidDate], [sBiller], [iDeliveryMethod], [fSurcharge], [iPaid], [sState], [iTotal]) VALUES (20, 1013, N'Nguyễn Tùng Lâm2222222', N'0392228502', N'Hà Nội', CAST(N'2023-04-22T23:19:52.703' AS DateTime), N'Dat', 1, 800000, 0, N'Đã hủy', 10000000)
INSERT [dbo].[tblOrder] ([PK_iOrderID], [FK_iAccountID], [sCustomerName], [sCustomerPhone], [sDeliveryAddress], [dInvoidDate], [sBiller], [iDeliveryMethod], [fSurcharge], [iPaid], [sState], [iTotal]) VALUES (21, 1015, N'Chử Thành Hai', N'0294965333', N'Hà Nội', CAST(N'2023-04-23T22:08:34.213' AS DateTime), N'Dat', 1, 650000, 0, N'Hoàn thành', 10000000)
INSERT [dbo].[tblOrder] ([PK_iOrderID], [FK_iAccountID], [sCustomerName], [sCustomerPhone], [sDeliveryAddress], [dInvoidDate], [sBiller], [iDeliveryMethod], [fSurcharge], [iPaid], [sState], [iTotal]) VALUES (22, 1015, N'Chử Thành Hai', N'0294965333', N'Hà Nội', CAST(N'2023-04-24T18:27:22.327' AS DateTime), NULL, 1, 300000, 0, N'Chờ xác nhận', 10000000)
INSERT [dbo].[tblOrder] ([PK_iOrderID], [FK_iAccountID], [sCustomerName], [sCustomerPhone], [sDeliveryAddress], [dInvoidDate], [sBiller], [iDeliveryMethod], [fSurcharge], [iPaid], [sState], [iTotal]) VALUES (23, 1015, N'Chử Thành Hai', N'0294965333', N'Hà Nội', CAST(N'2023-04-24T18:30:14.557' AS DateTime), NULL, 1, 70000, 0, N'Chờ xác nhận', 10000000)
INSERT [dbo].[tblOrder] ([PK_iOrderID], [FK_iAccountID], [sCustomerName], [sCustomerPhone], [sDeliveryAddress], [dInvoidDate], [sBiller], [iDeliveryMethod], [fSurcharge], [iPaid], [sState], [iTotal]) VALUES (24, 1015, N'Chử Thành Hai', N'0294965333', N'Hà Nội', CAST(N'2023-04-24T18:30:26.300' AS DateTime), NULL, 1, 70000, 0, N'Chờ xác nhận', 10000000)
INSERT [dbo].[tblOrder] ([PK_iOrderID], [FK_iAccountID], [sCustomerName], [sCustomerPhone], [sDeliveryAddress], [dInvoidDate], [sBiller], [iDeliveryMethod], [fSurcharge], [iPaid], [sState], [iTotal]) VALUES (25, 1015, N'Chử Thành Hai', N'0294965333', N'Hà Nội', CAST(N'2023-04-24T18:30:33.933' AS DateTime), NULL, 1, 200000, 0, N'Chờ xác nhận', 10000000)
INSERT [dbo].[tblOrder] ([PK_iOrderID], [FK_iAccountID], [sCustomerName], [sCustomerPhone], [sDeliveryAddress], [dInvoidDate], [sBiller], [iDeliveryMethod], [fSurcharge], [iPaid], [sState], [iTotal]) VALUES (26, 1015, N'Chử Thành Hai', N'0294965333', N'Hà Nội', CAST(N'2023-04-24T18:30:44.100' AS DateTime), NULL, 1, 160000, 0, N'Chờ xác nhận', 10000000)
INSERT [dbo].[tblOrder] ([PK_iOrderID], [FK_iAccountID], [sCustomerName], [sCustomerPhone], [sDeliveryAddress], [dInvoidDate], [sBiller], [iDeliveryMethod], [fSurcharge], [iPaid], [sState], [iTotal]) VALUES (27, 1015, N'Chử Thành Hai', N'0294965333', N'Hà Nội', CAST(N'2023-04-24T18:45:21.323' AS DateTime), NULL, 1, 70000, 0, N'Chờ xác nhận', 10000000)
SET IDENTITY_INSERT [dbo].[tblOrder] OFF
GO
SET IDENTITY_INSERT [dbo].[tblPermission] ON 

INSERT [dbo].[tblPermission] ([PK_iPermissionID], [sPermissionName], [iState]) VALUES (1, N'Khách hàng', 1)
INSERT [dbo].[tblPermission] ([PK_iPermissionID], [sPermissionName], [iState]) VALUES (2, N'Nhân viên', 1)
INSERT [dbo].[tblPermission] ([PK_iPermissionID], [sPermissionName], [iState]) VALUES (3, N'Quản lý', 1)
INSERT [dbo].[tblPermission] ([PK_iPermissionID], [sPermissionName], [iState]) VALUES (4, N'Hỗ trợ', 1)
INSERT [dbo].[tblPermission] ([PK_iPermissionID], [sPermissionName], [iState]) VALUES (5, N'Ví dụ', 1)
SET IDENTITY_INSERT [dbo].[tblPermission] OFF
GO
SET IDENTITY_INSERT [dbo].[tblProduct] ON 

INSERT [dbo].[tblProduct] ([PK_iProductID], [FK_iCategoryID], [FK_iPromoteID], [sProductName], [sDescribe], [fPrice], [sColor], [sSize], [sImage], [sUnit], [iQuantity]) VALUES (1, 2, 3, N'Bó hoa tulip ', N'Hoa tu lip cầm tay ngày cưới, tặng bạn bè dịp lễ tết, sinh nhật', 350000, NULL, NULL, N'~/Content/assets/images/hoa_len/hoa_tulip1.jpg', N'bó', 99)
INSERT [dbo].[tblProduct] ([PK_iProductID], [FK_iCategoryID], [FK_iPromoteID], [sProductName], [sDescribe], [fPrice], [sColor], [sSize], [sImage], [sUnit], [iQuantity]) VALUES (2, 2, 3, N'Túi hoa hướng dương 1 bông', N'Túi hoa hướng dương cầm tay ngày cưới, tặng bạn bè dịp lễ tết, sinh nhật', 70000, NULL, NULL, N'~/Content/assets/images/hoa_len/huong_duong3.jpg', N'túi', 100)
INSERT [dbo].[tblProduct] ([PK_iProductID], [FK_iCategoryID], [FK_iPromoteID], [sProductName], [sDescribe], [fPrice], [sColor], [sSize], [sImage], [sUnit], [iQuantity]) VALUES (3, 2, 3, N'Bó hoa tử linh lan', N'Hoa tử linh đan cầm tay ngày cưới, tặng bạn bè dịp lễ tết, sinh nhật', 300000, NULL, NULL, N'~/Content/assets/images/hoa_len/tu_linh_lan.jpg', N'bó', 99)
INSERT [dbo].[tblProduct] ([PK_iProductID], [FK_iCategoryID], [FK_iPromoteID], [sProductName], [sDescribe], [fPrice], [sColor], [sSize], [sImage], [sUnit], [iQuantity]) VALUES (4, 2, 3, N'Bó hoa cúc họa mi', N'Hoa tu lip cầm tay ngày cưới, tặng bạn bè dịp lễ tết, sinh nhật', 200000, NULL, NULL, N'~/Content/assets/images/hoa_len/cuc.jpg', N'bó', 100)
INSERT [dbo].[tblProduct] ([PK_iProductID], [FK_iCategoryID], [FK_iPromoteID], [sProductName], [sDescribe], [fPrice], [sColor], [sSize], [sImage], [sUnit], [iQuantity]) VALUES (5, 3, 3, N'Chuột xinh', N'Chuột len làm từ chất liệu len milk cotton 125gr bền đẹp phù hợp với tặng quà, decord, trang trí', 190000, NULL, NULL, N'~/Content/assets/images/thu_bong/chuot_1_2.jpg', N'con', 100)
INSERT [dbo].[tblProduct] ([PK_iProductID], [FK_iCategoryID], [FK_iPromoteID], [sProductName], [sDescribe], [fPrice], [sColor], [sSize], [sImage], [sUnit], [iQuantity]) VALUES (6, 3, 2, N'Mèo mew', N'Bé mèo mew len xinh xắn làm từ chất liệu len milk cotton 125gr bền đẹp phù hợp với tặng quà, decord, trang trí', 220000, NULL, NULL, N'~/Content/assets/images/thu_bong/meo_1_5.jpg', N'con', 100)
INSERT [dbo].[tblProduct] ([PK_iProductID], [FK_iCategoryID], [FK_iPromoteID], [sProductName], [sDescribe], [fPrice], [sColor], [sSize], [sImage], [sUnit], [iQuantity]) VALUES (7, 3, 3, N'Thỏ đeo cà rốt', N'Thỏ đeo cà rốt xinh xắn làm từ chất liệu len milk cotton 125gr bền đẹp phù hợp với tặng quà, decord, trang trí', 200000, NULL, NULL, N'~/Content/assets/images/thu_bong/tho_ca_rot_4.jpg', N'con', 100)
INSERT [dbo].[tblProduct] ([PK_iProductID], [FK_iCategoryID], [FK_iPromoteID], [sProductName], [sDescribe], [fPrice], [sColor], [sSize], [sImage], [sUnit], [iQuantity]) VALUES (8, 4, 3, N'Mũ len nhung', N'Mũ len nhung được móc từ len nhung cho mùa đông ấm áp', 160000, NULL, NULL, N'~/Content/assets/images/mu_len/mua_dong/mu_1_2.jpg', N'chiếc', 100)
INSERT [dbo].[tblProduct] ([PK_iProductID], [FK_iCategoryID], [FK_iPromoteID], [sProductName], [sDescribe], [fPrice], [sColor], [sSize], [sImage], [sUnit], [iQuantity]) VALUES (9, 4, 3, N'Mũ len hoa văn ', N'Mũ len chứa các đường nét hoa văn ngôi sao trong ô vuông độc đáo, được móc từ len yarn cho mùa đông ấm áp', 240000, NULL, NULL, N'~/Content/assets/images/mu_len/mua_dong/mu_2_2.jpg', N'chiếc', 100)
INSERT [dbo].[tblProduct] ([PK_iProductID], [FK_iCategoryID], [FK_iPromoteID], [sProductName], [sDescribe], [fPrice], [sColor], [sSize], [sImage], [sUnit], [iQuantity]) VALUES (10, 4, 3, N'Mũ bé yêu', N'Mũ len cho bé được móc từ len milk nhẹ nhàng, mềm mại, ấm áp, có thêu tên cho bé', 160000, NULL, NULL, N'~/Content/assets/images/mu_len/mua_he/mu_3_3.jpg', N'chiếc', 100)
INSERT [dbo].[tblProduct] ([PK_iProductID], [FK_iCategoryID], [FK_iPromoteID], [sProductName], [sDescribe], [fPrice], [sColor], [sSize], [sImage], [sUnit], [iQuantity]) VALUES (11, 5, 3, N'Khăn màu chuyển', N'Khăn chuyển màu từ xanh sang tìm sang trọng, duy nhất, bền đẹp', 500000, NULL, NULL, N'~/Content/assets/images/khan_len/khan_7_4.png', N'chiếc', 100)
INSERT [dbo].[tblProduct] ([PK_iProductID], [FK_iCategoryID], [FK_iPromoteID], [sProductName], [sDescribe], [fPrice], [sColor], [sSize], [sImage], [sUnit], [iQuantity]) VALUES (12, 5, 3, N'Khăn caro', N'Khăn caro màu cà rốt, móc các ô hoa văn liền kề với len Ý nội địa, cao cấp, bền đẹp', 500000, NULL, NULL, N'~/Content/assets/images/khan_len/khăn_5_1.jpg', N'chiếc', 100)
INSERT [dbo].[tblProduct] ([PK_iProductID], [FK_iCategoryID], [FK_iPromoteID], [sProductName], [sDescribe], [fPrice], [sColor], [sSize], [sImage], [sUnit], [iQuantity]) VALUES (13, 5, 3, N'Khăn cổ điển', N'Khăn mang phong cách dài, có dây tua ở 2 đầu, mang đạm tính cổ điển, sang trọng, phù hợp mọi lứa tuổi', 500000, NULL, NULL, N'~/Content/assets/images/khan_len/khan1.jpg', N'chiếc', 100)
INSERT [dbo].[tblProduct] ([PK_iProductID], [FK_iCategoryID], [FK_iPromoteID], [sProductName], [sDescribe], [fPrice], [sColor], [sSize], [sImage], [sUnit], [iQuantity]) VALUES (14, 7, 3, N'Túi vàng Christian Dior', N'Túi vàng Christian Dior được móc từ sợi dệt, chắc chắn, sang trọng', 1500000, NULL, NULL, N'~/Content/assets/images/tui_xach/tui_2_3.jpg', N'chiếc', 100)
INSERT [dbo].[tblProduct] ([PK_iProductID], [FK_iCategoryID], [FK_iPromoteID], [sProductName], [sDescribe], [fPrice], [sColor], [sSize], [sImage], [sUnit], [iQuantity]) VALUES (17, 7, 3, N'Túi Christian Dior chéo cánh', N'Túi Christian Dior chéo cánh được móc từ sợi dệt, chắc chắn, sang trọng', 1500000, NULL, NULL, N'~/Content/assets/images/tui_xach/tui_3_2.jpg', N'chiếc', 100)
INSERT [dbo].[tblProduct] ([PK_iProductID], [FK_iCategoryID], [FK_iPromoteID], [sProductName], [sDescribe], [fPrice], [sColor], [sSize], [sImage], [sUnit], [iQuantity]) VALUES (18, 7, 3, N'Túi & mũ', N'Bộ đôi kết hợp túi và mũ sang trọng', 2500000, NULL, NULL, N'~/Content/assets/images/tui_xach/tui_9_2.jpg', N'chiếc', 100)
INSERT [dbo].[tblProduct] ([PK_iProductID], [FK_iCategoryID], [FK_iPromoteID], [sProductName], [sDescribe], [fPrice], [sColor], [sSize], [sImage], [sUnit], [iQuantity]) VALUES (19, 8, 3, N'Bộ váy & áo vàng', N'Bộ đôi kết hợp giữ váy và áo vàng  đẹp đẽ, nhẹ nhàng, sang trọng', 1500000, NULL, NULL, N'~/Content/assets/images/vay_len/vay_1_0.jpg', N'chiếc', 100)
INSERT [dbo].[tblProduct] ([PK_iProductID], [FK_iCategoryID], [FK_iPromoteID], [sProductName], [sDescribe], [fPrice], [sColor], [sSize], [sImage], [sUnit], [iQuantity]) VALUES (20, 8, 3, N'Váy trắng cho trẻ sơ sinh', N'Váy trắng cho trẻ sơ sinh mềm mại, mịn màng, sang trọng', 600000, NULL, NULL, N'~/Content/assets/images/vay_len/vay_2_4.jpg', N'chiếc', 100)
INSERT [dbo].[tblProduct] ([PK_iProductID], [FK_iCategoryID], [FK_iPromoteID], [sProductName], [sDescribe], [fPrice], [sColor], [sSize], [sImage], [sUnit], [iQuantity]) VALUES (21, 8, 3, N'Đầm dự tiệc', N'Đầm sang trọng, mềm mại, uyển chuyển, cuốn hút cho người mặc', 200000, NULL, NULL, N'~/Content/assets/images/vay_len/vay_3_1.jpg', N'chiếc', 100)
INSERT [dbo].[tblProduct] ([PK_iProductID], [FK_iCategoryID], [FK_iPromoteID], [sProductName], [sDescribe], [fPrice], [sColor], [sSize], [sImage], [sUnit], [iQuantity]) VALUES (23, 2, 1, N'Hoa thú', N'Hoa hình đầu thú, ngộ nghĩnh đáng yêu', 300000, NULL, NULL, N'~/Content/assets/images/vay_len/vay_3_1.jpg', N'bó', 100)
INSERT [dbo].[tblProduct] ([PK_iProductID], [FK_iCategoryID], [FK_iPromoteID], [sProductName], [sDescribe], [fPrice], [sColor], [sSize], [sImage], [sUnit], [iQuantity]) VALUES (24, 2, 1, N'Hoa thú', N'Hoa hình đầu thú, ngộ nghĩnh đáng yêu', 300000, NULL, NULL, N'/Data/cung xiu (2).jpg', N'bó', 100)
INSERT [dbo].[tblProduct] ([PK_iProductID], [FK_iCategoryID], [FK_iPromoteID], [sProductName], [sDescribe], [fPrice], [sColor], [sSize], [sImage], [sUnit], [iQuantity]) VALUES (25, 1, 1, N'Hoa thú', N'Hoa hình đầu thú, ngộ nghĩnh đáng yêu', 300000, NULL, NULL, N'~/Content/assets/images/vay_len/vay_3_1.jpg', N'bó', 100)
INSERT [dbo].[tblProduct] ([PK_iProductID], [FK_iCategoryID], [FK_iPromoteID], [sProductName], [sDescribe], [fPrice], [sColor], [sSize], [sImage], [sUnit], [iQuantity]) VALUES (26, 1, 1, N'Hoa thú', N'Hoa hình đầu thú, ngộ nghĩnh đáng yêu', 300000, NULL, NULL, N'/Data/Compare-rabbit.PNG', N'bó', 100)
INSERT [dbo].[tblProduct] ([PK_iProductID], [FK_iCategoryID], [FK_iPromoteID], [sProductName], [sDescribe], [fPrice], [sColor], [sSize], [sImage], [sUnit], [iQuantity]) VALUES (27, 2, 1, N'Hoa thú', N'Hoa hình đầu thú, ngộ nghĩnh đáng yêu', 300000, NULL, NULL, N'/Data/Quang thuong Cun va tho.jpg', N'bó', 100)
INSERT [dbo].[tblProduct] ([PK_iProductID], [FK_iCategoryID], [FK_iPromoteID], [sProductName], [sDescribe], [fPrice], [sColor], [sSize], [sImage], [sUnit], [iQuantity]) VALUES (28, 1, 1, N'Hoa thú', N'Hoa hình đầu thú, ngộ nghĩnh đáng yêu', 300000, NULL, NULL, N'/Data/cun bung bu (2).jpg', N'bó', 100)
INSERT [dbo].[tblProduct] ([PK_iProductID], [FK_iCategoryID], [FK_iPromoteID], [sProductName], [sDescribe], [fPrice], [sColor], [sSize], [sImage], [sUnit], [iQuantity]) VALUES (29, 2, 1, N'Hoa thú', N'Hoa hình đầu thú, ngộ nghĩnh đáng yêu', 300000, NULL, NULL, N'/Data/298537342_1130943717508780_1864141632125916945_n.jpg', N'bó', 100)
SET IDENTITY_INSERT [dbo].[tblProduct] OFF
GO
SET IDENTITY_INSERT [dbo].[tblProductColor] ON 

INSERT [dbo].[tblProductColor] ([PK_iProductColorID], [FK_iProductID], [sProductColor]) VALUES (1, 1, N'Đỏ')
INSERT [dbo].[tblProductColor] ([PK_iProductColorID], [FK_iProductID], [sProductColor]) VALUES (2, 1, N'Xanh')
INSERT [dbo].[tblProductColor] ([PK_iProductColorID], [FK_iProductID], [sProductColor]) VALUES (3, 1, N'Vàng')
INSERT [dbo].[tblProductColor] ([PK_iProductColorID], [FK_iProductID], [sProductColor]) VALUES (4, 2, N'Đỏ')
INSERT [dbo].[tblProductColor] ([PK_iProductColorID], [FK_iProductID], [sProductColor]) VALUES (5, 2, N'Xanh')
INSERT [dbo].[tblProductColor] ([PK_iProductColorID], [FK_iProductID], [sProductColor]) VALUES (6, 2, N'Vàng')
INSERT [dbo].[tblProductColor] ([PK_iProductColorID], [FK_iProductID], [sProductColor]) VALUES (7, 3, N'Đỏ')
INSERT [dbo].[tblProductColor] ([PK_iProductColorID], [FK_iProductID], [sProductColor]) VALUES (8, 3, N'Xanh')
INSERT [dbo].[tblProductColor] ([PK_iProductColorID], [FK_iProductID], [sProductColor]) VALUES (9, 3, N'Vàng')
INSERT [dbo].[tblProductColor] ([PK_iProductColorID], [FK_iProductID], [sProductColor]) VALUES (10, 10, N'Đỏ')
SET IDENTITY_INSERT [dbo].[tblProductColor] OFF
GO
SET IDENTITY_INSERT [dbo].[tblProductPrice] ON 

INSERT [dbo].[tblProductPrice] ([PK_iProductPriceID], [FK_iProductID], [fPrice], [dtStartDay], [dtEndDay]) VALUES (1, 1, 200000, NULL, NULL)
INSERT [dbo].[tblProductPrice] ([PK_iProductPriceID], [FK_iProductID], [fPrice], [dtStartDay], [dtEndDay]) VALUES (2, 1, 300000, NULL, NULL)
INSERT [dbo].[tblProductPrice] ([PK_iProductPriceID], [FK_iProductID], [fPrice], [dtStartDay], [dtEndDay]) VALUES (3, 1, 400000, NULL, NULL)
INSERT [dbo].[tblProductPrice] ([PK_iProductPriceID], [FK_iProductID], [fPrice], [dtStartDay], [dtEndDay]) VALUES (4, 1, 250000, NULL, NULL)
SET IDENTITY_INSERT [dbo].[tblProductPrice] OFF
GO
SET IDENTITY_INSERT [dbo].[tblProductSize] ON 

INSERT [dbo].[tblProductSize] ([PK_iProductSizeID], [FK_iProductID], [sSizeName]) VALUES (1, 1, N'Nhỏ')
INSERT [dbo].[tblProductSize] ([PK_iProductSizeID], [FK_iProductID], [sSizeName]) VALUES (2, 1, N'Vừa')
INSERT [dbo].[tblProductSize] ([PK_iProductSizeID], [FK_iProductID], [sSizeName]) VALUES (3, 1, N'To')
INSERT [dbo].[tblProductSize] ([PK_iProductSizeID], [FK_iProductID], [sSizeName]) VALUES (4, 2, N'Nhỏ')
INSERT [dbo].[tblProductSize] ([PK_iProductSizeID], [FK_iProductID], [sSizeName]) VALUES (5, 2, N'Vừa')
INSERT [dbo].[tblProductSize] ([PK_iProductSizeID], [FK_iProductID], [sSizeName]) VALUES (6, 2, N'To')
SET IDENTITY_INSERT [dbo].[tblProductSize] OFF
GO
SET IDENTITY_INSERT [dbo].[tblPromote] ON 

INSERT [dbo].[tblPromote] ([PK_iPromoteID], [sPromoteName], [sPromoteRate], [dtStartDay], [dtEndDay]) VALUES (1, N'Không', 0, CAST(N'2023-02-24T21:30:00.000' AS DateTime), CAST(N'2023-02-24T21:30:00.000' AS DateTime))
INSERT [dbo].[tblPromote] ([PK_iPromoteID], [sPromoteName], [sPromoteRate], [dtStartDay], [dtEndDay]) VALUES (2, N'Ngày 08/03', 20, CAST(N'2023-04-21T08:44:00.000' AS DateTime), CAST(N'2023-04-21T08:44:00.000' AS DateTime))
INSERT [dbo].[tblPromote] ([PK_iPromoteID], [sPromoteName], [sPromoteRate], [dtStartDay], [dtEndDay]) VALUES (3, N'Chào tháng 4', 10, CAST(N'2023-04-01T00:00:00.000' AS DateTime), CAST(N'2023-04-10T00:00:00.000' AS DateTime))
INSERT [dbo].[tblPromote] ([PK_iPromoteID], [sPromoteName], [sPromoteRate], [dtStartDay], [dtEndDay]) VALUES (4, N'Ngày giáng sinh', 10, CAST(N'2023-12-20T00:00:00.000' AS DateTime), CAST(N'2023-12-29T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[tblPromote] OFF
GO
SET IDENTITY_INSERT [dbo].[tblReview] ON 

INSERT [dbo].[tblReview] ([PK_iReviewID], [FK_iProductID], [FK_iAccountID], [iStarRating], [dtReviewTime]) VALUES (1, 1, 1, 5, CAST(N'2023-04-20T20:43:00.000' AS DateTime))
INSERT [dbo].[tblReview] ([PK_iReviewID], [FK_iProductID], [FK_iAccountID], [iStarRating], [dtReviewTime]) VALUES (2, 1, 2, 5, CAST(N'2023-04-20T20:44:00.000' AS DateTime))
INSERT [dbo].[tblReview] ([PK_iReviewID], [FK_iProductID], [FK_iAccountID], [iStarRating], [dtReviewTime]) VALUES (3, 1, 3, 4, CAST(N'2023-04-20T20:44:00.000' AS DateTime))
INSERT [dbo].[tblReview] ([PK_iReviewID], [FK_iProductID], [FK_iAccountID], [iStarRating], [dtReviewTime]) VALUES (5, 2, 1, 4, CAST(N'2023-04-20T20:44:00.000' AS DateTime))
INSERT [dbo].[tblReview] ([PK_iReviewID], [FK_iProductID], [FK_iAccountID], [iStarRating], [dtReviewTime]) VALUES (6, 2, 2, 5, CAST(N'2023-04-20T20:44:00.000' AS DateTime))
INSERT [dbo].[tblReview] ([PK_iReviewID], [FK_iProductID], [FK_iAccountID], [iStarRating], [dtReviewTime]) VALUES (7, 2, 3, 5, CAST(N'2023-04-20T20:44:00.000' AS DateTime))
INSERT [dbo].[tblReview] ([PK_iReviewID], [FK_iProductID], [FK_iAccountID], [iStarRating], [dtReviewTime]) VALUES (9, 3, 1, 4, CAST(N'2023-04-20T20:44:00.000' AS DateTime))
INSERT [dbo].[tblReview] ([PK_iReviewID], [FK_iProductID], [FK_iAccountID], [iStarRating], [dtReviewTime]) VALUES (10, 3, 2, 5, CAST(N'2023-04-20T20:44:00.000' AS DateTime))
INSERT [dbo].[tblReview] ([PK_iReviewID], [FK_iProductID], [FK_iAccountID], [iStarRating], [dtReviewTime]) VALUES (11, 3, 3, 5, CAST(N'2023-04-20T20:44:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[tblReview] OFF
GO
SET IDENTITY_INSERT [dbo].[tblSupplier] ON 

INSERT [dbo].[tblSupplier] ([PK_iSupplierID], [sSupplierName], [sPhone], [sEmail], [sAddress]) VALUES (1, N'Tiệm nhỏ Xíu', N'0984534534', N'thuy@gmail.com', N'Đà Nẵng')
INSERT [dbo].[tblSupplier] ([PK_iSupplierID], [sSupplierName], [sPhone], [sEmail], [sAddress]) VALUES (2, N'Nhật Linh Handmade', N'0985433453', N'linh@gmail.com', N'Hà Nội')
INSERT [dbo].[tblSupplier] ([PK_iSupplierID], [sSupplierName], [sPhone], [sEmail], [sAddress]) VALUES (3, N'Nana Handmade', N'0453954383', N'na@gmail.com', N'Bắc Ninh')
INSERT [dbo].[tblSupplier] ([PK_iSupplierID], [sSupplierName], [sPhone], [sEmail], [sAddress]) VALUES (4, N'Pitachan', N'0845345435', N'pitachan@gmail.com', N'Bắc Giang')
INSERT [dbo].[tblSupplier] ([PK_iSupplierID], [sSupplierName], [sPhone], [sEmail], [sAddress]) VALUES (5, N'Haichen crochet', N'0945353534', N'chan@gmail.com', N'Hà Nam')
INSERT [dbo].[tblSupplier] ([PK_iSupplierID], [sSupplierName], [sPhone], [sEmail], [sAddress]) VALUES (6, N'Rabit crochet', N'0945435345', N'rbt@gmail.com', N'Hà Giang')
INSERT [dbo].[tblSupplier] ([PK_iSupplierID], [sSupplierName], [sPhone], [sEmail], [sAddress]) VALUES (7, N'Hoàng Hà handmade', N'0978567569', N'hoangha@gmail.com', N'Hà Nam')
SET IDENTITY_INSERT [dbo].[tblSupplier] OFF
GO
SET IDENTITY_INSERT [dbo].[tblUser] ON 

INSERT [dbo].[tblUser] ([PK_iAccountID], [FK_iPermissionID], [sEmail], [sPass], [sUserName], [sPhone], [sAddress], [iState]) VALUES (1, 1, N'kh1@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'Hoa', N'0985679546', N'Hà Nội', NULL)
INSERT [dbo].[tblUser] ([PK_iAccountID], [FK_iPermissionID], [sEmail], [sPass], [sUserName], [sPhone], [sAddress], [iState]) VALUES (2, 1, N'kh2@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'Lan', N'0983245678', N'Thái Bình', NULL)
INSERT [dbo].[tblUser] ([PK_iAccountID], [FK_iPermissionID], [sEmail], [sPass], [sUserName], [sPhone], [sAddress], [iState]) VALUES (3, 1, N'kh3@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'Hương', N'0169544534', N'Bắc Ninh', NULL)
INSERT [dbo].[tblUser] ([PK_iAccountID], [FK_iPermissionID], [sEmail], [sPass], [sUserName], [sPhone], [sAddress], [iState]) VALUES (4, 1, N'kh4@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'Tuấn', N'0756834535', N'Hà Nội', NULL)
INSERT [dbo].[tblUser] ([PK_iAccountID], [FK_iPermissionID], [sEmail], [sPass], [sUserName], [sPhone], [sAddress], [iState]) VALUES (5, 2, N'nv@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'Ngọc', N'0914567543', N'Hà Nam', NULL)
INSERT [dbo].[tblUser] ([PK_iAccountID], [FK_iPermissionID], [sEmail], [sPass], [sUserName], [sPhone], [sAddress], [iState]) VALUES (6, 2, N'nv1@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'Thương', N'0965456321', N'Nam Định', NULL)
INSERT [dbo].[tblUser] ([PK_iAccountID], [FK_iPermissionID], [sEmail], [sPass], [sUserName], [sPhone], [sAddress], [iState]) VALUES (8, 2, N'dat@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'Đạt', N'0988567468', N'Hà Nội', NULL)
INSERT [dbo].[tblUser] ([PK_iAccountID], [FK_iPermissionID], [sEmail], [sPass], [sUserName], [sPhone], [sAddress], [iState]) VALUES (1008, 5, N'kieuducdat2k@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'Đạt', N'0943854535', N'Hà Nội', NULL)
INSERT [dbo].[tblUser] ([PK_iAccountID], [FK_iPermissionID], [sEmail], [sPass], [sUserName], [sPhone], [sAddress], [iState]) VALUES (1010, 3, N'admin@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'Dat', N'0978567569', N'Hà Nội', NULL)
INSERT [dbo].[tblUser] ([PK_iAccountID], [FK_iPermissionID], [sEmail], [sPass], [sUserName], [sPhone], [sAddress], [iState]) VALUES (1011, 1, N'18a10010175@students.hou.edu.vn', N'c4ca4238a0b923820dcc509a6f75849b', N'Dat', N'0978567569', N'Bến Tre', NULL)
INSERT [dbo].[tblUser] ([PK_iAccountID], [FK_iPermissionID], [sEmail], [sPass], [sUserName], [sPhone], [sAddress], [iState]) VALUES (1012, 1, N'thu@gmail.com', N'c4ca4238a0b923820dcc509a6f75849b', N'Dat', N'0978567569', N'Bến Tre', NULL)
INSERT [dbo].[tblUser] ([PK_iAccountID], [FK_iPermissionID], [sEmail], [sPass], [sUserName], [sPhone], [sAddress], [iState]) VALUES (1013, 1, N'lamnhi@gmail.com', N'c81e728d9d4c2f636f067f89cc14862c', N'Nguyễn Tùng Lâm', N'0392228502', N'Hà Nội', NULL)
INSERT [dbo].[tblUser] ([PK_iAccountID], [FK_iPermissionID], [sEmail], [sPass], [sUserName], [sPhone], [sAddress], [iState]) VALUES (1014, 2, N'nguyentunglam@gmail.com', N'c4ca4238a0b923820dcc509a6f75849b', N'Nguyễn Tùng Lâm', N'0392228502', N'Hà Nội', NULL)
INSERT [dbo].[tblUser] ([PK_iAccountID], [FK_iPermissionID], [sEmail], [sPass], [sUserName], [sPhone], [sAddress], [iState]) VALUES (1015, 1, N'hai@gmail.com', N'c4ca4238a0b923820dcc509a6f75849b', N'Chử Thành Hai', N'0294965333', N'Hà Nội', NULL)
SET IDENTITY_INSERT [dbo].[tblUser] OFF
GO
ALTER TABLE [dbo].[tblCheckinDetail]  WITH CHECK ADD  CONSTRAINT [fk_checkinDetail_importOrder] FOREIGN KEY([FK_iImportOrderID])
REFERENCES [dbo].[tblImportOrder] ([PK_iImportOrderID])
GO
ALTER TABLE [dbo].[tblCheckinDetail] CHECK CONSTRAINT [fk_checkinDetail_importOrder]
GO
ALTER TABLE [dbo].[tblCheckinDetail]  WITH CHECK ADD  CONSTRAINT [fk_checkinDetail_product] FOREIGN KEY([FK_iProductID])
REFERENCES [dbo].[tblProduct] ([PK_iProductID])
GO
ALTER TABLE [dbo].[tblCheckinDetail] CHECK CONSTRAINT [fk_checkinDetail_product]
GO
ALTER TABLE [dbo].[tblCheckoutDetail]  WITH CHECK ADD  CONSTRAINT [fk_checkoutDetail_order] FOREIGN KEY([FK_iOrderID])
REFERENCES [dbo].[tblOrder] ([PK_iOrderID])
GO
ALTER TABLE [dbo].[tblCheckoutDetail] CHECK CONSTRAINT [fk_checkoutDetail_order]
GO
ALTER TABLE [dbo].[tblCheckoutDetail]  WITH CHECK ADD  CONSTRAINT [fk_checkoutDetail_product] FOREIGN KEY([FK_iProductID])
REFERENCES [dbo].[tblProduct] ([PK_iProductID])
GO
ALTER TABLE [dbo].[tblCheckoutDetail] CHECK CONSTRAINT [fk_checkoutDetail_product]
GO
ALTER TABLE [dbo].[tblImage]  WITH CHECK ADD  CONSTRAINT [fk_img_product] FOREIGN KEY([FK_iProductID])
REFERENCES [dbo].[tblProduct] ([PK_iProductID])
GO
ALTER TABLE [dbo].[tblImage] CHECK CONSTRAINT [fk_img_product]
GO
ALTER TABLE [dbo].[tblImportMaterial]  WITH CHECK ADD  CONSTRAINT [FK_tblImportMaterial_tblImportOrder] FOREIGN KEY([FK_iImportOrderID])
REFERENCES [dbo].[tblImportOrder] ([PK_iImportOrderID])
GO
ALTER TABLE [dbo].[tblImportMaterial] CHECK CONSTRAINT [FK_tblImportMaterial_tblImportOrder]
GO
ALTER TABLE [dbo].[tblImportMaterial]  WITH CHECK ADD  CONSTRAINT [FK_tblImportMaterial_tblMaterial] FOREIGN KEY([FK_iMaterialID])
REFERENCES [dbo].[tblMaterial] ([PK_iMaterialID])
GO
ALTER TABLE [dbo].[tblImportMaterial] CHECK CONSTRAINT [FK_tblImportMaterial_tblMaterial]
GO
ALTER TABLE [dbo].[tblImportOrder]  WITH CHECK ADD  CONSTRAINT [fk_importOrder_account] FOREIGN KEY([FK_iAccountID])
REFERENCES [dbo].[tblUser] ([PK_iAccountID])
GO
ALTER TABLE [dbo].[tblImportOrder] CHECK CONSTRAINT [fk_importOrder_account]
GO
ALTER TABLE [dbo].[tblImportOrder]  WITH CHECK ADD  CONSTRAINT [fk_importOrder_supplier] FOREIGN KEY([FK_iSupplierID])
REFERENCES [dbo].[tblSupplier] ([PK_iSupplierID])
GO
ALTER TABLE [dbo].[tblImportOrder] CHECK CONSTRAINT [fk_importOrder_supplier]
GO
ALTER TABLE [dbo].[tblMaterColor]  WITH CHECK ADD  CONSTRAINT [FK_tblMaterColor_tblMaterial] FOREIGN KEY([FK_iMaterialID])
REFERENCES [dbo].[tblMaterial] ([PK_iMaterialID])
GO
ALTER TABLE [dbo].[tblMaterColor] CHECK CONSTRAINT [FK_tblMaterColor_tblMaterial]
GO
ALTER TABLE [dbo].[tblMaterPriceImport]  WITH CHECK ADD  CONSTRAINT [FK_tblMaterPriceImport_tblMaterial] FOREIGN KEY([FK_iMaterialID])
REFERENCES [dbo].[tblMaterial] ([PK_iMaterialID])
GO
ALTER TABLE [dbo].[tblMaterPriceImport] CHECK CONSTRAINT [FK_tblMaterPriceImport_tblMaterial]
GO
ALTER TABLE [dbo].[tblMaterSize]  WITH CHECK ADD  CONSTRAINT [FK_tblMaterSize_tblMaterial] FOREIGN KEY([FK_iMaterialID])
REFERENCES [dbo].[tblMaterial] ([PK_iMaterialID])
GO
ALTER TABLE [dbo].[tblMaterSize] CHECK CONSTRAINT [FK_tblMaterSize_tblMaterial]
GO
ALTER TABLE [dbo].[tblOrder]  WITH CHECK ADD  CONSTRAINT [fk_order_account] FOREIGN KEY([FK_iAccountID])
REFERENCES [dbo].[tblUser] ([PK_iAccountID])
GO
ALTER TABLE [dbo].[tblOrder] CHECK CONSTRAINT [fk_order_account]
GO
ALTER TABLE [dbo].[tblProduct]  WITH CHECK ADD  CONSTRAINT [fk_product_category] FOREIGN KEY([FK_iCategoryID])
REFERENCES [dbo].[tblCategory] ([PK_iCategoryID])
GO
ALTER TABLE [dbo].[tblProduct] CHECK CONSTRAINT [fk_product_category]
GO
ALTER TABLE [dbo].[tblProduct]  WITH CHECK ADD  CONSTRAINT [fk_product_promote] FOREIGN KEY([FK_iPromoteID])
REFERENCES [dbo].[tblPromote] ([PK_iPromoteID])
GO
ALTER TABLE [dbo].[tblProduct] CHECK CONSTRAINT [fk_product_promote]
GO
ALTER TABLE [dbo].[tblProductColor]  WITH CHECK ADD  CONSTRAINT [FK_tblProductColor_tblProduct] FOREIGN KEY([FK_iProductID])
REFERENCES [dbo].[tblProduct] ([PK_iProductID])
GO
ALTER TABLE [dbo].[tblProductColor] CHECK CONSTRAINT [FK_tblProductColor_tblProduct]
GO
ALTER TABLE [dbo].[tblProductPrice]  WITH CHECK ADD  CONSTRAINT [FK_tblProductPrice_tblProduct] FOREIGN KEY([FK_iProductID])
REFERENCES [dbo].[tblProduct] ([PK_iProductID])
GO
ALTER TABLE [dbo].[tblProductPrice] CHECK CONSTRAINT [FK_tblProductPrice_tblProduct]
GO
ALTER TABLE [dbo].[tblProductSize]  WITH CHECK ADD  CONSTRAINT [FK_tblProductSize_tblProduct] FOREIGN KEY([FK_iProductID])
REFERENCES [dbo].[tblProduct] ([PK_iProductID])
GO
ALTER TABLE [dbo].[tblProductSize] CHECK CONSTRAINT [FK_tblProductSize_tblProduct]
GO
ALTER TABLE [dbo].[tblReview]  WITH CHECK ADD  CONSTRAINT [fk_review_account] FOREIGN KEY([FK_iAccountID])
REFERENCES [dbo].[tblUser] ([PK_iAccountID])
GO
ALTER TABLE [dbo].[tblReview] CHECK CONSTRAINT [fk_review_account]
GO
ALTER TABLE [dbo].[tblReview]  WITH CHECK ADD  CONSTRAINT [fk_review_product] FOREIGN KEY([FK_iProductID])
REFERENCES [dbo].[tblProduct] ([PK_iProductID])
GO
ALTER TABLE [dbo].[tblReview] CHECK CONSTRAINT [fk_review_product]
GO
ALTER TABLE [dbo].[tblUser]  WITH CHECK ADD  CONSTRAINT [fk_user_permission] FOREIGN KEY([FK_iPermissionID])
REFERENCES [dbo].[tblPermission] ([PK_iPermissionID])
GO
ALTER TABLE [dbo].[tblUser] CHECK CONSTRAINT [fk_user_permission]
GO
/****** Object:  StoredProcedure [dbo].[pro_getCategory]    Script Date: 5/26/2023 10:20:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Get category name display on Product
create proc [dbo].[pro_getCategory]
as
begin
	select * from tblCategory
end
GO
/****** Object:  StoredProcedure [dbo].[pro_getProduct]    Script Date: 5/26/2023 10:20:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[pro_getProduct] 
as
begin
	select * from tblProduct
end
GO
/****** Object:  StoredProcedure [dbo].[pro_getPromote]    Script Date: 5/26/2023 10:20:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Get promote name display on Product
create proc [dbo].[pro_getPromote]
as
begin
	select * from tblPromote
end
GO
/****** Object:  StoredProcedure [dbo].[pro_getReceiver]    Script Date: 5/26/2023 10:20:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[pro_getReceiver]
as
begin
	select PK_iAccountID,sUserName from tblUser
	where FK_iPermissionID = 2
end
GO
/****** Object:  StoredProcedure [dbo].[pro_getSupplier]    Script Date: 5/26/2023 10:20:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[pro_getSupplier]

as
begin
	select * from tblSupplier
end
GO
/****** Object:  StoredProcedure [dbo].[proAddCategory]    Script Date: 5/26/2023 10:20:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[proAddCategory]
@sCategoryName nvarchar(40)
as
begin
	insert into tblCategory values(@sCategoryName)
end
GO
/****** Object:  StoredProcedure [dbo].[proAddCheckoutDetail]    Script Date: 5/26/2023 10:20:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[proAddCheckoutDetail]
@FK_iOrderID int,
@FK_iProductID int,
@iQuantity int,
@iTotalMoney int
as
begin
	insert into tblCheckoutDetail values(@FK_iOrderID, @FK_iProductID, @iQuantity, @iTotalMoney)
end
GO
/****** Object:  StoredProcedure [dbo].[proAddPermission]    Script Date: 5/26/2023 10:20:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[proAddPermission]
@sPermissionName nvarchar(50),
@iState int
as
begin
	insert into tblPermission values(@sPermissionName, @iState)
end
GO
/****** Object:  StoredProcedure [dbo].[proAddPromote]    Script Date: 5/26/2023 10:20:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[proAddPromote]
@sPromoteName nvarchar(100),
@sPromoteRate float,
@dtStartDay datetime,
@dtEndDay datetime
as
begin
	insert into tblPromote values(@sPromoteName, @sPromoteRate, @dtStartDay, @dtEndDay)
end
GO
/****** Object:  StoredProcedure [dbo].[proAddReview]    Script Date: 5/26/2023 10:20:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[proAddReview]
@FK_iProductID int,
@FK_iAccountID int,
@iStarRating int,
@dtReviewTime datetime
as
begin
	insert into tblReview values(@FK_iProductID, @FK_iAccountID, @iStarRating, @dtReviewTime)
end
GO
/****** Object:  StoredProcedure [dbo].[proAddSupplier]    Script Date: 5/26/2023 10:20:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[proAddSupplier]
@sSupplierName nvarchar(50),
@sPhone varchar(12),
@sEmail varchar(50),
@sAddress nvarchar(250)
as
begin
	insert into tblSupplier values(@sSupplierName, @sPhone, @sEmail, @sAddress)
end
GO
/****** Object:  StoredProcedure [dbo].[proAddUser]    Script Date: 5/26/2023 10:20:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[proAddUser]
@FK_iPermissionID int,
@sEmail varchar(50),
@sPass nvarchar(50),
@sUserName nvarchar(50),
@sPhone varchar(12),
@sAddress nvarchar(200),
@iState int
as
begin
	insert into tblUser values(@FK_iPermissionID, @sEmail, @sPass, @sUserName, @sPhone, @sAddress, @iState)
end
GO
/****** Object:  StoredProcedure [dbo].[procSelectCheckinDeatailrByID]    Script Date: 5/26/2023 10:20:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[procSelectCheckinDeatailrByID]--select checkin detail by ID
@PK_iCheckinDetailID int
as
begin
	select * from tblCheckinDetail
	where PK_iCheckinDetailID = @PK_iCheckinDetailID
end
GO
/****** Object:  StoredProcedure [dbo].[procSelectImageByID]    Script Date: 5/26/2023 10:20:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[procSelectImageByID]--select image for ID
@PK_iImageID int
as
begin
	select * from tblImage
	where PK_iImageID = @PK_iImageID
end
GO
/****** Object:  StoredProcedure [dbo].[procSelectImportOrderByID]    Script Date: 5/26/2023 10:20:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[procSelectImportOrderByID]--select user for ID
@PK_iImportOrderID int
as
begin
	select * from tblImportOrder
	where PK_iImportOrderID = @PK_iImportOrderID
end
GO
/****** Object:  StoredProcedure [dbo].[procSelectUserByID]    Script Date: 5/26/2023 10:20:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[procSelectUserByID]--select user for ID
@PK_iAccountID int
as
begin
	select * from tblUser
	where PK_iAccountID = @PK_iAccountID
end
GO
/****** Object:  StoredProcedure [dbo].[proDeleteCategory]    Script Date: 5/26/2023 10:20:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[proDeleteCategory]
@sCategoryID int
as
begin
	delete from tblCategory 
	where PK_iCategoryID = @sCategoryID
end
GO
/****** Object:  StoredProcedure [dbo].[proDeleteCheckinDetail]    Script Date: 5/26/2023 10:20:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[proDeleteCheckinDetail]
@PK_iCheckinDetailID int
as
begin
	delete from tblCheckinDetail 
	where PK_iCheckinDetailID = @PK_iCheckinDetailID
end
GO
/****** Object:  StoredProcedure [dbo].[proDeleteCheckoutDetail]    Script Date: 5/26/2023 10:20:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[proDeleteCheckoutDetail]
@PK_iCheckoutDetailID int
as
begin
	delete from tblCheckoutDetail 
	where PK_iCheckoutDetailID = @PK_iCheckoutDetailID
end
GO
/****** Object:  StoredProcedure [dbo].[proDeleteImage]    Script Date: 5/26/2023 10:20:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[proDeleteImage]
@PK_iImageID int
as
begin
	delete from tblImage 
	where PK_iImageID = @PK_iImageID
end
GO
/****** Object:  StoredProcedure [dbo].[proDeleteImportOrder]    Script Date: 5/26/2023 10:20:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[proDeleteImportOrder]
@PK_iImportOrderID int
as
begin
	delete from tblImportOrder 
	where PK_iImportOrderID = @PK_iImportOrderID
end
GO
/****** Object:  StoredProcedure [dbo].[proDeleteOrder]    Script Date: 5/26/2023 10:20:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[proDeleteOrder]
@PK_iOrderID int
as
begin
	delete from tblOrder
	where PK_iOrderID = @PK_iOrderID
end
GO
/****** Object:  StoredProcedure [dbo].[proDeletePermission]    Script Date: 5/26/2023 10:20:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[proDeletePermission]
@PK_iPermissionID int
as
begin
	delete from tblPermission 
	where @PK_iPermissionID = PK_iPermissionID
end
GO
/****** Object:  StoredProcedure [dbo].[proDeleteProduct]    Script Date: 5/26/2023 10:20:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[proDeleteProduct]
@PK_iProductID int
as
begin
	delete from tblProduct 
	where PK_iProductID = @PK_iProductID
end
GO
/****** Object:  StoredProcedure [dbo].[proDeletePromote]    Script Date: 5/26/2023 10:20:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[proDeletePromote]
@PK_iPromoteID int
as
begin
	delete from tblPromote 
	where PK_iPromoteID = @PK_iPromoteID
end
GO
/****** Object:  StoredProcedure [dbo].[proDeleteSupplier]    Script Date: 5/26/2023 10:20:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[proDeleteSupplier]
@PK_iSupplierID int
as
begin
	delete from tblSupplier 
	where PK_iSupplierID = @PK_iSupplierID
end
GO
/****** Object:  StoredProcedure [dbo].[proDeleteUser]    Script Date: 5/26/2023 10:20:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[proDeleteUser]
@PK_iAccountID int
as
begin
	delete from tblUser 
	where PK_iAccountID = @PK_iAccountID
end
GO
/****** Object:  StoredProcedure [dbo].[proGetAllImageToDisplay]    Script Date: 5/26/2023 10:20:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[proGetAllImageToDisplay]
as
begin
	select * from tblImage
end
GO
/****** Object:  StoredProcedure [dbo].[proGetImageByIDToDisplay]    Script Date: 5/26/2023 10:20:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[proGetImageByIDToDisplay]
@sId int
as
begin
	select sImage from tblImage
	where PK_iImageID = @sId
end
GO
/****** Object:  StoredProcedure [dbo].[proPermissionNameDisplayUser]    Script Date: 5/26/2023 10:20:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[proPermissionNameDisplayUser]
as
begin
	select *from tblPermission
end
GO
/****** Object:  StoredProcedure [dbo].[proUpdateCategory]    Script Date: 5/26/2023 10:20:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[proUpdateCategory]
@sCategoryID int,
@sCategoryName nvarchar(40)
as
begin
	Update tblCategory 
	set sCategoryName = @sCategoryName
	where PK_iCategoryID = @sCategoryID
end
GO
/****** Object:  StoredProcedure [dbo].[proUpdateImportOrder]    Script Date: 5/26/2023 10:20:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[proUpdateImportOrder]
@PK_iImportOrderID int,
@FK_iAccountID int,
@FK_iSupplierID int,
@dtDateAdded datetime,
@sDeliver nvarchar(50)
as
begin
	Update tblImportOrder
	set FK_iAccountID = @FK_iAccountID,
	FK_iSupplierID = @FK_iSupplierID,
	dtDateAdded = @dtDateAdded,
	sDeliver = @sDeliver
	where PK_iImportOrderID = @PK_iImportOrderID
end
GO
/****** Object:  StoredProcedure [dbo].[proUpdatePermission]    Script Date: 5/26/2023 10:20:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[proUpdatePermission]
@PK_iPermissionID int,
@sPermissionName nvarchar(50),
@iState int
as
begin
	Update tblPermission 
	set sPermissionName = @sPermissionName,
	iState = @iState
	where PK_iPermissionID = @PK_iPermissionID
end
GO
/****** Object:  StoredProcedure [dbo].[proUpdatePromote]    Script Date: 5/26/2023 10:20:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[proUpdatePromote]
@PK_iPromoteID int,
@sPromoteName nvarchar(100),
@sPromoteRate float,
@dtStartDay datetime,
@dtEndDay datetime
as
begin
	Update tblPromote
	set sPromoteName = @sPromoteName,
	sPromoteRate = @sPromoteRate,
	dtStartDay = @dtStartDay,
	dtEndDay = @dtEndDay
	where PK_iPromoteID = @PK_iPromoteID
end
GO
/****** Object:  StoredProcedure [dbo].[proUpdateSupplier]    Script Date: 5/26/2023 10:20:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[proUpdateSupplier]
@PK_iSupplierID int,
@sSupplierName nvarchar(50),
@sPhone varchar(12),
@sEmail varchar(50),
@sAddress nvarchar(250)
as
begin
	Update tblSupplier 
	set sSupplierName = @sSupplierName,
	sPhone = @sPhone,
	sEmail = @sEmail,
	sAddress = @sAddress
	where PK_iSupplierID = @PK_iSupplierID
end
GO
/****** Object:  StoredProcedure [dbo].[proUpdateUser]    Script Date: 5/26/2023 10:20:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[proUpdateUser]
@PK_iAccountID int,
@FK_iPermissionID int,
@sEmail varchar(50),
@sPass nvarchar(50),
@sUserName nvarchar(50),
@sPhone varchar(12),
@sAddress nvarchar(200),
@iState int
as
begin
	Update tblUser 
	set FK_iPermissionID = @FK_iPermissionID,
	sEmail = @sEmail,
	sPass = @sPass,
	sUserName = @sUserName,
	sPhone = @sPhone,
	sAddress = @sAddress,
	iState = @iState
	where PK_iAccountID = @PK_iAccountID
end
GO
USE [master]
GO
ALTER DATABASE [giadinhthoxinh] SET  READ_WRITE 
GO
