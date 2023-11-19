Use master
Go
IF DB_ID('Consulta_Operadores_Comercio_Exterior') IS NOT NULL
BEGIN
    -- Eliminar la base de datos si existe
    EXEC msdb.dbo.sp_delete_database_backuphistory @database_name = 'Consulta_Operadores_Comercio_Exterior'
    ALTER DATABASE [Consulta_Operadores_Comercio_Exterior] SET SINGLE_USER WITH ROLLBACK IMMEDIATE
    DROP DATABASE [Consulta_Operadores_Comercio_Exterior]
END
Go

-- Crear la base de datos
CREATE DATABASE [Consulta_Operadores_Comercio_Exterior]
GO
Use Consulta_Operadores_Comercio_Exterior
go

/*
 * ER/Studio 8.0 SQL Code Generation
 * Company :      HP Inc.
 * Project :      Propuesta1.DM1
 * Author :       oscarrodrigogamezbalmaceda@hotmail.com
 *
 * Date Created : Sunday, June 18, 2023 18:39:28
 * Target DBMS : Microsoft SQL Server 2008
 */

/* 
 * TABLE: Aduana 
 */

CREATE TABLE Aduana(
    Id_Aduana    int             IDENTITY(1,1),
    Aduana       varchar(100)    NOT NULL,
    CONSTRAINT PK__Aduana__F710AD5D6A1B107A PRIMARY KEY NONCLUSTERED (Id_Aduana)
)
go



IF OBJECT_ID('Aduana') IS NOT NULL
    PRINT '<<< CREATED TABLE Aduana >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Aduana >>>'
go

/* 
 * TABLE: Declaracion 
 */

CREATE TABLE Declaracion(
    Id_Declaracion          int            IDENTITY(1,1),
    Id_Aduana               int            NULL,
    Id_Usuario              varchar(15)    NULL,
    Id_Regimen              int            NULL,
    Id_EstadoDeclaracion    int            NULL,
    CONSTRAINT PK__Declarac__13291DE9CFD1D619 PRIMARY KEY NONCLUSTERED (Id_Declaracion)
)
go



IF OBJECT_ID('Declaracion') IS NOT NULL
    PRINT '<<< CREATED TABLE Declaracion >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Declaracion >>>'
go

/* 
 * TABLE: Estado_Declaracion 
 */

CREATE TABLE Estado_Declaracion(
    Id_EstadoDeclaracion    int             IDENTITY(1,1),
    Estado                  varchar(100)    NULL,
    CONSTRAINT PK__Estado_D__29C14B675A3D47D0 PRIMARY KEY NONCLUSTERED (Id_EstadoDeclaracion)
)
go



IF OBJECT_ID('Estado_Declaracion') IS NOT NULL
    PRINT '<<< CREATED TABLE Estado_Declaracion >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Estado_Declaracion >>>'
go

/* 
 * TABLE: Estado_Tramite 
 */

CREATE TABLE Estado_Tramite(
    Id_EstadoTramite    int            IDENTITY(1,1),
    Estado_Tramite      varchar(50)    NULL,
    CONSTRAINT PK__Estado_T__B9E5A24CF3C0369F PRIMARY KEY NONCLUSTERED (Id_EstadoTramite)
)
go



IF OBJECT_ID('Estado_Tramite') IS NOT NULL
    PRINT '<<< CREATED TABLE Estado_Tramite >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Estado_Tramite >>>'
go

/* 
 * TABLE: EstadoAdeudo 
 */

CREATE TABLE EstadoAdeudo(
    Id_EstadoAdeudo    int            IDENTITY(1,1),
    EstadoAdeudo       varchar(50)    NULL,
    CONSTRAINT PK__EstadoAd__1EF0EA7337B37431 PRIMARY KEY NONCLUSTERED (Id_EstadoAdeudo)
)
go



IF OBJECT_ID('EstadoAdeudo') IS NOT NULL
    PRINT '<<< CREATED TABLE EstadoAdeudo >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE EstadoAdeudo >>>'
go

/* 
 * TABLE: EstadoAuditoria 
 */

