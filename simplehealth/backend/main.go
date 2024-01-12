package main

import (
	"simplehealth/controllers"
	"simplehealth/initializers"
	"simplehealth/middleware"

	"github.com/gin-gonic/gin"
)

func init() {
	initializers.LoadEnvVariables()
	initializers.ConnectToDB()
	initializers.SyncDatabase()
}

func main() {
	r := gin.Default()
	//users
	r.POST("/signup", controllers.Signup)
	r.POST("/login", controllers.Login)
	r.POST("/logout", controllers.Logout)
	r.GET("/users", controllers.GetCurrentUser)
	r.GET("/validate", middleware.RequireAuth, controllers.Validate)

	//diseases
	r.POST("/diseases", middleware.RequireAuth, controllers.AddDisease)
	r.GET("/diseases", middleware.RequireAuth, controllers.GetDiseases)
	r.DELETE("/diseases/:id", middleware.RequireAuth, controllers.DeleteDisease) // Add ":id" as a parameter to delete a certain disease
	r.PUT("/diseases/:id", middleware.RequireAuth, controllers.UpdateDisease) // Add ":id" as a parameter to update a certain disease

	//activities
	r.POST("/activities", middleware.RequireAuth, controllers.AddActivity)
	r.GET("/activities", middleware.RequireAuth, controllers.GetActivities)
	r.DELETE("/activities/:id", middleware.RequireAuth, controllers.DeleteActivity) // Add ":id" as a parameter to delete a certain activity
	r.PUT("/activities/:id", middleware.RequireAuth, controllers.UpdateActivity) // Add ":id" as a parameter to update a certain activity

	//medicines
	r.POST("/medicines", middleware.RequireAuth, controllers.AddMedicine)
	r.GET("/medicines", middleware.RequireAuth, controllers.GetMedicines)
	r.DELETE("/medicines/:id", middleware.RequireAuth, controllers.DeleteMedicine) // Add ":id" as a parameter to delete a certain medicine
	r.PUT("/medicines/:id", middleware.RequireAuth, controllers.UpdateMedicine) // Add ":id" as a parameter to update a certain medicine
	r.GET("/medicines/:id", middleware.RequireAuth, controllers.GetMedicineByUser) // Add ":id" as a parameter to get a certain medicine

	//doctors
	r.POST("/doctors", middleware.RequireAuth, controllers.AddDoctor)
	r.GET("/doctors", middleware.RequireAuth, controllers.GetDoctors)
	r.DELETE("/doctors/:id", middleware.RequireAuth, controllers.DeleteDoctor) // Add ":id" as a parameter to delete a certain doctor
	r.PUT("/doctors/:id", middleware.RequireAuth, controllers.UpdateDoctor) // Add ":id" as a parameter to update a certain doctor
	r.GET("/doctors/:specialization", middleware.RequireAuth, controllers.GetDoctorBySpecialization) // Add ":id" as a parameter to get a certain doctor

	r.Run() // listen and serve on 0.0.0.0:8080 (for windows "localhost:8080")
}