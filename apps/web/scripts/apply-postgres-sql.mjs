import fs from "node:fs/promises";
import path from "node:path";
import process from "node:process";
import { fileURLToPath } from "node:url";

import postgres from "postgres";

const __dirname = path.dirname(fileURLToPath(import.meta.url));
const appDir = path.resolve(__dirname, "..");
const rootDir = path.resolve(appDir, "..", "..");
const migrationsDir = path.join(rootDir, "Database", "postgresql");

const files = process.argv.slice(2);
const sqlFiles =
  files.length > 0
    ? files.map((file) => path.resolve(rootDir, file))
    : [
        path.join(migrationsDir, "001_initial_schema.sql"),
        path.join(migrationsDir, "002_reporting_views.sql"),
        path.join(migrationsDir, "003_seed_bootstrap.sql")
      ];

const databaseUrl = process.env.DATABASE_URL;

if (!databaseUrl) {
  console.error("DATABASE_URL is required.");
  process.exit(1);
}

const sql = postgres(databaseUrl, {
  prepare: false,
  connect_timeout: 10,
  max: 1
});

try {
  for (const filePath of sqlFiles) {
    const content = await fs.readFile(filePath, "utf8");
    console.log(`Applying ${path.relative(rootDir, filePath)} ...`);
    await sql.unsafe(content);
  }

  console.log("All SQL files applied successfully.");
} catch (error) {
  console.error("Failed applying SQL files.");
  console.error(error instanceof Error ? error.message : error);
  process.exitCode = 1;
} finally {
  await sql.end({ timeout: 5 });
}
