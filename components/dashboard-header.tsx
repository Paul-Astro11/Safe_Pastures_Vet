"use client"

import { Bell } from "lucide-react"
import { Button } from "@/components/ui/button"
import { Badge } from "@/components/ui/badge"
import {
  DropdownMenu,
  DropdownMenuContent,
  DropdownMenuItem,
  DropdownMenuTrigger,
  DropdownMenuSeparator,
} from "@/components/ui/dropdown-menu"

export function DashboardHeader() {
  const unreadNotifications = 3

  return (
    <header className="border-b bg-card">
      <div className="container mx-auto px-4 py-3 flex items-center justify-between">
        <div className="flex items-center space-x-2">
          <div className="w-8 h-8 bg-primary rounded-lg flex items-center justify-center">
            <span className="text-primary-foreground font-bold text-lg">V</span>
          </div>
          <span className="text-xl font-bold text-foreground">VetCare Pro</span>
        </div>

        <div className="flex items-center space-x-4">
          <DropdownMenu>
            <DropdownMenuTrigger asChild>
              <Button variant="ghost" size="sm" className="relative">
                <Bell className="h-5 w-5" />
                {unreadNotifications > 0 && (
                  <Badge className="absolute -top-1 -right-1 h-5 w-5 rounded-full p-0 flex items-center justify-center text-xs">
                    {unreadNotifications}
                  </Badge>
                )}
              </Button>
            </DropdownMenuTrigger>
            <DropdownMenuContent align="end" className="w-80">
              <div className="p-3">
                <div className="flex items-center justify-between mb-3">
                  <h3 className="font-semibold">Notifications</h3>
                  <Button variant="ghost" size="sm" asChild>
                    <a href="/notifications" className="text-xs">
                      Mark all read
                    </a>
                  </Button>
                </div>
                <div className="space-y-3">
                  <div className="p-3 rounded-lg bg-primary/5 border border-primary/20">
                    <div className="flex items-center space-x-2 mb-1">
                      <div className="w-2 h-2 bg-primary rounded-full"></div>
                      <span className="text-sm font-medium">Request Accepted</span>
                    </div>
                    <p className="text-xs text-muted-foreground mb-1">
                      Your request for Max (Golden Retriever) has been accepted by Dr. Smith
                    </p>
                    <span className="text-xs text-muted-foreground">5m ago</span>
                  </div>
                  <div className="p-3 rounded-lg bg-muted">
                    <div className="flex items-center space-x-2 mb-1">
                      <div className="w-2 h-2 bg-accent rounded-full"></div>
                      <span className="text-sm font-medium">Report Submitted</span>
                    </div>
                    <p className="text-xs text-muted-foreground mb-1">
                      Veterinary report for Luna (Persian Cat) has been submitted for approval
                    </p>
                    <span className="text-xs text-muted-foreground">2h ago</span>
                  </div>
                  <div className="p-3 rounded-lg bg-muted">
                    <div className="flex items-center space-x-2 mb-1">
                      <div className="w-2 h-2 bg-green-500 rounded-full"></div>
                      <span className="text-sm font-medium">Approval Complete</span>
                    </div>
                    <p className="text-xs text-muted-foreground mb-1">
                      Final approval completed for Buddy (Border Collie) - Claim approved for $450.00
                    </p>
                    <span className="text-xs text-muted-foreground">4h ago</span>
                  </div>
                </div>
                <DropdownMenuSeparator className="my-2" />
                <Button variant="ghost" size="sm" className="w-full" asChild>
                  <a href="/notifications">View all notifications</a>
                </Button>
              </div>
            </DropdownMenuContent>
          </DropdownMenu>

          <DropdownMenu>
            <DropdownMenuTrigger asChild>
              <Button variant="ghost" size="sm" className="flex items-center space-x-2">
                <div className="w-8 h-8 bg-primary rounded-full flex items-center justify-center">
                  <span className="text-primary-foreground text-sm font-medium">N</span>
                </div>
                <div className="text-left">
                  <div className="text-sm font-medium">ndanji</div>
                  <div className="text-xs text-muted-foreground">ndanji@gmail.com</div>
                </div>
              </Button>
            </DropdownMenuTrigger>
            <DropdownMenuContent align="end">
              <DropdownMenuItem asChild>
                <a href="/profile">Profile Settings</a>
              </DropdownMenuItem>
              <DropdownMenuItem asChild>
                <a href="/profile">Update Details</a>
              </DropdownMenuItem>
              <DropdownMenuItem>Sign Out</DropdownMenuItem>
            </DropdownMenuContent>
          </DropdownMenu>
        </div>
      </div>
    </header>
  )
}