CREATE TABLE EstadoAuditoria(
    Id_EstadoAuditoria    int             IDENTITY(1,1),
    EstadoAuditoria       varchar(100)    NULL,
    CONSTRAINT PK__EstadoAu__F0EFCC6EC5734D4F PRIMARY KEY NONCLUSTERED (Id_EstadoAuditoria)
)
go



IF OBJECT_ID('EstadoAuditoria') IS NOT NULL
    PRINT '<<< CREATED TABLE EstadoAuditoria >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE EstadoAuditoria >>>'
go

/* 
 * TABLE: EstadoRecurso 
 */

CREATE TABLE EstadoRecurso(
    Id_EstadoRecurso    int            IDENTITY(1,1),
    EstadoRecurso       varchar(50)    NULL,
    CONSTRAINT PK__EstadoRe__19B0183C1076D2C7 PRIMARY KEY NONCLUSTERED (Id_EstadoRecurso)
)
go



IF OBJECT_ID('EstadoRecurso') IS NOT NULL
    PRINT '<<< CREATED TABLE EstadoRecurso >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE EstadoRecurso >>>'
go

/* 
 * TABLE: EstadoSolicitud 
 */

CREATE TABLE EstadoSolicitud(
    Id_EstadoSolicitud    int             IDENTITY(1,1),
    EstadoSolicitud       varchar(100)    NULL,
    CONSTRAINT PK__EstadoSo__C67C98571A7669FE PRIMARY KEY NONCLUSTERED (Id_EstadoSolicitud)
)
go



IF OBJECT_ID('EstadoSolicitud') IS NOT NULL
    PRINT '<<< CREATED TABLE EstadoSolicitud >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE EstadoSolicitud >>>'
go

/* 
 * TABLE: FormaAuditoria 
 */

CREATE TABLE FormaAuditoria(
    Id_FormaAuditoria    int             IDENTITY(1,1),
    FormaAuditoria       varchar(100)    NULL,
    CONSTRAINT PK__FormaAud__426C2734E6D76E0B PRIMARY KEY NONCLUSTERED (Id_FormaAuditoria)
)
go



IF OBJECT_ID('FormaAuditoria') IS NOT NULL
    PRINT '<<< CREATED TABLE FormaAuditoria >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE FormaAuditoria >>>'
go

/* 
 * TABLE: FT_Detalle_Adeudo 
 */

CREATE TABLE FT_Detalle_Adeudo(
    Id_RegistroAdeudo    int      NULL,
    Monto                float    NOT NULL
)
go



IF OBJECT_ID('FT_Detalle_Adeudo') IS NOT NULL
    PRINT '<<< CREATED TABLE FT_Detalle_Adeudo >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE FT_Detalle_Adeudo >>>'
go

/* 
 * TABLE: IdentificadorTipoRecurso 
 */

CREATE TABLE IdentificadorTipoRecurso(
    Id_IdentificadorTipoRecurso    int            IDENTITY(1,1),
    TipoRecurso                    varchar(30)    NULL,
    CONSTRAINT PK__Identifi__129A7F5E9AA71EA7 PRIMARY KEY NONCLUSTERED (Id_IdentificadorTipoRecurso)
)
go



IF OBJECT_ID('IdentificadorTipoRecurso') IS NOT NULL
    PRINT '<<< CREATED TABLE IdentificadorTipoRecurso >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE IdentificadorTipoRecurso >>>'
go

/* 
 * TABLE: MotivoAdeudo 
 */

CREATE TABLE MotivoAdeudo(
    Id_MotivoAdeudo    int             IDENTITY(1,1),
    MotivoAdeudo       varchar(100)    NULL,
    CONSTRAINT PK__MotivoAd__886054A62CBBDD8F PRIMARY KEY NONCLUSTERED (Id_MotivoAdeudo)
)
go



IF OBJECT_ID('MotivoAdeudo') IS NOT NULL
    PRINT '<<< CREATED TABLE MotivoAdeudo >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE MotivoAdeudo >>>'
go

/* 
 * TABLE: MotivoDevolucion 
 */

CREATE TABLE MotivoDevolucion(
    Id_MotivoDevolucion    int             IDENTITY(1,1),
    Motivo                 varchar(100)    NULL,
    CONSTRAINT PK__MotivoDe__C141B10E04774C37 PRIMARY KEY NONCLUSTERED (Id_MotivoDevolucion)
)
go



