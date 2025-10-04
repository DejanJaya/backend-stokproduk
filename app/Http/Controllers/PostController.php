<?php

namespace App\Http\Controllers;

use App\Models\Post;
use Illuminate\Http\Request;

class PostController extends Controller
{

    public function index()
    {
        $posts = Post::select(['id', 'title', 'body'])->get();
        return response()->json($posts);
        // return response()->json("oke");
    }


    public function create()
    {
        //
    }


    public function store(Request $request)
    {
        $post = Post::create([
            'title' => $request->title,
            'body' => $request->body
        ]);

        return response()->json([
            'id' => $post->id,
            'title' => $post->title,
            'body' => $post->body,
        ]);
    }


    public function show(string $id)
    {
        $post = Post::find($id);
        return response()->json([
            'id' => $post->id,
            'title' => $post->title,
            'body' => $post->body
        ]);
    }


    public function edit(string $id)
    {
        //
    }


    public function update(Request $request, string $id)
    {
        $post = Post::find($id);
        $post->update([
            'title' => $request->title,
            'body' => $request->body
        ]);

        return response()->json([
            'id' => $post->id,
            'title' => $post->title,
            'body' => $post->body,
        ]);
    }

    public function destroy(string $id)
    {
        Post::destroy($id);
        return response()->json(['Post deleted successfully']);
    }
}
