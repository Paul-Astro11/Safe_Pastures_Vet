import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card"
import { Button } from "@/components/ui/button"
import { Badge } from "@/components/ui/badge"
import { Clock, FileText, CheckSquare, Settings } from "lucide-react"

export function QuickActions() {
  const actions = [
    {
      title: "Pending Requests",
      description: "Review and manage incoming veterinary service requests",
      icon: Clock,
      badge: "3 New",
      badgeVariant: "destructive" as const,
      href: "/requests",
    },
    {
      title: "History",
      description: "View completed requests and patient records",
      icon: FileText,
      badge: "24 Total",
      badgeVariant: "secondary" as const,
      href: "/history",
    },
    {
      title: "Approval Dashboard",
      description: "Review and approve veterinary reports",
      icon: CheckSquare,
      badge: "2 Pending",
      badgeVariant: "default" as const,
      href: "/approvals",
    },
    {
      title: "Update Your Details",
      description: "Manage your profile and professional information",
      icon: Settings,
      badge: null,
      badgeVariant: "secondary" as const,
      href: "/profile",
    },
  ]

  return (
    <Card>
      <CardHeader>
        <CardTitle>Quick Actions</CardTitle>
        <CardDescription>Access your main veterinary management tools</CardDescription>
      </CardHeader>
      <CardContent className="space-y-4">
        {actions.map((action) => (
          <div
            key={action.title}
            className="flex items-center justify-between p-3 rounded-lg border hover:bg-muted/50 transition-colors"
          >
            <div className="flex items-center space-x-3">
              <div className="p-2 rounded-lg bg-primary/10">
                <action.icon className="h-5 w-5 text-primary" />
              </div>
              <div>
                <h3 className="font-medium">{action.title}</h3>
                <p className="text-sm text-muted-foreground">{action.description}</p>
              </div>
            </div>
            <div className="flex items-center space-x-2">
              {action.badge && (
                <Badge variant={action.badgeVariant} className="text-xs">
                  {action.badge}
                </Badge>
              )}
              <Button variant="ghost" size="sm" asChild>
                <a href={action.href}>→</a>
              </Button>
            </div>
          </div>
        ))}
      </CardContent>
    </Card>
  )
}
