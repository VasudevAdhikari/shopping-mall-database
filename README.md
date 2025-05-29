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

## Technology Stack

- **Database Management System**: MySQL
- **Language**: SQL (Structured Query Language)
- **Database Design**: Relational Database Model
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

#### 1. Multi-Level Store Structure
The mall supports a three-floor structure:
- **Ground Floor**: Electronics, home décor, sports equipment, health & wellness
- **1st Floor**: Fashion, toys, food & beverage, beauty & personal care
- **2nd Floor**: Entertainment, books & stationery, beauty & personal care

#### 2. Comprehensive Product Categories
- **Apparel and Fashion**: Clothing, accessories, footwear
- **Electronics and Technology**: Smartphones, laptops, audio equipment
- **Home and Décor**: Furniture, home accessories
- **Sports and Outdoor Equipment**: Sports gear, fitness equipment
- **Health and Wellness**: Supplements, fitness accessories
- **Toys and Games**: Children's toys, board games
- **Books and Stationery**: Educational materials, office supplies
- **Beauty and Personal Care**: Cosmetics, skincare, personal hygiene
- **Entertainment**: Movies, video games, music
- **Food and Beverage**: Groceries, beverages

#### 3. Advanced Customer Loyalty System
- **Membership Program**: Automatic membership based on purchase amounts
- **Point System**: Customers earn points based on spending (up to 999 points)
- **Discount System**: Points provide percentage discounts on future purchases
- **Membership Duration**: 3-month membership periods with automatic renewal

#### 4. Comprehensive Sales Analytics
- **Top-performing stores analysis**
- **Best-selling products tracking**
- **Food court performance metrics**
- **Daily sales reporting**
- **Profit analysis with supply cost considerations**

#### 5. Supplier Management
- **Multiple supplier relationships**
- **Supply tracking for both stores and food courts**
- **Cost management and profit calculation**

#### 6. Employee Management
- **Multi-location employee assignments**
- **Position-based salary structure**
- **Store and food court staff management**

#### 7. Feedback and Rating System
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

### Sample Data Insights

#### Store Distribution
- **28 Stores** across three floors
- **20 Food Court Establishments**
- **Multiple Categories**: Fashion (5), Beauty & Personal Care (4), Electronics (2), etc.

#### Product Range
- **40+ Products** from various suppliers
- **50+ Food Items** across different cuisines
- **Price Range**: From 500 MMK (stationery) to 2,345,000 MMK (electronics)

#### Geographic Coverage
- **Primary Location**: Yangon, Myanmar
- **Multiple Townships**: Shwe Pyi Thar, Hledan, Mingalardon, Pazundaung, etc.

### Advanced SQL Features Implemented

#### 1. Views for Business Intelligence
- **sale_description**: Comprehensive sales view with pricing, discounts, and final costs
- **food_sale_description**: Food court sales analytics with customer loyalty integration

#### 2. Complex Queries
- **Top Performers Analysis**: Identifying best-selling products and top-revenue stores
- **Seasonal Analysis**: Monthly and quarterly sales trends
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
- Purchase pattern analysis
- Membership conversion rates
- Discount utilization tracking

#### 3. Operational Insights
- Supplier performance evaluation
- Employee productivity by location
- Inventory turnover analysis
- Profit margin optimization

#### 4. Feedback Analysis
- Product satisfaction ratings
- Food quality assessments
- Trend analysis over time
- Customer preference insights

### Future Enhancement Possibilities

1. **Digital Integration**: Mobile app connectivity for customer management
2. **Inventory Management**: Real-time stock tracking and automated reordering
3. **Advanced Analytics**: Machine learning for sales prediction and customer behavior
4. **Multi-Mall Support**: Expansion to support multiple mall locations
5. **Online Integration**: E-commerce platform integration
6. **Advanced Reporting**: Dashboard and visualization tools

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
   git clone [repository-url]
   cd "Shopping Mall Database Project"
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

### Usage Examples

#### 1. Find Top Performing Stores
```sql
SELECT store_name, SUM(cost) AS total_sales
FROM sale_description
WHERE sale_date BETWEEN '2024-01-01' AND '2024-12-31'
GROUP BY store_name
ORDER BY total_sales DESC
LIMIT 5;
```

#### 2. Customer Loyalty Analysis
```sql
SELECT customer_name, point, mbship_start_date, mbship_end_date
FROM customer
WHERE point > 0
ORDER BY point DESC;
```

#### 3. Product Performance Analysis
```sql
SELECT p.product_name, p.brand, SUM(s.quantity) AS total_sold
FROM product p
JOIN sale s ON p.product_id = s.product_id
GROUP BY p.product_id
ORDER BY total_sold DESC
LIMIT 10;
```

