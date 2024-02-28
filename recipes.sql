CREATE DATABASE IF NOT EXISTS recipes;

USE recipes;

CREATE TABLE Spiciness (
    spiciness_id INT PRIMARY KEY,
    spiciness_name VARCHAR(255) NOT NULL
);

CREATE TABLE Recipes (
    recipe_id INT PRIMARY KEY,
    recipe_name VARCHAR(255) NOT NULL,
    cooking_time INT, -- in minutes
    preparation_time INT, -- in minutes
    spiciness_id INT,
    FOREIGN KEY (spiciness_id) REFERENCES Spiciness(spiciness_id)
);


CREATE TABLE Ingredients (
    ingredient_id INT PRIMARY KEY,
    ingredient_name VARCHAR(255) NOT NULL
);

CREATE TABLE Directions (
    direction_id INT PRIMARY KEY,
    instruction TEXT NOT NULL
);

CREATE TABLE Categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(255) NOT NULL
);

CREATE TABLE RecipeDirections (
    recipe_id INT,
    direction_id INT,
    step_number INT,
    PRIMARY KEY (recipe_id, direction_id),
    FOREIGN KEY (recipe_id) REFERENCES Recipes(recipe_id),
    FOREIGN KEY (direction_id) REFERENCES Directions(direction_id)
);

CREATE TABLE RecipeCategories (
    recipe_id INT,
    category_id INT,
    PRIMARY KEY (recipe_id, category_id),
    FOREIGN KEY (recipe_id) REFERENCES Recipes(recipe_id),
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

CREATE TABLE Units (
    unit_id INT PRIMARY KEY,
    unit_name VARCHAR(255) NOT NULL
);


CREATE TABLE RecipeIngredients (
    recipe_id INT,
    ingredient_id INT,
    unit_id INT, -- e.g., grams, ml, units, etc.
    quantity DECIMAL(10,2), -- e.g., 1.5, 100, etc.
    PRIMARY KEY (recipe_id, ingredient_id),
    FOREIGN KEY (recipe_id) REFERENCES Recipes(recipe_id),
    FOREIGN KEY (ingredient_id) REFERENCES Ingredients(ingredient_id),
    FOREIGN KEY (unit_id) REFERENCES Units(unit_id)
);

