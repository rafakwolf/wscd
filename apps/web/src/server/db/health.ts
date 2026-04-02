import { sql } from "@/server/db/client";

export type DatabaseHealth = {
  ok: boolean;
  database: string;
  now?: string;
  error?: string;
};

export async function getDatabaseHealth(): Promise<DatabaseHealth> {
  try {
    const result = await sql<{ database_name: string; database_time: string }[]>`
      select current_database() as database_name, now()::text as database_time
    `;

    const row = result[0];

    return {
      ok: true,
      database: row?.database_name ?? "unknown",
      now: row?.database_time
    };
  } catch (error) {
    return {
      ok: false,
      database: "unknown",
      error: error instanceof Error ? error.message : "Unknown database error"
    };
  }
}
