USE course_project_SPDM;

-- Выборка, включающая группировку, для отражения информации по загрузке моделей в систему
-- Разделение и подсчет количества загруженных моделей в зависимости от роли пользователя.

SELECT 
  u.name, 
  COUNT(s.id) AS submodels_uploaded
FROM user_roles u
	JOIN submodels s
	ON u.user_id = s.owner_id
GROUP BY u.name
ORDER BY submodels_uploaded DESC;

-- Выборка, включающая JOIN'ы, для отражения информации о пользователях загрузивших модели в систему
-- Подсчитывает ТОП-3 пользователей, которые загрузили модели, которые больше всего используются в расчетах.

SELECT
	CONCAT(u.first_name, ' ', u.last_name) AS user_name,
	s2.name , 
	COUNT(idc.submodel_id) AS usage_in_simulations
FROM simulations s
JOIN input_deck_content idc ON s.input_deck_id = idc.input_deck_id
JOIN submodels s2 ON idc.submodel_id = s2.id
JOIN users u ON s2.owner_id = u.id 
GROUP BY idc.submodel_id
ORDER BY usage_in_simulations DESC LIMIT 3;

-- Выборка, включающая вложенные запросы, для отображения информации по проектам:
-- количество загруженных моделей и количество определенных типов моделей.

SELECT 
	name,
	(SELECT COUNT(submodel_types_id) FROM submodels s WHERE s.project_id = p.id) AS submodels_amount,
	(SELECT COUNT(submodel_types_id) FROM submodels s WHERE s.project_id = p.id 
	AND submodel_types_id = (SELECT id FROM submodel_types st WHERE name LIKE 'Roof')) AS contains_Roof
FROM projects p
ORDER BY contains_Roof DESC;
