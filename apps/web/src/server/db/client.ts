import postgres from "postgres";

import { env } from "@/lib/env";

declare global {
  // eslint-disable-next-line no-var
  var __wscdSql: ReturnType<typeof postgres> | undefined;
}

const shouldUseSsl = env.DATABASE_SSL;

export const sql =
  globalThis.__wscdSql ??
  postgres(env.DATABASE_URL, {
    max: 5,
    idle_timeout: 20,
    connect_timeout: 10,
    ssl: shouldUseSsl ? "require" : undefined,
    prepare: false
  });

if (process.env.NODE_ENV !== "production") {
  globalThis.__wscdSql = sql;
}
