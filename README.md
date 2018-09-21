# save-contents-api

The Save Contents Api is a Ruby on Rails API which store a url send by user and from there, extract contents from tags h(h1, h2, h3...) and links from it. 

* The api uses [jsonapi.org](http://jsonapi.org/) specifications. 
* **The application uses the default port, 3000**
* It was required the use of gem [jsonapi-resources](http://jsonapi-resources.com/v0.9/guide/serializer.html).

## Docker
### Dependencies
  * [Docker](https://docs.docker.com/install/)
  * [Docker Compose](https://docs.docker.com/compose/install/)
  
  The application was dockerized for make it unecessary install everything. For a better interaction, you can check commands in a Makefile section, there you can find commands which handle docker and makes easy and unecessary knows the docker or docker-compose commands.

### Start using Docker

```
make up
make docker-createdb
```


## Makefile

Commands          | Action                                         |
---               | ---                                            |
up                | Make container up.                             |
down              | Stop container.                                |
bash              | Access bash into container                     |
console           | Access console into container                  |
restart-app       | Restart the container                          |
build             | Build container                                |
rebuild           | Rebuild container                              |
docker-createdb   | Create databases into container                |
createdb          | Create database outside container              |
run               | Run application outside container using rails  |

### Start using Makefile

```
make up
make docker-createdb
```


## Rails
  If you prefer run the application without docker, you can run the normal commands of it.

### Start using Rails

```
bundle install
rails db:create
rails db:migrate
rails s
```

## Docs

After application running, you can test application using swagger accessing **/api/v1/docs**

Path                | Action  | Description                       |
---                 | ---     | ---                               |
/api/v1/docs        |  GET    | Swagger docs to test application  |


## Routes

Path                | Action  | Description                       |
---                 | ---     | ---                               |
/api/v1/extractors  |  POST   | Expect a url to extract contents. |
/api/v1/docs        |  GET    | Swagger docs to test application  |

## Json structure

For send a post is necessary follow the specifications in [jsonapi.org](http://jsonapi.org/). Below you can find the example used in tests. 

* PS: Don't forget to put in header **Content-Type: application/vnd.api+json**

```json
{
 "data": {
  "type":"extractors", 
	  "attributes":{
		 "url":"http://assistatecnologia.com.br"
     }
   }
}
```
