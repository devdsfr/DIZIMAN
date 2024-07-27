package services

import (
	"diziman/database"
	"diziman/models"
)

func GetAllMembers() ([]models.Member, error) {
	var members []models.Member
	result := database.DB.Find(&members)
	return members, result.Error
}

func CreateMember(member models.Member) (models.Member, error) {
	result := database.DB.Create(&member)
	return member, result.Error
}

func UpdateMember(id uint, updatedMember models.Member) (models.Member, error) {
	var member models.Member
	if err := database.DB.First(&member, id).Error; err != nil {
		return member, err
	}

	member.Name = updatedMember.Name
	member.Login = updatedMember.Login
	member.Address = updatedMember.Address
	member.BirthDate = updatedMember.BirthDate
	member.City = updatedMember.City
	member.State = updatedMember.State
	member.ZipCode = updatedMember.ZipCode
	member.Gender = updatedMember.Gender
	member.Profile = updatedMember.Profile
	member.RegistrationDate = updatedMember.RegistrationDate

	database.DB.Save(&member)
	return member, nil
}

func DeleteMember(id uint) error {
	var member models.Member
	if err := database.DB.First(&member, id).Error; err != nil {
		return err
	}
	database.DB.Delete(&member)
	return nil
}
