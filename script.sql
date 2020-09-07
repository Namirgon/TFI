USE [master]
GO
/****** Object:  Database [HelperDataBase]    Script Date: 22/8/2020 10:46:01 ******/
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
/****** Object:  Table [dbo].[Bitacora]    Script Date: 22/8/2020 10:46:01 ******/
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
	[Mensaje] [varchar](2000) NOT NULL,
 CONSTRAINT [PK_Bitacora] PRIMARY KEY CLUSTERED 
(
	[IdBitacoraLog] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comprobante]    Script Date: 22/8/2020 10:46:02 ******/
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
/****** Object:  Table [dbo].[DetalleComprobante]    Script Date: 22/8/2020 10:46:02 ******/
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
	[Cantidad] [int] NOT NULL,
	[PrecioUnitario] [float] NOT NULL,
 CONSTRAINT [PK_DetalleComprobante] PRIMARY KEY CLUSTERED 
(
	[IdDetalleComprobante] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Direccion]    Script Date: 22/8/2020 10:46:02 ******/
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
/****** Object:  Table [dbo].[Estado]    Script Date: 22/8/2020 10:46:02 ******/
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
/****** Object:  Table [dbo].[Familia]    Script Date: 22/8/2020 10:46:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Familia](
	[IdFamilia] [int] NOT NULL,
	[NombreFamilia] [nvarchar](50) NOT NULL,
	[FecBaja] [datetime] NULL,
 CONSTRAINT [PK_Familia] PRIMARY KEY CLUSTERED 
(
	[IdFamilia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FamiliaUsuario]    Script Date: 22/8/2020 10:46:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FamiliaUsuario](
	[IdFamilia] [int] NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[NombreUsuario] [nvarchar](50) NULL,
	[FecBaja] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FormaDePago]    Script Date: 22/8/2020 10:46:02 ******/
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
/****** Object:  Table [dbo].[Idioma]    Script Date: 22/8/2020 10:46:02 ******/
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
/****** Object:  Table [dbo].[ItemOrdenDeTrabajo]    Script Date: 22/8/2020 10:46:02 ******/
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
/****** Object:  Table [dbo].[ListaDeseo]    Script Date: 22/8/2020 10:46:02 ******/
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
/****** Object:  Table [dbo].[Localidad]    Script Date: 22/8/2020 10:46:02 ******/
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
/****** Object:  Table [dbo].[MultiIdioma]    Script Date: 22/8/2020 10:46:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MultiIdioma](
	[IdMultiIdioma] [int] IDENTITY(1,1) NOT NULL,
	[IdIdioma] [int] NOT NULL,
	[NombreDelControl] [nvarchar](50) NOT NULL,
	[Texto] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_MultiIdioma] PRIMARY KEY CLUSTERED 
(
	[IdMultiIdioma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrdenDeTrabajo]    Script Date: 22/8/2020 10:46:02 ******/
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
/****** Object:  Table [dbo].[Patente]    Script Date: 22/8/2020 10:46:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patente](
	[IdPatente] [int] IDENTITY(1,1) NOT NULL,
	[NombrePatente] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Patente] PRIMARY KEY CLUSTERED 
(
	[IdPatente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PatenteFamilia]    Script Date: 22/8/2020 10:46:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PatenteFamilia](
	[IdPatente] [int] NOT NULL,
	[IdFamilia] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PatenteUsuario]    Script Date: 22/8/2020 10:46:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PatenteUsuario](
	[IdPatente] [int] NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[NombreUsuario] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Provincia]    Script Date: 22/8/2020 10:46:02 ******/
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
/****** Object:  Table [dbo].[Recibo]    Script Date: 22/8/2020 10:46:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Recibo](
	[IdRecibo] [int] IDENTITY(1,1) NOT NULL,
	[IdOrdenDeTrabajo] [int] NOT NULL,
	[Fecha] [date] NOT NULL,
	[Detalle] [nvarchar](50) NOT NULL,
	[IdFormaDePago] [int] NOT NULL,
	[Importe] [float] NOT NULL,
 CONSTRAINT [PK_Recibo] PRIMARY KEY CLUSTERED 
(
	[IdRecibo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RemFamFam]    Script Date: 22/8/2020 10:46:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RemFamFam](
	[IdFamiliaPadre] [int] NOT NULL,
	[IdFamiliaHijo] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Servicio]    Script Date: 22/8/2020 10:46:02 ******/
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
/****** Object:  Table [dbo].[ServicioUsuario]    Script Date: 22/8/2020 10:46:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServicioUsuario](
	[IdServicio] [int] NOT NULL,
	[IdUsuario] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sexo]    Script Date: 22/8/2020 10:46:02 ******/
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
/****** Object:  Table [dbo].[Sucursal]    Script Date: 22/8/2020 10:46:02 ******/
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
/****** Object:  Table [dbo].[Tarjeta]    Script Date: 22/8/2020 10:46:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tarjeta](
	[IdTarjeta] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[IdTipoTarjeta] [int] NOT NULL,
	[NombreTitular] [nvarchar](50) NOT NULL,
	[NumeroTarjeta] [nvarchar](50) NOT NULL,
	[FechaVencimiento] [date] NOT NULL,
	[CodigoSeguridad] [int] NOT NULL,
 CONSTRAINT [PK_Tarjeta] PRIMARY KEY CLUSTERED 
(
	[IdTarjeta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoComprobante]    Script Date: 22/8/2020 10:46:02 ******/
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
/****** Object:  Table [dbo].[TipoDeDocumento]    Script Date: 22/8/2020 10:46:02 ******/
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
/****** Object:  Table [dbo].[TipoDireccion]    Script Date: 22/8/2020 10:46:02 ******/
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
/****** Object:  Table [dbo].[TipoTarjeta]    Script Date: 22/8/2020 10:46:02 ******/
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
/****** Object:  Table [dbo].[TipoTelefono]    Script Date: 22/8/2020 10:46:02 ******/
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
/****** Object:  Table [dbo].[TipoUsuario]    Script Date: 22/8/2020 10:46:03 ******/
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
/****** Object:  Table [dbo].[Usuario]    Script Date: 22/8/2020 10:46:03 ******/
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
	[FecBaja] [datetime] NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsuarioDireccion]    Script Date: 22/8/2020 10:46:03 ******/
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
SET IDENTITY_INSERT [dbo].[Bitacora] OFF
SET IDENTITY_INSERT [dbo].[Direccion] ON 

INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [IdProvincia], [IdLocalidad], [IdTipoDireccion]) VALUES (1, N'Av Siempreviva', 123, N'1', N'1', 1, 1, 1)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [IdProvincia], [IdLocalidad], [IdTipoDireccion]) VALUES (2, N'balbin', 2323, N'0', N'0', 1, 4, 3)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [IdProvincia], [IdLocalidad], [IdTipoDireccion]) VALUES (3, N'merlo', 233, N'0', N'0', 1, 2, 2)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [IdProvincia], [IdLocalidad], [IdTipoDireccion]) VALUES (4, N'siempreviva', 111, N'1', N'3', 1, 2, 3)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [IdProvincia], [IdLocalidad], [IdTipoDireccion]) VALUES (5, N'los sauces', 88, N'2', N'0', 1, 4, 3)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [IdProvincia], [IdLocalidad], [IdTipoDireccion]) VALUES (6, N'monroe', 976, N'0', N'0', 1, 2, 2)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [IdProvincia], [IdLocalidad], [IdTipoDireccion]) VALUES (7, N'lucrecia', 76, N'0', N'0', 1, 2, 1)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [IdProvincia], [IdLocalidad], [IdTipoDireccion]) VALUES (8, N'quebracho', 1542, N'0', N'0', 1, 1, 1)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [IdProvincia], [IdLocalidad], [IdTipoDireccion]) VALUES (9, N'boston', 767, N'0', N'0', 1, 2, 3)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [IdProvincia], [IdLocalidad], [IdTipoDireccion]) VALUES (10, N'avellaneda', 3427, N'0', N'0', 1, 1, 1)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [IdProvincia], [IdLocalidad], [IdTipoDireccion]) VALUES (11, N'velez sarfield', 76, N'1', N'2', 1, 3, 3)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [IdProvincia], [IdLocalidad], [IdTipoDireccion]) VALUES (12, N'las margaritas', 25, N'0', N'0', 1, 1, 1)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [IdProvincia], [IdLocalidad], [IdTipoDireccion]) VALUES (13, N'los sauses', 879, N'0', N'0', 1, 2, 3)
SET IDENTITY_INSERT [dbo].[Direccion] OFF
SET IDENTITY_INSERT [dbo].[Estado] ON 

INSERT [dbo].[Estado] ([IdEstado], [Descripcion]) VALUES (1, N'Activo')
INSERT [dbo].[Estado] ([IdEstado], [Descripcion]) VALUES (2, N'Cancelado')
INSERT [dbo].[Estado] ([IdEstado], [Descripcion]) VALUES (3, N'Finalizado')
SET IDENTITY_INSERT [dbo].[Estado] OFF
INSERT [dbo].[Familia] ([IdFamilia], [NombreFamilia], [FecBaja]) VALUES (1, N'Publico', NULL)
INSERT [dbo].[Familia] ([IdFamilia], [NombreFamilia], [FecBaja]) VALUES (2, N'Cliente', NULL)
INSERT [dbo].[Familia] ([IdFamilia], [NombreFamilia], [FecBaja]) VALUES (3, N'Empleado', NULL)
INSERT [dbo].[Familia] ([IdFamilia], [NombreFamilia], [FecBaja]) VALUES (4, N'Admin', NULL)
INSERT [dbo].[FamiliaUsuario] ([IdFamilia], [IdUsuario], [NombreUsuario], [FecBaja]) VALUES (4, 2, N'Gonzalez', NULL)
SET IDENTITY_INSERT [dbo].[ItemOrdenDeTrabajo] ON 

