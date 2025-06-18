# Shopping Mall Database Management System

## Project Overview

This project is a comprehensive database management system designed for a modern shopping mall. It manages all aspects of mall operations including stores, food courts, customers, employees, suppliers, sales transactions, and feedback systems.

## Team Members

This project was developed by a dedicated team of nine members:

1. **Moe Thiha (Vasudev Adhikari)** - Team Leader
2. **Aye Myat Noe**
3. **Aung Chan Myae**
4. **Nanda Oo**
5. **Yoon Pyae Eain**
6. **Mi Eae Mon Thaw**
7. **Thin Yanant Phyo**
8. **Thiri Nandar Aung**
9. **Htet Htet Yin**

## Tech Stack

- **Database Design**: Relational Database Model
- **Language**: SQL (Structured Query Language)
- **Database Management System**: MySQL
- **Documentation**: PDF Documentation included

## Database Architecture

### Core Tables

#### 1. Supplier Management
- **supplier**: Manages supplier information including contact details and addresses
- **store_supplement**: Tracks product supplies to stores
- **foodcount_supplement**: Tracks food supplies to food courts

#### 2. Product Management
- **Product**: Stores product information with pricing and supplier relationships
- **food**: Manages food court menu items and pricing

#### 3. Store Management
- **owners**: Store owner information and contact details
- **store**: Individual store details with location and category information
- **food_count**: Food court establishment details

#### 4. Human Resources
- **employee**: Employee information including positions, salaries, and workplace assignments

#### 5. Customer Management
- **customer**: Customer profiles with membership system and loyalty points

#### 6. Sales & Transactions
- **sale**: Product sales transactions
- **food_sale**: Food court sales transactions

#### 7. Feedback System
- **product_feedback**: Customer ratings and feedback for products
- **food_feedback**: Customer ratings and feedback for food items

### Key Features

#### 1. Advanced Customer Loyalty System
- **Membership Program**: Automatic membership based on purchase amounts
- **Point System**: Customers earn points based on spending (up to 999 points)
- **Discount System**: Points provide percentage discounts on future purchases
- **Membership Duration**: 3-month membership periods with automatic renewal

#### 2. Comprehensive Sales Analytics
- **Top-performing stores analysis**
- **Best-selling products tracking**
- **Food court performance metrics**
- **Daily sales reporting**
- **Profit analysis with supply cost considerations**

#### 3. Employee Management
- **Position-based salary structure**
- **Store and food court staff management separetely**

#### 4. Feedback and Rating System
- **Product rating system (0-10 scale)**
- **Food rating system (0-10 scale)**
- **Date-tracked feedback for trend analysis**

### Database Constraints and Business Rules

#### 1. Data Integrity
- **Foreign Key Constraints**: Ensure referential integrity across all tables
- **Check Constraints**: Validate age ranges (18-80), point limits (≤999), ratings (0-10)
- **Unique Constraints**: Prevent duplicate phone numbers and emails

#### 2. Business Logic
- **Automatic Point Calculation**: Points awarded based on purchase amounts:
  - 250 points for purchases > 500,000 MMK
  - 500 points for purchases > 1,000,000 MMK
  - 750 points for purchases > 2,000,000 MMK
  - 999 points for purchases > 5,000,000 MMK

- **Membership Management**: Automatic 3-month membership with purchase-based activation
- **Cascade Operations**: Automatic cleanup of related records when parent records are deleted

#### 3. Data Validation
- **Quantity Validation**: Ensures positive quantities for all sales
- **Date Validation**: Membership period validation and expiration handling
- **Contact Information**: Unique phone numbers and email addresses

### Advanced SQL Features Implemented

#### 1. Views for Business Intelligence
- **sale_description**: Comprehensive sales view with pricing, discounts, and final costs
- **food_sale_description**: Food court sales analytics with customer loyalty integration

#### 2. Complex Queries
- **Top Performers Analysis**: Identifying best-selling products and top-revenue stores
- **Profit Analysis**: Revenue vs. supply cost calculations
- **Customer Segmentation**: Membership and loyalty point analysis

#### 3. Data Maintenance
- **Automatic Cleanup**: Expired membership handling
- **Dynamic Updates**: Real-time point calculation and membership status updates

### Business Intelligence Capabilities

#### 1. Sales Performance
- Track top 3 performing stores by revenue
- Identify best-selling products by quantity
- Monitor daily sales patterns
- Analyze food court vs. retail performance

#### 2. Customer Analytics
- Customer loyalty program effectiveness
- Membership conversion rates
- Discount utilization tracking

#### 3. Operational Insights
- Supplier performance evaluation
- Inventory turnover analysis
- Profit margin optimization

#### 4. Feedback Analysis
- Product/Food satisfaction ratings
- Trend analysis over time
- Customer preference insights

### Future Enhancement Possibilities

1. **Digital Integration**: Mobile app connectivity for customer management
2. **Inventory Management**: Real-time stock tracking and automated reordering
3. **Advanced Analytics**: Machine learning for sales prediction and customer behavior
4. **Multi-Mall Support**: Expansion to support multiple mall locations
5. **Online Integration**: E-commerce platform integration with advanced reporting like dashboard and visualization tools

## Project Structure

```
Shopping Mall Database Project/
├── SQL/
│   └── Shopping Mall Database.sql    # Complete database schema and data
├── eBook/
│   └── Shopping Mall Database Documentation.pdf    # Detailed project documentation
└── README.md                        # This file
```

## Installation and Setup

### Prerequisites
- MySQL Server 5.7 or higher
- MySQL Workbench (recommended) or any MySQL client

### Installation Steps

1. **Clone or Download the Project**
   ```bash
   git clone https://github.com/VasudevAdhikari/shopping-mall-database
   cd SQL
   ```

2. **Database Setup**
   ```sql
   -- Connect to MySQL server
   mysql -u username -p

   -- Execute the database script
   source SQL/Shopping\ Mall\ Database.sql
   ```

3. **Verify Installation**
   ```sql
   USE project;
   SHOW TABLES;
   SELECT COUNT(*) FROM customer;
   ```

### Scalability Considerations
- **Normalized Design**: Reduces data redundancy and improves consistency
- **View Optimization**: Pre-computed complex queries for performance

## Documentation

Comprehensive documentation is available in the `eBook` folder:
- **Shopping Mall Database Documentation.pdf**: Detailed technical documentation including ER diagrams, table specifications, and business requirements

## Contact Information

**Project Leader: Moe Thiha (Vasudev Adhikari)**
- **Phone**: +95 9989377380
- **Email**: [artsvasudev@gmail.com](mailto:artsvasudev@gmail.com)
- **Telegram**: @moethihaAdk
- **GitHub**: [github.com/VasudevAdhikari](https://github.com/VasudevAdhikari)

For technical support, project inquiries, or collaboration opportunities, please contact the project leader.

## License

This project is developed for educational purposes as part of Database Systems coursework. All rights reserved by the development team.

## Version History

- **v1.0** (2024): Initial release with complete database schema and sample data
- **Features**: Full shopping mall management system with customer loyalty program
- **Documentation**: Comprehensive PDF documentation and README

---

*This project showcases advanced database design, implementation, and management techniques suitable for modern retail operations. It serves as an excellent example of how relational databases can effectively manage complex business operations in the retail sector.*
