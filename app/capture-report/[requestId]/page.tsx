import { DashboardHeader } from "@/components/dashboard-header"
import { CaptureReportForm } from "@/components/capture-report-form"
import { Button } from "@/components/ui/button"
import { ArrowLeft } from "lucide-react"

interface CaptureReportPageProps {
  params: {
    requestId: string
  }
}

export default function CaptureReportPage({ params }: CaptureReportPageProps) {
  return (
    <div className="min-h-screen bg-background">
      <DashboardHeader />
      <main className="container mx-auto px-4 py-6">
        <div className="flex items-center space-x-4 mb-6">
          <Button variant="ghost" size="sm" asChild>
            <a href="/requests">
              <ArrowLeft className="h-4 w-4 mr-2" />
              Back
            </a>
          </Button>
          <div>
            <h1 className="text-3xl font-bold text-foreground">Capture Report</h1>
            <p className="text-muted-foreground">
              Upload images and submit your veterinary report for request {params.requestId}
            </p>
          </div>
        </div>
        <CaptureReportForm requestId={params.requestId} />
      </main>
    </div>
  )
}
