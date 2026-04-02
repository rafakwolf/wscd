import { NextResponse } from "next/server";

import { getBootstrapState } from "@/server/bootstrap";

export async function GET() {
  return NextResponse.json(await getBootstrapState());
}
