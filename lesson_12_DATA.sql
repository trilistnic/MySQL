USE course_project_SPDM;

INSERT INTO users VALUES 
	(DEFAULT, 'Petr', 'Skopin', 'petr@mail.com', '+79219212121', DEFAULT, DEFAULT, DEFAULT, '1997-12-01'),
	(DEFAULT, 'Ivan', 'Martynov', 'ivan@mail.com', '89219212121', DEFAULT, DEFAULT, DEFAULT, '1987-12-01'),
	(DEFAULT, 'Igor', 'Shander', 'igor@mail.com', '+79219212213', DEFAULT, DEFAULT, DEFAULT, '1977-12-01'),
	(DEFAULT, 'Dmitryi', 'Nikolaev', 'dmitryi@mail.com', '+79219212117', DEFAULT, DEFAULT, DEFAULT, '1967-12-01'),
	(DEFAULT, 'Mikhail', 'Aleshin', 'mikhail@mail.com', '+79219212128', DEFAULT, DEFAULT, DEFAULT, '2007-12-01'),
	(DEFAULT, 'Alexei', 'Tarasov', 'alexei@mail.com', '+79219212129', DEFAULT, DEFAULT, DEFAULT, '2017-12-01'),
	(DEFAULT, 'Andrei', 'Vasiliev', 'andrei@mail.com', '+79219212124', DEFAULT, DEFAULT, DEFAULT, '1997-02-01'),
	(DEFAULT, 'Yurii', 'Konoplev', 'yurii@mail.com', '+79219212125', DEFAULT, DEFAULT, DEFAULT, '1997-08-01'),
	(DEFAULT, 'Pavel', 'Churakov', 'pavel@mail.com', '+79219212126', DEFAULT, DEFAULT, DEFAULT, '1987-02-01'),
	(DEFAULT, 'Alexander', 'Olennikov', 'alexander@mail.com', '+79219212151', DEFAULT, DEFAULT, DEFAULT, '1987-06-01')	
;

INSERT INTO user_account VALUES 
	(1, 'Petr', '81dc9bdb52d04dc20036dbd8313ed051', DEFAULT),
	(2, 'Ivan', '81dc9bdb52d04dc20036dbd8313ed052', DEFAULT),
	(3, 'Igor', '81dc9bdb52d04dc20036dbd8313ed053', DEFAULT),
	(4, 'Dmitryi', '81dc9bdb52d04dc20036dbd8313ed054', DEFAULT),
	(5, 'Mikhail', '81dc9bdb52d04dc20036dbd8313ed055', DEFAULT),
	(6, 'Alexei', '81dc9bdb52d04dc20036dbd8313ed056', DEFAULT),
	(7, 'Andrei', '81dc9bdb52d04dc20036dbd8313ed057', DEFAULT),
	(8, 'Yurii', '81dc9bdb52d04dc20036dbd8313ed055', DEFAULT),
	(9, 'Pavel', '81dc9bdb52d04dc20036dbd8313ed058', DEFAULT),
	(10, 'Alexander', '81dc9bdb52d04dc20036dbd8313ed059', DEFAULT)	
;

INSERT INTO user_roles VALUES 
	(1, 'Junior', 'Can use submodels', DEFAULT, DEFAULT),
	(2, 'Junior', 'Can use submodels', DEFAULT, DEFAULT),
	(3, 'Junior', 'Can use submodels', DEFAULT, DEFAULT),
	(4, 'Senior', 'Can use submodels, simulations and reports', DEFAULT, DEFAULT),
	(5, 'Senior', 'Can use submodels, simulations and reports', DEFAULT, DEFAULT),
	(6, 'Junior', 'Can use submodels', DEFAULT, DEFAULT),
	(7, 'Senior', 'Can use submodels, simulations and reports', DEFAULT, DEFAULT),
	(8, 'Middle', 'Can use submodels and simulations', DEFAULT, DEFAULT),
	(9, 'Middle', 'Can use submodels and simulations', DEFAULT, DEFAULT),
	(10, 'Senior', 'Can use submodels, simulations and reports', DEFAULT, DEFAULT)	
;

INSERT INTO projects VALUES 
	(DEFAULT, 'F32', 'German production', 4, DEFAULT, DEFAULT),
	(DEFAULT, 'RR17', 'Belgium production', 5, DEFAULT, DEFAULT),
	(DEFAULT, 'BN15', 'Austria production', 7, DEFAULT, DEFAULT),
	(DEFAULT, 'G99', 'Norway production', 10, DEFAULT, DEFAULT),
	(DEFAULT, 'AU88', 'Russia production', 4, DEFAULT, DEFAULT)
;

