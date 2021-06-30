# Rock/Paper/Scissors Game API with Ruby on Rails

## 1 - Initialization

1 - Clone the project with :
```
$ git clone https://github.com/AdilOmary/rps-game
```
2 - Change directory to `rps-game`:
```
$ cd rps-game
```
3 - Download dependencies:

```
$ bundle install
```

4 - Setup the database:
```
$ rails db:create
$ rails db:migrate
```

5 - Start the server with the following command :
```
$ rails s
```
## 2 - Endpoints (POST/GET)

##### Endpoints available :
- `POST/games`: You can play the game and save it in the Database. You will get a response with the player's move, the bot's move and the result.
- `GET/games`: Retrieve all the past games from the database.


##### To make the POST request, you can use POSTMAN :
 - Download the app on [https://www.postman.com/](https://www.postman.com/)
 - Go to "My workspace" then click "Create a request"
 - Go to the body panel, then "raw" and select "JSON" format
 - Set the URL to `http://localhost:3000/games`

#####First endpoint:

If you want to play the game, you can `POST` the player's `name` and `move` to the API.
- Select `POST` on the dropdown button
- Type the following request :

```json
{
  "name": "Ponky",
  "move": "rock"
}
```
