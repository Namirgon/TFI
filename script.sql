USE [master]
GO
/****** Object:  Database [HelperDataBase]    Script Date: 12/11/2020 10:30:56 ******/
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
/****** Object:  Table [dbo].[Bitacora]    Script Date: 12/11/2020 10:30:56 ******/
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
/****** Object:  Table [dbo].[Categoria]    Script Date: 12/11/2020 10:30:57 ******/
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
/****** Object:  Table [dbo].[Comprobante]    Script Date: 12/11/2020 10:30:57 ******/
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
/****** Object:  Table [dbo].[DetalleComprobante]    Script Date: 12/11/2020 10:30:57 ******/
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
/****** Object:  Table [dbo].[Direccion]    Script Date: 12/11/2020 10:30:57 ******/
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
/****** Object:  Table [dbo].[DVV]    Script Date: 12/11/2020 10:30:57 ******/
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
/****** Object:  Table [dbo].[Estado]    Script Date: 12/11/2020 10:30:57 ******/
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
/****** Object:  Table [dbo].[Familia]    Script Date: 12/11/2020 10:30:57 ******/
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
/****** Object:  Table [dbo].[FamiliaUsuario]    Script Date: 12/11/2020 10:30:57 ******/
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
/****** Object:  Table [dbo].[FormaDePago]    Script Date: 12/11/2020 10:30:57 ******/
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
/****** Object:  Table [dbo].[Idioma]    Script Date: 12/11/2020 10:30:57 ******/
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
/****** Object:  Table [dbo].[ItemOrdenDeTrabajo]    Script Date: 12/11/2020 10:30:57 ******/
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
 CONSTRAINT [PK_ItemOrdenDeTrabajo_1] PRIMARY KEY CLUSTERED 
