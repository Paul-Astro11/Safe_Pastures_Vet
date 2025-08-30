import { DashboardHeader } from "@/components/dashboard-header"
import { ReportReviewForm } from "@/components/report-review-form"
import { Button } from "@/components/ui/button"
import { ArrowLeft } from "lucide-react"

interface ReviewPageProps {
  params: {
    reportId: string
  }
}

export default function ReviewPage({ params }: ReviewPageProps) {
  return (
    <div className="min-h-screen bg-background">
      <DashboardHeader />
      <main className="container mx-auto px-4 py-6">
        <div className="flex items-center space-x-4 mb-6">
          <Button variant="ghost" size="sm" asChild>
            <a href="/approvals">
              <ArrowLeft className="h-4 w-4 mr-2" />
              Back to Approvals
            </a>
          </Button>
          <div>
            <h1 className="text-3xl font-bold text-foreground">Review Report</h1>
            <p className="text-muted-foreground">Review and approve veterinary report {params.reportId}</p>
          </div>
        </div>
        <ReportReviewForm reportId={params.reportId} />
      </main>
    </div>
  )
}
