
-- Project 3: Financial Performance Analysis with SQL
-- Step 2: Financial KPI calculations
-- Source: Original TripleTen project exercise
--
-- Prerequisites:
-- pais_ingreso_costo and pais_campanas are intermediate
-- tables created in earlier stages of the project.
--
-- Note: roi_pct is the original exercise's column name.
-- Its formula measures gross profit relative to
-- campaign cost, not conventional net ROI.

SELECT
    p.pais,
    p.clave_territorio,

    SUM(p.ingresos)::integer AS ingresos,
    SUM(p.costos)::integer AS costos,

    COALESCE(
        SUM(c.costo_campana), 0
    )::integer AS costo_campana,

    SUM(p.ingresos)::integer
        - SUM(p.costos)::integer AS beneficio_bruto,

    (
        (SUM(p.ingresos) - SUM(p.costos)) * 100.0
    ) / NULLIF(SUM(p.ingresos), 0) AS margen_pct,

    (
        (SUM(p.ingresos) - SUM(p.costos)) * 100.0
    ) / NULLIF(SUM(c.costo_campana), 0) AS roi_pct

FROM pais_ingreso_costo AS p

LEFT JOIN pais_campanas AS c
    ON p.clave_territorio = c.clave_territorio

GROUP BY
    p.pais,
    p.clave_territorio

ORDER BY
    p.clave_territorio,
    ingresos,
    costos;
