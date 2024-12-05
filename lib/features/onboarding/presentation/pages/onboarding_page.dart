import 'package:flutter/material.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingStep> _steps = [
    OnboardingStep(
      title: 'Choose Gender',
      builder: (context) => const _GenderSelectionStep(),
    ),
    OnboardingStep(
      title: 'Rate Us',
      builder: (context) => const _RatingStep(),
    ),
    OnboardingStep(
      title: 'Referral Code',
      builder: (context) => const _ReferralStep(),
    ),
    OnboardingStep(
      title: 'Notifications',
      builder: (context) => const _NotificationStep(),
    ),
    OnboardingStep(
      title: 'Create Account',
      builder: (context) => const _AccountCreationStep(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _steps[_currentPage].title,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  Text(
                    '${_currentPage + 1}/${_steps.length}',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
            LinearProgressIndicator(
              value: (_currentPage + 1) / _steps.length,
              backgroundColor: Colors.grey[200],
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.black),
            ),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _steps.length,
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                itemBuilder: (context, index) {
                  return _steps[index].builder(context);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (_currentPage > 0)
                    TextButton(
                      onPressed: () {
                        _pageController.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                      child: const Text('Back'),
                    ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      if (_currentPage < _steps.length - 1) {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                    child: Text(_currentPage < _steps.length - 1 ? 'Next' : 'Get Started'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OnboardingStep {
  final String title;
  final Widget Function(BuildContext) builder;

  OnboardingStep({required this.title, required this.builder});
}

class _GenderSelectionStep extends StatefulWidget {
  const _GenderSelectionStep();

  @override
  _GenderSelectionStepState createState() => _GenderSelectionStepState();
}

class _GenderSelectionStepState extends State<_GenderSelectionStep> {
  String? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () => setState(() => selectedGender = 'male'),
            style: ElevatedButton.styleFrom(
              backgroundColor: selectedGender == 'male' ? Colors.black : Colors.grey[200],
              foregroundColor: selectedGender == 'male' ? Colors.white : Colors.black,
            ),
            child: const Text('Male'),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => setState(() => selectedGender = 'female'),
            style: ElevatedButton.styleFrom(
              backgroundColor: selectedGender == 'female' ? Colors.black : Colors.grey[200],
              foregroundColor: selectedGender == 'female' ? Colors.white : Colors.black,
            ),
            child: const Text('Female'),
          ),
        ],
      ),
    );
  }
}

class _RatingStep extends StatelessWidget {
  const _RatingStep();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.star_border, size: 64),
          const SizedBox(height: 16),
          const Text(
            'Enjoying BodyMax?',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            'Your rating helps us improve!',
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              // TODO: Implement app store rating
            },
            child: const Text('Rate on App Store'),
          ),
        ],
      ),
    );
  }
}

class _ReferralStep extends StatelessWidget {
  const _ReferralStep();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: 'Enter referral code',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // TODO: Implement referral code validation
            },
            child: const Text('Apply Code'),
          ),
        ],
      ),
    );
  }
}

class _NotificationStep extends StatelessWidget {
  const _NotificationStep();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.notifications_outlined, size: 64),
          const SizedBox(height: 16),
          const Text(
            'Stay Updated',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            'Enable notifications to track your progress and get timely updates',
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              // TODO: Implement notifications permission request
            },
            child: const Text('Enable Notifications'),
          ),
        ],
      ),
    );
  }
}

class _AccountCreationStep extends StatelessWidget {
  const _AccountCreationStep();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton.icon(
            onPressed: () {
              // TODO: Implement Google sign in
            },
            icon: const Icon(Icons.g_mobiledata),
            label: const Text('Continue with Google'),
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: () {
              // TODO: Implement Apple sign in
            },
            icon: const Icon(Icons.apple),
            label: const Text('Continue with Apple'),
          ),
        ],
      ),
    );
  }
}