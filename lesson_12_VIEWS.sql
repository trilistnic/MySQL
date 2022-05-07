USE course_project_SPDM;

-- Представление по распределению по ролям созданных модедей.

CREATE OR REPLACE VIEW submodels_roles AS
SELECT
	ur.name AS user_role,
	COUNT(ur.name) AS uploaded_models_amount
FROM user_roles ur
JOIN submodels s ON ur.user_id = s.owner_id
GROUP BY ur.name
ORDER BY uploaded_models_amount DESC
;

-- Пример использования
-- SELECT * FROM submodels_input_decks;


-- Представление по наличию и отображению количества отчетов у расчета.

CREATE OR REPLACE VIEW report_simulation AS
SELECT 
	s.name, 
	COUNT(sr.id) AS report_amount 
FROM simulations s
LEFT JOIN simulation_reports sr ON s.id = sr.base_simulation_id
GROUP BY s.name
ORDER BY report_amount DESC
;

-- Пример использования
-- SELECT * FROM report_simulation;