IF OBJECT_ID('MotivoDevolucion') IS NOT NULL
    PRINT '<<< CREATED TABLE MotivoDevolucion >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE MotivoDevolucion >>>'
go

/* 
 * TABLE: RazonDenominacionSocial 
 */

CREATE TABLE RazonDenominacionSocial(
    Id_TipoRazon    int            IDENTITY(1,1),
    Tipo_Razon      varchar(30)    NOT NULL,
    CONSTRAINT PK__RazonDen__817AF0BB44F32A4F PRIMARY KEY NONCLUSTERED (Id_TipoRazon)
)
go



IF OBJECT_ID('RazonDenominacionSocial') IS NOT NULL
    PRINT '<<< CREATED TABLE RazonDenominacionSocial >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE RazonDenominacionSocial >>>'
go

/* 
 * TABLE: Regimen 
 */

CREATE TABLE Regimen(
    Id_Regimen    int             IDENTITY(1,1),
    Regimen       varchar(100)    NULL,
    CONSTRAINT PK__Regimen__601ADA63C2007AF4 PRIMARY KEY NONCLUSTERED (Id_Regimen)
)
go



IF OBJECT_ID('Regimen') IS NOT NULL
    PRINT '<<< CREATED TABLE Regimen >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Regimen >>>'
go

/* 
 * TABLE: RegistroAdeudo 
 */

CREATE TABLE RegistroAdeudo(
    Id_RegistroAdeudo       int         IDENTITY(1,1),
    FechaAdeudo             datetime    NULL,
    Id_TipoAdeudo           int         NULL,
    Id_MotivoAdeudo         int         NULL,
    Id_EstadoAdeudo         int         NULL,
    Id_Declaracion          int         NULL,
    Id_RegistroAuditoria    int         NULL,
    CONSTRAINT PK__Registro__11530C357C78531C PRIMARY KEY NONCLUSTERED (Id_RegistroAdeudo)
)
go



IF OBJECT_ID('RegistroAdeudo') IS NOT NULL
    PRINT '<<< CREATED TABLE RegistroAdeudo >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE RegistroAdeudo >>>'
go

/* 
 * TABLE: RegistroAuditoria 
 */

CREATE TABLE RegistroAuditoria(
    Id_RegistroAuditoria    int    IDENTITY(1,1),
    Id_Declaracion          int    NOT NULL,
    Id_TipoAuditoria        int    NULL,
    Id_FormaAuditoria       int    NULL,
    Id_EstadoAuditoria      int    NULL,
    CONSTRAINT PK__Registro__2EAAA2A254E10C2D PRIMARY KEY NONCLUSTERED (Id_RegistroAuditoria)
)
go



IF OBJECT_ID('RegistroAuditoria') IS NOT NULL
    PRINT '<<< CREATED TABLE RegistroAuditoria >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE RegistroAuditoria >>>'
go

/* 
 * TABLE: RegistroRecurso 
 */

CREATE TABLE RegistroRecurso(
    Id_RegistroRecurso     int    IDENTITY(1,1),
    Id_Recurso             int    NULL,
    Id_EstadoRecurso       int    NULL,
    Id_RegistroAdeudo      int    NULL,
    Id_RegistroTramites    int    NOT NULL,
    CONSTRAINT PK__Registro__DF8E11BC8527528A PRIMARY KEY NONCLUSTERED (Id_RegistroRecurso)
)
go



IF OBJECT_ID('RegistroRecurso') IS NOT NULL
    PRINT '<<< CREATED TABLE RegistroRecurso >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE RegistroRecurso >>>'
go

/* 
 * TABLE: RegistroSolicitud 
 */

CREATE TABLE RegistroSolicitud(
    Id_RegistroSolicitud              int             IDENTITY(1,1),
    MontoSolicitado                   float           NULL,
    DeclaracionMercanciasAsociadas    varchar(100)    NULL,
    Id_MotivoSolicitud                int             NULL,
    Id_EstadoSolicitud                int             NULL,
    Id_RegistroAdeudo                 int             NOT NULL,
    CONSTRAINT PK__Registro__A23A56CD73F10379 PRIMARY KEY NONCLUSTERED (Id_RegistroSolicitud)
)
go