INSERT INTO project_team VALUES 
	(DEFAULT, 1, 1, DEFAULT, DEFAULT),
	(DEFAULT, 2, 2, DEFAULT, DEFAULT),
	(DEFAULT, 3, 3, DEFAULT, DEFAULT),
	(DEFAULT, 1, 4, 1, DEFAULT),
	(DEFAULT, 5, 4, 1, DEFAULT),
	(DEFAULT, 2, 5, 1, DEFAULT),
	(DEFAULT, 4, 6, DEFAULT, DEFAULT),
	(DEFAULT, 3, 7, 1, DEFAULT),
	(DEFAULT, 5, 8, 1, DEFAULT),
	(DEFAULT, 5, 9, 1, DEFAULT),	
	(DEFAULT, 4, 10, 1, DEFAULT)	
;

INSERT INTO groups_permissions VALUES 
	(1, DEFAULT, DEFAULT, DEFAULT),
	(2, DEFAULT, DEFAULT, DEFAULT),
	(3, DEFAULT, DEFAULT, DEFAULT),
	(4, DEFAULT, DEFAULT, DEFAULT),
	(5, 0, DEFAULT, DEFAULT)	
;

INSERT INTO submodel_types VALUES 
	(DEFAULT, 'Roof'),
	(DEFAULT, 'Bumper'),
	(DEFAULT, 'Tailgate'),
	(DEFAULT, 'BIW'),
	(DEFAULT, 'Fender'),
	(DEFAULT, 'Motor'),
	(DEFAULT, 'Door'),
	(DEFAULT, 'Wheels'),
	(DEFAULT, 'Glass'),
	(DEFAULT, 'Suspension')	
;

INSERT INTO submodels VALUES 
	(DEFAULT, 'F32_BIW', 'Completely new', 1, 1, 4, DEFAULT, DEFAULT),
	(DEFAULT, 'RR17_Tailgate', 'Completely new', 2, 2, 3, DEFAULT, DEFAULT),
	(DEFAULT, 'BN15_Roof', 'Update', 3, 3, 1, DEFAULT, DEFAULT),
	(DEFAULT, 'G99_Fender', 'Completely new', 4, 6, 5, DEFAULT, DEFAULT),
	(DEFAULT, 'AU88_Motor', 'Update', 5, 8, 6, DEFAULT, DEFAULT),
	(DEFAULT, 'F32_Suspension', 'Completely new', 1, 4, 10, DEFAULT, DEFAULT),
	(DEFAULT, 'RR17_Glass', 'Completely new', 2, 5, 9, DEFAULT, DEFAULT),
	(DEFAULT, 'BN15_Wheels', 'Update', 3, 7, 8, DEFAULT, DEFAULT),
	(DEFAULT, 'G99_Door', 'Completely new', 4, 10, 7, DEFAULT, DEFAULT),
	(DEFAULT, 'AU88_Fender', 'Update', 5, 9, 5, DEFAULT, DEFAULT)
;

INSERT INTO input_decks VALUES 
	(DEFAULT, 'F32_Assembly_001', 1, 1, DEFAULT, DEFAULT),
	(DEFAULT, 'RR17_Assembly_001', 2, 2, DEFAULT, DEFAULT),
	(DEFAULT, 'BN15_Assembly_001', 3, 3, DEFAULT, DEFAULT),
	(DEFAULT, 'G99_Assembly_001', 4, 6, DEFAULT, DEFAULT),
	(DEFAULT, 'AU88_Assembly_001', 5, 8, DEFAULT, DEFAULT),
	(DEFAULT, 'F32_Assembly_002', 1, 4, DEFAULT, DEFAULT),
	(DEFAULT, 'RR17_Assembly_002', 2, 5, DEFAULT, DEFAULT),
	(DEFAULT, 'BN15_Assembly_002', 3, 7, DEFAULT, DEFAULT),
	(DEFAULT, 'G99_Assembly_002', 4, 10, DEFAULT, DEFAULT),
	(DEFAULT, 'AU88_Assembly_002', 5, 4, DEFAULT, DEFAULT)
;

INSERT INTO input_deck_content VALUES 
	(DEFAULT, 1, 1),
	(DEFAULT, 1, 6),
	(DEFAULT, 2, 2),
	(DEFAULT, 2, 7),
	(DEFAULT, 3, 3),
	(DEFAULT, 3, 8),
	(DEFAULT, 4, 4),
	(DEFAULT, 4, 9),
	(DEFAULT, 5, 5),
	(DEFAULT, 5, 10),
	(DEFAULT, 6, 7),
	(DEFAULT, 6, 7),
	(DEFAULT, 7, 6),
	(DEFAULT, 7, 5),
	(DEFAULT, 8, 3),
	(DEFAULT, 8, 3),
	(DEFAULT, 9, 3),
	(DEFAULT, 9, 3),
	(DEFAULT, 10, 5),
	(DEFAULT, 10, 10)
;

INSERT INTO simulation_statuses VALUES 
	(DEFAULT, 'Assembly'),
	(DEFAULT, 'Pending'),
	(DEFAULT, 'Running'),
	(DEFAULT, 'Finished'),
	(DEFAULT, 'Failed')
