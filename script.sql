CREATE DATABASE IF NOT EXISTS The_Joy_Of_Painting;
USE The_Joy_Of_Painting;

CREATE TABLE Colors (
    painting_index INT PRIMARY KEY,
    img_src VARCHAR(255),
    painting_title VARCHAR(255),
    season INT,
    episode INT,
    num_colors INT,
    youtube_src VARCHAR(255),
    colors TEXT,
    color_hex TEXT,

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
    Alizarin_Crimson TINYINT
)
