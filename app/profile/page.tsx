import { DashboardHeader } from "@/components/dashboard-header"
import { ProfileForm } from "@/components/profile-form"
import { Button } from "@/components/ui/button"
import { ArrowLeft } from "lucide-react"

export default function ProfilePage() {
  return (
    <div className="min-h-screen bg-background">
      <DashboardHeader />
      <main className="container mx-auto px-4 py-6">
        <div className="flex items-center space-x-4 mb-6">
          <Button variant="ghost" size="sm" asChild>
            <a href="/dashboard">
              <ArrowLeft className="h-4 w-4 mr-2" />
              Back
            </a>
          </Button>
          <div>
            <h1 className="text-3xl font-bold text-foreground">Update Your Details</h1>
            <p className="text-muted-foreground">Manage your professional profile and contact information</p>
          </div>
        </div>
        <ProfileForm />
      </main>
    </div>
  )
}
