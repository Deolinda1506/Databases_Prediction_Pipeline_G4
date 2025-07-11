from sqlalchemy import Column, Integer, String
from database import Base

class Car(Base):
    __tablename__ = "cars"
    car_id = Column(Integer, primary_key=True, index=True)
    make = Column(String)
    body_style = Column(String)
    drive_wheels = Column(String)
    engine_location = Column(String)
