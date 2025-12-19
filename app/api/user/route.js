export const dynamic = "force-dynamic";

import { prisma } from "@/lib/prisma";

export async function GET() {
  if (!process.env.DATABASE_URL) {
    return Response.json(
      { error: "Database not configured" },
      { status: 500 }
    );
  }

  const users = await prisma.user.findMany({
    select: {
      id: true,
      username: true,
      role: true,
    },
  });

  return Response.json(users);
}
