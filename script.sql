-- Create database if it doesn't exist
CREATE DATABASE IF NOT EXISTS The_Joy_Of_Painting;
USE The_Joy_Of_Painting;
CREATE USER 'bob'@'host' IDENTIFIED BY 'Th!s#p@ssw()rd#1sd7mb';

-- Table 1: Colors
CREATE TABLE IF NOT EXISTS colors (
    painting_index INT PRIMARY KEY,
    img_src VARCHAR(255),
    painting_title VARCHAR(255),
    season INT,
    episode INT,
    num_colors INT,
    youtube_src VARCHAR(255),
    colors TEXT,
    color_hex TEXT,

    -- Link to episode (optional, for joins)
    episode_code VARCHAR(10),

    -- Pigment usage
    Black_Gesso TINYINT,
    Bright_Red TINYINT,
    Burnt_Umber TINYINT,
    Cadmium_Yellow TINYINT,
    Dark_Sienna TINYINT,
    Indian_Red TINYINT,
    Indian_Yellow TINYINT,
    Liquid_Black TINYINT,
    Liquid_Clear TINYINT,
    Midnight_Black TINYINT,
    Phthalo_Blue TINYINT,
    Phthalo_Green TINYINT,
    Prussian_Blue TINYINT,
    Sap_Green TINYINT,
    Titanium_White TINYINT,
    Van_Dyke_Brown TINYINT,
    Yellow_Ochre TINYINT,
    Alizarin_Crimson TINYINT,

    -- Optional foreign key to episodes table
    FOREIGN KEY (episode_code) REFERENCES episodes(episode_code)
        ON DELETE SET NULL
);

-- Table 2: Episodes
CREATE TABLE IF NOT EXISTS episodes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    air_date DATE,
    episode_code VARCHAR(10) UNIQUE
);

-- Table 3: Features
CREATE TABLE IF NOT EXISTS features (
    episode_code VARCHAR(10) PRIMARY KEY,
    title VARCHAR(255),

    -- Feature flags
    apple_frame BOOLEAN,
    aurora_borealis BOOLEAN,
    barn BOOLEAN,
    beach BOOLEAN,
    boat BOOLEAN,
    bridge BOOLEAN,
    building BOOLEAN,
    bushes BOOLEAN,
    cabin BOOLEAN,
    cactus BOOLEAN,
    circle_frame BOOLEAN,
    cirrus BOOLEAN,
    cliff BOOLEAN,
    clouds BOOLEAN,
    conifer BOOLEAN,
    cumulus BOOLEAN,
    deciduous BOOLEAN,
    diane_andre BOOLEAN,
    dock BOOLEAN,
    double_oval_frame BOOLEAN,
    farm BOOLEAN,
    fence BOOLEAN,
    fire BOOLEAN,
    florida_frame BOOLEAN,
    flowers BOOLEAN,
    fog BOOLEAN,
    framed BOOLEAN,
    grass BOOLEAN,
    guest BOOLEAN,
    half_circle_frame BOOLEAN,
    half_oval_frame BOOLEAN,
    hills BOOLEAN,
    lake BOOLEAN,
    lakes BOOLEAN,
    lighthouse BOOLEAN,
    mill BOOLEAN,
    moon BOOLEAN,
    mountain BOOLEAN,
    mountains BOOLEAN,
    night BOOLEAN,
    ocean BOOLEAN,
    oval_frame BOOLEAN,
    palm_trees BOOLEAN,
    path BOOLEAN,
    person BOOLEAN,
    portrait BOOLEAN,
    rectangle_3d_frame BOOLEAN,
    rectangular_frame BOOLEAN,
    river BOOLEAN,
    rocks BOOLEAN,
    seashell_frame BOOLEAN,
    snow BOOLEAN,
    snowy_mountain BOOLEAN,
    split_frame BOOLEAN,
    steve_ross BOOLEAN,
    structure BOOLEAN,
    sun BOOLEAN,
    tomb_frame BOOLEAN,
    tree BOOLEAN,
    trees BOOLEAN,
    triple_frame BOOLEAN,
    waterfall BOOLEAN,
    waves BOOLEAN,
    windmill BOOLEAN,
    window_frame BOOLEAN,
    winter BOOLEAN,
    wood_framed BOOLEAN,

    -- Foreign key constraint
    FOREIGN KEY (episode_code) REFERENCES episodes(episode_code)
        ON DELETE CASCADE
);

GRANT * ON The_Joy_Of_Painting.colors TO 'bob'@'host';
GRANT * ON The_Joy_Of_Painting.episode TO 'bob'@'host';
GRANT * ON The_Joy_Of_Painting.features TO 'bob'@'host';
