-- Create database and select it
CREATE DATABASE IF NOT EXISTS The_Joy_Of_Painting;
USE The_Joy_Of_Painting;

-- Create user
CREATE USER IF NOT EXISTS 'bob'@'localhost' IDENTIFIED BY 'Th1s!stw1lv!';
GRANT ALL PRIVILEGES ON The_Joy_Of_Painting.* TO 'bob'@'localhost';
FLUSH PRIVILEGES;

-- Remove tables
DROP TABLE IF EXISTS features;
DROP TABLE IF EXISTS colors;
DROP TABLE IF EXISTS episodes;

-- Table 1: Episodes
CREATE TABLE IF NOT EXISTS episodes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    `date` DATE,
    comment VARCHAR(255),
    episode_code VARCHAR(10) UNIQUE
);

-- Table 2: Colors
CREATE TABLE IF NOT EXISTS colors (
    num_order INT,
    painting_index INT PRIMARY KEY,
    img_src VARCHAR(255),
    painting_title VARCHAR(255),
    season INT,
    episode INT,
    num_colors INT,
    youtube_src VARCHAR(255),
    colors TEXT,
    color_hex TEXT,

    episode_code VARCHAR(10),

    -- Pigment usage: default to 0 (false)
    Black_Gesso TINYINT DEFAULT 0,
    Bright_Red TINYINT DEFAULT 0,
    Burnt_Umber TINYINT DEFAULT 0,
    Cadmium_Yellow TINYINT DEFAULT 0,
    Dark_Sienna TINYINT DEFAULT 0,
    Indian_Red TINYINT DEFAULT 0,
    Indian_Yellow TINYINT DEFAULT 0,
    Liquid_Black TINYINT DEFAULT 0,
    Liquid_Clear TINYINT DEFAULT 0,
    Midnight_Black TINYINT DEFAULT 0,
    Phthalo_Blue TINYINT DEFAULT 0,
    Phthalo_Green TINYINT DEFAULT 0,
    Prussian_Blue TINYINT DEFAULT 0,
    Sap_Green TINYINT DEFAULT 0,
    Titanium_White TINYINT DEFAULT 0,
    Van_Dyke_Brown TINYINT DEFAULT 0,
    Yellow_Ochre TINYINT DEFAULT 0,
    Alizarin_Crimson TINYINT DEFAULT 0,

    FOREIGN KEY (episode_code) REFERENCES episodes(episode_code) ON DELETE SET NULL
);

-- Table 3: Features
CREATE TABLE IF NOT EXISTS features (
    episode VARCHAR(255),
    title VARCHAR(255),

    -- All features as boolean flags (default to false)
    apple_frame BOOLEAN DEFAULT FALSE,
    aurora_borealis BOOLEAN DEFAULT FALSE,
    barn BOOLEAN DEFAULT FALSE,
    beach BOOLEAN DEFAULT FALSE,
    boat BOOLEAN DEFAULT FALSE,
    bridge BOOLEAN DEFAULT FALSE,
    building BOOLEAN DEFAULT FALSE,
    bushes BOOLEAN DEFAULT FALSE,
    cabin BOOLEAN DEFAULT FALSE,
    cactus BOOLEAN DEFAULT FALSE,
    circle_frame BOOLEAN DEFAULT FALSE,
    cirrus BOOLEAN DEFAULT FALSE,
    cliff BOOLEAN DEFAULT FALSE,
    clouds BOOLEAN DEFAULT FALSE,
    conifer BOOLEAN DEFAULT FALSE,
    cumulus BOOLEAN DEFAULT FALSE,
    deciduous BOOLEAN DEFAULT FALSE,
    diane_andre BOOLEAN DEFAULT FALSE,
    dock BOOLEAN DEFAULT FALSE,
    double_oval_frame BOOLEAN DEFAULT FALSE,
    farm BOOLEAN DEFAULT FALSE,
    fence BOOLEAN DEFAULT FALSE,
    fire BOOLEAN DEFAULT FALSE,
    florida_frame BOOLEAN DEFAULT FALSE,
    flowers BOOLEAN DEFAULT FALSE,
    fog BOOLEAN DEFAULT FALSE,
    framed BOOLEAN DEFAULT FALSE,
    grass BOOLEAN DEFAULT FALSE,
    guest BOOLEAN DEFAULT FALSE,
    half_circle_frame BOOLEAN DEFAULT FALSE,
    half_oval_frame BOOLEAN DEFAULT FALSE,
    hills BOOLEAN DEFAULT FALSE,
    lake BOOLEAN DEFAULT FALSE,
    lakes BOOLEAN DEFAULT FALSE,
    lighthouse BOOLEAN DEFAULT FALSE,
    mill BOOLEAN DEFAULT FALSE,
    moon BOOLEAN DEFAULT FALSE,
    mountain BOOLEAN DEFAULT FALSE,
    mountains BOOLEAN DEFAULT FALSE,
    night BOOLEAN DEFAULT FALSE,
    ocean BOOLEAN DEFAULT FALSE,
    oval_frame BOOLEAN DEFAULT FALSE,
    palm_trees BOOLEAN DEFAULT FALSE,
    path BOOLEAN DEFAULT FALSE,
    person BOOLEAN DEFAULT FALSE,
    portrait BOOLEAN DEFAULT FALSE,
    rectangle_3d_frame BOOLEAN DEFAULT FALSE,
    rectangular_frame BOOLEAN DEFAULT FALSE,
    river BOOLEAN DEFAULT FALSE,
    rocks BOOLEAN DEFAULT FALSE,
    seashell_frame BOOLEAN DEFAULT FALSE,
    snow BOOLEAN DEFAULT FALSE,
    snowy_mountain BOOLEAN DEFAULT FALSE,
    split_frame BOOLEAN DEFAULT FALSE,
    steve_ross BOOLEAN DEFAULT FALSE,
    structure BOOLEAN DEFAULT FALSE,
    sun BOOLEAN DEFAULT FALSE,
    tomb_frame BOOLEAN DEFAULT FALSE,
    tree BOOLEAN DEFAULT FALSE,
    trees BOOLEAN DEFAULT FALSE,
    triple_frame BOOLEAN DEFAULT FALSE,
    waterfall BOOLEAN DEFAULT FALSE,
    waves BOOLEAN DEFAULT FALSE,
    windmill BOOLEAN DEFAULT FALSE,
    window_frame BOOLEAN DEFAULT FALSE,
    winter BOOLEAN DEFAULT FALSE,
    wood_framed BOOLEAN DEFAULT FALSE,

    FOREIGN KEY (episode_code) REFERENCES episodes(episode_code) ON DELETE CASCADE
);
