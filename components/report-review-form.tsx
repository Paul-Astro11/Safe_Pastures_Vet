"use client"

import { useState } from "react"
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card"
import { Button } from "@/components/ui/button"
import { Badge } from "@/components/ui/badge"
import { Textarea } from "@/components/ui/textarea"
import { Label } from "@/components/ui/label"
import { CheckCircle, XCircle, FileText, Camera } from "lucide-react"

interface ReportReviewFormProps {
  reportId: string
}

export function ReportReviewForm({ reportId }: ReportReviewFormProps) {
  const [reviewComments, setReviewComments] = useState("")
  const [decision, setDecision] = useState<"approve" | "reject" | null>(null)

  // Mock report data
  const reportData = {
    id: reportId,
    petName: "Max",
    breed: "Golden Retriever",
    owner: "Sarah Johnson",
    service: "Routine Checkup",
    veterinarian: "Dr. Smith",
    submittedDate: "Jan 15, 04:30 PM",
    status: "Pending Review",
    diagnosis:
      "Overall healthy condition. Minor dental tartar buildup noted. Weight within normal range for breed and age.",
    treatment:
      "Administered annual vaccinations (DHPP, Rabies). Performed dental cleaning and scaling. Applied flea and tick prevention treatment.",
    recommendations:
      "Continue current diet and exercise routine. Schedule dental cleaning in 6 months. Monitor for any changes in appetite or behavior.",
    followUp: "6 months for dental check",
    additionalNotes: "Patient was cooperative during examination. Owner educated on dental care importance.",
    images: [
      { name: "dental_examination.jpg", size: "2.3 MB" },
      { name: "vaccination_record.jpg", size: "1.8 MB" },
      { name: "weight_measurement.jpg", size: "1.2 MB" },
    ],
  }

  const handleApprove = () => {
    setDecision("approve")
    // Handle approval logic
    console.log("Report approved", { reportId, comments: reviewComments })
    alert("Report approved successfully!")
  }

  const handleReject = () => {
    setDecision("reject")
    // Handle rejection logic
    console.log("Report rejected", { reportId, comments: reviewComments })
    alert("Report rejected. Veterinarian will be notified.")
  }

  return (
    <div className="max-w-4xl mx-auto space-y-6">
      {/* Report Header */}
      <Card>
        <CardHeader>
          <div className="flex items-center justify-between">
            <div>
              <CardTitle className="text-xl">
                {reportData.petName} ({reportData.breed}) - {reportData.service}
              </CardTitle>
              <p className="text-sm text-muted-foreground">
                Owner: {reportData.owner} • Veterinarian: {reportData.veterinarian}
              </p>
              <p className="text-sm text-muted-foreground">Submitted: {reportData.submittedDate}</p>
            </div>
            <div className="flex items-center space-x-2">
              <Badge variant="secondary">{reportData.status}</Badge>
              <Badge variant="outline">{reportData.id}</Badge>
            </div>
          </div>
        </CardHeader>
      </Card>

      {/* Report Content */}
      <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
        {/* Left Column - Report Details */}
        <div className="space-y-6">
          <Card>
            <CardHeader>
              <div className="flex items-center space-x-2">
                <FileText className="h-5 w-5 text-primary" />
                <CardTitle>Veterinary Report</CardTitle>
              </div>
            </CardHeader>
            <CardContent className="space-y-4">
              <div>
                <Label className="font-semibold">Diagnosis</Label>
                <p className="text-sm text-muted-foreground mt-1">{reportData.diagnosis}</p>
              </div>

              <div>
                <Label className="font-semibold">Treatment Provided</Label>
                <p className="text-sm text-muted-foreground mt-1">{reportData.treatment}</p>
              </div>

              <div>
                <Label className="font-semibold">Recommendations</Label>
                <p className="text-sm text-muted-foreground mt-1">{reportData.recommendations}</p>
              </div>

              <div className="grid grid-cols-2 gap-4">
                <div>
                  <Label className="font-semibold">Follow-up Required</Label>
                  <p className="text-sm text-muted-foreground mt-1">{reportData.followUp}</p>
                </div>
                <div>
                  <Label className="font-semibold">Additional Notes</Label>
                  <p className="text-sm text-muted-foreground mt-1">{reportData.additionalNotes}</p>
                </div>
              </div>
            </CardContent>
          </Card>

          {/* Images */}
          <Card>
            <CardHeader>
              <div className="flex items-center space-x-2">
                <Camera className="h-5 w-5 text-primary" />
                <CardTitle>Attached Images</CardTitle>
              </div>
            </CardHeader>
            <CardContent>
              <div className="space-y-2">
                {reportData.images.map((image, index) => (
                  <div key={index} className="flex items-center justify-between p-2 border rounded-lg">
                    <div className="flex items-center space-x-2">
                      <Camera className="h-4 w-4 text-muted-foreground" />
                      <span className="text-sm font-medium">{image.name}</span>
                    </div>
                    <div className="flex items-center space-x-2">
                      <span className="text-xs text-muted-foreground">{image.size}</span>
                      <Button variant="outline" size="sm">
                        View
                      </Button>
                    </div>
                  </div>
                ))}
              </div>
            </CardContent>
          </Card>
        </div>

        {/* Right Column - Review Actions */}
        <div className="space-y-6">
          <Card>
            <CardHeader>
              <CardTitle>Review Actions</CardTitle>
              <p className="text-sm text-muted-foreground">Approve or reject this veterinary report</p>
            </CardHeader>
            <CardContent className="space-y-4">
              <div>
                <Label htmlFor="reviewComments">Review Comments</Label>
                <Textarea
                  id="reviewComments"
                  placeholder="Add your review comments, feedback, or reasons for approval/rejection..."
                  value={reviewComments}
                  onChange={(e) => setReviewComments(e.target.value)}
                  className="min-h-[120px]"
                />
              </div>

              <div className="flex space-x-2">
                <Button onClick={handleApprove} className="flex-1" disabled={decision === "reject"}>
                  <CheckCircle className="h-4 w-4 mr-2" />
                  Approve Report
                </Button>
                <Button
                  onClick={handleReject}
                  variant="destructive"
                  className="flex-1"
                  disabled={decision === "approve"}
                >
                  <XCircle className="h-4 w-4 mr-2" />
                  Reject Report
                </Button>
              </div>

              {decision && (
                <div className="p-3 rounded-lg bg-muted">
                  <div className="flex items-center space-x-2">
                    {decision === "approve" ? (
                      <CheckCircle className="h-4 w-4 text-green-600" />
                    ) : (
                      <XCircle className="h-4 w-4 text-red-600" />
                    )}
                    <span className="text-sm font-medium">
                      Report {decision === "approve" ? "approved" : "rejected"}
                    </span>
                  </div>
                  <p className="text-xs text-muted-foreground mt-1">
                    The veterinarian will be notified of your decision.
                  </p>
                </div>
              )}
            </CardContent>
          </Card>

          {/* Workflow Status */}
          <Card>
            <CardHeader>
              <CardTitle>Workflow Status</CardTitle>
            </CardHeader>
            <CardContent>
              <div className="space-y-3">
                <div className="flex items-center space-x-3">
                  <div className="w-3 h-3 bg-green-500 rounded-full"></div>
                  <div>
                    <p className="text-sm font-medium">Report Submitted</p>
                    <p className="text-xs text-muted-foreground">Jan 15, 04:30 PM</p>
                  </div>
                </div>
                <div className="flex items-center space-x-3">
                  <div className="w-3 h-3 bg-primary rounded-full"></div>
                  <div>
                    <p className="text-sm font-medium">Under Review</p>
                    <p className="text-xs text-muted-foreground">Current status</p>
                  </div>
                </div>
                <div className="flex items-center space-x-3">
                  <div className="w-3 h-3 bg-muted rounded-full"></div>
                  <div>
                    <p className="text-sm font-medium text-muted-foreground">Pending Approval</p>
                    <p className="text-xs text-muted-foreground">Awaiting decision</p>
                  </div>
                </div>
              </div>
            </CardContent>
          </Card>
        </div>
      </div>
    </div>
  )
}
