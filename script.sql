USE [master]
GO
/****** Object:  Database [PresentationPRJ321]    Script Date: 6/30/2019 11:07:34 AM ******/
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
/****** Object:  Table [dbo].[Accessory]    Script Date: 6/30/2019 11:07:34 AM ******/
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
/****** Object:  Table [dbo].[Account]    Script Date: 6/30/2019 11:07:34 AM ******/
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
/****** Object:  Table [dbo].[Category]    Script Date: 6/30/2019 11:07:34 AM ******/
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
/****** Object:  Table [dbo].[Invoice_Accessory]    Script Date: 6/30/2019 11:07:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Invoice_Accessory](
	[invoiceID] [bigint] IDENTITY(1,1) NOT NULL,
	[createdTime] [datetime] NULL,
	[buyerUsername] [varchar](20) NULL,
	[status] [int] NULL,
	[adminConfirm] [varchar](20) NULL,
 CONSTRAINT [PK_Invoice_Accessory] PRIMARY KEY CLUSTERED 
(
	[invoiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Invoice_Accessory_Detail]    Script Date: 6/30/2019 11:07:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoice_Accessory_Detail](
	[accessoryID] [bigint] NOT NULL,
	[quantity] [int] NULL,
	[subPrice] [float] NULL,
	[invoiceID] [bigint] NOT NULL,
 CONSTRAINT [PK_Invoice_Accessory_Detail_1] PRIMARY KEY CLUSTERED 
(
	[accessoryID] ASC,
	[invoiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Invoice_Service]    Script Date: 6/30/2019 11:07:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Invoice_Service](
	[invoiceID] [bigint] IDENTITY(1,1) NOT NULL,
	[createTime] [datetime] NULL,
	[adminConfirm] [varchar](20) NULL,
	[price] [float] NULL,
	[status] [int] NULL,
	[doingDate] [varchar](50) NULL,
	[petID] [bigint] NULL,
	[staffDoing] [int] NULL,
	[timeStart] [float] NULL,
	[serviceID] [int] NULL,
	[duration] [float] NULL,
 CONSTRAINT [PK_Invoice_Service] PRIMARY KEY CLUSTERED 
(
	[invoiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Pet]    Script Date: 6/30/2019 11:07:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Pet](
	[petID] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[birthyear] [int] NULL,
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
/****** Object:  Table [dbo].[Service]    Script Date: 6/30/2019 11:07:34 AM ******/
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
/****** Object:  Table [dbo].[Staff]    Script Date: 6/30/2019 11:07:34 AM ******/
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
/****** Object:  Table [dbo].[Staff_Service_Detail]    Script Date: 6/30/2019 11:07:34 AM ******/
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
/****** Object:  Table [dbo].[Type]    Script Date: 6/30/2019 11:07:34 AM ******/
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

