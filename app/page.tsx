import { LoginForm } from "@/components/login-form"

export default function LoginPage() {
  return (
    <div className="min-h-screen bg-background flex items-center justify-center p-4">
      <div className="w-full max-w-md">
        <div className="text-center mb-8">
          <div className="flex items-center justify-center mb-4">
            <div className="w-8 h-8 bg-primary rounded-lg flex items-center justify-center">
              <span className="text-primary-foreground font-bold text-lg">V</span>
            </div>
            <h1 className="text-2xl font-bold text-foreground ml-2">VetCare Pro</h1>
          </div>
          <p className="text-muted-foreground">Professional veterinary management system</p>
        </div>
        <LoginForm />
      </div>
    </div>
  )
}
