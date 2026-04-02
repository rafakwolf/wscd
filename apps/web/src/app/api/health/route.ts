import { NextResponse } from "next/server";

import { getDatabaseHealth } from "@/server/db/health";

export async function GET() {
  const database = await getDatabaseHealth();

  return NextResponse.json({
    ok: true,
    app: "wscd-web",
    mode: "greenfield",
    legacyImportRequired: false,
    database
  });
}
