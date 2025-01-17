# Assumptions for Development

The following assumptions were made during the development of this project:

1. **Database Configuration**: The database connection string will be stored in an `.env` file for ease of setup. It is assumed that this will be managed securely in production environments.

2. **Repository Management**: The database is included in the repository for development purposes.

3. **User Listings**: Users are not listed as it was not specified in the requirements.

4. **API Data**: The application is seeded with data from the mock APIs at [JSONPlaceholder](https://jsonplaceholder.typicode.com/). This data is assumed to be representative of the type of content the application will handle, and it is expected that the schema of the data is consistent.

5. **No Authentication**: The project assumes that there is no user authentication involved at this stage. All posts are publicly accessible, and user actions such as post deletion are handled without authentication.
