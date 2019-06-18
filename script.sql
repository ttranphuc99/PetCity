USE [master]
GO
/****** Object:  Database [PresentationPRJ321]    Script Date: 6/18/2019 9:05:45 AM ******/
CREATE DATABASE [PresentationPRJ321]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PresentationPRJ321', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS2014\MSSQL\DATA\PresentationPRJ321.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'PresentationPRJ321_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS2014\MSSQL\DATA\PresentationPRJ321_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [PresentationPRJ321] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PresentationPRJ321].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PresentationPRJ321] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PresentationPRJ321] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PresentationPRJ321] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PresentationPRJ321] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PresentationPRJ321] SET ARITHABORT OFF 
GO
ALTER DATABASE [PresentationPRJ321] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PresentationPRJ321] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PresentationPRJ321] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PresentationPRJ321] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PresentationPRJ321] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PresentationPRJ321] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PresentationPRJ321] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PresentationPRJ321] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PresentationPRJ321] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PresentationPRJ321] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PresentationPRJ321] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PresentationPRJ321] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PresentationPRJ321] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PresentationPRJ321] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PresentationPRJ321] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PresentationPRJ321] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PresentationPRJ321] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PresentationPRJ321] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PresentationPRJ321] SET  MULTI_USER 
GO
ALTER DATABASE [PresentationPRJ321] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PresentationPRJ321] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PresentationPRJ321] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PresentationPRJ321] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [PresentationPRJ321] SET DELAYED_DURABILITY = DISABLED 
GO
USE [PresentationPRJ321]
GO
/****** Object:  Table [dbo].[Accessory]    Script Date: 6/18/2019 9:05:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Accessory](
	[accessoryID] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NULL,
	[brand] [nvarchar](20) NULL,
	[price] [float] NULL,
	[description] [nvarchar](max) NULL,
	[categoryID] [int] NULL,
	[quantity] [int] NULL,
	[isDelete] [bit] NULL,
	[forType] [int] NULL,
	[image] [varchar](10) NULL,
 CONSTRAINT [PK_Accessory] PRIMARY KEY CLUSTERED 
(
	[accessoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Account]    Script Date: 6/18/2019 9:05:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Account](
	[username] [varchar](20) NOT NULL,
	[password] [varchar](20) NULL,
	[fullname] [varchar](50) NULL,
	[address] [varchar](max) NULL,
	[phone] [varchar](10) NULL CONSTRAINT [DF_Account_phone]  DEFAULT (''),
	[isDelete] [bit] NULL,
	[gender] [bit] NULL,
	[role] [varchar](10) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Category]    Script Date: 6/18/2019 9:05:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[categoryID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[isDelete] [bit] NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Invoice_Accessory]    Script Date: 6/18/2019 9:05:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Invoice_Accessory](
	[invoiceID] [bigint] NOT NULL,
	[createdTime] [datetime] NULL,
	[buyerUsername] [varchar](20) NULL,
	[status] [nchar](20) NULL,
	[adminConfirm] [varchar](20) NULL,
	[totalPrice] [decimal](9, 0) NULL,
	[note] [varchar](500) NULL,
 CONSTRAINT [PK_Invoice_Accessory] PRIMARY KEY CLUSTERED 
(
	[invoiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Invoice_Accessory_Detail]    Script Date: 6/18/2019 9:05:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoice_Accessory_Detail](
	[id] [nchar](10) NOT NULL,
	[accessoryID] [bigint] NULL,
	[quantity] [int] NULL,
	[subPrice] [decimal](9, 0) NULL,
	[invoiceID] [bigint] NULL,
 CONSTRAINT [PK_Invoice_Accessory_Detail] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Invoice_Service]    Script Date: 6/18/2019 9:05:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Invoice_Service](
	[invoiceID] [bigint] NOT NULL,
	[createTime] [datetime] NULL,
	[adminConfirm] [varchar](20) NULL,
	[totalPrice] [decimal](9, 0) NULL,
	[status] [nchar](10) NULL,
	[buyerUsername] [varchar](20) NULL,
	[note] [varchar](500) NULL,
	[doingDate] [date] NULL,
 CONSTRAINT [PK_Invoice_Service] PRIMARY KEY CLUSTERED 
(
	[invoiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Invoice_Service_Detail]    Script Date: 6/18/2019 9:05:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoice_Service_Detail](
	[id] [nchar](10) NOT NULL,
	[serviceID] [int] NULL,
	[scheduleID] [int] NULL,
	[staffDoing] [int] NULL,
	[price] [decimal](9, 0) NULL,
	[invoiceID] [bigint] NULL,
	[position] [int] NULL,
 CONSTRAINT [PK_Invoice_Service_Detail] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Pet]    Script Date: 6/18/2019 9:05:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Pet](
	[petID] [bigint] NOT NULL,
	[name] [nvarchar](50) NULL,
	[birthyear] [nchar](4) NULL,
	[ownID] [varchar](20) NULL,
	[typeID] [int] NULL,
	[gender] [bit] NULL,
	[isDelete] [bit] NULL,
 CONSTRAINT [PK_Pet] PRIMARY KEY CLUSTERED 
(
	[petID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Service]    Script Date: 6/18/2019 9:05:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Service](
	[serviceID] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
	[forType] [int] NULL,
	[duration] [float] NULL,
	[price] [float] NULL,
	[description] [varchar](max) NULL,
	[isDelete] [bit] NULL,
	[image] [varchar](10) NULL,
 CONSTRAINT [PK_Service] PRIMARY KEY CLUSTERED 
(
	[serviceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Service_Scheduler]    Script Date: 6/18/2019 9:05:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service_Scheduler](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[timeStar] [time](7) NULL,
	[isDelete] [bit] NULL,
 CONSTRAINT [PK_Service_Scheduler] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Staff]    Script Date: 6/18/2019 9:05:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Staff](
	[staffID] [int] IDENTITY(1,1) NOT NULL,
	[staffName] [varchar](50) NULL,
	[image] [varchar](10) NULL,
	[isAvailable] [bit] NULL,
	[isDelete] [bit] NULL,
	[gender] [bit] NULL,
 CONSTRAINT [PK_Staff] PRIMARY KEY CLUSTERED 
(
	[staffID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Staff_Service_Detail]    Script Date: 6/18/2019 9:05:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staff_Service_Detail](
	[staffID] [int] NOT NULL,
	[serviceID] [int] NOT NULL,
	[isDelete] [bit] NULL CONSTRAINT [DF_Staff_Service_Detail_isDelete]  DEFAULT ('false'),
 CONSTRAINT [PK_Staff_Service_Detail] PRIMARY KEY CLUSTERED 
(
	[staffID] ASC,
	[serviceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Type]    Script Date: 6/18/2019 9:05:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Type](
	[typeID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](20) NULL,
	[isDelete] [bit] NULL,
 CONSTRAINT [PK_Type] PRIMARY KEY CLUSTERED 
(
	[typeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Accessory] ON 

INSERT [dbo].[Accessory] ([accessoryID], [name], [brand], [price], [description], [categoryID], [quantity], [isDelete], [forType], [image]) VALUES (1, N'Chicken and Liver Pate', N'Smartheart', 1, N'Chicken and Liver Pate location for large dogs', 1, 100, 0, 1, N'1.jpg')
INSERT [dbo].[Accessory] ([accessoryID], [name], [brand], [price], [description], [categoryID], [quantity], [isDelete], [forType], [image]) VALUES (2, N'Pate Morando', N'Morando', 2, N'Pate Morando for your dog veal 400gr', 1, 100, 0, 1, N'2.png')
INSERT [dbo].[Accessory] ([accessoryID], [name], [brand], [price], [description], [categoryID], [quantity], [isDelete], [forType], [image]) VALUES (3, N'Tellme pork pate', N'Tellme', 0.800000011920929, N'Raw  Material:  50% pork liver, beef liver 25%, 10% lean meat, Fresh carrot 4%, 1% pea starch Hal Security, olive oil,  calcium extracted from eggshell and water.

Technology is processed using UHT technology, use heat-resistant bag bunker.', 1, 100, 0, 1, N'3.jpg')
INSERT [dbo].[Accessory] ([accessoryID], [name], [brand], [price], [description], [categoryID], [quantity], [isDelete], [forType], [image]) VALUES (4, N'Royal Canin Kitten', N'Royal Canin', 990, N'Kitten 36 is manufactured with ingredients selected to help the kittens easier to digest and absorb nutrients better, ensure the development of muscles and bones and joints of the kitten better and more certain. Although the immune system of cats continue to grow during this period, however, external factors such as weather and change of residence will affect the health of the kitten. Therefore, the vitamins and minerals contained in Kitten 36 will support the baby''s immune system. Additionally, Kitten 36 with abundant calcium helps reduce the formation of tartar for kittens and provide adequate nutrition to bone development completed.', 1, 50, 0, 2, N'4.jpg')
INSERT [dbo].[Accessory] ([accessoryID], [name], [brand], [price], [description], [categoryID], [quantity], [isDelete], [forType], [image]) VALUES (5, N'Morando food for cats', N'Morando', 2.2000000476837158, N'With special formula from FOS (fructooligosaccharides) and MOS (mannan-oligosaccharides), two natural ingredients. FOS supports the digestive system stimulates the intestinal flora; MOS facilitate removing bacteria that cause intestinal dysfunction. All wet food products are enriched with royal jelly or propolis, will help dog get better health care. Royal jelly is a natural antioxidant supply important vitamins and minerals essential to our vitality. Propolis has antibacterial effect. The extracts and natural blend of plant: Grapefruit, saffron, raisins, rosemary, clove. This innovative blend perfectly natural, effective antioxidant Vitamin E. 3 times This commitment shows that the health of our pets is the leading factor to produce quality products .', 1, 100, 0, 2, N'5.JPG')
INSERT [dbo].[Accessory] ([accessoryID], [name], [brand], [price], [description], [categoryID], [quantity], [isDelete], [forType], [image]) VALUES (6, N'Austria Germany for owners and dogs', N'PetStar', 14, N'+ At the pet show love for your favorite team 2018 World Cup season yet !!!

+ Soft cotton material, soft and airy.

+ Multiple sizes for all sizes, the cheapest sale at PetCity.vn

Dog''s coat Size: (Necklace Length x back x Bust)

S: 23 * 34 * 24cm

M: 26 * 39 * 26cm

L: 29 * 44 * 28cm

Size clothing for all: M, XL', 2, 100, 0, 1, N'6.jpg')
INSERT [dbo].[Accessory] ([accessoryID], [name], [brand], [price], [description], [categoryID], [quantity], [isDelete], [forType], [image]) VALUES (7, N'France to host and double coat of dogs', N'PetStar', 14, N'+ At the pet show love for your favorite team 2018 World Cup season yet !!!

+ Soft cotton material, soft and airy.

+ Multiple sizes for all sizes, the cheapest sale at PetCity.vn

Dog''s coat Size: (Necklace Length x back x Bust)

S: 23 * 34 * 24cm

M: 26 * 39 * 26cm

L: 29 * 44 * 28cm

Size clothing for all: M, XL', 2, 50, 0, 1, N'7.jpg')
INSERT [dbo].[Accessory] ([accessoryID], [name], [brand], [price], [description], [categoryID], [quantity], [isDelete], [forType], [image]) VALUES (8, N'Caps for Dog L', N'PetStar', 11, N'Hat makes your pet looks more cute house when going out

Many colors and shapes. Online bookings random delivery', 2, 100, 0, 1, N'8.jpg')
INSERT [dbo].[Accessory] ([accessoryID], [name], [brand], [price], [description], [categoryID], [quantity], [isDelete], [forType], [image]) VALUES (9, N'Vietnam Says Hamster United Kingdom', N'Great Vietnamese Eng', 0.800000011920929, N'T operating part:  eggs - ripe berries - shrimp .bot soybeans - enlightenment powder - powder synthetic vitamin capsule bathroom - Mineral Synthetic

Uses:  Makes birds stay healthy, quick reflexes, much singing, smooth hair, looks good, the room and the prevention of bird diseases, strengthen the immune system', 1, 100, 0, 3, N'9.jpg')
INSERT [dbo].[Accessory] ([accessoryID], [name], [brand], [price], [description], [categoryID], [quantity], [isDelete], [forType], [image]) VALUES (10, N'Says Vietnam England United bird eggs', N'Great Vietnamese Eng', 2, N'Ingredients: Eggs, chicken, green beans, silkworm pupae, grasshoppers powder. vitamins and trace minerals ..

Uses: Hót many - eyelash gi - good looks, enhanced delusion. immune, odor removal of feces, disease prevention bird

Dose: Feeding the needs of birds', 1, 100, 0, 3, N'10.jpg')
INSERT [dbo].[Accessory] ([accessoryID], [name], [brand], [price], [description], [categoryID], [quantity], [isDelete], [forType], [image]) VALUES (11, N'Vietnam Says Bird United Kingdom Painted Mi- special Babbler', N'Great Vietnamese Eng', 0.699999988079071, N'Composition: combination of synthetic vitamins, trace minerals, eggs, green contraband, honey, shrimp, whole grains, fruits.

Uses: Makes birds stay healthy, quick reflexes, much singing, smooth hair, looks good, the room and the prevention of bird diseases, strengthen the immune system.', 1, 100, 0, 3, N'11.jpg')
INSERT [dbo].[Accessory] ([accessoryID], [name], [brand], [price], [description], [categoryID], [quantity], [isDelete], [forType], [image]) VALUES (12, N'Vietnam Says Bird United Kingdom luxury box for Birds Mi + Babbler', N'Great Vietnamese Eng', 2.2000000476837158, N'T operating part:  Coordinate the synthetic vitamins, trace minerals, eggs, green beans, shrimp powder, dry chrysalis, honey, soy.

Uses:  Makes birds stay healthy, quick reflexes, much singing, smooth hair, looks good, the room and the prevention of bird diseases, strengthen the immune system.', 1, 100, 0, 3, N'12.jpg')
INSERT [dbo].[Accessory] ([accessoryID], [name], [brand], [price], [description], [categoryID], [quantity], [isDelete], [forType], [image]) VALUES (13, N'Shirt size L Kimino bow', N'PetStar', 17.5, N'Shirt size L Kimino bow
+ Bow princess dress color and sleek
 + Material soft, smooth, non-irritating to skin and suitable for your puppy home', 2, 100, 0, 1, N'13.jpg')
INSERT [dbo].[Accessory] ([accessoryID], [name], [brand], [price], [description], [categoryID], [quantity], [isDelete], [forType], [image]) VALUES (14, N'Bib Nail flower PetStar', N'PetStar', 20, N'Bib 34 * 40cm nail flower PetStar
PetStar flowery bib for dogs and cats, designs and beautiful colors and attractive your house pet, durable material, sure.
- Design lovely. Extremely rugged, bibs soft flowery  as "assistants" effective and ideally make it easier to "manage" the energetic puppy and mischievous.', 2, 100, 0, 2, N'14.jpg')
INSERT [dbo].[Accessory] ([accessoryID], [name], [brand], [price], [description], [categoryID], [quantity], [isDelete], [forType], [image]) VALUES (15, N'Shampoo and blow Tropiclean', N'Tropiclean', 10, N'Product Features:
Is the combination of shampoo and exhaust 2 in 1.
Extracts from natural ingredients: papaya, coconut, mango, pomegranate, kiwi, ...
Help cleanse gently, natural moisture balance to the skin and hair.
Leather and fur animals will always soft, shiny, pleasant aroma.
Prevent hair breakage and tangled fibers.', 4, 50, 0, 1, N'15.jpg')
INSERT [dbo].[Accessory] ([accessoryID], [name], [brand], [price], [description], [categoryID], [quantity], [isDelete], [forType], [image]) VALUES (16, N'Budle''Budle - bath HQ', N'Budle ''Budle', 11, N'Bath Budle''Budle  are manufactured according to a special formula with a unique combination of natural ingredients. Organic green tea and passion herbicides prominent effects in antioxidants, cleansing and nourishing hair silky effectively, besides still retains the aroma gently relaxed in a long time. Especially the presence of oil avocado and pomegranate helps balance moisture and protection for sensitive skin for dogs no irritation.', 4, 50, 0, 1, N'16.jpg')
INSERT [dbo].[Accessory] ([accessoryID], [name], [brand], [price], [description], [categoryID], [quantity], [isDelete], [forType], [image]) VALUES (17, N'SOS - 530ml Shower gel for white fur', N'SOS', 9.5, N'uses: lighten color, remove dirt, deodorant, antibacterial, keep the fragrance long, especially without two SOS now has catalog Petcity dedicated type is used to breed cats

Won === type dog white fur, fur color retention without yellowing you only need 1 bathroom is bright white, very smooth especially hairy, smooth and fragrant long 
=== type dog won sepia color always keep hair color, especially after bathing will be red copper & beautiful shimmering metallic look always 
=== type deodorant for all breeds: with long fragrant features, remain fragrant and moisture skin, helping to keep baby comfortable and not foul 
=== type hair care, deodorant, antibacterial, prevent mites lice for all breeds, with features suitable for many dogs, not irritation skin', 4, 50, 0, 1, N'17.jpg')
INSERT [dbo].[Accessory] ([accessoryID], [name], [brand], [price], [description], [categoryID], [quantity], [isDelete], [forType], [image]) VALUES (18, N'YU - Bath Dry 75ml Cherry', N'Yu', 9.75, N' SPRAY DRIED perfume SHOWER FOR PETS

Spray dry bath for dogs, cats often used when dogs and cats are sick and during treatment or who are pregnant can not shower with the water. With the use of a spray bath this dry you can rest assured because this product has helped the children clean, deodorizing 
effect of shower gels dry for dogs, cats: 
+ Helps kill bacteria in dogs, cats requires no water 
+ cleaning and care protection of the outer surface of the skin of dogs, cats 
+ products help hair always bring soft and balmy fragrance, passionate 
--- flavored cherry & flower pattern single --- 
Made in USA', 4, 50, 0, 1, N'18.jpg')
INSERT [dbo].[Accessory] ([accessoryID], [name], [brand], [price], [description], [categoryID], [quantity], [isDelete], [forType], [image]) VALUES (19, N'FERPLAST - Collars ARLECCHINO 2.0', N'FERPLAST', 11, N'FERPLAST, based in castelgomberto (province of Vicenza - Italy), founded in 1966 by Carlo VACCARI. In 50 years, FERPLAST joined the research and creation of innovative products, high quality safety to ensure comfort for the care of pets. Companies spend significant investments for research of advanced technologies for the production.

As a commercial enterprise typical of northeastern Italy, today FERPLAST produce more than 2000 kinds of products, has about 1,000 employees, distributed no less than 80 countries worldwide and has subsidiaries in Italy, France Germany, Great Britain, Scandinavia, Poland, Ukraine, Slovakia, Russia, Benelux and Brazil, has three production plants in Italy, Ukraine and Slovak Republic.', 3, 20, 0, 1, N'19.jpg')
INSERT [dbo].[Accessory] ([accessoryID], [name], [brand], [price], [description], [categoryID], [quantity], [isDelete], [forType], [image]) VALUES (20, N'Mon ami - Round collar size 2', N'Mon ami', 3.75, N'+  Collars for dogs   with design seasoned and sure, this necklace will lie neatly and smoothly on old uncle your pet ready for any stroll or jog inspirational forward.

+ In addition to the effect and help you hold on to follow his uncle''s pet, fashion necklace also notes highlights your pet to look "cool".', 3, 100, 0, 1, N'20.jpg')
INSERT [dbo].[Accessory] ([accessoryID], [name], [brand], [price], [description], [categoryID], [quantity], [isDelete], [forType], [image]) VALUES (21, N'Natural leather necklace FERPLAST 1.5', N'FERPLAST', 12, N'FERPLAST, based in castelgomberto (province of Vicenza - Italy), founded in 1966 by Carlo VACCARI. In 50 years, FERPLAST joined the research and creation of innovative products, high quality safety to ensure comfort for the care of pets. Companies spend significant investments for research of advanced technologies for the production.

As a commercial enterprise typical of northeastern Italy, today FERPLAST produce more than 2000 kinds of products, has about 1,000 employees, distributed no less than 80 countries worldwide and has subsidiaries in Italy, France Germany, Great Britain, Scandinavia, Poland, Ukraine, Slovakia, Russia, Benelux and Brazil, has three production plants in Italy, Ukraine and Slovak Republic.', 3, 20, 0, 1, N'21.jpg')
INSERT [dbo].[Accessory] ([accessoryID], [name], [brand], [price], [description], [categoryID], [quantity], [isDelete], [forType], [image]) VALUES (22, N'Natural leather necklace', N'FERPLAST', 12, N'FERPLAST, based in castelgomberto (province of Vicenza - Italy), founded in 1966 by Carlo VACCARI. In 50 years, FERPLAST joined the research and creation of innovative products, high quality safety to ensure comfort for the care of pets. Companies spend significant investments for research of advanced technologies for the production.

As a commercial enterprise typical of northeastern Italy, today FERPLAST produce more than 2000 kinds of products, has about 1,000 employees, distributed no less than 80 countries worldwide and has subsidiaries in Italy, France Germany, Great Britain, Scandinavia, Poland, Ukraine, Slovakia, Russia, Benelux and Brazil, has three production plants in Italy, Ukraine and Slovak Republic.', 3, 20, 0, 1, N'22.jpg')
INSERT [dbo].[Accessory] ([accessoryID], [name], [brand], [price], [description], [categoryID], [quantity], [isDelete], [forType], [image]) VALUES (23, N'Advanced automatic wire rope Flexi New Comfort green circle', N'Flexi', 16, N'Is the inventor and manufacturer of wire driven automation from Germany. Leader in this field in more than 90 countries worldwide, Flexi is the pioneer company in the field of innovative accessories for pets.

With 300 employees at bargteheide, Germany, together with all his creativity with the dogs, they created Flexi advanced wire products with exclusive design. Based on advanced technology, advanced materials, Flexi desire to bring the product service life for your dog the best way.

2010, Flexi was awarded "Brand of the Century", this is a big prize in Germany. Additionally, Flexi also received other awards: "The award of design" - Dog Fancy magazine of America awarded "Product of the Year" by DOGS - Journal of leading European dog donated.

However, for Flexi, the most valuable reward is still the satisfaction of millions of dogs worldwide.', 3, 50, 0, 1, N'23.png')
INSERT [dbo].[Accessory] ([accessoryID], [name], [brand], [price], [description], [categoryID], [quantity], [isDelete], [forType], [image]) VALUES (24, N'FERPLAST bibs Ergofluo 2.0', N'FERPLAST', 22, N'FERPLAST, based in castelgomberto (province of Vicenza - Italy), founded in 1966 by Carlo VACCARI. In 50 years, FERPLAST joined the research and creation of innovative products, high quality safety to ensure comfort for the care of pets. Companies spend significant investments for research of advanced technologies for the production.

As a commercial enterprise typical of northeastern Italy, today FERPLAST produce more than 2000 kinds of products, has about 1,000 employees, distributed no less than 80 countries worldwide and has subsidiaries in Italy, France Germany, Great Britain, Scandinavia, Poland, Ukraine, Slovakia, Russia, Benelux and Brazil, has three production plants in Italy, Ukraine and Slovak Republic.', 3, 20, 0, 1, N'24.jpg')
INSERT [dbo].[Accessory] ([accessoryID], [name], [brand], [price], [description], [categoryID], [quantity], [isDelete], [forType], [image]) VALUES (25, N'Toy rubber spherical cloud', N'Rubbert', 11, N'Sepak Takraw is a motor sport is good for the body. This remains true for your pet. The lovely orb clouds and colorful brand from  Toys  Rubber T PetCity, certainly will stimulate curiosity your baby.

Product Features:

The product is made from 100% natural rubber, which has a soft, flexible, moderate persistent and particularly safe.
European standards, certification REACH, ROSH
Non-toxic, safe for pet bite and suck at.
High elasticity, durability
Diameter: 130mm, Weight: 190g
Beautiful colors, attract the attention of your pet home.', 3, 100, 0, 1, N'25.jpg')
INSERT [dbo].[Accessory] ([accessoryID], [name], [brand], [price], [description], [categoryID], [quantity], [isDelete], [forType], [image]) VALUES (26, N'Twisted shaped rubber toy', N'Rubbert', 11.5, N'Devoured every baby furniture is baby tooth replacement signs, or simply she is stressed or bored. The same time, rather than get angry with your baby, you should equip a dedicated baby toys. Metastable shape toy twisted from brand  Toys  Rubber T PetCity is extremely great solution in this case.

Product Features:

The product is made from 100% natural rubber, which has a soft, flexible, moderate persistent and particularly safe.
European standards, certification REACH, ROSH
Non-toxic, safe for pet bite and suck at.
High elasticity, durability
Size: 162.5x50x50 mm, Weight: 200g
Beautiful colors, attract the attention of your pet home.', 3, 100, 0, 1, N'26.jpg')
INSERT [dbo].[Accessory] ([accessoryID], [name], [brand], [price], [description], [categoryID], [quantity], [isDelete], [forType], [image]) VALUES (27, N'Rubber toy flying discs', N'Rubbert', 9, N'You show him the garden to play, but both just walk you are really bored. Or do you want that help babies improve motor skills, search objects. Take a right for the baby shopping metastable flying saucer from brand  Toys  Rubber T PetCity, make sure your baby will love.

Male point of product:

The product is made from 100% natural rubber, which has a soft, flexible, moderate persistent and particularly safe.
European standards, certification REACH, ROSH
Non-toxic, safe for pet bite and suck at.
High elasticity, durability
Diameter: 205mm, Weight: 180g
Beautiful colors, attract the attention of your pet home.', 3, 100, 0, 1, N'27.png')
INSERT [dbo].[Accessory] ([accessoryID], [name], [brand], [price], [description], [categoryID], [quantity], [isDelete], [forType], [image]) VALUES (28, N'Codos - hair clippers for dogs and cats CP-9600', N'Codos', 100, N'Product warranty is overcome failure error, technical problems occur due to the fault of the manufacturer.

1. Conditions of warranty:

Products are free warranty if the product meets the following conditions:

a. Longer warranty period (calculated from the date the customer receives the product)

b. Customers have the whole bill Petcity sales, warranty card, warranty stamp prescribed by each manufacturer.', 4, 50, 0, 1, N'28.jpg')
INSERT [dbo].[Accessory] ([accessoryID], [name], [brand], [price], [description], [categoryID], [quantity], [isDelete], [forType], [image]) VALUES (29, N'Codos hair dryer CP160', N'Codos', 150, N'+ Is Dedicated indispensable for the family cat and dog fur farming long, thick and long dry.

+ Ability to pet fur and to better, faster drying times and bring beauty to your pet

+ The product control function of the strength of the wind blowing, temperature controlled heater. Or wind can blow hot blow, as well as parallel activities 2 functions

+ Use engine imported from Japan have longevity 2x compared with conventional dryers

+ Low vibration and minimal noise compared to conventional hair dryers

+ Dryer of Codos shell colored aluminum alloy surface is resistant to oxidation, aesthetic and functional', 4, 20, 0, 1, N'29.jpg')
INSERT [dbo].[Accessory] ([accessoryID], [name], [brand], [price], [description], [categoryID], [quantity], [isDelete], [forType], [image]) VALUES (30, N'Hagen Doggo nail trimmer small dog', N'Hagen Doggo', 12, N'With any pet owners do well always want to find the best products for the care of pets.

Hagen can share the love, passion and care for their pet along with you. With ingredients of the highest quality in all products grooming, Hagen always ensure quality from the design stage to the selection of raw materials for production processes packaged before launch school.', 4, 100, 0, 1, N'30.jpg')
INSERT [dbo].[Accessory] ([accessoryID], [name], [brand], [price], [description], [categoryID], [quantity], [isDelete], [forType], [image]) VALUES (31, N'Lifejackets Petstar hand fur collar size XL', N'PetStar', 9, N'Durable fabric
To make a comfortable atmosphere
Increase pet nobility
Many different Size: SML-XL', 2, 100, 0, 1, N'31.jpg')
INSERT [dbo].[Accessory] ([accessoryID], [name], [brand], [price], [description], [categoryID], [quantity], [isDelete], [forType], [image]) VALUES (32, N'Petstar back to school the size M', N'Petstar', 10, N'Size M: 2-3kg ', 2, 100, 0, 1, N'32.jpg')
INSERT [dbo].[Accessory] ([accessoryID], [name], [brand], [price], [description], [categoryID], [quantity], [isDelete], [forType], [image]) VALUES (33, N'Petstar the red man 1986 Dogbaby size XL', N'Petstar', 5, N'Size XL: 5-6 kg.', 2, 50, 0, 1, N'33.jpg')
INSERT [dbo].[Accessory] ([accessoryID], [name], [brand], [price], [description], [categoryID], [quantity], [isDelete], [forType], [image]) VALUES (34, N'Petstar the classic size XL', N'Petstar', 3, N'With exquisite design of classic overalls will bring your pet comfortable and warm this winter. 

Size XL: 5-6 kg. ', 2, 50, 0, 1, N'34.jpg')
INSERT [dbo].[Accessory] ([accessoryID], [name], [brand], [price], [description], [categoryID], [quantity], [isDelete], [forType], [image]) VALUES (35, N'Vienna Daily Best For Dogs chew plastic', N'Vienna', 6.5, N'Over 35 nutritional ingredients synergistic effect for optimal health beloved dog

+ Omega 3 helps hair beautiful skin

+ Vitamin B group balance and complete help fight stress

+ The digestive enzymes to help absorb and use nutrients from meals

+ 11 types of mineral supports humoral components, erythropoiesis and bone, helps maintain healthy nerve function

+ Selenium supports immune function', 1, 20, 0, 1, N'35.jpg')
INSERT [dbo].[Accessory] ([accessoryID], [name], [brand], [price], [description], [categoryID], [quantity], [isDelete], [forType], [image]) VALUES (36, N'Snacks for cats Cat Treats Orgo liver taste', N'Orgo', 2, N'Orgo cat treats As additional snack calcium strengthen bones for dogs cats

Is the kind of junk foods for cats nutritional supplements daily.

2 green tea taste is the taste of tuna and exciting and poultry liver', 1, 100, 0, 2, N'36.jpg')
INSERT [dbo].[Accessory] ([accessoryID], [name], [brand], [price], [description], [categoryID], [quantity], [isDelete], [forType], [image]) VALUES (37, N'Vienna Daily Best For Dogs chew plastic', N'Vienna', 10, N'Puppy dermatitis?

SKIN + COAT 14 specific ingredients help your dog be healthy skin and silky fur

Linseed (flax seeds) omega-3 helps skin. Flaxseed also helps antioxidant lignans, also vitamins B1, B2, C, E and beta-carotene, minerals such as iron, zinc, potassium, magnesium, phosphorus and calcium.

Safflower oil is an excellent source of Omega 6 to help skin health excellent and good elasticity. Omega 6 essential for the support of the coat shine.

Vitamin E helps protect the skin from free radical damage caused by.

Vegetable mixture including dried carrots, dried alfalfa haylage, dried algae are important nutrients help to nourish the skin healthy.', 1, 50, 0, 1, N'37.jpg')
INSERT [dbo].[Accessory] ([accessoryID], [name], [brand], [price], [description], [categoryID], [quantity], [isDelete], [forType], [image]) VALUES (38, N'Natural core - sensitive Dog food (salmon) 1kg', N'Natural Core', 14.5, N'Features:
- Beauty skin and beautiful coat  
- Maximizing digestion absorption  
- Containing Polyphenols are antioxidants strongly  
- Strengthening the immune system and regenerates the skin highlights  
- Prevention of cardiovascular disease and type remove toxic substances from the body  
- Reduce smell and body odor', 1, 50, 0, 1, N'38.jpg')
INSERT [dbo].[Accessory] ([accessoryID], [name], [brand], [price], [description], [categoryID], [quantity], [isDelete], [forType], [image]) VALUES (39, N'High feed NutriSource chicken, peas (for small dogs) 142g', N'NutriSource', 1, N' Food Premium complete mix for dogs: fresh chicken + peas.

- Not containing cereals pet allergens (GRAIN FREE).

- Suitable for all stages of growth.

- For all dogs have weight from 0-45 kg.

- Weight: 142g / package.

- Origin: Tuffy''s Pet Foods, Inc. the USA', 1, 150, 0, 1, N'39.JPG')
INSERT [dbo].[Accessory] ([accessoryID], [name], [brand], [price], [description], [categoryID], [quantity], [isDelete], [forType], [image]) VALUES (40, N'Puppy food nutrition 1.5kg Smartheart', N'SmartHeart', 10.5, N'- Food nutrition pet Smartheart

- To pet as your dog loves sturdy and healthy you need to ensure it eat, drink full of nutrients. Especially with less than 1 year old pet, you should pay special attention to the daily diet composition and selection of the food safety standards so that they develop the best. Today Petcity.vn, brings you the dog food Smartheart from companies Perfect Companion Vietnam.', 1, 100, 0, 1, N'40.jpg')
SET IDENTITY_INSERT [dbo].[Accessory] OFF
INSERT [dbo].[Account] ([username], [password], [fullname], [address], [phone], [isDelete], [gender], [role]) VALUES (N'admin', N'admin', N'Tran Thien Phuc', NULL, N'', 0, 1, N'admin')
INSERT [dbo].[Account] ([username], [password], [fullname], [address], [phone], [isDelete], [gender], [role]) VALUES (N'admin1', N'admin1', N'Ngo Van Sang', NULL, N'', 0, 0, N'admin')
INSERT [dbo].[Account] ([username], [password], [fullname], [address], [phone], [isDelete], [gender], [role]) VALUES (N'admin123', N'123456', N'ad', NULL, N'', 1, 1, N'admin')
INSERT [dbo].[Account] ([username], [password], [fullname], [address], [phone], [isDelete], [gender], [role]) VALUES (N'ahihidongok', N'ahihiahihi', N'Ahihi Do Ngoc', NULL, N'', 0, 1, N'admin')
INSERT [dbo].[Account] ([username], [password], [fullname], [address], [phone], [isDelete], [gender], [role]) VALUES (N'doggpet123', N'12345678', N'Dogg Pet', NULL, N'', 1, 0, N'member')
INSERT [dbo].[Account] ([username], [password], [fullname], [address], [phone], [isDelete], [gender], [role]) VALUES (N'hongkong', N'hongkong', N'Hong Kong', NULL, N'', 0, 0, N'member')
INSERT [dbo].[Account] ([username], [password], [fullname], [address], [phone], [isDelete], [gender], [role]) VALUES (N'hongkong1', N'hongkong1', N'Hong Kong', NULL, N'', 0, 0, N'member')
INSERT [dbo].[Account] ([username], [password], [fullname], [address], [phone], [isDelete], [gender], [role]) VALUES (N'hongkong2', N'hongkong', N'Hong Kong', NULL, N'', 0, 1, N'member')
INSERT [dbo].[Account] ([username], [password], [fullname], [address], [phone], [isDelete], [gender], [role]) VALUES (N'hongkong3', N'hongkong', N'Hong Kong', NULL, N'', 1, 1, N'member')
INSERT [dbo].[Account] ([username], [password], [fullname], [address], [phone], [isDelete], [gender], [role]) VALUES (N'passpass', N'javawebne', N'Java Web', NULL, N'', 0, 0, N'member')
INSERT [dbo].[Account] ([username], [password], [fullname], [address], [phone], [isDelete], [gender], [role]) VALUES (N'phucphuc', N'phucphuc', N'Phuc Thien', NULL, N'', 0, 1, N'member')
INSERT [dbo].[Account] ([username], [password], [fullname], [address], [phone], [isDelete], [gender], [role]) VALUES (N'phuctt', N'phuctt', N'Phuc Tran', N'Q12', N'0707169628', 0, 1, N'member')
INSERT [dbo].[Account] ([username], [password], [fullname], [address], [phone], [isDelete], [gender], [role]) VALUES (N'something123', N'something', N'Some Thing', NULL, N'', 0, 0, N'admin')
INSERT [dbo].[Account] ([username], [password], [fullname], [address], [phone], [isDelete], [gender], [role]) VALUES (N'something1234', N'12345678', N'Test', NULL, N'', 1, 1, N'admin')
INSERT [dbo].[Account] ([username], [password], [fullname], [address], [phone], [isDelete], [gender], [role]) VALUES (N'thienphuc', N'thienphuc', N'Phuc', NULL, N'', 0, 0, N'member')
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([categoryID], [name], [isDelete]) VALUES (1, N'Food', 0)
INSERT [dbo].[Category] ([categoryID], [name], [isDelete]) VALUES (2, N'Clothes', 0)
INSERT [dbo].[Category] ([categoryID], [name], [isDelete]) VALUES (3, N'Toys', 0)
INSERT [dbo].[Category] ([categoryID], [name], [isDelete]) VALUES (4, N'Comestics', 0)
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Service] ON 

INSERT [dbo].[Service] ([serviceID], [name], [forType], [duration], [price], [description], [isDelete], [image]) VALUES (1, N'Dog Hair Grooming Salon', 1, 0.5, 10, N'Making dogs & cats look great is our passion! Our academy-trained Pet Stylists have over 800 hours of hands-on grooming instruction that includes bathing, trimming & styling at least 200 dogs of all breeds & sizes plus annual safety certification. We offer complete bath, haircut & walk-in grooming services. Book your pet''s salon appointment today!
                    
                    
                    ', 0, N'1.png')
INSERT [dbo].[Service] ([serviceID], [name], [forType], [duration], [price], [description], [isDelete], [image]) VALUES (2, N'Cat Grooming Hair Salon', 2, 0.5, 8, N'Making dogs & cats look great is our passion! Our academy-trained Pet Stylists have over 800 hours of hands-on grooming instruction that includes bathing, trimming & styling at least 200 dogs of all breeds & sizes plus annual safety certification. We offer complete bath, haircut & walk-in grooming services. Book your pet''s salon appointment today!', 0, N'2.png')
INSERT [dbo].[Service] ([serviceID], [name], [forType], [duration], [price], [description], [isDelete], [image]) VALUES (3, N'From Teeth to Tail - Dog', 1, 1.5, 50, N'Your pet’s Grooming Salon visit starts with our Hands-on Pet Assessment. At check-in, a safety-certified salon associate will meet your pet and perform a thorough evaluation to ensure they are healthy and ready for pampering. Then, the associate will create a customized approach to address your pet’s unique needs and recommend solutions to be used during their bath or groom.

Our assessment includes the following checks:

Ears: We check for cleanliness, odor, signs of infection and other conditions.

Teeth & Mouth: We check for odor, tartar and other dental issues.

Skin: We look for lumps, irritations, flaking and fleas & ticks.

Nails: We look at the length and identify splits, breaks and overgrowth.

Coat: We check for mats and shedding fur.', 0, N'3.jpg')
INSERT [dbo].[Service] ([serviceID], [name], [forType], [duration], [price], [description], [isDelete], [image]) VALUES (4, N'Play with puzzle - Cat', 2, 1, 10, N'Play with puzzle help your cat escape from depression.', 0, N'4.png')
INSERT [dbo].[Service] ([serviceID], [name], [forType], [duration], [price], [description], [isDelete], [image]) VALUES (5, N'Dog wash and massage', 1, 2, 20, N'Dog wash and massage', 0, N'5.png')
INSERT [dbo].[Service] ([serviceID], [name], [forType], [duration], [price], [description], [isDelete], [image]) VALUES (6, N'Cat wash and massage', 2, 1.5, 22, N'Cat wash and massage', 0, N'6.jpg')
INSERT [dbo].[Service] ([serviceID], [name], [forType], [duration], [price], [description], [isDelete], [image]) VALUES (7, N'Hamster health check', 3, 1, 5, N'Hamster health check', 0, N'7.jpg')
INSERT [dbo].[Service] ([serviceID], [name], [forType], [duration], [price], [description], [isDelete], [image]) VALUES (8, N'Dog health check', 1, 1, 5, N'Dog health check', 0, N'8.jpg')
INSERT [dbo].[Service] ([serviceID], [name], [forType], [duration], [price], [description], [isDelete], [image]) VALUES (10, N'a', 1, 0.5, 12, N'as', 1, N'10.JPG')
SET IDENTITY_INSERT [dbo].[Service] OFF
SET IDENTITY_INSERT [dbo].[Staff] ON 

INSERT [dbo].[Staff] ([staffID], [staffName], [image], [isAvailable], [isDelete], [gender]) VALUES (1, N'Huy Kim', N'1.jpg', 1, 0, 1)
INSERT [dbo].[Staff] ([staffID], [staffName], [image], [isAvailable], [isDelete], [gender]) VALUES (2, N'Nguyen Hoang', N'2.jpg', 0, 0, 0)
INSERT [dbo].[Staff] ([staffID], [staffName], [image], [isAvailable], [isDelete], [gender]) VALUES (3, N'Bui Tan', N'3.jpg', 1, 0, 1)
INSERT [dbo].[Staff] ([staffID], [staffName], [image], [isAvailable], [isDelete], [gender]) VALUES (4, N'Phuong Hao', N'4.jpg', 1, 0, 0)
INSERT [dbo].[Staff] ([staffID], [staffName], [image], [isAvailable], [isDelete], [gender]) VALUES (5, N'Ngoc Thao', N'5.jpg', 0, 0, 0)
INSERT [dbo].[Staff] ([staffID], [staffName], [image], [isAvailable], [isDelete], [gender]) VALUES (6, N'Bao Tran', N'6.jpg', 0, 0, 0)
INSERT [dbo].[Staff] ([staffID], [staffName], [image], [isAvailable], [isDelete], [gender]) VALUES (7, N'Bao Khanh', N'7.jpg', 1, 0, 0)
INSERT [dbo].[Staff] ([staffID], [staffName], [image], [isAvailable], [isDelete], [gender]) VALUES (8, N'Hong Nghia', N'8.jpg', 1, 0, 0)
INSERT [dbo].[Staff] ([staffID], [staffName], [image], [isAvailable], [isDelete], [gender]) VALUES (9, N'Kim Khanh', N'9.jpg', 0, 0, 0)
INSERT [dbo].[Staff] ([staffID], [staffName], [image], [isAvailable], [isDelete], [gender]) VALUES (10, N'Tran Minh Quan', N'10.jpg', 0, 0, 1)
INSERT [dbo].[Staff] ([staffID], [staffName], [image], [isAvailable], [isDelete], [gender]) VALUES (11, N'Z', N'11.png', 1, 1, 1)
SET IDENTITY_INSERT [dbo].[Staff] OFF
INSERT [dbo].[Staff_Service_Detail] ([staffID], [serviceID], [isDelete]) VALUES (1, 1, 1)
INSERT [dbo].[Staff_Service_Detail] ([staffID], [serviceID], [isDelete]) VALUES (1, 4, 1)
INSERT [dbo].[Staff_Service_Detail] ([staffID], [serviceID], [isDelete]) VALUES (1, 5, 1)
INSERT [dbo].[Staff_Service_Detail] ([staffID], [serviceID], [isDelete]) VALUES (1, 7, 1)
INSERT [dbo].[Staff_Service_Detail] ([staffID], [serviceID], [isDelete]) VALUES (1, 10, 1)
INSERT [dbo].[Staff_Service_Detail] ([staffID], [serviceID], [isDelete]) VALUES (2, 2, 0)
INSERT [dbo].[Staff_Service_Detail] ([staffID], [serviceID], [isDelete]) VALUES (2, 3, 0)
INSERT [dbo].[Staff_Service_Detail] ([staffID], [serviceID], [isDelete]) VALUES (2, 4, 0)
INSERT [dbo].[Staff_Service_Detail] ([staffID], [serviceID], [isDelete]) VALUES (2, 6, 0)
INSERT [dbo].[Staff_Service_Detail] ([staffID], [serviceID], [isDelete]) VALUES (2, 8, 0)
INSERT [dbo].[Staff_Service_Detail] ([staffID], [serviceID], [isDelete]) VALUES (2, 10, 1)
INSERT [dbo].[Staff_Service_Detail] ([staffID], [serviceID], [isDelete]) VALUES (3, 1, 0)
INSERT [dbo].[Staff_Service_Detail] ([staffID], [serviceID], [isDelete]) VALUES (3, 2, 0)
INSERT [dbo].[Staff_Service_Detail] ([staffID], [serviceID], [isDelete]) VALUES (3, 3, 0)
INSERT [dbo].[Staff_Service_Detail] ([staffID], [serviceID], [isDelete]) VALUES (3, 4, 0)
INSERT [dbo].[Staff_Service_Detail] ([staffID], [serviceID], [isDelete]) VALUES (3, 6, 0)
INSERT [dbo].[Staff_Service_Detail] ([staffID], [serviceID], [isDelete]) VALUES (3, 8, 0)
INSERT [dbo].[Staff_Service_Detail] ([staffID], [serviceID], [isDelete]) VALUES (3, 10, 1)
INSERT [dbo].[Staff_Service_Detail] ([staffID], [serviceID], [isDelete]) VALUES (4, 1, 1)
INSERT [dbo].[Staff_Service_Detail] ([staffID], [serviceID], [isDelete]) VALUES (4, 3, 0)
INSERT [dbo].[Staff_Service_Detail] ([staffID], [serviceID], [isDelete]) VALUES (4, 8, 0)
INSERT [dbo].[Staff_Service_Detail] ([staffID], [serviceID], [isDelete]) VALUES (4, 10, 1)
INSERT [dbo].[Staff_Service_Detail] ([staffID], [serviceID], [isDelete]) VALUES (5, 4, 0)
INSERT [dbo].[Staff_Service_Detail] ([staffID], [serviceID], [isDelete]) VALUES (5, 6, 0)
INSERT [dbo].[Staff_Service_Detail] ([staffID], [serviceID], [isDelete]) VALUES (5, 7, 0)
INSERT [dbo].[Staff_Service_Detail] ([staffID], [serviceID], [isDelete]) VALUES (6, 3, 0)
INSERT [dbo].[Staff_Service_Detail] ([staffID], [serviceID], [isDelete]) VALUES (6, 5, 0)
INSERT [dbo].[Staff_Service_Detail] ([staffID], [serviceID], [isDelete]) VALUES (6, 6, 0)
INSERT [dbo].[Staff_Service_Detail] ([staffID], [serviceID], [isDelete]) VALUES (7, 1, 0)
INSERT [dbo].[Staff_Service_Detail] ([staffID], [serviceID], [isDelete]) VALUES (7, 2, 0)
INSERT [dbo].[Staff_Service_Detail] ([staffID], [serviceID], [isDelete]) VALUES (7, 5, 0)
INSERT [dbo].[Staff_Service_Detail] ([staffID], [serviceID], [isDelete]) VALUES (7, 10, 1)
INSERT [dbo].[Staff_Service_Detail] ([staffID], [serviceID], [isDelete]) VALUES (8, 1, 0)
INSERT [dbo].[Staff_Service_Detail] ([staffID], [serviceID], [isDelete]) VALUES (8, 2, 0)
INSERT [dbo].[Staff_Service_Detail] ([staffID], [serviceID], [isDelete]) VALUES (8, 5, 0)
INSERT [dbo].[Staff_Service_Detail] ([staffID], [serviceID], [isDelete]) VALUES (8, 10, 1)
INSERT [dbo].[Staff_Service_Detail] ([staffID], [serviceID], [isDelete]) VALUES (9, 5, 0)
INSERT [dbo].[Staff_Service_Detail] ([staffID], [serviceID], [isDelete]) VALUES (9, 10, 1)
INSERT [dbo].[Staff_Service_Detail] ([staffID], [serviceID], [isDelete]) VALUES (10, 4, 0)
INSERT [dbo].[Staff_Service_Detail] ([staffID], [serviceID], [isDelete]) VALUES (10, 5, 0)
INSERT [dbo].[Staff_Service_Detail] ([staffID], [serviceID], [isDelete]) VALUES (10, 6, 0)
INSERT [dbo].[Staff_Service_Detail] ([staffID], [serviceID], [isDelete]) VALUES (10, 7, 0)
INSERT [dbo].[Staff_Service_Detail] ([staffID], [serviceID], [isDelete]) VALUES (10, 10, 1)
INSERT [dbo].[Staff_Service_Detail] ([staffID], [serviceID], [isDelete]) VALUES (11, 10, 1)
SET IDENTITY_INSERT [dbo].[Type] ON 

INSERT [dbo].[Type] ([typeID], [name], [isDelete]) VALUES (1, N'Dog', 0)
INSERT [dbo].[Type] ([typeID], [name], [isDelete]) VALUES (2, N'Cat', 0)
INSERT [dbo].[Type] ([typeID], [name], [isDelete]) VALUES (3, N'Hamster', 0)
SET IDENTITY_INSERT [dbo].[Type] OFF
ALTER TABLE [dbo].[Accessory]  WITH CHECK ADD  CONSTRAINT [FK_Accessory_Category] FOREIGN KEY([categoryID])
REFERENCES [dbo].[Category] ([categoryID])
GO
ALTER TABLE [dbo].[Accessory] CHECK CONSTRAINT [FK_Accessory_Category]
GO
ALTER TABLE [dbo].[Accessory]  WITH CHECK ADD  CONSTRAINT [FK_Accessory_Type] FOREIGN KEY([forType])
REFERENCES [dbo].[Type] ([typeID])
GO
ALTER TABLE [dbo].[Accessory] CHECK CONSTRAINT [FK_Accessory_Type]
GO
ALTER TABLE [dbo].[Invoice_Accessory]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_Accessory_Account] FOREIGN KEY([buyerUsername])
REFERENCES [dbo].[Account] ([username])
GO
ALTER TABLE [dbo].[Invoice_Accessory] CHECK CONSTRAINT [FK_Invoice_Accessory_Account]
GO
ALTER TABLE [dbo].[Invoice_Accessory]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_Accessory_Account1] FOREIGN KEY([adminConfirm])
REFERENCES [dbo].[Account] ([username])
GO
ALTER TABLE [dbo].[Invoice_Accessory] CHECK CONSTRAINT [FK_Invoice_Accessory_Account1]
GO
ALTER TABLE [dbo].[Invoice_Accessory_Detail]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_Accessory_Detail_Accessory] FOREIGN KEY([accessoryID])
REFERENCES [dbo].[Accessory] ([accessoryID])
GO
ALTER TABLE [dbo].[Invoice_Accessory_Detail] CHECK CONSTRAINT [FK_Invoice_Accessory_Detail_Accessory]
GO
ALTER TABLE [dbo].[Invoice_Accessory_Detail]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_Accessory_Detail_Invoice_Accessory] FOREIGN KEY([invoiceID])
REFERENCES [dbo].[Invoice_Accessory] ([invoiceID])
GO
ALTER TABLE [dbo].[Invoice_Accessory_Detail] CHECK CONSTRAINT [FK_Invoice_Accessory_Detail_Invoice_Accessory]
GO
ALTER TABLE [dbo].[Invoice_Service]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_Service_Account] FOREIGN KEY([adminConfirm])
REFERENCES [dbo].[Account] ([username])
GO
ALTER TABLE [dbo].[Invoice_Service] CHECK CONSTRAINT [FK_Invoice_Service_Account]
GO
ALTER TABLE [dbo].[Invoice_Service]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_Service_Account1] FOREIGN KEY([buyerUsername])
REFERENCES [dbo].[Account] ([username])
GO
ALTER TABLE [dbo].[Invoice_Service] CHECK CONSTRAINT [FK_Invoice_Service_Account1]
GO
ALTER TABLE [dbo].[Invoice_Service_Detail]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_Service_Detail_Invoice_Service] FOREIGN KEY([invoiceID])
REFERENCES [dbo].[Invoice_Service] ([invoiceID])
GO
ALTER TABLE [dbo].[Invoice_Service_Detail] CHECK CONSTRAINT [FK_Invoice_Service_Detail_Invoice_Service]
GO
ALTER TABLE [dbo].[Invoice_Service_Detail]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_Service_Detail_Service] FOREIGN KEY([serviceID])
REFERENCES [dbo].[Service] ([serviceID])
GO
ALTER TABLE [dbo].[Invoice_Service_Detail] CHECK CONSTRAINT [FK_Invoice_Service_Detail_Service]
GO
ALTER TABLE [dbo].[Invoice_Service_Detail]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_Service_Detail_Service_Scheduler] FOREIGN KEY([scheduleID])
REFERENCES [dbo].[Service_Scheduler] ([id])
GO
ALTER TABLE [dbo].[Invoice_Service_Detail] CHECK CONSTRAINT [FK_Invoice_Service_Detail_Service_Scheduler]
GO
ALTER TABLE [dbo].[Invoice_Service_Detail]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_Service_Detail_Staff] FOREIGN KEY([staffDoing])
REFERENCES [dbo].[Staff] ([staffID])
GO
ALTER TABLE [dbo].[Invoice_Service_Detail] CHECK CONSTRAINT [FK_Invoice_Service_Detail_Staff]
GO
ALTER TABLE [dbo].[Pet]  WITH CHECK ADD  CONSTRAINT [FK_Pet_Type] FOREIGN KEY([typeID])
REFERENCES [dbo].[Type] ([typeID])
GO
ALTER TABLE [dbo].[Pet] CHECK CONSTRAINT [FK_Pet_Type]
GO
ALTER TABLE [dbo].[Pet]  WITH CHECK ADD  CONSTRAINT [FK_Pet_User] FOREIGN KEY([ownID])
REFERENCES [dbo].[Account] ([username])
GO
ALTER TABLE [dbo].[Pet] CHECK CONSTRAINT [FK_Pet_User]
GO
ALTER TABLE [dbo].[Service]  WITH CHECK ADD  CONSTRAINT [FK_Service_Type] FOREIGN KEY([forType])
REFERENCES [dbo].[Type] ([typeID])
GO
ALTER TABLE [dbo].[Service] CHECK CONSTRAINT [FK_Service_Type]
GO
ALTER TABLE [dbo].[Staff_Service_Detail]  WITH CHECK ADD  CONSTRAINT [FK_Staff_Service_Detail_Service] FOREIGN KEY([serviceID])
REFERENCES [dbo].[Service] ([serviceID])
GO
ALTER TABLE [dbo].[Staff_Service_Detail] CHECK CONSTRAINT [FK_Staff_Service_Detail_Service]
GO
ALTER TABLE [dbo].[Staff_Service_Detail]  WITH CHECK ADD  CONSTRAINT [FK_Staff_Service_Detail_Staff] FOREIGN KEY([staffID])
REFERENCES [dbo].[Staff] ([staffID])
GO
ALTER TABLE [dbo].[Staff_Service_Detail] CHECK CONSTRAINT [FK_Staff_Service_Detail_Staff]
GO
USE [master]
GO
ALTER DATABASE [PresentationPRJ321] SET  READ_WRITE 
GO
