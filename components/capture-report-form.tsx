"use client"

import type React from "react"

import { useState } from "react"
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card"
import { Button } from "@/components/ui/button"
import { Input } from "@/components/ui/input"
import { Label } from "@/components/ui/label"
import { Textarea } from "@/components/ui/textarea"
import { Badge } from "@/components/ui/badge"
import { Upload, Camera, FileText } from "lucide-react"

interface CaptureReportFormProps {
  requestId: string
}

export function CaptureReportForm({ requestId }: CaptureReportFormProps) {
  const [diagnosis, setDiagnosis] = useState("")
  const [treatment, setTreatment] = useState("")
  const [recommendations, setRecommendations] = useState("")
  const [followUpRequired, setFollowUpRequired] = useState("")
  const [additionalNotes, setAdditionalNotes] = useState("")
  const [uploadedImages, setUploadedImages] = useState<File[]>([])

  const handleImageUpload = (event: React.ChangeEvent<HTMLInputElement>) => {
    const files = event.target.files
    if (files) {
      setUploadedImages((prev) => [...prev, ...Array.from(files)])
    }
  }

  const handleSubmit = (event: React.FormEvent) => {
    event.preventDefault()
    // Handle form submission
    console.log("Report submitted", {
      requestId,
      diagnosis,
      treatment,
      recommendations,
      followUpRequired,
      additionalNotes,
      images: uploadedImages,
    })
    alert("Report submitted successfully!")
  }

  // Mock request data
  const requestData = {
    pet: "Max (Golden Retriever)",
    owner: "Sarah Johnson",
    service: "Routine Checkup",
  }

  return (
    <div className="max-w-4xl mx-auto space-y-6">
      {/* Request Information */}
      <Card>
        <CardHeader>
          <CardTitle>Request Information</CardTitle>
          <p className="text-sm text-muted-foreground">Details of the veterinary service request</p>
        </CardHeader>
        <CardContent>
          <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
            <div>
              <Label className="text-sm font-medium">Pet</Label>
              <p className="text-sm">{requestData.pet}</p>
            </div>
            <div>
              <Label className="text-sm font-medium">Owner</Label>
              <p className="text-sm">{requestData.owner}</p>
            </div>
            <div>
              <Label className="text-sm font-medium">Service</Label>
              <Badge variant="secondary">{requestData.service}</Badge>
            </div>
          </div>
        </CardContent>
      </Card>

      <form onSubmit={handleSubmit} className="space-y-6">
        {/* Image Capture */}
        <Card>
          <CardHeader>
            <div className="flex items-center space-x-2">
              <Camera className="h-5 w-5 text-primary" />
              <CardTitle>Image Capture</CardTitle>
            </div>
            <p className="text-sm text-muted-foreground">
              Upload images related to the examination, treatment, or patient condition
            </p>
          </CardHeader>
          <CardContent>
            <div className="border-2 border-dashed border-muted-foreground/25 rounded-lg p-8 text-center">
              <div className="flex flex-col items-center space-y-4">
                <Upload className="h-12 w-12 text-muted-foreground" />
                <div>
                  <p className="text-sm font-medium">Click to upload images or drag and drop</p>
                  <p className="text-xs text-muted-foreground">PNG, JPG, GIF up to 10MB each</p>
                </div>
                <Input
                  type="file"
                  multiple
                  accept="image/*"
                  onChange={handleImageUpload}
                  className="hidden"
                  id="image-upload"
                />
                <Label htmlFor="image-upload" className="cursor-pointer">
                  <Button type="button" variant="outline">
                    Choose Files
                  </Button>
                </Label>
              </div>
            </div>
            {uploadedImages.length > 0 && (
              <div className="mt-4">
                <p className="text-sm font-medium mb-2">Uploaded Images ({uploadedImages.length})</p>
                <div className="flex flex-wrap gap-2">
                  {uploadedImages.map((file, index) => (
                    <Badge key={index} variant="secondary">
                      {file.name}
                    </Badge>
                  ))}
                </div>
              </div>
            )}
          </CardContent>
        </Card>

        {/* Veterinary Report */}
        <Card>
          <CardHeader>
            <div className="flex items-center space-x-2">
              <FileText className="h-5 w-5 text-primary" />
              <CardTitle>Veterinary Report</CardTitle>
            </div>
            <p className="text-sm text-muted-foreground">Provide detailed findings, diagnosis, and recommendations</p>
          </CardHeader>
          <CardContent className="space-y-4">
            <div>
              <Label htmlFor="diagnosis">Diagnosis</Label>
              <Textarea
                id="diagnosis"
                placeholder="Primary diagnosis and any secondary conditions..."
                value={diagnosis}
                onChange={(e) => setDiagnosis(e.target.value)}
                className="min-h-[100px]"
                required
              />
            </div>

            <div>
              <Label htmlFor="treatment">Treatment Provided</Label>
              <Textarea
                id="treatment"
                placeholder="Describe the treatment, procedures, or medications administered..."
                value={treatment}
                onChange={(e) => setTreatment(e.target.value)}
                className="min-h-[100px]"
                required
              />
            </div>

            <div>
              <Label htmlFor="recommendations">Recommendations</Label>
              <Textarea
                id="recommendations"
                placeholder="Care instructions, follow-up recommendations, or lifestyle changes..."
                value={recommendations}
                onChange={(e) => setRecommendations(e.target.value)}
                className="min-h-[100px]"
                required
              />
            </div>

            <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
              <div>
                <Label htmlFor="followUp">Follow-up Required</Label>
                <Input
                  id="followUp"
                  placeholder="e.g. 2 weeks, 1 month, as needed"
                  value={followUpRequired}
                  onChange={(e) => setFollowUpRequired(e.target.value)}
                />
              </div>
              <div>
                <Label htmlFor="additionalNotes">Additional Notes</Label>
                <Input
                  id="additionalNotes"
                  placeholder="Any additional observations or comments..."
                  value={additionalNotes}
                  onChange={(e) => setAdditionalNotes(e.target.value)}
                />
              </div>
            </div>
          </CardContent>
        </Card>

        {/* Submit Button */}
        <div className="flex justify-end">
          <Button type="submit" size="lg" className="px-8">
            Submit Report
          </Button>
        </div>
        <p className="text-xs text-muted-foreground text-center">Please upload at least one image before submitting</p>
      </form>
    </div>
  )
}