IF OBJECT_ID('RegistroSolicitud') IS NOT NULL
    PRINT '<<< CREATED TABLE RegistroSolicitud >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE RegistroSolicitud >>>'
go

/* 
 * TABLE: RegistroTramitesEfecutados 
 */

CREATE TABLE RegistroTramitesEfecutados(
    Id_RegistroTramites    int    IDENTITY(1,1),
    Id_Tramite             int    NULL,
    Id_Declaracion         int    NOT NULL,
    Id_EstadoTramite       int    NOT NULL,
    CONSTRAINT PK__Registro__3615453BAABB678E PRIMARY KEY NONCLUSTERED (Id_RegistroTramites)
)
go



IF OBJECT_ID('RegistroTramitesEfecutados') IS NOT NULL
    PRINT '<<< CREATED TABLE RegistroTramitesEfecutados >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE RegistroTramitesEfecutados >>>'
go

/* 
 * TABLE: TipoActividadEconomica 
 */

CREATE TABLE TipoActividadEconomica(
    Id_TipoActividad    int             IDENTITY(1,1),
    Actividad           varchar(100)    NOT NULL,
    CONSTRAINT PK__TipoActi__DB3D9061BEC5903F PRIMARY KEY NONCLUSTERED (Id_TipoActividad)
)
go



IF OBJECT_ID('TipoActividadEconomica') IS NOT NULL
    PRINT '<<< CREATED TABLE TipoActividadEconomica >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE TipoActividadEconomica >>>'
go

/* 
 * TABLE: TipoAdeudo 
 */

CREATE TABLE TipoAdeudo(
    Id_TipoAdeudo    int             IDENTITY(1,1),
    TipoAdeudo       varchar(100)    NULL,
    CONSTRAINT PK__TipoAdeu__B710ED8877FF8E18 PRIMARY KEY NONCLUSTERED (Id_TipoAdeudo)
)
go



IF OBJECT_ID('TipoAdeudo') IS NOT NULL
    PRINT '<<< CREATED TABLE TipoAdeudo >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE TipoAdeudo >>>'
go

/* 
 * TABLE: TipoAuditoria 
 */

CREATE TABLE TipoAuditoria(
    Id_TipoAuditoria    int             IDENTITY(1,1),
    TipoAuditoria       varchar(100)    NULL,
    CONSTRAINT PK__TipoAudi__260A02A032BC2E5E PRIMARY KEY NONCLUSTERED (Id_TipoAuditoria)
)
go



IF OBJECT_ID('TipoAuditoria') IS NOT NULL
    PRINT '<<< CREATED TABLE TipoAuditoria >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE TipoAuditoria >>>'
go

/* 
 * TABLE: TipoEstado 
 */

CREATE TABLE TipoEstado(
    Id_TipoEstado    int            IDENTITY(1,1),
    Estado           varchar(15)    NOT NULL,
    CONSTRAINT PK__TipoEsta__0B0CCC55D0A192C1 PRIMARY KEY NONCLUSTERED (Id_TipoEstado)
)
go



IF OBJECT_ID('TipoEstado') IS NOT NULL
    PRINT '<<< CREATED TABLE TipoEstado >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE TipoEstado >>>'
go

/* 
 * TABLE: TipoPersona_Exportador_Importador 
 */

CREATE TABLE TipoPersona_Exportador_Importador(
    Id_TipoPersona    int            IDENTITY(1,1),
    Tipo_Persona      varchar(30)    NOT NULL,
    CONSTRAINT PK__TipoPers__64B4F253ECFE21DD PRIMARY KEY NONCLUSTERED (Id_TipoPersona)
)
go



IF OBJECT_ID('TipoPersona_Exportador_Importador') IS NOT NULL
    PRINT '<<< CREATED TABLE TipoPersona_Exportador_Importador >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE TipoPersona_Exportador_Importador >>>'
go

/* 
 * TABLE: Tramites 
 */

CREATE TABLE Tramites(
    Id_Tramite    int             IDENTITY(1,1),
    Tramite       varchar(500)    NULL,
    CONSTRAINT PK__Tramites__61E8232CB4707338 PRIMARY KEY NONCLUSTERED (Id_Tramite)
)
go



IF OBJECT_ID('Tramites') IS NOT NULL
    PRINT '<<< CREATED TABLE Tramites >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Tramites >>>'