INSERT [dbo].[ItemOrdenDeTrabajo] ([IdItemOrdenDeTrabajo], [IdOrdenDeTrabajo], [IdUsuario], [NombreUsuario], [IdServicio], [IdDireccion], [Precio], [Fecha], [Hora]) VALUES (9, 5, 2, N'Natalia', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[ItemOrdenDeTrabajo] ([IdItemOrdenDeTrabajo], [IdOrdenDeTrabajo], [IdUsuario], [NombreUsuario], [IdServicio], [IdDireccion], [Precio], [Fecha], [Hora]) VALUES (10, 5, 2, N'Natalia', 3, NULL, NULL, NULL, NULL)
INSERT [dbo].[ItemOrdenDeTrabajo] ([IdItemOrdenDeTrabajo], [IdOrdenDeTrabajo], [IdUsuario], [NombreUsuario], [IdServicio], [IdDireccion], [Precio], [Fecha], [Hora]) VALUES (12, 6, 4, N'Olivia', 7, NULL, NULL, NULL, NULL)
INSERT [dbo].[ItemOrdenDeTrabajo] ([IdItemOrdenDeTrabajo], [IdOrdenDeTrabajo], [IdUsuario], [NombreUsuario], [IdServicio], [IdDireccion], [Precio], [Fecha], [Hora]) VALUES (19, 6, 4, N'Olivia', 7, NULL, NULL, NULL, NULL)
INSERT [dbo].[ItemOrdenDeTrabajo] ([IdItemOrdenDeTrabajo], [IdOrdenDeTrabajo], [IdUsuario], [NombreUsuario], [IdServicio], [IdDireccion], [Precio], [Fecha], [Hora]) VALUES (20, 6, 4, N'Olivia', 6, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[ItemOrdenDeTrabajo] OFF
SET IDENTITY_INSERT [dbo].[Localidad] ON 

INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [Descripcion]) VALUES (1, 1, N'General Rodriguez')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [Descripcion]) VALUES (2, 1, N'La Reja')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [Descripcion]) VALUES (3, 1, N'Francisco Alvarez')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [Descripcion]) VALUES (4, 1, N'Moreno')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [Descripcion]) VALUES (5, 2, N'Calamuchita')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [Descripcion]) VALUES (6, 2, N'Carlos Paz')
SET IDENTITY_INSERT [dbo].[Localidad] OFF
SET IDENTITY_INSERT [dbo].[OrdenDeTrabajo] ON 

