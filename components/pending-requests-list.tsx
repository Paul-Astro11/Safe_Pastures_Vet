"use client"

import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card"
import { Button } from "@/components/ui/button"
import { Badge } from "@/components/ui/badge"
import { Phone, Mail, MapPin } from "lucide-react"

export function PendingRequestsList() {
  const requests = [
    {
      id: "REQ-001",
      petName: "Max",
      breed: "Golden Retriever",
      service: "Routine Checkup",
      submittedDate: "Jan 15, 12:30 PM",
      priority: "Low Priority",
      priorityColor: "secondary" as const,
      owner: {
        name: "Sarah Johnson",
        phone: "+1 (555) 123-4567",
        email: "sarah.johnson@email.com",
        location: "Downtown Clinic",
      },
      description:
        "Annual health checkup and vaccination update for Max. He's been healthy but due for his yearly exam.",
      petInfo: {
        type: "Dog",
        breed: "Golden Retriever",
      },
    },
    {
      id: "REQ-002",
      petName: "Luna",
      breed: "Persian",
      service: "Emergency Consultation",
      submittedDate: "Jan 15, 10:15 AM",
      priority: "High Priority",
      priorityColor: "destructive" as const,
      owner: {
        name: "Mike Chen",
        phone: "+1 (555) 987-6543",
        email: "mike.chen@email.com",
        location: "Emergency Center",
      },
      description: "Luna has been vomiting and seems lethargic since yesterday evening. Owner is very concerned.",
      petInfo: {
        type: "Cat",
        breed: "Persian",
      },
    },
    {
      id: "REQ-003",
      petName: "Buddy",
      breed: "Border Collie",
      service: "Behavioral Assessment",
      submittedDate: "Jan 14, 06:45 PM",
      priority: "Medium Priority",
      priorityColor: "default" as const,
      owner: {
        name: "Emily Rodriguez",
        phone: "+1 (555) 456-7890",
        email: "emily.rodriguez@email.com",
        location: "Behavioral Clinic",
      },
      description:
        "Buddy has been showing aggressive behavior towards other dogs during walks. Need professional assessment.",
      petInfo: {
        type: "Dog",
        breed: "Border Collie",
      },
    },
  ]

  const handleAcceptRequest = (requestId: string) => {
    // Redirect to capture report page
    window.location.href = `/capture-report/${requestId}`
  }

  return (
    <div className="space-y-6">
      {requests.map((request) => (
        <Card key={request.id} className="w-full">
          <CardHeader>
            <div className="flex items-center justify-between">
              <div className="flex items-center space-x-4">
                <div className="w-12 h-12 rounded-full bg-primary flex items-center justify-center">
                  <span className="text-primary-foreground font-medium">{request.petName.charAt(0)}</span>
                </div>
                <div>
                  <CardTitle className="text-xl">
                    {request.petName} - {request.breed}
                  </CardTitle>
                  <p className="text-sm text-muted-foreground">
                    {request.service} • Submitted {request.submittedDate}
                  </p>
                </div>
              </div>
              <div className="flex items-center space-x-2">
                <Badge variant={request.priorityColor}>{request.priority}</Badge>
                <Badge variant="outline">{request.id}</Badge>
              </div>
            </div>
          </CardHeader>
          <CardContent>
            <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
              <div>
                <h3 className="font-semibold mb-2">Pet Information</h3>
                <div className="space-y-1 text-sm">
                  <p>
                    <span className="font-medium">Type:</span> {request.petInfo.type}
                  </p>
                  <p>
                    <span className="font-medium">Breed:</span> {request.petInfo.breed}
                  </p>
                </div>

                <h3 className="font-semibold mt-4 mb-2">Description</h3>
                <p className="text-sm text-muted-foreground">{request.description}</p>
              </div>

              <div>
                <h3 className="font-semibold mb-2">Owner Contact</h3>
                <div className="space-y-2">
                  <div className="flex items-center space-x-2 text-sm">
                    <Phone className="h-4 w-4 text-muted-foreground" />
                    <span>{request.owner.phone}</span>
                  </div>
                  <div className="flex items-center space-x-2 text-sm">
                    <Mail className="h-4 w-4 text-muted-foreground" />
                    <span>{request.owner.email}</span>
                  </div>
                  <div className="flex items-center space-x-2 text-sm">
                    <MapPin className="h-4 w-4 text-muted-foreground" />
                    <span>{request.owner.location}</span>
                  </div>
                </div>
              </div>
            </div>

            <div className="flex space-x-2 mt-6">
              <Button className="flex-1" onClick={() => handleAcceptRequest(request.id)}>
                Accept Request
              </Button>
              <Button variant="destructive" className="flex-1">
                Reject Request
              </Button>
            </div>
          </CardContent>
        </Card>
      ))}
    </div>
  )
}