#### 4. Food Court Revenue Analysis
```sql
SELECT foodcount_name, SUM(cost) AS total_revenue
FROM food_sale_description
WHERE sale_date >= '2024-01-01'
GROUP BY foodcount_name
ORDER BY total_revenue DESC;
```

#### 5. Monthly Sales Trends
```sql
SELECT
    MONTH(sale_date) AS month,
    YEAR(sale_date) AS year,
    SUM(cost) AS monthly_revenue
FROM sale_description
GROUP BY YEAR(sale_date), MONTH(sale_date)
ORDER BY year, month;
```

#### 6. Supplier Performance Analysis
```sql
SELECT
    s.supplier_name,
    COUNT(DISTINCT p.product_id) AS products_supplied,
    AVG(pf.rating) AS avg_product_rating
FROM supplier s
JOIN product p ON s.ID = p.supplier_id
LEFT JOIN product_feedback pf ON p.product_id = pf.product_id
GROUP BY s.supplier_name
ORDER BY avg_product_rating DESC;
```

## Database Schema Details

### Table Relationships

#### Primary Relationships
- **supplier** → **product** (One-to-Many)
- **owners** → **store** (One-to-Many)
- **owners** → **food_count** (One-to-Many)
- **store** → **employee** (One-to-Many)
- **food_count** → **employee** (One-to-Many)
- **customer** → **sale** (One-to-Many)
- **customer** → **food_sale** (One-to-Many)
- **product** → **sale** (One-to-Many)
- **food** → **food_sale** (One-to-Many)

#### Business Rules Implementation
- **Cascade Deletes**: Removing a supplier removes all associated products
- **Referential Integrity**: All foreign keys maintain data consistency
- **Check Constraints**: Automatic validation of business rules
- **Unique Constraints**: Prevent duplicate critical information

### Data Types and Constraints

#### Numeric Data
- **BIGINT**: Used for IDs and phone numbers
- **NUMERIC(9,2)**: Precise decimal for prices and monetary values
- **SMALLINT**: Used for ratings, points, and age with appropriate ranges

#### Text Data
- **VARCHAR(60)**: Standard length for names, addresses, and descriptions
- **Consistent Sizing**: Uniform field lengths for similar data types

#### Date Management
- **DATE**: Used for all date fields with proper formatting
- **Default Values**: Automatic date assignment for memberships

### Performance Considerations

#### Indexing Strategy
- **Primary Keys**: Automatic indexing on all primary keys
- **Foreign Keys**: Indexed for optimal join performance
- **Unique Constraints**: Indexed for fast duplicate checking

#### Query Optimization
- **Views**: Pre-computed complex joins for frequent queries
- **Efficient Joins**: Proper foreign key relationships for optimal performance
- **Data Types**: Appropriate sizing to minimize storage overhead

## Business Logic Implementation

### Customer Loyalty Program

#### Point Calculation Logic
```sql
-- Automatic point assignment based on purchase amount
UPDATE customer AS c
INNER JOIN sale AS s USING(customer_id)
LEFT JOIN product AS p USING(product_id)
SET c.point = CASE
    WHEN p.price * s.quantity > 500000 AND c.point<250 THEN 250
    WHEN p.price * s.quantity > 1000000 AND c.point<500 THEN 500
    WHEN p.price * s.quantity > 2000000 AND c.point<750 THEN 750
    WHEN p.price * s.quantity > 5000000 AND c.point<999 THEN 999
    ELSE c.point
END;
```

#### Membership Management
```sql
-- Automatic membership expiration handling
UPDATE customer
SET point=0, mbship_end_date=NULL
WHERE mbship_end_date < CURRENT_DATE;
```

### Sales Analytics Views

#### Comprehensive Sales View
```sql
CREATE VIEW sale_description AS
SELECT s.*, p.price, (s.quantity*p.price) AS total,
       c.point/100 AS discount,
       (s.quantity*p.price-s.quantity*p.price*c.point/10000) AS cost
FROM sale AS s
JOIN product AS p USING(product_id)
JOIN customer AS c USING(customer_id)
ORDER BY cost DESC;
```

#### Food Court Analytics View
```sql
CREATE VIEW food_sale_description AS
SELECT food_sale.*, price, (price*quantity) AS total,
       (point/100) AS discount,
       (price*quantity-price*quantity*point/10000) AS cost
FROM food_sale
JOIN food USING (food_name)
JOIN customer USING(customer_id)
ORDER BY cost;
```

## Key Business Insights

### Store Performance Metrics
- **High-Style Deco**: Leading home décor store on ground floor
- **Eldora's Collections**: Premium fashion retailer on 2nd floor
- **Techeon**: Major electronics retailer with high-value transactions
- **Family Mart**: Popular food & beverage store with consistent sales

