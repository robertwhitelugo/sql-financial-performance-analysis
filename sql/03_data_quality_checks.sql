
-- Project 3: Financial Performance Analysis with SQL
-- Step 3: Data Quality Checks
--
-- These checks follow the validation tasks from the
-- original TripleTen project.
--
-- The first two queries reconstruct the checks
-- described in the exercise instructions.
-- The third query comes from the original material.
--
-- Results should be reviewed before concluding
-- whether the data passed validation.


-- 1. Check missing values in key sales fields

SELECT
    SUM(CASE WHEN numero_pedido IS NULL
        THEN 1 ELSE 0 END) AS pedidos_nulos,

    SUM(CASE WHEN clave_producto IS NULL
        THEN 1 ELSE 0 END) AS productos_nulos,

    SUM(CASE WHEN clave_territorio IS NULL
        THEN 1 ELSE 0 END) AS territorios_nulos

FROM ventas_2017;


-- 2. Identify invalid order quantities

SELECT
    COUNT(*) AS filas_cantidad_no_valida
FROM ventas_2017
WHERE cantidad_pedido <= 0;


-- 3. Identify products with negative prices

SELECT
    COUNT(*) AS productos_precio_no_valido
FROM productos
WHERE precio_producto < 0;
