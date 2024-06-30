# STACK MY MONEY - Expense Tracking Application

_"Your money, your rules"_

## Application overview

**STACK MY MONEY** is a mobile financial management application that enables users to track their spending, manage their budgets and visualize their financial habits. Designed with Flutter for a fluid, responsive user experience, the app aims to simplify the management of personal finances.

## Features

### Authentication

-    **Registration/Login**: Users can register and log in via email address, phone number or social network accounts (Google, Facebook, Apple).

-    **Password reset**: Password can be reset if forgotten.

-    **Security**: Two-factor authentication (2FA) and biometric recognition (fingerprint, facial recognition) for enhanced security.

### Expense tracking

-    **Expense entry**: Users can add expenses manually by entering the amount, category, date and an optional note.

-    **Categorization**: Expenses are classified into categories (food, transport, leisure, etc.) for better organization.

-    **Notifications**: Reminders to enter daily expenses.

### Budget management

-    **Budget creation**: Users can create monthly or weekly budgets for different categories.

-    **Progress tracking**: Real-time visualization of spending against the defined budget.

-    **Alerts**: Notifications when users approach or exceed their budget.

### Dashboard

-    **Overview**: An intuitive dashboard that provides an overview of the user's finances, including current balance, recent expenses and budget statistics.

-    **Graphs and Reports**: Visualization of expenses in the form of graphs (pie charts, bars) and customized reports.

-    **Trends**: Analysis of spending trends over different periods (week, month, year).

### Additional Features

-    **Multi-platform synchronization**: Data is synchronized across all user devices (mobile, tablet).

-    **Data export**: Data can be exported in CSV or PDF formats for external analysis.

-    **Financial Advice**: Personalized articles and tips to help users better manage their finances.

-    **Offline mode**: Access to certain functions even without an Internet connection, with data synchronization when the connection is re-established.

-    **Multi-currency**: Support for multiple currencies for users who travel or live abroad.

## Technical stack

### Frontend

-    **Flutter**: For a smooth, consistent user experience on iOS and Android platforms.

-    **Firebase** Authentication: Manage user authentication.

-    **Hive / SQFlite**: Local databases for offline storage.

### Backend

-    **Firebase Firestore**: For real-time data storage.

-    **Firebase Functions**: For server-side business logic and automation.

-    **Cloud Storage**: For file storage (expense receipts, exports).

### API

-    **Plaid**: For integration with bank accounts and automatic transaction retrieval (optional).

-    **Stripe**: For in-app payments (premium subscriptions, advanced features).

### Security

-    **SSL/TLS**: For secure communications between application and servers.

-    **Encryption**: Encryption of sensitive data at rest and in transit.

## UI Views

### Home screen

The home screen displays a financial summary with an overview of recent expenses, current balance, and active budgets. Users can quickly access other sections via a navigation menu at the bottom.

### Expenses screen

A simple screen where users can add a new expense. It includes fields for amount, category, date, and a note, as well as options for uploading receipts.

### Budget screen

Allows users to create and manage budgets. Users can see how much they have spent in each category and how much they have left against their budget.

### Dashboard

Displays detailed graphs and statistics on spending, spending trends, and financial reports. Users can adjust time periods and filter data by category.

### Profile screen

Allows users to manage their personal information, security settings, and notification preferences. Also includes a section for financial advice and educational resources.

## Conclusion

**STACK MY MONEY** aims to be a complete solution for personal financial management, combining robust functionality, an intuitive user interface, and top-notch security. Whether tracking daily expenses, managing budgets, or analyzing financial trends, STACK MY MONEY is designed to help users take control of their finances and achieve their financial goals.
