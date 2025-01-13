import { PrismaClient } from '@prisma/client'

const prisma = new PrismaClient()

export async function getServerSideProps() {
  const posts = await prisma.post.findMany({
    include: {
      user: true,
    },
  })

  return {
    props: {
      posts,
    },
  }
}

export default function PostsPage({ posts }: { posts: any[] }) {
  return (
    <div>
      <h1>Posts</h1>
      <div className="grid grid-cols-1 gap-4">
        {posts.map((post) => (
          <div key={post.id} className="card">
            <h2>{post.title}</h2>
            <p>{post.body}</p>
            <p>Written by: {post.user.name}</p>
          </div>
        ))}
      </div>
    </div>
  )
}
