package main

import (
	"diziman/controllers"
	"diziman/database"
	"github.com/gin-contrib/cors"
	"github.com/gin-gonic/gin"
)

func main() {
	r := gin.Default()

	// Configurar CORS
	r.Use(cors.New(cors.Config{
		AllowOrigins:     []string{"http://localhost:4200"},
		AllowMethods:     []string{"GET", "POST", "PUT", "DELETE", "OPTIONS"},
		AllowHeaders:     []string{"Origin", "Content-Type", "Accept"},
		ExposeHeaders:    []string{"Content-Length"},
		AllowCredentials: true,
	}))

	database.ConnectDatabase()

	r.GET("/api/members", controllers.GetAllMembers)
	r.POST("/api/members", controllers.CreateMember)
	r.PUT("/api/members/:id", controllers.UpdateMember)
	r.DELETE("/api/members/:id", controllers.DeleteMember)

	r.Run(":8080")
}