INSERT [dbo].[Accessory] ([accessoryID], [name], [brand], [price], [description], [categoryID], [quantity], [isDelete], [forType], [image]) VALUES (1, N'Chicken and Liver Pate', N'Smartheart', 1, N'Chicken and Liver Pate location for large dogs', 1, 2, 0, 1, N'1.jpg')
INSERT [dbo].[Accessory] ([accessoryID], [name], [brand], [price], [description], [categoryID], [quantity], [isDelete], [forType], [image]) VALUES (2, N'Pate Morando', N'Morando', 2, N'Pate Morando for your dog veal 400gr', 1, 98, 0, 1, N'2.png')
INSERT [dbo].[Accessory] ([accessoryID], [name], [brand], [price], [description], [categoryID], [quantity], [isDelete], [forType], [image]) VALUES (3, N'Tellme pork pate', N'Tellme', 0.800000011920929, N'Raw  Material:  50% pork liver, beef liver 25%, 10% lean meat, Fresh carrot 4%, 1% pea starch Hal Security, olive oil,  calcium extracted from eggshell and water.

Technology is processed using UHT technology, use heat-resistant bag bunker.', 1, 99, 0, 1, N'3.jpg')
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

b. Customers have the whole bill Petcity sales, warranty card, warranty stamp prescribed by each manufacturer.', 4, 50, 0, 2, N'28.jpg')
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

+ Selenium supports immune function', 1, 19, 0, 1, N'35.jpg')
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
INSERT [dbo].[Accessory] ([accessoryID], [name], [brand], [price], [description], [categoryID], [quantity], [isDelete], [forType], [image]) VALUES (41, N'Home Cat cat food 1.5kg bag', N'CTC Bio', 11, N'Cat food Cat Home & imported from Korea made specifically for cats of all ages improve fur, promote digestion and remove hair clots in the intestines of cats. Products using advanced materials easily digested brings delicious taste best and help improve the immune system, stimulates biological activity, improve nutrient absorption, enhance intestinal health and reduce the amount of rejection', 1, 100, 0, 2, N'41.jpg')
INSERT [dbo].[Accessory] ([accessoryID], [name], [brand], [price], [description], [categoryID], [quantity], [isDelete], [forType], [image]) VALUES (42, N'Royal Canin - Mini Starter mousse 195gr', N'Royal Canin', 5, N'Benefit

Promote the harmonious development

The formulas from Royal Canin STARTER MOUSSE fully meet the nutritional needs of dogs and Energy mother during pregnancy, lactation and for puppies during weaning.

Provide optimal nutrition

STARTER MOUSSE easily digested and absorbed

meal', 1, 100, 0, 2, N'42.jpg')
INSERT [dbo].[Accessory] ([accessoryID], [name], [brand], [price], [description], [categoryID], [quantity], [isDelete], [forType], [image]) VALUES (43, N'Pate for dogs beef flavor 130gr', N'SmartHeart', 1, N'Pate Smartheart 130gr beef flavor for big dog  products are researched and produced to suit the nutritional needs of your puppy home. With a full range of essential nutrients along with the taste of beef and mutton attractive, dog food  Pate Smartheart beef flavor dog 130gr  will surely be first choice to help your dog healthy development.', 1, 100, 0, 2, N'43.jpg')
INSERT [dbo].[Accessory] ([accessoryID], [name], [brand], [price], [description], [categoryID], [quantity], [isDelete], [forType], [image]) VALUES (44, N'100g pork pate Monge', N'Monge', 1.2999999523162842, N'The main raw material : Fresh Meat 80% (pork 10%), minerals and vitamins.

Nutrient composition:  Crude protein 9%, oils and fats 7%, 1.2% ash material, fiber 0.5%, humidity 82%, thickener, vitamin A 3000U.I./Kg, vitamin D3 400U .I. / Kg, 15 mg vitamin E / kg.

Uses 

- This product is rich in protein from pork, provides calcium and beneficial bacteria from the cheese. Help supplement the necessary nutrients for the body, support the creation of Mao, as dogs always feel healthy and relaxing 

- products rich in nutrients, help to promote the comprehensive development for puppies and addition of essential nutrients for dogs 

- Food and support the process of hematopoiesis and immune to the body increases.', 1, 100, 0, 2, N'44.jpg')
INSERT [dbo].[Accessory] ([accessoryID], [name], [brand], [price], [description], [categoryID], [quantity], [isDelete], [forType], [image]) VALUES (45, N'Pate Royal Canin - Recovery 195g', N'Royal Canin', 2.2999999523162842, N'ounded by scientists and veterinarians , Royal Canin has over 40 years of experience in the study of nutrition and health for pets. Our work and nutritionists, breeders and veterinarians from around the world is to provide knowledge and meet the nutritional needs specific to dogs and cats.

High energy to reduce food intake
Stimulate appetite
100% nutritionally balanced and balanced
Guarantee 100% satisfaction
Royal Canin RECOVERY is a kind of cat and dog food are appreciated, delicious, perfect and balanced nutrition helps to support rehabilitation for dogs and cats and is directed by a veterinarian', 1, 100, 0, 2, N'45.png')
INSERT [dbo].[Accessory] ([accessoryID], [name], [brand], [price], [description], [categoryID], [quantity], [isDelete], [forType], [image]) VALUES (46, N'Hagen Kitty rubber brush 5x10x23 cm', N'Hagen', 10, N'C. was founded by Rolf Hagen in 1955, Hagen became a manufacturer and distributor of pet products the world''s largest privately. Hagen constantly researching and producing the products that best meet the needs of the pet.

Production stage

In 1974, Hagen began producing glass cage wire and tanks. Today, thanks to the development of science, Hagen can easily research new products, creating conditions to become leaders in the manufacturing industry of pet accessories.

Products you can trust

With any pet owners do well always want to find the best products for the care of pets.

Hagen can share the love, passion and care for their pet along with you. With ingredients of the highest quality in all products grooming, Hagen always ensure quality from the design stage to the selection of raw materials for production processes packaged before launch school.', 4, 50, 0, 2, N'46.jpg')
INSERT [dbo].[Accessory] ([accessoryID], [name], [brand], [price], [description], [categoryID], [quantity], [isDelete], [forType], [image]) VALUES (47, N'Codos - Trimmer charging for dogs and cats CP6800', N'Codos', 250, N'Trimmer Codos for dogs and cats is designed in Korea

Design easy to use, operate: just press the button start simple

Trimmer blade material from stainless steel and titanium cermic reliability and excellence

Trimmer blades easily removable for cleaning

Enclosed design strategies help to dogs undergo gentle, pleasant

LED indicator monitors product you''re using or charging

The trimmer can be recharged easily: charging in 3 hours and can be used continuously for 5 hours

Color: Silver & Black

Clean: AC100V-240V / 50-60Hz

Battery: NI-CD 1.2V 2600mHa x 2

Weight: 2.2 pounds', 4, 30, 0, 2, N'47.jpg')
INSERT [dbo].[Accessory] ([accessoryID], [name], [brand], [price], [description], [categoryID], [quantity], [isDelete], [forType], [image]) VALUES (48, N'big iron brush 15.5 * 11cm for cats', N'Mon ami', 5, N'Large wire brush 15.5 * 11cm for cats and dogs

+ Breeding of dogs and cats, who must meet the nightmare feathers moulting season arrival or when playing cat and dog fur is that we daily flight. Even dogs cocker grass or short hair look so but the shedding season, you still feel full of dog hair sticking out of bed, table and chairs ...

+ With the brush or comb normal, you brushed finishing touches still see hair falling out because it still has not washed off.

+ With Brushes big hairy is the cat and dog care professionals worldwide recommend will eliminate over 90% of hair loss in dogs cats 

+ Suitable for both cat and dog fur short or long

- Remove dog hair loss in humans cling', 4, 100, 0, 2, N'48.jpg')
INSERT [dbo].[Accessory] ([accessoryID], [name], [brand], [price], [description], [categoryID], [quantity], [isDelete], [forType], [image]) VALUES (49, N'cat nail grinding machine CP-3300', N'Codos', 245, N'Product information:

-   Trimmer Codos CP-3300 nail lacquer .

- Voltage 100-240V

- Weight: 180gram.

- AC Adapter Input 100-200V 50 / 60Hz

- Output DC 2.4V / 800mA

- Warranty 12 months.', 4, 20, 0, 2, N'49.jpg')
INSERT [dbo].[Accessory] ([accessoryID], [name], [brand], [price], [description], [categoryID], [quantity], [isDelete], [forType], [image]) VALUES (50, N'Comb hair removal 16 * 6 cm Department', N'SS', 4, N'Comb hair removal 16 * 6 cm Department', 4, 100, 0, 2, N'50.jpg')
INSERT [dbo].[Accessory] ([accessoryID], [name], [brand], [price], [description], [categoryID], [quantity], [isDelete], [forType], [image]) VALUES (51, N'led bibs 1.5cm Wire', N'Petstar', 3, N'Petstar - led bibs 1.5cm Wire
Features of the thick  neck pet:

- Having sewn from thick fabric though, durable and soft will always create a sense of softness on pet neck and create comfort for your hands. 

- Remove the open quickly and can easily adjust the length, width suitable according to your wishes.

- With bright colors and fashionable products will help your pet look "cool" in every walk or jog', 2, 100, 0, 2, N'51.jpg')
INSERT [dbo].[Accessory] ([accessoryID], [name], [brand], [price], [description], [categoryID], [quantity], [isDelete], [forType], [image]) VALUES (52, N'SY - overalls with pockets full of earth 1cm', N'SY', 11, N' Material and design definitely thick for durability, while creating comfortable feeling when worn.

- In extremely tight overalls certainly help you "manage" the energetic puppy and mischievous easier.

- The motifs decorate funny and lovely bright colors.', 2, 100, 0, 2, N'52.jpg')
INSERT [dbo].[Accessory] ([accessoryID], [name], [brand], [price], [description], [categoryID], [quantity], [isDelete], [forType], [image]) VALUES (53, N'Shooting guard Petstyle 20-26 * 12cm', N'Petstar', 2.5, N'Shooting guard when using drugs 
+ This is for your safety tool when neck  for dog injections. 

+ You can be assured that the injection will no longer bite the puppy back into the hands of another.

+ Made from high-quality materials, safe from harm.', 2, 100, 0, 2, N'53.jpg')
INSERT [dbo].[Accessory] ([accessoryID], [name], [brand], [price], [description], [categoryID], [quantity], [isDelete], [forType], [image]) VALUES (54, N'FERPLAST transport cage Atlas Deluxe Open Premium S size (34x51x30cm)', N'FERPLAST', 100, N'FERPLAST, based in castelgomberto (province of Vicenza - Italy), founded in 1966 by Carlo VACCARI. In 50 years, FERPLAST joined the research and creation of innovative products, high quality safety to ensure comfort for the care of pets. Companies spend significant investments for research of advanced technologies for the production.

As a commercial enterprise typical of northeastern Italy, today FERPLAST produce more than 2000 kinds of products, has about 1,000 employees, distributed no less than 80 countries worldwide and has subsidiaries in Italy, France Germany, Great Britain, Scandinavia, Poland, Ukraine, Slovakia, Russia, Benelux and Brazil, has three production plants in Italy, Ukraine and Slovak Republic.', 2, 50, 0, 2, N'54.jpg')
INSERT [dbo].[Accessory] ([accessoryID], [name], [brand], [price], [description], [categoryID], [quantity], [isDelete], [forType], [image]) VALUES (55, N'Balo move Astronaut (plastic)', N'Petstar', 20, N'Bags used to transport pets: dogs, cats of many colors for you to choose

FEATURES

- Design unique astronaut, cute

- Material Plastic is easy to clean, breathable.

- 2 integrated door (rounded players, flat screen) easily changed. 

- Color striking, eye-catching', 2, 100, 0, 2, N'55.jpg')
INSERT [dbo].[Accessory] ([accessoryID], [name], [brand], [price], [description], [categoryID], [quantity], [isDelete], [forType], [image]) VALUES (56, N'cat climbing trees Wild WILD & NATURE', N'AFP', 175, N'Established since 1997, with 20 years of experience, the goal of the AFP and Pawise is to provide products for the pet with the best quality, safest with 95% of products were exported to markets Europe and the Americas.

AFP and Pawise always try our best to design the product to meet the needs of animals and match the style of the employer.

With the design of innovative experienced, professional staff and management team capable, AFP and Pawise asserting its position in the field of care for a pet, would like to bring the real safe, reliable and efficient service.

', 3, 100, 0, 2, N'56.jpg')
INSERT [dbo].[Accessory] ([accessoryID], [name], [brand], [price], [description], [categoryID], [quantity], [isDelete], [forType], [image]) VALUES (57, N'Mon ami rubber refusal hexagonal', N'Mon ami', 9, N'Description: 
- Toys pet Material rubber premium, are machined on modern lines and strict, for the extreme quality, safe and clean, you do not need to worry about power pet health, but comfortable for us to play with toys. 
- Color highlights, moreover Cityzoo also based on interests of pet, with designs attractive, guaranteed to attract the attention of the dog, toy hexagon will stimulate the interest of the dog with toys play. 
- Material rubber, small form factor, lightweight, portable pet and move easily. Bounce fit, do not harm the baby''s teeth out. There are small spikes to a pleasant massage for your pet.
- The product is ideal for pet have playtime relax, you can combine exercise with toys, advocacy healthy help improve health and increase the dynamism to your pet.', 3, 100, 0, 2, N'57.jpg')
INSERT [dbo].[Accessory] ([accessoryID], [name], [brand], [price], [description], [categoryID], [quantity], [isDelete], [forType], [image]) VALUES (58, N'Twisted shaped rubber toy', N'Rubbert', 11, N'Devoured every baby furniture is baby tooth replacement signs, or simply she is stressed or bored. The same time, rather than get angry with your baby, you should equip a dedicated baby toys. Metastable shape toy twisted from brand  Toys  Rubber T PetCity is extremely great solution in this case.

Product Features:

The product is made from 100% natural rubber, which has a soft, flexible, moderate persistent and particularly safe.
European standards, certification REACH, ROSH
Non-toxic, safe for pet bite and suck at.
High elasticity, durability
Size: 162.5x50x50 mm, Weight: 200g
Beautiful colors, attract the attention of your pet home.', 3, 100, 0, 2, N'58.jpg')
INSERT [dbo].[Accessory] ([accessoryID], [name], [brand], [price], [description], [categoryID], [quantity], [isDelete], [forType], [image]) VALUES (59, N'shaped cat toys cat CATZILLA', N'AFP', 9, N'Established since 1997, with 20 years of experience, the goal of the AFP and Pawise is to provide products for the pet with the best quality, safest with 95% of products were exported to markets Europe and the Americas.

AFP and Pawise always try our best to design the product to meet the needs of animals and match the style of the employer.

With the design of innovative experienced, professional staff and management team capable, AFP and Pawise asserting its position in the field of care for a pet, would like to bring the real safe, reliable and efficient service.', 3, 100, 0, 2, N'59.jpg')
INSERT [dbo].[Accessory] ([accessoryID], [name], [brand], [price], [description], [categoryID], [quantity], [isDelete], [forType], [image]) VALUES (60, N'Toys pork', N'Mon ami', 1.7999999523162842, N'Description: 
- Toys pork CityZoo is a product dedicated to the puppy a small family, made from rubber material durable, does not contain harmful chemicals, friendly to the environment, safe for health pet health. 
- Is the anthropomorphic pig turned crimson vivid and striking, is sure to attract the attention of mischievous dogs, hyperactive. 
- With a sleek design, eye-catching, to ensure safety and create excitement for pets, toys pork 13 x 9 x 9 CityZoo cm more and more consumers choose.', 3, 100, 0, 2, N'60.jpg')
INSERT [dbo].[Accessory] ([accessoryID], [name], [brand], [price], [description], [categoryID], [quantity], [isDelete], [forType], [image]) VALUES (61, N'Head rush mouse mats', N'Petstar', 11, N'Nails scraping carpet  sedge mouse office

+ Use a nail to scratch your pet.

+ Pets home you can enjoy without fear of scratching nails on a carpet rake scolded nail funny mice.

+ Photos vivid stimulate your pet.

+  Carpet nails scraping  toys for pets, designs and beautiful colors and attractive your house pet, durable material, definitely, the cheapest sale at PetCity.vn', 3, 100, 0, 2, N'61.jpg')
INSERT [dbo].[Accessory] ([accessoryID], [name], [brand], [price], [description], [categoryID], [quantity], [isDelete], [forType], [image]) VALUES (62, N'Sunseed Vita Prima Sunscription Dwarf Hamster Formula', N'Sunseed', 10, N'A high-diversity diet for dwarf hamsters, made from a tasty blend of oats, grains, vegetables, and fortified nutrients. Vita Prima Sunscription Dwarf Hamster Formula was designed with the specific nutritional needs of dwarf hamsters in mind. The delicious, oat- and grain-based formula is the high-quality diet that dwarf hamsters want, and pet parents trust to supply their furry companion with all the key essential nutrients needed to keep them healthy and happy.', 1, 100, 0, 3, N'62.jpg')
INSERT [dbo].[Accessory] ([accessoryID], [name], [brand], [price], [description], [categoryID], [quantity], [isDelete], [forType], [image]) VALUES (63, N'SupremePetfoods Tiny Friends Farm Hazel Hamster Tasty Mix (2 Pounds)', N'SupremePetfoods', 6.9899997711181641, N'Supreme Hazel Hamster is officially the first and only food to be approved by the National Hamster Council in the UK, this well-balanced mix includes soya, whole peanuts and sunflower seeds for extra succulent appeal to your hamster.', 1, 100, 0, 3, N'63.jpg')
INSERT [dbo].[Accessory] ([accessoryID], [name], [brand], [price], [description], [categoryID], [quantity], [isDelete], [forType], [image]) VALUES (64, N'Kaytee Fiesta Hamster Food', N'Kaytee', 13, N'Kaytee Fiesta Hamster and Gerbil food is a nutritionally fortified gourmet diet made of a premium blend of fruits, vegetables, seeds and grains offering maximum variety, fun and nutrition for small animals. Fiesta contains prebiotics and probiotics to support digestive health and is formulated with your small animal species in mind. Kaytee understands that sharing your life with a pet bird is not only enjoyable but very enriching. Kaytee shows our love by ensuring we provide your pet with the best nutrition for a long and healthy life. With over 150 years of nutritional experience, it''s no wonder why Kaytee is at the heart of every healthy feeding routine.', 1, 100, 0, 3, N'64.jpg')
INSERT [dbo].[Accessory] ([accessoryID], [name], [brand], [price], [description], [categoryID], [quantity], [isDelete], [forType], [image]) VALUES (65, N'Gentleman Gents Top Hat modeled by Louie, A Hamster...', N'Gents', 12.489999771118164, N'Louie is modeling the Gentleman Gents Top Hat....
The just right hat to compliment your Gentleman Gent Outfit or to wear just for fun.
Allie is Louie''s proud Mommy.', 2, 100, 0, 3, N'65.jpg')
INSERT [dbo].[Accessory] ([accessoryID], [name], [brand], [price], [description], [categoryID], [quantity], [isDelete], [forType], [image]) VALUES (66, N'Retro Black and White Checked Seersucker Summer Sun Dress', N'Gents', 29.989999771118164, N'Materials
Crochet, tulle, ribbon, bows, ribbon roses, silk flowers, crochet thread, novelty fabric, Halloween, Christmas, Spring, felt, yarn

more
A sweet little number.......
a must for your Spring and Summer wardrobe.

Fashionably styled...
a Retro Black and White Checked Sun Dress
with a Floral Belt accented with a Floral ', 2, 100, 0, 3, N'66.jpg')
INSERT [dbo].[Accessory] ([accessoryID], [name], [brand], [price], [description], [categoryID], [quantity], [isDelete], [forType], [image]) VALUES (67, N'Gentleman Gents Top Hat modeled by Cashew the Hamster', N'Gents', 12.489999771118164, N'On the Runway Fashion Show is Cashew an adorable Hamster....
Ruth Heron is Cashew''s proud Mommy.
He is modeling the just right hat to compliment your Gentleman Gent Outfit or to wear just for fun.', 2, 100, 0, 3, N'67.jpg')
INSERT [dbo].[Accessory] ([accessoryID], [name], [brand], [price], [description], [categoryID], [quantity], [isDelete], [forType], [image]) VALUES (68, N'Guinea pig clothes, Guinea pig hat', N'Guniea', 5.809999942779541, N'This listing is for ONE guinea pig hat (Reptile hat, Hedgehog hat, Hat for snake)
This hat can be used like Guinea pig clothes, Rat clothes, Bearded dragon clothes, Hamster clothes and for other small pets.', 2, 100, 0, 3, N'68.jpg')
INSERT [dbo].[Accessory] ([accessoryID], [name], [brand], [price], [description], [categoryID], [quantity], [isDelete], [forType], [image]) VALUES (69, N'Witchy Diva', N'Witchy', 33.9900016784668, N'Crochet, tulle, ribbon, bows, ribbon roses, silk flowers, crochet thread, novelty fabric, Halloween, Christmas, Spring, Easter, yarn

more
This isn''t a ugly Witch.......she is a good witch.....a Diva Witch.
Crochet Bodice with tons of ruffled Purple and Black Tulle and accented with Purple Ribbon Roses.', 2, 100, 0, 3, N'69.jpg')
INSERT [dbo].[Accessory] ([accessoryID], [name], [brand], [price], [description], [categoryID], [quantity], [isDelete], [forType], [image]) VALUES (70, N'Pet Cat Bunny Chew Play Toy Grass Ball for Rabbit Hamster Guinea Pig 6cm/10cm', N'Bunny', 5.5100002288818359, N'Pet Cat Bunny Chew Play Toy Grass Ball for Rabbit Hamster Guinea Pig 6cm/10cm', 3, 100, 0, 3, N'70.jpg')
INSERT [dbo].[Accessory] ([accessoryID], [name], [brand], [price], [description], [categoryID], [quantity], [isDelete], [forType], [image]) VALUES (71, N'3 Colors Small Animal Corner Litter Toilet Pan Tray Rabbit Hamster Guinea Pig', N'Corner', 8.7799997329711914, N'3 Colors Small Animal Corner Litter Toilet Pan Tray Rabbit Hamster Guinea Pig', 3, 100, 0, 3, N'71.jpg')
INSERT [dbo].[Accessory] ([accessoryID], [name], [brand], [price], [description], [categoryID], [quantity], [isDelete], [forType], [image]) VALUES (72, N'Littlest Pet Shop Hamster Playground', N'Little Pet', 64.989997863769531, N'Tuck in your two little friends in the sleeping area and wish them sweet dreams — until it’s time to play again!
Activity-packed playset features all kinds of things for you to do with your adorable hamster and mouse pets!
Hamster ball, wheel and spinning perch help you to keep your pets “active”!
Drop “treats” to your pets through the feeding area and “tuck your pets in” for “naps” in the sleeping area.
Playset comes with 2 pets and accessories.', 3, 100, 0, 3, N'72.jpg')
INSERT [dbo].[Accessory] ([accessoryID], [name], [brand], [price], [description], [categoryID], [quantity], [isDelete], [forType], [image]) VALUES (73, N'ALEX SOCOLA BIG SIZE', N'ALEX', 20, N'ALEX SOCOLA BIG SIZE', 3, 50, 0, 3, N'73.jpg')
INSERT [dbo].[Accessory] ([accessoryID], [name], [brand], [price], [description], [categoryID], [quantity], [isDelete], [forType], [image]) VALUES (74, N'NATURALS TRIO OF FUN BALLS MEDIUM', N'TRIO', 3.2899999618530273, N'This assortment of fun balls is ideal for small animals to keep them entertained for hours.  Each ball is made from 100% natural materials including rattan, seagrass and water hyacinth. They are also glue and staple free.', 3, 100, 0, 3, N'74.jpg')
INSERT [dbo].[Accessory] ([accessoryID], [name], [brand], [price], [description], [categoryID], [quantity], [isDelete], [forType], [image]) VALUES (75, N'Shower gel for sensitive skin Smoothing Joyce & Dolls', N'Joyce', 10, N'Shower gel for dogs and cats sensitive skin - Joyce & Dolls Soothing extracted from 8 flowers natural herbs: flowering honeysuckle, chrysanthemum, rosemary, flavescens, flower skull, pueraria, chamomile forest, flowers cinnamon to create a product capable of treatment and prevention of symptoms such as skin irritation, itching, rash and hair loss phenomenon, discoloration of the skin in dogs and cats ...

Joyce & Dolls Soothing formula with the best pet
Cat dog shower gel for sensitive skin - Joyce & Dolls additional Soothing Moisturizing formed on the surface of the skin, and provide essential nutrients to protect animals from outside. Gentle, non-irritating to the eyes of the animals and also contains less components harmless additives.', 4, 100, 0, 3, N'75.jpg')
INSERT [dbo].[Accessory] ([accessoryID], [name], [brand], [price], [description], [categoryID], [quantity], [isDelete], [forType], [image]) VALUES (76, N'Fungal dermatitis bath Joyce & Dolls Clear', N'Joyce', 10, N'Shower gel for dogs and cats fungal treatment - Joyce & Dolls DP300 Clear with active safe, effective and has no side effects will help pet no longer itchy skin surface and protects better. In addition to highly effective microbicides, products also have the ability to inhibit bacteria back.

Joyce & Dolls Clear bath suit all breeds
Coordinator component materials Bisabolol against susceptible and prevent itching effective. Fungal dermatitis bath for dogs and cats - Joyce & Dolls Clear produced on technological lines of CIBA Swiss invention. Products for dogs susceptible to diseases of the skin, itching, such as Labrador, Patches, Alaskan, Husky, Samoyed, Schnauzer, Dobermann, Dachshund, Pug, Corgi, ...

Extra milk using fungal dermatitis treatment for dogs cats - Joyce & Dolls Clear
Drain pet fur wet surface with warm water. Spray bottle of shower gel Joyce & Dolls Clear from 3 to 5 times diluted moderately with water rated foam and soap bath rub all over the body of the pet, from front to back first, then the body, legs and arms . Wait for the milk bath infused into fur and leather to absorb the nutrients the body about 5 minutes pets. Then washed with water and dried for pets. Note: rinse with clean water to avoid too many times to wash out the nutrients composition of Joyce & Dolls Clear shower gel.

Volume: 650ml. Expiry date: 36 months from date of manufacture.', 4, 100, 0, 3, N'76.jpg')
INSERT [dbo].[Accessory] ([accessoryID], [name], [brand], [price], [description], [categoryID], [quantity], [isDelete], [forType], [image]) VALUES (77, N'Shampoo and blow Tropiclean (2 in 1) extracted from papaya and coconut', N'Tropiclean', 15, N'For a shiny coat, always sweet, dogs (cats), you need to use the shampoo and exhaust products from brand Tropiclean. In addition, the product also has the ability to prevent hair breakage and tangled fibers when used regularly.

Product Features:

Is the combination of shampoo and exhaust 2 in 1.
Extracts from natural ingredients: papaya, coconut, mango, pomegranate, kiwi, ...
Help cleanse gently, natural moisture balance to the skin and hair.
Leather and fur animals will always soft, shiny, pleasant aroma.
Prevent hair breakage and tangled fibers.
', 4, 100, 0, 3, N'77.jpg')
INSERT [dbo].[Accessory] ([accessoryID], [name], [brand], [price], [description], [categoryID], [quantity], [isDelete], [forType], [image]) VALUES (78, N'Puppy bath exhaust HQ', N'Budle ''Budle', 10, N'+ Shampoo and conditioner products are made from soft materials, derived naturally not tear.

+ Shampoo conditioner combination for dogs cats

+ Helps dog fur silky clean and without breakage or tangled fibers

+ Moisturize well, add shine to the hair, does not irritate sensitive skin

Usage : wet hair with warm water, remove all shampoo and rub gently, then rinse with water

Main ingredient:

Organic green tea extract, rosemary, olive oil and roots lyly madonna.

Preserved in a dry environment

Expiry 3 years from date of manufacture

Made in Korea

weight: 500g', 4, 110, 0, 3, N'78.jpg')
INSERT [dbo].[Accessory] ([accessoryID], [name], [brand], [price], [description], [categoryID], [quantity], [isDelete], [forType], [image]) VALUES (79, N'Longhaired cat Trixie bath oil 250ml', N'Trixie', 11, N'Shampoo for cats Shampoo Trixie Langhaar with the main effect in softening silky pet fur. This bath milk products best suited to the long-haired cats. Shower gel has low chemical concentrations suitable for cats with sensitive skin prone to irritation with soap.

Ingredients shampoo for cats friendly for all skin types
Is shampoo for cats Shampoo Trixie Langhaar be manipulated with the ingenious professionals maximum reduce chemical concentrations. Component high moisturizing effect and smooth coat polish derived primarily from natural, absolutely safe for the cat''s skin.

Using shampoo Trixie Honig Shampoo
Gently waterproof gradually all over the body, hands and lather shampoo for cats Trixie Shampoo diluted Langhaar all over the body surface from the neck cat started down the body. Massage gently throughout the body cat clean dirt and then rinse with water. Lau, dried pet fur.', 4, 110, 0, 3, N'79.jpg')
SET IDENTITY_INSERT [dbo].[Accessory] OFF
INSERT [dbo].[Account] ([username], [password], [fullname], [address], [phone], [isDelete], [gender], [role]) VALUES (N'admin', N'admin', N'Tran Thien Phuc', NULL, N'', 0, 1, N'admin')
INSERT [dbo].[Account] ([username], [password], [fullname], [address], [phone], [isDelete], [gender], [role]) VALUES (N'admin1', N'admin1', N'Ngo Van Sang', NULL, N'', 0, 0, N'admin')
INSERT [dbo].[Account] ([username], [password], [fullname], [address], [phone], [isDelete], [gender], [role]) VALUES (N'admin123', N'123456', N'ad', NULL, N'', 1, 1, N'admin')
INSERT [dbo].[Account] ([username], [password], [fullname], [address], [phone], [isDelete], [gender], [role]) VALUES (N'adminmin', N'123456', N'asd', N'doan xem', N'32222222', 0, 1, N'member')
INSERT [dbo].[Account] ([username], [password], [fullname], [address], [phone], [isDelete], [gender], [role]) VALUES (N'ahihidongok', N'ahihiahihi', N'Ahihi Do Ngoc', NULL, N'', 0, 1, N'admin')
INSERT [dbo].[Account] ([username], [password], [fullname], [address], [phone], [isDelete], [gender], [role]) VALUES (N'doggpet123', N'12345678', N'Dogg Pet', NULL, N'', 1, 0, N'member')
INSERT [dbo].[Account] ([username], [password], [fullname], [address], [phone], [isDelete], [gender], [role]) VALUES (N'ducducduc', N'kanjisan', N'Ngoc Duc', NULL, N'', 0, 1, N'member')
INSERT [dbo].[Account] ([username], [password], [fullname], [address], [phone], [isDelete], [gender], [role]) VALUES (N'gaugaugau', N'123456', N'Phuc Gau Gau', NULL, N'', 0, 1, N'member')
INSERT [dbo].[Account] ([username], [password], [fullname], [address], [phone], [isDelete], [gender], [role]) VALUES (N'HoangDuc', N'456789', N'Bui Thong Hoang Duc', NULL, N'', 0, 1, N'member')
INSERT [dbo].[Account] ([username], [password], [fullname], [address], [phone], [isDelete], [gender], [role]) VALUES (N'hongkong', N'hongkong', N'Hong Kong', NULL, N'', 0, 0, N'member')
INSERT [dbo].[Account] ([username], [password], [fullname], [address], [phone], [isDelete], [gender], [role]) VALUES (N'hongkong1', N'hongkong1', N'Hong Kong', N'FPT', N'070712345', 0, 0, N'member')
INSERT [dbo].[Account] ([username], [password], [fullname], [address], [phone], [isDelete], [gender], [role]) VALUES (N'hongkong2', N'hongkong', N'Hong Kong', NULL, N'', 0, 1, N'member')
INSERT [dbo].[Account] ([username], [password], [fullname], [address], [phone], [isDelete], [gender], [role]) VALUES (N'hongkong3', N'hongkong', N'Hong Kong', NULL, N'', 1, 1, N'member')
INSERT [dbo].[Account] ([username], [password], [fullname], [address], [phone], [isDelete], [gender], [role]) VALUES (N'passpass', N'javawebne', N'Java Web', NULL, N'', 0, 0, N'member')
INSERT [dbo].[Account] ([username], [password], [fullname], [address], [phone], [isDelete], [gender], [role]) VALUES (N'phucphuc', N'phucphuc', N'Phuc Thien', NULL, N'', 0, 1, N'member')
INSERT [dbo].[Account] ([username], [password], [fullname], [address], [phone], [isDelete], [gender], [role]) VALUES (N'phuctt', N'phuctt', N'Phuc Tran', N'Q12', N'0707169628', 0, 1, N'member')
INSERT [dbo].[Account] ([username], [password], [fullname], [address], [phone], [isDelete], [gender], [role]) VALUES (N'something123', N'something', N'Some Thing', NULL, N'', 0, 0, N'admin')
INSERT [dbo].[Account] ([username], [password], [fullname], [address], [phone], [isDelete], [gender], [role]) VALUES (N'something1234', N'12345678', N'Test', NULL, N'', 1, 1, N'admin')
INSERT [dbo].[Account] ([username], [password], [fullname], [address], [phone], [isDelete], [gender], [role]) VALUES (N'thienphuc', N'thienphuc', N'Phuc', NULL, N'', 0, 0, N'member')
INSERT [dbo].[Account] ([username], [password], [fullname], [address], [phone], [isDelete], [gender], [role]) VALUES (N'thongthe', N'12345678', N'The Thong', NULL, N'', 0, 1, N'member')
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([categoryID], [name], [isDelete]) VALUES (1, N'Food', 0)
INSERT [dbo].[Category] ([categoryID], [name], [isDelete]) VALUES (2, N'Clothes', 0)
INSERT [dbo].[Category] ([categoryID], [name], [isDelete]) VALUES (3, N'Toys', 0)
INSERT [dbo].[Category] ([categoryID], [name], [isDelete]) VALUES (4, N'Comestics', 0)
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Invoice_Accessory] ON 

INSERT [dbo].[Invoice_Accessory] ([invoiceID], [createdTime], [buyerUsername], [status], [adminConfirm]) VALUES (1, CAST(N'1970-01-01 07:00:00.023' AS DateTime), N'phuctt', 1, N'admin')
INSERT [dbo].[Invoice_Accessory] ([invoiceID], [createdTime], [buyerUsername], [status], [adminConfirm]) VALUES (2, CAST(N'2019-06-22 20:17:51.790' AS DateTime), N'phuctt', 1, N'admin')
INSERT [dbo].[Invoice_Accessory] ([invoiceID], [createdTime], [buyerUsername], [status], [adminConfirm]) VALUES (3, CAST(N'2019-06-23 11:46:15.940' AS DateTime), N'hongkong1', -1, NULL)
INSERT [dbo].[Invoice_Accessory] ([invoiceID], [createdTime], [buyerUsername], [status], [adminConfirm]) VALUES (4, CAST(N'2019-06-27 17:10:08.977' AS DateTime), N'phuctt', -1, NULL)
INSERT [dbo].[Invoice_Accessory] ([invoiceID], [createdTime], [buyerUsername], [status], [adminConfirm]) VALUES (5, CAST(N'2019-06-28 07:34:20.687' AS DateTime), N'hongkong1', -1, NULL)
INSERT [dbo].[Invoice_Accessory] ([invoiceID], [createdTime], [buyerUsername], [status], [adminConfirm]) VALUES (6, CAST(N'2019-06-28 07:38:59.493' AS DateTime), N'phuctt', -1, NULL)
INSERT [dbo].[Invoice_Accessory] ([invoiceID], [createdTime], [buyerUsername], [status], [adminConfirm]) VALUES (7, CAST(N'2019-06-28 07:41:40.387' AS DateTime), N'phuctt', -1, NULL)
INSERT [dbo].[Invoice_Accessory] ([invoiceID], [createdTime], [buyerUsername], [status], [adminConfirm]) VALUES (8, CAST(N'2019-06-30 08:21:42.213' AS DateTime), N'hongkong1', -1, NULL)
SET IDENTITY_INSERT [dbo].[Invoice_Accessory] OFF
INSERT [dbo].[Invoice_Accessory_Detail] ([accessoryID], [quantity], [subPrice], [invoiceID]) VALUES (1, 2, 1, 3)
INSERT [dbo].[Invoice_Accessory_Detail] ([accessoryID], [quantity], [subPrice], [invoiceID]) VALUES (2, 1, 2, 1)
INSERT [dbo].[Invoice_Accessory_Detail] ([accessoryID], [quantity], [subPrice], [invoiceID]) VALUES (2, 1, 2, 2)
INSERT [dbo].[Invoice_Accessory_Detail] ([accessoryID], [quantity], [subPrice], [invoiceID]) VALUES (3, 1, 0.800000011920929, 1)
INSERT [dbo].[Invoice_Accessory_Detail] ([accessoryID], [quantity], [subPrice], [invoiceID]) VALUES (13, 1, 17.5, 8)
INSERT [dbo].[Invoice_Accessory_Detail] ([accessoryID], [quantity], [subPrice], [invoiceID]) VALUES (18, 1, 9.75, 7)
INSERT [dbo].[Invoice_Accessory_Detail] ([accessoryID], [quantity], [subPrice], [invoiceID]) VALUES (25, 1, 11, 6)
INSERT [dbo].[Invoice_Accessory_Detail] ([accessoryID], [quantity], [subPrice], [invoiceID]) VALUES (32, 1, 10, 8)
INSERT [dbo].[Invoice_Accessory_Detail] ([accessoryID], [quantity], [subPrice], [invoiceID]) VALUES (33, 1, 5, 5)
INSERT [dbo].[Invoice_Accessory_Detail] ([accessoryID], [quantity], [subPrice], [invoiceID]) VALUES (35, 1, 6.5, 1)
INSERT [dbo].[Invoice_Accessory_Detail] ([accessoryID], [quantity], [subPrice], [invoiceID]) VALUES (40, 1, 10.5, 4)
SET IDENTITY_INSERT [dbo].[Invoice_Service] ON 

INSERT [dbo].[Invoice_Service] ([invoiceID], [createTime], [adminConfirm], [price], [status], [doingDate], [petID], [staffDoing], [timeStart], [serviceID], [duration]) VALUES (1, CAST(N'2019-06-27 17:00:54.317' AS DateTime), N'admin', 20, 1, N'Friday - 28/6/2019', 2, 6, 8, 5, 2)
INSERT [dbo].[Invoice_Service] ([invoiceID], [createTime], [adminConfirm], [price], [status], [doingDate], [petID], [staffDoing], [timeStart], [serviceID], [duration]) VALUES (2, CAST(N'2019-06-29 10:32:18.680' AS DateTime), N'admin', 8, 1, N'Saturday - 29/6/2019', 8, 2, 17, 2, 0.5)
INSERT [dbo].[Invoice_Service] ([invoiceID], [createTime], [adminConfirm], [price], [status], [doingDate], [petID], [staffDoing], [timeStart], [serviceID], [duration]) VALUES (3, CAST(N'2019-06-29 10:32:29.870' AS DateTime), N'admin', 10, 1, N'Sunday - 30/6/2019', 10, 7, 8.5, 1, 0.5)
INSERT [dbo].[Invoice_Service] ([invoiceID], [createTime], [adminConfirm], [price], [status], [doingDate], [petID], [staffDoing], [timeStart], [serviceID], [duration]) VALUES (4, CAST(N'2019-06-29 10:32:44.330' AS DateTime), N'admin', 5, -1, N'Sunday - 30/6/2019', 9, NULL, 8, 8, 1)
INSERT [dbo].[Invoice_Service] ([invoiceID], [createTime], [adminConfirm], [price], [status], [doingDate], [petID], [staffDoing], [timeStart], [serviceID], [duration]) VALUES (5, CAST(N'2019-06-29 10:32:48.443' AS DateTime), N'admin', 5, -1, N'Sunday - 30/6/2019', 11, NULL, 8, 8, 1)
INSERT [dbo].[Invoice_Service] ([invoiceID], [createTime], [adminConfirm], [price], [status], [doingDate], [petID], [staffDoing], [timeStart], [serviceID], [duration]) VALUES (6, CAST(N'2019-06-29 10:33:36.957' AS DateTime), N'admin', 10, 1, N'Saturday - 29/6/2019', 10, 3, 17.5, 1, 0.5)
INSERT [dbo].[Invoice_Service] ([invoiceID], [createTime], [adminConfirm], [price], [status], [doingDate], [petID], [staffDoing], [timeStart], [serviceID], [duration]) VALUES (7, CAST(N'2019-06-29 10:34:01.683' AS DateTime), N'admin', 20, 1, N'Sunday - 30/6/2019', 12, 7, 8, 5, 2)
INSERT [dbo].[Invoice_Service] ([invoiceID], [createTime], [adminConfirm], [price], [status], [doingDate], [petID], [staffDoing], [timeStart], [serviceID], [duration]) VALUES (8, CAST(N'2019-06-29 11:08:58.927' AS DateTime), N'admin', 20, 1, N'Sunday - 30/6/2019', 2, 6, 8, 5, 2)
INSERT [dbo].[Invoice_Service] ([invoiceID], [createTime], [adminConfirm], [price], [status], [doingDate], [petID], [staffDoing], [timeStart], [serviceID], [duration]) VALUES (9, CAST(N'2019-06-29 11:09:49.203' AS DateTime), N'admin', 22, 1, N'Sunday - 30/6/2019', 14, 5, 8, 6, 1.5)
INSERT [dbo].[Invoice_Service] ([invoiceID], [createTime], [adminConfirm], [price], [status], [doingDate], [petID], [staffDoing], [timeStart], [serviceID], [duration]) VALUES (10, CAST(N'2019-06-29 11:20:47.443' AS DateTime), N'admin', 5, 1, N'Sunday - 30/6/2019', 16, 2, 8, 8, 1)
INSERT [dbo].[Invoice_Service] ([invoiceID], [createTime], [adminConfirm], [price], [status], [doingDate], [petID], [staffDoing], [timeStart], [serviceID], [duration]) VALUES (11, CAST(N'2019-06-29 11:24:38.903' AS DateTime), N'admin', 5, 1, N'Sunday - 30/6/2019', 17, 3, 8, 8, 1)
INSERT [dbo].[Invoice_Service] ([invoiceID], [createTime], [adminConfirm], [price], [status], [doingDate], [petID], [staffDoing], [timeStart], [serviceID], [duration]) VALUES (12, CAST(N'2019-06-29 11:24:50.080' AS DateTime), N'admin', 5, 1, N'Sunday - 30/6/2019', 19, 4, 8, 8, 1)
INSERT [dbo].[Invoice_Service] ([invoiceID], [createTime], [adminConfirm], [price], [status], [doingDate], [petID], [staffDoing], [timeStart], [serviceID], [duration]) VALUES (13, CAST(N'2019-06-29 11:24:59.373' AS DateTime), N'admin', 5, -1, N'Sunday - 30/6/2019', 20, NULL, 8, 8, 1)
INSERT [dbo].[Invoice_Service] ([invoiceID], [createTime], [adminConfirm], [price], [status], [doingDate], [petID], [staffDoing], [timeStart], [serviceID], [duration]) VALUES (14, CAST(N'2019-06-29 11:25:08.667' AS DateTime), N'admin', 5, -1, N'Sunday - 30/6/2019', 21, NULL, 8, 8, 1)
INSERT [dbo].[Invoice_Service] ([invoiceID], [createTime], [adminConfirm], [price], [status], [doingDate], [petID], [staffDoing], [timeStart], [serviceID], [duration]) VALUES (15, CAST(N'2019-06-30 08:46:13.977' AS DateTime), N'admin', 10, -1, N'Monday - 1/7/2019', 3, NULL, 8, 4, 1)
INSERT [dbo].[Invoice_Service] ([invoiceID], [createTime], [adminConfirm], [price], [status], [doingDate], [petID], [staffDoing], [timeStart], [serviceID], [duration]) VALUES (16, CAST(N'2019-06-30 08:46:29.987' AS DateTime), N'admin', 10, 1, N'Monday - 1/7/2019', 4, 2, 8, 4, 1)
INSERT [dbo].[Invoice_Service] ([invoiceID], [createTime], [adminConfirm], [price], [status], [doingDate], [petID], [staffDoing], [timeStart], [serviceID], [duration]) VALUES (17, CAST(N'2019-06-30 08:46:38.630' AS DateTime), N'admin', 10, 1, N'Monday - 1/7/2019', 5, 3, 8, 4, 1)
INSERT [dbo].[Invoice_Service] ([invoiceID], [createTime], [adminConfirm], [price], [status], [doingDate], [petID], [staffDoing], [timeStart], [serviceID], [duration]) VALUES (18, CAST(N'2019-06-30 08:46:47.343' AS DateTime), N'admin', 10, 1, N'Monday - 1/7/2019', 25, 5, 8, 4, 1)
INSERT [dbo].[Invoice_Service] ([invoiceID], [createTime], [adminConfirm], [price], [status], [doingDate], [petID], [staffDoing], [timeStart], [serviceID], [duration]) VALUES (19, CAST(N'2019-06-30 08:48:13.413' AS DateTime), N'admin', 10, 1, N'Monday - 1/7/2019', 14, 10, 8, 4, 1)
INSERT [dbo].[Invoice_Service] ([invoiceID], [createTime], [adminConfirm], [price], [status], [doingDate], [petID], [staffDoing], [timeStart], [serviceID], [duration]) VALUES (20, CAST(N'2019-06-30 09:51:31.450' AS DateTime), NULL, 5, -1, N'Monday - 1/7/2019', 2, NULL, 8, 8, 1)
SET IDENTITY_INSERT [dbo].[Invoice_Service] OFF
SET IDENTITY_INSERT [dbo].[Pet] ON 

INSERT [dbo].[Pet] ([petID], [name], [birthyear], [ownID], [typeID], [gender], [isDelete]) VALUES (1, N'Bunny', 2017, N'phuctt', 3, 0, 0)
INSERT [dbo].[Pet] ([petID], [name], [birthyear], [ownID], [typeID], [gender], [isDelete]) VALUES (2, N'Kichi', 2017, N'phuctt', 1, 0, 0)
INSERT [dbo].[Pet] ([petID], [name], [birthyear], [ownID], [typeID], [gender], [isDelete]) VALUES (3, N'Phuc', 2000, N'hongkong1', 2, 1, 0)
INSERT [dbo].[Pet] ([petID], [name], [birthyear], [ownID], [typeID], [gender], [isDelete]) VALUES (4, N'Huy', 2000, N'hongkong1', 2, 1, 0)
INSERT [dbo].[Pet] ([petID], [name], [birthyear], [ownID], [typeID], [gender], [isDelete]) VALUES (5, N'HP', 2000, N'hongkong1', 2, 1, 0)
INSERT [dbo].[Pet] ([petID], [name], [birthyear], [ownID], [typeID], [gender], [isDelete]) VALUES (6, N'ABC', 2015, N'thienphuc', 1, 0, 1)
INSERT [dbo].[Pet] ([petID], [name], [birthyear], [ownID], [typeID], [gender], [isDelete]) VALUES (7, N'Nguyen', 2000, N'HoangDuc', 1, 1, 0)
INSERT [dbo].[Pet] ([petID], [name], [birthyear], [ownID], [typeID], [gender], [isDelete]) VALUES (8, N'Meo Meo', 2008, N'thongthe', 2, 1, 0)
INSERT [dbo].[Pet] ([petID], [name], [birthyear], [ownID], [typeID], [gender], [isDelete]) VALUES (9, N'nguyen', 2000, N'HoangDuc', 1, 1, 0)
INSERT [dbo].[Pet] ([petID], [name], [birthyear], [ownID], [typeID], [gender], [isDelete]) VALUES (10, N'nguyen', 2000, N'HoangDuc', 1, 1, 0)
INSERT [dbo].[Pet] ([petID], [name], [birthyear], [ownID], [typeID], [gender], [isDelete]) VALUES (11, N'Hai', 2000, N'gaugaugau', 1, 1, 0)
INSERT [dbo].[Pet] ([petID], [name], [birthyear], [ownID], [typeID], [gender], [isDelete]) VALUES (12, N'Mi', 2001, N'thongthe', 1, 0, 0)
INSERT [dbo].[Pet] ([petID], [name], [birthyear], [ownID], [typeID], [gender], [isDelete]) VALUES (13, N'Man', 2000, N'thongthe', 1, 1, 0)
INSERT [dbo].[Pet] ([petID], [name], [birthyear], [ownID], [typeID], [gender], [isDelete]) VALUES (14, N'Akia', 2015, N'phuctt', 2, 0, 0)
INSERT [dbo].[Pet] ([petID], [name], [birthyear], [ownID], [typeID], [gender], [isDelete]) VALUES (15, N'Mouseser', 2017, N'phuctt', 3, 0, 0)
INSERT [dbo].[Pet] ([petID], [name], [birthyear], [ownID], [typeID], [gender], [isDelete]) VALUES (16, N'Ai biet', 2001, N'adminmin', 1, 0, 0)
INSERT [dbo].[Pet] ([petID], [name], [birthyear], [ownID], [typeID], [gender], [isDelete]) VALUES (17, N'ai biet 1', 2002, N'adminmin', 1, 1, 0)
INSERT [dbo].[Pet] ([petID], [name], [birthyear], [ownID], [typeID], [gender], [isDelete]) VALUES (18, N'ai biet 2', 2000, N'adminmin', 1, 1, 0)
INSERT [dbo].[Pet] ([petID], [name], [birthyear], [ownID], [typeID], [gender], [isDelete]) VALUES (19, N'ai biet 3', 2000, N'adminmin', 1, 1, 0)
INSERT [dbo].[Pet] ([petID], [name], [birthyear], [ownID], [typeID], [gender], [isDelete]) VALUES (20, N'ai biet 4', 2000, N'adminmin', 1, 1, 0)
INSERT [dbo].[Pet] ([petID], [name], [birthyear], [ownID], [typeID], [gender], [isDelete]) VALUES (21, N'ai biet 5', 2002, N'adminmin', 1, 1, 0)
INSERT [dbo].[Pet] ([petID], [name], [birthyear], [ownID], [typeID], [gender], [isDelete]) VALUES (22, N'ai biet 6', 2000, N'adminmin', 1, 1, 0)
INSERT [dbo].[Pet] ([petID], [name], [birthyear], [ownID], [typeID], [gender], [isDelete]) VALUES (23, N'ai biet 7', 2001, N'adminmin', 1, 1, 0)
INSERT [dbo].[Pet] ([petID], [name], [birthyear], [ownID], [typeID], [gender], [isDelete]) VALUES (24, N'ai biet 8', 2000, N'adminmin', 1, 1, 0)
INSERT [dbo].[Pet] ([petID], [name], [birthyear], [ownID], [typeID], [gender], [isDelete]) VALUES (25, N'huki', 2000, N'hongkong1', 2, 1, 0)
SET IDENTITY_INSERT [dbo].[Pet] OFF
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
INSERT [dbo].[Staff] ([staffID], [staffName], [image], [isAvailable], [isDelete], [gender]) VALUES (2, N'Nguyen Hoang', N'2.jpg', 1, 0, 0)
INSERT [dbo].[Staff] ([staffID], [staffName], [image], [isAvailable], [isDelete], [gender]) VALUES (3, N'Bui Tan', N'3.jpg', 1, 0, 1)
INSERT [dbo].[Staff] ([staffID], [staffName], [image], [isAvailable], [isDelete], [gender]) VALUES (4, N'Phuong Hao', N'4.jpg', 1, 0, 0)
INSERT [dbo].[Staff] ([staffID], [staffName], [image], [isAvailable], [isDelete], [gender]) VALUES (5, N'Ngoc Thao', N'5.jpg', 1, 0, 0)
INSERT [dbo].[Staff] ([staffID], [staffName], [image], [isAvailable], [isDelete], [gender]) VALUES (6, N'Bao Tran', N'6.jpg', 1, 0, 0)
INSERT [dbo].[Staff] ([staffID], [staffName], [image], [isAvailable], [isDelete], [gender]) VALUES (7, N'Bao Khanh', N'7.jpg', 1, 0, 0)
INSERT [dbo].[Staff] ([staffID], [staffName], [image], [isAvailable], [isDelete], [gender]) VALUES (8, N'Hong Nghia', N'8.jpg', 1, 0, 0)
INSERT [dbo].[Staff] ([staffID], [staffName], [image], [isAvailable], [isDelete], [gender]) VALUES (9, N'Kim Khanh', N'9.jpg', 1, 0, 0)
INSERT [dbo].[Staff] ([staffID], [staffName], [image], [isAvailable], [isDelete], [gender]) VALUES (10, N'Tran Minh Quan', N'10.jpg', 1, 0, 1)
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
ALTER TABLE [dbo].[Invoice_Service]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_Service_Pet] FOREIGN KEY([petID])
REFERENCES [dbo].[Pet] ([petID])
GO
ALTER TABLE [dbo].[Invoice_Service] CHECK CONSTRAINT [FK_Invoice_Service_Pet]
GO
ALTER TABLE [dbo].[Invoice_Service]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_Service_Service] FOREIGN KEY([serviceID])
REFERENCES [dbo].[Service] ([serviceID])
GO
ALTER TABLE [dbo].[Invoice_Service] CHECK CONSTRAINT [FK_Invoice_Service_Service]
GO
ALTER TABLE [dbo].[Invoice_Service]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_Service_Staff] FOREIGN KEY([staffDoing])
REFERENCES [dbo].[Staff] ([staffID])
GO
ALTER TABLE [dbo].[Invoice_Service] CHECK CONSTRAINT [FK_Invoice_Service_Staff]
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
