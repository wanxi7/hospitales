--1
select *
from [dbo].[M�DICOS]

SELECT [NombredelM�dico], [ApellidosdelM�dico]
FROM [dbo].[M�DICOS]
WHERE Especialidad LIKE 'Pediatr�a%'

--2
SELECT [Nombre]
FROM [dbo].[PACIENTES]
WHERE Poblaci�n LIKE 'Madrid'

DBCC USEROPTIONS

--3
SELECT [NombredelM�dico]
FROM [dbo].[M�DICOS] AS M
JOIN [dbo].[INGRESOS] AS I
ON M.CodigoIdentificaci�n = I.C�digodeIdentificador
WHERE I.FechadeIngreso > '01/01/2010' AND I.FechadeIngreso < '01/02/2010'

--4
SELECT P.Nombre, P.ApellidoS
FROM [dbo].[PACIENTES] AS P
JOIN [dbo].[INGRESOS] AS I
ON P.N�merodeHistorial = I.N�merodeHistorial
WHERE I.FechadeIngreso > '01/02/2009' AND I.FechadeIngreso < '01/05/2009' AND I.Al�rgico LIKE 'Si'

--5
SELECT P.Nombre
FROM [dbo].[M�DICOS] AS M
JOIN [dbo].[INGRESOS] AS I
ON M.CodigoIdentificaci�n = I.C�digodeIdentificador
JOIN [dbo].[PACIENTES] AS P
ON P.N�merodeHistorial = I.N�merodeHistorial
WHERE [NombredelM�dico] = 'Antonio' AND [ApellidosdelM�dico] = 'Ja�n Hern�ndez'

CREATE PROCEDURE pr_Medicos
@p_CodigoIdentificaci�n varchar(4),
@p_NombredelM�dico varchar(25),
@p_ApellidosdelM�dico varchar (25),
@p_Especialidad varchar (25),
@p_FechaTomaPosesi�n varchar (25),
@p_Cargo varchar (25),
@p_N�merodeColegiado int,
@p_Observaciones varchar (6000),
@error int
AS
	BEGIN 
		IF @p_N�merodeColegiado > 1000
		BEGIN
			SET @error = 1
		END
	END

CREATE PROCEDURE p_MostrarPacientesIngresados
@p_Fecha0 date,
@p_Fecha1 date
AS

BEGIN

		SELECT P.NSeguridadSocial,P.Nombre,P.Apellidos,P.Domicilio,P.Poblaci�n,P.Provincia,P.C�digoPostal,P.Tel�fono,P.N�merodeHistorial,P.Sexo
		FROM [dbo].[PACIENTES] AS P
		JOIN [dbo].[INGRESOS] AS I 
		ON P.N�merodeHistorial = I.N�merodeHistorial
		WHERE I.FechadeIngreso > @p_Fecha0 AND  I.FechadeIngreso > @p_Fecha1
END

        exec p_MostrarPacientesIngresados '1/1/2009',' 1/2/2009'