import { DashboardHeader } from "@/components/dashboard-header"
import { NotificationsList } from "@/components/notifications-list"
import { Button } from "@/components/ui/button"
import { ArrowLeft } from "lucide-react"

export default function NotificationsPage() {
  return (
    <div className="min-h-screen bg-background">
      <DashboardHeader />
      <main className="container mx-auto px-4 py-6">
        <div className="flex items-center justify-between mb-6">
          <div className="flex items-center space-x-4">
            <Button variant="ghost" size="sm" asChild>
              <a href="/dashboard">
                <ArrowLeft className="h-4 w-4 mr-2" />
                Back
              </a>
            </Button>
            <div>
              <h1 className="text-3xl font-bold text-foreground">Notifications</h1>
              <p className="text-muted-foreground">Stay updated with your veterinary practice activities</p>
            </div>
          </div>
          <Button variant="outline" size="sm">
            Mark all read
          </Button>
        </div>
        <NotificationsList />
      </main>
    </div>
  )
}
