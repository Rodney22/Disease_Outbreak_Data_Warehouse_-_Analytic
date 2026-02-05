DROP FUNCTION IF EXISTS get_outbreaks_by_severity();

CREATE OR REPLACE FUNCTION get_outbreaks_by_severity()
RETURNS TABLE (severity_level VARCHAR, outbreak_count BIGINT) AS
$$
BEGIN
    RETURN QUERY
    SELECT 
        o.severity_level,
        COUNT(f.outbreak_id) AS outbreak_count
    FROM 
        disease_outbreak_dw.fact_outbreak f
    JOIN 
        disease_outbreak_dw.dimension_outbreak o ON f.outbreak_id = o.outbreak_id
    GROUP BY 
        o.severity_level
    ORDER BY 
        outbreak_count DESC;
END;
$$ LANGUAGE plpgsql;


SELECT * FROM get_outbreaks_by_severity();
