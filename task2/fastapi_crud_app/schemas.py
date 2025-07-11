from pydantic import BaseModel

class CarBase(BaseModel):
    make: str
    body_style: str
    drive_wheels: str
    engine_location: str

class CarCreate(CarBase):
    pass

class Car(CarBase):
    car_id: int
    class Config:
        orm_mode = True
    
