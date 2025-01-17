# Web App with NextJS and TypeScript

This is a web application built with NextJS and TypeScript. The application allows users to list posts from an API and filter the posts by the `userId` of the person who wrote them. It aims to improve the experience of users with unstable internet connections by adding features to handle such conditions.

## Features

- **Posts Listing**: Displays posts from an API in a list of "card" elements.
- **Filtering**: Allows users to filter posts based on `userId`.
- **Post Deletion**: Each post can be deleted with a confirmation modal/dialog.
- **Error Handling**: Displays error messages when the endpoint fails to retrieve or delete posts.

## Setup

1. Clone the repository:

    ```bash
    git clone <repository-url>
    ```

2. Install dependencies:

    ```bash
    cd <project-directory>
    npm install
    ```

3. Set up your `.env` file with the following database connection details:

    ```env
    DATABASE_URL=sqlite:./dev.db
    ```

4. Run the application:

    ```bash
    npm run dev
    ```

## Database

The application uses Prisma ORM with an SQLite database. The following tables are created:

- `users`: Stores information about users.
- `posts`: Stores the posts made by users.

The database is seeded with data from these APIs:

- Users API
- Posts API

## File Structure

- `/app`: Contains the main pages of the app.
- `/prisma`: Contains Prisma schema and migration files.
- `/components`: Contains reusable UI components (e.g., cards, modals).
- `/lib`: Contains utility functions and database logic.

## Running Locally

To run the application locally, follow these steps:

1. Ensure your `.env` file is properly configured with the correct database URL.
2. Run the following command to start the development server:

    ```bash
    npm run dev
    ```

## Technologies Used

- **NextJS**: Framework for building React applications.
- **TypeScript**: Superset of JavaScript for type safety.
- **Prisma ORM**: Database ORM for interacting with SQLite.
- **SQLite**: Lightweight database for storing posts and users.
