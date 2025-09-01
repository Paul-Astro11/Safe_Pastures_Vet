import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../widgets/dashboard_header.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController(text: 'Paul');
  final _emailController = TextEditingController(text: 'kinda@gmail.com');
  final _phoneController = TextEditingController(text: '+260 973 107 473');
  final _licenseController = TextEditingController(text: 'VET-12345');
  final _specializationController = TextEditingController(text: 'Small Animal Medicine');
  final _clinicController = TextEditingController(text: 'City Veterinary Hospital');
  final _bioController = TextEditingController(text: 'Brief description of your experience and expertise...');
  
  bool _isUpdating = false;

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _licenseController.dispose();
    _specializationController.dispose();
    _clinicController.dispose();
    _bioController.dispose();
    super.dispose();
  }

  Future<void> _updateProfile() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isUpdating = true;
      });

      // Simulate API call
      await Future.delayed(const Duration(seconds: 1));

      if (mounted) {
        setState(() {
          _isUpdating = false;
        });
        
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Profile updated successfully!')),
        );
      }
    }
  }

  void _showFeatureComingSoon(String feature) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('$feature feature coming soon')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          const DashboardHeader(),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Back button and header
                  Row(
                    children: [
                      IconButton(
                        onPressed: () => context.go('/dashboard'),
                        icon: const Icon(Icons.arrow_back),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Update Your Details',
                              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Manage your professional profile and contact information',
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Professional Information Card
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 800),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Professional Information',
                              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Keep your profile information up to date for better service coordination',
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                              ),
                            ),
                            const SizedBox(height: 24),

                            Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  // Personal Information Row
                                  LayoutBuilder(
                                    builder: (context, constraints) {
                                      if (constraints.maxWidth > 600) {
                                        return Row(
                                          children: [
                                            Expanded(
                                              child: _buildTextFormField(
                                                'Full Name',
                                                'Enter your full name',
                                                _fullNameController,
                                                Icons.person,
                                                required: true,
                                              ),
                                            ),
                                            const SizedBox(width: 16),
                                            Expanded(
                                              child: _buildTextFormField(
                                                'Email Address',
                                                'Enter your email address',
                                                _emailController,
                                                Icons.email,
                                                keyboardType: TextInputType.emailAddress,
                                                required: true,
                                              ),
                                            ),
                                          ],
                                        );
                                      } else {
                                        return Column(
                                          children: [
                                            _buildTextFormField(
                                              'Full Name',
                                              'Enter your full name',
                                              _fullNameController,
                                              Icons.person,
                                              required: true,
                                            ),
                                            const SizedBox(height: 16),
                                            _buildTextFormField(
                                              'Email Address',
                                              'Enter your email address',
                                              _emailController,
                                              Icons.email,
                                              keyboardType: TextInputType.emailAddress,
                                              required: true,
                                            ),
                                          ],
                                        );
                                      }
                                    },
                                  ),
                                  const SizedBox(height: 16),

                                  // Contact & License Row
                                  LayoutBuilder(
                                    builder: (context, constraints) {
                                      if (constraints.maxWidth > 600) {
                                        return Row(
                                          children: [
                                            Expanded(
                                              child: _buildTextFormField(
                                                'Phone Number',
                                                'Enter your phone number',
                                                _phoneController,
                                                Icons.phone,
                                                keyboardType: TextInputType.phone,
                                                required: true,
                                              ),
                                            ),
                                            const SizedBox(width: 16),
                                            Expanded(
                                              child: _buildTextFormField(
                                                'License Number',
                                                'Enter your license number',
                                                _licenseController,
                                                Icons.badge,
                                                required: true,
                                              ),
                                            ),
                                          ],
                                        );
                                      } else {
                                        return Column(
                                          children: [
                                            _buildTextFormField(
                                              'Phone Number',
                                              'Enter your phone number',
                                              _phoneController,
                                              Icons.phone,
                                              keyboardType: TextInputType.phone,
                                              required: true,
                                            ),
                                            const SizedBox(height: 16),
                                            _buildTextFormField(
                                              'License Number',
                                              'Enter your license number',
                                              _licenseController,
                                              Icons.badge,
                                              required: true,
                                            ),
                                          ],
                                        );
                                      }
                                    },
                                  ),
                                  const SizedBox(height: 16),

                                  // Professional Details Row
                                  LayoutBuilder(
                                    builder: (context, constraints) {
                                      if (constraints.maxWidth > 600) {
                                        return Row(
                                          children: [
                                            Expanded(
                                              child: _buildTextFormField(
                                                'Specialization',
                                                'e.g., Small Animal Medicine',
                                                _specializationController,
                                                Icons.medical_services,
                                                required: true,
                                              ),
                                            ),
                                            const SizedBox(width: 16),
                                            Expanded(
                                              child: _buildTextFormField(
                                                'Clinic/Hospital',
                                                'Enter your clinic or hospital name',
                                                _clinicController,
                                                Icons.business,
                                                required: true,
                                              ),
                                            ),
                                          ],
                                        );
                                      } else {
                                        return Column(
                                          children: [
                                            _buildTextFormField(
                                              'Specialization',
                                              'e.g., Small Animal Medicine',
                                              _specializationController,
                                              Icons.medical_services,
                                              required: true,
                                            ),
                                            const SizedBox(height: 16),
                                            _buildTextFormField(
                                              'Clinic/Hospital',
                                              'Enter your clinic or hospital name',
                                              _clinicController,
                                              Icons.business,
                                              required: true,
                                            ),
                                          ],
                                        );
                                      }
                                    },
                                  ),
                                  const SizedBox(height: 16),

                                  // Professional Bio
                                  _buildTextFormField(
                                    'Professional Bio',
                                    'Brief description of your experience and expertise...',
                                    _bioController,
                                    Icons.description,
                                    maxLines: 4,
                                  ),
                                  const SizedBox(height: 8),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'This information helps colleagues and clients understand your background and specialties.',
                                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                        color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 24),

                                  // Update Button
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: ElevatedButton(
                                      onPressed: _isUpdating ? null : _updateProfile,
                                      style: ElevatedButton.styleFrom(
                                        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                                      ),
                                      child: _isUpdating
                                          ? const SizedBox(
                                              height: 20,
                                              width: 20,
                                              child: CircularProgressIndicator(
                                                strokeWidth: 2,
                                                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                                              ),
                                            )
                                          : const Text('Update Profile'),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Account Settings Card
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 800),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Account Settings',
                              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Manage your account preferences and security settings',
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                              ),
                            ),
                            const SizedBox(height: 16),

                            _buildSettingItem(
                              'Change Password',
                              'Update your account password for security',
                              Icons.lock,
                              () => _showFeatureComingSoon('Change Password'),
                            ),
                            const SizedBox(height: 12),
                            
                            _buildSettingItem(
                              'Notification Preferences',
                              'Manage how you receive notifications',
                              Icons.notifications,
                              () => _showFeatureComingSoon('Notification Preferences'),
                            ),
                            const SizedBox(height: 12),
                            
                            _buildSettingItem(
                              'Two-Factor Authentication',
                              'Add an extra layer of security to your account',
                              Icons.security,
                              () => _showFeatureComingSoon('Two-Factor Authentication'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextFormField(
    String label,
    String hint,
    TextEditingController controller,
    IconData icon, {
    int maxLines = 1,
    bool required = false,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, size: 16),
            const SizedBox(width: 8),
            Text(
              label,
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          maxLines: maxLines,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hint,
          ),
          validator: required
              ? (value) {
                  if (value == null || value.isEmpty) {
                    return 'This field is required';
                  }
                  if (keyboardType == TextInputType.emailAddress && !value.contains('@')) {
                    return 'Please enter a valid email';
                  }
                  return null;
                }
              : null,
        ),
      ],
    );
  }

  Widget _buildSettingItem(String title, String description, IconData icon, VoidCallback onTap) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(icon, color: Theme.of(context).colorScheme.primary),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  description,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: onTap,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              foregroundColor: Theme.of(context).colorScheme.primary,
              side: BorderSide(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            child: Text(title.split(' ')[0]),
          ),
        ],
      ),
    );
  }
}
