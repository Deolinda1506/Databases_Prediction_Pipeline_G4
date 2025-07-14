API Development Using FastAPI  
**Contributor**: David

### Objective
- Develop RESTful API endpoints to allow interaction with the SQL database.

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
