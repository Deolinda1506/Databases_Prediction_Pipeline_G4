API Development Using FastAPI  
**Contributor**: David

Objective
This task focused on developing a fully functional backend API for interacting with the structured car dataset using FastAPI and SQLAlchemy. The goal was to:

Create a RESTful API with endpoints for creating, reading, updating, and deleting car records.

Connect to the relational database designed in Task 1.

Use FastAPI for API logic and Pydantic models for request/response validation.

Enable easy access and integration with ML components in Task 3.

Document and test endpoints using Swagger UI.



### Key Endpoints (for `cars` table)
- `POST /cars/`: Create a new car record
- `GET /cars/`: Get all cars
- `GET /cars/{id}`: Get a specific car
- `PUT /cars/{id}`: Update a car
- `DELETE /cars/{id}`: Delete a car

### Files
- `main.py`: FastAPI routes
- `models.py`: SQLAlchemy ORM models
- `schemas.py`: Pydantic data validation
- `database.py`: DB connection setup
