import { Card, CardContent } from "@/components/ui/card"
import { Badge } from "@/components/ui/badge"
import { Button } from "@/components/ui/button"
import { Calendar, FileText } from "lucide-react"

export function RequestHistory() {
  const historyItems = [
    {
      id: "REQ-098",
      petName: "Charlie",
      breed: "Labrador",
      owner: "John Smith",
      service: "Vaccination",
      completedDate: "January 14, 2024 at 04:30 PM",
      status: "Completed",
      statusColor: "default" as const,
      hasReport: true,
    },
    {
      id: "REQ-097",
      petName: "Whiskers",
      breed: "Siamese",
      owner: "Lisa Wong",
      service: "Health Screening",
      completedDate: "January 13, 2024 at 01:15 PM",
      status: "Completed",
      statusColor: "default" as const,
      hasReport: true,
    },
    {
      id: "REQ-096",
      petName: "Rocky",
      breed: "German Shepherd",
      owner: "David Brown",
      service: "Emergency Treatment",
      completedDate: "January 12, 2024 at 06:45 PM",
      status: "Completed",
      statusColor: "default" as const,
      hasReport: true,
    },
  ]

  return (
    <div className="space-y-4">
      {historyItems.map((item) => (
        <Card key={item.id}>
          <CardContent className="p-6">
            <div className="flex items-center justify-between">
              <div className="flex items-center space-x-4">
                <div className="w-12 h-12 rounded-full bg-muted flex items-center justify-center">
                  <span className="text-foreground font-medium">{item.petName.charAt(0)}</span>
                </div>
                <div>
                  <h3 className="font-semibold text-lg">
                    {item.petName} - {item.breed}
                  </h3>
                  <p className="text-sm text-muted-foreground">
                    Owner: {item.owner} • {item.service}
                  </p>
                  <div className="flex items-center space-x-2 mt-1">
                    <Calendar className="h-4 w-4 text-muted-foreground" />
                    <span className="text-sm text-muted-foreground">Completed {item.completedDate}</span>
                  </div>
                </div>
              </div>
              <div className="flex items-center space-x-3">
                <Badge variant={item.statusColor}>{item.status}</Badge>
                <Badge variant="outline">{item.id}</Badge>
                {item.hasReport && (
                  <Button variant="outline" size="sm">
                    <FileText className="h-4 w-4 mr-2" />
                    Report Submitted
                  </Button>
                )}
              </div>
            </div>
          </CardContent>
        </Card>
      ))}
    </div>
  )
}