INSERT [dbo].[OrdenDeTrabajo] ([IdOrdenDeTrabajo], [IdUsuario], [Fecha], [IdEstado]) VALUES (5, 2, CAST(N'2020-08-05T18:51:14.957' AS DateTime), 1)
INSERT [dbo].[OrdenDeTrabajo] ([IdOrdenDeTrabajo], [IdUsuario], [Fecha], [IdEstado]) VALUES (6, 4, CAST(N'2020-08-05T19:04:41.403' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[OrdenDeTrabajo] OFF
SET IDENTITY_INSERT [dbo].[Patente] ON 

INSERT [dbo].[Patente] ([IdPatente], [NombrePatente]) VALUES (1, N'Desear')
INSERT [dbo].[Patente] ([IdPatente], [NombrePatente]) VALUES (2, N'GestionCliente')
INSERT [dbo].[Patente] ([IdPatente], [NombrePatente]) VALUES (3, N'GestionEmpleado')
INSERT [dbo].[Patente] ([IdPatente], [NombrePatente]) VALUES (4, N'EliminarServicio')
INSERT [dbo].[Patente] ([IdPatente], [NombrePatente]) VALUES (5, N'AltaServicio')
INSERT [dbo].[Patente] ([IdPatente], [NombrePatente]) VALUES (6, N'ModificarServicio')
INSERT [dbo].[Patente] ([IdPatente], [NombrePatente]) VALUES (7, N'GestionServicio')
SET IDENTITY_INSERT [dbo].[Patente] OFF
INSERT [dbo].[PatenteFamilia] ([IdPatente], [IdFamilia]) VALUES (1, 2)
INSERT [dbo].[PatenteFamilia] ([IdPatente], [IdFamilia]) VALUES (1, 3)
INSERT [dbo].[PatenteFamilia] ([IdPatente], [IdFamilia]) VALUES (1, 4)
INSERT [dbo].[PatenteFamilia] ([IdPatente], [IdFamilia]) VALUES (2, 3)
INSERT [dbo].[PatenteFamilia] ([IdPatente], [IdFamilia]) VALUES (2, 4)
INSERT [dbo].[PatenteFamilia] ([IdPatente], [IdFamilia]) VALUES (3, 1)
INSERT [dbo].[PatenteFamilia] ([IdPatente], [IdFamilia]) VALUES (3, 4)
INSERT [dbo].[PatenteFamilia] ([IdPatente], [IdFamilia]) VALUES (4, 4)
INSERT [dbo].[PatenteFamilia] ([IdPatente], [IdFamilia]) VALUES (5, 3)
INSERT [dbo].[PatenteFamilia] ([IdPatente], [IdFamilia]) VALUES (5, 4)
INSERT [dbo].[PatenteFamilia] ([IdPatente], [IdFamilia]) VALUES (6, 3)
INSERT [dbo].[PatenteFamilia] ([IdPatente], [IdFamilia]) VALUES (6, 4)
INSERT [dbo].[PatenteFamilia] ([IdPatente], [IdFamilia]) VALUES (7, 3)
INSERT [dbo].[PatenteFamilia] ([IdPatente], [IdFamilia]) VALUES (7, 4)
INSERT [dbo].[Provincia] ([IdProvincia], [Descripcion]) VALUES (1, N'Buenos Aires')
INSERT [dbo].[Provincia] ([IdProvincia], [Descripcion]) VALUES (2, N'Cordoba')
SET IDENTITY_INSERT [dbo].[Servicio] ON 

INSERT [dbo].[Servicio] ([IdServicio], [Titulo], [Descripcion], [Precio], [URLimagen]) VALUES (1, N'Full Pack', N'Limpieza completa interior y exterior. Limpieza de Cortinas y tapizados.  8 horas.', CAST(2500 AS Decimal(18, 0)), N'sravintage.jpg')
INSERT [dbo].[Servicio] ([IdServicio], [Titulo], [Descripcion], [Precio], [URLimagen]) VALUES (3, N'Limpieza de Tapizados', N'Limpieza de sillas y sillones en Cuero , cuerinas, panas y telas. ', CAST(500 AS Decimal(18, 0)), N'sillon.png')
INSERT [dbo].[Servicio] ([IdServicio], [Titulo], [Descripcion], [Precio], [URLimagen]) VALUES (4, N'Limpieza de Cortinas', N'Cortinas Black-out . Cortinas de Tela Tupida. Estilos Señoriales y Bando. Enrollables y mucho mas! ', CAST(500 AS Decimal(18, 0)), N'Limpiezadecortinas.jpg')
INSERT [dbo].[Servicio] ([IdServicio], [Titulo], [Descripcion], [Precio], [URLimagen]) VALUES (6, N'Limpieza Interior', N'Limpieza dormitorios. Limpieza baños, living, cocinas, playroom y mas. Consulta planes a tu medida!  6 horas', CAST(1500 AS Decimal(18, 0)), N'domestica2.png')
INSERT [dbo].[Servicio] ([IdServicio], [Titulo], [Descripcion], [Precio], [URLimagen]) VALUES (7, N'Limpieza Exterior', N'Quinchos, Jardines de invierno. Explanadas y veredas. Galerias, Glorietas. Galerias y mas!! 4 horas', CAST(1000 AS Decimal(18, 0)), N'pisoexteior.jpg')
SET IDENTITY_INSERT [dbo].[Servicio] OFF
INSERT [dbo].[Sexo] ([IdSexo], [Descripcion]) VALUES (1, N'Femenino')
INSERT [dbo].[Sexo] ([IdSexo], [Descripcion]) VALUES (2, N'Masculino')
INSERT [dbo].[Sexo] ([IdSexo], [Descripcion]) VALUES (3, N'NN')
SET IDENTITY_INSERT [dbo].[TipoDeDocumento] ON 

INSERT [dbo].[TipoDeDocumento] ([IdTipoDeDocumento], [Descripcion]) VALUES (1, N'DNI')
INSERT [dbo].[TipoDeDocumento] ([IdTipoDeDocumento], [Descripcion]) VALUES (2, N'Pasaporte')
SET IDENTITY_INSERT [dbo].[TipoDeDocumento] OFF
SET IDENTITY_INSERT [dbo].[TipoDireccion] ON 

INSERT [dbo].[TipoDireccion] ([IdTipoDireccion], [Descripcion]) VALUES (1, N'Casa')
INSERT [dbo].[TipoDireccion] ([IdTipoDireccion], [Descripcion]) VALUES (2, N'Quinta')
INSERT [dbo].[TipoDireccion] ([IdTipoDireccion], [Descripcion]) VALUES (3, N'Departamento')
SET IDENTITY_INSERT [dbo].[TipoDireccion] OFF
SET IDENTITY_INSERT [dbo].[TipoTelefono] ON 

INSERT [dbo].[TipoTelefono] ([IdTipoTelefono], [Descripcion]) VALUES (1, N'Fijo')
INSERT [dbo].[TipoTelefono] ([IdTipoTelefono], [Descripcion]) VALUES (2, N'Celular')
INSERT [dbo].[TipoTelefono] ([IdTipoTelefono], [Descripcion]) VALUES (3, N'NN')
SET IDENTITY_INSERT [dbo].[TipoTelefono] OFF
SET IDENTITY_INSERT [dbo].[TipoUsuario] ON 

INSERT [dbo].[TipoUsuario] ([IdTipoUsuario], [Descripcion]) VALUES (1, N'Administrador')
INSERT [dbo].[TipoUsuario] ([IdTipoUsuario], [Descripcion]) VALUES (2, N'Ventas')
INSERT [dbo].[TipoUsuario] ([IdTipoUsuario], [Descripcion]) VALUES (3, N'RRHH')
INSERT [dbo].[TipoUsuario] ([IdTipoUsuario], [Descripcion]) VALUES (4, N'Cliente')
SET IDENTITY_INSERT [dbo].[TipoUsuario] OFF
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([IdUsuario], [IdTipoUsuario], [Nombre], [Apellido], [IdTipoDeDocumento], [NumeroDocumento], [IdSexo], [Email], [Password], [IdTipoTelefono], [NumeroTelefono], [FecBaja]) VALUES (2, 2, N'Natalia', N'Gonzalez', 1, 22345234, 1, N'admin@helper.com.ar', N'helper', 2, 1523456543, NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [IdTipoUsuario], [Nombre], [Apellido], [IdTipoDeDocumento], [NumeroDocumento], [IdSexo], [Email], [Password], [IdTipoTelefono], [NumeroTelefono], [FecBaja]) VALUES (3, 4, N'manuel', N'perez', NULL, 3348492, 2, N'manuelperez@gmail.com', N'manuelperez', 2, 1137467777, NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [IdTipoUsuario], [Nombre], [Apellido], [IdTipoDeDocumento], [NumeroDocumento], [IdSexo], [Email], [Password], [IdTipoTelefono], [NumeroTelefono], [FecBaja]) VALUES (4, 4, N'Olivia', N'Gonchale', NULL, 23989456, 1, N'Olivia@hotmail.com', N'river2020', 1, 22038788, NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [IdTipoUsuario], [Nombre], [Apellido], [IdTipoDeDocumento], [NumeroDocumento], [IdSexo], [Email], [Password], [IdTipoTelefono], [NumeroTelefono], [FecBaja]) VALUES (5, 4, N'lisa', N'simpson', NULL, 23987563, 1, N'lisasimpson@gmail.com', N'ayudantedesanta', 2, 1178673333, NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [IdTipoUsuario], [Nombre], [Apellido], [IdTipoDeDocumento], [NumeroDocumento], [IdSexo], [Email], [Password], [IdTipoTelefono], [NumeroTelefono], [FecBaja]) VALUES (6, 4, N'Carlos', N'Baez', NULL, 28178276, 2, N'elcuervo@gmail.com', N'elcurevo2020', 1, 220482939, NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [IdTipoUsuario], [Nombre], [Apellido], [IdTipoDeDocumento], [NumeroDocumento], [IdSexo], [Email], [Password], [IdTipoTelefono], [NumeroTelefono], [FecBaja]) VALUES (7, 4, N'lucia', N'perreira', NULL, 22897346, 1, N'luciaperreira@hotmail.com', N'luismiguel20', 2, 1156762398, NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [IdTipoUsuario], [Nombre], [Apellido], [IdTipoDeDocumento], [NumeroDocumento], [IdSexo], [Email], [Password], [IdTipoTelefono], [NumeroTelefono], [FecBaja]) VALUES (8, 4, N'leonardo', N'gutierrez', NULL, 23989455, 2, N'leonardo@gmail.com', N'leonardo4', 2, 1145678932, NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [IdTipoUsuario], [Nombre], [Apellido], [IdTipoDeDocumento], [NumeroDocumento], [IdSexo], [Email], [Password], [IdTipoTelefono], [NumeroTelefono], [FecBaja]) VALUES (9, 4, N'roberto', N'petinato', NULL, 29017810, 2, N'roberto@helper.com.ar', N'limpiaalfombras', 1, 1156238934, NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [IdTipoUsuario], [Nombre], [Apellido], [IdTipoDeDocumento], [NumeroDocumento], [IdSexo], [Email], [Password], [IdTipoTelefono], [NumeroTelefono], [FecBaja]) VALUES (10, 4, N'lourdes', N'lopez', NULL, 29768165, 1, N'lourdes@gmail.com', N'soygallina', 2, 1189765499, NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [IdTipoUsuario], [Nombre], [Apellido], [IdTipoDeDocumento], [NumeroDocumento], [IdSexo], [Email], [Password], [IdTipoTelefono], [NumeroTelefono], [FecBaja]) VALUES (11, 4, N'marcos antonio', N'lopez', NULL, 19435786, 2, N'marantony@helper.com.ar', N'alfombras', 2, 1137484771, NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [IdTipoUsuario], [Nombre], [Apellido], [IdTipoDeDocumento], [NumeroDocumento], [IdSexo], [Email], [Password], [IdTipoTelefono], [NumeroTelefono], [FecBaja]) VALUES (12, 4, N'rosa', N'plumero', NULL, 5782675, 1, N'rosa@helper.com.ar', N'plumero', 1, 1176445555, NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [IdTipoUsuario], [Nombre], [Apellido], [IdTipoDeDocumento], [NumeroDocumento], [IdSexo], [Email], [Password], [IdTipoTelefono], [NumeroTelefono], [FecBaja]) VALUES (13, 4, N'Guillermo', N'Falcon', NULL, 27865390, 2, N'guillermo222@gmail.com', N'guillermo222', 1, 2374545, NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [IdTipoUsuario], [Nombre], [Apellido], [IdTipoDeDocumento], [NumeroDocumento], [IdSexo], [Email], [Password], [IdTipoTelefono], [NumeroTelefono], [FecBaja]) VALUES (14, 4, N'laura', N'lopez', NULL, 28768234, 1, N'lauralopez@gmail.com', N'perritos2020', 2, 1155909767, NULL)
SET IDENTITY_INSERT [dbo].[Usuario] OFF
INSERT [dbo].[UsuarioDireccion] ([IdUsuario], [IdDireccion], [NumeroDocumento], [Fecha]) VALUES (3, 2, 3348492, CAST(N'2020-06-04T21:50:00.347' AS DateTime))
INSERT [dbo].[UsuarioDireccion] ([IdUsuario], [IdDireccion], [NumeroDocumento], [Fecha]) VALUES (4, 3, 23989456, CAST(N'2020-06-04T21:50:00.347' AS DateTime))
INSERT [dbo].[UsuarioDireccion] ([IdUsuario], [IdDireccion], [NumeroDocumento], [Fecha]) VALUES (5, 4, 23987563, CAST(N'2020-06-04T21:50:00.347' AS DateTime))
INSERT [dbo].[UsuarioDireccion] ([IdUsuario], [IdDireccion], [NumeroDocumento], [Fecha]) VALUES (6, 5, 28178276, NULL)
INSERT [dbo].[UsuarioDireccion] ([IdUsuario], [IdDireccion], [NumeroDocumento], [Fecha]) VALUES (8, 7, 23989455, CAST(N'2020-06-04T22:13:57.130' AS DateTime))
INSERT [dbo].[UsuarioDireccion] ([IdUsuario], [IdDireccion], [NumeroDocumento], [Fecha]) VALUES (9, 8, 29017810, CAST(N'2020-06-05T08:24:54.883' AS DateTime))
INSERT [dbo].[UsuarioDireccion] ([IdUsuario], [IdDireccion], [NumeroDocumento], [Fecha]) VALUES (10, 9, 29768165, CAST(N'2020-06-05T09:10:04.830' AS DateTime))
INSERT [dbo].[UsuarioDireccion] ([IdUsuario], [IdDireccion], [NumeroDocumento], [Fecha]) VALUES (11, 10, 19435786, CAST(N'2020-06-05T09:17:24.373' AS DateTime))
INSERT [dbo].[UsuarioDireccion] ([IdUsuario], [IdDireccion], [NumeroDocumento], [Fecha]) VALUES (12, 11, 5782675, CAST(N'2020-06-05T10:24:03.793' AS DateTime))
INSERT [dbo].[UsuarioDireccion] ([IdUsuario], [IdDireccion], [NumeroDocumento], [Fecha]) VALUES (13, 12, 27865390, CAST(N'2020-08-18T10:34:59.213' AS DateTime))
INSERT [dbo].[UsuarioDireccion] ([IdUsuario], [IdDireccion], [NumeroDocumento], [Fecha]) VALUES (14, 13, 28768234, CAST(N'2020-08-18T11:20:31.480' AS DateTime))
ALTER TABLE [dbo].[OrdenDeTrabajo] ADD  CONSTRAINT [DF_OrdenDeTrabajo_Fecha]  DEFAULT (getdate()) FOR [Fecha]
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
ALTER TABLE [dbo].[FamiliaUsuario]  WITH CHECK ADD  CONSTRAINT [FK_FamiliaUsuario_Usuario] FOREIGN KEY([IdFamilia])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[FamiliaUsuario] CHECK CONSTRAINT [FK_FamiliaUsuario_Usuario]
GO
ALTER TABLE [dbo].[ItemOrdenDeTrabajo]  WITH CHECK ADD  CONSTRAINT [FK_ItemOrdenDeTrabajo_OrdenDeTrabajo] FOREIGN KEY([IdOrdenDeTrabajo])
REFERENCES [dbo].[OrdenDeTrabajo] ([IdOrdenDeTrabajo])
GO
ALTER TABLE [dbo].[ItemOrdenDeTrabajo] CHECK CONSTRAINT [FK_ItemOrdenDeTrabajo_OrdenDeTrabajo]
GO
ALTER TABLE [dbo].[ItemOrdenDeTrabajo]  WITH CHECK ADD  CONSTRAINT [FK_ItemOrdenDeTrabajo_Servicio] FOREIGN KEY([IdServicio])
REFERENCES [dbo].[Servicio] ([IdServicio])
GO
ALTER TABLE [dbo].[ItemOrdenDeTrabajo] CHECK CONSTRAINT [FK_ItemOrdenDeTrabajo_Servicio]
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
/****** Object:  StoredProcedure [dbo].[BaseDatosRespaldar]    Script Date: 22/8/2020 10:46:03 ******/
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
/****** Object:  StoredProcedure [dbo].[BitacoraLogInsert]    Script Date: 22/8/2020 10:46:03 ******/
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
/****** Object:  StoredProcedure [dbo].[BitacoraLogSelect]    Script Date: 22/8/2020 10:46:03 ******/
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
/****** Object:  StoredProcedure [dbo].[BitacoraLogSelectAll]    Script Date: 22/8/2020 10:46:03 ******/
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
/****** Object:  StoredProcedure [dbo].[BitacoraLogUPDATE]    Script Date: 22/8/2020 10:46:03 ******/
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
/****** Object:  StoredProcedure [dbo].[BitacoraVerLogs]    Script Date: 22/8/2020 10:46:03 ******/
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
/****** Object:  StoredProcedure [dbo].[BuscarUsuario]    Script Date: 22/8/2020 10:46:03 ******/
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
/****** Object:  StoredProcedure [dbo].[DireccionInsert]    Script Date: 22/8/2020 10:46:03 ******/
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
/****** Object:  StoredProcedure [dbo].[DireccionSelectByNumeroDocumento]    Script Date: 22/8/2020 10:46:03 ******/
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
/****** Object:  StoredProcedure [dbo].[DireccionUsuarioInsert]    Script Date: 22/8/2020 10:46:03 ******/
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
/****** Object:  StoredProcedure [dbo].[FamiliaSelectNombreFamiliaByIdUsuario]    Script Date: 22/8/2020 10:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[FamiliaSelectNombreFamiliaByIdUsuario](

@IdUsuario int

)

AS

SET NOCOUNT ON

SELECT Fam.IdFamilia, Fam.NombreFamilia
FROM Familia Fam
INNER JOIN FamiliaUsuario UF ON UF.IdFamilia = Fam.IdFamilia
INNER JOIN Usuario US ON US.IdUsuario = UF.IdUsuario  AND US.Apellido  = UF.NombreUsuario
WHERE US.IdUsuario = @IdUsuario
and US.FecBaja is null
and Fam.FecBaja is null
and UF.FecBaja is null
GO
/****** Object:  StoredProcedure [dbo].[FamiliaTraerFamiliasHijas]    Script Date: 22/8/2020 10:46:03 ******/
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
/****** Object:  StoredProcedure [dbo].[FamiliaTraerPatentes]    Script Date: 22/8/2020 10:46:03 ******/
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
/****** Object:  StoredProcedure [dbo].[FamiliaUsuariosAsociados]    Script Date: 22/8/2020 10:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[FamiliaUsuariosAsociados]

(
	@IdFamilia int,
	@IdUsuario int
	
)


AS
BEGIN


SELECT *
FROM usuario us
WHERE us.Nombre in
	(
	 SELECT usfam.IdUsuario
	 FROM FamiliaUsuario usfam
	 WHERE usfam.IdFamilia = @IdFamilia
	  and usfam.IdUsuario=@IdUsuario
	
	)
and us.IdUsuario=@IdUsuario


END
GO
/****** Object:  StoredProcedure [dbo].[ItemDelete]    Script Date: 22/8/2020 10:46:03 ******/
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
/****** Object:  StoredProcedure [dbo].[ListaDeItemUpDate]    Script Date: 22/8/2020 10:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ListaDeItemUpDate]
(

@IdUsaurio int, 
@IdItemOrdenDeTrabajo int,
@Fecha date,
@Hora time

)
as begin 
update ItemOrdenDeTrabajo 
set 
 
	Fecha=@Fecha,
	
	Hora= @Hora 


	where IdItemOrdenDeTrabajo=@IdItemOrdenDeTrabajo and IdUsuario=@IdUsaurio

	end 
GO
/****** Object:  StoredProcedure [dbo].[ListaItemInsert]    Script Date: 22/8/2020 10:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[ListaItemInsert]

(

 @IdUsuario int,
 @NombreUsuario nvarchar(50),
 @IdServicio int,
 @IdOrdenDeTrabajo int

 

)
as SET NOCOUNT ON

insert into [ItemOrdenDeTrabajo]
(
[IdUsuario],
[NombreUsuario],
[IdServicio],
[IdOrdenDeTrabajo]


)

values
(


 @IdUsuario,
 @NombreUsuario,
 @IdServicio,
 @IdOrdenDeTrabajo
 

 )
SELECT SCOPE_IDENTITY()
GO
/****** Object:  StoredProcedure [dbo].[ListarDireccionbyIdUsuario]    Script Date: 22/8/2020 10:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ListarDireccionbyIdUsuario]

(
@IdUsuario int

)

as begin

select  ud.IdDireccion, d.Calle, d.Numero , d.Piso , d.Departamento, l.Descripcion  ,p.Descripcion , td.Descripcion 

from UsuarioDireccion as ud inner join Direccion as d on 

 ud.IdUsuario= @IdUsuario and ud.IdDireccion=d.IdDireccion

 inner join Localidad as l on d.IdLocalidad=l.IdLocalidad 

 inner join Provincia as p on d.IdProvincia=p.IdProvincia

 inner join TipoDireccion as td on d.IdTipoDireccion = td.IdTipoDireccion
end
GO
/****** Object:  StoredProcedure [dbo].[ListarIdItemByIdOrdenDeTrabajo]    Script Date: 22/8/2020 10:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ListarIdItemByIdOrdenDeTrabajo](

    @IdOrdenDeTrabajo int

)
as

begin
select odt.IdOrdenDeTrabajo 

from OrdenDeTrabajo as ODT inner join ItemOrdenDeTrabajo as ld  on

  ODT.IdOrdenDeTrabajo = @IdOrdenDeTrabajo and   ODT.IdOrdenDeTrabajo =ld.IdOrdenDeTrabajo 
  
    
end 
GO
/****** Object:  StoredProcedure [dbo].[ListarItemByIdOrdenDeTrabajo]    Script Date: 22/8/2020 10:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ListarItemByIdOrdenDeTrabajo](

    @IdOrdenDeTrabajo int

)
as

begin
select  ld.IdServicio

from OrdenDeTrabajo as ODT inner join ItemOrdenDeTrabajo as ld  on

  ODT.IdOrdenDeTrabajo = @IdOrdenDeTrabajo and   ODT.IdOrdenDeTrabajo =ld.IdOrdenDeTrabajo 
  
    
end 
GO
/****** Object:  StoredProcedure [dbo].[ListarItemByIdOrdenDeTrabajo2]    Script Date: 22/8/2020 10:46:03 ******/
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
/****** Object:  StoredProcedure [dbo].[ListarItemByNumeroDocumento]    Script Date: 22/8/2020 10:46:03 ******/
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
/****** Object:  StoredProcedure [dbo].[ListarLocalidad]    Script Date: 22/8/2020 10:46:03 ******/
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
/****** Object:  StoredProcedure [dbo].[ListarOrdenDeTrabajoActiva]    Script Date: 22/8/2020 10:46:03 ******/
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
/****** Object:  StoredProcedure [dbo].[ListarProvincias]    Script Date: 22/8/2020 10:46:03 ******/
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
/****** Object:  StoredProcedure [dbo].[ListarSexo]    Script Date: 22/8/2020 10:46:03 ******/
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
/****** Object:  StoredProcedure [dbo].[ListarTipoDireccion]    Script Date: 22/8/2020 10:46:03 ******/
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
/****** Object:  StoredProcedure [dbo].[ListarTipoDomicilio]    Script Date: 22/8/2020 10:46:03 ******/
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
/****** Object:  StoredProcedure [dbo].[ListarTipoTelefono]    Script Date: 22/8/2020 10:46:03 ******/
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
/****** Object:  StoredProcedure [dbo].[OrdenInsert]    Script Date: 22/8/2020 10:46:03 ******/
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
/****** Object:  StoredProcedure [dbo].[ServicioSelect]    Script Date: 22/8/2020 10:46:03 ******/
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
/****** Object:  StoredProcedure [dbo].[ServicioSelectAll]    Script Date: 22/8/2020 10:46:03 ******/
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
/****** Object:  StoredProcedure [dbo].[UsuarioInsert]    Script Date: 22/8/2020 10:46:03 ******/
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
	@NumeroTelefono int

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
	[NumeroTelefono]
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
	@NumeroTelefono
	
)

SELECT SCOPE_IDENTITY()


GO
/****** Object:  StoredProcedure [dbo].[UsuarioTraerFamilias]    Script Date: 22/8/2020 10:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[UsuarioTraerFamilias](
	@elNomUsuario varchar(100),
	@elIdUsuario int

)

AS
BEGIN

SELECT fam.IdFamilia, fam.NombreFamilia
FROM Familia fam
WHERE fam.IdFamilia IN 
	(	SELECT usfa.IdFamilia
		FROM FamiliaUsuario usfa
		WHERE usfa.NombreUsuario = @elNomUsuario
		and usfa.IdUsuario  = @elIdUsuario
	)

	
END
GO
/****** Object:  StoredProcedure [dbo].[UsuarioTraerPatentes]    Script Date: 22/8/2020 10:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[UsuarioTraerPatentes] (

	@elNomUsuario varchar(100),
	@elIdUsuario int
)

AS
BEGIN

SELECT pat.IdPatente, pat.NombrePatente
FROM Patente pat
WHERE pat.IdPatente IN 
	(	SELECT uspa.IdPatente
		FROM PatenteUsuario uspa
		WHERE uspa.NombreUsuario = @elNomUsuario
		and uspa.IdUsuario  = @elIdUsuario
	)

	
END
GO
USE [master]
GO
ALTER DATABASE [HelperDataBase] SET  READ_WRITE 
GO
