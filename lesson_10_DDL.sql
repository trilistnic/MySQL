DROP DATABASE IF EXISTS course_project_SPDM;

CREATE DATABASE IF NOT EXISTS course_project_SPDM;

USE course_project_SPDM;

CREATE TABLE IF NOT EXISTS users(
    id INT UNSIGNED AUTO_INCREMENT NOT NULL,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    phone VARCHAR(12) UNIQUE NOT NULL,
    active BOOL DEFAULT 1 NOT NULL,
    date_created TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    date_modified TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    birth_date DATE,
    INDEX(first_name, last_name),
	PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS user_account(
    user_id INT UNSIGNED NOT NULL,
    login VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) DEFAULT NULL,
    date_modified TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY(user_id),
    FOREIGN KEY (user_id) REFERENCES users (id)
);

CREATE TABLE IF NOT EXISTS user_roles(
    user_id INT UNSIGNED NOT NULL,
    name VARCHAR(255) DEFAULT 'Junior' NOT NULL,
    description TEXT,
    date_created TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    date_modified TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY(user_id),
    FOREIGN KEY (user_id) REFERENCES users (id)    
);

CREATE TABLE IF NOT EXISTS projects(
    id INT UNSIGNED AUTO_INCREMENT NOT NULL,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    owner_id INT UNSIGNED NOT NULL,
    date_created TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    date_modified TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX(name),
	PRIMARY KEY(id),
	FOREIGN KEY (owner_id) REFERENCES users (id)
);

CREATE TABLE IF NOT EXISTS project_team(
    id INT UNSIGNED AUTO_INCREMENT NOT NULL,
    project_id INT UNSIGNED NOT NULL,
    user_id INT UNSIGNED NOT NULL,
    is_lead BOOL DEFAULT 0 NOT NULL,
    is_member BOOL DEFAULT 1 NOT NULL,
    PRIMARY KEY(id),
	FOREIGN KEY (project_id) REFERENCES projects (id),
	FOREIGN KEY (user_id) REFERENCES users (id)
);

CREATE TABLE IF NOT EXISTS groups_permissions(
    group_id INT UNSIGNED NOT NULL,
    is_access BOOL DEFAULT 1 NOT NULL,
    date_created TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    date_modified TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY(group_id),
	FOREIGN KEY (group_id) REFERENCES projects (id)
);

CREATE TABLE IF NOT EXISTS submodel_types(
    id INT UNSIGNED AUTO_INCREMENT NOT NULL,
    name VARCHAR(255) UNIQUE NOT NULL,
    INDEX(name),
	PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS submodels(
    id INT UNSIGNED AUTO_INCREMENT NOT NULL,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    project_id INT UNSIGNED NOT NULL,
    owner_id INT UNSIGNED NOT NULL,
    submodel_types_id INT UNSIGNED NOT NULL, 
    date_created TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    date_modified TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX(name),
	PRIMARY KEY(id),
	FOREIGN KEY (project_id) REFERENCES projects (id),
	FOREIGN KEY (owner_id) REFERENCES users (id),
	FOREIGN KEY (submodel_types_id) REFERENCES submodel_types (id)
);

CREATE TABLE IF NOT EXISTS input_decks(
    id INT UNSIGNED AUTO_INCREMENT NOT NULL,
    name VARCHAR(255) NOT NULL,
    project_id INT UNSIGNED NOT NULL,
    owner_id INT UNSIGNED NOT NULL,
    date_created TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    date_modified TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX(name),
	PRIMARY KEY(id),
	FOREIGN KEY (project_id) REFERENCES projects (id),
	FOREIGN KEY (owner_id) REFERENCES users (id)
);

CREATE TABLE IF NOT EXISTS input_deck_content(
    id INT UNSIGNED AUTO_INCREMENT NOT NULL,
    input_deck_id INT UNSIGNED NOT NULL,
    submodel_id INT UNSIGNED NOT NULL, 
	PRIMARY KEY(id),
	FOREIGN KEY (input_deck_id) REFERENCES input_decks (id),
	FOREIGN KEY (submodel_id) REFERENCES submodels (id)
);

CREATE TABLE IF NOT EXISTS simulation_statuses(
    id INT UNSIGNED AUTO_INCREMENT NOT NULL,
    name VARCHAR(255) UNIQUE NOT NULL,
    INDEX(name),
	PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS simulations(
    id INT UNSIGNED AUTO_INCREMENT NOT NULL,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    project_id INT UNSIGNED NOT NULL,
    owner_id INT UNSIGNED NOT NULL,
    input_deck_id INT UNSIGNED NOT NULL,
    status_id INT UNSIGNED NOT NULL,
    date_created TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    date_modified TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX(name),
	PRIMARY KEY(id),
	FOREIGN KEY (project_id) REFERENCES projects (id),
	FOREIGN KEY (owner_id) REFERENCES users (id),
	FOREIGN KEY (input_deck_id) REFERENCES input_decks (id),
	FOREIGN KEY (status_id) REFERENCES simulation_statuses (id)
);

CREATE TABLE IF NOT EXISTS simulation_reports(
    id INT UNSIGNED AUTO_INCREMENT NOT NULL,
    name VARCHAR(255) NOT NULL,
    project_id INT UNSIGNED NOT NULL,
    owner_id INT UNSIGNED NOT NULL,
    base_simulation_id INT UNSIGNED NOT NULL,
    date_created TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    date_modified TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX(name),
	PRIMARY KEY(id),
	FOREIGN KEY (project_id) REFERENCES projects (id),
	FOREIGN KEY (owner_id) REFERENCES users (id),
	FOREIGN KEY (base_simulation_id) REFERENCES simulations (id)
);

CREATE TABLE IF NOT EXISTS wiki_pages_type(
    id INT UNSIGNED AUTO_INCREMENT NOT NULL,
    name VARCHAR(255) UNIQUE NOT NULL,
    INDEX(name),
	PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS wiki_pages_content(
    id INT UNSIGNED AUTO_INCREMENT NOT NULL,
    wiki_page_name VARCHAR(255) NOT NULL,
    content_type INT UNSIGNED NOT NULL,
    content TEXT,
    owner_id INT UNSIGNED NOT NULL,
    date_created TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    date_modified TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX(wiki_page_name),
	PRIMARY KEY(id),
	FOREIGN KEY (owner_id) REFERENCES users (id),
	FOREIGN KEY (content_type) REFERENCES wiki_pages_type (id)
);
