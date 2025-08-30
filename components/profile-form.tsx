"use client"

import type React from "react"

import { useState } from "react"
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card"
import { Button } from "@/components/ui/button"
import { Input } from "@/components/ui/input"
import { Label } from "@/components/ui/label"
import { Textarea } from "@/components/ui/textarea"
import { User, Phone, Mail, FileText, Building, Award } from "lucide-react"

export function ProfileForm() {
  const [formData, setFormData] = useState({
    fullName: "ndanji",
    emailAddress: "ndanji@gmail.com",
    phoneNumber: "+1 (555) 123-4567",
    licenseNumber: "VET-12345",
    specialization: "Small Animal Medicine",
    clinicHospital: "City Veterinary Hospital",
    professionalBio: "Brief description of your experience and expertise...",
  })

  const handleInputChange = (field: string, value: string) => {
    setFormData((prev) => ({
      ...prev,
      [field]: value,
    }))
  }

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault()
    console.log("Profile updated:", formData)
    alert("Profile updated successfully!")
  }

  return (
    <div className="max-w-2xl mx-auto">
      <Card>
        <CardHeader>
          <CardTitle>Professional Information</CardTitle>
          <CardDescription>Keep your profile information up to date for better service coordination</CardDescription>
        </CardHeader>
        <CardContent>
          <form onSubmit={handleSubmit} className="space-y-6">
            {/* Personal Information */}
            <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
              <div className="space-y-2">
                <Label htmlFor="fullName" className="flex items-center space-x-2">
                  <User className="h-4 w-4" />
                  <span>Full Name</span>
                </Label>
                <Input
                  id="fullName"
                  value={formData.fullName}
                  onChange={(e) => handleInputChange("fullName", e.target.value)}
                  placeholder="Enter your full name"
                  required
                />
              </div>

              <div className="space-y-2">
                <Label htmlFor="emailAddress" className="flex items-center space-x-2">
                  <Mail className="h-4 w-4" />
                  <span>Email Address</span>
                </Label>
                <Input
                  id="emailAddress"
                  type="email"
                  value={formData.emailAddress}
                  onChange={(e) => handleInputChange("emailAddress", e.target.value)}
                  placeholder="Enter your email address"
                  required
                />
              </div>
            </div>

            {/* Contact & License */}
            <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
              <div className="space-y-2">
                <Label htmlFor="phoneNumber" className="flex items-center space-x-2">
                  <Phone className="h-4 w-4" />
                  <span>Phone Number</span>
                </Label>
                <Input
                  id="phoneNumber"
                  value={formData.phoneNumber}
                  onChange={(e) => handleInputChange("phoneNumber", e.target.value)}
                  placeholder="Enter your phone number"
                  required
                />
              </div>

              <div className="space-y-2">
                <Label htmlFor="licenseNumber" className="flex items-center space-x-2">
                  <Award className="h-4 w-4" />
                  <span>License Number</span>
                </Label>
                <Input
                  id="licenseNumber"
                  value={formData.licenseNumber}
                  onChange={(e) => handleInputChange("licenseNumber", e.target.value)}
                  placeholder="Enter your license number"
                  required
                />
              </div>
            </div>

            {/* Professional Details */}
            <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
              <div className="space-y-2">
                <Label htmlFor="specialization" className="flex items-center space-x-2">
                  <FileText className="h-4 w-4" />
                  <span>Specialization</span>
                </Label>
                <Input
                  id="specialization"
                  value={formData.specialization}
                  onChange={(e) => handleInputChange("specialization", e.target.value)}
                  placeholder="e.g., Small Animal Medicine"
                  required
                />
              </div>

              <div className="space-y-2">
                <Label htmlFor="clinicHospital" className="flex items-center space-x-2">
                  <Building className="h-4 w-4" />
                  <span>Clinic/Hospital</span>
                </Label>
                <Input
                  id="clinicHospital"
                  value={formData.clinicHospital}
                  onChange={(e) => handleInputChange("clinicHospital", e.target.value)}
                  placeholder="Enter your clinic or hospital name"
                  required
                />
              </div>
            </div>

            {/* Professional Bio */}
            <div className="space-y-2">
              <Label htmlFor="professionalBio">Professional Bio</Label>
              <Textarea
                id="professionalBio"
                value={formData.professionalBio}
                onChange={(e) => handleInputChange("professionalBio", e.target.value)}
                placeholder="Brief description of your experience and expertise..."
                className="min-h-[100px]"
              />
              <p className="text-xs text-muted-foreground">
                This information helps colleagues and clients understand your background and specialties.
              </p>
            </div>

            {/* Submit Button */}
            <div className="flex justify-end pt-4">
              <Button type="submit" size="lg" className="px-8">
                Update Profile
              </Button>
            </div>
          </form>
        </CardContent>
      </Card>

      {/* Additional Settings */}
      <Card className="mt-6">
        <CardHeader>
          <CardTitle>Account Settings</CardTitle>
          <CardDescription>Manage your account preferences and security settings</CardDescription>
        </CardHeader>
        <CardContent className="space-y-4">
          <div className="flex items-center justify-between p-4 border rounded-lg">
            <div>
              <h3 className="font-medium">Change Password</h3>
              <p className="text-sm text-muted-foreground">Update your account password for security</p>
            </div>
            <Button variant="outline">Change Password</Button>
          </div>

          <div className="flex items-center justify-between p-4 border rounded-lg">
            <div>
              <h3 className="font-medium">Notification Preferences</h3>
              <p className="text-sm text-muted-foreground">Manage how you receive notifications</p>
            </div>
            <Button variant="outline">Manage Notifications</Button>
          </div>

          <div className="flex items-center justify-between p-4 border rounded-lg">
            <div>
              <h3 className="font-medium">Two-Factor Authentication</h3>
              <p className="text-sm text-muted-foreground">Add an extra layer of security to your account</p>
            </div>
            <Button variant="outline">Enable 2FA</Button>
          </div>
        </CardContent>
      </Card>
    </div>
  )
}
