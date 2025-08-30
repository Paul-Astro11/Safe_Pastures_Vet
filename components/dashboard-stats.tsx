import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card"
import { TrendingUp, Clock, CheckCircle, Users } from "lucide-react"

export function DashboardStats() {
  const stats = [
    {
      title: "Total Requests",
      value: "27",
      change: "+12% from last week",
      icon: TrendingUp,
      positive: true,
    },
    {
      title: "Pending Reviews",
      value: "3",
      change: "-2 from last week",
      icon: Clock,
      positive: false,
    },
    {
      title: "Completed Today",
      value: "8",
      change: "+4 from last week",
      icon: CheckCircle,
      positive: true,
    },
    {
      title: "Active Patients",
      value: "156",
      change: "+8% from last week",
      icon: Users,
      positive: true,
    },
  ]

  return (
    <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4">
      {stats.map((stat) => (
        <Card key={stat.title}>
          <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
            <CardTitle className="text-sm font-medium text-muted-foreground">{stat.title}</CardTitle>
            <stat.icon className="h-4 w-4 text-muted-foreground" />
          </CardHeader>
          <CardContent>
            <div className="text-2xl font-bold">{stat.value}</div>
            <p className={`text-xs ${stat.positive ? "text-primary" : "text-muted-foreground"}`}>{stat.change}</p>
          </CardContent>
        </Card>
      ))}
    </div>
  )
}
