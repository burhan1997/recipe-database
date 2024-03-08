import { MongoClient } from "mongodb";
import recipes from "./data.js";
import dotenv from "dotenv";

dotenv.config();

const uri = process.env.MONGODB_URL; 

const client = new MongoClient(uri);

async function createCollections(database) {
  const recipesCollection = database.collection("recipes");
  await recipesCollection.deleteMany({}); // Drop existing documents
  await recipesCollection.insertMany(recipes);
}

async function main() {
  try {
    await client.connect();
    const database = client.db("recipeDatabase");
    await createCollections(database);
    console.log("Created collections and inserted documents successfully!");
  } finally {
    await client.close();
  }
}

main().catch(console.dir);
