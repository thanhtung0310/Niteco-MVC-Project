USE [master]
GO
/****** Object:  Database [niteco_test_db]    Script Date: 27/6/2023 8:41:22 AM ******/
CREATE DATABASE [niteco_test_db]
GO
ALTER DATABASE [niteco_test_db] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [niteco_test_db].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [niteco_test_db] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [niteco_test_db] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [niteco_test_db] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [niteco_test_db] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [niteco_test_db] SET ARITHABORT OFF 
GO
ALTER DATABASE [niteco_test_db] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [niteco_test_db] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [niteco_test_db] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [niteco_test_db] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [niteco_test_db] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [niteco_test_db] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [niteco_test_db] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [niteco_test_db] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [niteco_test_db] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [niteco_test_db] SET  DISABLE_BROKER 
GO
ALTER DATABASE [niteco_test_db] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [niteco_test_db] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [niteco_test_db] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [niteco_test_db] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [niteco_test_db] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [niteco_test_db] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [niteco_test_db] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [niteco_test_db] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [niteco_test_db] SET  MULTI_USER 
GO
ALTER DATABASE [niteco_test_db] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [niteco_test_db] SET DB_CHAINING OFF 
GO
ALTER DATABASE [niteco_test_db] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [niteco_test_db] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [niteco_test_db] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [niteco_test_db] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [niteco_test_db] SET QUERY_STORE = OFF
GO
USE [niteco_test_db]
GO
/****** Object:  Table [dbo].[category]    Script Date: 27/6/2023 8:41:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[id] [uniqueidentifier] NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[description] [nvarchar](500) NULL,
	[created] [datetime] NULL,
	[modified] [datetime] NULL,
 CONSTRAINT [PK_category] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[customer]    Script Date: 27/6/2023 8:41:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customer](
	[id] [uniqueidentifier] NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[address] [nvarchar](500) NULL,
	[created] [datetime] NULL,
	[modified] [datetime] NULL,
	[is_active] [bit] NOT NULL,
 CONSTRAINT [PK_customer] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order]    Script Date: 27/6/2023 8:41:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order](
	[id] [uniqueidentifier] NOT NULL,
	[customer_id] [uniqueidentifier] NOT NULL,
	[product_id] [uniqueidentifier] NOT NULL,
	[amount] [int] NOT NULL,
	[order_date] [datetime] NOT NULL,
	[created] [datetime] NULL,
	[modified] [datetime] NULL,
	[name] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_order] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[customer_id] ASC,
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 27/6/2023 8:41:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[id] [uniqueidentifier] NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[category_id] [uniqueidentifier] NOT NULL,
	[price] [decimal](18, 2) NOT NULL,
	[description] [nvarchar](500) NULL,
	[quantity] [int] NULL,
	[created] [datetime] NULL,
	[modified] [datetime] NULL,
 CONSTRAINT [PK_product] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[staff]    Script Date: 27/6/2023 8:41:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[staff](
	[id] [uniqueidentifier] NOT NULL,
	[user_name] [varchar](255) NOT NULL,
	[password_hash] [varbinary](max) NOT NULL,
	[password_salt] [varbinary](max) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_staff] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_category_name]    Script Date: 27/6/2023 8:41:22 AM ******/
CREATE NONCLUSTERED INDEX [IX_category_name] ON [dbo].[category]
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_customer_name]    Script Date: 27/6/2023 8:41:22 AM ******/
CREATE NONCLUSTERED INDEX [IX_customer_name] ON [dbo].[customer]
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_order_customer_id]    Script Date: 27/6/2023 8:41:22 AM ******/
CREATE NONCLUSTERED INDEX [IX_order_customer_id] ON [dbo].[order]
(
	[customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_order_name]    Script Date: 27/6/2023 8:41:22 AM ******/
CREATE NONCLUSTERED INDEX [IX_order_name] ON [dbo].[order]
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_order_product_id]    Script Date: 27/6/2023 8:41:22 AM ******/
CREATE NONCLUSTERED INDEX [IX_order_product_id] ON [dbo].[order]
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_product_name]    Script Date: 27/6/2023 8:41:22 AM ******/
CREATE NONCLUSTERED INDEX [IX_product_name] ON [dbo].[product]
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_staff_user_name]    Script Date: 27/6/2023 8:41:22 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_staff_user_name] ON [dbo].[staff]
(
	[user_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[category] ADD  CONSTRAINT [DF_category_created]  DEFAULT (getutcdate()) FOR [created]
GO
ALTER TABLE [dbo].[category] ADD  CONSTRAINT [DF_category_modified]  DEFAULT (getutcdate()) FOR [modified]
GO
ALTER TABLE [dbo].[customer] ADD  CONSTRAINT [DF_customer_created]  DEFAULT (getutcdate()) FOR [created]
GO
ALTER TABLE [dbo].[customer] ADD  CONSTRAINT [DF_customer_modified]  DEFAULT (getutcdate()) FOR [modified]
GO
ALTER TABLE [dbo].[customer] ADD  CONSTRAINT [DF_customer_is_active]  DEFAULT ((1)) FOR [is_active]
GO
ALTER TABLE [dbo].[order] ADD  CONSTRAINT [DF_order_amount]  DEFAULT ((0)) FOR [amount]
GO
ALTER TABLE [dbo].[order] ADD  CONSTRAINT [DF_order_order_date]  DEFAULT (getutcdate()) FOR [order_date]
GO
ALTER TABLE [dbo].[order] ADD  CONSTRAINT [DF_order_created]  DEFAULT (getutcdate()) FOR [created]
GO
ALTER TABLE [dbo].[order] ADD  CONSTRAINT [DF_order_modified]  DEFAULT (getutcdate()) FOR [modified]
GO
ALTER TABLE [dbo].[product] ADD  CONSTRAINT [DF_product_quantity]  DEFAULT ((0)) FOR [quantity]
GO
ALTER TABLE [dbo].[product] ADD  CONSTRAINT [DF_product_created]  DEFAULT (getutcdate()) FOR [created]
GO
ALTER TABLE [dbo].[product] ADD  CONSTRAINT [DF_product_modified]  DEFAULT (getutcdate()) FOR [modified]
GO
ALTER TABLE [dbo].[order]  WITH CHECK ADD  CONSTRAINT [FK_order_customer_id] FOREIGN KEY([customer_id])
REFERENCES [dbo].[customer] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[order] CHECK CONSTRAINT [FK_order_customer_id]
GO
ALTER TABLE [dbo].[order]  WITH CHECK ADD  CONSTRAINT [FK_order_product_id] FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[order] CHECK CONSTRAINT [FK_order_product_id]
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD  CONSTRAINT [FK_product_category_id] FOREIGN KEY([category_id])
REFERENCES [dbo].[category] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[product] CHECK CONSTRAINT [FK_product_category_id]
GO
USE [master]
GO
ALTER DATABASE [niteco_test_db] SET  READ_WRITE 
GO
USE [niteco_test_db]
GO