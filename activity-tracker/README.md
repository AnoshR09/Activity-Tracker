# Activity Tracker Web App

A simple web application for tracking daily activities and career feedback with an intuitive UI.

## Features

- **Activity Management**: Create, view, and delete daily activities with status tracking
- **Career Feedback**: Record and monitor career feedback with priority levels
- **Intuitive UI**: Modern, responsive design with tabbed interface
- **REST API**: Spring Boot backend with H2 in-memory database

## Tech Stack

- **Backend**: Spring Boot 3.2.0, Spring Data JPA, H2 Database
- **Frontend**: HTML5, CSS3, JavaScript (Vanilla)
- **Build**: Maven
- **Container**: Docker

## Quick Start

### Local Development

1. **Run with Maven**:
   ```bash
   mvn spring-boot:run
   ```

2. **Access the application**:
   - Web UI: http://localhost:8080
   - H2 Console: http://localhost:8080/h2-console

### Docker

1. **Build and run**:
   ```bash
   docker build -t activity-tracker .
   docker run -p 8080:8080 activity-tracker
   ```

## API Endpoints

### Activities
- `GET /api/activities` - Get all activities
- `POST /api/activities` - Create new activity
- `PUT /api/activities/{id}` - Update activity
- `DELETE /api/activities/{id}` - Delete activity

### Feedback
- `GET /api/feedback` - Get all feedback
- `POST /api/feedback` - Create new feedback
- `DELETE /api/feedback/{id}` - Delete feedback

## Usage

1. **Activities Tab**: Track daily tasks with status (Pending, In Progress, Completed)
2. **Career Feedback Tab**: Record feedback by category with priority levels
3. **Real-time Updates**: Changes are immediately reflected in the UI

## Database


=======
Uses H2 in-memory database that resets on application restart. For production, configure a persistent database in `application.properties`.


# Terraform 
Infrastructure as Code (IaC) using Terraform to provision AWS resources for deploying the application.

