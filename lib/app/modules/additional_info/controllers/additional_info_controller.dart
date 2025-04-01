import 'package:get/get.dart';

class AdditionalInfoController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  String additionalInfo(String title) {
    switch (title) {
      case 'About Us':
        return '''<div class="justify">

    <p>Welcome to <strong>Job Circular & Result</strong>, your one-stop platform for job circulars, exam schedules, results, and career preparation resources in Bangladesh. We aim to help job seekers stay updated with the latest government and private job opportunities, along with essential study materials to enhance their preparation.</p>

    <h3>What We Offer:</h3>
    <ul>
        <li>Daily job circulars and results from newspapers and official sources</li>
        <li>Exam schedules, results, and notices for government and private job exams</li>
        <li>A dedicated section for important notes on all subjects</li>
        <li>The ability to upload your own notes, download others' notes, and track views on your uploaded notes</li>
        <li>Access to circulars, results, notices, and notes in downloadable PDF format</li>
        <li>Current affairs updates and essential preparation materials for preliminary and written exams</li>
    </ul>

    <p>Our mission is to simplify job hunting and exam preparation by providing an efficient and user-friendly platform.</p>
</div>''';

      case 'Disclaimer':
        return '''<div class="justify">
 <p><strong>Effective Date:</strong> February 25, 2025</p>

    <p>Welcome to <strong>Job Circular & Result</strong>. Before using our website, please read this disclaimer carefully. By accessing our platform, you acknowledge that you have read, understood, and agreed to the terms stated below.</p>

    <h3>1. No Government Affiliation</h3>
    <p><strong>Job Circular & Result</strong> and its developers are not affiliated, associated, authorized, endorsed by, or in any way officially connected with any government agency, organization, or entity.</p>
    <p>We do not represent any government body, and this website should not be considered an official government platform.</p>
    <p>Any logos, trademarks, or names used in reference to government agencies belong to their respective owners and are used for informational purposes only.</p>

    <h3>2. Information Source & Accuracy</h3>
    <p>The job circulars, exam schedules, results, and other career-related information provided on this website are collected from various public sources, including:</p>

    <h4>2.1 Official Government Websites</h4>
    <ul>
        <li>Bangladesh Public Service Commission (BPSC): <a href="https://bpsc.gov.bd">https://bpsc.gov.bd</a></li>
        <li>Ministry of Public Administration (MoPA): <a href="https://mopa.gov.bd">https://mopa.gov.bd</a></li>
        <li>MyJob Portal (Bangladesh National Portal Initiative): <a href="https://smartjob.portal.gov.bd">https://smartjob.portal.gov.bd</a></li>
        <li>Teletalk Government Job Portal: <a href="https://alljobs.teletalk.com.bd/">https://alljobs.teletalk.com.bd</a></li>
    </ul>

    <h4>2.2 Renowned Newspapers & Trusted Media Sources</h4>
    <ul>
        <li>Prothom Alo (Job Section): <a href="https://www.prothomalo.com/chakri/employment">https://www.prothomalo.com/chakri/employment</a></li>
        <li>Bangla Tribune (Job Section): <a href="https://www.banglatribune.com/jobs">https://www.banglatribune.com/jobs</a></li>
        <li>BD Jobs Careers: <a href="https://www.bdjobscareers.com/today-job/">https://www.bdjobscareers.com/today-job/</a></li>
        <li>BD Jobs Times: <a href="https://www.bdjobstimes.com/">https://www.bdjobstimes.com/</a></li>
        <li>BD Career: <a href="https://bdcareer.net/weekly-job-newspaper/">https://bdcareer.net/weekly-job-newspaper/</a></li>
    </ul>

    <p>The information available on this website is purely for informational purposes. While we strive to ensure accuracy, we do not guarantee that the content is always up-to-date, accurate, or complete.</p>
    <p>Users are strongly advised to verify job circulars, results, and exam schedules directly from the official sources or government websites before making any decisions.</p>

    <h3>3. No Legal or Official Authority</h3>
    <p><strong>Job Circular & Result</strong> does not process job applications and does not have control over the recruitment process.</p>
    <p>We do not charge any fees for job information and do not guarantee job placements.</p>
    <p>Any actions taken based on information from this website are solely at the user’s discretion. We are not responsible for any losses, damages, or issues arising from the use of our platform.</p>

    <h3>4. External Links & Third-Party Content</h3>
    <p>Our website may contain links to external websites for additional resources.</p>
    <p>We do not own, control, or take responsibility for the content, accuracy, or privacy policies of these external sites.</p>
    <p>Visiting third-party links is at the user's own risk.</p>

    <h3>5. User-Generated Content</h3>
    <p>Users can upload their own notes and study materials on our platform. We do not take responsibility for the accuracy, authenticity, or legality of the content uploaded by users.</p>
    <p>If you believe any content violates legal rights, please report it, and we will take appropriate action.</p>

    <h3>6. Data Protection & User Rights</h3>
    <p>We respect user privacy and ensure compliance with data protection laws.</p>
    <p>Users can request data deletion via our <a href="https://www.jobcircularlive.com/data-deletion">Data Deletion Request Form</a> if they wish to remove their credentials and associated data from our platform.</p>

    <h3>7. Changes to This Disclaimer</h3>
    <p>We reserve the right to modify this disclaimer at any time.</p>
    <p>Users are encouraged to review this page periodically for any updates.</p>

    <h3>8. Contact Us</h3>
    <p>If you have any concerns or need further clarification, please contact us:</p>
    <ul>
        <li><strong>Email:</strong> <a href="mailto:admin@jobcircularlive.com"> admin@jobcircularlive.com</a></li>
        <li><strong>Address:</strong> <a href="https://www.google.com/maps/place/Jhenaidah/@23.5461243,89.1674499,13z/data=!3m1!4b1!4m6!3m5!1s0x39fee5deccb0ce3f:0xad9518dde3b46e1a!8m2!3d23.5449979!4d89.1726111!16s%2Fg%2F12100_wg?entry=ttu&g_ep=EgoyMDI1MDIyMy4xIKXMDSoJLDEwMjExNDU1SAFQAw%3D%3D"> Khulna, Bangladesh</a></li>
    </ul>

    <p>By using our website, you acknowledge and agree to this disclaimer.</p>

</div>''';

      case 'Privacy Policy':
      default:
        return '''<div class="justify"">
<strong>Effective Date:</strong> February 25, 2025</p>

    <p>At <strong>Job Circular & Result</strong>, we value your privacy and are committed to protecting your personal information. This Privacy Policy explains how we collect, use, and safeguard your data. By using our website, you agree to the terms outlined in this policy.</p>

    <h2>1. Information We Collect</h2>

    <h3>\t1.1 User-Provided Information:</h3>
    <ul>
        <li><strong>Account Information:</strong> Name, email address, and password during registration.</li>
        <li><strong>Profile Information:</strong> Profile image, university/college name, address, and mobile number.</li>
        <li><strong>Uploaded Content:</strong> Notes and other materials you choose to share on our platform.</li>
        <li><strong>Contact Requests:</strong> Information submitted via our contact or data deletion request forms.</li>
    </ul>

    <h3>\t1.2 Automatically Collected Information:</h3>
    <ul>
        <li><strong>Google Analytics:</strong> We use Google Analytics to collect anonymized data about user behavior, such as page views, time spent on our site, and interaction patterns.</li>
        <li><strong>Log Data:</strong> Technical data such as IP address, browser type, operating system, and access times.</li>
        <li><strong>Cookies & Tracking Technologies:</strong> We use cookies to personalize content, remember user preferences, and analyze traffic.</li>
    </ul>

    <h2>2. How We Use Your Information</h2>
    <ul>
        <li>Provide and improve our services, including job circular updates, exam schedules, and study materials.</li>
        <li>Allow users to create, update, and manage their profiles and uploaded notes.</li>
        <li>Process user requests, including data deletion requests.</li>
        <li>Enhance website performance and user experience.</li>
        <li>Comply with legal obligations and protect against fraud or misuse.</li>
    </ul>

    <h2>3. Data Sharing & Third-Party Services</h2>
    <ul>
        <li><strong>No Selling of Data:</strong> We do not sell or share your personal information with third parties for marketing purposes.</li>
        <li><strong>Google Analytics:</strong> We use Google Analytics to track anonymized user interactions.</li>
        <li><strong>Legal Compliance:</strong> If required by law, we may disclose user information to law enforcement or regulatory authorities.</li>
    </ul>

    <h2>4. Data Retention & Deletion Policy</h2>

    <h3>\t4.1 Retention of User Data</h3>
    <ul>
        <li>We retain user account information and uploaded content as long as the account is active.</li>
        <li>If a user is inactive for an extended period, we may remove non-essential data to optimize performance.</li>
    </ul>

    <h3>\t4.2 How Users Can Delete Their Data</h3>
    <ul>
        <li><strong>Manual Deletion:</strong> Users can manually delete their profile details and uploaded notes from their account settings.</li>
        <li><strong>Data Deletion Request:</strong> Users can request the complete removal of their account via our Data Deletion Request Form.</li>
        <li><strong>Processing Time:</strong> We process data deletion requests within 7 business days.</li>
    </ul>

    <h2>5. User Rights & Control</h2>
    <ul>
        <li><strong>Access & Update:</strong> Users can view and edit their personal information via their profile settings.</li>
        <li><strong>Data Portability:</strong> Users can request a copy of their stored data.</li>
        <li><strong>Withdrawal of Consent:</strong> Users can disable cookies and opt out of data tracking via browser settings.</li>
        <li><strong>Account Deletion:</strong> Users can request complete data removal.</li>
    </ul>

    <h2>6. Security Measures</h2>
    <ul>
        <li><strong>Encryption:</strong> User passwords are securely stored using encryption methods.</li>
        <li><strong>Access Controls:</strong> Only authorized personnel can access sensitive data.</li>
        <li><strong>Regular Audits:</strong> We conduct security audits to identify and fix vulnerabilities.</li>
    </ul>

    <h2>7. Changes to This Privacy Policy</h2>
    <p>We may update this policy from time to time. Users will be notified of significant changes via email or website announcements.</p>

    <h2>8. Contact Us</h2>
    <p>For any privacy-related questions or data deletion requests, contact us:</p>
    <ul>
        <li><strong>Email:</strong> <a href="mailto:admin@jobcircularlive.com"> admin@jobcircularlive.com</a></li>
        <li><strong>Data Deletion Form:</strong> <a href="https://www.jobcircularlive.com/data-deletion"> www.jobcircularlive.com/data-deletion</a></li>
    </ul>

    <p>By using our platform, you acknowledge that you have read and agree to this Privacy Policy.</p>

</div>''';
    }
  }
}
