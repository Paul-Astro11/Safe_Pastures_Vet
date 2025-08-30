"use client"

import { useState } from "react"
import { Card, CardContent } from "@/components/ui/card"
import { Badge } from "@/components/ui/badge"
import { Button } from "@/components/ui/button"
import { CheckCircle, FileText, Clock, AlertCircle } from "lucide-react"

interface Notification {
  id: string
  type: "request_accepted" | "report_submitted" | "approval_complete" | "new_request"
  title: string
  description: string
  time: string
  isRead: boolean
  priority: "low" | "medium" | "high"
}

export function NotificationsList() {
  const [notifications, setNotifications] = useState<Notification[]>([
    {
      id: "1",
      type: "request_accepted",
      title: "Request Accepted",
      description: "Your request for Max (Golden Retriever) has been accepted by Dr. Smith",
      time: "5m ago",
      isRead: false,
      priority: "medium",
    },
    {
      id: "2",
      type: "report_submitted",
      title: "Report Submitted",
      description: "Veterinary report for Luna (Persian Cat) has been submitted for approval",
      time: "2h ago",
      isRead: false,
      priority: "low",
    },
    {
      id: "3",
      type: "approval_complete",
      title: "Approval Complete",
      description: "Final approval completed for Buddy (Border Collie) - Claim approved for $450.00",
      time: "4h ago",
      isRead: true,
      priority: "high",
    },
    {
      id: "4",
      type: "new_request",
      title: "New Request from Sarah Johnson",
      description: "Golden Retriever - Routine checkup",
      time: "6h ago",
      isRead: true,
      priority: "medium",
    },
    {
      id: "5",
      type: "report_submitted",
      title: "Report approved",
      description: "Max (German Shepherd) - Vaccination",
      time: "1 day ago",
      isRead: true,
      priority: "low",
    },
    {
      id: "6",
      type: "new_request",
      title: "New request from Mike Chen",
      description: "Border Collie - Emergency consultation",
      time: "2 days ago",
      isRead: true,
      priority: "high",
    },
  ])

  const getNotificationIcon = (type: Notification["type"]) => {
    switch (type) {
      case "request_accepted":
        return <CheckCircle className="h-5 w-5 text-green-600" />
      case "report_submitted":
        return <FileText className="h-5 w-5 text-blue-600" />
      case "approval_complete":
        return <CheckCircle className="h-5 w-5 text-green-600" />
      case "new_request":
        return <Clock className="h-5 w-5 text-orange-600" />
      default:
        return <AlertCircle className="h-5 w-5 text-gray-600" />
    }
  }

  const getStatusBadge = (type: Notification["type"]) => {
    switch (type) {
      case "request_accepted":
        return <Badge variant="default">accepted</Badge>
      case "report_submitted":
        return <Badge variant="secondary">submitted</Badge>
      case "approval_complete":
        return <Badge variant="default">approved</Badge>
      case "new_request":
        return <Badge variant="destructive">pending</Badge>
      default:
        return <Badge variant="outline">notification</Badge>
    }
  }

  const markAsRead = (id: string) => {
    setNotifications((prev) =>
      prev.map((notification) => (notification.id === id ? { ...notification, isRead: true } : notification)),
    )
  }

  const markAllAsRead = () => {
    setNotifications((prev) => prev.map((notification) => ({ ...notification, isRead: true })))
  }

  const unreadCount = notifications.filter((n) => !n.isRead).length

  return (
    <div className="space-y-4">
      {/* Summary */}
      <Card>
        <CardContent className="p-4">
          <div className="flex items-center justify-between">
            <div>
              <p className="text-sm text-muted-foreground">
                You have <span className="font-medium text-foreground">{unreadCount}</span> unread notifications
              </p>
            </div>
            {unreadCount > 0 && (
              <Button variant="outline" size="sm" onClick={markAllAsRead}>
                Mark all as read
              </Button>
            )}
          </div>
        </CardContent>
      </Card>

      {/* Notifications List */}
      <div className="space-y-3">
        {notifications.map((notification) => (
          <Card
            key={notification.id}
            className={`transition-all ${!notification.isRead ? "border-primary/50 bg-primary/5" : ""}`}
          >
            <CardContent className="p-4">
              <div className="flex items-start space-x-4">
                <div className="flex-shrink-0 mt-1">{getNotificationIcon(notification.type)}</div>
                <div className="flex-1 min-w-0">
                  <div className="flex items-center justify-between mb-1">
                    <h3
                      className={`text-sm font-medium ${!notification.isRead ? "text-foreground" : "text-muted-foreground"}`}
                    >
                      {notification.title}
                    </h3>
                    <div className="flex items-center space-x-2">
                      {getStatusBadge(notification.type)}
                      {!notification.isRead && <div className="w-2 h-2 bg-primary rounded-full"></div>}
                    </div>
                  </div>
                  <p className="text-sm text-muted-foreground mb-2">{notification.description}</p>
                  <div className="flex items-center justify-between">
                    <span className="text-xs text-muted-foreground">{notification.time}</span>
                    {!notification.isRead && (
                      <Button variant="ghost" size="sm" onClick={() => markAsRead(notification.id)}>
                        Mark as read
                      </Button>
                    )}
                  </div>
                </div>
              </div>
            </CardContent>
          </Card>
        ))}
      </div>
    </div>
  )
}
