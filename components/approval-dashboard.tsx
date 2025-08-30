"use client"

import { Card, CardContent } from "@/components/ui/card"
import { Badge } from "@/components/ui/badge"
import { Button } from "@/components/ui/button"
import { Clock, FileCheck, CheckCircle, XCircle } from "lucide-react"

export function ApprovalDashboard() {
  const approvalStats = [
    {
      title: "Pending Approval",
      count: 1,
      icon: Clock,
      color: "text-orange-600",
      bgColor: "bg-orange-100",
    },
    {
      title: "Broker Review",
      count: 1,
      icon: FileCheck,
      color: "text-blue-600",
      bgColor: "bg-blue-100",
    },
    {
      title: "Completed",
      count: 1,
      icon: CheckCircle,
      color: "text-green-600",
      bgColor: "bg-green-100",
    },
    {
      title: "Rejected",
      count: 1,
      icon: XCircle,
      color: "text-red-600",
      bgColor: "bg-red-100",
    },
  ]

  const pendingItems = [
    {
      id: "REQ-001",
      petName: "Max",
      service: "Routine Checkup",
      owner: "Sarah Johnson",
      vet: "Dr. Smith",
      submittedDate: "Jan 15, 04:30 PM",
      priority: "low priority",
      status: "Pending Approval",
    },
  ]

  const handleReview = (reportId: string) => {
    // Navigate to review page
    window.location.href = `/review/${reportId}`
  }

  return (
    <div className="space-y-6">
      {/* Stats Grid */}
      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4">
        {approvalStats.map((stat) => (
          <Card key={stat.title}>
            <CardContent className="p-6">
              <div className="flex items-center justify-between">
                <div>
                  <p className="text-sm font-medium text-muted-foreground">{stat.title}</p>
                  <p className="text-3xl font-bold">{stat.count}</p>
                </div>
                <div className={`p-3 rounded-full ${stat.bgColor}`}>
                  <stat.icon className={`h-6 w-6 ${stat.color}`} />
                </div>
              </div>
            </CardContent>
          </Card>
        ))}
      </div>

      {/* Status Tabs */}
      <div className="flex space-x-1 bg-muted p-1 rounded-lg w-fit">
        <Button variant="default" size="sm">
          Pending (1)
        </Button>
        <Button variant="ghost" size="sm">
          Approved (1)
        </Button>
        <Button variant="ghost" size="sm">
          Broker Review (1)
        </Button>
        <Button variant="ghost" size="sm">
          Completed (1)
        </Button>
        <Button variant="ghost" size="sm">
          Rejected (1)
        </Button>
      </div>

      {/* Pending Items */}
      <div className="space-y-4">
        {pendingItems.map((item) => (
          <Card key={item.id}>
            <CardContent className="p-6">
              <div className="flex items-center justify-between">
                <div className="flex items-center space-x-4">
                  <div className="w-12 h-12 rounded-full bg-primary flex items-center justify-center">
                    <span className="text-primary-foreground font-medium">{item.petName.charAt(0)}</span>
                  </div>
                  <div>
                    <h3 className="font-semibold">
                      {item.petName} - {item.service}
                    </h3>
                    <p className="text-sm text-muted-foreground">
                      Owner: {item.owner} • Vet: {item.vet}
                    </p>
                    <div className="flex items-center space-x-2 mt-1">
                      <Clock className="h-4 w-4 text-muted-foreground" />
                      <span className="text-sm text-muted-foreground">Submitted {item.submittedDate}</span>
                      <Badge variant="outline">{item.id}</Badge>
                    </div>
                  </div>
                </div>
                <div className="flex items-center space-x-3">
                  <Badge variant="secondary">{item.priority}</Badge>
                  <Badge variant="destructive">{item.status}</Badge>
                  <Button size="sm" onClick={() => handleReview(item.id)}>
                    Review
                  </Button>
                </div>
              </div>
            </CardContent>
          </Card>
        ))}
      </div>
    </div>
  )
}
