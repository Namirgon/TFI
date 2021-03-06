USE [master]
GO
/****** Object:  Database [HelperDataBase]    Script Date: 30/11/2020 10:16:31 ******/
CREATE DATABASE [HelperDataBase]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HelperDataBase', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS01\MSSQL\DATA\HelperDataBase.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HelperDataBase_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS01\MSSQL\DATA\HelperDataBase_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [HelperDataBase] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HelperDataBase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HelperDataBase] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HelperDataBase] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HelperDataBase] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HelperDataBase] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HelperDataBase] SET ARITHABORT OFF 
GO
ALTER DATABASE [HelperDataBase] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HelperDataBase] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HelperDataBase] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HelperDataBase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HelperDataBase] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HelperDataBase] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HelperDataBase] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HelperDataBase] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HelperDataBase] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HelperDataBase] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HelperDataBase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HelperDataBase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HelperDataBase] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HelperDataBase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HelperDataBase] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HelperDataBase] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HelperDataBase] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HelperDataBase] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [HelperDataBase] SET  MULTI_USER 
GO
ALTER DATABASE [HelperDataBase] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HelperDataBase] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HelperDataBase] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HelperDataBase] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HelperDataBase] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [HelperDataBase] SET QUERY_STORE = OFF
GO
USE [HelperDataBase]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [HelperDataBase]
GO
/****** Object:  Table [dbo].[Bitacora]    Script Date: 30/11/2020 10:16:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bitacora](
	[IdBitacoraLog] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[NombreUsuario] [nvarchar](1000) NOT NULL,
	[Fecha] [date] NOT NULL,
	[TipoLog] [varchar](1000) NOT NULL,
	[Accion] [nvarchar](1000) NOT NULL,
	[Mensaje] [varchar](5000) NOT NULL,
 CONSTRAINT [PK_Bitacora] PRIMARY KEY CLUSTERED 
(
	[IdBitacoraLog] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 30/11/2020 10:16:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categoria](
	[IdCategoria] [int] IDENTITY(1,1) NOT NULL,
	[DescripCategoria] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Categoria] PRIMARY KEY CLUSTERED 
(
	[IdCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comprobante]    Script Date: 30/11/2020 10:16:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comprobante](
	[IdComprobante] [int] IDENTITY(1,1) NOT NULL,
	[IdTipoComprobante] [int] NOT NULL,
	[IdSucursal] [int] NOT NULL,
	[IdOrdenDeTrabajo] [int] NOT NULL,
	[Fecha] [date] NOT NULL,
 CONSTRAINT [PK_Comprobante] PRIMARY KEY CLUSTERED 
(
	[IdComprobante] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetalleComprobante]    Script Date: 30/11/2020 10:16:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleComprobante](
	[IdDetalleComprobante] [int] IDENTITY(1,1) NOT NULL,
	[IdComprobante] [int] NOT NULL,
	[IdTipoComprobante] [int] NOT NULL,
	[IdSucursal] [int] NOT NULL,
	[IdServicio] [int] NOT NULL,
	[PrecioUnitario] [decimal](18, 0) NOT NULL,
 CONSTRAINT [PK_DetalleComprobante] PRIMARY KEY CLUSTERED 
(
	[IdDetalleComprobante] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Direccion]    Script Date: 30/11/2020 10:16:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Direccion](
	[IdDireccion] [int] IDENTITY(1,1) NOT NULL,
	[Calle] [nvarchar](50) NOT NULL,
	[Numero] [int] NOT NULL,
	[Piso] [nvarchar](50) NOT NULL,
	[Departamento] [nvarchar](50) NOT NULL,
	[IdProvincia] [int] NULL,
	[IdLocalidad] [int] NOT NULL,
	[IdTipoDireccion] [int] NOT NULL,
 CONSTRAINT [PK_Direccion] PRIMARY KEY CLUSTERED 
(
	[IdDireccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DVV]    Script Date: 30/11/2020 10:16:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DVV](
	[IdDVV] [int] IDENTITY(1,1) NOT NULL,
	[Tabla] [nvarchar](50) NOT NULL,
	[DVV] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_DVV] PRIMARY KEY CLUSTERED 
(
	[IdDVV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Estado]    Script Date: 30/11/2020 10:16:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estado](
	[IdEstado] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Estado] PRIMARY KEY CLUSTERED 
(
	[IdEstado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Familia]    Script Date: 30/11/2020 10:16:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Familia](
	[IdFamilia] [int] IDENTITY(1,1) NOT NULL,
	[NombreFamilia] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Familia] PRIMARY KEY CLUSTERED 
(
	[IdFamilia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FamiliaUsuario]    Script Date: 30/11/2020 10:16:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FamiliaUsuario](
	[IdFamilia] [int] NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[Email] [nvarchar](50) NULL,
	[FecBaja] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FormaDePago]    Script Date: 30/11/2020 10:16:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FormaDePago](
	[IdFormaDePago] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_FormaDePago] PRIMARY KEY CLUSTERED 
(
	[IdFormaDePago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Idioma]    Script Date: 30/11/2020 10:16:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Idioma](
	[IdIdioma] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Idioma] PRIMARY KEY CLUSTERED 
(
	[IdIdioma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ItemOrdenDeTrabajo]    Script Date: 30/11/2020 10:16:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemOrdenDeTrabajo](
	[IdItemOrdenDeTrabajo] [int] IDENTITY(1,1) NOT NULL,
	[IdOrdenDeTrabajo] [int] NULL,
	[IdUsuario] [int] NOT NULL,
	[NombreUsuario] [nvarchar](50) NOT NULL,
	[IdServicio] [int] NOT NULL,
	[IdDireccion] [int] NULL,
	[Precio] [decimal](18, 0) NULL,
	[Fecha] [date] NULL,
	[Hora] [time](7) NULL,
	[Cantidad] [int] NULL,
 CONSTRAINT [PK_ItemOrdenDeTrabajo_1] PRIMARY KEY CLUSTERED 
(
	[IdItemOrdenDeTrabajo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ListaDeseo]    Script Date: 30/11/2020 10:16:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ListaDeseo](
	[IdDeseo] [int] NOT NULL,
	[NumeroDocumento] [int] NOT NULL,
	[NombreUsuario] [nvarchar](50) NOT NULL,
	[IdServicio] [int] NOT NULL,
 CONSTRAINT [PK_ListaDeseo] PRIMARY KEY CLUSTERED 
(
	[IdDeseo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Localidad]    Script Date: 30/11/2020 10:16:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Localidad](
	[IdLocalidad] [int] IDENTITY(1,1) NOT NULL,
	[IdProvincia] [int] NOT NULL,
	[Descripcion] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Localidad] PRIMARY KEY CLUSTERED 
(
	[IdLocalidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MultiIdioma]    Script Date: 30/11/2020 10:16:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MultiIdioma](
	[IdMultiIdioma] [int] IDENTITY(1,1) NOT NULL,
	[IdIdioma] [int] NOT NULL,
	[NombreDelControl] [nvarchar](50) NOT NULL,
	[Texto] [nvarchar](500) NOT NULL,
 CONSTRAINT [PK_MultiIdioma] PRIMARY KEY CLUSTERED 
(
	[IdMultiIdioma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrdenDeTrabajo]    Script Date: 30/11/2020 10:16:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrdenDeTrabajo](
	[IdOrdenDeTrabajo] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[Fecha] [datetime] NULL,
	[IdEstado] [int] NULL,
 CONSTRAINT [PK_OrdenDeTrabajo] PRIMARY KEY CLUSTERED 
(
	[IdOrdenDeTrabajo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Patente]    Script Date: 30/11/2020 10:16:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patente](
	[IdPatente] [int] IDENTITY(1,1) NOT NULL,
	[NombrePatente] [nvarchar](50) NOT NULL,
	[FecBaja] [datetime] NULL,
 CONSTRAINT [PK_Patente] PRIMARY KEY CLUSTERED 
(
	[IdPatente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PatenteFamilia]    Script Date: 30/11/2020 10:16:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PatenteFamilia](
	[IdPatente] [int] NOT NULL,
	[IdFamilia] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PatenteUsuario]    Script Date: 30/11/2020 10:16:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PatenteUsuario](
	[IdPatente] [int] NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[Email] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Provincia]    Script Date: 30/11/2020 10:16:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provincia](
	[IdProvincia] [int] NOT NULL,
	[Descripcion] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Provincia] PRIMARY KEY CLUSTERED 
(
	[IdProvincia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Recibo]    Script Date: 30/11/2020 10:16:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Recibo](
	[IdRecibo] [int] IDENTITY(1,1) NOT NULL,
	[IdOrdenDeTrabajo] [int] NOT NULL,
	[Fecha] [date] NOT NULL,
	[IdFormaDePago] [int] NOT NULL,
	[Importe] [float] NOT NULL,
 CONSTRAINT [PK_Recibo] PRIMARY KEY CLUSTERED 
(
	[IdRecibo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RemFamFam]    Script Date: 30/11/2020 10:16:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RemFamFam](
	[IdFamiliaPadre] [int] NOT NULL,
	[IdFamiliaHijo] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Servicio]    Script Date: 30/11/2020 10:16:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Servicio](
	[IdServicio] [int] IDENTITY(1,1) NOT NULL,
	[Titulo] [nvarchar](50) NOT NULL,
	[Descripcion] [nvarchar](300) NOT NULL,
	[Precio] [decimal](18, 0) NOT NULL,
	[URLimagen] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Servicio] PRIMARY KEY CLUSTERED 
(
	[IdServicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServicioUsuario]    Script Date: 30/11/2020 10:16:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServicioUsuario](
	[IdOrdenDeTrabajo] [int] NOT NULL,
	[IdUsuario] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sexo]    Script Date: 30/11/2020 10:16:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sexo](
	[IdSexo] [int] NOT NULL,
	[Descripcion] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Sexo] PRIMARY KEY CLUSTERED 
(
	[IdSexo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Solicitud]    Script Date: 30/11/2020 10:16:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Solicitud](
	[IdSolicitud] [int] IDENTITY(1,1) NOT NULL,
	[FechaInicio] [datetime] NOT NULL,
	[FechaFin] [datetime] NULL,
	[IdDependencia] [int] NOT NULL,
	[IdPrioridad] [int] NOT NULL,
	[IdResponsable] [int] NOT NULL,
	[IdEstado] [int] NOT NULL,
 CONSTRAINT [PK_Solicitud] PRIMARY KEY CLUSTERED 
(
	[IdSolicitud] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sucursal]    Script Date: 30/11/2020 10:16:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sucursal](
	[IdSucursal] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Sucursal] PRIMARY KEY CLUSTERED 
(
	[IdSucursal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tarjeta]    Script Date: 30/11/2020 10:16:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tarjeta](
	[IdTarjeta] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[IdTipoTarjeta] [int] NOT NULL,
	[NombreTitular] [nvarchar](50) NOT NULL,
	[NumeroTarjeta] [bigint] NOT NULL,
	[FechaVencimiento] [date] NOT NULL,
	[CodigoSeguridad] [int] NOT NULL,
 CONSTRAINT [PK_Tarjeta] PRIMARY KEY CLUSTERED 
(
	[IdTarjeta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Telefono]    Script Date: 30/11/2020 10:16:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Telefono](
	[IdTelefono] [int] IDENTITY(1,1) NOT NULL,
	[CodArea] [int] NOT NULL,
	[NroTelefono] [int] NOT NULL,
	[IdTipoTelefono] [int] NOT NULL,
 CONSTRAINT [PK_Telefono] PRIMARY KEY CLUSTERED 
(
	[IdTelefono] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoComprobante]    Script Date: 30/11/2020 10:16:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoComprobante](
	[IdTipoComprobante] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TipoComprobante] PRIMARY KEY CLUSTERED 
(
	[IdTipoComprobante] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoDeDocumento]    Script Date: 30/11/2020 10:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoDeDocumento](
	[IdTipoDeDocumento] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TipoDeDocumento] PRIMARY KEY CLUSTERED 
(
	[IdTipoDeDocumento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoDireccion]    Script Date: 30/11/2020 10:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoDireccion](
	[IdTipoDireccion] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TipoDireccion] PRIMARY KEY CLUSTERED 
(
	[IdTipoDireccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoTarjeta]    Script Date: 30/11/2020 10:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoTarjeta](
	[IdTipoTarjeta] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TipoTarjeta] PRIMARY KEY CLUSTERED 
(
	[IdTipoTarjeta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoTelefono]    Script Date: 30/11/2020 10:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoTelefono](
	[IdTipoTelefono] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TipoTelefono] PRIMARY KEY CLUSTERED 
(
	[IdTipoTelefono] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoUsuario]    Script Date: 30/11/2020 10:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoUsuario](
	[IdTipoUsuario] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TipoUsuario] PRIMARY KEY CLUSTERED 
(
	[IdTipoUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 30/11/2020 10:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[IdTipoUsuario] [int] NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[Apellido] [nvarchar](50) NOT NULL,
	[IdTipoDeDocumento] [int] NULL,
	[NumeroDocumento] [int] NOT NULL,
	[IdSexo] [int] NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[IdTipoTelefono] [int] NULL,
	[NumeroTelefono] [int] NULL,
	[DVH] [int] NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsuarioDireccion]    Script Date: 30/11/2020 10:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsuarioDireccion](
	[IdUsuario] [int] NOT NULL,
	[IdDireccion] [int] NOT NULL,
	[NumeroDocumento] [int] NOT NULL,
	[Fecha] [datetime] NULL,
 CONSTRAINT [PK_UsuarioDireccion] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC,
	[IdDireccion] ASC,
	[NumeroDocumento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Comprobante] ADD  CONSTRAINT [DF_Comprobante_Fecha]  DEFAULT (getdate()) FOR [Fecha]
GO
ALTER TABLE [dbo].[OrdenDeTrabajo] ADD  CONSTRAINT [DF_OrdenDeTrabajo_Fecha]  DEFAULT (getdate()) FOR [Fecha]
GO
ALTER TABLE [dbo].[Recibo] ADD  CONSTRAINT [DF_Recibo_Fecha]  DEFAULT (getdate()) FOR [Fecha]
GO
ALTER TABLE [dbo].[UsuarioDireccion] ADD  CONSTRAINT [DF_UsuarioDireccion_Fecha]  DEFAULT (getdate()) FOR [Fecha]
GO
ALTER TABLE [dbo].[Comprobante]  WITH CHECK ADD  CONSTRAINT [FK_Comprobante_Sucursal] FOREIGN KEY([IdSucursal])
REFERENCES [dbo].[Sucursal] ([IdSucursal])
GO
ALTER TABLE [dbo].[Comprobante] CHECK CONSTRAINT [FK_Comprobante_Sucursal]
GO
ALTER TABLE [dbo].[Comprobante]  WITH CHECK ADD  CONSTRAINT [FK_Comprobante_TipoComprobante] FOREIGN KEY([IdTipoComprobante])
REFERENCES [dbo].[TipoComprobante] ([IdTipoComprobante])
GO
ALTER TABLE [dbo].[Comprobante] CHECK CONSTRAINT [FK_Comprobante_TipoComprobante]
GO
ALTER TABLE [dbo].[DetalleComprobante]  WITH CHECK ADD  CONSTRAINT [FK_DetalleComprobante_Comprobante] FOREIGN KEY([IdComprobante])
REFERENCES [dbo].[Comprobante] ([IdComprobante])
GO
ALTER TABLE [dbo].[DetalleComprobante] CHECK CONSTRAINT [FK_DetalleComprobante_Comprobante]
GO
ALTER TABLE [dbo].[DetalleComprobante]  WITH CHECK ADD  CONSTRAINT [FK_DetalleComprobante_Servicio] FOREIGN KEY([IdServicio])
REFERENCES [dbo].[Servicio] ([IdServicio])
GO
ALTER TABLE [dbo].[DetalleComprobante] CHECK CONSTRAINT [FK_DetalleComprobante_Servicio]
GO
ALTER TABLE [dbo].[FamiliaUsuario]  WITH CHECK ADD  CONSTRAINT [FK_FamiliaUsuario_Familia] FOREIGN KEY([IdFamilia])
REFERENCES [dbo].[Familia] ([IdFamilia])
GO
ALTER TABLE [dbo].[FamiliaUsuario] CHECK CONSTRAINT [FK_FamiliaUsuario_Familia]
GO
ALTER TABLE [dbo].[FamiliaUsuario]  WITH CHECK ADD  CONSTRAINT [FK_FamiliaUsuario_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[FamiliaUsuario] CHECK CONSTRAINT [FK_FamiliaUsuario_Usuario]
GO
ALTER TABLE [dbo].[ItemOrdenDeTrabajo]  WITH CHECK ADD  CONSTRAINT [FK_ItemOrdenDeTrabajo_OrdenDeTrabajo1] FOREIGN KEY([IdOrdenDeTrabajo])
REFERENCES [dbo].[OrdenDeTrabajo] ([IdOrdenDeTrabajo])
GO
ALTER TABLE [dbo].[ItemOrdenDeTrabajo] CHECK CONSTRAINT [FK_ItemOrdenDeTrabajo_OrdenDeTrabajo1]
GO
ALTER TABLE [dbo].[ItemOrdenDeTrabajo]  WITH CHECK ADD  CONSTRAINT [FK_ItemOrdenDeTrabajo_Servicio1] FOREIGN KEY([IdServicio])
REFERENCES [dbo].[Servicio] ([IdServicio])
GO
ALTER TABLE [dbo].[ItemOrdenDeTrabajo] CHECK CONSTRAINT [FK_ItemOrdenDeTrabajo_Servicio1]
GO
ALTER TABLE [dbo].[ListaDeseo]  WITH CHECK ADD  CONSTRAINT [FK_ListaDeseo_Servicio] FOREIGN KEY([IdServicio])
REFERENCES [dbo].[Servicio] ([IdServicio])
GO
ALTER TABLE [dbo].[ListaDeseo] CHECK CONSTRAINT [FK_ListaDeseo_Servicio]
GO
ALTER TABLE [dbo].[Localidad]  WITH CHECK ADD  CONSTRAINT [FK_Localidad_Provincia] FOREIGN KEY([IdProvincia])
REFERENCES [dbo].[Provincia] ([IdProvincia])
GO
ALTER TABLE [dbo].[Localidad] CHECK CONSTRAINT [FK_Localidad_Provincia]
GO
ALTER TABLE [dbo].[MultiIdioma]  WITH CHECK ADD  CONSTRAINT [FK_MultiIdioma_Idioma] FOREIGN KEY([IdIdioma])
REFERENCES [dbo].[Idioma] ([IdIdioma])
GO
ALTER TABLE [dbo].[MultiIdioma] CHECK CONSTRAINT [FK_MultiIdioma_Idioma]
GO
ALTER TABLE [dbo].[OrdenDeTrabajo]  WITH CHECK ADD  CONSTRAINT [FK_OrdenDeTrabajo_Estado1] FOREIGN KEY([IdEstado])
REFERENCES [dbo].[Estado] ([IdEstado])
GO
ALTER TABLE [dbo].[OrdenDeTrabajo] CHECK CONSTRAINT [FK_OrdenDeTrabajo_Estado1]
GO
ALTER TABLE [dbo].[OrdenDeTrabajo]  WITH CHECK ADD  CONSTRAINT [FK_OrdenDeTrabajo_Usuario1] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[OrdenDeTrabajo] CHECK CONSTRAINT [FK_OrdenDeTrabajo_Usuario1]
GO
ALTER TABLE [dbo].[PatenteFamilia]  WITH CHECK ADD  CONSTRAINT [FK_PatenteFamilia_Familia] FOREIGN KEY([IdFamilia])
REFERENCES [dbo].[Familia] ([IdFamilia])
GO
ALTER TABLE [dbo].[PatenteFamilia] CHECK CONSTRAINT [FK_PatenteFamilia_Familia]
GO
ALTER TABLE [dbo].[PatenteFamilia]  WITH CHECK ADD  CONSTRAINT [FK_PatenteFamilia_Patente] FOREIGN KEY([IdPatente])
REFERENCES [dbo].[Patente] ([IdPatente])
GO
ALTER TABLE [dbo].[PatenteFamilia] CHECK CONSTRAINT [FK_PatenteFamilia_Patente]
GO
ALTER TABLE [dbo].[PatenteUsuario]  WITH CHECK ADD  CONSTRAINT [FK_PatenteUsuario_Patente] FOREIGN KEY([IdPatente])
REFERENCES [dbo].[Patente] ([IdPatente])
GO
ALTER TABLE [dbo].[PatenteUsuario] CHECK CONSTRAINT [FK_PatenteUsuario_Patente]
GO
ALTER TABLE [dbo].[PatenteUsuario]  WITH CHECK ADD  CONSTRAINT [FK_PatenteUsuario_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[PatenteUsuario] CHECK CONSTRAINT [FK_PatenteUsuario_Usuario]
GO
ALTER TABLE [dbo].[Recibo]  WITH CHECK ADD  CONSTRAINT [FK_Recibo_FormaDePago] FOREIGN KEY([IdFormaDePago])
REFERENCES [dbo].[FormaDePago] ([IdFormaDePago])
GO
ALTER TABLE [dbo].[Recibo] CHECK CONSTRAINT [FK_Recibo_FormaDePago]
GO
ALTER TABLE [dbo].[RemFamFam]  WITH CHECK ADD  CONSTRAINT [FK_RemFamFam_Familia] FOREIGN KEY([IdFamiliaPadre])
REFERENCES [dbo].[Familia] ([IdFamilia])
GO
ALTER TABLE [dbo].[RemFamFam] CHECK CONSTRAINT [FK_RemFamFam_Familia]
GO
ALTER TABLE [dbo].[RemFamFam]  WITH CHECK ADD  CONSTRAINT [FK_RemFamFam_Familia1] FOREIGN KEY([IdFamiliaHijo])
REFERENCES [dbo].[Familia] ([IdFamilia])
GO
ALTER TABLE [dbo].[RemFamFam] CHECK CONSTRAINT [FK_RemFamFam_Familia1]
GO
ALTER TABLE [dbo].[ServicioUsuario]  WITH CHECK ADD  CONSTRAINT [FK_ServicioUsuario_OrdenDeTrabajo] FOREIGN KEY([IdOrdenDeTrabajo])
REFERENCES [dbo].[OrdenDeTrabajo] ([IdOrdenDeTrabajo])
GO
ALTER TABLE [dbo].[ServicioUsuario] CHECK CONSTRAINT [FK_ServicioUsuario_OrdenDeTrabajo]
GO
ALTER TABLE [dbo].[ServicioUsuario]  WITH CHECK ADD  CONSTRAINT [FK_ServicioUsuario_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[ServicioUsuario] CHECK CONSTRAINT [FK_ServicioUsuario_Usuario]
GO
ALTER TABLE [dbo].[Tarjeta]  WITH CHECK ADD  CONSTRAINT [FK_Tarjeta_TipoTarjeta] FOREIGN KEY([IdTipoTarjeta])
REFERENCES [dbo].[TipoTarjeta] ([IdTipoTarjeta])
GO
ALTER TABLE [dbo].[Tarjeta] CHECK CONSTRAINT [FK_Tarjeta_TipoTarjeta]
GO
ALTER TABLE [dbo].[Tarjeta]  WITH CHECK ADD  CONSTRAINT [FK_Tarjeta_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[Tarjeta] CHECK CONSTRAINT [FK_Tarjeta_Usuario]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Sexo] FOREIGN KEY([IdSexo])
REFERENCES [dbo].[Sexo] ([IdSexo])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_Sexo]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_TipoDeDocumento] FOREIGN KEY([IdTipoDeDocumento])
REFERENCES [dbo].[TipoDeDocumento] ([IdTipoDeDocumento])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_TipoDeDocumento]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_TipoTelefono] FOREIGN KEY([IdTipoTelefono])
REFERENCES [dbo].[TipoTelefono] ([IdTipoTelefono])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_TipoTelefono]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_TipoUsuario] FOREIGN KEY([IdTipoUsuario])
REFERENCES [dbo].[TipoUsuario] ([IdTipoUsuario])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_TipoUsuario]
GO
ALTER TABLE [dbo].[UsuarioDireccion]  WITH CHECK ADD  CONSTRAINT [FK_UsuarioDireccion_Direccion] FOREIGN KEY([IdDireccion])
REFERENCES [dbo].[Direccion] ([IdDireccion])
GO
ALTER TABLE [dbo].[UsuarioDireccion] CHECK CONSTRAINT [FK_UsuarioDireccion_Direccion]
GO
ALTER TABLE [dbo].[UsuarioDireccion]  WITH CHECK ADD  CONSTRAINT [FK_UsuarioDireccion_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[UsuarioDireccion] CHECK CONSTRAINT [FK_UsuarioDireccion_Usuario]
GO
/****** Object:  StoredProcedure [dbo].[BaseDatosRespaldar]    Script Date: 30/11/2020 10:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[BaseDatosRespaldar]
 (

 @Destino nvarchar(100)



)

as begin
BACKUP DATABASE HelperDataBase 

TO DISK= @Destino  with format

end 
GO
/****** Object:  StoredProcedure [dbo].[BitacoraLogInsert]    Script Date: 30/11/2020 10:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BitacoraLogInsert]
(
	@elNombreUs varchar(100),
	@IdUsuario int,
	@fecha DATETIME,
	@tipo varchar(1000),
	@accionrealizada varchar(5000),
	@msj varchar(5000)
	
)

	AS
		INSERT INTO [Bitacora]
		(	
			NombreUsuario,
			IdUsuario,
			Fecha,
			TipoLog,
			Accion,
			Mensaje
		)
		VALUES
		(
			@elNombreUs,
			@IdUsuario,
			@fecha,
			@tipo,
			@accionrealizada,
			@msj
		)




GO
/****** Object:  StoredProcedure [dbo].[BitacoraLogSelect]    Script Date: 30/11/2020 10:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[BitacoraLogSelect]
(
	@IdBitacoraLog INT
)
AS
SET NOCOUNT ON
SELECT	[IdBitacoraLog],
		[IdUsuario],
		[NombreUsuario],
		[Accion],
		[Fecha]
FROM	[Bitacora]
WHERE	[IdBitacoraLog] = @IdBitacoraLog

GO
/****** Object:  StoredProcedure [dbo].[BitacoraLogSelectAll]    Script Date: 30/11/2020 10:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[BitacoraLogSelectAll]
AS
SET NOCOUNT ON
SELECT	[IdBitacoraLog],
		[IdUsuario],
		[NombreUsuario],
		[Accion],
		[Fecha]
FROM	[Bitacora]
GO
/****** Object:  StoredProcedure [dbo].[BitacoraLogUPDATE]    Script Date: 30/11/2020 10:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[BitacoraLogUPDATE]
(
	@IdBitacoraLog INT,
	@IdUsuario int,
	@NombreUsuario varchar(100),
	@Accion varchar(200),
	@Fecha DATETIME
)

AS

SET NOCOUNT ON

UPDATE [Bitacora]
SET [IdUsuario] = @IdUsuario,
	[NombreUsuario] = @NombreUsuario,
	[Accion] = @Accion,
	[Fecha] = @Fecha
WHERE [IdBitacoraLog] = @IdBitacoraLog




GO
/****** Object:  StoredProcedure [dbo].[BitacoraVerLogs]    Script Date: 30/11/2020 10:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[BitacoraVerLogs]
(
	@TipoLog varchar(10),
	@fechaInicio datetime = null,
	@fechaFin datetime = null
)


AS
BEGIN


SELECT *
from Bitacora bi
WHERE bi.TipoLog = @TipoLog
and (bi.Fecha >= @fechaInicio OR @fechaInicio IS NULL)
and (bi.Fecha < @fechaFin+1 OR @fechaFin IS NULL)

END
GO
/****** Object:  StoredProcedure [dbo].[BuscarEmail]    Script Date: 30/11/2020 10:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[BuscarEmail]
(
  @Email nvarchar(50)
 

  )
as begin

select * 
from Usuario 
where Email = @Email  ;

end
GO
/****** Object:  StoredProcedure [dbo].[BuscarUsuario]    Script Date: 30/11/2020 10:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure  [dbo].[BuscarUsuario]
(
  @Email nvarchar(50),
  @Password nvarchar(50) 

  )
as begin

select * 
from Usuario 
where Email = @Email and Password =@Password ;
print 'hecho correctamente'
end
GO
/****** Object:  StoredProcedure [dbo].[ComprobanteDetalleInsert]    Script Date: 30/11/2020 10:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ComprobanteDetalleInsert](

 @IdComprobante int,
 @IdTipoComprobante int,
 @IdSucursal int,
 @IdServicio int,
 @PrecioUnitario decimal


)
AS

SET NOCOUNT ON

INSERT INTo DetalleComprobante(

[IdComprobante],
[IdTipoComprobante],
[IdSucursal],
[IdServicio],
[PrecioUnitario]

)
values
(

 @IdComprobante ,
 @IdTipoComprobante ,
 @IdSucursal ,
 @IdServicio ,
 @PrecioUnitario 


)SELECT SCOPE_IDENTITY()
GO
/****** Object:  StoredProcedure [dbo].[ComprobanteInsert]    Script Date: 30/11/2020 10:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ComprobanteInsert](

@IdTipoComprobante int,
@IdSucursal int,
@IdOrdenDeTrabajo int,           
@Fecha date


)

AS

SET NOCOUNT ON

INSERT INTo [Comprobante]

(
[IdTipoComprobante],
[IdSucursal],
[IdOrdenDeTrabajo],
[Fecha]

) values

(

@IdTipoComprobante,
@IdSucursal ,
@IdOrdenDeTrabajo,           
@Fecha 


)
SELECT SCOPE_IDENTITY()
GO
/****** Object:  StoredProcedure [dbo].[ComprobanteSelectById]    Script Date: 30/11/2020 10:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ComprobanteSelectById](

@IdComprobante int

)

AS
SET NOCOUNT ON
SELECT *

from Comprobante as c



where  c.IdComprobante=@IdComprobante



GO
/****** Object:  StoredProcedure [dbo].[DireccionInsert]    Script Date: 30/11/2020 10:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DireccionInsert]
(
	@Calle varchar(200),
	@Numero INT,
	@Piso INT,
	@Departamento varchar(100),
	@IdProvincia INT,
	@IdLocalidad INT,
	@IdTipoDireccion INT
)

AS


INSERT INTo [Direccion]
(
	[Calle],
	[Numero],
	[Piso],
	[Departamento],
	[IdProvincia],
	[IdLocalidad],
	[IdTipoDireccion]
	
)
VALUES
(
	@Calle,
	@Numero ,
	@Piso,
	@Departamento,
	@IdProvincia ,
	@IdLocalidad ,
	@IdTipoDireccion 
)

SELECT SCOPE_IDENTITY()

GO
/****** Object:  StoredProcedure [dbo].[DireccionSelectByNumeroDocumento]    Script Date: 30/11/2020 10:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[DireccionSelectByNumeroDocumento](

  @IdUsuario int
)
as begin 

select d.Calle , d.Numero, d.Piso, d.Departamento , l.Descripcion 

from Direccion as d,  UsuarioDireccion as ud, Usuario as u , Localidad as l


where ud.IdUsuario = @IdUsuario and u.IdUsuario= ud.IdUsuario  and d.IdLocalidad=l.IdLocalidad 

end
GO
/****** Object:  StoredProcedure [dbo].[DireccionUsuarioInsert]    Script Date: 30/11/2020 10:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[DireccionUsuarioInsert]
(
	@IdDireccion int,
	@IdUsuario int,
	@NumeroDocumento int
	
	
)

as

set nocount on

insert into [UsuarioDireccion]
(
	[IdDireccion],
	[IdUsuario],
	[NumeroDocumento]

	
)
values
(
	@IdDireccion,
	@IdUsuario,
	@NumeroDocumento 
)




GO
/****** Object:  StoredProcedure [dbo].[EliminarDIreccion]    Script Date: 30/11/2020 10:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure  [dbo].[EliminarDIreccion](

@IdDireccion int,
@IdUsuario int
)
as
SET NOCOUNT ON


Delete from UsuarioDireccion
 where UsuarioDireccion.IdDireccion= @IdDireccion  and UsuarioDireccion.IdUsuario=@IdUsuario;
Delete from Direccion where IdDireccion =@IdDireccion
GO
/****** Object:  StoredProcedure [dbo].[FamiliaCrear]    Script Date: 30/11/2020 10:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[FamiliaCrear]
(
	@NombreFamilia nvarchar(50)
)

AS
BEGIN


INSERT INTO Familia(NombreFamilia)
VALUES (@NombreFamilia)

SELECT SCOPE_IDENTITY()

END
GO
/****** Object:  StoredProcedure [dbo].[FamiliaDelete]    Script Date: 30/11/2020 10:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[FamiliaDelete]
(
	@IdFamilia int
)

AS

begin

delete from Familia

WHERE [IdFamilia] = @IdFamilia

end 
GO
/****** Object:  StoredProcedure [dbo].[FamiliaEliminarAsocFamilias]    Script Date: 30/11/2020 10:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[FamiliaEliminarAsocFamilias]
(
	@IdFamiliaPadre int,
	@IdFamiliaHijo int
)

AS
BEGIN

DELETE FROM RemFamFam
WHERE IdFamiliaPadre = @IdFamiliaPadre
or IdFamiliaHijo = @IdFamiliaHijo

END
GO
/****** Object:  StoredProcedure [dbo].[FamiliaEliminarAsocPatentes]    Script Date: 30/11/2020 10:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[FamiliaEliminarAsocPatentes]
(
	@IdFamilia int
)

AS
BEGIN

DELETE FROM PatenteFamilia
WHERE IdFamilia = @IdFamilia

END
GO
/****** Object:  StoredProcedure [dbo].[FamiliaFamiliaAsociar]    Script Date: 30/11/2020 10:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create  PROCEDURE [dbo].[FamiliaFamiliaAsociar]
(
	@IdFamiliaPadre int,
	@IdFamiliaHijo int
)

AS
BEGIN


INSERT INTO RemFamFam(IdFamiliaPadre, IdFamiliaHijo)
VALUES (@IdFamiliaPadre, @IdFamiliaHijo)


END
GO
/****** Object:  StoredProcedure [dbo].[FamiliaFamiliaDesasociar]    Script Date: 30/11/2020 10:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[FamiliaFamiliaDesasociar]

(
	@IdFamiliaPadre int,
	@IdFamiliaHijo int
)

AS
BEGIN

DELETE FROM RemFamFam
WHERE IdFamiliaPadre = @IdFamiliaPadre
and IdFamiliaHijo = @IdFamiliaHijo

END
GO
/****** Object:  StoredProcedure [dbo].[FamiliaModificar]    Script Date: 30/11/2020 10:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[FamiliaModificar]

(
	@NombreFamilia varchar(200),
	@IdFamilia int
)

AS
BEGIN

UPDATE Familia
SET NombreFamilia = @NombreFamilia
WHERE IdFamilia = @IdFamilia

END
GO
/****** Object:  StoredProcedure [dbo].[FamiliaPatenteAsociar]    Script Date: 30/11/2020 10:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[FamiliaPatenteAsociar]
(
	@IdFamilia int,
	@IdPatente int
)

AS
BEGIN


INSERT INTO PatenteFamilia (IdFamilia, IdPatente)
VALUES (@IdFamilia, @IdPatente)


END
GO
/****** Object:  StoredProcedure [dbo].[FamiliaPatenteDesasociar]    Script Date: 30/11/2020 10:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[FamiliaPatenteDesasociar]
(
	@IdFamilia int,
	@IdPatente int
)

AS
BEGIN

DELETE FROM PatenteFamilia
WHERE IdFamilia = @IdFamilia
and IdPatente = @IdPatente

END
GO
/****** Object:  StoredProcedure [dbo].[FamiliaSelectAll]    Script Date: 30/11/2020 10:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[FamiliaSelectAll]
AS

SET NOCOUNT ON

SELECT [IdFamilia],
	[NombreFamilia]
FROM Familia

GO
/****** Object:  StoredProcedure [dbo].[FamiliaSelectNombreFamiliaByIdUsuario]    Script Date: 30/11/2020 10:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[FamiliaSelectNombreFamiliaByIdUsuario](

@IdUsuario int

)

AS

SET NOCOUNT ON

SELECT Fam.IdFamilia, Fam.NombreFamilia
FROM Familia Fam
INNER JOIN FamiliaUsuario UF ON UF.IdFamilia = Fam.IdFamilia
INNER JOIN Usuario US ON US.IdUsuario = UF.IdUsuario  AND US.Email  = UF.Email
WHERE US.IdUsuario = @IdUsuario


and UF.FecBaja is null
GO
/****** Object:  StoredProcedure [dbo].[FamiliasTraerTodas]    Script Date: 30/11/2020 10:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[FamiliasTraerTodas]
AS
	SELECT fam.IdFamilia, fam.NombreFamilia
	FROM Familia fam

	



GO
/****** Object:  StoredProcedure [dbo].[FamiliaTraerFamiliasHijas]    Script Date: 30/11/2020 10:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[FamiliaTraerFamiliasHijas](

	@IdFamilia int
)

AS
BEGIN

	SELECT fam.IdFamilia, fam.NombreFamilia
	FROM Familia fam
	WHERE fam.IdFamilia IN
	(
		SELECT ff.IdFamiliaHijo
		FROM RemFamFam ff
		WHERE ff.IdFamiliaPadre  = @IdFamilia
	)

	
END
GO
/****** Object:  StoredProcedure [dbo].[FamiliaTraerPatentes]    Script Date: 30/11/2020 10:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[FamiliaTraerPatentes](

	@IdFamilia int
)

AS
BEGIN

	SELECT pat.IdPatente, pat.NombrePatente
	FROM Patente pat
	WHERE pat.IdPatente IN
	(
		SELECT fp.IdPatente
		FROM PatenteFamilia fp
		WHERE fp.IdFamilia = @IdFamilia	
	)

	
END
GO
/****** Object:  StoredProcedure [dbo].[FamiliaUsuarioInsert]    Script Date: 30/11/2020 10:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[FamiliaUsuarioInsert]

(
	@Email varchar(100),
	@IdFamilia INT, 
	@IdUsuario int
)

AS

SET NOCOUNT ON

INSERT INTo [FamiliaUsuario]
(
	[Email],
	[IdFamilia],
	[IdUsuario]
)
VALUES
(

	@Email,
	@IdFamilia,
	@IdUsuario
)


GO
/****** Object:  StoredProcedure [dbo].[FamiliaUsuariosAsociados]    Script Date: 30/11/2020 10:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[FamiliaUsuariosAsociados]

(
	@IdFamilia int

	
)


AS
BEGIN


SELECT *
FROM usuario us
WHERE us.IdUsuario  in
	(
	 SELECT usfam.IdUsuario
	 FROM FamiliaUsuario usfam
	 WHERE usfam.IdFamilia = @IdFamilia
	  and usfam.IdUsuario=us.IdUsuario
	
	)

END
GO
/****** Object:  StoredProcedure [dbo].[FamiliaUsuariosComprometidos]    Script Date: 30/11/2020 10:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[FamiliaUsuariosComprometidos]

(
	@IdFamilia int
	
)

AS
BEGIN

SELECT *
FROM usuario us
WHERE us.Email  not in
	(
	 Select uspat.Email 
	 From PatenteUsuario uspat
	
	)
AND us.Email  not in
	(
	 SELECT usfam.Email 
	 FROM FamiliaUsuario usfam
	 WHERE usfam.IdFamilia != @IdFamilia

	)
and us.Email in
	(
	 SELECT usfam.Email
	 FROM FamiliaUsuario usfam
	 WHERE usfam.IdFamilia = @IdFamilia
	
	)


END	
GO
/****** Object:  StoredProcedure [dbo].[FamiliaUsuarioUpdate]    Script Date: 30/11/2020 10:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[FamiliaUsuarioUpdate](

@IdFamilia int,
@IdUsuario int

)

AS

SET NOCOUNT ON

UPDATE FamiliaUsuario
SET [IdFamilia] = @IdFamilia
WHERE [IdUsuario] = @IdUsuario
GO
/****** Object:  StoredProcedure [dbo].[FinalizarOrdenDeTrabajo]    Script Date: 30/11/2020 10:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[FinalizarOrdenDeTrabajo](
@IdOrdenDeTrabajo int,
@IdEstado int

)
as begin

UPDATE OrdenDeTrabajo
SET 
[IdEstado]=@IdEstado,
[Fecha]= GETDATE()

where [IdOrdenDeTrabajo]= @IdOrdenDeTrabajo

end


GO
/****** Object:  StoredProcedure [dbo].[IdiomaDelete]    Script Date: 30/11/2020 10:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[IdiomaDelete]
(
	@IdIdioma INT
)

AS

SET NOCOUNT ON



delete from Idioma
WHERE IdIdioma = @IdIdioma
GO
/****** Object:  StoredProcedure [dbo].[IdiomaInsert]    Script Date: 30/11/2020 10:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[IdiomaInsert]
(
	@Descripcion varchar(200)
)

AS

SET NOCOUNT ON

INSERT INTo Idioma
(
	Descripcion
)
VALUES
(
	@Descripcion
)

SELECT SCOPE_IDENTITY()
GO
/****** Object:  StoredProcedure [dbo].[IdiomaSelect]    Script Date: 30/11/2020 10:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[IdiomaSelect]
(
	@IdIdioma INT
)

AS

SET NOCOUNT ON

SELECT IdIdioma , Descripcion
	
FROM [Idioma]
WHERE [IdIdioma] = @IdIdioma
GO
/****** Object:  StoredProcedure [dbo].[IdiomaSelectAll]    Script Date: 30/11/2020 10:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[IdiomaSelectAll]
AS

SET NOCOUNT ON

SELECT [IdIdioma],
	[Descripcion]
FROM Idioma


GO
/****** Object:  StoredProcedure [dbo].[IdiomaUpdate]    Script Date: 30/11/2020 10:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[IdiomaUpdate]
(
	@IdIdioma INT,
	@Descripcion varchar(200)
)

AS

SET NOCOUNT ON

UPDATE Idioma
SET [Descripcion] = @Descripcion
WHERE [IdIdioma] = @IdIdioma
GO
/****** Object:  StoredProcedure [dbo].[InsertDVV]    Script Date: 30/11/2020 10:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[InsertDVV]
(
	@Tabla nvarchar(50),
	@DVV nvarchar(50)
)

AS

BEGIN

IF EXISTS (SELECT Tabla=@Tabla  FROM DVV)
UPDATE DVV  SET  DVV=@DVV WHERE Tabla=@Tabla

ELSE 

INSERT INTo DVV
(
	[Tabla],
	[DVV]
)
VALUES
(
	
	@Tabla ,
	@DVV 
)


END 
GO
/****** Object:  StoredProcedure [dbo].[ItemDelete]    Script Date: 30/11/2020 10:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ItemDelete](

@IdItemOrdenDeTrabajo int

)
as begin

delete from  ItemOrdenDeTrabajo 

where @IdItemOrdenDeTrabajo= IdItemOrdenDeTrabajo

end
GO
/****** Object:  StoredProcedure [dbo].[ItemIdDireccionInsert]    Script Date: 30/11/2020 10:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ItemIdDireccionInsert](

@IdItemOrdenDeTrabajo int,
@IdDireccion int

)
AS

SET NOCOUNT ON

UPDATE [ItemOrdenDeTrabajo]

set [IdDireccion]=@IdDireccion

where [IdItemOrdenDeTrabajo]= @IdItemOrdenDeTrabajo
GO
/****** Object:  StoredProcedure [dbo].[ItemSelect]    Script Date: 30/11/2020 10:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ItemSelect](

@IdItemOrdenDeTrabajo int
)
AS

SET NOCOUNT ON
select iodt.IdItemOrdenDeTrabajo,  iodt.IdServicio, iodt.IdUsuario
from ItemOrdenDeTrabajo  as iodt

where  iodt.IdItemOrdenDeTrabajo=@IdItemOrdenDeTrabajo
GO
/****** Object:  StoredProcedure [dbo].[ListaDeItemUpDate]    Script Date: 30/11/2020 10:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ListaDeItemUpDate]
(


@IdItemOrdenDeTrabajo int,
@Fecha date,
@Hora time,
@Cantidad int

)
as begin 
update ItemOrdenDeTrabajo 
set 
 
	Fecha=@Fecha,
	
	Hora= @Hora ,
	Cantidad=@Cantidad


	where IdItemOrdenDeTrabajo=@IdItemOrdenDeTrabajo 

	end 
GO
/****** Object:  StoredProcedure [dbo].[ListaItemInsert]    Script Date: 30/11/2020 10:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[ListaItemInsert]

(

 @IdUsuario int,
 @NombreUsuario nvarchar(50),
 @IdServicio int,
 @IdOrdenDeTrabajo int,
 @Precio decimal(18, 0)

 

)
as SET NOCOUNT ON

insert into [ItemOrdenDeTrabajo]
(
[IdUsuario],
[NombreUsuario],
[IdServicio],
[IdOrdenDeTrabajo],
[Precio]



)

values
(


 @IdUsuario,
 @NombreUsuario,
 @IdServicio,
 @IdOrdenDeTrabajo,
 @Precio
 

 )
SELECT SCOPE_IDENTITY()

GO
/****** Object:  StoredProcedure [dbo].[ListarDireccionbyIdUsuario]    Script Date: 30/11/2020 10:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ListarDireccionbyIdUsuario]

(
@IdUsuario int

)

as begin

select   ud.IdDireccion, d.Calle, d.Numero , d.Piso , d.Departamento, p.Descripcion as desProvincia ,l.Descripcion as desLocalidad, td.Descripcion as desTipoDireccion

from UsuarioDireccion as ud inner join Direccion as d on 

  ud.IdDireccion=d.IdDireccion

 inner join Localidad as l on d.IdLocalidad=l.IdLocalidad 

 inner join Provincia as p on d.IdProvincia=p.IdProvincia

 inner join TipoDireccion as td on d.IdTipoDireccion = td.IdTipoDireccion


 where ud.IdUsuario= @IdUsuario 
end
GO
/****** Object:  StoredProcedure [dbo].[ListarEstudiante]    Script Date: 30/11/2020 10:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create procedure [dbo].[ListarEstudiante]
as begin

select e.LegajoAlumno,   e.Nombre + ' ' + e.Apellido as NombreCompleto

from Estudiante as e

end
GO
/****** Object:  StoredProcedure [dbo].[ListarFacturaB]    Script Date: 30/11/2020 10:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[ListarFacturaB] 
AS
BEGIN


select c.IdComprobante ,tp.Descripcion as NomTipoComprobante , s.Descripcion as NomSucursal , c.Fecha 

from  Comprobante as c , Sucursal as s, TipoComprobante as tp


where  c.IdTipoComprobante=1 and c.IdSucursal=s.IdSucursal and c.IdTipoComprobante=tp.IdTipoComprobante

END 
GO
/****** Object:  StoredProcedure [dbo].[ListarFacturaBAsignadas]    Script Date: 30/11/2020 10:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ListarFacturaBAsignadas]
AS
BEGIN


select c.IdComprobante ,tp.Descripcion as NomTipoComprobante , s.Descripcion as NomSucursal , c.Fecha 

from  Comprobante as c , Sucursal as s, TipoComprobante as tp, ServicioUsuario as su


where  c.IdTipoComprobante=1 and c.IdSucursal=s.IdSucursal and c.IdTipoComprobante=tp.IdTipoComprobante 
and  c.IdOrdenDeTrabajo =su.IdOrdenDeTrabajo

END 
GO
/****** Object:  StoredProcedure [dbo].[ListarFacturaBSinAsignar]    Script Date: 30/11/2020 10:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ListarFacturaBSinAsignar]
AS
BEGIN


select c.IdComprobante ,tp.Descripcion as NomTipoComprobante , s.Descripcion as NomSucursal , c.Fecha 

from  Comprobante as c , Sucursal as s, TipoComprobante as tp


where  c.IdTipoComprobante=1 and c.IdSucursal=s.IdSucursal and c.IdTipoComprobante=tp.IdTipoComprobante 
and not exists (select * from ServicioUsuario as su where c.IdOrdenDeTrabajo =su.IdOrdenDeTrabajo)

END 
GO
/****** Object:  StoredProcedure [dbo].[ListarIdItemByIdOrdenDeTrabajo]    Script Date: 30/11/2020 10:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ListarIdItemByIdOrdenDeTrabajo](

    @IdOrdenDeTrabajo int

)
as

begin
select *

from OrdenDeTrabajo as ODT inner join ItemOrdenDeTrabajo as ld  on

  ODT.IdOrdenDeTrabajo = @IdOrdenDeTrabajo and   ODT.IdOrdenDeTrabajo =ld.IdOrdenDeTrabajo 
  
    
end 
GO
/****** Object:  StoredProcedure [dbo].[ListarItemByIdOrdenDeTrabajo]    Script Date: 30/11/2020 10:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ListarItemByIdOrdenDeTrabajo](

    @IdOrdenDeTrabajo int

)
as

begin
select   IODT.IdItemOrdenDeTrabajo ,  s.Titulo as Titulo, s.Descripcion as Descripcion, s.Precio, s.URLimagen

from Servicio as S ,  OrdenDeTrabajo as ODT inner join ItemOrdenDeTrabajo as IODT  on

  ODT.IdOrdenDeTrabajo = @IdOrdenDeTrabajo and   ODT.IdOrdenDeTrabajo =IODT.IdOrdenDeTrabajo 
  
    where   S.IdServicio = IODT.IdServicio
end 
GO
/****** Object:  StoredProcedure [dbo].[ListarItemByIdOrdenDeTrabajo2]    Script Date: 30/11/2020 10:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ListarItemByIdOrdenDeTrabajo2](

    @IdOrdenDeTrabajo int

)
as

begin
select  ld.IdItemOrdenDeTrabajo ,
	    ld.IdOrdenDeTrabajo, 
		ld.IdUsuario ,
	    ld.NombreUsuario ,
	    ld.IdServicio
	   

from OrdenDeTrabajo as ODT inner join ItemOrdenDeTrabajo as ld  on

  ODT.IdOrdenDeTrabajo = @IdOrdenDeTrabajo and   ODT.IdOrdenDeTrabajo =ld.IdOrdenDeTrabajo 
  
    
end 
GO
/****** Object:  StoredProcedure [dbo].[ListarItemByNumeroDocumento]    Script Date: 30/11/2020 10:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create  procedure [dbo].[ListarItemByNumeroDocumento]
(
    @NumeroDocumento int

)
as

begin
select  ld.IdServicio

from Usuario as u inner join ItemOrdenDeTrabajo as ld  on

  ld.NumeroDocumento = @NumeroDocumento and u.NumeroDocumento =ld.NumeroDocumento
  
    
end 
GO
/****** Object:  StoredProcedure [dbo].[ListarLocalidad]    Script Date: 30/11/2020 10:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[ListarLocalidad]

as

begin 

select loc.IdLocalidad, loc.Descripcion, pro.IdProvincia, pro.Descripcion from localidad loc
inner join provincia pro on pro.IdProvincia = loc.IdProvincia



end
GO
/****** Object:  StoredProcedure [dbo].[ListarNC]    Script Date: 30/11/2020 10:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ListarNC] 
AS
BEGIN


select c.IdComprobante ,tp.Descripcion as NomTipoComprobante , s.Descripcion as NomSucursal , c.Fecha 

from  Comprobante as c , Sucursal as s, TipoComprobante as tp


where  c.IdTipoComprobante=2 and c.IdSucursal=s.IdSucursal and c.IdTipoComprobante=tp.IdTipoComprobante

END 
GO
/****** Object:  StoredProcedure [dbo].[ListarND]    Script Date: 30/11/2020 10:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ListarND] 
AS
BEGIN


select c.IdComprobante ,tp.Descripcion as NomTipoComprobante , s.Descripcion as NomSucursal , c.Fecha 

from  Comprobante as c , Sucursal as s, TipoComprobante as tp


where  c.IdTipoComprobante=3 and c.IdSucursal=s.IdSucursal and c.IdTipoComprobante=tp.IdTipoComprobante

END 
GO
/****** Object:  StoredProcedure [dbo].[ListarOrdenDeTrabajoActiva]    Script Date: 30/11/2020 10:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ListarOrdenDeTrabajoActiva] (

@IdUsuario int

)

as begin

select *

from OrdenDeTrabajo  as odt

where odt.IdUsuario=@IdUsuario and  odt.IdEstado=1 

end

GO
/****** Object:  StoredProcedure [dbo].[ListarProvincias]    Script Date: 30/11/2020 10:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ListarProvincias]

as

begin 

select IdProvincia, Descripcion from Provincia

end
GO
/****** Object:  StoredProcedure [dbo].[ListarSexo]    Script Date: 30/11/2020 10:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ListarSexo] 

as

begin 

select IdSexo, Descripcion from Sexo 

end
GO
/****** Object:  StoredProcedure [dbo].[ListarTipoDireccion]    Script Date: 30/11/2020 10:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ListarTipoDireccion]

as

begin 

select IdTipoDireccion, Descripcion from TipoDireccion

end
GO
/****** Object:  StoredProcedure [dbo].[ListarTipoDomicilio]    Script Date: 30/11/2020 10:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[ListarTipoDomicilio]
as

begin 

select IdTipoDireccion, Descripcion from TipoDireccion

end
GO
/****** Object:  StoredProcedure [dbo].[ListarTipoTelefono]    Script Date: 30/11/2020 10:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ListarTipoTelefono]

as

begin 

select IdTipoTelefono, Descripcion from TipoTelefono

end
GO
/****** Object:  StoredProcedure [dbo].[MultiIdiomaControlDelete]    Script Date: 30/11/2020 10:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[MultiIdiomaControlDelete]
(
	@Texto varchar(400),
	@IdIdioma INT
)

AS

SET NOCOUNT ON


UPDATE MultiIdioma
SET FechaBaja = GETDATE()
WHERE [Texto] = @Texto
	and [IdIdioma] = @IdIdioma
GO
/****** Object:  StoredProcedure [dbo].[MultiIdiomaControlInsert]    Script Date: 30/11/2020 10:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[MultiIdiomaControlInsert]
(
	@Texto varchar(400),
	@IdIdioma INT,
	@NombreDelControl varchar(400)
)

AS

SET NOCOUNT ON

INSERT INTo MultiIdioma
(
	[Texto],
	[IdIdioma],
	[NombreDelControl]
)
VALUES
(
	@Texto,
	@IdIdioma,
	@NombreDelControl

)



GO
/****** Object:  StoredProcedure [dbo].[MultiIdiomaControlSelect]    Script Date: 30/11/2020 10:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[MultiIdiomaControlSelect]
(
	@Texto varchar(400),
	@IdIdioma INT
)

AS

SET NOCOUNT ON

SELECT [Texto],
	[IdIdioma],
	[NombreDelControl]
FROM [MultiIdioma]
WHERE [Texto] = @Texto
	and IdIdioma = @IdIdioma



GO
/****** Object:  StoredProcedure [dbo].[MultiIdiomaControlSelectAll]    Script Date: 30/11/2020 10:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[MultiIdiomaControlSelectAll](

@IdIdioma int

)
AS

BEGIN

SELECT [Texto],
	
	[NombreDelControl]
	
FROM MultiIdioma

where  [IdIdioma]=@IdIdioma

END
GO
/****** Object:  StoredProcedure [dbo].[MultiIdiomaControlUpdate]    Script Date: 30/11/2020 10:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[MultiIdiomaControlUpdate]
(
	@Texto varchar(400),
	@IdIdioma INT,
	@NombreDelControl varchar(400)
)

AS

SET NOCOUNT ON

UPDATE MultiIdioma
SET [NombreDelControl] = @NombreDelControl
WHERE [Texto] = @Texto	and [IdIdioma] = @IdIdioma
GO
/****** Object:  StoredProcedure [dbo].[OrdenInsert]    Script Date: 30/11/2020 10:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[OrdenInsert]

(

@IdUsuario int,
@Fecha datetime,
@IdEstado int


)
as

SET NOCOUNT ON

insert into OrdenDeTrabajo
(

[IdUsuario],
[Fecha],
[IdEstado]
)

values (
@IdUsuario,
@Fecha,
@IdEstado

)

SELECT SCOPE_IDENTITY()
GO
/****** Object:  StoredProcedure [dbo].[PagoInsert]    Script Date: 30/11/2020 10:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PagoInsert](

 @IdOrdeDeTrabajo int,
 @IdFormaDePago int,
 @Importe float,
 @Fecha date
)
AS

INSERT INTo [Recibo]
(
[IdOrdenDeTrabajo],
[IdFormaDePago],
[Importe],
[Fecha]

) values
(
 @IdOrdeDeTrabajo ,
 @IdFormaDePago ,
 @Importe ,
 @Fecha

 )
GO
/****** Object:  StoredProcedure [dbo].[PatentesTraerTodas]    Script Date: 30/11/2020 10:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[PatentesTraerTodas]

AS
BEGIN

SELECT pat.IdPatente, pat.NombrePatente
	FROM Patente pat
	

	
END
GO
/****** Object:  StoredProcedure [dbo].[ResumenCompraByIdLocalidad]    Script Date: 30/11/2020 10:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ResumenCompraByIdLocalidad](

 @IdOrdenDeTrabajo int

)
as

begin
select   IODT.IdItemOrdenDeTrabajo , d.IdDireccion , d.IdLocalidad

from Servicio as S , Direccion as d,  OrdenDeTrabajo as ODT inner join ItemOrdenDeTrabajo as IODT  on

  ODT.IdOrdenDeTrabajo = @IdOrdenDeTrabajo and   ODT.IdOrdenDeTrabajo =IODT.IdOrdenDeTrabajo 
  
    where   S.IdServicio = IODT.IdServicio and IODT.IdDireccion = d.IdDireccion 
end 
GO
/****** Object:  StoredProcedure [dbo].[ResumenCompraByItem]    Script Date: 30/11/2020 10:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ResumenCompraByItem](

 @IdOrdenDeTrabajo int

)
as

begin
select   IODT.IdItemOrdenDeTrabajo ,  s.Titulo, s.Descripcion, IODT.Precio , s.URLimagen , IODT.Fecha, IODT.Hora, IODT.Cantidad

from Servicio as S ,  OrdenDeTrabajo as ODT inner join ItemOrdenDeTrabajo as IODT  on

  ODT.IdOrdenDeTrabajo = @IdOrdenDeTrabajo and   ODT.IdOrdenDeTrabajo =IODT.IdOrdenDeTrabajo 
  
    where   S.IdServicio = IODT.IdServicio
end 
GO
/****** Object:  StoredProcedure [dbo].[SelectALLEmpleadoDeLimpiezabyLocalidad]    Script Date: 30/11/2020 10:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SelectALLEmpleadoDeLimpiezabyLocalidad]

(

@IdLocalidad int
)
as

begin 

select  u.IdUsuario, u.Nombre , u.Apellido,u.NumeroDocumento,u.NumeroTelefono, u.IdSexo, u.Email,di.IdDireccion, di.Calle, di.Numero, di.Piso, di.Departamento, di.IdLocalidad, di.IdProvincia


from Usuario as u inner join UsuarioDireccion as ud on ud.NumeroDocumento= u.NumeroDocumento inner join  Direccion as di  on ud.IdDireccion=di.IdDireccion  

where u.IdTipoUsuario=6  and di.IdLocalidad= @IdLocalidad


end
GO
/****** Object:  StoredProcedure [dbo].[SelectbyIDTarjeta]    Script Date: 30/11/2020 10:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SelectbyIDTarjeta](
@IdTarjeta int

)
as begin
select t.IdTarjeta, t.NombreTitular, t.NumeroTarjeta , t.FechaVencimiento,t.CodigoSeguridad, tt.Descripcion

From Tarjeta as t , TipoTarjeta as tt


where t.IdTarjeta=@IdTarjeta and t.IdTipoTarjeta=tt.IdTipoTarjeta

end 
GO
/****** Object:  StoredProcedure [dbo].[SelectByTabla]    Script Date: 30/11/2020 10:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SelectByTabla](

@Tabla nvarchar(50)

)
AS
SET NOCOUNT ON
SELECT [IdDVV],
		[Tabla],
		[DVV]



from DVV


where [Tabla]= @Tabla
GO
/****** Object:  StoredProcedure [dbo].[SelectEmpleado]    Script Date: 30/11/2020 10:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SelectEmpleado]
as 

begin 

select  u.IdUsuario, u.Nombre , u.Apellido,u.NumeroDocumento,u.NumeroTelefono, u.IdSexo, u.Email,di.IdDireccion, di.Calle, di.Numero, di.Piso, di.Departamento, di.IdLocalidad, di.IdProvincia


from Usuario as u inner join UsuarioDireccion as ud on ud.NumeroDocumento= u.NumeroDocumento inner join  Direccion as di  on ud.IdDireccion=di.IdDireccion  

where u.IdTipoUsuario=3 


end
GO
/****** Object:  StoredProcedure [dbo].[SelectEmpleadoDeLimpieza]    Script Date: 30/11/2020 10:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SelectEmpleadoDeLimpieza]
as 

begin 

select  u.IdUsuario, u.Nombre , u.Apellido,u.NumeroDocumento,u.NumeroTelefono, u.IdSexo, u.Email,di.IdDireccion, di.Calle, di.Numero, di.Piso, di.Departamento, di.IdLocalidad, di.IdProvincia


from Usuario as u inner join UsuarioDireccion as ud on ud.NumeroDocumento= u.NumeroDocumento inner join  Direccion as di  on ud.IdDireccion=di.IdDireccion  

where u.IdTipoUsuario=6


end
GO
/****** Object:  StoredProcedure [dbo].[SelectTablaUsuario]    Script Date: 30/11/2020 10:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectTablaUsuario]
as 
begin 

select *

from DVV

WHERE Tabla='Usuario'


end 
GO
/****** Object:  StoredProcedure [dbo].[SelectTarjeta]    Script Date: 30/11/2020 10:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SelectTarjeta](
@IdUsuario int

)
as begin
select t.IdTarjeta, t.NombreTitular, t.NumeroTarjeta , t.FechaVencimiento,t.CodigoSeguridad, tt.Descripcion

From Tarjeta as t , TipoTarjeta as tt


where t.IdUsuario=@IdUsuario and t.IdTipoTarjeta=tt.IdTipoTarjeta

end 
GO
/****** Object:  StoredProcedure [dbo].[SelectUsuarioByIDUsuario]    Script Date: 30/11/2020 10:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SelectUsuarioByIDUsuario](


@IdUsuario int

)
as 

begin 

select u.IdUsuario,  u.Nombre , u.Apellido,u.NumeroDocumento,u.NumeroTelefono, u.IdSexo, u.Email,di.IdDireccion, di.Calle, di.Numero, di.Piso, di.Departamento, di.IdLocalidad, di.IdProvincia


from Usuario as u inner join UsuarioDireccion as ud on ud.NumeroDocumento= u.NumeroDocumento inner join  Direccion as di  on ud.IdDireccion=di.IdDireccion  

where u.IdUsuario=@IdUsuario


end
GO
/****** Object:  StoredProcedure [dbo].[ServicioDelete]    Script Date: 30/11/2020 10:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ServicioDelete]
(
@IdServicio int
)

AS

SET NOCOUNT ON



delete from Servicio

where IdServicio=@IdServicio
GO
/****** Object:  StoredProcedure [dbo].[ServicioInsert]    Script Date: 30/11/2020 10:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ServicioInsert](
@Titulo nvarchar(50),
@Descripcion nvarchar(300),
@Precio decimal(18,0),
@URLImagen nvarchar(50)
)
AS

SET NOCOUNT ON

INSERT INTo Servicio 
(
Titulo,
Descripcion,
Precio,
URLimagen
)
values (

@Titulo ,
@Descripcion ,
@Precio ,
@URLImagen 
)


SELECT SCOPE_IDENTITY()
GO
/****** Object:  StoredProcedure [dbo].[ServicioSelect]    Script Date: 30/11/2020 10:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ServicioSelect]
(
  @IdServicio int
)
as
begin

SELECT *
FROM Servicio
WHERE IdServicio = @IdServicio

end
GO
/****** Object:  StoredProcedure [dbo].[ServicioSelectAll]    Script Date: 30/11/2020 10:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ServicioSelectAll]
 as

 begin
select *

from Servicio

end

GO
/****** Object:  StoredProcedure [dbo].[ServicioUpdata]    Script Date: 30/11/2020 10:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ServicioUpdata](
@IdServicio int,
@Titulo nvarchar(50),
@Descripcion nvarchar(300),
@Precio decimal(18,0),
@URLImagen nvarchar(50)
)
AS

SET NOCOUNT ON

Update Servicio 
SET
Titulo = @Titulo,
Descripcion=@Descripcion,
Precio =@Precio,
URLimagen =@URLImagen


WHERE IdServicio=@IdServicio




GO
/****** Object:  StoredProcedure [dbo].[TarjetaDelete]    Script Date: 30/11/2020 10:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[TarjetaDelete](
@IdTarjeta int
)

AS

SET NOCOUNT ON


delete 

from Tarjeta

where Tarjeta.IdTarjeta =@IdTarjeta
GO
/****** Object:  StoredProcedure [dbo].[TarjetaInsert]    Script Date: 30/11/2020 10:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[TarjetaInsert](

 @IdUsuario int,
 @IdTipoTarjeta int, 
 @NombreTitular nvarchar(50),
 @NumeroTarjeta bigint,
 @FechaVencimiento date,
 @CodigoSeguridad int

)
AS
INSERT INTo [Tarjeta]
(
[IdUsuario],
[IdTipoTarjeta],
[NombreTitular],
[NumeroTarjeta],
[FechaVencimiento],
[CodigoSeguridad]
)

values(

@IdUsuario,
@IdTipoTarjeta,
@NombreTitular,
@NumeroTarjeta,
@FechaVencimiento,
@CodigoSeguridad


)

SELECT SCOPE_IDENTITY()
GO
/****** Object:  StoredProcedure [dbo].[TarjetaUpdate]    Script Date: 30/11/2020 10:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[TarjetaUpdate]
(
 @IdTarjeta int,
 
 @IdTipoTarjeta int, 
 @NombreTitular nvarchar(50),
 @NumeroTarjeta bigint,
 @FechaVencimiento date,
 @CodigoSeguridad int
	
)

AS

SET NOCOUNT ON

UPDATE Tarjeta
SET [IdTipoTarjeta]=@IdTipoTarjeta,
	[NombreTitular]=@NombreTitular,
	[NumeroTarjeta]=@NumeroTarjeta,
	[FechaVencimiento]=@FechaVencimiento,
	[CodigoSeguridad]=@CodigoSeguridad

WHERE [IdTarjeta] = @IdTarjeta
GO
/****** Object:  StoredProcedure [dbo].[TipoTarjetaSelectAll]    Script Date: 30/11/2020 10:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
               
create procedure [dbo].[TipoTarjetaSelectAll]
AS

SET NOCOUNT ON

select IdTipoTarjeta, Descripcion

from TipoTarjeta
GO
/****** Object:  StoredProcedure [dbo].[UpdateDatosEmpleado]    Script Date: 30/11/2020 10:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[UpdateDatosEmpleado]

(
	
	@IdUsuario int,
	@Nombre nvarchar(200),
	@Apellido nvarchar(200),
	@NumeroDocumento INT,
	@IdSexo int,
	@Email varchar(400),
	@NumeroTelefono int,
	@DVH int,
	@IdTipoUsuario int
	

)

AS

SET NOCOUNT ON

Update Usuario
set

	[Nombre]=@Nombre,
	[Apellido]=@Apellido,
	[NumeroDocumento]=@NumeroDocumento,
	[IdSexo]=@IdSexo,
	[Email]=@Email,
	[NumeroTelefono]=@NumeroTelefono,
	[DVH]=@DVH,
	[IdTipoUsuario]= @IdTipoUsuario

	where [IdUsuario]=@IdUsuario
	
GO
/****** Object:  StoredProcedure [dbo].[UsuarioFamiliaInsert]    Script Date: 30/11/2020 10:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[UsuarioFamiliaInsert]

(
	@Email varchar(100),
	@IdFamilia INT
)

AS

SET NOCOUNT ON

INSERT INTo [FamiliaUsuario]
(
	[Email],
	[IdFamilia]
)
VALUES
(

	@Email,
	@IdFamilia
)


GO
/****** Object:  StoredProcedure [dbo].[UsuarioInsert]    Script Date: 30/11/2020 10:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UsuarioInsert]
(
	
	@IdTipoUsuario INT,
	@Nombre nvarchar(200),
	@Apellido nvarchar(200),
	--@IdTipoDeDocumento INT,
	@NumeroDocumento INT,
	@IdSexo int,
	--@IdDireccion int,
	@Email varchar(400),
	@Password varchar(100),
	@IdTipoTelefono int,
	@NumeroTelefono int,
	@DVH nvarchar(50)

)

AS

SET NOCOUNT ON

INSERT INTo [Usuario]
(
	[IdTipoUsuario],
	[Nombre],
	[Apellido],
	--[IdTipoDeDocumento],
	[NumeroDocumento],
	[IdSexo],
	--[IdDireccion],
	[Email],
	[Password],
	[IdTipoTelefono],
	[NumeroTelefono],
	[DVH]
)
VALUES
(

	@IdTipoUsuario ,
	@Nombre,
	@Apellido,
	--@IdTipoDeDocumento,
	@NumeroDocumento,
	@IdSexo,
	--@IdDireccion,
	@Email,
	@Password,
	@IdTipoTelefono,
	@NumeroTelefono,
	@DVH
	
)

SELECT SCOPE_IDENTITY()
GO
/****** Object:  StoredProcedure [dbo].[UsuarioLeerDVH]    Script Date: 30/11/2020 10:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[UsuarioLeerDVH]
as
begin
select *
from Usuario

end
GO
/****** Object:  StoredProcedure [dbo].[UsuarioLeerParaDVH]    Script Date: 30/11/2020 10:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[UsuarioLeerParaDVH]

as
begin
select u.IdUsuario, u.Nombre, u.Apellido,u.NumeroDocumento, u.Email, u.Password , u.NumeroTelefono
from Usuario as u

end



       
GO
/****** Object:  StoredProcedure [dbo].[UsuarioServicioInsert]    Script Date: 30/11/2020 10:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[UsuarioServicioInsert](

@IdOrdenDeTrabajo int,
@IdUsuario int

)
as
SET NOCOUNT ON
 insert into [ServicioUsuario]

(
[IdOrdenDeTrabajo],
[IdUsuario]

) values

(

@IdOrdenDeTrabajo ,
@IdUsuario 

)

GO
/****** Object:  StoredProcedure [dbo].[UsuarioTraerFamilias]    Script Date: 30/11/2020 10:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[UsuarioTraerFamilias](
	@email nvarchar(100),
	@IdUsuario int

)

AS
BEGIN

SELECT fam.IdFamilia, fam.NombreFamilia
FROM Familia fam
WHERE fam.IdFamilia IN 
	(	SELECT usfa.IdFamilia
		FROM FamiliaUsuario usfa
		WHERE usfa.Email = @email
		and usfa.IdUsuario  = @IdUsuario
	)

	
END
GO
/****** Object:  StoredProcedure [dbo].[UsuarioTraerPatentes]    Script Date: 30/11/2020 10:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[UsuarioTraerPatentes] (

	@email nvarchar(100),
	@IdUsuario int
)

AS
BEGIN

SELECT pat.IdPatente, pat.NombrePatente
FROM Patente pat
WHERE pat.IdPatente IN 
	(	SELECT uspa.IdPatente
		FROM PatenteUsuario uspa
		WHERE uspa.Email = @email
		and uspa.IdUsuario  = @IdUsuario
	)

	
END
GO
/****** Object:  StoredProcedure [dbo].[UsuarioUpdateClave]    Script Date: 30/11/2020 10:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[UsuarioUpdateClave](


@Email nvarchar(50),
@password nvarchar(50)
)

AS

SET NOCOUNT ON

UPDATE [Usuario]
SET 
[Password] = @password
WHERE  [Email]= @Email
GO
/****** Object:  StoredProcedure [dbo].[UsuarioUpdatePermisosFamilia]    Script Date: 30/11/2020 10:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[UsuarioUpdatePermisosFamilia]

(

	@Email nvarchar (100),
	@IdFamilia INT
)

AS

SET NOCOUNT ON

UPDATE [FamiliaUsuario]
SET IdFamilia = @IdFamilia
WHERE  [Email] = @Email
GO
USE [master]
GO
ALTER DATABASE [HelperDataBase] SET  READ_WRITE 
GO
