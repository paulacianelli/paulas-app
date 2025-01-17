"use client";

// External imports
import React, { useEffect, useState } from "react";

// Internal imports
import { Skeleton } from "@/components/ui/skeleton";
import { Button } from "@/components/ui/button";
import {
  Card,
  CardContent,
  CardDescription,
  CardFooter,
  CardHeader,
  CardTitle,
} from "@/components/ui/card";
import { Input } from "@/components/ui/input";
import {
  AlertDialog,
  AlertDialogAction,
  AlertDialogCancel,
  AlertDialogContent,
  AlertDialogDescription,
  AlertDialogFooter,
  AlertDialogHeader,
  AlertDialogTitle,
} from "@/components/ui/alert-dialog";

interface Post {
  id: number;
  title: string;
  body: string;
}

export default function Home() {
  const [posts, setPosts] = useState<Post[]>([]);
  const [userId, setUserId] = useState("");
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const [isDialogOpen, setIsDialogOpen] = useState(false);
  const [postToDelete, setPostToDelete] = useState<number | null>(null);

  const fetchPosts = async (query = "") => {
    setLoading(true);
    setError(null);

    try {
      const response = await fetch(`/api${query}`, { method: "GET" });
      if (!response.ok) throw new Error("Failed to fetch posts.");

      const data = await response.json();
      setPosts(data.posts || []);
    } catch (err){
      setError((err as Error).message);
      setIsDialogOpen(true);
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    fetchPosts();
  }, []);

  const deletePost = async (id: number) => {
    try {
      await fetch(`/api/?id=${id}`, { method: "DELETE" });
      fetchPosts(); // Refresh posts after deletion
    } catch (err){
      setError((err as Error).message);
      setIsDialogOpen(true);
    } finally {
      setPostToDelete(null); // Reset the dialog state
    }
  };

  const openDeleteDialog = (id: number) => {
    setPostToDelete(id);
  };

  function topFunction() {
    document.body.scrollTop = 0;
    document.documentElement.scrollTop = 0;
  }
  
  return (
    <div className="container justify-center mx-auto p-4">
      {/* Search input */}
      <div className="flex justify-center w-full max-w-sm items-center space-x-2 mx-auto">
        <Input
          type="text"
          value={userId}
          onChange={(e) => setUserId(e.target.value)}
          placeholder="Search by user ID"
          className="flex-1"
        />
        <Button onClick={() => fetchPosts(`/?userId=${userId}`)}>Search</Button>
      </div>

      {/* Error dialog */}
      <AlertDialog open={isDialogOpen} onOpenChange={setIsDialogOpen}>
        <AlertDialogContent>
          <AlertDialogHeader>
            <AlertDialogTitle>Error</AlertDialogTitle>
            <AlertDialogDescription>{error || "An unexpected error occurred."}</AlertDialogDescription>
          </AlertDialogHeader>
          <AlertDialogFooter>
            <AlertDialogCancel onClick={() => setIsDialogOpen(false)}>Close</AlertDialogCancel>
          </AlertDialogFooter>
        </AlertDialogContent>
      </AlertDialog>

      {/* Posts list */}
      {loading ? (
        <div className="grid gap-6 p-8 sm:p-20">
          {Array.from({ length: 5 }).map((_, index) => (
            <Skeleton key={index} className="h-6 w-full mb-4" />
          ))}
        </div>
      ) : (
        <main className="grid gap-6 p-8 sm:p-20">
          {posts.map((post) => (
            <Card key={post.id} className="w-full bg-gray-200">
              <CardHeader>
                <CardTitle>{post.title}</CardTitle>
              </CardHeader>
              <CardContent>
                <CardDescription>{post.body}</CardDescription>
              </CardContent>
              <CardFooter>
                <Button
                  onClick={() => openDeleteDialog(post.id)}
                  className="bg-red-500 text-white rounded px-4 py-2"
                >
                  Delete
                </Button>
              </CardFooter>
            </Card>
          ))}
        </main>
      )}

      {/* Confirmation dialog */}
      <AlertDialog open={!!postToDelete} onOpenChange={() => setPostToDelete(null)}>
        <AlertDialogContent>
          <AlertDialogHeader>
            <AlertDialogTitle>Delete Post</AlertDialogTitle>
            <AlertDialogDescription>
              Are you sure you want to delete this post?
            </AlertDialogDescription>
          </AlertDialogHeader>
          <AlertDialogFooter>
            <AlertDialogCancel onClick={() => setPostToDelete(null)}>Cancel</AlertDialogCancel>
            <AlertDialogAction onClick={() => postToDelete && deletePost(postToDelete)}>
              Confirm
            </AlertDialogAction>
          </AlertDialogFooter>
        </AlertDialogContent>
      </AlertDialog>

      <Button
        onClick={() => topFunction()}
        id="myBtn"
        title="Go to top"
        className="fixed bottom-4 right-4 bg-gray-500 text-white rounded-full p-6 shadow-lg text-2xl"
      >
        ↑
      </Button>

      {/* Footer */}
      <footer className="flex justify-center items-center p-4 bg-gray-200 text-black">
        <p>&copy; 2025 Paula Cianelli</p>
      </footer>
    </div>
  );
}
