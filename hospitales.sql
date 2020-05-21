--1
select *
from [dbo].[MÉDICOS]

SELECT [NombredelMédico], [ApellidosdelMédico]
FROM [dbo].[MÉDICOS]
WHERE Especialidad LIKE 'Pediatría%'

--2
SELECT [Nombre]
FROM [dbo].[PACIENTES]
WHERE Población LIKE 'Madrid'

DBCC USEROPTIONS

--3
SELECT [NombredelMédico]
FROM [dbo].[MÉDICOS] AS M
JOIN [dbo].[INGRESOS] AS I
ON M.CodigoIdentificación = I.CódigodeIdentificador
WHERE I.FechadeIngreso > '01/01/2010' AND I.FechadeIngreso < '01/02/2010'

--4
SELECT P.Nombre, P.ApellidoS
FROM [dbo].[PACIENTES] AS P
JOIN [dbo].[INGRESOS] AS I
ON P.NúmerodeHistorial = I.NúmerodeHistorial
WHERE I.FechadeIngreso > '01/02/2009' AND I.FechadeIngreso < '01/05/2009' AND I.Alérgico LIKE 'Si'

--5
SELECT P.Nombre
FROM [dbo].[MÉDICOS] AS M
JOIN [dbo].[INGRESOS] AS I
ON M.CodigoIdentificación = I.CódigodeIdentificador
JOIN [dbo].[PACIENTES] AS P
ON P.NúmerodeHistorial = I.NúmerodeHistorial
WHERE [NombredelMédico] = 'Antonio' AND [ApellidosdelMédico] = 'Jaén Hernández'

CREATE PROCEDURE pr_Medicos
@p_CodigoIdentificación varchar(4),
@p_NombredelMédico varchar(25),
@p_ApellidosdelMédico varchar (25),
@p_Especialidad varchar (25),
@p_FechaTomaPosesión varchar (25),
@p_Cargo varchar (25),
@p_NúmerodeColegiado int,
@p_Observaciones varchar (6000),
@error int
AS
	BEGIN 
		IF @p_NúmerodeColegiado > 1000
		BEGIN
			SET @error = 1
		END
	END

CREATE PROCEDURE p_MostrarPacientesIngresados
@p_Fecha0 date,
@p_Fecha1 date
AS

BEGIN

		SELECT P.NSeguridadSocial,P.Nombre,P.Apellidos,P.Domicilio,P.Población,P.Provincia,P.CódigoPostal,P.Teléfono,P.NúmerodeHistorial,P.Sexo
		FROM [dbo].[PACIENTES] AS P
		JOIN [dbo].[INGRESOS] AS I 
		ON P.NúmerodeHistorial = I.NúmerodeHistorial
		WHERE I.FechadeIngreso > @p_Fecha0 AND  I.FechadeIngreso > @p_Fecha1
END

        exec p_MostrarPacientesIngresados '1/1/2009',' 1/2/2009'