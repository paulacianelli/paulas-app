import { NextRequest } from 'next/server';
import { PrismaClient } from '@prisma/client';

const prisma = new PrismaClient();


export const GET = async (req: NextRequest) => {
  const { searchParams } = new URL(req.url);
  const userId = searchParams.get('userId');

  const posts = userId
  ? await prisma.post.findMany({ where: { userId: parseInt(userId) } })
  : await prisma.post.findMany();
  return new Response(JSON.stringify({ posts }), {
    headers: { 'Content-Type': 'application/json' }
  });
}
 
export const DELETE = async (req: NextRequest) => {
  const { searchParams } = new URL(req.url);
  const id = searchParams.get('id'); 

  if (id) {
    await prisma.post.delete({ where: { id: parseInt(id) } });
    return Response.json({ message: 'Post deleted' });
  } else {
    return Response.json({ message: 'Invalid id' }, { status: 400 });
  }
}