go

/* 
 * TABLE: Usuario 
 */

CREATE TABLE Usuario(
    RUC                 varchar(15)     NOT NULL,
    Nombre              varchar(50)     NOT NULL,
    Id_TipoRazon        int             NULL,
    Id_TipoEstado       int             NULL,
    Id_TipoPersona      int             NULL,
    Id_TipoActividad    int             NULL,
    Domicilio           varchar(100)    NOT NULL,
    Telefono            varchar(20)     NOT NULL,
    Correo              varchar(50)     NOT NULL,
    CONSTRAINT PK__Usuario__CAF3326A61869B09 PRIMARY KEY NONCLUSTERED (RUC)
)
go



IF OBJECT_ID('Usuario') IS NOT NULL
    PRINT '<<< CREATED TABLE Usuario >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Usuario >>>'
go

/* 
 * TABLE: Declaracion 
 */

ALTER TABLE Declaracion ADD CONSTRAINT FK__Declaraci__Id_Ad__4BAC3F29 
    FOREIGN KEY (Id_Aduana)
    REFERENCES Aduana(Id_Aduana)
go

ALTER TABLE Declaracion ADD CONSTRAINT FK__Declaraci__Id_Es__4E88ABD4 
    FOREIGN KEY (Id_EstadoDeclaracion)
    REFERENCES Estado_Declaracion(Id_EstadoDeclaracion)
go

ALTER TABLE Declaracion ADD CONSTRAINT FK__Declaraci__Id_Re__4D94879B 
    FOREIGN KEY (Id_Regimen)
    REFERENCES Regimen(Id_Regimen)
go

ALTER TABLE Declaracion ADD CONSTRAINT FK__Declaraci__Id_Us__4CA06362 
    FOREIGN KEY (Id_Usuario)
    REFERENCES Usuario(RUC)
go


/* 
 * TABLE: FT_Detalle_Adeudo 
 */

ALTER TABLE FT_Detalle_Adeudo ADD CONSTRAINT RefRegistroAdeudo34 
    FOREIGN KEY (Id_RegistroAdeudo)
    REFERENCES RegistroAdeudo(Id_RegistroAdeudo)
go


/* 
 * TABLE: RegistroAdeudo 
 */

ALTER TABLE RegistroAdeudo ADD CONSTRAINT RefDeclaracion31 
    FOREIGN KEY (Id_Declaracion)
    REFERENCES Declaracion(Id_Declaracion)
go

ALTER TABLE RegistroAdeudo ADD CONSTRAINT RefRegistroAuditoria32 
    FOREIGN KEY (Id_RegistroAuditoria)
    REFERENCES RegistroAuditoria(Id_RegistroAuditoria)
go

ALTER TABLE RegistroAdeudo ADD CONSTRAINT FK__RegistroA__Id_Es__60A75C0F 
    FOREIGN KEY (Id_EstadoAdeudo)
    REFERENCES EstadoAdeudo(Id_EstadoAdeudo)
go

ALTER TABLE RegistroAdeudo ADD CONSTRAINT FK__RegistroA__Id_Mo__5FB337D6 
    FOREIGN KEY (Id_MotivoAdeudo)
    REFERENCES MotivoAdeudo(Id_MotivoAdeudo)
go

ALTER TABLE RegistroAdeudo ADD CONSTRAINT FK__RegistroA__Id_Ti__5EBF139D 
    FOREIGN KEY (Id_TipoAdeudo)
    REFERENCES TipoAdeudo(Id_TipoAdeudo)
go


/* 
 * TABLE: RegistroAuditoria 
 */

ALTER TABLE RegistroAuditoria ADD CONSTRAINT RefDeclaracion40 
    FOREIGN KEY (Id_Declaracion)
    REFERENCES Declaracion(Id_Declaracion)
go

ALTER TABLE RegistroAuditoria ADD CONSTRAINT FK__RegistroA__Id_Es__5AEE82B9 
    FOREIGN KEY (Id_EstadoAuditoria)
    REFERENCES EstadoAuditoria(Id_EstadoAuditoria)
go

