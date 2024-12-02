+++
title = "Building a Scalable Parking Management System with AWS and ZeroTier"
date = 2024-10-06T00:00:00+02:00
+++

This post is part of my final thesis project for my Dual Bachelor's Degree in Data Science and Telecommunications Engineering at the University Carlos III of Madrid. The project focuses on designing and implementing a scalable distributed parking management system using cloud technologies and IoT devices. The architecture described here is a core component of the overall system design.

![Architecture of the Scalable Parking Management System](architecture.png "Architecture of the Scalable Parking Management System")

The system's deployment comprises two primary components: an AWS cloud infrastructure and a ZeroTier virtual network. The AWS infrastructure ensures high availability, scalability, and connectivity to external systems. At the same time, ZeroTier provides secure communication between different external communities and systems outside AWS.

## Key Components

### AWS Cloud Infrastructure

The AWS infrastructure is based on a Virtual Private Cloud (VPC), which provides an isolated network within a single AWS region. The VPC is divided into:

-   Public Subnet: This subnet hosts resources that require direct internet access, such as the Application Load Balancer (ALB).
-   Private Subnet: This subnet contains the web application, managed by an Auto Scaling group.

### Public Subnet 

The Public Subnet houses an Application Load Balancer (ALB), the entry point for external traffic. It distributes incoming requests to the EC2 instances in the private subnet, ensuring even load distribution and optimal performance.


### Private Subnet 

In the Private Subnet, an Auto Scaling group dynamically adjusts the number of EC2 instances based on application demand. It ensures that the system remains resilient and performs well under fluctuating workloads.

The instances in the Auto Scaling group spread across multiple Availability Zones (AZs) for improved fault tolerance and high availability. If one AZ fails, the application will continue running in other AZs.

EC2 instances backed by Amazon Machine Images (AMIs) host the application. EC2s were chosen over containers due to the need to install the ZeroTier client and cost optimization reasons.

### ZeroTier Integration 

ZeroTier acts as a virtual network overlay, extending the AWS infrastructure to external systems. ZeroTier simplifies network management by eliminating the need for complex VPN setups. It also supports dynamic node addition and removal, making the system highly flexible.

A significant advantage of ZeroTier is its API, which allows for programmatic control and integration with other systems, further streamlining network management.

### Secure External Connections (Communities)

Security is critical in this architecture. Application servers are kept in the private subnet, preventing direct internet access. Traffic from the internet is controlled by the ALB, which acts as a reverse proxy.

ZeroTier's encrypted connections ensure secure communication between AWS instances and external systems (or communities), which makes it ideal for connecting distributed systems without compromising security.

### Use Cases and Benefits

This architecture is well-suited for scenarios where distributed systems across various locations need to communicate securely. Possible use cases include:

-   IoT Networks: Connecting IoT devices from different regions or ecosystems.
-   Hybrid Cloud Systems: Extending AWS infrastructure to on-premises data centers or other cloud environments.
-   Multi-tenant Applications: Allowing different user groups (communities) to interact securely with a central application.

## Conclusion

This AWS cloud deployment combines Auto Scaling, VPC, and ZeroTier to build a scalable, cost-effective, and secure distributed system. By automating core processes, the system requires minimal operational overhead while maintaining high availability and flexibility.

This architecture provides a strong foundation for developing scalable distributed systems. If you have any questions or suggestions for improvement, contact me via LinkedIn.
