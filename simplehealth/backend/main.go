package main

import (
	"simplehealth/controllers"
	"simplehealth/initializers"

	"github.com/gin-gonic/gin"
)

func init() {
	initializers.LoadEnvVariables()
	initializers.ConnectToDB()
	initializers.SyncDatabase()
}

func main() {
	r := gin.Default()
	r.POST("/signup", controllers.Signup)

	r.Run() // listen and serve on 0.0.0.0:8080
}