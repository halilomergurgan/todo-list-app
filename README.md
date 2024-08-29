# Todo List Application

This is a simple Todo List application built with Ruby on Rails. The application allows users to create, edit, delete, and mark tasks as completed. Additionally, users can filter tasks based on their completion status.

## Screenshots

Here are some screenshots of the application:

### Login Page
![Login Page](https://imgur.com/Rg9iaFH)

### Registration Page
![Registration Page](https://imgur.com/ClafRaQ)

### Todo List Page
![Todo List Page](https://imgur.com/xuQEkhG)

### Todo Edit Page
![Todo List Page](https://imgur.com/4OCxbZi)

## Features

- **User Authentication**: Implemented using Devise and Google OAuth for user sign up, login, and authentication.
- **CRUD Operations**: Users can create, read, update, and delete tasks.
- **Task Completion**: Users can mark tasks as completed or revert them to pending.
- **Task Filtering**: Filter tasks based on their completion status (All, Completed, Pending).

## Technologies Used

- **Ruby**: 3.3.4
- **Rails**: 7.2.1
- **Google OAuth**
- **Devise**: For authentication.
- **SQLite3**: As the database for development.
- **AdminLte**: For views and front-end styling.

## Installation

To run this project locally, follow these steps:

1. **Clone the repository:**

   ```bash
   git clone https://github.com/halilomergurgan/todo-list-app.git
   cd todo-list-app
   ```

2. **Install dependencies:**
    ```bash
    bundle install
    ```

3. **Set up Database:**
    ```bash
    rails db:create
    rails db:migrate
    rails db:seed
    ```
4. **Start the server:**
    ```bash
    rails server
    ```
5. **Visit the application:**
    ```bash
    http://localhost:3000
    ```
   
## Usage
* Sign up or log in to create your own Todo list.
* Use the "Add Task" button to add new tasks.
* Use the check and cross icons to mark tasks as completed or revert them to pending.
* Use the pencil icon to edit a task.
* Use the trash icon to delete a task.