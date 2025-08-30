import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card"
import { Badge } from "@/components/ui/badge"

export function RecentActivity() {
  const activities = [
    {
      id: "SJ",
      name: "New request from Sarah Johnson",
      description: "Golden Retriever - Routine checkup",
      time: "2 hours ago",
      status: "pending",
      statusColor: "destructive" as const,
    },
    {
      id: "MK",
      name: "Report approved",
      description: "Max (German Shepherd) - Vaccination",
      time: "4 hours ago",
      status: "approved",
      statusColor: "default" as const,
    },
    {
      id: "AL",
      name: "Report submitted",
      description: "Luna (Persian Cat) - Health screening",
      time: "6 hours ago",
      status: "submitted",
      statusColor: "secondary" as const,
    },
    {
      id: "MC",
      name: "New request from Mike Chen",
      description: "Border Collie - Emergency consultation",
      time: "1 day ago",
      status: "completed",
      statusColor: "default" as const,
    },
  ]

  return (
    <Card>
      <CardHeader>
        <CardTitle>Recent Activity</CardTitle>
        <CardDescription>Latest updates and notifications</CardDescription>
      </CardHeader>
      <CardContent className="space-y-4">
        {activities.map((activity) => (
          <div key={activity.name} className="flex items-start space-x-3">
            <div className="w-8 h-8 rounded-full bg-primary flex items-center justify-center flex-shrink-0">
              <span className="text-xs font-medium text-primary-foreground">{activity.id}</span>
            </div>
            <div className="flex-1 min-w-0">
              <div className="flex items-center justify-between">
                <p className="text-sm font-medium text-foreground">{activity.name}</p>
                <Badge variant={activity.statusColor} className="text-xs">
                  {activity.status}
                </Badge>
              </div>
              <p className="text-sm text-muted-foreground">{activity.description}</p>
              <p className="text-xs text-muted-foreground mt-1">{activity.time}</p>
            </div>
          </div>
        ))}
      </CardContent>
    </Card>
  )
}
