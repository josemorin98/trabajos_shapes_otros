# IoT workflow

#### Installation

```bash
git clone http://disys0.tamps.cinvestav.mx:9090/domizzi/shapefiles_service.git
cd shapefiles_service
docker-compose up -d
```

#### Services

##### List municipalities
http://localhost:5000/municipialities

##### List municipalities
http://localhost:5000/states

##### Get municipality shapes
http://localhost:5000/shape/municipialitie/<id>

##### Get state shapes
http://localhost:5000/polygon/<id>