ALTER TABLE RegistroAuditoria ADD CONSTRAINT FK__RegistroA__Id_Fo__59FA5E80 
    FOREIGN KEY (Id_FormaAuditoria)
    REFERENCES FormaAuditoria(Id_FormaAuditoria)
go

ALTER TABLE RegistroAuditoria ADD CONSTRAINT FK__RegistroA__Id_Ti__59063A47 
    FOREIGN KEY (Id_TipoAuditoria)
    REFERENCES TipoAuditoria(Id_TipoAuditoria)
go


/* 
 * TABLE: RegistroRecurso 
 */

ALTER TABLE RegistroRecurso ADD CONSTRAINT RefRegistroTramitesEfecutados41 
    FOREIGN KEY (Id_RegistroTramites)
    REFERENCES RegistroTramitesEfecutados(Id_RegistroTramites)
go

ALTER TABLE RegistroRecurso ADD CONSTRAINT FK__RegistroR__Id_Es__66603565 
    FOREIGN KEY (Id_EstadoRecurso)
    REFERENCES EstadoRecurso(Id_EstadoRecurso)
go

ALTER TABLE RegistroRecurso ADD CONSTRAINT FK__RegistroR__Id_Re__656C112C 
    FOREIGN KEY (Id_Recurso)
    REFERENCES IdentificadorTipoRecurso(Id_IdentificadorTipoRecurso)
go

ALTER TABLE RegistroRecurso ADD CONSTRAINT FK__RegistroR__Id_Re__6754599E 
    FOREIGN KEY (Id_RegistroAdeudo)
    REFERENCES RegistroAdeudo(Id_RegistroAdeudo)
go


/* 
 * TABLE: RegistroSolicitud 
 */

ALTER TABLE RegistroSolicitud ADD CONSTRAINT RefRegistroAdeudo42 
    FOREIGN KEY (Id_RegistroAdeudo)
    REFERENCES RegistroAdeudo(Id_RegistroAdeudo)
go

ALTER TABLE RegistroSolicitud ADD CONSTRAINT FK__RegistroS__Id_Es__6C190EBB 
    FOREIGN KEY (Id_EstadoSolicitud)
    REFERENCES EstadoSolicitud(Id_EstadoSolicitud)
go

ALTER TABLE RegistroSolicitud ADD CONSTRAINT FK__RegistroS__Id_Mo__6B24EA82 
    FOREIGN KEY (Id_MotivoSolicitud)
    REFERENCES MotivoDevolucion(Id_MotivoDevolucion)
go


/* 
 * TABLE: RegistroTramitesEfecutados 
 */

ALTER TABLE RegistroTramitesEfecutados ADD CONSTRAINT RefDeclaracion39 
    FOREIGN KEY (Id_Declaracion)
    REFERENCES Declaracion(Id_Declaracion)
go

ALTER TABLE RegistroTramitesEfecutados ADD CONSTRAINT RefEstado_Tramite43 
    FOREIGN KEY (Id_EstadoTramite)
    REFERENCES Estado_Tramite(Id_EstadoTramite)
go

ALTER TABLE RegistroTramitesEfecutados ADD CONSTRAINT FK__RegistroT__Id_Tr__5535A963 
    FOREIGN KEY (Id_Tramite)
    REFERENCES Tramites(Id_Tramite)
go


/* 
 * TABLE: Usuario 
 */

ALTER TABLE Usuario ADD CONSTRAINT FK__Usuario__Id_Tipo__45F365D3 
    FOREIGN KEY (Id_TipoRazon)
    REFERENCES RazonDenominacionSocial(Id_TipoRazon)
go

ALTER TABLE Usuario ADD CONSTRAINT FK__Usuario__Id_Tipo__46E78A0C 
    FOREIGN KEY (Id_TipoEstado)
    REFERENCES TipoEstado(Id_TipoEstado)
go

ALTER TABLE Usuario ADD CONSTRAINT FK__Usuario__Id_Tipo__47DBAE45 
    FOREIGN KEY (Id_TipoPersona)
    REFERENCES TipoPersona_Exportador_Importador(Id_TipoPersona)
go

ALTER TABLE Usuario ADD CONSTRAINT FK__Usuario__Id_Tipo__48CFD27E 
    FOREIGN KEY (Id_TipoActividad)
    REFERENCES TipoActividadEconomica(Id_TipoActividad)
go