(
	[IdItemOrdenDeTrabajo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ListaDeseo]    Script Date: 12/11/2020 10:30:57 ******/
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
/****** Object:  Table [dbo].[Localidad]    Script Date: 12/11/2020 10:30:57 ******/
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
/****** Object:  Table [dbo].[MultiIdioma]    Script Date: 12/11/2020 10:30:57 ******/
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
/****** Object:  Table [dbo].[OrdenDeTrabajo]    Script Date: 12/11/2020 10:30:57 ******/
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
/****** Object:  Table [dbo].[Patente]    Script Date: 12/11/2020 10:30:57 ******/
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
/****** Object:  Table [dbo].[PatenteFamilia]    Script Date: 12/11/2020 10:30:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PatenteFamilia](
	[IdPatente] [int] NOT NULL,
	[IdFamilia] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PatenteUsuario]    Script Date: 12/11/2020 10:30:57 ******/
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
/****** Object:  Table [dbo].[Provincia]    Script Date: 12/11/2020 10:30:57 ******/
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
/****** Object:  Table [dbo].[Recibo]    Script Date: 12/11/2020 10:30:57 ******/
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
/****** Object:  Table [dbo].[RemFamFam]    Script Date: 12/11/2020 10:30:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RemFamFam](
	[IdFamiliaPadre] [int] NOT NULL,
	[IdFamiliaHijo] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Servicio]    Script Date: 12/11/2020 10:30:57 ******/
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
/****** Object:  Table [dbo].[ServicioUsuario]    Script Date: 12/11/2020 10:30:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServicioUsuario](
	[IdServicio] [int] NOT NULL,
	[IdUsuario] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sexo]    Script Date: 12/11/2020 10:30:57 ******/
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
/****** Object:  Table [dbo].[Solicitud]    Script Date: 12/11/2020 10:30:57 ******/
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
/****** Object:  Table [dbo].[Sucursal]    Script Date: 12/11/2020 10:30:57 ******/
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
/****** Object:  Table [dbo].[Tarjeta]    Script Date: 12/11/2020 10:30:57 ******/
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
/****** Object:  Table [dbo].[Telefono]    Script Date: 12/11/2020 10:30:57 ******/
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
/****** Object:  Table [dbo].[TipoComprobante]    Script Date: 12/11/2020 10:30:57 ******/
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
/****** Object:  Table [dbo].[TipoDeDocumento]    Script Date: 12/11/2020 10:30:57 ******/
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
/****** Object:  Table [dbo].[TipoDireccion]    Script Date: 12/11/2020 10:30:57 ******/
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
/****** Object:  Table [dbo].[TipoTarjeta]    Script Date: 12/11/2020 10:30:57 ******/
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
/****** Object:  Table [dbo].[TipoTelefono]    Script Date: 12/11/2020 10:30:57 ******/
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
/****** Object:  Table [dbo].[TipoUsuario]    Script Date: 12/11/2020 10:30:57 ******/
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
/****** Object:  Table [dbo].[Usuario]    Script Date: 12/11/2020 10:30:58 ******/
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
/****** Object:  Table [dbo].[UsuarioDireccion]    Script Date: 12/11/2020 10:30:58 ******/
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
SET IDENTITY_INSERT [dbo].[Bitacora] ON 

INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (1, 14, N'creado correctamente', CAST(N'2020-08-18' AS Date), N'Evento', N'Alta usuario', N'Alta usuario: lopez')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (2, 2, N'Gonzalez', CAST(N'2020-08-18' AS Date), N'Error', N'Backup', N'
No posee los permisos suficientes
Archivo: C:\Users\natal\Desktop\TFI\EcommerceHelper\EcommerceHelper.Funciones\Seguridad\ServicioBackup.cs
Linea: 45
   en EcommerceHelper.Funciones.Seguridad.ServicioBackup.Respaldar(String Nombre, String Destino, String Obser) en C:\Users\natal\Desktop\TFI\EcommerceHelper\EcommerceHelper.Funciones\Seguridad\ServicioBackup.cs:línea 45
   en EcommerceHelper.Presentacion.Views.Private.BackUp.btnUpload_Click1(Object sender, EventArgs e) en C:\Users\natal\Desktop\TFI\EcommerceHelper\EcommerceHelper.Presentacion\Views\Private\BackUp.aspx.cs:línea 52')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (3, 2, N'Gonzalez', CAST(N'2020-08-18' AS Date), N'Error', N'Backup', N'
No posee los permisos suficientes
Archivo: C:\Users\natal\Desktop\TFI\EcommerceHelper\EcommerceHelper.Funciones\Seguridad\ServicioBackup.cs
Linea: 45
   en EcommerceHelper.Funciones.Seguridad.ServicioBackup.Respaldar(String Nombre, String Destino, String Obser) en C:\Users\natal\Desktop\TFI\EcommerceHelper\EcommerceHelper.Funciones\Seguridad\ServicioBackup.cs:línea 45
   en EcommerceHelper.Presentacion.Views.Private.BackUp.btnUpload_Click1(Object sender, EventArgs e) en C:\Users\natal\Desktop\TFI\EcommerceHelper\EcommerceHelper.Presentacion\Views\Private\BackUp.aspx.cs:línea 52')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (4, 2, N'Gonzalez', CAST(N'2020-08-20' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (6, 2, N'Gonzalez', CAST(N'2020-08-20' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (8, 2, N'Gonzalez', CAST(N'2020-08-20' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (9, 2, N'Gonzalez', CAST(N'2020-08-20' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (10, 2, N'Gonzalez', CAST(N'2020-08-20' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (11, 2, N'Gonzalez', CAST(N'2020-08-20' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (12, 2, N'Gonzalez', CAST(N'2020-08-20' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (13, 2, N'Gonzalez', CAST(N'2020-08-20' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (15, 2, N'Gonzalez', CAST(N'2020-08-20' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (17, 2, N'Gonzalez', CAST(N'2020-08-20' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (19, 2, N'Gonzalez', CAST(N'2020-08-20' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (20, 2, N'Gonzalez', CAST(N'2020-08-20' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (21, 2, N'Gonzalez', CAST(N'2020-08-20' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (22, 2, N'Gonzalez', CAST(N'2020-08-20' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (23, 2, N'Gonzalez', CAST(N'2020-08-20' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (24, 2, N'Gonzalez', CAST(N'2020-08-20' AS Date), N'Evento', N'Backup', N'Backup realizado correctamente')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (25, 2, N'Gonzalez', CAST(N'2020-08-20' AS Date), N'Error', N'Backup', N'
No se pudo encontrar el archivo ''C:\Users\natal\Desktop\TFI\EcommerceHelper\EcommerceHelper.Presentacion\Content\Files\pruebadosmillones.bak''.
Archivo: 
Linea: 0
   en System.IO.__Error.WinIOError(Int32 errorCode, String maybeFullPath)
   en System.IO.FileStream.Init(String path, FileMode mode, FileAccess access, Int32 rights, Boolean useRights, FileShare share, Int32 bufferSize, FileOptions options, SECURITY_ATTRIBUTES secAttrs, String msgPath, Boolean bFromProxy, Boolean useLongPath, Boolean checkHost)
   en System.IO.FileStream..ctor(String path, FileMode mode, FileAccess access, FileShare share)
   en System.Web.HttpResponse.TransmitFile(String filename, Int64 offset, Int64 length)
   en System.Web.HttpResponse.TransmitFile(String filename)
   en EcommerceHelper.Presentacion.Views.Private.BackUp.btnUpload_Click1(Object sender, EventArgs e) en C:\Users\natal\Desktop\TFI\EcommerceHelper\EcommerceHelper.Presentacion\Views\Private\BackUp.aspx.cs:línea 57')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (26, 2, N'Gonzalez', CAST(N'2020-08-20' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (27, 2, N'Gonzalez', CAST(N'2020-08-21' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (28, 2, N'Gonzalez', CAST(N'2020-08-21' AS Date), N'Evento', N'Backup', N'Backup realizado correctamente')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (29, 2, N'Gonzalez', CAST(N'2020-08-21' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (30, 2, N'Gonzalez', CAST(N'2020-08-21' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (31, 2, N'Gonzalez', CAST(N'2020-08-21' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (32, 2, N'Gonzalez', CAST(N'2020-08-21' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (33, 4, N'Gonchale', CAST(N'2020-08-21' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (34, 2, N'Gonzalez', CAST(N'2020-08-22' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (35, 2, N'Gonzalez', CAST(N'2020-08-22' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (36, 2, N'Gonzalez', CAST(N'2020-08-22' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (37, 2, N'Gonzalez', CAST(N'2020-08-22' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (38, 2, N'Gonzalez', CAST(N'2020-08-22' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (39, 2, N'Gonzalez', CAST(N'2020-08-22' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (40, 2, N'Gonzalez', CAST(N'2020-08-22' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (41, 2, N'Gonzalez', CAST(N'2020-08-22' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (42, 2, N'Gonzalez', CAST(N'2020-08-22' AS Date), N'Evento', N'Backup', N'Backup realizado correctamente')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (43, 2, N'Gonzalez', CAST(N'2020-08-22' AS Date), N'Error', N'Backup', N'
No se pudo encontrar el archivo ''C:\Users\natal\Desktop\TFI\EcommerceHelper\EcommerceHelper.Presentacion\Content\Files\HelperDataBase22-8.bak''.
Archivo: 
Linea: 0
   en System.IO.__Error.WinIOError(Int32 errorCode, String maybeFullPath)
   en System.IO.FileStream.Init(String path, FileMode mode, FileAccess access, Int32 rights, Boolean useRights, FileShare share, Int32 bufferSize, FileOptions options, SECURITY_ATTRIBUTES secAttrs, String msgPath, Boolean bFromProxy, Boolean useLongPath, Boolean checkHost)
   en System.IO.FileStream..ctor(String path, FileMode mode, FileAccess access, FileShare share)
   en System.Web.HttpResponse.TransmitFile(String filename, Int64 offset, Int64 length)
   en System.Web.HttpResponse.TransmitFile(String filename)
   en EcommerceHelper.Presentacion.Views.Private.BackUp.btnUpload_Click1(Object sender, EventArgs e) en C:\Users\natal\Desktop\TFI\EcommerceHelper\EcommerceHelper.Presentacion\Views\Private\BackUp.aspx.cs:línea 57')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (44, 2, N'Gonzalez', CAST(N'2020-08-22' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (45, 2, N'Gonzalez', CAST(N'2020-08-22' AS Date), N'Evento', N'Backup', N'Backup realizado correctamente')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (46, 2, N'Gonzalez', CAST(N'2020-08-22' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (47, 2, N'Gonzalez', CAST(N'2020-08-22' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (48, 2, N'Gonzalez', CAST(N'2020-08-22' AS Date), N'Error', N'Restaurar', N'
El proceso no puede obtener acceso al archivo ''C:\Users\natal\Desktop\TFI\EcommerceHelper\EcommerceHelper.Presentacion\Content\Files\bk228.bak'' porque está siendo utilizado en otro proceso.
Archivo: 
Linea: 0
   en System.IO.__Error.WinIOError(Int32 errorCode, String maybeFullPath)
   en System.IO.File.InternalDelete(String path, Boolean checkHost)
   en System.IO.File.Delete(String path)
   en EcommerceHelper.Presentacion.Views.Private.Restaurar.btnUpload_Click(Object sender, EventArgs e) en C:\Users\natal\Desktop\TFI\EcommerceHelper\EcommerceHelper.Presentacion\Views\Private\Restaurar.aspx.cs:línea 57')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (49, 2, N'Gonzalez', CAST(N'2020-08-22' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (50, 4, N'Gonchale', CAST(N'2020-08-22' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (51, 4, N'Gonchale', CAST(N'2020-08-22' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (52, 4, N'Gonchale', CAST(N'2020-08-22' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (53, 4, N'Gonchale', CAST(N'2020-08-22' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (54, 4, N'Gonchale', CAST(N'2020-08-22' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (55, 4, N'Gonchale', CAST(N'2020-08-22' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (56, 4, N'Gonchale', CAST(N'2020-08-22' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (57, 4, N'Gonchale', CAST(N'2020-08-22' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (58, 4, N'Gonchale', CAST(N'2020-08-22' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (59, 4, N'Gonchale', CAST(N'2020-08-22' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (60, 4, N'Gonchale', CAST(N'2020-08-22' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (61, 4, N'Gonchale', CAST(N'2020-08-22' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (62, 2, N'Gonzalez', CAST(N'2020-08-25' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (63, 2, N'Gonzalez', CAST(N'2020-08-25' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (64, 2, N'Gonzalez', CAST(N'2020-08-25' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (65, 2, N'Gonzalez', CAST(N'2020-08-25' AS Date), N'Error', N'Restaurar', N'
El proceso no puede obtener acceso al archivo ''C:\Users\natal\Desktop\TFI\EcommerceHelper\EcommerceHelper.Presentacion\Content\Files\bk228.bak'' porque está siendo utilizado en otro proceso.
Archivo: 
Linea: 0
   en System.IO.__Error.WinIOError(Int32 errorCode, String maybeFullPath)
   en System.IO.File.InternalDelete(String path, Boolean checkHost)
   en System.IO.File.Delete(String path)
   en EcommerceHelper.Presentacion.Views.Private.Restaurar.btnUpload_Click(Object sender, EventArgs e) en C:\Users\natal\Desktop\TFI\EcommerceHelper\EcommerceHelper.Presentacion\Views\Private\Restaurar.aspx.cs:línea 57')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (66, 2, N'Gonzalez', CAST(N'2020-08-25' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (67, 2, N'Gonzalez', CAST(N'2020-08-25' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (68, 2, N'Gonzalez', CAST(N'2020-08-25' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (69, 2, N'Gonzalez', CAST(N'2020-08-25' AS Date), N'Evento', N'Backup', N'Backup realizado correctamente')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (70, 2, N'Gonzalez', CAST(N'2020-08-25' AS Date), N'Error', N'Restaurar', N'
El proceso no puede obtener acceso al archivo ''C:\Users\natal\Desktop\TFI\EcommerceHelper\EcommerceHelper.Presentacion\Content\Files\uh.bak.bak'' porque está siendo utilizado en otro proceso.
Archivo: 
Linea: 0
   en System.IO.__Error.WinIOError(Int32 errorCode, String maybeFullPath)
   en System.IO.File.InternalDelete(String path, Boolean checkHost)
   en System.IO.File.Delete(String path)
   en EcommerceHelper.Presentacion.Views.Private.Restaurar.btnUpload_Click(Object sender, EventArgs e) en C:\Users\natal\Desktop\TFI\EcommerceHelper\EcommerceHelper.Presentacion\Views\Private\Restaurar.aspx.cs:línea 57')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (71, 2, N'Gonzalez', CAST(N'2020-08-25' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (72, 2, N'Gonzalez', CAST(N'2020-08-25' AS Date), N'Error', N'Restaurar', N'
El proceso no puede obtener acceso al archivo ''C:\Users\natal\Desktop\TFI\EcommerceHelper\EcommerceHelper.Presentacion\Content\Files\uh.bak'' porque está siendo utilizado en otro proceso.
Archivo: 
Linea: 0
   en System.IO.__Error.WinIOError(Int32 errorCode, String maybeFullPath)
   en System.IO.File.InternalDelete(String path, Boolean checkHost)
   en System.IO.File.Delete(String path)
   en EcommerceHelper.Presentacion.Views.Private.Restaurar.btnUpload_Click(Object sender, EventArgs e) en C:\Users\natal\Desktop\TFI\EcommerceHelper\EcommerceHelper.Presentacion\Views\Private\Restaurar.aspx.cs:línea 57')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (73, 2, N'Gonzalez', CAST(N'2020-08-25' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (74, 2, N'Gonzalez', CAST(N'2020-08-25' AS Date), N'Error', N'Restaurar', N'
Referencia a objeto no establecida como instancia de un objeto.
Archivo: C:\Users\natal\Desktop\TFI\EcommerceHelper\EcommerceHelper.Funciones\Persistencia\SqlClientUtility.cs
Linea: 232
   en EcommerceHelper.Funciones.Persistencia.SqlClientUtility.ExecuteNonQueryRestaurar(CommandType commandType, String commandText, SqlParameter[] parameters) en C:\Users\natal\Desktop\TFI\EcommerceHelper\EcommerceHelper.Funciones\Persistencia\SqlClientUtility.cs:línea 232
   en EcommerceHelper.Funciones.Seguridad.ServicioBackup.Restaurar(String Nombre, String Ubicacion) en C:\Users\natal\Desktop\TFI\EcommerceHelper\EcommerceHelper.Funciones\Seguridad\ServicioBackup.cs:línea 87
   en EcommerceHelper.Presentacion.Views.Private.Restaurar.btnUpload_Click(Object sender, EventArgs e) en C:\Users\natal\Desktop\TFI\EcommerceHelper\EcommerceHelper.Presentacion\Views\Private\Restaurar.aspx.cs:línea 61')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (75, 2, N'Gonzalez', CAST(N'2020-08-25' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (76, 2, N'Gonzalez', CAST(N'2020-08-25' AS Date), N'Error', N'Restaurar', N'
Referencia a objeto no establecida como instancia de un objeto.
Archivo: C:\Users\natal\Desktop\TFI\EcommerceHelper\EcommerceHelper.Funciones\Persistencia\SqlClientUtility.cs
Linea: 232
   en EcommerceHelper.Funciones.Persistencia.SqlClientUtility.ExecuteNonQueryRestaurar(CommandType commandType, String commandText, SqlParameter[] parameters) en C:\Users\natal\Desktop\TFI\EcommerceHelper\EcommerceHelper.Funciones\Persistencia\SqlClientUtility.cs:línea 232
   en EcommerceHelper.Funciones.Seguridad.ServicioBackup.Restaurar(String Nombre, String Ubicacion) en C:\Users\natal\Desktop\TFI\EcommerceHelper\EcommerceHelper.Funciones\Seguridad\ServicioBackup.cs:línea 87
   en EcommerceHelper.Presentacion.Views.Private.Restaurar.btnUpload_Click(Object sender, EventArgs e) en C:\Users\natal\Desktop\TFI\EcommerceHelper\EcommerceHelper.Presentacion\Views\Private\Restaurar.aspx.cs:línea 61')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (77, 2, N'Gonzalez', CAST(N'2020-08-26' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (79, 2, N'Gonzalez', CAST(N'2020-08-26' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (80, 2, N'Gonzalez', CAST(N'2020-08-26' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (81, 2, N'Gonzalez', CAST(N'2020-08-26' AS Date), N'Error', N'Restaurar', N'
No se puede sobrescribir el archivo ''C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS01\MSSQL\DATA\HelperDataBase.mdf''. Lo está utilizando la base de datos ''HelperDataBase''.
El archivo ''HelperDataBase'' no se puede restaurar en ''C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS01\MSSQL\DATA\HelperDataBase.mdf''. Utilice WITH MOVE para identificar una ubicación válida para el archivo.
No se puede sobrescribir el archivo ''C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS01\MSSQL\DATA\HelperDataBase_log.ldf''. Lo está utilizando la base de datos ''HelperDataBase''.
El archivo ''HelperDataBase_log'' no se puede restaurar en ''C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS01\MSSQL\DATA\HelperDataBase_log.ldf''. Utilice WITH MOVE para identificar una ubicación válida para el archivo.
Se identificaron problemas al planear la instrucción RESTORE. Los mensajes anteriores proporcionan detalles.
Fin anómalo de RESTORE DATABASE.
Archivo: 
Linea: 0
   en System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   en System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   en System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   en System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   en System.Data.SqlClient.SqlCommand.RunExecuteNonQueryTds(String methodName, Boolean async, Int32 timeout, Boolean asyncWrite)
   en System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   en System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   en EcommerceHelper.Funciones.Persistencia.SqlClientUtility.ExecuteNonQueryRestaurar(CommandType commandType, String commandText, SqlParameter[] parameters) en C:\Users\natal\Desktop\TFI\EcommerceHelper\EcommerceHelper.Funciones\Persistencia\SqlClientUtility.cs:línea 232
   en EcommerceHelper.Funciones.Seguridad.ServicioBackup.Restaurar(String Nombre, String Ubicacion) en C:\Users\natal\Desktop\TFI\EcommerceHelper\EcommerceHelper.Funciones\Seguridad\ServicioBackup.cs:línea 87
   en EcommerceHelper.Presentacion.Views.Private.Restaurar.btnUpload_Click(Object sender, EventArgs e) en C:\Users\natal\Desktop\TFI\EcommerceHelper\EcommerceHelper.Presentacion\Views\Private\Restaurar.aspx.cs:línea 61')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (82, 2, N'Gonzalez', CAST(N'2020-08-26' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (83, 2, N'Gonzalez', CAST(N'2020-08-26' AS Date), N'Evento', N'Restaurar', N'Restauración realizada correctamente')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (84, 2, N'Gonzalez', CAST(N'2020-08-26' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (85, 2, N'Gonzalez', CAST(N'2020-09-03' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (86, 2, N'Gonzalez', CAST(N'2020-09-03' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (87, 2, N'Gonzalez', CAST(N'2020-09-03' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (88, 2, N'Gonzalez', CAST(N'2020-09-03' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (89, 2, N'Gonzalez', CAST(N'2020-09-03' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (90, 2, N'Gonzalez', CAST(N'2020-09-03' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (91, 2, N'Gonzalez', CAST(N'2020-09-03' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (92, 2, N'Gonzalez', CAST(N'2020-09-03' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (93, 2, N'Gonzalez', CAST(N'2020-09-03' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (94, 2, N'Gonzalez', CAST(N'2020-09-03' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (95, 2, N'Gonzalez', CAST(N'2020-09-03' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (96, 2, N'Gonzalez', CAST(N'2020-09-03' AS Date), N'Evento', N'Deslogueo', N'Deslogueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (97, 2, N'Gonzalez', CAST(N'2020-09-03' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (98, 2, N'Gonzalez', CAST(N'2020-09-03' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (99, 2, N'Gonzalez', CAST(N'2020-09-03' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (100, 2, N'Gonzalez', CAST(N'2020-09-04' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (101, 2, N'Gonzalez', CAST(N'2020-09-04' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (102, 2, N'Gonzalez', CAST(N'2020-09-04' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (103, 2, N'Gonzalez', CAST(N'2020-09-04' AS Date), N'Evento', N'Deslogueo', N'Deslogueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (104, 2, N'Gonzalez', CAST(N'2020-09-24' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (105, 2, N'Gonzalez', CAST(N'2020-09-24' AS Date), N'Evento', N'Deslogueo', N'Deslogueo Correcto')
GO
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (106, 4, N'Gonchale', CAST(N'2020-09-24' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (107, 4, N'Gonchale', CAST(N'2020-09-24' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (108, 2, N'Gonzalez', CAST(N'2020-09-24' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (109, 4, N'Gonchale', CAST(N'2020-09-24' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (110, 2, N'Gonzalez', CAST(N'2020-09-24' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (111, 2, N'Gonzalez', CAST(N'2020-09-24' AS Date), N'Evento', N'Restaurar', N'Restauración realizada correctamente')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (112, 2, N'Gonzalez', CAST(N'2020-09-27' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (113, 2, N'Gonzalez', CAST(N'2020-09-27' AS Date), N'Evento', N'Deslogueo', N'Deslogueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (114, 2, N'Gonzalez', CAST(N'2020-09-28' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (115, 2, N'Gonzalez', CAST(N'2020-09-28' AS Date), N'Evento', N'Deslogueo', N'Deslogueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (116, 2, N'Gonzalez', CAST(N'2020-09-28' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (117, 2, N'Gonzalez', CAST(N'2020-09-28' AS Date), N'Evento', N'Deslogueo', N'Deslogueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (118, 2, N'Gonzalez', CAST(N'2020-09-28' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (119, 2, N'Gonzalez', CAST(N'2020-09-28' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (120, 2, N'Gonzalez', CAST(N'2020-09-28' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (121, 2, N'Gonzalez', CAST(N'2020-09-28' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (122, 2, N'Gonzalez', CAST(N'2020-09-28' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (123, 2, N'Gonzalez', CAST(N'2020-09-28' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (124, 2, N'Gonzalez', CAST(N'2020-09-28' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (125, 2, N'Gonzalez', CAST(N'2020-09-28' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (126, 2, N'Gonzalez', CAST(N'2020-09-28' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (127, 2, N'Gonzalez', CAST(N'2020-09-28' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (128, 2, N'Gonzalez', CAST(N'2020-09-28' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (129, 2, N'Gonzalez', CAST(N'2020-09-28' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (130, 2, N'Gonzalez', CAST(N'2020-09-28' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (131, 2, N'Gonzalez', CAST(N'2020-09-28' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (132, 15, N'creado correctamente', CAST(N'2020-09-30' AS Date), N'Evento', N'Alta usuario', N'Alta usuario: Pal')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (133, 15, N'Pal', CAST(N'2020-09-30' AS Date), N'Error', N'Alta Usuario', N'
Subproceso anulado.
Archivo: 
Linea: 0
   en System.Threading.Thread.AbortInternal()
   en System.Threading.Thread.Abort(Object stateInfo)
   en System.Web.HttpResponse.AbortCurrentThread()
   en System.Web.HttpResponse.End()
   en System.Web.HttpResponse.Redirect(String url, Boolean endResponse, Boolean permanent)
   en System.Web.HttpResponse.Redirect(String url)
   en EcommerceHelper.Presentacion.Views.Public.Registrarme.BtnContinuar_Click(Object sender, EventArgs e) en C:\Users\natal\Desktop\TFI\EcommerceHelper\EcommerceHelper.Presentacion\Views\Public\Registrarme.aspx.cs:línea 149')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (134, 15, N'Pal', CAST(N'2020-09-30' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (135, 0, N'paton', CAST(N'2020-10-02' AS Date), N'Error', N'Alta Usuario', N'
La cadena de entrada no tiene el formato correcto.
Archivo: 
Linea: 0
   en System.Number.StringToNumber(String str, NumberStyles options, NumberBuffer& number, NumberFormatInfo info, Boolean parseDecimal)
   en System.Number.ParseInt32(String s, NumberStyles style, NumberFormatInfo info)
   en System.Int32.Parse(String s)
   en EcommerceHelper.Presentacion.Views.Public.Registrarme.BtnContinuar_Click(Object sender, EventArgs e) en C:\Users\natal\Desktop\TFI\EcommerceHelper\EcommerceHelper.Presentacion\Views\Public\Registrarme.aspx.cs:línea 133')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (136, 16, N'creado correctamente', CAST(N'2020-10-02' AS Date), N'Evento', N'Alta usuario', N'Alta usuario: Lopez')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (137, 16, N'Lopez', CAST(N'2020-10-02' AS Date), N'Error', N'Alta Usuario', N'
Subproceso anulado.
Archivo: 
Linea: 0
   en System.Threading.Thread.AbortInternal()
   en System.Threading.Thread.Abort(Object stateInfo)
   en System.Web.HttpResponse.AbortCurrentThread()
   en System.Web.HttpResponse.End()
   en System.Web.HttpResponse.Redirect(String url, Boolean endResponse, Boolean permanent)
   en System.Web.HttpResponse.Redirect(String url)
   en EcommerceHelper.Presentacion.Views.Public.Registrarme.BtnContinuar_Click(Object sender, EventArgs e) en C:\Users\natal\Desktop\TFI\EcommerceHelper\EcommerceHelper.Presentacion\Views\Public\Registrarme.aspx.cs:línea 154')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (138, 17, N'creado correctamente', CAST(N'2020-10-03' AS Date), N'Evento', N'Alta usuario', N'Alta usuario: messiano')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (139, 17, N'messiano', CAST(N'2020-10-03' AS Date), N'Error', N'Alta Usuario', N'
Subproceso anulado.
Archivo: 
Linea: 0
   en System.Threading.Thread.AbortInternal()
   en System.Threading.Thread.Abort(Object stateInfo)
   en System.Web.HttpResponse.AbortCurrentThread()
   en System.Web.HttpResponse.End()
   en System.Web.HttpResponse.Redirect(String url, Boolean endResponse, Boolean permanent)
   en System.Web.HttpResponse.Redirect(String url)
   en EcommerceHelper.Presentacion.Views.Public.Registrarme.BtnContinuar_Click(Object sender, EventArgs e) en C:\Users\natal\Desktop\TFI\EcommerceHelper\EcommerceHelper.Presentacion\Views\Public\Registrarme.aspx.cs:línea 159')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (140, 18, N'creado correctamente', CAST(N'2020-10-03' AS Date), N'Evento', N'Alta usuario', N'Alta usuario: Merchos')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (141, 19, N'creado correctamente', CAST(N'2020-10-03' AS Date), N'Evento', N'Alta usuario', N'Alta usuario: simpson')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (142, 19, N'simpson', CAST(N'2020-10-03' AS Date), N'Error', N'Alta Usuario', N'
El objeto de tipo ''System.DBNull'' no puede convertirse en el tipo ''System.Single''.
Archivo: 
Linea: 0
   en System.RuntimeType.TryChangeType(Object value, Binder binder, CultureInfo culture, Boolean needsSpecialCast)
   en System.RuntimeType.CheckValue(Object value, Binder binder, CultureInfo culture, BindingFlags invokeAttr)
   en System.Reflection.MethodBase.CheckArguments(Object[] parameters, Binder binder, BindingFlags invokeAttr, CultureInfo culture, Signature sig)
   en System.Reflection.RuntimeMethodInfo.InvokeArgumentsCheck(Object obj, BindingFlags invokeAttr, Binder binder, Object[] parameters, CultureInfo culture)
   en System.Reflection.RuntimeMethodInfo.Invoke(Object obj, BindingFlags invokeAttr, Binder binder, Object[] parameters, CultureInfo culture)
   en System.Reflection.RuntimePropertyInfo.SetValue(Object obj, Object value, BindingFlags invokeAttr, Binder binder, Object[] index, CultureInfo culture)
   en System.Reflection.RuntimePropertyInfo.SetValue(Object obj, Object value, Object[] index)
   en EcommerceHelper.Funciones.Persistencia.Mapeador.CreateItemFromRow[T](DataRow row, IList`1 properties) en C:\Users\natal\Desktop\TFI\EcommerceHelper\EcommerceHelper.Funciones\Persistencia\Mapeador.cs:línea 64
   en EcommerceHelper.Funciones.Persistencia.Mapeador.Mapear[T](DataTable table) en C:\Users\natal\Desktop\TFI\EcommerceHelper\EcommerceHelper.Funciones\Persistencia\Mapeador.cs:línea 19
   en EcommerceHelper.DAL.UsuarioDAL.SelectAllUsuariosDVH() en C:\Users\natal\Desktop\TFI\EcommerceHelper\EcommerceHelper.DAL\UsuarioDAL.cs:línea 190
   en EcommerceHelper.BLL.Servicios.DVVBLL.GenerarDVV(String DVV, String Tabla) en C:\Users\natal\Desktop\TFI\EcommerceHelper\EcommerceHelper.BLL\Servicios\DVVBLL.cs:línea 35
   en EcommerceHelper.BLL.Servicios.DVVBLL.InsertarDVV(String DVV, String tabla) en C:\Users\natal\Desktop\TFI\EcommerceHelper\EcommerceHelper.BLL\Servicios\DVVBLL.cs:línea 65
   en EcommerceHelper.Presentacion.Views.Public.Registrarme.BtnContinuar_Click(Object sender, EventArgs e) en C:\Users\natal\Desktop\TFI\EcommerceHelper\EcommerceHelper.Presentacion\Views\Public\Registrarme.aspx.cs:línea 158')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (143, 20, N'creado correctamente', CAST(N'2020-10-04' AS Date), N'Evento', N'Alta usuario', N'Alta usuario: Sarmiento')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (144, 20, N'Sarmiento', CAST(N'2020-10-04' AS Date), N'Error', N'Alta Usuario', N'
El objeto de tipo ''System.DBNull'' no puede convertirse en el tipo ''System.Single''.
Archivo: 
Linea: 0
   en System.RuntimeType.TryChangeType(Object value, Binder binder, CultureInfo culture, Boolean needsSpecialCast)
   en System.RuntimeType.CheckValue(Object value, Binder binder, CultureInfo culture, BindingFlags invokeAttr)
   en System.Reflection.MethodBase.CheckArguments(Object[] parameters, Binder binder, BindingFlags invokeAttr, CultureInfo culture, Signature sig)
   en System.Reflection.RuntimeMethodInfo.InvokeArgumentsCheck(Object obj, BindingFlags invokeAttr, Binder binder, Object[] parameters, CultureInfo culture)
   en System.Reflection.RuntimeMethodInfo.Invoke(Object obj, BindingFlags invokeAttr, Binder binder, Object[] parameters, CultureInfo culture)
   en System.Reflection.RuntimePropertyInfo.SetValue(Object obj, Object value, BindingFlags invokeAttr, Binder binder, Object[] index, CultureInfo culture)
   en System.Reflection.RuntimePropertyInfo.SetValue(Object obj, Object value, Object[] index)
   en EcommerceHelper.Funciones.Persistencia.Mapeador.CreateItemFromRow[T](DataRow row, IList`1 properties) en C:\Users\natal\Desktop\TFI\EcommerceHelper\EcommerceHelper.Funciones\Persistencia\Mapeador.cs:línea 64
   en EcommerceHelper.Funciones.Persistencia.Mapeador.Mapear[T](DataTable table) en C:\Users\natal\Desktop\TFI\EcommerceHelper\EcommerceHelper.Funciones\Persistencia\Mapeador.cs:línea 19
   en EcommerceHelper.DAL.UsuarioDAL.SelectAllUsuarios() en C:\Users\natal\Desktop\TFI\EcommerceHelper\EcommerceHelper.DAL\UsuarioDAL.cs:línea 190
   en EcommerceHelper.BLL.Servicios.DVVBLL.GenerarDVV(String DVV, String Tabla) en C:\Users\natal\Desktop\TFI\EcommerceHelper\EcommerceHelper.BLL\Servicios\DVVBLL.cs:línea 35
   en EcommerceHelper.BLL.Servicios.DVVBLL.InsertarDVV(String DVV, String tabla) en C:\Users\natal\Desktop\TFI\EcommerceHelper\EcommerceHelper.BLL\Servicios\DVVBLL.cs:línea 65
   en EcommerceHelper.Presentacion.Views.Public.Registrarme.BtnContinuar_Click(Object sender, EventArgs e) en C:\Users\natal\Desktop\TFI\EcommerceHelper\EcommerceHelper.Presentacion\Views\Public\Registrarme.aspx.cs:línea 158')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (145, 21, N'creado correctamente', CAST(N'2020-10-04' AS Date), N'Evento', N'Alta usuario', N'Alta usuario: Sarmiento')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (146, 22, N'creado correctamente', CAST(N'2020-10-04' AS Date), N'Evento', N'Alta usuario', N'Alta usuario: Falcon')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (147, 22, N'Falcon', CAST(N'2020-10-04' AS Date), N'Error', N'Alta Usuario', N'
La conversión especificada no es válida.
Archivo: C:\Users\natal\Desktop\TFI\EcommerceHelper\EcommerceHelper.DAL\UsuarioDAL.cs
Linea: 238
   en EcommerceHelper.DAL.UsuarioDAL.MapearUsuario(DataSet ds) en C:\Users\natal\Desktop\TFI\EcommerceHelper\EcommerceHelper.DAL\UsuarioDAL.cs:línea 238
   en EcommerceHelper.DAL.UsuarioDAL.SelectAllUsuarios() en C:\Users\natal\Desktop\TFI\EcommerceHelper\EcommerceHelper.DAL\UsuarioDAL.cs:línea 190
   en EcommerceHelper.BLL.Servicios.DVVBLL.GenerarDVV(String DVV, String Tabla) en C:\Users\natal\Desktop\TFI\EcommerceHelper\EcommerceHelper.BLL\Servicios\DVVBLL.cs:línea 35
   en EcommerceHelper.BLL.Servicios.DVVBLL.InsertarDVV(String DVV, String tabla) en C:\Users\natal\Desktop\TFI\EcommerceHelper\EcommerceHelper.BLL\Servicios\DVVBLL.cs:línea 65
   en EcommerceHelper.Presentacion.Views.Public.Registrarme.BtnContinuar_Click(Object sender, EventArgs e) en C:\Users\natal\Desktop\TFI\EcommerceHelper\EcommerceHelper.Presentacion\Views\Public\Registrarme.aspx.cs:línea 158')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (148, 23, N'creado correctamente', CAST(N'2020-10-04' AS Date), N'Evento', N'Alta usuario', N'Alta usuario: Falcon')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (149, 23, N'Falcon', CAST(N'2020-10-04' AS Date), N'Error', N'Alta Usuario', N'
La conversión especificada no es válida.
Archivo: C:\Users\natal\Desktop\TFI\EcommerceHelper\EcommerceHelper.DAL\UsuarioDAL.cs
Linea: 238
   en EcommerceHelper.DAL.UsuarioDAL.MapearUsuario(DataSet ds) en C:\Users\natal\Desktop\TFI\EcommerceHelper\EcommerceHelper.DAL\UsuarioDAL.cs:línea 238
   en EcommerceHelper.DAL.UsuarioDAL.SelectAllUsuarios() en C:\Users\natal\Desktop\TFI\EcommerceHelper\EcommerceHelper.DAL\UsuarioDAL.cs:línea 190
   en EcommerceHelper.BLL.Servicios.DVVBLL.GenerarDVV(String DVV, String Tabla) en C:\Users\natal\Desktop\TFI\EcommerceHelper\EcommerceHelper.BLL\Servicios\DVVBLL.cs:línea 35
   en EcommerceHelper.BLL.Servicios.DVVBLL.InsertarDVV(String DVV, String tabla) en C:\Users\natal\Desktop\TFI\EcommerceHelper\EcommerceHelper.BLL\Servicios\DVVBLL.cs:línea 65
   en EcommerceHelper.Presentacion.Views.Public.Registrarme.BtnContinuar_Click(Object sender, EventArgs e) en C:\Users\natal\Desktop\TFI\EcommerceHelper\EcommerceHelper.Presentacion\Views\Public\Registrarme.aspx.cs:línea 158')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (150, 24, N'creado correctamente', CAST(N'2020-10-04' AS Date), N'Evento', N'Alta usuario', N'Alta usuario: Falcon')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (151, 24, N'Falcon', CAST(N'2020-10-04' AS Date), N'Error', N'Alta Usuario', N'
La conversión especificada no es válida.
Archivo: 
Linea: 0
   en EcommerceHelper.DAL.UsuarioDAL.MapearUsuario(DataSet ds)
   en EcommerceHelper.DAL.UsuarioDAL.SelectAllUsuarios()
   en EcommerceHelper.BLL.Servicios.DVVBLL.GenerarDVV(String DVV, String Tabla) en C:\Users\natal\Desktop\TFI\EcommerceHelper\EcommerceHelper.BLL\Servicios\DVVBLL.cs:línea 35
   en EcommerceHelper.BLL.Servicios.DVVBLL.InsertarDVV(String DVV, String tabla) en C:\Users\natal\Desktop\TFI\EcommerceHelper\EcommerceHelper.BLL\Servicios\DVVBLL.cs:línea 65
   en EcommerceHelper.Presentacion.Views.Public.Registrarme.BtnContinuar_Click(Object sender, EventArgs e) en C:\Users\natal\Desktop\TFI\EcommerceHelper\EcommerceHelper.Presentacion\Views\Public\Registrarme.aspx.cs:línea 158')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (152, 25, N'creado correctamente', CAST(N'2020-10-04' AS Date), N'Evento', N'Alta usuario', N'Alta usuario: Falcon')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (153, 25, N'Falcon', CAST(N'2020-10-04' AS Date), N'Error', N'Alta Usuario', N'
La conversión especificada no es válida.
Archivo: 
Linea: 0
   en EcommerceHelper.DAL.UsuarioDAL.MapearUsuario(DataSet ds)
   en EcommerceHelper.DAL.UsuarioDAL.SelectAllUsuarios()
   en EcommerceHelper.BLL.Servicios.DVVBLL.GenerarDVV(String DVV, String Tabla) en C:\Users\natal\Desktop\TFI\EcommerceHelper\EcommerceHelper.BLL\Servicios\DVVBLL.cs:línea 35
   en EcommerceHelper.BLL.Servicios.DVVBLL.InsertarDVV(String DVV, String tabla) en C:\Users\natal\Desktop\TFI\EcommerceHelper\EcommerceHelper.BLL\Servicios\DVVBLL.cs:línea 65
   en EcommerceHelper.Presentacion.Views.Public.Registrarme.BtnContinuar_Click(Object sender, EventArgs e) en C:\Users\natal\Desktop\TFI\EcommerceHelper\EcommerceHelper.Presentacion\Views\Public\Registrarme.aspx.cs:línea 158')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (154, 26, N'creado correctamente', CAST(N'2020-10-04' AS Date), N'Evento', N'Alta usuario', N'Alta usuario: SDJ')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (155, 26, N'SDJ', CAST(N'2020-10-04' AS Date), N'Error', N'Alta Usuario', N'
La conversión especificada no es válida.
Archivo: C:\Users\natal\Desktop\TFI\EcommerceHelper\EcommerceHelper.DAL\UsuarioDAL.cs
Linea: 238
   en EcommerceHelper.DAL.UsuarioDAL.MapearUsuario(DataSet ds) en C:\Users\natal\Desktop\TFI\EcommerceHelper\EcommerceHelper.DAL\UsuarioDAL.cs:línea 238
   en EcommerceHelper.DAL.UsuarioDAL.SelectAllUsuarios() en C:\Users\natal\Desktop\TFI\EcommerceHelper\EcommerceHelper.DAL\UsuarioDAL.cs:línea 190
   en EcommerceHelper.BLL.Servicios.DVVBLL.GenerarDVV(String DVV, String Tabla) en C:\Users\natal\Desktop\TFI\EcommerceHelper\EcommerceHelper.BLL\Servicios\DVVBLL.cs:línea 35
   en EcommerceHelper.BLL.Servicios.DVVBLL.InsertarDVV(String DVV, String tabla) en C:\Users\natal\Desktop\TFI\EcommerceHelper\EcommerceHelper.BLL\Servicios\DVVBLL.cs:línea 65
   en EcommerceHelper.Presentacion.Views.Public.Registrarme.BtnContinuar_Click(Object sender, EventArgs e) en C:\Users\natal\Desktop\TFI\EcommerceHelper\EcommerceHelper.Presentacion\Views\Public\Registrarme.aspx.cs:línea 158')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (156, 27, N'creado correctamente', CAST(N'2020-10-04' AS Date), N'Evento', N'Alta usuario', N'Alta usuario: SDJ')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (157, 28, N'creado correctamente', CAST(N'2020-10-04' AS Date), N'Evento', N'Alta usuario', N'Alta usuario: perez')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (158, 28, N'perez', CAST(N'2020-10-04' AS Date), N'Error', N'Alta Usuario', N'
La conversión especificada no es válida.
Archivo: C:\Users\natal\Desktop\TFI\EcommerceHelper\EcommerceHelper.DAL\UsuarioDAL.cs
Linea: 238
   en EcommerceHelper.DAL.UsuarioDAL.MapearUsuario(DataSet ds) en C:\Users\natal\Desktop\TFI\EcommerceHelper\EcommerceHelper.DAL\UsuarioDAL.cs:línea 238
   en EcommerceHelper.DAL.UsuarioDAL.SelectAllUsuarios() en C:\Users\natal\Desktop\TFI\EcommerceHelper\EcommerceHelper.DAL\UsuarioDAL.cs:línea 190
   en EcommerceHelper.BLL.Servicios.DVVBLL.GenerarDVV(String DVV, String Tabla) en C:\Users\natal\Desktop\TFI\EcommerceHelper\EcommerceHelper.BLL\Servicios\DVVBLL.cs:línea 35
   en EcommerceHelper.BLL.Servicios.DVVBLL.InsertarDVV(String DVV, String tabla) en C:\Users\natal\Desktop\TFI\EcommerceHelper\EcommerceHelper.BLL\Servicios\DVVBLL.cs:línea 65
   en EcommerceHelper.Presentacion.Views.Public.Registrarme.BtnContinuar_Click(Object sender, EventArgs e) en C:\Users\natal\Desktop\TFI\EcommerceHelper\EcommerceHelper.Presentacion\Views\Public\Registrarme.aspx.cs:línea 158')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (159, 29, N'creado correctamente', CAST(N'2020-10-04' AS Date), N'Evento', N'Alta usuario', N'Alta usuario: perez')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (160, 29, N'perez', CAST(N'2020-10-04' AS Date), N'Error', N'Alta Usuario', N'
La conversión especificada no es válida.
Archivo: C:\Users\natal\Desktop\TFI\EcommerceHelper\EcommerceHelper.DAL\UsuarioDAL.cs
Linea: 238
   en EcommerceHelper.DAL.UsuarioDAL.MapearUsuario(DataSet ds) en C:\Users\natal\Desktop\TFI\EcommerceHelper\EcommerceHelper.DAL\UsuarioDAL.cs:línea 238
   en EcommerceHelper.DAL.UsuarioDAL.SelectAllUsuarios() en C:\Users\natal\Desktop\TFI\EcommerceHelper\EcommerceHelper.DAL\UsuarioDAL.cs:línea 190
   en EcommerceHelper.BLL.Servicios.DVVBLL.GenerarDVV(String DVV, String Tabla) en C:\Users\natal\Desktop\TFI\EcommerceHelper\EcommerceHelper.BLL\Servicios\DVVBLL.cs:línea 35
   en EcommerceHelper.BLL.Servicios.DVVBLL.InsertarDVV(String DVV, String tabla) en C:\Users\natal\Desktop\TFI\EcommerceHelper\EcommerceHelper.BLL\Servicios\DVVBLL.cs:línea 65
   en EcommerceHelper.Presentacion.Views.Public.Registrarme.BtnContinuar_Click(Object sender, EventArgs e) en C:\Users\natal\Desktop\TFI\EcommerceHelper\EcommerceHelper.Presentacion\Views\Public\Registrarme.aspx.cs:línea 158')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (161, 30, N'creado correctamente', CAST(N'2020-10-04' AS Date), N'Evento', N'Alta usuario', N'Alta usuario: perez')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (162, 30, N'perez', CAST(N'2020-10-04' AS Date), N'Error', N'Alta Usuario', N'
La conversión especificada no es válida.
Archivo: 
Linea: 0
   en EcommerceHelper.DAL.UsuarioDAL.MapearUsuario(DataSet ds)
   en EcommerceHelper.DAL.UsuarioDAL.SelectAllUsuarios()
   en EcommerceHelper.BLL.Servicios.DVVBLL.GenerarDVV(String DVV, String Tabla) en C:\Users\natal\Desktop\TFI\EcommerceHelper\EcommerceHelper.BLL\Servicios\DVVBLL.cs:línea 35
   en EcommerceHelper.BLL.Servicios.DVVBLL.InsertarDVV(String DVV, String tabla) en C:\Users\natal\Desktop\TFI\EcommerceHelper\EcommerceHelper.BLL\Servicios\DVVBLL.cs:línea 65
   en EcommerceHelper.Presentacion.Views.Public.Registrarme.BtnContinuar_Click(Object sender, EventArgs e) en C:\Users\natal\Desktop\TFI\EcommerceHelper\EcommerceHelper.Presentacion\Views\Public\Registrarme.aspx.cs:línea 158')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (163, 34, N'creado correctamente', CAST(N'2020-10-04' AS Date), N'Evento', N'Alta usuario', N'Alta usuario: perez')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (164, 35, N'creado correctamente', CAST(N'2020-10-04' AS Date), N'Evento', N'Alta usuario', N'Alta usuario: mirta')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (165, 36, N'creado correctamente', CAST(N'2020-10-04' AS Date), N'Evento', N'Alta usuario', N'Alta usuario: lopez')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (166, 36, N'lopez', CAST(N'2020-10-04' AS Date), N'Error', N'Alta Usuario', N'
Subproceso anulado.
Archivo: 
Linea: 0
   en System.Threading.Thread.AbortInternal()
   en System.Threading.Thread.Abort(Object stateInfo)
   en System.Web.HttpResponse.AbortCurrentThread()
   en System.Web.HttpResponse.End()
   en System.Web.HttpResponse.Redirect(String url, Boolean endResponse, Boolean permanent)
   en System.Web.HttpResponse.Redirect(String url)
   en EcommerceHelper.Presentacion.Views.Public.Registrarme.BtnContinuar_Click(Object sender, EventArgs e) en C:\Users\natal\Desktop\TFI\EcommerceHelper\EcommerceHelper.Presentacion\Views\Public\Registrarme.aspx.cs:línea 159')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (167, 5, N'simpson', CAST(N'2020-10-05' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (168, 0, N'SIN_USUARIO', CAST(N'2020-10-08' AS Date), N'Error', N'FamiliaTraerSubPermisos', N'
El nombre de objeto ''RemFamFam'' no es válido.
Archivo: 
Linea: 0
   en System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   en System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   en System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   en System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   en System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   en System.Data.SqlClient.SqlDataReader.get_MetaData()
   en System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   en System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   en System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   en System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   en System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior, String method)
   en System.Data.SqlClient.SqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   en System.Data.Common.DbCommand.System.Data.IDbCommand.ExecuteReader(CommandBehavior behavior)
   en System.Data.Common.DbDataAdapter.FillInternal(DataSet dataset, DataTable[] datatables, Int32 startRecord, Int32 maxRecords, String srcTable, IDbCommand command, CommandBehavior behavior)
   en System.Data.Common.DbDataAdapter.Fill(DataSet dataSet, Int32 startRecord, Int32 maxRecords, String srcTable, IDbCommand command, CommandBehavior behavior)
   en System.Data.Common.DbDataAdapter.Fill(DataSet dataSet)
   en EcommerceHelper.Funciones.Persistencia.SqlClientUtility.CrearDataSet(SqlCommand unComando) en C:\Users\natal\Desktop\TFI\EcommerceHelper\EcommerceHelper.Funciones\Persistencia\SqlClientUtility.cs:línea 106
   en EcommerceHelper.Funciones.Persistencia.SqlClientUtility.ExecuteDataSet(String connectionStringName, CommandType commandType, String commandText, SqlParameter[] parameters) en C:\Users\natal\Desktop\TFI\EcommerceHelper\EcommerceHelper.Funciones\Persistencia\SqlClientUtility.cs:línea 92
   en EcommerceHelper.DAL.Servicios.FamiliaDAL.FamiliaTraerFamiliasHijas(IFamPat unaFamilia) en C:\Users\natal\Desktop\TFI\EcommerceHelper\EcommerceHelper.DAL\Servicios\FamiliaDAL.cs:línea 60
   en EcommerceHelper.BLL.Servicios.FamiliaBLL.FamiliaTraerSubPermisos(List`1 unasFamilias) en C:\Users\natal\Desktop\TFI\EcommerceHelper\EcommerceHelper.BLL\Servicios\FamiliaBLL.cs:línea 26')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (169, 2, N'Gonzalez', CAST(N'2020-10-08' AS Date), N'Error', N'UsuarioTraerPermisos', N'
El nombre de objeto ''RemFamFam'' no es válido.
Archivo: 
Linea: 0
   en System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   en System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   en System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   en System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   en System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   en System.Data.SqlClient.SqlDataReader.get_MetaData()
   en System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   en System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   en System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   en System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   en System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior, String method)
   en System.Data.SqlClient.SqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   en System.Data.Common.DbCommand.System.Data.IDbCommand.ExecuteReader(CommandBehavior behavior)
   en System.Data.Common.DbDataAdapter.FillInternal(DataSet dataset, DataTable[] datatables, Int32 startRecord, Int32 maxRecords, String srcTable, IDbCommand command, CommandBehavior behavior)
   en System.Data.Common.DbDataAdapter.Fill(DataSet dataSet, Int32 startRecord, Int32 maxRecords, String srcTable, IDbCommand command, CommandBehavior behavior)
   en System.Data.Common.DbDataAdapter.Fill(DataSet dataSet)
   en EcommerceHelper.Funciones.Persistencia.SqlClientUtility.CrearDataSet(SqlCommand unComando) en C:\Users\natal\Desktop\TFI\EcommerceHelper\EcommerceHelper.Funciones\Persistencia\SqlClientUtility.cs:línea 106
   en EcommerceHelper.Funciones.Persistencia.SqlClientUtility.ExecuteDataSet(String connectionStringName, CommandType commandType, String commandText, SqlParameter[] parameters) en C:\Users\natal\Desktop\TFI\EcommerceHelper\EcommerceHelper.Funciones\Persistencia\SqlClientUtility.cs:línea 92
   en EcommerceHelper.DAL.Servicios.FamiliaDAL.FamiliaTraerFamiliasHijas(IFamPat unaFamilia) en C:\Users\natal\Desktop\TFI\EcommerceHelper\EcommerceHelper.DAL\Servicios\FamiliaDAL.cs:línea 60
   en EcommerceHelper.BLL.Servicios.FamiliaBLL.FamiliaTraerSubPermisos(List`1 unasFamilias) en C:\Users\natal\Desktop\TFI\EcommerceHelper\EcommerceHelper.BLL\Servicios\FamiliaBLL.cs:línea 34
   en EcommerceHelper.BLL.UsuarioBLL.UsuarioTraerPermisos(String elNomUsuario, Int32 elIdUsuario) en C:\Users\natal\Desktop\TFI\EcommerceHelper\EcommerceHelper.BLL\UsuarioBLL.cs:línea 144')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (170, 2, N'Gonzalez', CAST(N'2020-10-08' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (171, 2, N'Gonzalez', CAST(N'2020-10-08' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (172, 2, N'Gonzalez', CAST(N'2020-10-08' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (173, 2, N'Gonzalez', CAST(N'2020-10-08' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (174, 2, N'Gonzalez', CAST(N'2020-10-08' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (175, 2, N'Gonzalez', CAST(N'2020-10-09' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (176, 2, N'Gonzalez', CAST(N'2020-10-09' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (177, 2, N'Gonzalez', CAST(N'2020-10-09' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (178, 2, N'Gonzalez', CAST(N'2020-10-09' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (179, 2, N'Gonzalez', CAST(N'2020-10-09' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (180, 2, N'Gonzalez', CAST(N'2020-10-09' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (181, 2, N'Gonzalez', CAST(N'2020-10-09' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (182, 2, N'Gonzalez', CAST(N'2020-10-09' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (183, 2, N'Gonzalez', CAST(N'2020-10-09' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (184, 2, N'Gonzalez', CAST(N'2020-10-09' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (185, 2, N'Gonzalez', CAST(N'2020-10-09' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (186, 2, N'Gonzalez', CAST(N'2020-10-09' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (187, 2, N'Gonzalez', CAST(N'2020-10-09' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (188, 2, N'Gonzalez', CAST(N'2020-10-09' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (189, 2, N'Gonzalez', CAST(N'2020-10-09' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (190, 2, N'Gonzalez', CAST(N'2020-10-09' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (191, 2, N'Gonzalez', CAST(N'2020-10-09' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (192, 2, N'Gonzalez', CAST(N'2020-10-09' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (193, 2, N'Gonzalez', CAST(N'2020-10-09' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (194, 2, N'Gonzalez', CAST(N'2020-10-09' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (195, 2, N'Gonzalez', CAST(N'2020-10-09' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (196, 2, N'Gonzalez', CAST(N'2020-10-09' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (197, 2, N'Gonzalez', CAST(N'2020-10-09' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (198, 2, N'Gonzalez', CAST(N'2020-10-09' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (199, 2, N'Gonzalez', CAST(N'2020-10-09' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (200, 2, N'Gonzalez', CAST(N'2020-10-09' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (201, 2, N'Gonzalez', CAST(N'2020-10-09' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (202, 2, N'Gonzalez', CAST(N'2020-10-09' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (203, 2, N'Gonzalez', CAST(N'2020-10-09' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (204, 2, N'Gonzalez', CAST(N'2020-10-09' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (205, 2, N'Gonzalez', CAST(N'2020-10-09' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
GO
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (206, 2, N'Gonzalez', CAST(N'2020-10-09' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (207, 2, N'Gonzalez', CAST(N'2020-10-09' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (208, 2, N'Gonzalez', CAST(N'2020-10-09' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (209, 2, N'Gonzalez', CAST(N'2020-10-09' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (210, 2, N'Gonzalez', CAST(N'2020-10-09' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (211, 2, N'Gonzalez', CAST(N'2020-10-09' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (212, 2, N'Gonzalez', CAST(N'2020-10-09' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (213, 2, N'Gonzalez', CAST(N'2020-10-09' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (214, 2, N'Gonzalez', CAST(N'2020-10-09' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (215, 2, N'Gonzalez', CAST(N'2020-10-09' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (216, 2, N'admin@helper.com.ar', CAST(N'2020-10-11' AS Date), N'Error', N'UsuarioTraerPermisos', N'
El procedimiento o la función ''UsuarioTraerPatentes'' esperaba el parámetro ''@elIdUsuario'', que no se ha especificado.
Archivo: 
Linea: 0
   en System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   en System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   en System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   en System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   en System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   en System.Data.SqlClient.SqlDataReader.get_MetaData()
   en System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   en System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   en System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   en System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   en System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior, String method)
   en System.Data.SqlClient.SqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   en System.Data.Common.DbCommand.System.Data.IDbCommand.ExecuteReader(CommandBehavior behavior)
   en System.Data.Common.DbDataAdapter.FillInternal(DataSet dataset, DataTable[] datatables, Int32 startRecord, Int32 maxRecords, String srcTable, IDbCommand command, CommandBehavior behavior)
   en System.Data.Common.DbDataAdapter.Fill(DataSet dataSet, Int32 startRecord, Int32 maxRecords, String srcTable, IDbCommand command, CommandBehavior behavior)
   en System.Data.Common.DbDataAdapter.Fill(DataSet dataSet)
   en EcommerceHelper.Funciones.Persistencia.SqlClientUtility.CrearDataSet(SqlCommand unComando) en C:\Users\natal\Desktop\TFI\EcommerceHelper\EcommerceHelper.Funciones\Persistencia\SqlClientUtility.cs:línea 106
   en EcommerceHelper.Funciones.Persistencia.SqlClientUtility.ExecuteDataSet(String connectionStringName, CommandType commandType, String commandText, SqlParameter[] parameters) en C:\Users\natal\Desktop\TFI\EcommerceHelper\EcommerceHelper.Funciones\Persistencia\SqlClientUtility.cs:línea 92
   en EcommerceHelper.DAL.UsuarioDAL.UsuarioTraerPermisos(String email, Int32 IdUsuario) en C:\Users\natal\Desktop\TFI\EcommerceHelper\EcommerceHelper.DAL\UsuarioDAL.cs:línea 180
   en EcommerceHelper.BLL.UsuarioBLL.UsuarioTraerPermisos(String email, Int32 IdUsuario) en C:\Users\natal\Desktop\TFI\EcommerceHelper\EcommerceHelper.BLL\UsuarioBLL.cs:línea 142')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (217, 2, N'Gonzalez', CAST(N'2020-10-11' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (218, 2, N'Gonzalez', CAST(N'2020-10-11' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (219, 2, N'Gonzalez', CAST(N'2020-10-11' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (220, 2, N'Gonzalez', CAST(N'2020-10-11' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (221, 2, N'Gonzalez', CAST(N'2020-10-11' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (222, 2, N'Gonzalez', CAST(N'2020-10-11' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (223, 2, N'Gonzalez', CAST(N'2020-10-11' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (224, 2, N'Gonzalez', CAST(N'2020-10-11' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (225, 2, N'Gonzalez', CAST(N'2020-10-11' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (226, 2, N'Gonzalez', CAST(N'2020-10-11' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (227, 2, N'Gonzalez', CAST(N'2020-10-11' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (228, 2, N'Gonzalez', CAST(N'2020-10-11' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (229, 2, N'Gonzalez', CAST(N'2020-10-11' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (230, 2, N'Gonzalez', CAST(N'2020-10-11' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (231, 2, N'Gonzalez', CAST(N'2020-10-11' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (232, 2, N'Gonzalez', CAST(N'2020-10-11' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (233, 2, N'Gonzalez', CAST(N'2020-10-11' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (234, 2, N'Gonzalez', CAST(N'2020-10-11' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (235, 2, N'Gonzalez', CAST(N'2020-10-11' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (236, 2, N'Gonzalez', CAST(N'2020-10-11' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (237, 2, N'Gonzalez', CAST(N'2020-10-11' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (238, 2, N'Gonzalez', CAST(N'2020-10-11' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (239, 2, N'Gonzalez', CAST(N'2020-10-11' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (240, 2, N'Gonzalez', CAST(N'2020-10-11' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (241, 2, N'Gonzalez', CAST(N'2020-10-12' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (242, 2, N'Gonzalez', CAST(N'2020-10-12' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (243, 2, N'Gonzalez', CAST(N'2020-10-12' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (244, 2, N'Gonzalez', CAST(N'2020-10-12' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (245, 2, N'Gonzalez', CAST(N'2020-10-12' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (246, 2, N'Gonzalez', CAST(N'2020-10-12' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (247, 2, N'Gonzalez', CAST(N'2020-10-12' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (248, 2, N'Gonzalez', CAST(N'2020-10-12' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (249, 2, N'Gonzalez', CAST(N'2020-10-12' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (250, 2, N'Gonzalez', CAST(N'2020-10-12' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (251, 2, N'Gonzalez', CAST(N'2020-10-12' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (252, 2, N'Gonzalez', CAST(N'2020-10-12' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (253, 2, N'Gonzalez', CAST(N'2020-10-12' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (254, 2, N'Gonzalez', CAST(N'2020-10-12' AS Date), N'Evento', N'Modificar Familia', N'Familia miFamilia modificada correctamente')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (255, 2, N'Gonzalez', CAST(N'2020-10-12' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (256, 2, N'Gonzalez', CAST(N'2020-10-12' AS Date), N'Error', N'Backup', N'
No posee los permisos suficientes
Archivo: 
Linea: 0
   en EcommerceHelper.Funciones.Seguridad.ServicioBackup.Respaldar(String ruta)
   en EcommerceHelper.Presentacion.Views.Private.BackUp.btnUpload_Click1(Object sender, EventArgs e) en C:\Users\natal\Desktop\TFI\EcommerceHelper\EcommerceHelper.Presentacion\Views\Private\BackUp.aspx.cs:línea 51')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (257, 2, N'Gonzalez', CAST(N'2020-10-12' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (258, 2, N'Gonzalez', CAST(N'2020-10-12' AS Date), N'Evento', N'Modificar Familia', N'Familia Admin modificada correctamente')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (259, 2, N'Gonzalez', CAST(N'2020-10-12' AS Date), N'Error', N'Backup', N'
No posee los permisos suficientes
Archivo: 
Linea: 0
   en EcommerceHelper.Funciones.Seguridad.ServicioBackup.Respaldar(String ruta)
   en EcommerceHelper.Presentacion.Views.Private.BackUp.btnUpload_Click1(Object sender, EventArgs e) en C:\Users\natal\Desktop\TFI\EcommerceHelper\EcommerceHelper.Presentacion\Views\Private\BackUp.aspx.cs:línea 51')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (260, 2, N'Gonzalez', CAST(N'2020-10-12' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (261, 2, N'Gonzalez', CAST(N'2020-10-12' AS Date), N'Evento', N'Deslogueo', N'Deslogueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (262, 2, N'Gonzalez', CAST(N'2020-10-12' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (263, 2, N'Gonzalez', CAST(N'2020-10-12' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (264, 2, N'Gonzalez', CAST(N'2020-10-12' AS Date), N'Error', N'Backup', N'
No posee los permisos suficientes
Archivo: C:\Users\natal\Desktop\TFI\EcommerceHelper\EcommerceHelper.Funciones\Seguridad\ServicioBackup.cs
Linea: 45
   en EcommerceHelper.Funciones.Seguridad.ServicioBackup.Respaldar(String ruta) en C:\Users\natal\Desktop\TFI\EcommerceHelper\EcommerceHelper.Funciones\Seguridad\ServicioBackup.cs:línea 45
   en EcommerceHelper.Presentacion.Views.Private.BackUp.btnUpload_Click1(Object sender, EventArgs e) en C:\Users\natal\Desktop\TFI\EcommerceHelper\EcommerceHelper.Presentacion\Views\Private\BackUp.aspx.cs:línea 51')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (265, 2, N'Gonzalez', CAST(N'2020-10-13' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (266, 2, N'Gonzalez', CAST(N'2020-10-13' AS Date), N'Error', N'Backup', N'
No posee los permisos suficientes
Archivo: C:\Users\natal\Desktop\TFI\EcommerceHelper\EcommerceHelper.Funciones\Seguridad\ServicioBackup.cs
Linea: 45
   en EcommerceHelper.Funciones.Seguridad.ServicioBackup.Respaldar(String ruta) en C:\Users\natal\Desktop\TFI\EcommerceHelper\EcommerceHelper.Funciones\Seguridad\ServicioBackup.cs:línea 45
   en EcommerceHelper.Presentacion.Views.Private.BackUp.btnUpload_Click1(Object sender, EventArgs e) en C:\Users\natal\Desktop\TFI\EcommerceHelper\EcommerceHelper.Presentacion\Views\Private\BackUp.aspx.cs:línea 51')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (267, 2, N'Gonzalez', CAST(N'2020-10-13' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (268, 2, N'Gonzalez', CAST(N'2020-10-13' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (269, 2, N'Gonzalez', CAST(N'2020-10-13' AS Date), N'Evento', N'Eliminar Familia', N'Familia 5 eliminada correctamente')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (270, 2, N'Gonzalez', CAST(N'2020-10-14' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (271, 2, N'Gonzalez', CAST(N'2020-10-14' AS Date), N'Error', N'Backup', N'
No posee los permisos suficientes
Archivo: C:\Users\natal\Desktop\TFI\EcommerceHelper\EcommerceHelper.Funciones\Seguridad\ServicioBackup.cs
Linea: 45
   en EcommerceHelper.Funciones.Seguridad.ServicioBackup.Respaldar(String ruta) en C:\Users\natal\Desktop\TFI\EcommerceHelper\EcommerceHelper.Funciones\Seguridad\ServicioBackup.cs:línea 45
   en EcommerceHelper.Presentacion.Views.Private.BackUp.btnUpload_Click1(Object sender, EventArgs e) en C:\Users\natal\Desktop\TFI\EcommerceHelper\EcommerceHelper.Presentacion\Views\Private\BackUp.aspx.cs:línea 51')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (272, 2, N'Gonzalez', CAST(N'2020-10-14' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (273, 2, N'Gonzalez', CAST(N'2020-10-14' AS Date), N'Evento', N'Backup', N'Backup realizado correctamente')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (274, 2, N'Gonzalez', CAST(N'2020-10-14' AS Date), N'Error', N'Backup', N'
No se pudo encontrar el archivo ''C:\Users\natal\Desktop\TFI\EcommerceHelper\EcommerceHelper.Presentacion\Content\Files\14-10Prueba.bak''.
Archivo: 
Linea: 0
   en System.IO.__Error.WinIOError(Int32 errorCode, String maybeFullPath)
   en System.IO.FileStream.Init(String path, FileMode mode, FileAccess access, Int32 rights, Boolean useRights, FileShare share, Int32 bufferSize, FileOptions options, SECURITY_ATTRIBUTES secAttrs, String msgPath, Boolean bFromProxy, Boolean useLongPath, Boolean checkHost)
   en System.IO.FileStream..ctor(String path, FileMode mode, FileAccess access, FileShare share)
   en System.Web.HttpResponse.TransmitFile(String filename, Int64 offset, Int64 length)
   en System.Web.HttpResponse.TransmitFile(String filename)
   en EcommerceHelper.Presentacion.Views.Private.BackUp.btnUpload_Click1(Object sender, EventArgs e) en C:\Users\natal\Desktop\TFI\EcommerceHelper\EcommerceHelper.Presentacion\Views\Private\BackUp.aspx.cs:línea 56')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (275, 2, N'Gonzalez', CAST(N'2020-10-14' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (276, 2, N'Gonzalez', CAST(N'2020-10-14' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (277, 2, N'Gonzalez', CAST(N'2020-10-14' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (278, 2, N'Gonzalez', CAST(N'2020-10-14' AS Date), N'Evento', N'Backup', N'Backup realizado correctamente')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (279, 2, N'Gonzalez', CAST(N'2020-10-14' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (280, 2, N'Gonzalez', CAST(N'2020-10-14' AS Date), N'Evento', N'Backup', N'Backup realizado correctamente')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (281, 2, N'Gonzalez', CAST(N'2020-10-14' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (282, 2, N'Gonzalez', CAST(N'2020-10-14' AS Date), N'Evento', N'Backup', N'Backup realizado correctamente')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (283, 2, N'Gonzalez', CAST(N'2020-10-14' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (284, 2, N'Gonzalez', CAST(N'2020-10-14' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (285, 2, N'Gonzalez', CAST(N'2020-10-14' AS Date), N'Evento', N'Backup', N'Backup realizado correctamente')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (286, 2, N'Gonzalez', CAST(N'2020-10-14' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (287, 2, N'Gonzalez', CAST(N'2020-10-14' AS Date), N'Evento', N'Restaurar', N'Restauración realizada correctamente')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (288, 2, N'Gonzalez', CAST(N'2020-10-14' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (289, 0, N'SIN_USUARIO', CAST(N'2020-10-14' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (290, 0, N'SIN_USUARIO', CAST(N'2020-10-14' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (291, 2, N'Gonzalez', CAST(N'2020-10-14' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (292, 2, N'Gonzalez', CAST(N'2020-10-15' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (293, 2, N'Gonzalez', CAST(N'2020-10-15' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (294, 2, N'Gonzalez', CAST(N'2020-10-15' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (295, 2, N'Gonzalez', CAST(N'2020-10-15' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (296, 2, N'Gonzalez', CAST(N'2020-10-15' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (297, 2, N'Gonzalez', CAST(N'2020-10-15' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (298, 2, N'Gonzalez', CAST(N'2020-10-15' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (299, 2, N'Gonzalez', CAST(N'2020-10-15' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (300, 2, N'Gonzalez', CAST(N'2020-10-15' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (301, 2, N'Gonzalez', CAST(N'2020-10-15' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (302, 2, N'Gonzalez', CAST(N'2020-10-15' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (303, 2, N'Gonzalez', CAST(N'2020-10-15' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (304, 2, N'Gonzalez', CAST(N'2020-10-15' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (305, 2, N'Gonzalez', CAST(N'2020-10-15' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
GO
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (306, 2, N'Gonzalez', CAST(N'2020-10-15' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (307, 2, N'Gonzalez', CAST(N'2020-10-15' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (308, 2, N'Gonzalez', CAST(N'2020-10-15' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (309, 2, N'Gonzalez', CAST(N'2020-10-15' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (310, 2, N'Gonzalez', CAST(N'2020-10-15' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (311, 2, N'Gonzalez', CAST(N'2020-10-15' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (312, 2, N'Gonzalez', CAST(N'2020-10-15' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (313, 2, N'Gonzalez', CAST(N'2020-10-15' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (314, 2, N'Gonzalez', CAST(N'2020-10-15' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (315, 2, N'Gonzalez', CAST(N'2020-10-15' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (316, 2, N'Gonzalez', CAST(N'2020-10-15' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (317, 2, N'Gonzalez', CAST(N'2020-10-15' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (318, 2, N'Gonzalez', CAST(N'2020-10-15' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (319, 2, N'Gonzalez', CAST(N'2020-10-15' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (320, 2, N'Gonzalez', CAST(N'2020-10-15' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (321, 2, N'Gonzalez', CAST(N'2020-10-15' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (322, 2, N'Gonzalez', CAST(N'2020-10-15' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (323, 2, N'Gonzalez', CAST(N'2020-10-15' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (324, 2, N'Gonzalez', CAST(N'2020-10-15' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (325, 2, N'Gonzalez', CAST(N'2020-10-15' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (326, 2, N'Gonzalez', CAST(N'2020-10-15' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (327, 2, N'Gonzalez', CAST(N'2020-10-15' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (328, 6, N'Baez', CAST(N'2020-10-15' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (329, 6, N'Baez', CAST(N'2020-10-15' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (330, 6, N'Baez', CAST(N'2020-10-15' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (331, 6, N'Baez', CAST(N'2020-10-15' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (332, 6, N'Baez', CAST(N'2020-10-15' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (333, 2, N'Gonzalez', CAST(N'2020-10-15' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (334, 2, N'Gonzalez', CAST(N'2020-10-15' AS Date), N'Evento', N'Deslogueo', N'Deslogueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (335, 6, N'Baez', CAST(N'2020-10-15' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (336, 6, N'Baez', CAST(N'2020-10-15' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (337, 6, N'Baez', CAST(N'2020-10-15' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (338, 6, N'Baez', CAST(N'2020-10-15' AS Date), N'Evento', N'Deslogueo', N'Deslogueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (339, 2, N'Gonzalez', CAST(N'2020-10-15' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (340, 2, N'Gonzalez', CAST(N'2020-10-15' AS Date), N'Evento', N'Deslogueo', N'Deslogueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (341, 2, N'Gonzalez', CAST(N'2020-10-15' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (342, 37, N'creado correctamente', CAST(N'2020-10-15' AS Date), N'Evento', N'Alta usuario', N'Alta usuario: gomez')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (343, 37, N'gomez', CAST(N'2020-10-15' AS Date), N'Error', N'Alta Usuario', N'
Subproceso anulado.
Archivo: 
Linea: 0
   en System.Threading.Thread.AbortInternal()
   en System.Threading.Thread.Abort(Object stateInfo)
   en System.Web.HttpResponse.AbortCurrentThread()
   en System.Web.HttpResponse.End()
   en System.Web.HttpResponse.Redirect(String url, Boolean endResponse, Boolean permanent)
   en System.Web.HttpResponse.Redirect(String url)
   en EcommerceHelper.Presentacion.Views.Public.Registrarme.BtnContinuar_Click(Object sender, EventArgs e) en C:\Users\natal\Desktop\TFI\EcommerceHelper\EcommerceHelper.Presentacion\Views\Public\Registrarme.aspx.cs:línea 159')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (344, 2, N'Gonzalez', CAST(N'2020-10-15' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (345, 2, N'Gonzalez', CAST(N'2020-10-15' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (346, 2, N'Gonzalez', CAST(N'2020-10-15' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (347, 2, N'Gonzalez', CAST(N'2020-10-15' AS Date), N'Evento', N'Modificar Familia', N'Familia Empleado modificada correctamente')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (348, 2, N'Gonzalez', CAST(N'2020-10-15' AS Date), N'Evento', N'Deslogueo', N'Deslogueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (349, 6, N'Baez', CAST(N'2020-10-15' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (350, 2, N'Gonzalez', CAST(N'2020-10-16' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (351, 2, N'Gonzalez', CAST(N'2020-10-16' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (352, 2, N'Gonzalez', CAST(N'2020-10-16' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (353, 2, N'Gonzalez', CAST(N'2020-10-16' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (354, 2, N'Gonzalez', CAST(N'2020-10-16' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (355, 2, N'Gonzalez', CAST(N'2020-10-16' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (356, 2, N'Gonzalez', CAST(N'2020-10-16' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (357, 2, N'Gonzalez', CAST(N'2020-10-16' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (358, 2, N'Gonzalez', CAST(N'2020-10-16' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (359, 2, N'Gonzalez', CAST(N'2020-10-16' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (360, 2, N'Gonzalez', CAST(N'2020-10-16' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (361, 2, N'Gonzalez', CAST(N'2020-10-16' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (362, 2, N'Gonzalez', CAST(N'2020-10-16' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (363, 2, N'Gonzalez', CAST(N'2020-10-16' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (364, 2, N'Gonzalez', CAST(N'2020-10-16' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (365, 2, N'Gonzalez', CAST(N'2020-10-16' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (366, 2, N'Gonzalez', CAST(N'2020-10-16' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (367, 2, N'Gonzalez', CAST(N'2020-10-16' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (368, 2, N'Gonzalez', CAST(N'2020-10-16' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (369, 2, N'Gonzalez', CAST(N'2020-10-16' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (370, 2, N'Gonzalez', CAST(N'2020-10-16' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (371, 2, N'Gonzalez', CAST(N'2020-10-16' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (372, 2, N'Gonzalez', CAST(N'2020-10-16' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (373, 2, N'Gonzalez', CAST(N'2020-10-16' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (374, 2, N'Gonzalez', CAST(N'2020-10-16' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (375, 2, N'Gonzalez', CAST(N'2020-10-16' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (376, 2, N'Gonzalez', CAST(N'2020-10-16' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (377, 2, N'Gonzalez', CAST(N'2020-10-16' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (378, 2, N'Gonzalez', CAST(N'2020-10-16' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (379, 2, N'Gonzalez', CAST(N'2020-10-16' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (380, 2, N'Gonzalez', CAST(N'2020-10-16' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (381, 2, N'Gonzalez', CAST(N'2020-10-16' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (382, 2, N'Gonzalez', CAST(N'2020-10-16' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (383, 2, N'Gonzalez', CAST(N'2020-10-16' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (384, 2, N'Gonzalez', CAST(N'2020-10-16' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (385, 2, N'Gonzalez', CAST(N'2020-10-16' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (386, 2, N'Gonzalez', CAST(N'2020-10-16' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (387, 2, N'Gonzalez', CAST(N'2020-10-16' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (388, 2, N'Gonzalez', CAST(N'2020-10-16' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (389, 2, N'Gonzalez', CAST(N'2020-10-16' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (390, 2, N'Gonzalez', CAST(N'2020-10-16' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (391, 2, N'Gonzalez', CAST(N'2020-10-16' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (392, 2, N'Gonzalez', CAST(N'2020-10-16' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (393, 2, N'Gonzalez', CAST(N'2020-10-16' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (394, 2, N'Gonzalez', CAST(N'2020-10-16' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (395, 2, N'Gonzalez', CAST(N'2020-10-16' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (396, 2, N'Gonzalez', CAST(N'2020-10-16' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (397, 2, N'Gonzalez', CAST(N'2020-10-16' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (398, 2, N'Gonzalez', CAST(N'2020-10-16' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (399, 2, N'Gonzalez', CAST(N'2020-10-16' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (400, 2, N'Gonzalez', CAST(N'2020-10-16' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (401, 2, N'Gonzalez', CAST(N'2020-10-16' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (402, 2, N'Gonzalez', CAST(N'2020-10-16' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (403, 2, N'Gonzalez', CAST(N'2020-10-16' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (404, 2, N'Gonzalez', CAST(N'2020-10-16' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (405, 2, N'Gonzalez', CAST(N'2020-10-16' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
GO
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (406, 2, N'Gonzalez', CAST(N'2020-10-16' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (407, 2, N'Gonzalez', CAST(N'2020-10-16' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (408, 2, N'Gonzalez', CAST(N'2020-10-16' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (409, 2, N'Gonzalez', CAST(N'2020-10-16' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (410, 2, N'Gonzalez', CAST(N'2020-10-16' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (411, 2, N'Gonzalez', CAST(N'2020-10-16' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (412, 2, N'Gonzalez', CAST(N'2020-10-16' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (413, 2, N'Gonzalez', CAST(N'2020-10-16' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (414, 2, N'Gonzalez', CAST(N'2020-10-16' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (415, 2, N'Gonzalez', CAST(N'2020-10-16' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (416, 2, N'Gonzalez', CAST(N'2020-10-16' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (417, 2, N'Gonzalez', CAST(N'2020-10-16' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (418, 2, N'Gonzalez', CAST(N'2020-10-16' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (419, 2, N'Gonzalez', CAST(N'2020-10-16' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (420, 2, N'Gonzalez', CAST(N'2020-10-16' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (421, 2, N'Gonzalez', CAST(N'2020-10-16' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (422, 2, N'Gonzalez', CAST(N'2020-10-16' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (423, 2, N'Gonzalez', CAST(N'2020-10-16' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (424, 2, N'Gonzalez', CAST(N'2020-10-16' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (425, 2, N'Gonzalez', CAST(N'2020-10-16' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (426, 37, N'gomez', CAST(N'2020-10-16' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (427, 37, N'gomez', CAST(N'2020-10-16' AS Date), N'Evento', N'Deslogueo', N'Deslogueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (428, 2, N'Gonzalez', CAST(N'2020-10-16' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (429, 2, N'Gonzalez', CAST(N'2020-10-16' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (430, 2, N'Gonzalez', CAST(N'2020-10-16' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (431, 2, N'Gonzalez', CAST(N'2020-10-16' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (432, 2, N'Gonzalez', CAST(N'2020-10-16' AS Date), N'Evento', N'Deslogueo', N'Deslogueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (433, 37, N'gomez', CAST(N'2020-10-16' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (434, 37, N'gomez', CAST(N'2020-10-16' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (435, 2, N'Gonzalez', CAST(N'2020-10-17' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (436, 2, N'Gonzalez', CAST(N'2020-10-17' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (437, 2, N'Gonzalez', CAST(N'2020-10-17' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (438, 2, N'Gonzalez', CAST(N'2020-10-17' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (439, 2, N'Gonzalez', CAST(N'2020-10-17' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (440, 2, N'Gonzalez', CAST(N'2020-10-17' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (441, 2, N'Gonzalez', CAST(N'2020-10-17' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (442, 2, N'Gonzalez', CAST(N'2020-10-17' AS Date), N'Evento', N'Backup', N'Backup realizado correctamente')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (443, 2, N'Gonzalez', CAST(N'2020-10-17' AS Date), N'Error', N'Backup', N'
No se pudo encontrar el archivo ''C:\Users\natal\Desktop\TFI\EcommerceHelper\EcommerceHelper.Presentacion\Content\Files\17-10LLUEVE.bak''.
Archivo: 
Linea: 0
   en System.IO.__Error.WinIOError(Int32 errorCode, String maybeFullPath)
   en System.IO.FileStream.Init(String path, FileMode mode, FileAccess access, Int32 rights, Boolean useRights, FileShare share, Int32 bufferSize, FileOptions options, SECURITY_ATTRIBUTES secAttrs, String msgPath, Boolean bFromProxy, Boolean useLongPath, Boolean checkHost)
   en System.IO.FileStream..ctor(String path, FileMode mode, FileAccess access, FileShare share)
   en System.Web.HttpResponse.TransmitFile(String filename, Int64 offset, Int64 length)
   en System.Web.HttpResponse.TransmitFile(String filename)
   en EcommerceHelper.Presentacion.Views.Private.BackUp.btnUpload_Click1(Object sender, EventArgs e) en C:\Users\natal\Desktop\TFI\EcommerceHelper\EcommerceHelper.Presentacion\Views\Private\BackUp.aspx.cs:línea 59')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (444, 2, N'Gonzalez', CAST(N'2020-10-17' AS Date), N'Evento', N'Backup', N'Backup realizado correctamente')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (445, 2, N'Gonzalez', CAST(N'2020-10-17' AS Date), N'Error', N'Backup', N'
No se pudo encontrar el archivo ''C:\Users\natal\Desktop\TFI\EcommerceHelper\EcommerceHelper.Presentacion\Content\Files\17-10LLUEVE.bak''.
Archivo: 
Linea: 0
   en System.IO.__Error.WinIOError(Int32 errorCode, String maybeFullPath)
   en System.IO.FileStream.Init(String path, FileMode mode, FileAccess access, Int32 rights, Boolean useRights, FileShare share, Int32 bufferSize, FileOptions options, SECURITY_ATTRIBUTES secAttrs, String msgPath, Boolean bFromProxy, Boolean useLongPath, Boolean checkHost)
   en System.IO.FileStream..ctor(String path, FileMode mode, FileAccess access, FileShare share)
   en System.Web.HttpResponse.TransmitFile(String filename, Int64 offset, Int64 length)
   en System.Web.HttpResponse.TransmitFile(String filename)
   en EcommerceHelper.Presentacion.Views.Private.BackUp.btnUpload_Click1(Object sender, EventArgs e) en C:\Users\natal\Desktop\TFI\EcommerceHelper\EcommerceHelper.Presentacion\Views\Private\BackUp.aspx.cs:línea 59')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (446, 38, N'creado correctamente', CAST(N'2020-10-17' AS Date), N'Evento', N'Alta usuario', N'Alta usuario: Unsueño')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (447, 38, N'Unsueño', CAST(N'2020-10-17' AS Date), N'Error', N'Alta Usuario', N'
Subproceso anulado.
Archivo: 
Linea: 0
   en System.String.IndexOf(Char value, Int32 startIndex, Int32 count)
   en System.Web.HttpResponse.Redirect(String url, Boolean endResponse, Boolean permanent)
   en System.Web.HttpResponse.Redirect(String url)
   en EcommerceHelper.Presentacion.Views.Public.Registrarme.BtnContinuar_Click(Object sender, EventArgs e)')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (448, 2, N'Gonzalez', CAST(N'2020-10-18' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (449, 2, N'Gonzalez', CAST(N'2020-10-18' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (450, 2, N'Gonzalez', CAST(N'2020-10-18' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (451, 2, N'Gonzalez', CAST(N'2020-10-18' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (452, 2, N'Gonzalez', CAST(N'2020-10-18' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (453, 2, N'Gonzalez', CAST(N'2020-10-18' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (454, 2, N'Gonzalez', CAST(N'2020-10-18' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (455, 39, N'creado correctamente', CAST(N'2020-10-18' AS Date), N'Evento', N'Alta usuario', N'Alta usuario: gomez')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (456, 39, N'gomez', CAST(N'2020-10-18' AS Date), N'Error', N'Alta Usuario', N'
Subproceso anulado.
Archivo: 
Linea: 0
   en System.Threading.Thread.AbortInternal()
   en System.Threading.Thread.Abort(Object stateInfo)
   en System.Web.HttpResponse.AbortCurrentThread()
   en System.Web.HttpResponse.End()
   en System.Web.HttpResponse.Redirect(String url, Boolean endResponse, Boolean permanent)
   en System.Web.HttpResponse.Redirect(String url)
   en EcommerceHelper.Presentacion.Views.Public.Registrarme.BtnContinuar_Click(Object sender, EventArgs e) en C:\Users\natal\Desktop\TFI\EcommerceHelper\EcommerceHelper.Presentacion\Views\Public\Registrarme.aspx.cs:línea 161')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (457, 2, N'Gonzalez', CAST(N'2020-10-18' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (458, 2, N'Gonzalez', CAST(N'2020-10-19' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (459, 2, N'Gonzalez', CAST(N'2020-10-19' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (460, 2, N'Gonzalez', CAST(N'2020-10-19' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (461, 2, N'Gonzalez', CAST(N'2020-10-19' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (462, 2, N'Gonzalez', CAST(N'2020-10-19' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (463, 2, N'Gonzalez', CAST(N'2020-10-19' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (464, 2, N'Gonzalez', CAST(N'2020-10-19' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (465, 2, N'Gonzalez', CAST(N'2020-10-19' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (466, 2, N'Gonzalez', CAST(N'2020-10-19' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (467, 2, N'Gonzalez', CAST(N'2020-10-19' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (468, 2, N'Gonzalez', CAST(N'2020-10-19' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (469, 2, N'Gonzalez', CAST(N'2020-10-19' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (470, 2, N'Gonzalez', CAST(N'2020-10-19' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (471, 2, N'Gonzalez', CAST(N'2020-10-19' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (472, 2, N'Gonzalez', CAST(N'2020-10-19' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (473, 2, N'Gonzalez', CAST(N'2020-10-19' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (474, 2, N'Gonzalez', CAST(N'2020-10-19' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (475, 2, N'Gonzalez', CAST(N'2020-10-19' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (476, 2, N'Gonzalez', CAST(N'2020-10-19' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (477, 2, N'Gonzalez', CAST(N'2020-10-19' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (478, 2, N'Gonzalez', CAST(N'2020-10-19' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (479, 2, N'Gonzalez', CAST(N'2020-10-19' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (480, 2, N'Gonzalez', CAST(N'2020-10-19' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (481, 2, N'Gonzalez', CAST(N'2020-10-19' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (482, 2, N'Gonzalez', CAST(N'2020-10-19' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (483, 2, N'Gonzalez', CAST(N'2020-10-19' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (484, 2, N'Gonzalez', CAST(N'2020-10-19' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (485, 2, N'Gonzalez', CAST(N'2020-10-19' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (486, 2, N'Gonzalez', CAST(N'2020-10-19' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (487, 2, N'Gonzalez', CAST(N'2020-10-19' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (488, 2, N'Gonzalez', CAST(N'2020-10-19' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (489, 2, N'Gonzalez', CAST(N'2020-10-19' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (490, 2, N'Gonzalez', CAST(N'2020-10-19' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (491, 2, N'Gonzalez', CAST(N'2020-10-19' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (492, 2, N'Gonzalez', CAST(N'2020-10-19' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (493, 2, N'Gonzalez', CAST(N'2020-10-19' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (494, 2, N'Gonzalez', CAST(N'2020-10-19' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (495, 2, N'Gonzalez', CAST(N'2020-10-19' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (496, 2, N'Gonzalez', CAST(N'2020-10-19' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (497, 2, N'Gonzalez', CAST(N'2020-10-19' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (498, 2, N'Gonzalez', CAST(N'2020-10-19' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (499, 2, N'Gonzalez', CAST(N'2020-10-19' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (500, 2, N'Gonzalez', CAST(N'2020-10-19' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (501, 2, N'Gonzalez', CAST(N'2020-10-19' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (502, 2, N'Gonzalez', CAST(N'2020-10-19' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (503, 2, N'Gonzalez', CAST(N'2020-10-19' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (504, 2, N'Gonzalez', CAST(N'2020-10-19' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (505, 2, N'Gonzalez', CAST(N'2020-10-19' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
GO
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (506, 2, N'Gonzalez', CAST(N'2020-10-19' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (507, 2, N'Gonzalez', CAST(N'2020-10-19' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (508, 2, N'Gonzalez', CAST(N'2020-10-19' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (509, 2, N'Gonzalez', CAST(N'2020-10-19' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (510, 2, N'Gonzalez', CAST(N'2020-10-19' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (511, 2, N'Gonzalez', CAST(N'2020-10-19' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (512, 2, N'Gonzalez', CAST(N'2020-10-19' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (513, 2, N'Gonzalez', CAST(N'2020-10-19' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (514, 2, N'Gonzalez', CAST(N'2020-10-19' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (515, 2, N'Gonzalez', CAST(N'2020-10-19' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (516, 2, N'Gonzalez', CAST(N'2020-10-19' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (517, 2, N'Gonzalez', CAST(N'2020-10-19' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (518, 2, N'Gonzalez', CAST(N'2020-10-20' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (519, 2, N'Gonzalez', CAST(N'2020-10-20' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (520, 2, N'Gonzalez', CAST(N'2020-10-20' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (521, 2, N'Gonzalez', CAST(N'2020-10-20' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (522, 2, N'Gonzalez', CAST(N'2020-10-20' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (523, 2, N'Gonzalez', CAST(N'2020-10-20' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (524, 2, N'Gonzalez', CAST(N'2020-10-20' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (525, 2, N'Gonzalez', CAST(N'2020-10-20' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (526, 2, N'Gonzalez', CAST(N'2020-10-20' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (527, 2, N'Gonzalez', CAST(N'2020-10-20' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (528, 2, N'Gonzalez', CAST(N'2020-10-20' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (529, 2, N'Gonzalez', CAST(N'2020-10-20' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (530, 2, N'Gonzalez', CAST(N'2020-10-20' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (531, 2, N'Gonzalez', CAST(N'2020-10-20' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (532, 2, N'Gonzalez', CAST(N'2020-10-20' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (533, 2, N'Gonzalez', CAST(N'2020-10-20' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (534, 2, N'Gonzalez', CAST(N'2020-10-20' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (535, 2, N'Gonzalez', CAST(N'2020-10-20' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (536, 2, N'Gonzalez', CAST(N'2020-10-20' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (537, 2, N'Gonzalez', CAST(N'2020-10-20' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (538, 2, N'Gonzalez', CAST(N'2020-10-20' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (539, 2, N'Gonzalez', CAST(N'2020-10-20' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (540, 2, N'Gonzalez', CAST(N'2020-10-20' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (541, 2, N'Gonzalez', CAST(N'2020-10-20' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (542, 2, N'Gonzalez', CAST(N'2020-10-20' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (543, 2, N'Gonzalez', CAST(N'2020-10-20' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (544, 2, N'Gonzalez', CAST(N'2020-10-20' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (545, 2, N'Gonzalez', CAST(N'2020-10-20' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (546, 2, N'Gonzalez', CAST(N'2020-10-20' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (547, 2, N'Gonzalez', CAST(N'2020-10-20' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (548, 2, N'Gonzalez', CAST(N'2020-10-20' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (549, 2, N'Gonzalez', CAST(N'2020-10-20' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (550, 2, N'Gonzalez', CAST(N'2020-10-20' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (551, 2, N'Gonzalez', CAST(N'2020-10-20' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (552, 2, N'Gonzalez', CAST(N'2020-10-20' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (553, 2, N'Gonzalez', CAST(N'2020-10-20' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (554, 2, N'Gonzalez', CAST(N'2020-10-20' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (555, 2, N'Gonzalez', CAST(N'2020-10-20' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (556, 2, N'Gonzalez', CAST(N'2020-10-20' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (557, 38, N'Unsueño', CAST(N'2020-10-20' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (558, 38, N'Unsueño', CAST(N'2020-10-20' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (559, 38, N'Unsueño', CAST(N'2020-10-20' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (560, 38, N'Unsueño', CAST(N'2020-10-20' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (561, 38, N'Unsueño', CAST(N'2020-10-21' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (562, 38, N'Unsueño', CAST(N'2020-10-21' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (563, 38, N'Unsueño', CAST(N'2020-10-21' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (564, 38, N'Unsueño', CAST(N'2020-10-21' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (565, 38, N'Unsueño', CAST(N'2020-10-21' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (566, 38, N'Unsueño', CAST(N'2020-10-21' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (567, 38, N'Unsueño', CAST(N'2020-10-21' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (568, 38, N'Unsueño', CAST(N'2020-10-21' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (569, 38, N'Unsueño', CAST(N'2020-10-21' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (570, 38, N'Unsueño', CAST(N'2020-10-21' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (571, 38, N'Unsueño', CAST(N'2020-10-21' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (572, 38, N'Unsueño', CAST(N'2020-10-21' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (573, 38, N'Unsueño', CAST(N'2020-10-21' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (574, 38, N'Unsueño', CAST(N'2020-10-21' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (575, 38, N'Unsueño', CAST(N'2020-10-21' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (576, 38, N'Unsueño', CAST(N'2020-10-21' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (577, 38, N'Unsueño', CAST(N'2020-10-21' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (578, 38, N'Unsueño', CAST(N'2020-10-21' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (579, 38, N'Unsueño', CAST(N'2020-10-21' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (580, 38, N'creada correctamente', CAST(N'2020-10-21' AS Date), N'Evento', N'Nueva Direccion', N'Ingreso nueva direccion: Unsueño')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (581, 38, N'Unsueño', CAST(N'2020-10-21' AS Date), N'Error', N'Nueva Direccion', N'
Subproceso anulado.
Archivo: 
Linea: 0
   en System.Threading.Thread.AbortInternal()
   en System.Threading.Thread.Abort(Object stateInfo)
   en System.Web.HttpResponse.AbortCurrentThread()
   en System.Web.HttpResponse.End()
   en System.Web.HttpResponse.Redirect(String url, Boolean endResponse, Boolean permanent)
   en System.Web.HttpResponse.Redirect(String url)
   en EcommerceHelper.Presentacion.Views.Public.Direccion.btnNuevaDireccion_Click(Object sender, EventArgs e) en C:\Users\natal\Desktop\TFI\EcommerceHelper\EcommerceHelper.Presentacion\Views\Public\Direccion.aspx.cs:línea 106')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (582, 38, N'Unsueño', CAST(N'2020-10-21' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (583, 2, N'Gonzalez', CAST(N'2020-10-21' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (584, 38, N'Unsueño', CAST(N'2020-10-21' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (585, 38, N'Unsueño', CAST(N'2020-10-21' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (586, 38, N'Unsueño', CAST(N'2020-10-21' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (587, 38, N'Unsueño', CAST(N'2020-10-21' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (588, 38, N'Unsueño', CAST(N'2020-10-22' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (589, 38, N'Unsueño', CAST(N'2020-10-22' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (590, 38, N'Unsueño', CAST(N'2020-10-22' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (591, 38, N'Unsueño', CAST(N'2020-10-22' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (592, 38, N'Unsueño', CAST(N'2020-10-22' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (593, 38, N'Unsueño', CAST(N'2020-10-22' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (594, 38, N'Unsueño', CAST(N'2020-10-22' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (595, 38, N'Unsueño', CAST(N'2020-10-22' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (596, 38, N'Unsueño', CAST(N'2020-10-22' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (597, 38, N'Unsueño', CAST(N'2020-10-22' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (598, 38, N'Unsueño', CAST(N'2020-10-22' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (599, 38, N'Unsueño', CAST(N'2020-10-22' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (600, 38, N'Unsueño', CAST(N'2020-10-22' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (601, 38, N'Unsueño', CAST(N'2020-10-22' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (602, 38, N'Unsueño', CAST(N'2020-10-22' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (603, 38, N'Unsueño', CAST(N'2020-10-22' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (604, 38, N'Unsueño', CAST(N'2020-10-22' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (605, 38, N'Unsueño', CAST(N'2020-10-22' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
GO
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (606, 38, N'Unsueño', CAST(N'2020-10-22' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (607, 38, N'Unsueño', CAST(N'2020-10-22' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (608, 38, N'Unsueño', CAST(N'2020-10-22' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (609, 38, N'Unsueño', CAST(N'2020-10-22' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (610, 38, N'Unsueño', CAST(N'2020-10-22' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (611, 38, N'Unsueño', CAST(N'2020-10-22' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (612, 38, N'Unsueño', CAST(N'2020-10-22' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (613, 38, N'Unsueño', CAST(N'2020-10-22' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (614, 38, N'Unsueño', CAST(N'2020-10-22' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (615, 38, N'Unsueño', CAST(N'2020-10-22' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (616, 38, N'Unsueño', CAST(N'2020-10-22' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (617, 38, N'Unsueño', CAST(N'2020-10-22' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (618, 38, N'Unsueño', CAST(N'2020-10-22' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (619, 38, N'Unsueño', CAST(N'2020-10-22' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (620, 38, N'Unsueño', CAST(N'2020-10-22' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (621, 38, N'Unsueño', CAST(N'2020-10-22' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (622, 38, N'Unsueño', CAST(N'2020-10-22' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (623, 38, N'Unsueño', CAST(N'2020-10-22' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (624, 38, N'Unsueño', CAST(N'2020-10-22' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (625, 38, N'Unsueño', CAST(N'2020-10-22' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (626, 38, N'Unsueño', CAST(N'2020-10-22' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (627, 38, N'Unsueño', CAST(N'2020-10-22' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (628, 38, N'Unsueño', CAST(N'2020-10-22' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (629, 38, N'Unsueño', CAST(N'2020-10-22' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (630, 38, N'Unsueño', CAST(N'2020-10-22' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (631, 38, N'Unsueño', CAST(N'2020-10-22' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (632, 38, N'Unsueño', CAST(N'2020-10-22' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (633, 38, N'Unsueño', CAST(N'2020-10-22' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (634, 38, N'Unsueño', CAST(N'2020-10-22' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (635, 38, N'Unsueño', CAST(N'2020-10-22' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (636, 38, N'Unsueño', CAST(N'2020-10-22' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (637, 38, N'Unsueño', CAST(N'2020-10-22' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (638, 38, N'Unsueño', CAST(N'2020-10-22' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (639, 38, N'Unsueño', CAST(N'2020-10-22' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (640, 38, N'Unsueño', CAST(N'2020-10-23' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (641, 38, N'Unsueño', CAST(N'2020-10-23' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (642, 38, N'Unsueño', CAST(N'2020-10-23' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (643, 38, N'Unsueño', CAST(N'2020-10-23' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (644, 38, N'Unsueño', CAST(N'2020-10-23' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (645, 38, N'Unsueño', CAST(N'2020-10-23' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (646, 38, N'Unsueño', CAST(N'2020-10-23' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (647, 38, N'Unsueño', CAST(N'2020-10-23' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (648, 38, N'Unsueño', CAST(N'2020-10-23' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (649, 38, N'Unsueño', CAST(N'2020-10-23' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (650, 38, N'Unsueño', CAST(N'2020-10-23' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (651, 38, N'Unsueño', CAST(N'2020-10-23' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (652, 38, N'Unsueño', CAST(N'2020-10-23' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (653, 38, N'Unsueño', CAST(N'2020-10-23' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (654, 38, N'Unsueño', CAST(N'2020-10-23' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (655, 38, N'Unsueño', CAST(N'2020-10-23' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (656, 38, N'Unsueño', CAST(N'2020-10-23' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (657, 38, N'Unsueño', CAST(N'2020-10-23' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (658, 38, N'Unsueño', CAST(N'2020-10-23' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (659, 38, N'Unsueño', CAST(N'2020-10-23' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (660, 38, N'Unsueño', CAST(N'2020-10-23' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (661, 38, N'Unsueño', CAST(N'2020-10-23' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (662, 38, N'Unsueño', CAST(N'2020-10-23' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (663, 38, N'Unsueño', CAST(N'2020-10-23' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (664, 38, N'Unsueño', CAST(N'2020-10-23' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (665, 38, N'Unsueño', CAST(N'2020-10-23' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (666, 38, N'Unsueño', CAST(N'2020-10-24' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (667, 38, N'Unsueño', CAST(N'2020-10-24' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (668, 38, N'Unsueño', CAST(N'2020-10-24' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (669, 38, N'Unsueño', CAST(N'2020-10-24' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (670, 38, N'Unsueño', CAST(N'2020-10-24' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (671, 38, N'Unsueño', CAST(N'2020-10-24' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (672, 38, N'Unsueño', CAST(N'2020-10-24' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (673, 38, N'Unsueño', CAST(N'2020-10-24' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (674, 38, N'Unsueño', CAST(N'2020-10-24' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (675, 38, N'Unsueño', CAST(N'2020-10-24' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (676, 38, N'Unsueño', CAST(N'2020-10-24' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (677, 38, N'Unsueño', CAST(N'2020-10-24' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (678, 38, N'Unsueño', CAST(N'2020-10-24' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (679, 38, N'Unsueño', CAST(N'2020-10-24' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (680, 38, N'Unsueño', CAST(N'2020-10-24' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (681, 38, N'Unsueño', CAST(N'2020-10-24' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (682, 38, N'Unsueño', CAST(N'2020-10-24' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (683, 38, N'Unsueño', CAST(N'2020-10-24' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (684, 38, N'Unsueño', CAST(N'2020-10-24' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (685, 38, N'Unsueño', CAST(N'2020-10-24' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (686, 38, N'Unsueño', CAST(N'2020-10-24' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (687, 38, N'Unsueño', CAST(N'2020-10-24' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (688, 38, N'Unsueño', CAST(N'2020-10-25' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (689, 38, N'Unsueño', CAST(N'2020-10-25' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (690, 38, N'Unsueño', CAST(N'2020-10-25' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (691, 38, N'Unsueño', CAST(N'2020-10-25' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (692, 38, N'Unsueño', CAST(N'2020-10-25' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (693, 38, N'Unsueño', CAST(N'2020-10-25' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (694, 38, N'Unsueño', CAST(N'2020-10-25' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (695, 38, N'Unsueño', CAST(N'2020-10-26' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (696, 38, N'Unsueño', CAST(N'2020-10-26' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (697, 38, N'Unsueño', CAST(N'2020-10-26' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (698, 38, N'Unsueño', CAST(N'2020-10-26' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (699, 38, N'Unsueño', CAST(N'2020-10-26' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (700, 38, N'Unsueño', CAST(N'2020-10-26' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (701, 38, N'Unsueño', CAST(N'2020-10-26' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (702, 38, N'Unsueño', CAST(N'2020-10-26' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (703, 38, N'Unsueño', CAST(N'2020-10-26' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (704, 38, N'Unsueño', CAST(N'2020-10-26' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (705, 38, N'Unsueño', CAST(N'2020-10-26' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
GO
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (706, 38, N'Unsueño', CAST(N'2020-10-26' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (707, 38, N'Unsueño', CAST(N'2020-10-26' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (708, 38, N'Unsueño', CAST(N'2020-10-26' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (709, 38, N'Unsueño', CAST(N'2020-10-26' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (710, 38, N'Unsueño', CAST(N'2020-10-26' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (711, 38, N'Unsueño', CAST(N'2020-10-26' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (712, 38, N'Unsueño', CAST(N'2020-10-26' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (713, 38, N'Unsueño', CAST(N'2020-10-26' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (714, 38, N'Unsueño', CAST(N'2020-10-26' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (715, 38, N'Unsueño', CAST(N'2020-10-26' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (716, 38, N'Unsueño', CAST(N'2020-10-26' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (717, 38, N'Unsueño', CAST(N'2020-10-26' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (718, 38, N'Unsueño', CAST(N'2020-10-26' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (719, 38, N'Unsueño', CAST(N'2020-10-26' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (720, 38, N'Unsueño', CAST(N'2020-10-26' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (721, 38, N'Unsueño', CAST(N'2020-10-26' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (722, 38, N'Unsueño', CAST(N'2020-10-26' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (723, 38, N'Unsueño', CAST(N'2020-10-26' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (724, 38, N'Unsueño', CAST(N'2020-10-26' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (725, 38, N'Unsueño', CAST(N'2020-10-26' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (726, 38, N'Unsueño', CAST(N'2020-10-26' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (727, 38, N'Unsueño', CAST(N'2020-10-26' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (728, 38, N'Unsueño', CAST(N'2020-10-26' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (729, 38, N'Unsueño', CAST(N'2020-10-26' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (730, 38, N'Unsueño', CAST(N'2020-10-26' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (731, 38, N'Unsueño', CAST(N'2020-10-26' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (732, 38, N'Unsueño', CAST(N'2020-10-26' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (733, 38, N'Unsueño', CAST(N'2020-10-26' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (734, 38, N'Unsueño', CAST(N'2020-10-27' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (735, 38, N'Unsueño', CAST(N'2020-10-27' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (736, 38, N'Unsueño', CAST(N'2020-10-27' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (737, 38, N'Unsueño', CAST(N'2020-10-27' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (738, 38, N'Unsueño', CAST(N'2020-10-27' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (739, 38, N'Unsueño', CAST(N'2020-10-27' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (740, 38, N'Unsueño', CAST(N'2020-10-27' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (741, 38, N'Unsueño', CAST(N'2020-10-27' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (742, 38, N'Unsueño', CAST(N'2020-10-27' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (743, 38, N'Unsueño', CAST(N'2020-10-27' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (744, 38, N'Unsueño', CAST(N'2020-10-27' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (745, 38, N'Unsueño', CAST(N'2020-10-27' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (746, 38, N'Unsueño', CAST(N'2020-10-27' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (747, 38, N'Unsueño', CAST(N'2020-10-27' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (748, 38, N'Unsueño', CAST(N'2020-10-27' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (749, 38, N'Unsueño', CAST(N'2020-10-27' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (750, 38, N'Unsueño', CAST(N'2020-10-27' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (751, 38, N'Unsueño', CAST(N'2020-10-27' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (752, 38, N'Unsueño', CAST(N'2020-10-27' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (753, 38, N'Unsueño', CAST(N'2020-10-27' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (754, 38, N'Unsueño', CAST(N'2020-10-27' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (755, 38, N'Unsueño', CAST(N'2020-10-27' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (756, 38, N'Unsueño', CAST(N'2020-10-27' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (757, 38, N'Unsueño', CAST(N'2020-10-27' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (758, 38, N'Unsueño', CAST(N'2020-10-27' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (759, 38, N'Unsueño', CAST(N'2020-10-27' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (760, 38, N'Unsueño', CAST(N'2020-10-27' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (761, 38, N'Unsueño', CAST(N'2020-10-27' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (762, 38, N'Unsueño', CAST(N'2020-10-27' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (763, 38, N'Unsueño', CAST(N'2020-10-27' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (764, 38, N'Unsueño', CAST(N'2020-10-28' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (765, 38, N'Unsueño', CAST(N'2020-10-28' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (766, 38, N'Unsueño', CAST(N'2020-10-28' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (767, 38, N'Unsueño', CAST(N'2020-10-28' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (768, 38, N'Unsueño', CAST(N'2020-10-28' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (769, 38, N'Unsueño', CAST(N'2020-10-28' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (770, 38, N'Unsueño', CAST(N'2020-10-28' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (771, 38, N'Unsueño', CAST(N'2020-10-28' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (772, 38, N'Unsueño', CAST(N'2020-10-28' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (773, 38, N'Unsueño', CAST(N'2020-10-28' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (774, 38, N'Unsueño', CAST(N'2020-10-28' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (775, 38, N'Unsueño', CAST(N'2020-10-28' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (776, 38, N'Unsueño', CAST(N'2020-10-28' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (777, 38, N'Unsueño', CAST(N'2020-10-28' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (778, 38, N'Unsueño', CAST(N'2020-10-28' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (779, 38, N'Unsueño', CAST(N'2020-10-28' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (780, 38, N'Unsueño', CAST(N'2020-10-28' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (781, 38, N'Unsueño', CAST(N'2020-10-29' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (782, 38, N'Unsueño', CAST(N'2020-10-29' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (783, 38, N'Unsueño', CAST(N'2020-10-29' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (784, 38, N'Unsueño', CAST(N'2020-10-29' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (785, 38, N'Unsueño', CAST(N'2020-10-29' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (786, 38, N'Unsueño', CAST(N'2020-10-29' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (787, 38, N'Unsueño', CAST(N'2020-10-29' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (788, 38, N'Unsueño', CAST(N'2020-10-29' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (789, 38, N'Unsueño', CAST(N'2020-10-29' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (790, 38, N'Unsueño', CAST(N'2020-10-29' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (791, 2, N'Gonzalez', CAST(N'2020-11-02' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (792, 2, N'Gonzalez', CAST(N'2020-11-02' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (793, 2, N'Gonzalez', CAST(N'2020-11-02' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (794, 2, N'Gonzalez', CAST(N'2020-11-02' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (795, 2, N'Gonzalez', CAST(N'2020-11-02' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (796, 2, N'Gonzalez', CAST(N'2020-11-02' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (797, 2, N'Gonzalez', CAST(N'2020-11-03' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (798, 2, N'Gonzalez', CAST(N'2020-11-03' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (799, 2, N'Gonzalez', CAST(N'2020-11-03' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (800, 2, N'Gonzalez', CAST(N'2020-11-04' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (801, 2, N'Gonzalez', CAST(N'2020-11-04' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (802, 2, N'Gonzalez', CAST(N'2020-11-04' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (803, 2, N'Gonzalez', CAST(N'2020-11-04' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (804, 2, N'Gonzalez', CAST(N'2020-11-04' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (805, 2, N'Gonzalez', CAST(N'2020-11-04' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
GO
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (806, 2, N'Gonzalez', CAST(N'2020-11-04' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (807, 2, N'Gonzalez', CAST(N'2020-11-05' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (808, 2, N'Gonzalez', CAST(N'2020-11-05' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (809, 2, N'Gonzalez', CAST(N'2020-11-05' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (810, 2, N'Gonzalez', CAST(N'2020-11-05' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (811, 2, N'Gonzalez', CAST(N'2020-11-05' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (812, 2, N'Gonzalez', CAST(N'2020-11-05' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (813, 38, N'Unsueño', CAST(N'2020-11-10' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (814, 38, N'Unsueño', CAST(N'2020-11-11' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (815, 38, N'Unsueño', CAST(N'2020-11-11' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (816, 2, N'Gonzalez', CAST(N'2020-11-11' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (817, 2, N'Gonzalez', CAST(N'2020-11-11' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (818, 2, N'Gonzalez', CAST(N'2020-11-11' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (819, 38, N'Unsueño', CAST(N'2020-11-11' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (820, 38, N'Unsueño', CAST(N'2020-11-11' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (821, 2, N'Gonzalez', CAST(N'2020-11-12' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (822, 2, N'Gonzalez', CAST(N'2020-11-12' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (823, 2, N'Gonzalez', CAST(N'2020-11-12' AS Date), N'Evento', N'Modificar Familia', N'Familia Publico modificada correctamente')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (824, 2, N'Gonzalez', CAST(N'2020-11-12' AS Date), N'Evento', N'Modificar Familia', N'Familia Empleado modificada correctamente')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (825, 2, N'Gonzalez', CAST(N'2020-11-12' AS Date), N'Evento', N'Modificar Familia', N'Familia Publico modificada correctamente')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (826, 2, N'Gonzalez', CAST(N'2020-11-12' AS Date), N'Evento', N'Modificar Familia', N'Familia Cliente modificada correctamente')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (827, 2, N'Gonzalez', CAST(N'2020-11-12' AS Date), N'Evento', N'Modificar Familia', N'Familia Publico modificada correctamente')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (828, 2, N'Gonzalez', CAST(N'2020-11-12' AS Date), N'Evento', N'Modificar Familia', N'Familia Cliente modificada correctamente')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (829, 2, N'Gonzalez', CAST(N'2020-11-12' AS Date), N'Evento', N'Modificar Familia', N'Familia Admin modificada correctamente')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (830, 38, N'Unsueño', CAST(N'2020-11-12' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (831, 2, N'Gonzalez', CAST(N'2020-11-12' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (832, 2, N'Gonzalez', CAST(N'2020-11-12' AS Date), N'Evento', N'Modificar Familia', N'Familia Cliente modificada correctamente')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (833, 2, N'Gonzalez', CAST(N'2020-11-12' AS Date), N'Evento', N'Modificar Familia', N'Familia Publico modificada correctamente')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (834, 2, N'Gonzalez', CAST(N'2020-11-12' AS Date), N'Evento', N'Logueo', N'Logueo Correcto')
INSERT [dbo].[Bitacora] ([IdBitacoraLog], [IdUsuario], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (835, 2, N'Gonzalez', CAST(N'2020-11-12' AS Date), N'Evento', N'Modificar Familia', N'Familia Empleado modificada correctamente')
SET IDENTITY_INSERT [dbo].[Bitacora] OFF
SET IDENTITY_INSERT [dbo].[Comprobante] ON 

INSERT [dbo].[Comprobante] ([IdComprobante], [IdTipoComprobante], [IdSucursal], [IdOrdenDeTrabajo], [Fecha]) VALUES (7, 1, 1, 28, CAST(N'2020-10-29' AS Date))
INSERT [dbo].[Comprobante] ([IdComprobante], [IdTipoComprobante], [IdSucursal], [IdOrdenDeTrabajo], [Fecha]) VALUES (8, 1, 1, 29, CAST(N'2020-10-29' AS Date))
INSERT [dbo].[Comprobante] ([IdComprobante], [IdTipoComprobante], [IdSucursal], [IdOrdenDeTrabajo], [Fecha]) VALUES (9, 1, 1, 30, CAST(N'2020-10-29' AS Date))
INSERT [dbo].[Comprobante] ([IdComprobante], [IdTipoComprobante], [IdSucursal], [IdOrdenDeTrabajo], [Fecha]) VALUES (10, 2, 1, 29, CAST(N'2020-11-05' AS Date))
INSERT [dbo].[Comprobante] ([IdComprobante], [IdTipoComprobante], [IdSucursal], [IdOrdenDeTrabajo], [Fecha]) VALUES (11, 3, 1, 29, CAST(N'2020-11-05' AS Date))
INSERT [dbo].[Comprobante] ([IdComprobante], [IdTipoComprobante], [IdSucursal], [IdOrdenDeTrabajo], [Fecha]) VALUES (12, 1, 1, 31, CAST(N'2020-11-10' AS Date))
INSERT [dbo].[Comprobante] ([IdComprobante], [IdTipoComprobante], [IdSucursal], [IdOrdenDeTrabajo], [Fecha]) VALUES (13, 1, 1, 32, CAST(N'2020-11-12' AS Date))
SET IDENTITY_INSERT [dbo].[Comprobante] OFF
SET IDENTITY_INSERT [dbo].[DetalleComprobante] ON 

INSERT [dbo].[DetalleComprobante] ([IdDetalleComprobante], [IdComprobante], [IdTipoComprobante], [IdSucursal], [IdServicio], [PrecioUnitario]) VALUES (1, 8, 1, 1, 3, CAST(500 AS Decimal(18, 0)))
INSERT [dbo].[DetalleComprobante] ([IdDetalleComprobante], [IdComprobante], [IdTipoComprobante], [IdSucursal], [IdServicio], [PrecioUnitario]) VALUES (2, 9, 1, 1, 7, CAST(1000 AS Decimal(18, 0)))
INSERT [dbo].[DetalleComprobante] ([IdDetalleComprobante], [IdComprobante], [IdTipoComprobante], [IdSucursal], [IdServicio], [PrecioUnitario]) VALUES (3, 9, 1, 1, 6, CAST(1500 AS Decimal(18, 0)))
INSERT [dbo].[DetalleComprobante] ([IdDetalleComprobante], [IdComprobante], [IdTipoComprobante], [IdSucursal], [IdServicio], [PrecioUnitario]) VALUES (4, 12, 1, 1, 3, CAST(500 AS Decimal(18, 0)))
INSERT [dbo].[DetalleComprobante] ([IdDetalleComprobante], [IdComprobante], [IdTipoComprobante], [IdSucursal], [IdServicio], [PrecioUnitario]) VALUES (5, 13, 1, 1, 4, CAST(500 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[DetalleComprobante] OFF
SET IDENTITY_INSERT [dbo].[Direccion] ON 

INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [IdProvincia], [IdLocalidad], [IdTipoDireccion]) VALUES (2, N'balbin', 535, N'0', N'0', 1, 4, 3)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [IdProvincia], [IdLocalidad], [IdTipoDireccion]) VALUES (5, N'los sauces', 88, N'2', N'0', 1, 4, 3)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [IdProvincia], [IdLocalidad], [IdTipoDireccion]) VALUES (6, N'monroe', 976, N'0', N'0', 1, 2, 2)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [IdProvincia], [IdLocalidad], [IdTipoDireccion]) VALUES (15, N'flores', 234, N'0', N'0', 1, 2, 3)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [IdProvincia], [IdLocalidad], [IdTipoDireccion]) VALUES (16, N'avellaneda', 876, N'0', N'0', 1, 4, 2)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [IdProvincia], [IdLocalidad], [IdTipoDireccion]) VALUES (17, N'olmo', 90, N'0', N'0', 1, 2, 3)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [IdProvincia], [IdLocalidad], [IdTipoDireccion]) VALUES (18, N'bruklon', 65, N'0', N'0', 1, 4, 3)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [IdProvincia], [IdLocalidad], [IdTipoDireccion]) VALUES (19, N'escueles', 34, N'0', N'0', 1, 4, 1)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [IdProvincia], [IdLocalidad], [IdTipoDireccion]) VALUES (20, N'escueles', 34, N'0', N'0', 1, 4, 1)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [IdProvincia], [IdLocalidad], [IdTipoDireccion]) VALUES (21, N'flores', 879, N'0', N'0', 1, 2, 2)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [IdProvincia], [IdLocalidad], [IdTipoDireccion]) VALUES (30, N'flores', 2009, N'0', N'0', 2, 6, 2)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [IdProvincia], [IdLocalidad], [IdTipoDireccion]) VALUES (31, N'los olmos', 987, N'0', N'0', 1, 4, 2)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [IdProvincia], [IdLocalidad], [IdTipoDireccion]) VALUES (32, N'avellaneda', 3467, N'1', N'11', 1, 2, 3)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [IdProvincia], [IdLocalidad], [IdTipoDireccion]) VALUES (33, N'francklin', 34, N'0', N'5', 1, 3, 2)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [IdProvincia], [IdLocalidad], [IdTipoDireccion]) VALUES (35, N'las margaritas', 7888, N'4', N'0', 1, 2, 3)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [IdProvincia], [IdLocalidad], [IdTipoDireccion]) VALUES (36, N'avellaneda', 1078, N'0', N'0', 1, 2, 2)
SET IDENTITY_INSERT [dbo].[Direccion] OFF
SET IDENTITY_INSERT [dbo].[DVV] ON 

INSERT [dbo].[DVV] ([IdDVV], [Tabla], [DVV]) VALUES (2, N'Usuario', N'658')
SET IDENTITY_INSERT [dbo].[DVV] OFF
SET IDENTITY_INSERT [dbo].[Estado] ON 

INSERT [dbo].[Estado] ([IdEstado], [Descripcion]) VALUES (1, N'Activo')
INSERT [dbo].[Estado] ([IdEstado], [Descripcion]) VALUES (2, N'Cancelado')
INSERT [dbo].[Estado] ([IdEstado], [Descripcion]) VALUES (3, N'Finalizado')
SET IDENTITY_INSERT [dbo].[Estado] OFF
SET IDENTITY_INSERT [dbo].[Familia] ON 

INSERT [dbo].[Familia] ([IdFamilia], [NombreFamilia]) VALUES (1, N'Publico')
INSERT [dbo].[Familia] ([IdFamilia], [NombreFamilia]) VALUES (2, N'Cliente')
INSERT [dbo].[Familia] ([IdFamilia], [NombreFamilia]) VALUES (3, N'Empleado')
INSERT [dbo].[Familia] ([IdFamilia], [NombreFamilia]) VALUES (4, N'Admin')
SET IDENTITY_INSERT [dbo].[Familia] OFF
INSERT [dbo].[FamiliaUsuario] ([IdFamilia], [IdUsuario], [Email], [FecBaja]) VALUES (4, 2, N'admin@helper.com.ar', NULL)
SET IDENTITY_INSERT [dbo].[FormaDePago] ON 

INSERT [dbo].[FormaDePago] ([IdFormaDePago], [Descripcion]) VALUES (1, N'Tarjeta')
INSERT [dbo].[FormaDePago] ([IdFormaDePago], [Descripcion]) VALUES (2, N'Transferencia')
SET IDENTITY_INSERT [dbo].[FormaDePago] OFF
SET IDENTITY_INSERT [dbo].[Idioma] ON 

INSERT [dbo].[Idioma] ([IdIdioma], [Descripcion]) VALUES (1, N'Español')
INSERT [dbo].[Idioma] ([IdIdioma], [Descripcion]) VALUES (2, N'Ingles')
SET IDENTITY_INSERT [dbo].[Idioma] OFF
SET IDENTITY_INSERT [dbo].[ItemOrdenDeTrabajo] ON 

INSERT [dbo].[ItemOrdenDeTrabajo] ([IdItemOrdenDeTrabajo], [IdOrdenDeTrabajo], [IdUsuario], [NombreUsuario], [IdServicio], [IdDireccion], [Precio], [Fecha], [Hora]) VALUES (9, 5, 2, N'Natalia', 1, NULL, CAST(2500 AS Decimal(18, 0)), NULL, NULL)
INSERT [dbo].[ItemOrdenDeTrabajo] ([IdItemOrdenDeTrabajo], [IdOrdenDeTrabajo], [IdUsuario], [NombreUsuario], [IdServicio], [IdDireccion], [Precio], [Fecha], [Hora]) VALUES (10, 5, 2, N'Natalia', 3, NULL, CAST(500 AS Decimal(18, 0)), NULL, NULL)
INSERT [dbo].[ItemOrdenDeTrabajo] ([IdItemOrdenDeTrabajo], [IdOrdenDeTrabajo], [IdUsuario], [NombreUsuario], [IdServicio], [IdDireccion], [Precio], [Fecha], [Hora]) VALUES (21, 5, 2, N'Natalia', 4, NULL, CAST(500 AS Decimal(18, 0)), NULL, NULL)
INSERT [dbo].[ItemOrdenDeTrabajo] ([IdItemOrdenDeTrabajo], [IdOrdenDeTrabajo], [IdUsuario], [NombreUsuario], [IdServicio], [IdDireccion], [Precio], [Fecha], [Hora]) VALUES (23, 7, 6, N'Carlos', 3, NULL, CAST(500 AS Decimal(18, 0)), NULL, NULL)
INSERT [dbo].[ItemOrdenDeTrabajo] ([IdItemOrdenDeTrabajo], [IdOrdenDeTrabajo], [IdUsuario], [NombreUsuario], [IdServicio], [IdDireccion], [Precio], [Fecha], [Hora]) VALUES (24, 7, 6, N'Carlos', 1, NULL, CAST(2500 AS Decimal(18, 0)), NULL, NULL)
INSERT [dbo].[ItemOrdenDeTrabajo] ([IdItemOrdenDeTrabajo], [IdOrdenDeTrabajo], [IdUsuario], [NombreUsuario], [IdServicio], [IdDireccion], [Precio], [Fecha], [Hora]) VALUES (25, 7, 6, N'Carlos', 7, NULL, CAST(1000 AS Decimal(18, 0)), NULL, NULL)
INSERT [dbo].[ItemOrdenDeTrabajo] ([IdItemOrdenDeTrabajo], [IdOrdenDeTrabajo], [IdUsuario], [NombreUsuario], [IdServicio], [IdDireccion], [Precio], [Fecha], [Hora]) VALUES (29, 9, 38, N'Esteban', 1, 36, CAST(2500 AS Decimal(18, 0)), CAST(N'2020-10-27' AS Date), CAST(N'08:00:00' AS Time))
INSERT [dbo].[ItemOrdenDeTrabajo] ([IdItemOrdenDeTrabajo], [IdOrdenDeTrabajo], [IdUsuario], [NombreUsuario], [IdServicio], [IdDireccion], [Precio], [Fecha], [Hora]) VALUES (30, 9, 38, N'Esteban', 7, 36, CAST(1000 AS Decimal(18, 0)), CAST(N'2020-10-27' AS Date), CAST(N'08:00:00' AS Time))
INSERT [dbo].[ItemOrdenDeTrabajo] ([IdItemOrdenDeTrabajo], [IdOrdenDeTrabajo], [IdUsuario], [NombreUsuario], [IdServicio], [IdDireccion], [Precio], [Fecha], [Hora]) VALUES (32, 9, 38, N'Esteban', 4, 36, CAST(500 AS Decimal(18, 0)), CAST(N'2020-10-27' AS Date), CAST(N'08:00:00' AS Time))
INSERT [dbo].[ItemOrdenDeTrabajo] ([IdItemOrdenDeTrabajo], [IdOrdenDeTrabajo], [IdUsuario], [NombreUsuario], [IdServicio], [IdDireccion], [Precio], [Fecha], [Hora]) VALUES (33, 10, 38, N'Esteban', 3, 36, CAST(500 AS Decimal(18, 0)), CAST(N'2020-11-02' AS Date), CAST(N'09:00:00' AS Time))
INSERT [dbo].[ItemOrdenDeTrabajo] ([IdItemOrdenDeTrabajo], [IdOrdenDeTrabajo], [IdUsuario], [NombreUsuario], [IdServicio], [IdDireccion], [Precio], [Fecha], [Hora]) VALUES (34, 11, 38, N'Esteban', 6, 36, CAST(1500 AS Decimal(18, 0)), CAST(N'2020-10-30' AS Date), CAST(N'08:30:00' AS Time))
INSERT [dbo].[ItemOrdenDeTrabajo] ([IdItemOrdenDeTrabajo], [IdOrdenDeTrabajo], [IdUsuario], [NombreUsuario], [IdServicio], [IdDireccion], [Precio], [Fecha], [Hora]) VALUES (35, 12, 38, N'Esteban', 7, 36, CAST(1000 AS Decimal(18, 0)), CAST(N'2020-11-09' AS Date), CAST(N'08:30:00' AS Time))
INSERT [dbo].[ItemOrdenDeTrabajo] ([IdItemOrdenDeTrabajo], [IdOrdenDeTrabajo], [IdUsuario], [NombreUsuario], [IdServicio], [IdDireccion], [Precio], [Fecha], [Hora]) VALUES (36, 13, 38, N'Esteban', 6, 36, CAST(1500 AS Decimal(18, 0)), CAST(N'2020-10-29' AS Date), CAST(N'09:30:00' AS Time))
INSERT [dbo].[ItemOrdenDeTrabajo] ([IdItemOrdenDeTrabajo], [IdOrdenDeTrabajo], [IdUsuario], [NombreUsuario], [IdServicio], [IdDireccion], [Precio], [Fecha], [Hora]) VALUES (37, 14, 38, N'Esteban', 1, 36, CAST(2500 AS Decimal(18, 0)), CAST(N'2020-11-06' AS Date), CAST(N'08:00:00' AS Time))
INSERT [dbo].[ItemOrdenDeTrabajo] ([IdItemOrdenDeTrabajo], [IdOrdenDeTrabajo], [IdUsuario], [NombreUsuario], [IdServicio], [IdDireccion], [Precio], [Fecha], [Hora]) VALUES (38, 15, 38, N'Esteban', 3, 36, CAST(500 AS Decimal(18, 0)), CAST(N'2020-10-29' AS Date), CAST(N'08:00:00' AS Time))
INSERT [dbo].[ItemOrdenDeTrabajo] ([IdItemOrdenDeTrabajo], [IdOrdenDeTrabajo], [IdUsuario], [NombreUsuario], [IdServicio], [IdDireccion], [Precio], [Fecha], [Hora]) VALUES (39, 16, 38, N'Esteban', 4, 36, CAST(500 AS Decimal(18, 0)), CAST(N'2020-10-30' AS Date), CAST(N'08:00:00' AS Time))
INSERT [dbo].[ItemOrdenDeTrabajo] ([IdItemOrdenDeTrabajo], [IdOrdenDeTrabajo], [IdUsuario], [NombreUsuario], [IdServicio], [IdDireccion], [Precio], [Fecha], [Hora]) VALUES (40, 17, 38, N'Esteban', 7, 36, CAST(1000 AS Decimal(18, 0)), CAST(N'2020-11-02' AS Date), CAST(N'08:30:00' AS Time))
INSERT [dbo].[ItemOrdenDeTrabajo] ([IdItemOrdenDeTrabajo], [IdOrdenDeTrabajo], [IdUsuario], [NombreUsuario], [IdServicio], [IdDireccion], [Precio], [Fecha], [Hora]) VALUES (41, 18, 38, N'Esteban', 4, 36, CAST(500 AS Decimal(18, 0)), CAST(N'2020-11-09' AS Date), CAST(N'10:00:00' AS Time))
INSERT [dbo].[ItemOrdenDeTrabajo] ([IdItemOrdenDeTrabajo], [IdOrdenDeTrabajo], [IdUsuario], [NombreUsuario], [IdServicio], [IdDireccion], [Precio], [Fecha], [Hora]) VALUES (42, 19, 38, N'Esteban', 7, 36, CAST(1000 AS Decimal(18, 0)), CAST(N'2020-11-09' AS Date), CAST(N'10:00:00' AS Time))
INSERT [dbo].[ItemOrdenDeTrabajo] ([IdItemOrdenDeTrabajo], [IdOrdenDeTrabajo], [IdUsuario], [NombreUsuario], [IdServicio], [IdDireccion], [Precio], [Fecha], [Hora]) VALUES (43, 20, 38, N'Esteban', 3, 36, CAST(500 AS Decimal(18, 0)), CAST(N'2020-10-30' AS Date), CAST(N'10:00:00' AS Time))
INSERT [dbo].[ItemOrdenDeTrabajo] ([IdItemOrdenDeTrabajo], [IdOrdenDeTrabajo], [IdUsuario], [NombreUsuario], [IdServicio], [IdDireccion], [Precio], [Fecha], [Hora]) VALUES (44, 21, 38, N'Esteban', 4, 36, CAST(500 AS Decimal(18, 0)), CAST(N'2020-11-11' AS Date), CAST(N'08:00:00' AS Time))
INSERT [dbo].[ItemOrdenDeTrabajo] ([IdItemOrdenDeTrabajo], [IdOrdenDeTrabajo], [IdUsuario], [NombreUsuario], [IdServicio], [IdDireccion], [Precio], [Fecha], [Hora]) VALUES (45, 22, 38, N'Esteban', 3, 36, CAST(500 AS Decimal(18, 0)), CAST(N'2020-11-03' AS Date), CAST(N'08:00:00' AS Time))
INSERT [dbo].[ItemOrdenDeTrabajo] ([IdItemOrdenDeTrabajo], [IdOrdenDeTrabajo], [IdUsuario], [NombreUsuario], [IdServicio], [IdDireccion], [Precio], [Fecha], [Hora]) VALUES (46, 23, 38, N'Esteban', 4, 36, CAST(500 AS Decimal(18, 0)), CAST(N'2020-11-13' AS Date), CAST(N'08:30:00' AS Time))
INSERT [dbo].[ItemOrdenDeTrabajo] ([IdItemOrdenDeTrabajo], [IdOrdenDeTrabajo], [IdUsuario], [NombreUsuario], [IdServicio], [IdDireccion], [Precio], [Fecha], [Hora]) VALUES (47, 24, 38, N'Esteban', 6, 36, CAST(1500 AS Decimal(18, 0)), CAST(N'2020-11-26' AS Date), CAST(N'09:30:00' AS Time))
INSERT [dbo].[ItemOrdenDeTrabajo] ([IdItemOrdenDeTrabajo], [IdOrdenDeTrabajo], [IdUsuario], [NombreUsuario], [IdServicio], [IdDireccion], [Precio], [Fecha], [Hora]) VALUES (48, 25, 38, N'Esteban', 4, 36, CAST(500 AS Decimal(18, 0)), CAST(N'2020-11-11' AS Date), CAST(N'09:30:00' AS Time))
INSERT [dbo].[ItemOrdenDeTrabajo] ([IdItemOrdenDeTrabajo], [IdOrdenDeTrabajo], [IdUsuario], [NombreUsuario], [IdServicio], [IdDireccion], [Precio], [Fecha], [Hora]) VALUES (49, 26, 38, N'Esteban', 7, 36, CAST(1000 AS Decimal(18, 0)), CAST(N'2020-11-26' AS Date), CAST(N'08:30:00' AS Time))
INSERT [dbo].[ItemOrdenDeTrabajo] ([IdItemOrdenDeTrabajo], [IdOrdenDeTrabajo], [IdUsuario], [NombreUsuario], [IdServicio], [IdDireccion], [Precio], [Fecha], [Hora]) VALUES (50, 27, 38, N'Esteban', 1, 36, CAST(2500 AS Decimal(18, 0)), CAST(N'2020-11-24' AS Date), CAST(N'08:00:00' AS Time))
INSERT [dbo].[ItemOrdenDeTrabajo] ([IdItemOrdenDeTrabajo], [IdOrdenDeTrabajo], [IdUsuario], [NombreUsuario], [IdServicio], [IdDireccion], [Precio], [Fecha], [Hora]) VALUES (51, 28, 38, N'Esteban', 3, 36, CAST(500 AS Decimal(18, 0)), CAST(N'2020-11-05' AS Date), CAST(N'08:30:00' AS Time))
INSERT [dbo].[ItemOrdenDeTrabajo] ([IdItemOrdenDeTrabajo], [IdOrdenDeTrabajo], [IdUsuario], [NombreUsuario], [IdServicio], [IdDireccion], [Precio], [Fecha], [Hora]) VALUES (52, 29, 38, N'Esteban', 3, 36, CAST(500 AS Decimal(18, 0)), CAST(N'2020-11-27' AS Date), CAST(N'08:00:00' AS Time))
INSERT [dbo].[ItemOrdenDeTrabajo] ([IdItemOrdenDeTrabajo], [IdOrdenDeTrabajo], [IdUsuario], [NombreUsuario], [IdServicio], [IdDireccion], [Precio], [Fecha], [Hora]) VALUES (53, 30, 38, N'Esteban', 7, 36, CAST(1000 AS Decimal(18, 0)), CAST(N'2020-12-25' AS Date), CAST(N'08:00:00' AS Time))
INSERT [dbo].[ItemOrdenDeTrabajo] ([IdItemOrdenDeTrabajo], [IdOrdenDeTrabajo], [IdUsuario], [NombreUsuario], [IdServicio], [IdDireccion], [Precio], [Fecha], [Hora]) VALUES (54, 30, 38, N'Esteban', 6, 36, CAST(1500 AS Decimal(18, 0)), CAST(N'2020-12-25' AS Date), CAST(N'08:00:00' AS Time))
INSERT [dbo].[ItemOrdenDeTrabajo] ([IdItemOrdenDeTrabajo], [IdOrdenDeTrabajo], [IdUsuario], [NombreUsuario], [IdServicio], [IdDireccion], [Precio], [Fecha], [Hora]) VALUES (55, 31, 38, N'Esteban', 3, 36, CAST(500 AS Decimal(18, 0)), CAST(N'2020-11-23' AS Date), CAST(N'08:00:00' AS Time))
INSERT [dbo].[ItemOrdenDeTrabajo] ([IdItemOrdenDeTrabajo], [IdOrdenDeTrabajo], [IdUsuario], [NombreUsuario], [IdServicio], [IdDireccion], [Precio], [Fecha], [Hora]) VALUES (56, 32, 38, N'Esteban', 4, 36, CAST(500 AS Decimal(18, 0)), CAST(N'2020-11-26' AS Date), CAST(N'08:00:00' AS Time))
SET IDENTITY_INSERT [dbo].[ItemOrdenDeTrabajo] OFF
SET IDENTITY_INSERT [dbo].[Localidad] ON 

INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [Descripcion]) VALUES (1, 1, N'General Rodriguez')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [Descripcion]) VALUES (2, 1, N'La Reja')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [Descripcion]) VALUES (3, 1, N'Francisco Alvarez')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [Descripcion]) VALUES (4, 1, N'Moreno')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [Descripcion]) VALUES (5, 2, N'Calamuchita')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [Descripcion]) VALUES (6, 2, N'Carlos Paz')
SET IDENTITY_INSERT [dbo].[Localidad] OFF
SET IDENTITY_INSERT [dbo].[MultiIdioma] ON 

INSERT [dbo].[MultiIdioma] ([IdMultiIdioma], [IdIdioma], [NombreDelControl], [Texto]) VALUES (2, 1, N'Aceptar', N'Aceptar')
INSERT [dbo].[MultiIdioma] ([IdMultiIdioma], [IdIdioma], [NombreDelControl], [Texto]) VALUES (3, 2, N'Aceptar', N'OK')
INSERT [dbo].[MultiIdioma] ([IdMultiIdioma], [IdIdioma], [NombreDelControl], [Texto]) VALUES (4, 1, N'AgregadoAlCarrito', N'Agregado Al Carrito')
INSERT [dbo].[MultiIdioma] ([IdMultiIdioma], [IdIdioma], [NombreDelControl], [Texto]) VALUES (5, 2, N'AgregadoAlCarrito', N'add to cart')
INSERT [dbo].[MultiIdioma] ([IdMultiIdioma], [IdIdioma], [NombreDelControl], [Texto]) VALUES (6, 1, N'Asignados', N'Asignados')
INSERT [dbo].[MultiIdioma] ([IdMultiIdioma], [IdIdioma], [NombreDelControl], [Texto]) VALUES (7, 2, N'Asignados', N'Assigned')
INSERT [dbo].[MultiIdioma] ([IdMultiIdioma], [IdIdioma], [NombreDelControl], [Texto]) VALUES (8, 1, N'Calle', N'Calle')
INSERT [dbo].[MultiIdioma] ([IdMultiIdioma], [IdIdioma], [NombreDelControl], [Texto]) VALUES (9, 2, N'Calle', N'Street')
INSERT [dbo].[MultiIdioma] ([IdMultiIdioma], [IdIdioma], [NombreDelControl], [Texto]) VALUES (10, 1, N'Cancelar', N'Cancelar')
INSERT [dbo].[MultiIdioma] ([IdMultiIdioma], [IdIdioma], [NombreDelControl], [Texto]) VALUES (11, 2, N'Cancelar', N'Cancel')
INSERT [dbo].[MultiIdioma] ([IdMultiIdioma], [IdIdioma], [NombreDelControl], [Texto]) VALUES (12, 1, N'CerrarSesion', N'Cerrar Sesión')
INSERT [dbo].[MultiIdioma] ([IdMultiIdioma], [IdIdioma], [NombreDelControl], [Texto]) VALUES (13, 2, N'CerrarSesion', N'Sign off')
INSERT [dbo].[MultiIdioma] ([IdMultiIdioma], [IdIdioma], [NombreDelControl], [Texto]) VALUES (14, 1, N'Comprar', N'Comprar')
INSERT [dbo].[MultiIdioma] ([IdMultiIdioma], [IdIdioma], [NombreDelControl], [Texto]) VALUES (15, 2, N'Comprar', N'Buy')
INSERT [dbo].[MultiIdioma] ([IdMultiIdioma], [IdIdioma], [NombreDelControl], [Texto]) VALUES (16, 1, N'Contactanos', N'Contactanos')
INSERT [dbo].[MultiIdioma] ([IdMultiIdioma], [IdIdioma], [NombreDelControl], [Texto]) VALUES (17, 2, N'Contactanos', N'Contact us')
INSERT [dbo].[MultiIdioma] ([IdMultiIdioma], [IdIdioma], [NombreDelControl], [Texto]) VALUES (20, 1, N'Contactanos1', N'Quieres conocer nuestros servicios  y todo lo que Helper te puede ofrecer?')
INSERT [dbo].[MultiIdioma] ([IdMultiIdioma], [IdIdioma], [NombreDelControl], [Texto]) VALUES (22, 2, N'Contactanos1', N'Do you want to know our services and everything that Helper can offer you?')
INSERT [dbo].[MultiIdioma] ([IdMultiIdioma], [IdIdioma], [NombreDelControl], [Texto]) VALUES (23, 1, N'Contactanos2', N'Limpieza Interior')
INSERT [dbo].[MultiIdioma] ([IdMultiIdioma], [IdIdioma], [NombreDelControl], [Texto]) VALUES (24, 2, N'Contactanos2', N'Interior Cleaning')
INSERT [dbo].[MultiIdioma] ([IdMultiIdioma], [IdIdioma], [NombreDelControl], [Texto]) VALUES (25, 1, N'Contactanos3', N'Limpieza Exterior')
INSERT [dbo].[MultiIdioma] ([IdMultiIdioma], [IdIdioma], [NombreDelControl], [Texto]) VALUES (26, 2, N'Contactanos3', N'
Exterior Cleaning')
INSERT [dbo].[MultiIdioma] ([IdMultiIdioma], [IdIdioma], [NombreDelControl], [Texto]) VALUES (27, 1, N'Contactanos4', N'Limpieza de Tapizados y Alfombras')
INSERT [dbo].[MultiIdioma] ([IdMultiIdioma], [IdIdioma], [NombreDelControl], [Texto]) VALUES (28, 2, N'Contactanos4', N'Upholstery and Carpet Cleaning')
INSERT [dbo].[MultiIdioma] ([IdMultiIdioma], [IdIdioma], [NombreDelControl], [Texto]) VALUES (29, 2, N'Contactanos5', N'Cleaning of Curtains, Windows and much more!')
INSERT [dbo].[MultiIdioma] ([IdMultiIdioma], [IdIdioma], [NombreDelControl], [Texto]) VALUES (30, 1, N'Contactanos5', N'Limpieza de Cortinas , Ventanales y mucho más!')
INSERT [dbo].[MultiIdioma] ([IdMultiIdioma], [IdIdioma], [NombreDelControl], [Texto]) VALUES (31, 2, N'Contactanos6', N'Create a plan to suit you')
INSERT [dbo].[MultiIdioma] ([IdMultiIdioma], [IdIdioma], [NombreDelControl], [Texto]) VALUES (32, 1, N'Contactanos6', N'Armá un plan a tu medida')
INSERT [dbo].[MultiIdioma] ([IdMultiIdioma], [IdIdioma], [NombreDelControl], [Texto]) VALUES (33, 2, N'Contacto', N'Contact')
INSERT [dbo].[MultiIdioma] ([IdMultiIdioma], [IdIdioma], [NombreDelControl], [Texto]) VALUES (34, 1, N'Contacto', N'Contacto')
INSERT [dbo].[MultiIdioma] ([IdMultiIdioma], [IdIdioma], [NombreDelControl], [Texto]) VALUES (35, 2, N'Contacto1', N'Contact Phone  0237- 4641111')
INSERT [dbo].[MultiIdioma] ([IdMultiIdioma], [IdIdioma], [NombreDelControl], [Texto]) VALUES (36, 1, N'Contacto1', N'Contacto 0237- 4641111')
INSERT [dbo].[MultiIdioma] ([IdMultiIdioma], [IdIdioma], [NombreDelControl], [Texto]) VALUES (37, 2, N'Contacto2', N'Adress Av. Evergreen 742 - Sprinfield')
INSERT [dbo].[MultiIdioma] ([IdMultiIdioma], [IdIdioma], [NombreDelControl], [Texto]) VALUES (38, 1, N'Contacto2', N'Dirección: Av. Siempreviva 742 - Sprinfield')
INSERT [dbo].[MultiIdioma] ([IdMultiIdioma], [IdIdioma], [NombreDelControl], [Texto]) VALUES (39, 2, N'Continuar', N'Next')
INSERT [dbo].[MultiIdioma] ([IdMultiIdioma], [IdIdioma], [NombreDelControl], [Texto]) VALUES (40, 1, N'Continuar', N'Continuar')
INSERT [dbo].[MultiIdioma] ([IdMultiIdioma], [IdIdioma], [NombreDelControl], [Texto]) VALUES (41, 2, N'DefaultCentroDos', N'We have personnel trained in multiple tasks, punctual, trustworthy and with extensive experience.')
INSERT [dbo].[MultiIdioma] ([IdMultiIdioma], [IdIdioma], [NombreDelControl], [Texto]) VALUES (42, 1, N'DefaultCentroDos', N'Contamos con peronal capacitado en múltiples tareas, puntuales, de confianza y con amplia experiencia.')
INSERT [dbo].[MultiIdioma] ([IdMultiIdioma], [IdIdioma], [NombreDelControl], [Texto]) VALUES (43, 2, N'DefaultCentroUno', N'We are a Domestic Service company that wants to help you simplify your life!')
INSERT [dbo].[MultiIdioma] ([IdMultiIdioma], [IdIdioma], [NombreDelControl], [Texto]) VALUES (44, 1, N'DefaultCentroUno', N'Somos una empresa de Servicio Doméstico que quiere ayudarte a simplificarte la vida!')
INSERT [dbo].[MultiIdioma] ([IdMultiIdioma], [IdIdioma], [NombreDelControl], [Texto]) VALUES (45, 2, N'Departamento', N'Department')
INSERT [dbo].[MultiIdioma] ([IdMultiIdioma], [IdIdioma], [NombreDelControl], [Texto]) VALUES (46, 1, N'Departamento', N'Departamento')
INSERT [dbo].[MultiIdioma] ([IdMultiIdioma], [IdIdioma], [NombreDelControl], [Texto]) VALUES (47, 2, N'Descripcion', N'Description')
INSERT [dbo].[MultiIdioma] ([IdMultiIdioma], [IdIdioma], [NombreDelControl], [Texto]) VALUES (48, 1, N'Descripcion', N'Descripción')
INSERT [dbo].[MultiIdioma] ([IdMultiIdioma], [IdIdioma], [NombreDelControl], [Texto]) VALUES (49, 2, N'Direccion', N'Address')
INSERT [dbo].[MultiIdioma] ([IdMultiIdioma], [IdIdioma], [NombreDelControl], [Texto]) VALUES (50, 1, N'Direccion', N'Dirección')
INSERT [dbo].[MultiIdioma] ([IdMultiIdioma], [IdIdioma], [NombreDelControl], [Texto]) VALUES (51, 2, N'Disponibles', N'Available')
INSERT [dbo].[MultiIdioma] ([IdMultiIdioma], [IdIdioma], [NombreDelControl], [Texto]) VALUES (52, 1, N'Disponibles', N'Disponibles')
INSERT [dbo].[MultiIdioma] ([IdMultiIdioma], [IdIdioma], [NombreDelControl], [Texto]) VALUES (53, 2, N'Eliminar', N'Delete')
INSERT [dbo].[MultiIdioma] ([IdMultiIdioma], [IdIdioma], [NombreDelControl], [Texto]) VALUES (54, 1, N'Eliminar', N'Eliminar')
INSERT [dbo].[MultiIdioma] ([IdMultiIdioma], [IdIdioma], [NombreDelControl], [Texto]) VALUES (55, 2, N'Espanol', N'Spanish')
INSERT [dbo].[MultiIdioma] ([IdMultiIdioma], [IdIdioma], [NombreDelControl], [Texto]) VALUES (56, 1, N'Espanol', N'Español')
INSERT [dbo].[MultiIdioma] ([IdMultiIdioma], [IdIdioma], [NombreDelControl], [Texto]) VALUES (57, 2, N'Fecha', N'Date')
INSERT [dbo].[MultiIdioma] ([IdMultiIdioma], [IdIdioma], [NombreDelControl], [Texto]) VALUES (58, 1, N'Fecha', N'Fecha')
INSERT [dbo].[MultiIdioma] ([IdMultiIdioma], [IdIdioma], [NombreDelControl], [Texto]) VALUES (59, 2, N'GestiondePermisos', N'Permission Management ')
INSERT [dbo].[MultiIdioma] ([IdMultiIdioma], [IdIdioma], [NombreDelControl], [Texto]) VALUES (60, 1, N'GestiondePermisos', N'Gestión de Permisos')
INSERT [dbo].[MultiIdioma] ([IdMultiIdioma], [IdIdioma], [NombreDelControl], [Texto]) VALUES (61, 2, N'Horario', N'Time')
INSERT [dbo].[MultiIdioma] ([IdMultiIdioma], [IdIdioma], [NombreDelControl], [Texto]) VALUES (62, 1, N'Horario', N'Horario')
INSERT [dbo].[MultiIdioma] ([IdMultiIdioma], [IdIdioma], [NombreDelControl], [Texto]) VALUES (63, 2, N'Imagen', N'Image')
INSERT [dbo].[MultiIdioma] ([IdMultiIdioma], [IdIdioma], [NombreDelControl], [Texto]) VALUES (64, 1, N'Imagen', N'Imagen')
INSERT [dbo].[MultiIdioma] ([IdMultiIdioma], [IdIdioma], [NombreDelControl], [Texto]) VALUES (65, 2, N'Ingles', N'English')
INSERT [dbo].[MultiIdioma] ([IdMultiIdioma], [IdIdioma], [NombreDelControl], [Texto]) VALUES (66, 1, N'Ingles', N'Inglés')
INSERT [dbo].[MultiIdioma] ([IdMultiIdioma], [IdIdioma], [NombreDelControl], [Texto]) VALUES (67, 2, N'IniciarSesion', N'Log in')
INSERT [dbo].[MultiIdioma] ([IdMultiIdioma], [IdIdioma], [NombreDelControl], [Texto]) VALUES (68, 1, N'IniciarSesion', N'Iniciar Sesión')
INSERT [dbo].[MultiIdioma] ([IdMultiIdioma], [IdIdioma], [NombreDelControl], [Texto]) VALUES (69, 2, N'Intranet', N'Intranet')
INSERT [dbo].[MultiIdioma] ([IdMultiIdioma], [IdIdioma], [NombreDelControl], [Texto]) VALUES (70, 1, N'Intranet', N'Intranet')
INSERT [dbo].[MultiIdioma] ([IdMultiIdioma], [IdIdioma], [NombreDelControl], [Texto]) VALUES (71, 2, N'IrAPedidos', N'Go To Orders')
INSERT [dbo].[MultiIdioma] ([IdMultiIdioma], [IdIdioma], [NombreDelControl], [Texto]) VALUES (72, 1, N'IrAPedidos', N'Ir A Pedidos')
INSERT [dbo].[MultiIdioma] ([IdMultiIdioma], [IdIdioma], [NombreDelControl], [Texto]) VALUES (73, 2, N'Localidad', N'Location')
INSERT [dbo].[MultiIdioma] ([IdMultiIdioma], [IdIdioma], [NombreDelControl], [Texto]) VALUES (74, 1, N'Localidad', N'Localidad')
INSERT [dbo].[MultiIdioma] ([IdMultiIdioma], [IdIdioma], [NombreDelControl], [Texto]) VALUES (75, 2, N'MisDatos', N'My Data')
INSERT [dbo].[MultiIdioma] ([IdMultiIdioma], [IdIdioma], [NombreDelControl], [Texto]) VALUES (76, 1, N'MisDatos', N'Mis Datos')
INSERT [dbo].[MultiIdioma] ([IdMultiIdioma], [IdIdioma], [NombreDelControl], [Texto]) VALUES (77, 2, N'NuestrosServicios', N'Our services')
INSERT [dbo].[MultiIdioma] ([IdMultiIdioma], [IdIdioma], [NombreDelControl], [Texto]) VALUES (79, 1, N'NuestrosServicios', N'Nuestros Servicios')
INSERT [dbo].[MultiIdioma] ([IdMultiIdioma], [IdIdioma], [NombreDelControl], [Texto]) VALUES (80, 2, N'Numero', N'Number')
INSERT [dbo].[MultiIdioma] ([IdMultiIdioma], [IdIdioma], [NombreDelControl], [Texto]) VALUES (81, 1, N'Numero', N'Número')
INSERT [dbo].[MultiIdioma] ([IdMultiIdioma], [IdIdioma], [NombreDelControl], [Texto]) VALUES (82, 2, N'Password', N'Password')
INSERT [dbo].[MultiIdioma] ([IdMultiIdioma], [IdIdioma], [NombreDelControl], [Texto]) VALUES (83, 1, N'Password', N'Contraseña')
INSERT [dbo].[MultiIdioma] ([IdMultiIdioma], [IdIdioma], [NombreDelControl], [Texto]) VALUES (84, 2, N'Pedido', N'Orders')
INSERT [dbo].[MultiIdioma] ([IdMultiIdioma], [IdIdioma], [NombreDelControl], [Texto]) VALUES (85, 1, N'Pedido', N'Pedido')
INSERT [dbo].[MultiIdioma] ([IdMultiIdioma], [IdIdioma], [NombreDelControl], [Texto]) VALUES (86, 2, N'Permisos', N'Permission')
INSERT [dbo].[MultiIdioma] ([IdMultiIdioma], [IdIdioma], [NombreDelControl], [Texto]) VALUES (87, 1, N'Permisos', N'Permisos')
INSERT [dbo].[MultiIdioma] ([IdMultiIdioma], [IdIdioma], [NombreDelControl], [Texto]) VALUES (88, 2, N'Piso', N'Floor')
INSERT [dbo].[MultiIdioma] ([IdMultiIdioma], [IdIdioma], [NombreDelControl], [Texto]) VALUES (89, 1, N'Piso', N'Piso')
INSERT [dbo].[MultiIdioma] ([IdMultiIdioma], [IdIdioma], [NombreDelControl], [Texto]) VALUES (90, 2, N'Precio', N'Price')
INSERT [dbo].[MultiIdioma] ([IdMultiIdioma], [IdIdioma], [NombreDelControl], [Texto]) VALUES (91, 1, N'Precio', N'Precio')
INSERT [dbo].[MultiIdioma] ([IdMultiIdioma], [IdIdioma], [NombreDelControl], [Texto]) VALUES (92, 2, N'Provincia', N'Province')
INSERT [dbo].[MultiIdioma] ([IdMultiIdioma], [IdIdioma], [NombreDelControl], [Texto]) VALUES (93, 1, N'Provincia', N'Provincia')
INSERT [dbo].[MultiIdioma] ([IdMultiIdioma], [IdIdioma], [NombreDelControl], [Texto]) VALUES (94, 2, N'RecuperarContraseña', N'Recover password')
INSERT [dbo].[MultiIdioma] ([IdMultiIdioma], [IdIdioma], [NombreDelControl], [Texto]) VALUES (95, 1, N'RecuperarContraseña', N'Recuperar Contraseña')
INSERT [dbo].[MultiIdioma] ([IdMultiIdioma], [IdIdioma], [NombreDelControl], [Texto]) VALUES (96, 2, N'Registrarme', N'Sign up')
INSERT [dbo].[MultiIdioma] ([IdMultiIdioma], [IdIdioma], [NombreDelControl], [Texto]) VALUES (97, 1, N'Registrarme', N'Registrarme')
INSERT [dbo].[MultiIdioma] ([IdMultiIdioma], [IdIdioma], [NombreDelControl], [Texto]) VALUES (98, 2, N'SeguirComprando', N'Keep buying')
INSERT [dbo].[MultiIdioma] ([IdMultiIdioma], [IdIdioma], [NombreDelControl], [Texto]) VALUES (99, 1, N'SeguirComprando', N'Seguir Comprando')
INSERT [dbo].[MultiIdioma] ([IdMultiIdioma], [IdIdioma], [NombreDelControl], [Texto]) VALUES (100, 2, N'Servicios', N'Services')
INSERT [dbo].[MultiIdioma] ([IdMultiIdioma], [IdIdioma], [NombreDelControl], [Texto]) VALUES (101, 1, N'Servicios', N'Servicios')
INSERT [dbo].[MultiIdioma] ([IdMultiIdioma], [IdIdioma], [NombreDelControl], [Texto]) VALUES (102, 2, N'Servicios1', N'We are a Domestic Service company that wants to help you simplify your life!')
INSERT [dbo].[MultiIdioma] ([IdMultiIdioma], [IdIdioma], [NombreDelControl], [Texto]) VALUES (103, 1, N'Servicios1', N'Somos una empresa de Servicio Doméstico que quiere ayudarte a simplificarte la vida!')
INSERT [dbo].[MultiIdioma] ([IdMultiIdioma], [IdIdioma], [NombreDelControl], [Texto]) VALUES (104, 2, N'Servicios2', N'We have personnel trained in multiple tasks, punctual, trustworthy and with extensive experience.')
GO
INSERT [dbo].[MultiIdioma] ([IdMultiIdioma], [IdIdioma], [NombreDelControl], [Texto]) VALUES (105, 1, N'Servicios2', N'Contamos con peronal capacitado en multiples tareas, puntuales, de confianza y con amplia experiencia.')
INSERT [dbo].[MultiIdioma] ([IdMultiIdioma], [IdIdioma], [NombreDelControl], [Texto]) VALUES (106, 2, N'Servicios3', N'At Helper we offer different domestic cleaning services. Including interior services such as bedrooms, kitchens, dining rooms, living room, playroom, etc. Exterior, barbecue areas, patios among others.')
INSERT [dbo].[MultiIdioma] ([IdMultiIdioma], [IdIdioma], [NombreDelControl], [Texto]) VALUES (107, 1, N'Servicios3', N'En Helper ofrecemos diferentes servicios de limpieza doméstica. Incluyendo servicios de interior como dormitorios, cocinas, comedores, living, playroom, etc. Exterior, quinchos, patios entre otros.')
INSERT [dbo].[MultiIdioma] ([IdMultiIdioma], [IdIdioma], [NombreDelControl], [Texto]) VALUES (108, 2, N'Titulo', N'Title')
INSERT [dbo].[MultiIdioma] ([IdMultiIdioma], [IdIdioma], [NombreDelControl], [Texto]) VALUES (109, 1, N'Titulo', N'Título')
INSERT [dbo].[MultiIdioma] ([IdMultiIdioma], [IdIdioma], [NombreDelControl], [Texto]) VALUES (110, 2, N'Usuario', N'User')
INSERT [dbo].[MultiIdioma] ([IdMultiIdioma], [IdIdioma], [NombreDelControl], [Texto]) VALUES (111, 1, N'Usuario', N'Usuario')
SET IDENTITY_INSERT [dbo].[MultiIdioma] OFF
SET IDENTITY_INSERT [dbo].[OrdenDeTrabajo] ON 

INSERT [dbo].[OrdenDeTrabajo] ([IdOrdenDeTrabajo], [IdUsuario], [Fecha], [IdEstado]) VALUES (5, 2, CAST(N'2020-08-05T18:51:14.957' AS DateTime), 1)
INSERT [dbo].[OrdenDeTrabajo] ([IdOrdenDeTrabajo], [IdUsuario], [Fecha], [IdEstado]) VALUES (7, 6, CAST(N'2020-10-15T20:43:46.713' AS DateTime), 1)
INSERT [dbo].[OrdenDeTrabajo] ([IdOrdenDeTrabajo], [IdUsuario], [Fecha], [IdEstado]) VALUES (8, 37, CAST(N'2020-10-16T22:38:24.867' AS DateTime), 1)
INSERT [dbo].[OrdenDeTrabajo] ([IdOrdenDeTrabajo], [IdUsuario], [Fecha], [IdEstado]) VALUES (9, 38, CAST(N'2020-10-28T16:04:24.357' AS DateTime), 3)
INSERT [dbo].[OrdenDeTrabajo] ([IdOrdenDeTrabajo], [IdUsuario], [Fecha], [IdEstado]) VALUES (10, 38, CAST(N'2020-10-28T16:22:38.047' AS DateTime), 3)
INSERT [dbo].[OrdenDeTrabajo] ([IdOrdenDeTrabajo], [IdUsuario], [Fecha], [IdEstado]) VALUES (11, 38, CAST(N'2020-10-28T16:57:45.430' AS DateTime), 3)
INSERT [dbo].[OrdenDeTrabajo] ([IdOrdenDeTrabajo], [IdUsuario], [Fecha], [IdEstado]) VALUES (12, 38, CAST(N'2020-10-28T17:09:04.543' AS DateTime), 3)
INSERT [dbo].[OrdenDeTrabajo] ([IdOrdenDeTrabajo], [IdUsuario], [Fecha], [IdEstado]) VALUES (13, 38, CAST(N'2020-10-28T17:30:38.490' AS DateTime), 3)
INSERT [dbo].[OrdenDeTrabajo] ([IdOrdenDeTrabajo], [IdUsuario], [Fecha], [IdEstado]) VALUES (14, 38, CAST(N'2020-10-28T17:59:23.803' AS DateTime), 3)
INSERT [dbo].[OrdenDeTrabajo] ([IdOrdenDeTrabajo], [IdUsuario], [Fecha], [IdEstado]) VALUES (15, 38, CAST(N'2020-10-28T18:04:08.060' AS DateTime), 3)
INSERT [dbo].[OrdenDeTrabajo] ([IdOrdenDeTrabajo], [IdUsuario], [Fecha], [IdEstado]) VALUES (16, 38, CAST(N'2020-10-28T18:18:52.690' AS DateTime), 3)
INSERT [dbo].[OrdenDeTrabajo] ([IdOrdenDeTrabajo], [IdUsuario], [Fecha], [IdEstado]) VALUES (17, 38, CAST(N'2020-10-28T18:50:57.050' AS DateTime), 3)
INSERT [dbo].[OrdenDeTrabajo] ([IdOrdenDeTrabajo], [IdUsuario], [Fecha], [IdEstado]) VALUES (18, 38, CAST(N'2020-10-28T19:07:50.023' AS DateTime), 3)
INSERT [dbo].[OrdenDeTrabajo] ([IdOrdenDeTrabajo], [IdUsuario], [Fecha], [IdEstado]) VALUES (19, 38, CAST(N'2020-10-28T20:08:08.883' AS DateTime), 3)
INSERT [dbo].[OrdenDeTrabajo] ([IdOrdenDeTrabajo], [IdUsuario], [Fecha], [IdEstado]) VALUES (20, 38, CAST(N'2020-10-28T22:48:23.403' AS DateTime), 3)
INSERT [dbo].[OrdenDeTrabajo] ([IdOrdenDeTrabajo], [IdUsuario], [Fecha], [IdEstado]) VALUES (21, 38, CAST(N'2020-10-28T23:08:21.263' AS DateTime), 3)
INSERT [dbo].[OrdenDeTrabajo] ([IdOrdenDeTrabajo], [IdUsuario], [Fecha], [IdEstado]) VALUES (22, 38, CAST(N'2020-10-29T12:11:59.323' AS DateTime), 3)
INSERT [dbo].[OrdenDeTrabajo] ([IdOrdenDeTrabajo], [IdUsuario], [Fecha], [IdEstado]) VALUES (23, 38, CAST(N'2020-10-29T12:26:52.370' AS DateTime), 3)
INSERT [dbo].[OrdenDeTrabajo] ([IdOrdenDeTrabajo], [IdUsuario], [Fecha], [IdEstado]) VALUES (24, 38, CAST(N'2020-10-29T12:37:30.773' AS DateTime), 3)
INSERT [dbo].[OrdenDeTrabajo] ([IdOrdenDeTrabajo], [IdUsuario], [Fecha], [IdEstado]) VALUES (25, 38, CAST(N'2020-10-29T12:40:48.470' AS DateTime), 3)
INSERT [dbo].[OrdenDeTrabajo] ([IdOrdenDeTrabajo], [IdUsuario], [Fecha], [IdEstado]) VALUES (26, 38, CAST(N'2020-10-29T13:01:11.470' AS DateTime), 3)
INSERT [dbo].[OrdenDeTrabajo] ([IdOrdenDeTrabajo], [IdUsuario], [Fecha], [IdEstado]) VALUES (27, 38, CAST(N'2020-10-29T14:33:33.410' AS DateTime), 3)
INSERT [dbo].[OrdenDeTrabajo] ([IdOrdenDeTrabajo], [IdUsuario], [Fecha], [IdEstado]) VALUES (28, 38, CAST(N'2020-10-29T14:50:18.550' AS DateTime), 3)
INSERT [dbo].[OrdenDeTrabajo] ([IdOrdenDeTrabajo], [IdUsuario], [Fecha], [IdEstado]) VALUES (29, 38, CAST(N'2020-10-29T14:55:27.497' AS DateTime), 3)
INSERT [dbo].[OrdenDeTrabajo] ([IdOrdenDeTrabajo], [IdUsuario], [Fecha], [IdEstado]) VALUES (30, 38, CAST(N'2020-10-29T18:27:57.677' AS DateTime), 3)
INSERT [dbo].[OrdenDeTrabajo] ([IdOrdenDeTrabajo], [IdUsuario], [Fecha], [IdEstado]) VALUES (31, 38, CAST(N'2020-11-10T09:38:23.683' AS DateTime), 3)
INSERT [dbo].[OrdenDeTrabajo] ([IdOrdenDeTrabajo], [IdUsuario], [Fecha], [IdEstado]) VALUES (32, 38, CAST(N'2020-11-12T07:19:42.723' AS DateTime), 3)
SET IDENTITY_INSERT [dbo].[OrdenDeTrabajo] OFF
SET IDENTITY_INSERT [dbo].[Patente] ON 

INSERT [dbo].[Patente] ([IdPatente], [NombrePatente], [FecBaja]) VALUES (1, N'NuestrosServicios', NULL)
INSERT [dbo].[Patente] ([IdPatente], [NombrePatente], [FecBaja]) VALUES (2, N'Registrate', NULL)
INSERT [dbo].[Patente] ([IdPatente], [NombrePatente], [FecBaja]) VALUES (3, N'GestionEmpleado', NULL)
INSERT [dbo].[Patente] ([IdPatente], [NombrePatente], [FecBaja]) VALUES (4, N'IniciarSesion', NULL)
INSERT [dbo].[Patente] ([IdPatente], [NombrePatente], [FecBaja]) VALUES (7, N'GestionServicios', NULL)
INSERT [dbo].[Patente] ([IdPatente], [NombrePatente], [FecBaja]) VALUES (8, N'AltaEmpleado', NULL)
INSERT [dbo].[Patente] ([IdPatente], [NombrePatente], [FecBaja]) VALUES (11, N'AsignacionDePerfiles', NULL)
INSERT [dbo].[Patente] ([IdPatente], [NombrePatente], [FecBaja]) VALUES (12, N'BackUp', NULL)
INSERT [dbo].[Patente] ([IdPatente], [NombrePatente], [FecBaja]) VALUES (13, N'Restaurar', NULL)
INSERT [dbo].[Patente] ([IdPatente], [NombrePatente], [FecBaja]) VALUES (14, N'Bitacora', NULL)
INSERT [dbo].[Patente] ([IdPatente], [NombrePatente], [FecBaja]) VALUES (15, N'RecuperarContrasenia', NULL)
INSERT [dbo].[Patente] ([IdPatente], [NombrePatente], [FecBaja]) VALUES (16, N'Presupuesto', NULL)
INSERT [dbo].[Patente] ([IdPatente], [NombrePatente], [FecBaja]) VALUES (17, N'MisDirecciones', NULL)
INSERT [dbo].[Patente] ([IdPatente], [NombrePatente], [FecBaja]) VALUES (18, N'Pedido', NULL)
INSERT [dbo].[Patente] ([IdPatente], [NombrePatente], [FecBaja]) VALUES (19, N'ABMTarjetasDeCredito', NULL)
INSERT [dbo].[Patente] ([IdPatente], [NombrePatente], [FecBaja]) VALUES (20, N'Default', NULL)
INSERT [dbo].[Patente] ([IdPatente], [NombrePatente], [FecBaja]) VALUES (21, N'Direccion', NULL)
INSERT [dbo].[Patente] ([IdPatente], [NombrePatente], [FecBaja]) VALUES (22, N'MenuPrincipal', NULL)
INSERT [dbo].[Patente] ([IdPatente], [NombrePatente], [FecBaja]) VALUES (23, N'MisDirecciones', NULL)
INSERT [dbo].[Patente] ([IdPatente], [NombrePatente], [FecBaja]) VALUES (24, N'Pago', NULL)
INSERT [dbo].[Patente] ([IdPatente], [NombrePatente], [FecBaja]) VALUES (25, N'ResumenCompra', NULL)
INSERT [dbo].[Patente] ([IdPatente], [NombrePatente], [FecBaja]) VALUES (26, N'Facturacion', NULL)
INSERT [dbo].[Patente] ([IdPatente], [NombrePatente], [FecBaja]) VALUES (27, N'NotaDeCredito', NULL)
INSERT [dbo].[Patente] ([IdPatente], [NombrePatente], [FecBaja]) VALUES (28, N'NotaDeDebito', NULL)
INSERT [dbo].[Patente] ([IdPatente], [NombrePatente], [FecBaja]) VALUES (29, N'DireccionEmpleado', NULL)
INSERT [dbo].[Patente] ([IdPatente], [NombrePatente], [FecBaja]) VALUES (30, N'MenuAdministracion', NULL)
SET IDENTITY_INSERT [dbo].[Patente] OFF
INSERT [dbo].[PatenteFamilia] ([IdPatente], [IdFamilia]) VALUES (1, 2)
INSERT [dbo].[PatenteFamilia] ([IdPatente], [IdFamilia]) VALUES (15, 1)
INSERT [dbo].[PatenteFamilia] ([IdPatente], [IdFamilia]) VALUES (1, 4)
INSERT [dbo].[PatenteFamilia] ([IdPatente], [IdFamilia]) VALUES (8, 3)
INSERT [dbo].[PatenteFamilia] ([IdPatente], [IdFamilia]) VALUES (2, 4)
INSERT [dbo].[PatenteFamilia] ([IdPatente], [IdFamilia]) VALUES (2, 1)
INSERT [dbo].[PatenteFamilia] ([IdPatente], [IdFamilia]) VALUES (3, 4)
INSERT [dbo].[PatenteFamilia] ([IdPatente], [IdFamilia]) VALUES (4, 4)
INSERT [dbo].[PatenteFamilia] ([IdPatente], [IdFamilia]) VALUES (29, 3)
INSERT [dbo].[PatenteFamilia] ([IdPatente], [IdFamilia]) VALUES (26, 3)
INSERT [dbo].[PatenteFamilia] ([IdPatente], [IdFamilia]) VALUES (4, 3)
INSERT [dbo].[PatenteFamilia] ([IdPatente], [IdFamilia]) VALUES (30, 3)
INSERT [dbo].[PatenteFamilia] ([IdPatente], [IdFamilia]) VALUES (7, 3)
INSERT [dbo].[PatenteFamilia] ([IdPatente], [IdFamilia]) VALUES (7, 4)
INSERT [dbo].[PatenteFamilia] ([IdPatente], [IdFamilia]) VALUES (4, 1)
INSERT [dbo].[PatenteFamilia] ([IdPatente], [IdFamilia]) VALUES (12, 4)
INSERT [dbo].[PatenteFamilia] ([IdPatente], [IdFamilia]) VALUES (13, 4)
INSERT [dbo].[PatenteFamilia] ([IdPatente], [IdFamilia]) VALUES (4, 2)
INSERT [dbo].[PatenteFamilia] ([IdPatente], [IdFamilia]) VALUES (16, 1)
INSERT [dbo].[PatenteFamilia] ([IdPatente], [IdFamilia]) VALUES (15, 2)
INSERT [dbo].[PatenteFamilia] ([IdPatente], [IdFamilia]) VALUES (16, 2)
INSERT [dbo].[PatenteFamilia] ([IdPatente], [IdFamilia]) VALUES (17, 2)
INSERT [dbo].[PatenteFamilia] ([IdPatente], [IdFamilia]) VALUES (18, 2)
INSERT [dbo].[PatenteFamilia] ([IdPatente], [IdFamilia]) VALUES (8, 4)
INSERT [dbo].[PatenteFamilia] ([IdPatente], [IdFamilia]) VALUES (27, 3)
INSERT [dbo].[PatenteFamilia] ([IdPatente], [IdFamilia]) VALUES (28, 3)
INSERT [dbo].[PatenteFamilia] ([IdPatente], [IdFamilia]) VALUES (11, 4)
INSERT [dbo].[PatenteFamilia] ([IdPatente], [IdFamilia]) VALUES (14, 4)
INSERT [dbo].[PatenteFamilia] ([IdPatente], [IdFamilia]) VALUES (15, 4)
INSERT [dbo].[PatenteFamilia] ([IdPatente], [IdFamilia]) VALUES (16, 4)
INSERT [dbo].[PatenteFamilia] ([IdPatente], [IdFamilia]) VALUES (17, 4)
INSERT [dbo].[PatenteFamilia] ([IdPatente], [IdFamilia]) VALUES (18, 4)
INSERT [dbo].[PatenteFamilia] ([IdPatente], [IdFamilia]) VALUES (19, 2)
INSERT [dbo].[PatenteFamilia] ([IdPatente], [IdFamilia]) VALUES (20, 2)
INSERT [dbo].[PatenteFamilia] ([IdPatente], [IdFamilia]) VALUES (21, 2)
INSERT [dbo].[PatenteFamilia] ([IdPatente], [IdFamilia]) VALUES (22, 2)
INSERT [dbo].[PatenteFamilia] ([IdPatente], [IdFamilia]) VALUES (24, 2)
INSERT [dbo].[PatenteFamilia] ([IdPatente], [IdFamilia]) VALUES (25, 2)
INSERT [dbo].[PatenteFamilia] ([IdPatente], [IdFamilia]) VALUES (2, 2)
INSERT [dbo].[PatenteFamilia] ([IdPatente], [IdFamilia]) VALUES (1, 1)
INSERT [dbo].[PatenteFamilia] ([IdPatente], [IdFamilia]) VALUES (20, 1)
INSERT [dbo].[PatenteFamilia] ([IdPatente], [IdFamilia]) VALUES (3, 3)
INSERT [dbo].[PatenteFamilia] ([IdPatente], [IdFamilia]) VALUES (4, 3)
INSERT [dbo].[Provincia] ([IdProvincia], [Descripcion]) VALUES (1, N'Buenos Aires')
INSERT [dbo].[Provincia] ([IdProvincia], [Descripcion]) VALUES (2, N'Cordoba')
SET IDENTITY_INSERT [dbo].[Recibo] ON 

INSERT [dbo].[Recibo] ([IdRecibo], [IdOrdenDeTrabajo], [Fecha], [IdFormaDePago], [Importe]) VALUES (2, 9, CAST(N'2020-10-28' AS Date), 2, 4000)
INSERT [dbo].[Recibo] ([IdRecibo], [IdOrdenDeTrabajo], [Fecha], [IdFormaDePago], [Importe]) VALUES (3, 10, CAST(N'2020-10-28' AS Date), 2, 500)
INSERT [dbo].[Recibo] ([IdRecibo], [IdOrdenDeTrabajo], [Fecha], [IdFormaDePago], [Importe]) VALUES (4, 11, CAST(N'2020-10-28' AS Date), 2, 1500)
INSERT [dbo].[Recibo] ([IdRecibo], [IdOrdenDeTrabajo], [Fecha], [IdFormaDePago], [Importe]) VALUES (5, 12, CAST(N'2020-10-28' AS Date), 2, 1000)
INSERT [dbo].[Recibo] ([IdRecibo], [IdOrdenDeTrabajo], [Fecha], [IdFormaDePago], [Importe]) VALUES (6, 13, CAST(N'2020-10-28' AS Date), 2, 1500)
INSERT [dbo].[Recibo] ([IdRecibo], [IdOrdenDeTrabajo], [Fecha], [IdFormaDePago], [Importe]) VALUES (7, 14, CAST(N'2020-10-28' AS Date), 2, 2500)
INSERT [dbo].[Recibo] ([IdRecibo], [IdOrdenDeTrabajo], [Fecha], [IdFormaDePago], [Importe]) VALUES (8, 15, CAST(N'2020-10-28' AS Date), 2, 500)
INSERT [dbo].[Recibo] ([IdRecibo], [IdOrdenDeTrabajo], [Fecha], [IdFormaDePago], [Importe]) VALUES (9, 16, CAST(N'2020-10-28' AS Date), 2, 500)
INSERT [dbo].[Recibo] ([IdRecibo], [IdOrdenDeTrabajo], [Fecha], [IdFormaDePago], [Importe]) VALUES (10, 17, CAST(N'2020-10-28' AS Date), 2, 1000)
INSERT [dbo].[Recibo] ([IdRecibo], [IdOrdenDeTrabajo], [Fecha], [IdFormaDePago], [Importe]) VALUES (11, 18, CAST(N'2020-10-28' AS Date), 2, 500)
INSERT [dbo].[Recibo] ([IdRecibo], [IdOrdenDeTrabajo], [Fecha], [IdFormaDePago], [Importe]) VALUES (12, 19, CAST(N'2020-10-28' AS Date), 2, 1000)
INSERT [dbo].[Recibo] ([IdRecibo], [IdOrdenDeTrabajo], [Fecha], [IdFormaDePago], [Importe]) VALUES (13, 20, CAST(N'2020-10-28' AS Date), 2, 500)
INSERT [dbo].[Recibo] ([IdRecibo], [IdOrdenDeTrabajo], [Fecha], [IdFormaDePago], [Importe]) VALUES (14, 21, CAST(N'2020-10-28' AS Date), 2, 500)
INSERT [dbo].[Recibo] ([IdRecibo], [IdOrdenDeTrabajo], [Fecha], [IdFormaDePago], [Importe]) VALUES (15, 22, CAST(N'2020-10-29' AS Date), 2, 500)
INSERT [dbo].[Recibo] ([IdRecibo], [IdOrdenDeTrabajo], [Fecha], [IdFormaDePago], [Importe]) VALUES (16, 23, CAST(N'2020-10-29' AS Date), 2, 500)
INSERT [dbo].[Recibo] ([IdRecibo], [IdOrdenDeTrabajo], [Fecha], [IdFormaDePago], [Importe]) VALUES (17, 24, CAST(N'2020-10-29' AS Date), 2, 1500)
INSERT [dbo].[Recibo] ([IdRecibo], [IdOrdenDeTrabajo], [Fecha], [IdFormaDePago], [Importe]) VALUES (18, 25, CAST(N'2020-10-29' AS Date), 2, 500)
INSERT [dbo].[Recibo] ([IdRecibo], [IdOrdenDeTrabajo], [Fecha], [IdFormaDePago], [Importe]) VALUES (19, 26, CAST(N'2020-10-29' AS Date), 2, 1000)
INSERT [dbo].[Recibo] ([IdRecibo], [IdOrdenDeTrabajo], [Fecha], [IdFormaDePago], [Importe]) VALUES (20, 27, CAST(N'2020-10-29' AS Date), 2, 2500)
INSERT [dbo].[Recibo] ([IdRecibo], [IdOrdenDeTrabajo], [Fecha], [IdFormaDePago], [Importe]) VALUES (21, 28, CAST(N'2020-10-29' AS Date), 2, 500)
INSERT [dbo].[Recibo] ([IdRecibo], [IdOrdenDeTrabajo], [Fecha], [IdFormaDePago], [Importe]) VALUES (22, 29, CAST(N'2020-10-29' AS Date), 2, 500)
INSERT [dbo].[Recibo] ([IdRecibo], [IdOrdenDeTrabajo], [Fecha], [IdFormaDePago], [Importe]) VALUES (23, 30, CAST(N'2020-10-29' AS Date), 2, 2500)
INSERT [dbo].[Recibo] ([IdRecibo], [IdOrdenDeTrabajo], [Fecha], [IdFormaDePago], [Importe]) VALUES (24, 31, CAST(N'2020-11-10' AS Date), 2, 500)
INSERT [dbo].[Recibo] ([IdRecibo], [IdOrdenDeTrabajo], [Fecha], [IdFormaDePago], [Importe]) VALUES (25, 32, CAST(N'2020-11-12' AS Date), 2, 500)
SET IDENTITY_INSERT [dbo].[Recibo] OFF
SET IDENTITY_INSERT [dbo].[Servicio] ON 

INSERT [dbo].[Servicio] ([IdServicio], [Titulo], [Descripcion], [Precio], [URLimagen]) VALUES (1, N'Full Pack', N'Limpieza completa interior y exterior. Limpieza de Cortinas y tapizados.  8 horas.', CAST(2500 AS Decimal(18, 0)), N'/Content/Image/sravintage.jpg')
INSERT [dbo].[Servicio] ([IdServicio], [Titulo], [Descripcion], [Precio], [URLimagen]) VALUES (3, N'Limpieza de Tapizados', N'Limpieza de sillas y sillones en Cuero , cuerinas, panas y telas. ', CAST(500 AS Decimal(18, 0)), N'/Content/Image/sillon.png')
INSERT [dbo].[Servicio] ([IdServicio], [Titulo], [Descripcion], [Precio], [URLimagen]) VALUES (4, N'Limpieza de Cortinas', N'Cortinas Black-out . Cortinas de Tela Tupida. Estilos Señoriales y Bando. Enrollables y mucho mas! ', CAST(500 AS Decimal(18, 0)), N'/Content/Image/Limpiezadecortinas.jpg')
INSERT [dbo].[Servicio] ([IdServicio], [Titulo], [Descripcion], [Precio], [URLimagen]) VALUES (6, N'Limpieza Interior', N'Limpieza dormitorios. Limpieza baños, living, cocinas, playroom y mas. Consulta planes a tu medida!  6 horas', CAST(1500 AS Decimal(18, 0)), N'/Content/Image/domestica2.png')
INSERT [dbo].[Servicio] ([IdServicio], [Titulo], [Descripcion], [Precio], [URLimagen]) VALUES (7, N'Limpieza Exterior', N'Quinchos, Jardines de invierno. Explanadas y veredas. Galerias, Glorietas. Galerias y mas!! 4 horas', CAST(1000 AS Decimal(18, 0)), N'/Content/Image/pisoexteior.jpg')
SET IDENTITY_INSERT [dbo].[Servicio] OFF
INSERT [dbo].[Sexo] ([IdSexo], [Descripcion]) VALUES (1, N'Femenino')
INSERT [dbo].[Sexo] ([IdSexo], [Descripcion]) VALUES (2, N'Masculino')
INSERT [dbo].[Sexo] ([IdSexo], [Descripcion]) VALUES (3, N'NN')
SET IDENTITY_INSERT [dbo].[Sucursal] ON 

INSERT [dbo].[Sucursal] ([IdSucursal], [Descripcion]) VALUES (1, N'General Rodriguez')
SET IDENTITY_INSERT [dbo].[Sucursal] OFF
SET IDENTITY_INSERT [dbo].[Tarjeta] ON 

INSERT [dbo].[Tarjeta] ([IdTarjeta], [IdUsuario], [IdTipoTarjeta], [NombreTitular], [NumeroTarjeta], [FechaVencimiento], [CodigoSeguridad]) VALUES (1, 38, 2, N'Esteban Ensueño Pesadilla', 4398189693448976, CAST(N'2020-11-30' AS Date), 111)
SET IDENTITY_INSERT [dbo].[Tarjeta] OFF
SET IDENTITY_INSERT [dbo].[TipoComprobante] ON 

INSERT [dbo].[TipoComprobante] ([IdTipoComprobante], [Descripcion]) VALUES (1, N'Factura B')
INSERT [dbo].[TipoComprobante] ([IdTipoComprobante], [Descripcion]) VALUES (2, N'Nota de Credito')
INSERT [dbo].[TipoComprobante] ([IdTipoComprobante], [Descripcion]) VALUES (3, N'Nota de Debito')
SET IDENTITY_INSERT [dbo].[TipoComprobante] OFF
SET IDENTITY_INSERT [dbo].[TipoDeDocumento] ON 

INSERT [dbo].[TipoDeDocumento] ([IdTipoDeDocumento], [Descripcion]) VALUES (1, N'DNI')
INSERT [dbo].[TipoDeDocumento] ([IdTipoDeDocumento], [Descripcion]) VALUES (2, N'Pasaporte')
SET IDENTITY_INSERT [dbo].[TipoDeDocumento] OFF
SET IDENTITY_INSERT [dbo].[TipoDireccion] ON 

INSERT [dbo].[TipoDireccion] ([IdTipoDireccion], [Descripcion]) VALUES (1, N'Casa')
INSERT [dbo].[TipoDireccion] ([IdTipoDireccion], [Descripcion]) VALUES (2, N'Quinta')
INSERT [dbo].[TipoDireccion] ([IdTipoDireccion], [Descripcion]) VALUES (3, N'Departamento')
SET IDENTITY_INSERT [dbo].[TipoDireccion] OFF
SET IDENTITY_INSERT [dbo].[TipoTarjeta] ON 

INSERT [dbo].[TipoTarjeta] ([IdTipoTarjeta], [Descripcion]) VALUES (1, N'Debito')
INSERT [dbo].[TipoTarjeta] ([IdTipoTarjeta], [Descripcion]) VALUES (2, N'Credito')
SET IDENTITY_INSERT [dbo].[TipoTarjeta] OFF
SET IDENTITY_INSERT [dbo].[TipoTelefono] ON 

INSERT [dbo].[TipoTelefono] ([IdTipoTelefono], [Descripcion]) VALUES (1, N'Fijo')
INSERT [dbo].[TipoTelefono] ([IdTipoTelefono], [Descripcion]) VALUES (2, N'Celular')
INSERT [dbo].[TipoTelefono] ([IdTipoTelefono], [Descripcion]) VALUES (3, N'NN')
SET IDENTITY_INSERT [dbo].[TipoTelefono] OFF
SET IDENTITY_INSERT [dbo].[TipoUsuario] ON 

INSERT [dbo].[TipoUsuario] ([IdTipoUsuario], [Descripcion]) VALUES (1, N'Publico')
INSERT [dbo].[TipoUsuario] ([IdTipoUsuario], [Descripcion]) VALUES (2, N'Cliente')
INSERT [dbo].[TipoUsuario] ([IdTipoUsuario], [Descripcion]) VALUES (3, N'Empleado')
INSERT [dbo].[TipoUsuario] ([IdTipoUsuario], [Descripcion]) VALUES (4, N'Admin')
SET IDENTITY_INSERT [dbo].[TipoUsuario] OFF
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([IdUsuario], [IdTipoUsuario], [Nombre], [Apellido], [IdTipoDeDocumento], [NumeroDocumento], [IdSexo], [Email], [Password], [IdTipoTelefono], [NumeroTelefono], [DVH]) VALUES (2, 4, N'Natalia', N'Gonzalez', 1, 22345234, 1, N'admin@helper.com.ar', N'helper', 2, 1523456543, 23)
INSERT [dbo].[Usuario] ([IdUsuario], [IdTipoUsuario], [Nombre], [Apellido], [IdTipoDeDocumento], [NumeroDocumento], [IdSexo], [Email], [Password], [IdTipoTelefono], [NumeroTelefono], [DVH]) VALUES (6, 2, N'Carlos', N'Baez', 1, 28178276, 2, N'baezcarlosjavier@gmail.com', N'HzGlqKNzHRdoAJbkWkn0urGY6EE=', 1, 220482939, 24)
INSERT [dbo].[Usuario] ([IdUsuario], [IdTipoUsuario], [Nombre], [Apellido], [IdTipoDeDocumento], [NumeroDocumento], [IdSexo], [Email], [Password], [IdTipoTelefono], [NumeroTelefono], [DVH]) VALUES (16, 3, N'Roman', N'Lopez', 1, 27865392, 2, N'roman@gmail.com', N'HOubPRx1polOXFhj9YRuAC7AUR0=', 1, 1155909769, 62)
INSERT [dbo].[Usuario] ([IdUsuario], [IdTipoUsuario], [Nombre], [Apellido], [IdTipoDeDocumento], [NumeroDocumento], [IdSexo], [Email], [Password], [IdTipoTelefono], [NumeroTelefono], [DVH]) VALUES (17, 3, N'leandro', N'messiano', 1, 33897289, 2, N'messi3@gmail.com', N'4Eq1Tf5z0DAMkXfQChV8s4KFZkQ=', 1, 237465898, 74)
INSERT [dbo].[Usuario] ([IdUsuario], [IdTipoUsuario], [Nombre], [Apellido], [IdTipoDeDocumento], [NumeroDocumento], [IdSexo], [Email], [Password], [IdTipoTelefono], [NumeroTelefono], [DVH]) VALUES (18, 3, N'Prueba', N'Merchos', 1, 24589768, 2, N'probando@gmail.com', N'dqFRcX2ox9UbxP40Z2ROTZVrxtA=', 1, 2374589, 50)
INSERT [dbo].[Usuario] ([IdUsuario], [IdTipoUsuario], [Nombre], [Apellido], [IdTipoDeDocumento], [NumeroDocumento], [IdSexo], [Email], [Password], [IdTipoTelefono], [NumeroTelefono], [DVH]) VALUES (19, 2, N'bartolomeo', N'simpson', 1, 33890089, 2, N'bartolomeo@gmail.com', N'rd2+nqRoRsIphlTMobpPPKGJbuA=', 1, 2374777, 15)
INSERT [dbo].[Usuario] ([IdUsuario], [IdTipoUsuario], [Nombre], [Apellido], [IdTipoDeDocumento], [NumeroDocumento], [IdSexo], [Email], [Password], [IdTipoTelefono], [NumeroTelefono], [DVH]) VALUES (20, 2, N'Miercoles', N'Sarmiento', 1, 5456767, 2, N'domingo@gmail.com', N'sF2dtrSlfvO4/AfaDsRLi+GfyL0=', 1, 22049865, 22)
INSERT [dbo].[Usuario] ([IdUsuario], [IdTipoUsuario], [Nombre], [Apellido], [IdTipoDeDocumento], [NumeroDocumento], [IdSexo], [Email], [Password], [IdTipoTelefono], [NumeroTelefono], [DVH]) VALUES (22, 2, N'Guillermo', N'Falcon', 1, 22908769, 2, N'guillermo222@gmail.com', N'klWOD1CYTrNIBW8fU74NcfJ2G1Y=', 2, 2374589, 54)
INSERT [dbo].[Usuario] ([IdUsuario], [IdTipoUsuario], [Nombre], [Apellido], [IdTipoDeDocumento], [NumeroDocumento], [IdSexo], [Email], [Password], [IdTipoTelefono], [NumeroTelefono], [DVH]) VALUES (34, 2, N'raton', N'perez', 1, 33897879, 2, N'ratonperez@gmail.com', N'JrY9G/SzeVXB9FjQjQwFH/iXG+Y=', 2, 2374589, 54)
INSERT [dbo].[Usuario] ([IdUsuario], [IdTipoUsuario], [Nombre], [Apellido], [IdTipoDeDocumento], [NumeroDocumento], [IdSexo], [Email], [Password], [IdTipoTelefono], [NumeroTelefono], [DVH]) VALUES (35, 2, N'natalia', N'mirta', 1, 27865395, 1, N'NAMIRGON@gmail.com', N'un/0csfodekR1Gz7foxrvY/iOg4=', 2, 115590900, 33)
INSERT [dbo].[Usuario] ([IdUsuario], [IdTipoUsuario], [Nombre], [Apellido], [IdTipoDeDocumento], [NumeroDocumento], [IdSexo], [Email], [Password], [IdTipoTelefono], [NumeroTelefono], [DVH]) VALUES (36, 2, N'guillermo p', N'lopez', 1, 27865391, 2, N'guillermo222@gmail.com', N't28uHxWN+bO6c74DemRC1bLi7z0=', 2, 23745777, 69)
INSERT [dbo].[Usuario] ([IdUsuario], [IdTipoUsuario], [Nombre], [Apellido], [IdTipoDeDocumento], [NumeroDocumento], [IdSexo], [Email], [Password], [IdTipoTelefono], [NumeroTelefono], [DVH]) VALUES (37, 4, N'lorena', N'gomez', 1, 4356876, 1, N'lorena@gmail.com', N'fapOKBOXWjaSoznctx78894Xcu0=', 2, 1165764355, 69)
INSERT [dbo].[Usuario] ([IdUsuario], [IdTipoUsuario], [Nombre], [Apellido], [IdTipoDeDocumento], [NumeroDocumento], [IdSexo], [Email], [Password], [IdTipoTelefono], [NumeroTelefono], [DVH]) VALUES (38, 4, N'Esteban', N'Unsueño', 1, 22888777, 2, N'Esteban@gmail.com', N'uu1Q5COFbpfJRsfDgehHdCXoN7U=', 2, 1176668999, 68)
INSERT [dbo].[Usuario] ([IdUsuario], [IdTipoUsuario], [Nombre], [Apellido], [IdTipoDeDocumento], [NumeroDocumento], [IdSexo], [Email], [Password], [IdTipoTelefono], [NumeroTelefono], [DVH]) VALUES (39, 4, N'serena', N'gomez', 1, 34888777, 1, N'serena@gmail.com', N'3IvOODO9t/xDI4VPYfJJLDOl2BE=', 2, 1122223333, 41)
SET IDENTITY_INSERT [dbo].[Usuario] OFF
INSERT [dbo].[UsuarioDireccion] ([IdUsuario], [IdDireccion], [NumeroDocumento], [Fecha]) VALUES (6, 5, 28178276, NULL)
INSERT [dbo].[UsuarioDireccion] ([IdUsuario], [IdDireccion], [NumeroDocumento], [Fecha]) VALUES (16, 15, 27865392, CAST(N'2020-10-02T17:09:26.000' AS DateTime))
INSERT [dbo].[UsuarioDireccion] ([IdUsuario], [IdDireccion], [NumeroDocumento], [Fecha]) VALUES (17, 16, 33897289, CAST(N'2020-10-03T09:43:41.097' AS DateTime))
INSERT [dbo].[UsuarioDireccion] ([IdUsuario], [IdDireccion], [NumeroDocumento], [Fecha]) VALUES (18, 17, 24589768, CAST(N'2020-10-03T11:52:06.953' AS DateTime))
INSERT [dbo].[UsuarioDireccion] ([IdUsuario], [IdDireccion], [NumeroDocumento], [Fecha]) VALUES (19, 18, 33890089, CAST(N'2020-10-03T12:05:17.970' AS DateTime))
INSERT [dbo].[UsuarioDireccion] ([IdUsuario], [IdDireccion], [NumeroDocumento], [Fecha]) VALUES (20, 19, 5456767, CAST(N'2020-10-04T10:08:32.700' AS DateTime))
INSERT [dbo].[UsuarioDireccion] ([IdUsuario], [IdDireccion], [NumeroDocumento], [Fecha]) VALUES (22, 21, 22908769, CAST(N'2020-10-04T10:13:57.953' AS DateTime))
INSERT [dbo].[UsuarioDireccion] ([IdUsuario], [IdDireccion], [NumeroDocumento], [Fecha]) VALUES (34, 30, 33897879, CAST(N'2020-10-04T11:58:10.633' AS DateTime))
INSERT [dbo].[UsuarioDireccion] ([IdUsuario], [IdDireccion], [NumeroDocumento], [Fecha]) VALUES (35, 31, 27865395, CAST(N'2020-10-04T12:12:39.090' AS DateTime))
INSERT [dbo].[UsuarioDireccion] ([IdUsuario], [IdDireccion], [NumeroDocumento], [Fecha]) VALUES (36, 32, 27865391, CAST(N'2020-10-04T12:15:34.560' AS DateTime))
INSERT [dbo].[UsuarioDireccion] ([IdUsuario], [IdDireccion], [NumeroDocumento], [Fecha]) VALUES (37, 33, 4356876, CAST(N'2020-10-15T22:21:16.257' AS DateTime))
INSERT [dbo].[UsuarioDireccion] ([IdUsuario], [IdDireccion], [NumeroDocumento], [Fecha]) VALUES (38, 36, 22888777, CAST(N'2020-10-21T12:49:03.610' AS DateTime))
INSERT [dbo].[UsuarioDireccion] ([IdUsuario], [IdDireccion], [NumeroDocumento], [Fecha]) VALUES (39, 35, 34888777, CAST(N'2020-10-18T18:41:46.037' AS DateTime))
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
ALTER TABLE [dbo].[ServicioUsuario]  WITH CHECK ADD  CONSTRAINT [FK_ServicioUsuario_Servicio] FOREIGN KEY([IdServicio])
REFERENCES [dbo].[Servicio] ([IdServicio])
GO
ALTER TABLE [dbo].[ServicioUsuario] CHECK CONSTRAINT [FK_ServicioUsuario_Servicio]
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
/****** Object:  StoredProcedure [dbo].[BaseDatosRespaldar]    Script Date: 12/11/2020 10:30:58 ******/
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
/****** Object:  StoredProcedure [dbo].[BitacoraLogInsert]    Script Date: 12/11/2020 10:30:58 ******/
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
/****** Object:  StoredProcedure [dbo].[BitacoraLogSelect]    Script Date: 12/11/2020 10:30:58 ******/
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
/****** Object:  StoredProcedure [dbo].[BitacoraLogSelectAll]    Script Date: 12/11/2020 10:30:58 ******/
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
/****** Object:  StoredProcedure [dbo].[BitacoraLogUPDATE]    Script Date: 12/11/2020 10:30:58 ******/
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
/****** Object:  StoredProcedure [dbo].[BitacoraVerLogs]    Script Date: 12/11/2020 10:30:58 ******/
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
/****** Object:  StoredProcedure [dbo].[BuscarEmail]    Script Date: 12/11/2020 10:30:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[BuscarEmail]
(
  @Email nvarchar(50)
 

  )
as begin

select * 
from Usuario 
where Email = @Email  ;
print 'hecho correctamente'
end
GO
/****** Object:  StoredProcedure [dbo].[BuscarUsuario]    Script Date: 12/11/2020 10:30:58 ******/
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
/****** Object:  StoredProcedure [dbo].[ComprobanteDetalleInsert]    Script Date: 12/11/2020 10:30:58 ******/
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
/****** Object:  StoredProcedure [dbo].[ComprobanteInsert]    Script Date: 12/11/2020 10:30:58 ******/
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
/****** Object:  StoredProcedure [dbo].[ComprobanteSelectById]    Script Date: 12/11/2020 10:30:58 ******/
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
/****** Object:  StoredProcedure [dbo].[DireccionInsert]    Script Date: 12/11/2020 10:30:58 ******/
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
/****** Object:  StoredProcedure [dbo].[DireccionSelectByNumeroDocumento]    Script Date: 12/11/2020 10:30:58 ******/
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
/****** Object:  StoredProcedure [dbo].[DireccionUsuarioInsert]    Script Date: 12/11/2020 10:30:58 ******/
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
/****** Object:  StoredProcedure [dbo].[EliminarDIreccion]    Script Date: 12/11/2020 10:30:58 ******/
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
/****** Object:  StoredProcedure [dbo].[FamiliaCrear]    Script Date: 12/11/2020 10:30:58 ******/
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
/****** Object:  StoredProcedure [dbo].[FamiliaDelete]    Script Date: 12/11/2020 10:30:58 ******/
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
/****** Object:  StoredProcedure [dbo].[FamiliaEliminarAsocFamilias]    Script Date: 12/11/2020 10:30:58 ******/
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
/****** Object:  StoredProcedure [dbo].[FamiliaEliminarAsocPatentes]    Script Date: 12/11/2020 10:30:58 ******/
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
/****** Object:  StoredProcedure [dbo].[FamiliaFamiliaAsociar]    Script Date: 12/11/2020 10:30:58 ******/
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
/****** Object:  StoredProcedure [dbo].[FamiliaFamiliaDesasociar]    Script Date: 12/11/2020 10:30:58 ******/
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
/****** Object:  StoredProcedure [dbo].[FamiliaModificar]    Script Date: 12/11/2020 10:30:58 ******/
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
/****** Object:  StoredProcedure [dbo].[FamiliaPatenteAsociar]    Script Date: 12/11/2020 10:30:58 ******/
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
/****** Object:  StoredProcedure [dbo].[FamiliaPatenteDesasociar]    Script Date: 12/11/2020 10:30:58 ******/
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
/****** Object:  StoredProcedure [dbo].[FamiliaSelectNombreFamiliaByIdUsuario]    Script Date: 12/11/2020 10:30:58 ******/
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
/****** Object:  StoredProcedure [dbo].[FamiliasTraerTodas]    Script Date: 12/11/2020 10:30:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[FamiliasTraerTodas]
AS
	SELECT fam.IdFamilia, fam.NombreFamilia
	FROM Familia fam

	



GO
/****** Object:  StoredProcedure [dbo].[FamiliaTraerFamiliasHijas]    Script Date: 12/11/2020 10:30:58 ******/
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
/****** Object:  StoredProcedure [dbo].[FamiliaTraerPatentes]    Script Date: 12/11/2020 10:30:58 ******/
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
/****** Object:  StoredProcedure [dbo].[FamiliaUsuariosAsociados]    Script Date: 12/11/2020 10:30:58 ******/
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
/****** Object:  StoredProcedure [dbo].[FamiliaUsuariosComprometidos]    Script Date: 12/11/2020 10:30:58 ******/
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
/****** Object:  StoredProcedure [dbo].[FinalizarOrdenDeTrabajo]    Script Date: 12/11/2020 10:30:58 ******/
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
/****** Object:  StoredProcedure [dbo].[IdiomaDelete]    Script Date: 12/11/2020 10:30:58 ******/
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
/****** Object:  StoredProcedure [dbo].[IdiomaInsert]    Script Date: 12/11/2020 10:30:58 ******/
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
/****** Object:  StoredProcedure [dbo].[IdiomaSelect]    Script Date: 12/11/2020 10:30:58 ******/
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
/****** Object:  StoredProcedure [dbo].[IdiomaSelectAll]    Script Date: 12/11/2020 10:30:58 ******/
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
/****** Object:  StoredProcedure [dbo].[IdiomaUpdate]    Script Date: 12/11/2020 10:30:58 ******/
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
/****** Object:  StoredProcedure [dbo].[InsertDVV]    Script Date: 12/11/2020 10:30:58 ******/
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
/****** Object:  StoredProcedure [dbo].[ItemDelete]    Script Date: 12/11/2020 10:30:58 ******/
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
/****** Object:  StoredProcedure [dbo].[ItemIdDireccionInsert]    Script Date: 12/11/2020 10:30:58 ******/
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
/****** Object:  StoredProcedure [dbo].[ItemSelect]    Script Date: 12/11/2020 10:30:58 ******/
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
/****** Object:  StoredProcedure [dbo].[ListaDeItemUpDate]    Script Date: 12/11/2020 10:30:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ListaDeItemUpDate]
(


@IdItemOrdenDeTrabajo int,
@Fecha date,
@Hora time

)
as begin 
update ItemOrdenDeTrabajo 
set 
 
	Fecha=@Fecha,
	
	Hora= @Hora 


	where IdItemOrdenDeTrabajo=@IdItemOrdenDeTrabajo 

	end 
GO
/****** Object:  StoredProcedure [dbo].[ListaItemInsert]    Script Date: 12/11/2020 10:30:58 ******/
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
/****** Object:  StoredProcedure [dbo].[ListarDireccionbyIdUsuario]    Script Date: 12/11/2020 10:30:58 ******/
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
/****** Object:  StoredProcedure [dbo].[ListarEstudiante]    Script Date: 12/11/2020 10:30:58 ******/
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
/****** Object:  StoredProcedure [dbo].[ListarFacturaB]    Script Date: 12/11/2020 10:30:58 ******/
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
/****** Object:  StoredProcedure [dbo].[ListarIdItemByIdOrdenDeTrabajo]    Script Date: 12/11/2020 10:30:58 ******/
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
/****** Object:  StoredProcedure [dbo].[ListarItemByIdOrdenDeTrabajo]    Script Date: 12/11/2020 10:30:58 ******/
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
/****** Object:  StoredProcedure [dbo].[ListarItemByIdOrdenDeTrabajo2]    Script Date: 12/11/2020 10:30:58 ******/
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
/****** Object:  StoredProcedure [dbo].[ListarItemByNumeroDocumento]    Script Date: 12/11/2020 10:30:58 ******/
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
/****** Object:  StoredProcedure [dbo].[ListarLocalidad]    Script Date: 12/11/2020 10:30:58 ******/
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
/****** Object:  StoredProcedure [dbo].[ListarNC]    Script Date: 12/11/2020 10:30:58 ******/
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
/****** Object:  StoredProcedure [dbo].[ListarND]    Script Date: 12/11/2020 10:30:58 ******/
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
/****** Object:  StoredProcedure [dbo].[ListarOrdenDeTrabajoActiva]    Script Date: 12/11/2020 10:30:58 ******/
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
/****** Object:  StoredProcedure [dbo].[ListarProvincias]    Script Date: 12/11/2020 10:30:58 ******/
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
/****** Object:  StoredProcedure [dbo].[ListarSexo]    Script Date: 12/11/2020 10:30:58 ******/
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
/****** Object:  StoredProcedure [dbo].[ListarTipoDireccion]    Script Date: 12/11/2020 10:30:58 ******/
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
/****** Object:  StoredProcedure [dbo].[ListarTipoDomicilio]    Script Date: 12/11/2020 10:30:58 ******/
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
/****** Object:  StoredProcedure [dbo].[ListarTipoTelefono]    Script Date: 12/11/2020 10:30:58 ******/
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
/****** Object:  StoredProcedure [dbo].[MultiIdiomaControlDelete]    Script Date: 12/11/2020 10:30:58 ******/
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
/****** Object:  StoredProcedure [dbo].[MultiIdiomaControlInsert]    Script Date: 12/11/2020 10:30:58 ******/
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
/****** Object:  StoredProcedure [dbo].[MultiIdiomaControlSelect]    Script Date: 12/11/2020 10:30:58 ******/
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
/****** Object:  StoredProcedure [dbo].[MultiIdiomaControlSelectAll]    Script Date: 12/11/2020 10:30:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[MultiIdiomaControlSelectAll]
AS

SET NOCOUNT ON

SELECT [Texto],
	[IdIdioma],
	[NombreDelControl]
	
FROM MultiIdioma

GO
/****** Object:  StoredProcedure [dbo].[MultiIdiomaControlUpdate]    Script Date: 12/11/2020 10:30:58 ******/
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
/****** Object:  StoredProcedure [dbo].[OrdenInsert]    Script Date: 12/11/2020 10:30:58 ******/
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
/****** Object:  StoredProcedure [dbo].[PagoInsert]    Script Date: 12/11/2020 10:30:58 ******/
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
/****** Object:  StoredProcedure [dbo].[PatentesTraerTodas]    Script Date: 12/11/2020 10:30:58 ******/
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
/****** Object:  StoredProcedure [dbo].[ResumenCompraByItem]    Script Date: 12/11/2020 10:30:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ResumenCompraByItem](

 @IdOrdenDeTrabajo int

)
as

begin
select   IODT.IdItemOrdenDeTrabajo ,  s.Titulo, s.Descripcion, IODT.Precio , s.URLimagen , IODT.Fecha, IODT.Hora

from Servicio as S ,  OrdenDeTrabajo as ODT inner join ItemOrdenDeTrabajo as IODT  on

  ODT.IdOrdenDeTrabajo = @IdOrdenDeTrabajo and   ODT.IdOrdenDeTrabajo =IODT.IdOrdenDeTrabajo 
  
    where   S.IdServicio = IODT.IdServicio
end 
GO
/****** Object:  StoredProcedure [dbo].[SelectbyIDTarjeta]    Script Date: 12/11/2020 10:30:58 ******/
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
/****** Object:  StoredProcedure [dbo].[SelectByTabla]    Script Date: 12/11/2020 10:30:58 ******/
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
/****** Object:  StoredProcedure [dbo].[SelectEmpleado]    Script Date: 12/11/2020 10:30:58 ******/
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
/****** Object:  StoredProcedure [dbo].[SelectTablaUsuario]    Script Date: 12/11/2020 10:30:58 ******/
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
/****** Object:  StoredProcedure [dbo].[SelectTarjeta]    Script Date: 12/11/2020 10:30:58 ******/
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
/****** Object:  StoredProcedure [dbo].[SelectUsuarioByIDUsuario]    Script Date: 12/11/2020 10:30:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SelectUsuarioByIDUsuario](


@IdUsuario int

)
as 

begin 

select   u.Nombre , u.Apellido,u.NumeroDocumento,u.NumeroTelefono, u.IdSexo, u.Email,di.IdDireccion, di.Calle, di.Numero, di.Piso, di.Departamento, di.IdLocalidad, di.IdProvincia


from Usuario as u inner join UsuarioDireccion as ud on ud.NumeroDocumento= u.NumeroDocumento inner join  Direccion as di  on ud.IdDireccion=di.IdDireccion  

where u.IdUsuario=@IdUsuario


end
GO
/****** Object:  StoredProcedure [dbo].[ServicioDelete]    Script Date: 12/11/2020 10:30:58 ******/
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
/****** Object:  StoredProcedure [dbo].[ServicioInsert]    Script Date: 12/11/2020 10:30:58 ******/
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
/****** Object:  StoredProcedure [dbo].[ServicioSelect]    Script Date: 12/11/2020 10:30:58 ******/
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
/****** Object:  StoredProcedure [dbo].[ServicioSelectAll]    Script Date: 12/11/2020 10:30:58 ******/
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
/****** Object:  StoredProcedure [dbo].[ServicioUpdata]    Script Date: 12/11/2020 10:30:58 ******/
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
/****** Object:  StoredProcedure [dbo].[TarjetaDelete]    Script Date: 12/11/2020 10:30:58 ******/
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
/****** Object:  StoredProcedure [dbo].[TarjetaInsert]    Script Date: 12/11/2020 10:30:58 ******/
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
/****** Object:  StoredProcedure [dbo].[TarjetaUpdate]    Script Date: 12/11/2020 10:30:58 ******/
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
/****** Object:  StoredProcedure [dbo].[TipoTarjetaSelectAll]    Script Date: 12/11/2020 10:30:58 ******/
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
/****** Object:  StoredProcedure [dbo].[UpdateDatosEmpleado]    Script Date: 12/11/2020 10:30:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[UpdateDatosEmpleado]

(
	
	@IdUsuario int,
	@Nombre nvarchar(200),
	@Apellido nvarchar(200),
	@NumeroDocumento INT,
	@IdSexo int,
	@Email varchar(400),
	@NumeroTelefono int
	

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
	[NumeroTelefono]=@NumeroTelefono

	where [IdUsuario]=@IdUsuario
	
GO
/****** Object:  StoredProcedure [dbo].[UsuarioFamiliaInsert]    Script Date: 12/11/2020 10:30:58 ******/
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
/****** Object:  StoredProcedure [dbo].[UsuarioInsert]    Script Date: 12/11/2020 10:30:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UsuarioInsert]
(
	
	@IdTipoUsuario INT,
	@Nombre nvarchar(200),
	@Apellido nvarchar(200),
	@IdTipoDeDocumento INT,
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
	[IdTipoDeDocumento],
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
	@IdTipoDeDocumento,
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
/****** Object:  StoredProcedure [dbo].[UsuarioLeerDVH]    Script Date: 12/11/2020 10:30:58 ******/
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
/****** Object:  StoredProcedure [dbo].[UsuarioLeerParaDVH]    Script Date: 12/11/2020 10:30:58 ******/
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
/****** Object:  StoredProcedure [dbo].[UsuarioTraerFamilias]    Script Date: 12/11/2020 10:30:58 ******/
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
/****** Object:  StoredProcedure [dbo].[UsuarioTraerPatentes]    Script Date: 12/11/2020 10:30:58 ******/
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
/****** Object:  StoredProcedure [dbo].[UsuarioUpdateClave]    Script Date: 12/11/2020 10:30:58 ******/
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
/****** Object:  StoredProcedure [dbo].[UsuarioUpdatePermisosFamilia]    Script Date: 12/11/2020 10:30:58 ******/
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