### Food Court Success Stories
- **Lai Lai Kitchen**: Traditional cuisine with high customer satisfaction
- **Fresh Orange Chef**: Healthy options with premium pricing
- **T.G.I**: International cuisine with diverse menu offerings
- **Thai Ser**: Authentic Thai cuisine with loyal customer base

### Customer Demographics
- **Geographic Distribution**: Primarily Yangon-based customers
- **Membership Adoption**: Active loyalty program with point-based rewards
- **Purchase Patterns**: Mix of high-value electronics and frequent food court visits
- **Feedback Engagement**: Active customer rating system with 0-10 scale

### Supplier Network
- **13 Active Suppliers** across Myanmar
- **Diverse Product Range**: From stationery to high-end electronics
- **Local Focus**: Primarily Yangon-based suppliers supporting local economy
- **Quality Partnerships**: Long-term relationships with reliable suppliers

## Technical Specifications

### Database Configuration
- **Engine**: InnoDB for ACID compliance and foreign key support
- **Character Set**: UTF-8 for international character support
- **Auto-increment**: Strategic ID assignment for scalability
- **Constraints**: Comprehensive validation rules for data integrity

### Security Features
- **Data Validation**: Input validation through check constraints
- **Referential Integrity**: Foreign key constraints prevent orphaned records
- **Unique Constraints**: Prevent duplicate critical information
- **Cascade Operations**: Controlled data deletion with referential integrity

### Scalability Considerations
- **Efficient Indexing**: Optimized for common query patterns
- **Normalized Design**: Reduces data redundancy and improves consistency
- **View Optimization**: Pre-computed complex queries for performance
- **Modular Structure**: Easy to extend with additional features

## Documentation

Comprehensive documentation is available in the `eBook` folder:
- **Shopping Mall Database Documentation.pdf**: Detailed technical documentation including ER diagrams, table specifications, and business requirements

## Testing and Validation

### Data Integrity Tests
- **Foreign Key Validation**: All relationships properly enforced
- **Check Constraint Testing**: Business rules automatically validated
- **Unique Constraint Verification**: No duplicate critical data
- **Cascade Operation Testing**: Proper cleanup of related records

### Performance Testing
- **Query Optimization**: Complex queries execute efficiently
- **Index Utilization**: Proper indexing for common access patterns
- **View Performance**: Analytics views provide fast business insights
- **Concurrent Access**: Database handles multiple simultaneous operations

### Business Logic Validation
- **Point Calculation**: Loyalty points calculated correctly based on purchase amounts
- **Membership Management**: Automatic membership activation and expiration
- **Discount Application**: Proper discount calculation based on loyalty points
- **Sales Analytics**: Accurate reporting of sales performance and trends

## Maintenance and Support

### Regular Maintenance Tasks
- **Data Backup**: Regular database backups for data protection
- **Performance Monitoring**: Query performance analysis and optimization
- **Index Maintenance**: Regular index optimization for performance
- **Data Cleanup**: Automated cleanup of expired memberships

### Monitoring and Analytics
- **Sales Reporting**: Daily, weekly, and monthly sales analysis
- **Customer Analytics**: Loyalty program effectiveness tracking
- **Inventory Insights**: Product performance and supplier analysis
- **Operational Metrics**: Employee productivity and store performance

## Contact Information

**Project Leader: Moe Thiha (Vasudev Adhikari)**
- **Phone**: +95 9989377380
- **Email**: artsvasudev@gmail.com
- **Telegram**: @moethihaAdk
- **GitHub**: [github.com/VasudevAdhikari](https://github.com/VasudevAdhikari)

For technical support, project inquiries, or collaboration opportunities, please contact the project leader.

## Acknowledgments

Special thanks to all team members for their dedication and collaborative effort in developing this comprehensive shopping mall database management system:

- **Aye Myat Noe**: Database design and customer management system
- **Aung Chan Myae**: Product catalog and inventory management
- **Nanda Oo**: Store management and employee systems
- **Yoon Pyae Eain**: Food court management and menu systems
- **Mi Eae Mon Thaw**: Sales transaction processing and analytics
- **Thin Yanant Phyo**: Supplier management and procurement systems
- **Thiri Nandar Aung**: Customer feedback and rating systems
- **Htet Htet Yin**: Business intelligence and reporting features

This project demonstrates the practical application of database design principles in a real-world retail environment and showcases advanced SQL techniques for business intelligence and analytics.

## License

This project is developed for educational purposes as part of Database Systems coursework. All rights reserved by the development team.

## Version History

- **v1.0** (2024): Initial release with complete database schema and sample data
- **Features**: Full shopping mall management system with customer loyalty program
- **Documentation**: Comprehensive PDF documentation and README

---

*This project showcases advanced database design, implementation, and management techniques suitable for modern retail operations. It serves as an excellent example of how relational databases can effectively manage complex business operations in the retail sector.*