;

INSERT INTO simulations VALUES 
	(DEFAULT, 'F32_Assembly_001', 'Front simulation', 1, 4, 1, 4, DEFAULT, DEFAULT),
	(DEFAULT, 'RR17_Assembly_001', 'Rear simulation', 2, 5, 2, 3, DEFAULT, DEFAULT),
	(DEFAULT, 'BN15_Assembly_001', 'Side simulation', 3, 6, 3, 2, DEFAULT, DEFAULT),
	(DEFAULT, 'G99_Assembly_001', 'Roof simulation', 4, 10, 4, 2, DEFAULT, DEFAULT),
	(DEFAULT, 'AU88_Assembly_001', 'Belt simulation', 5, 4, 5, 3, DEFAULT, DEFAULT),
	(DEFAULT, 'F32_Assembly_002', 'Front simulation', 1, 4, 6, 2, DEFAULT, DEFAULT),
	(DEFAULT, 'RR17_Assembly_002', 'Rear simulation', 2, 5, 7, 1, DEFAULT, DEFAULT),
	(DEFAULT, 'BN15_Assembly_002', 'Side simulation', 3, 7, 8, 1, DEFAULT, DEFAULT),
	(DEFAULT, 'G99_Assembly_002', 'Roof simulation', 4, 10, 9, 5, DEFAULT, DEFAULT),
	(DEFAULT, 'AU88_Assembly_002', 'Belt simulation', 5, 4, 10, 5, DEFAULT, DEFAULT)
;

INSERT INTO simulation_reports VALUES 
	(DEFAULT, 'F32_Assembly_001', 1, 4, 1, DEFAULT, DEFAULT),
	(DEFAULT, 'RR17_Assembly_001', 2, 5, 2, DEFAULT, DEFAULT),
	(DEFAULT, 'BN15_Assembly_001', 3, 6, 3, DEFAULT, DEFAULT),
	(DEFAULT, 'G99_Assembly_001', 4, 10, 4, DEFAULT, DEFAULT),
	(DEFAULT, 'AU88_Assembly_001', 5, 4, 5, DEFAULT, DEFAULT),
	(DEFAULT, 'F32_Assembly_002', 1, 4, 6, DEFAULT, DEFAULT),
	(DEFAULT, 'RR17_Assembly_002', 2, 5, 7, DEFAULT, DEFAULT),
	(DEFAULT, 'BN15_Assembly_002', 3, 7, 8, DEFAULT, DEFAULT),
	(DEFAULT, 'G99_Assembly_002', 4, 10, 9, DEFAULT, DEFAULT),
	(DEFAULT, 'AU88_Assembly_002', 5, 4, 10, DEFAULT, DEFAULT)
;

INSERT INTO wiki_pages_type VALUES 
	(DEFAULT, 'Guide'),
	(DEFAULT, 'Modeling'),
	(DEFAULT, 'Contacts'),
	(DEFAULT, 'Experience'),
	(DEFAULT, 'Raitings'),
	(DEFAULT, 'Regulations'),
	(DEFAULT, 'Video'),
	(DEFAULT, 'Purchase'),
	(DEFAULT, 'Investigation'),
	(DEFAULT, 'News')
;


INSERT INTO wiki_pages_content VALUES 
	(DEFAULT, 'Glue modeling', 2, 'Glue modeling is important', 1, DEFAULT, DEFAULT),
	(DEFAULT, 'Glue guide', 1, 'Glue guide is important', 1, DEFAULT, DEFAULT),
	(DEFAULT, 'IT contact', 2, 'IT contact is important', 2, DEFAULT, DEFAULT),
	(DEFAULT, 'Our Experience', 2, 'Our Experience is important', 3, DEFAULT, DEFAULT),
	(DEFAULT, 'European Raiting', 2, 'European Raiting is important', 4, DEFAULT, DEFAULT),
	(DEFAULT, 'FMVSS Regulations', 2, 'FMVSS Regulation is important', 5, DEFAULT, DEFAULT),
	(DEFAULT, 'Video for targets', 2, 'Video for targets is important', 6, DEFAULT, DEFAULT),
	(DEFAULT, 'Purchase order', 2, 'Purchase order is important', 7, DEFAULT, DEFAULT),
	(DEFAULT, 'Glue problem Investigation', 2, 'Glue problem Investigation is important', 1, DEFAULT, DEFAULT),
	(DEFAULT, 'World News', 2, 'World News is important', 8, DEFAULT, DEFAULT)	
;

INSERT INTO notification VALUES 
	(DEFAULT, 'dmitryi@mail.com', 'F32_Assembly_001', 'Finished', DEFAULT),	
	(DEFAULT, 'alexander@mail.com', 'G99_Assembly_002', 'Failed', DEFAULT),
	(DEFAULT, 'dmitryi@mail.com', 'AU88_Assembly_002', 'Failed', DEFAULT)
;
